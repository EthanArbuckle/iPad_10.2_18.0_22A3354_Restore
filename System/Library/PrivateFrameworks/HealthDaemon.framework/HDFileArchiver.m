@implementation HDFileArchiver

- (void)dealloc
{
  objc_super v3;

  -[HDFileArchiver _reset]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HDFileArchiver;
  -[HDFileArchiver dealloc](&v3, sel_dealloc);
}

- (uint64_t)_reset
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;

  if (result)
  {
    v1 = (_QWORD *)result;
    v2 = *(void **)(result + 8);
    *(_QWORD *)(result + 8) = 0;

    v3 = (void *)v1[2];
    v1[2] = 0;

    v4 = (void *)v1[3];
    v1[3] = 0;

    if (v1[4])
    {
      archive_read_free();
      v1[4] = 0;
    }
    result = v1[5];
    if (result)
    {
      result = archive_write_free();
      v1[5] = 0;
    }
  }
  return result;
}

- (HDFileArchiver)init
{
  HDFileArchiver *v2;
  char *begin;
  __int128 v5;
  char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDFileArchiver;
  v2 = -[HDFileArchiver init](&v7, sel_init);
  if (v2)
  {
    std::vector<unsigned char>::vector(&v5, 0x10000uLL);
    begin = v2->_nullBuffer.__begin_;
    if (begin)
    {
      v2->_nullBuffer.__end_ = begin;
      operator delete(begin);
      v2->_nullBuffer.__begin_ = 0;
      v2->_nullBuffer.__end_ = 0;
      v2->_nullBuffer.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v2->_nullBuffer.__begin_ = v5;
    v2->_nullBuffer.__end_cap_.__value_ = v6;
  }
  return v2;
}

- (id)_errorFromReaderWithContext:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = archive_errno();
    if ((int)v4 < 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Internal libarchive error %s"), v3, archive_error_string());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s (errno = %d)"), v3, archive_error_string(), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D50];
      v13 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)compressFileAtURL:(id)a3 to:(id)a4 strippingPathPrefix:(id)a5 error:(id *)a6
{
  id v11;
  NSURL **p_prefixURL;
  BOOL v13;
  int next_header2;
  int v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  NSObject *v20;
  size_t v21;
  size_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t i;
  int data_block;
  uint64_t v27;
  BOOL v28;
  char *begin;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v43;
  id v44;
  uint8_t buf[4];
  HDFileArchiver *v46;
  __int16 v47;
  _QWORD v48[4];

  *(_QWORD *)((char *)&v48[2] + 2) = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v11 = a4;
  v43 = a5;
  -[HDFileArchiver _reset]((uint64_t)self);
  objc_storeStrong((id *)&self->_sourceURL, a3);
  p_prefixURL = &self->_prefixURL;
  objc_storeStrong((id *)&self->_prefixURL, a5);
  self->_reader = (archive *)archive_read_disk_new();
  archive_read_disk_set_metadata_filter_callback();
  -[NSURL fileSystemRepresentation](self->_sourceURL, "fileSystemRepresentation");
  if (archive_read_disk_open())
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("Failed to open source: %s"), archive_error_string());
    -[HDFileArchiver _reset]((uint64_t)self);
    v13 = 0;
  }
  else
  {
    self->_writer = (archive *)archive_write_new();
    archive_write_add_filter_gzip();
    archive_write_set_format_pax_restricted();
    objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    archive_write_open_filename();
    while (1)
    {
      archive_entry_new();
      next_header2 = archive_read_next_header2();
      v15 = next_header2;
      if (next_header2)
      {
        if (next_header2 == 1)
        {
          v13 = 1;
          goto LABEL_56;
        }
        _HKInitializeLogging();
        HKLogInfrastructure();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v35 = archive_errno();
          v36 = archive_error_string();
          *(_DWORD *)buf = 138543874;
          v46 = self;
          v47 = 1024;
          LODWORD(v48[0]) = v35;
          WORD2(v48[0]) = 2080;
          *(_QWORD *)((char *)v48 + 6) = v36;
          _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read next file from disk during compression: %d: %s", buf, 0x1Cu);
        }

        if (v15 == -25 || v15 == -30)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("Failed to read next file from disk during compression: %s"), archive_error_string());
          goto LABEL_55;
        }
        if (v15 <= -21)
        {
          _HKInitializeLogging();
          HKLogInfrastructure();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "Skipping bad entry", buf, 2u);
          }

          goto LABEL_47;
        }
      }
      if (*p_prefixURL)
      {
        v18 = (const char *)archive_entry_pathname();
        if (!v18)
          goto LABEL_47;
        v19 = -[NSURL fileSystemRepresentation](*p_prefixURL, "fileSystemRepresentation");
        _HKInitializeLogging();
        HKLogInfrastructure();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v46 = (HDFileArchiver *)v19;
          v47 = 2080;
          v48[0] = v18;
          _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Stripping %s from %s", buf, 0x16u);
        }

        if (v19)
        {
          v21 = strlen(v19);
          if (!strncmp(v18, v19, v21))
          {
            v22 = strlen(v19);
            if (v18[v22] == 47)
              v18 += v22 + 1;
            else
              v18 += v22;
          }
        }
        if (!*v18)
          goto LABEL_47;
        archive_entry_copy_pathname();
      }
      _HKInitializeLogging();
      HKLogInfrastructure();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = archive_entry_pathname();
        *(_DWORD *)buf = 136315138;
        v46 = (HDFileArchiver *)v24;
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "Writing entry %s", buf, 0xCu);
      }

      if ((int)archive_write_header() < -20)
        break;
      if (archive_entry_size() < 1)
        goto LABEL_47;
      for (i = 0; ; i += v32)
      {
        data_block = archive_read_data_block();
        if (data_block)
        {
          if (data_block >= -20)
            goto LABEL_47;
          v37 = CFSTR("Failed to read data block for entry %s: %s");
          goto LABEL_51;
        }
        v27 = -i;
        v28 = i >= 0 || v27 < 1;
        if (!v28)
          break;
LABEL_42:
        v32 = archive_write_data();
        if (v32 < 0)
        {
          v37 = CFSTR("Failed to write data block for entry %s: %s");
LABEL_51:
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v39 = archive_entry_pathname();
          objc_msgSend(v38, "hk_assignError:code:format:", a6, 100, v37, v39, archive_error_string());
          goto LABEL_55;
        }
      }
      while (1)
      {
        begin = self->_nullBuffer.__begin_;
        if (self->_nullBuffer.__end_ - begin >= v27)
          v30 = (char *)v27;
        else
          v30 = (char *)(self->_nullBuffer.__end_ - begin);
        v31 = archive_write_data();
        if (v31 < 0)
        {
          v37 = CFSTR("Failed to write sparse block for entry %s: %s");
          goto LABEL_51;
        }
        if (v31 < (unint64_t)v30)
          break;
        i += v31;
        v28 = v27 <= v31;
        v27 -= v31;
        if (v28)
          goto LABEL_42;
      }
      _HKInitializeLogging();
      HKLogInfrastructure();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = archive_entry_pathname();
        *(_DWORD *)buf = 138543618;
        v46 = self;
        v47 = 2080;
        v48[0] = v34;
        _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Truncated write for %s; file may have grown while being archived.",
          buf,
          0x16u);
      }

LABEL_47:
      archive_entry_free();
    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = archive_entry_pathname();
    objc_msgSend(v40, "hk_assignError:code:format:", a6, 100, CFSTR("Failed to write entry header for %s: %s"), v41, archive_error_string());
LABEL_55:
    v13 = 0;
LABEL_56:
    archive_entry_free();
    -[HDFileArchiver _reset]((uint64_t)self);
  }

  return v13;
}

- (BOOL)decompressArchiveAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  int next_header;
  NSURL *destinationDirectoryURL;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  BOOL v21;
  id v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  -[HDFileArchiver _reset]((uint64_t)self);
  objc_storeStrong((id *)&self->_destinationDirectoryURL, a4);
  self->_reader = (archive *)archive_read_new();
  archive_read_support_filter_all();
  archive_read_support_format_all();
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "fileSystemRepresentation");
  if (archive_read_open_filename())
  {
    -[HDFileArchiver _errorFromReaderWithContext:]((uint64_t)self, CFSTR("Failed to open source during decompression"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    -[HDFileArchiver _reset]((uint64_t)self);
    v21 = 0;
    goto LABEL_29;
  }
  self->_writer = (archive *)archive_write_disk_new();
  archive_write_disk_set_options();
  while (1)
  {
    next_header = archive_read_next_header();
    if (next_header != -10)
      break;
    v20 = 2;
LABEL_17:
    if (v20 == 1)
    {
      v21 = 0;
      goto LABEL_28;
    }
  }
  if (!next_header)
  {
    destinationDirectoryURL = self->_destinationDirectoryURL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByAppendingPathComponent:](destinationDirectoryURL, "URLByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    objc_msgSend(v17, "fileSystemRepresentation");
    archive_entry_copy_pathname();
    if (archive_read_extract2())
    {
      -[HDFileArchiver _errorFromReaderWithContext:]((uint64_t)self, CFSTR("Failed to extract next entry in archive"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v18);
        else
          _HKLogDroppedError();
      }

      v20 = 1;
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_17;
  }
  if (next_header == 1)
  {
    v21 = 1;
  }
  else
  {
    -[HDFileArchiver _errorFromReaderWithContext:]((uint64_t)self, CFSTR("Failed to read next header entry in archive"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v22);
      else
        _HKLogDroppedError();
    }

    v21 = 0;
  }
LABEL_28:
  -[HDFileArchiver _reset]((uint64_t)self);
LABEL_29:

  return v21;
}

- (void).cxx_destruct
{
  char *begin;

  begin = self->_nullBuffer.__begin_;
  if (begin)
  {
    self->_nullBuffer.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_destinationDirectoryURL, 0);
  objc_storeStrong((id *)&self->_prefixURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end

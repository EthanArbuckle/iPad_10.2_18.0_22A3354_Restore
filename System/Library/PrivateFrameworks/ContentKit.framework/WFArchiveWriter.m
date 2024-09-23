@implementation WFArchiveWriter

- (WFArchiveWriter)initWithDestinationURL:(id)a3 format:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  WFArchiveWriter *v11;
  id v12;
  int v13;
  int v14;
  id v15;
  int v16;
  id v17;
  int v18;
  WFArchiveWriter *v19;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLibArchive.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFArchiveWriter;
  v11 = -[WFArchiveWriter init](&v22, sel_init);
  if (!v11)
    goto LABEL_23;
  v11->_archive = (archive *)archive_write_new();
  v12 = v10;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("gz")) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", CFSTR("tar.gz")))
  {
    v13 = archive_write_set_compression_gzip();
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("xz")) & 1) != 0
         || objc_msgSend(v12, "isEqualToString:", CFSTR("tar.xz")))
  {
    v13 = archive_write_set_compression_xz();
  }
  else
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("tar.bz2")) & 1) == 0)
    {

      goto LABEL_15;
    }
    v13 = archive_write_set_compression_bzip2();
  }
  v14 = v13;

  if (v14)
  {

    goto LABEL_21;
  }
LABEL_15:
  v15 = v12;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("tar")) & 1) == 0
    && (objc_msgSend(v15, "isEqualToString:", CFSTR("tar.gz")) & 1) == 0
    && (objc_msgSend(v15, "isEqualToString:", CFSTR("tar.bz2")) & 1) == 0
    && (objc_msgSend(v15, "isEqualToString:", CFSTR("tar.xz")) & 1) == 0
    && (objc_msgSend(v15, "isEqualToString:", CFSTR("zip")) & 1) == 0
    && (objc_msgSend(v15, "isEqualToString:", CFSTR("cpio")) & 1) == 0)
  {
    objc_msgSend(v15, "isEqualToString:", CFSTR("iso"));
  }

  v16 = archive_write_set_format();
  if (!v16)
  {
    objc_msgSend(v9, "path");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "fileSystemRepresentation");
    v18 = archive_write_open_filename();

    if (!v18)
    {
      v19 = v11;
      goto LABEL_24;
    }
  }
LABEL_21:
  if (!a5)
  {
LABEL_23:
    v19 = 0;
    goto LABEL_24;
  }
  WFLastArchiveError();
  v19 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v19;
}

- (BOOL)writeArchiveEntry:(id)a3 error:(id *)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "entry");
  archive_write_header();
  objc_msgSend(v5, "dataProvider");
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    getWFLibArchiveLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      WFPathFromArchiveEntry();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315394;
      v20 = "-[WFArchiveWriter writeArchiveEntry:error:]";
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_DEFAULT, "%s Writing archive entry for %@", (uint8_t *)&v19, 0x16u);

    }
    v6[2](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = archive_entry_size();
      v11 = v10;
      if (v10 >= 0x4000)
        v12 = 0x4000;
      else
        v12 = v10;
      v13 = malloc_type_malloc(v12, 0x8477470uLL);
      objc_msgSend(v9, "open");
      v14 = 0;
      while (v14 < v11)
      {
        v15 = objc_msgSend(v9, "read:maxLength:", v13, v12);
        if (v15 < 1)
          break;
        v14 += v15;
        if (archive_write_data() == -1)
        {
          if (a4)
          {
            WFLastArchiveError();
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          free(v13);
          goto LABEL_20;
        }
      }
      free(v13);
      objc_msgSend(v9, "streamError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(v9, "close");
        v16 = 1;
        goto LABEL_21;
      }
      if (a4)
      {
        objc_msgSend(v9, "streamError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "close");
    }
LABEL_20:
    v16 = 0;
LABEL_21:

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)finishWithError:(id *)a3
{
  int v4;
  int v5;

  v4 = archive_write_close();
  v5 = v4;
  if (a3 && v4)
  {
    WFLastArchiveError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 == 0;
}

- (void)dealloc
{
  objc_super v3;

  archive_write_finish();
  v3.receiver = self;
  v3.super_class = (Class)WFArchiveWriter;
  -[WFArchiveWriter dealloc](&v3, sel_dealloc);
}

- (archive)archive
{
  return self->_archive;
}

@end

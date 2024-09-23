@implementation MFFileArchiveDirectory

+ (id)archiveDirectory
{
  return objc_alloc_init(MFFileArchiveDirectory);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Class:%@\nURL:%@\nEntries[%@]"), objc_opt_class(), self->_url, self->_entries);
}

- (id)archiveEntries
{
  return (id)-[NSMutableDictionary allValues](self->_entries, "allValues");
}

+ (_NSRange)rangeOfCentralDirectoryInData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v3 = a3;
  if (objc_msgSend(v3, "length")
    && (v4 = objc_retainAutorelease(v3),
        (v5 = memmem((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), &centralDirectorySignatureString, 4uLL)) != 0))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    v9 = (unint64_t)v5 - v7 + 22;
    if (v9 <= v8)
      v10 = (uint64_t)v5 - v7;
    else
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9 <= v8)
      v11 = 22;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v12 = v10;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)inputWithURL:(id)a3
{
  id v5;
  NSURL *url;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  id v12;

  v5 = a3;
  objc_storeStrong((id *)&self->_url, a3);
  url = self->_url;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", url, 3, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v12;
  if (v9)
    objc_storeStrong((id *)&self->_error, v8);
  v10 = -[MFFileArchiveDirectory inputWithData:](self, "inputWithData:", v7);

  return v10;
}

- (BOOL)inputWithData:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CentralDirectory *v9;
  CentralDirectory *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *entries;
  NSMutableDictionary *scrubbedEntries;

  v5 = a3;
  objc_storeStrong((id *)&self->_contents, a3);
  v6 = +[MFFileArchiveDirectory _rangeOfCentralDirectory:](MFFileArchiveDirectory, "_rangeOfCentralDirectory:", objc_msgSend(v5, "length"));
  objc_msgSend(v5, "subdataWithRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[MFFileArchiveDirectory _centralDirectory:](MFFileArchiveDirectory, "_centralDirectory:", v8);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v5, "subdataWithRange:", v9->var6, v9->var5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFFileArchiveDirectory _entriesFromCentralDictionary:inData:archiveData:](MFFileArchiveDirectory, "_entriesFromCentralDictionary:inData:archiveData:", v10, v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSMutableDictionary *)objc_msgSend(v12, "mutableCopy");
    entries = self->_entries;
    self->_entries = v13;

    scrubbedEntries = self->_scrubbedEntries;
    self->_scrubbedEntries = 0;

  }
  return v10 != 0;
}

+ (id)_entriesFromCentralDictionary:(CentralDirectory *)a3 inData:(id)a4 archiveData:(id)a5
{
  id v8;
  void *v9;
  int var3;
  uint64_t v11;
  void *v12;
  uint64_t var5;
  void *v14;
  unsigned __int16 *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v20;

  v20 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3->var3);
  var3 = a3->var3;
  if (a3->var3)
  {
    v11 = 0;
    v12 = 0;
    var5 = a3->var5;
    do
    {
      objc_msgSend(v20, "subdataWithRange:", v11, var5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (unsigned __int16 *)objc_msgSend(a1, "_centralHeader:", v14);
      if (!v15)
        break;
      +[MFFileArchiveEntry archiveEntryWithCentralHeader:archiveData:](MFFileArchiveEntry, "archiveEntryWithCentralHeader:archiveData:", v15, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v16, v17);

      v18 = v15[14] + (unint64_t)v15[15] + v15[16] + 46;
      v11 += v18;
      var5 -= v18;

      v12 = v14;
      --var3;
    }
    while (var3);

  }
  return v9;
}

- (id)mainEntry
{
  MFFileArchiveEntry **p_mainEntry;
  MFFileArchiveEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  p_mainEntry = &self->_mainEntry;
  v4 = self->_mainEntry;
  -[MFFileArchiveEntry allValues](*(p_mainEntry - 2), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    if (objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v6, "count") == 1)
      {
        objc_msgSend(v6, "firstObject");
        v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }
      -[MFFileArchiveDirectory _scrubContentDirectory](self, "_scrubContentDirectory");
      -[NSMutableDictionary allValues](self->_scrubbedEntries, "allValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v4)
        goto LABEL_8;
      if (objc_msgSend(v7, "count") == 1)
      {
        objc_msgSend(v8, "firstObject");
        v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
        if (v4)
          goto LABEL_8;
      }
      -[NSURL path](self->_url, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        -[NSURL path](self->_url, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "pathExtension");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = objc_msgSend(v15, "isEqualToString:", CFSTR("zip"));

        if ((_DWORD)v13)
        {
          objc_msgSend(v14, "stringByDeletingPathExtension");
          v16 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v16;
        }
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __35__MFFileArchiveDirectory_mainEntry__block_invoke;
        v35[3] = &unk_1E4E8C210;
        v17 = v14;
        v36 = v17;
        v18 = objc_msgSend(v8, "indexOfObjectPassingTest:", v35);
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {

        }
        else
        {
          objc_msgSend(v8, "objectAtIndex:", v18);
          v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();

          if (v4)
            goto LABEL_8;
        }
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = v8;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v20)
      {
        v29 = v8;
        v30 = v6;
        v21 = 0;
        v22 = 0;
        v23 = *(_QWORD *)v32;
        v24 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          v25 = 0;
          v26 = v21 + v20;
          do
          {
            if (*(_QWORD *)v32 != v23)
              objc_enumerationMutation(v19);
            v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v25);
            if (v22 < objc_msgSend(v27, "uncompressedSize", v29, v30, (_QWORD)v31))
            {
              v22 = objc_msgSend(v27, "uncompressedSize");
              v24 = v21 + v25;
            }
            ++v25;
          }
          while (v20 != v25);
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          v21 = v26;
        }
        while (v20);

        v8 = v29;
        v6 = v30;
        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v19, "objectAtIndex:", v24);
          v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
          if (v4)
            goto LABEL_8;
        }
      }
      else
      {

      }
      v28 = objc_msgSend(v19, "indexOfObjectPassingTest:", &__block_literal_global_32);
      if (v28 == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend(v19, "objectAtIndex:", v28),
            (v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v19, "firstObject", v28);
        v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
      }
LABEL_8:
      objc_storeStrong((id *)p_mainEntry, v4);

      goto LABEL_9;
    }
    v4 = 0;
  }
LABEL_9:

  return v4;
}

uint64_t __35__MFFileArchiveDirectory_mainEntry__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "fileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if ((_DWORD)v10)
      *a4 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __35__MFFileArchiveDirectory_mainEntry__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL8 v9;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "characterAtIndex:", 0);

    v9 = v8 != 46;
    if (v8 != 46)
    {
      v9 = 1;
      *a4 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setMainEntry:(id)a3
{
  objc_storeStrong((id *)&self->_mainEntry, a3);
}

- (void)_scrubContentDirectory
{
  NSMutableDictionary *v3;
  NSMutableDictionary *scrubbedEntries;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSMutableDictionary *v15;
  MFFileArchiveDirectory *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_scrubbedEntries)
  {
    v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_entries, "count"));
    scrubbedEntries = self->_scrubbedEntries;
    self->_scrubbedEntries = v3;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = self;
    -[NSMutableDictionary allValues](self->_entries, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v6)
      goto LABEL_16;
    v7 = *(_QWORD *)v18;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "fileName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length") && objc_msgSend(v9, "uncompressedSize"))
        {
          objc_msgSend(v9, "fileName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "fileName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "characterAtIndex:", objc_msgSend(v12, "length") - 1) == 47)
          {

          }
          else
          {
            objc_msgSend(v9, "path");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("__MACOSX/"));

            if ((v14 & 1) != 0)
              continue;
            v15 = v16->_scrubbedEntries;
            objc_msgSend(v9, "path");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v9, v10);
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v6)
      {
LABEL_16:

        return;
      }
    }
  }
}

- (id)scrubbedArchiveEntries
{
  NSMutableDictionary *scrubbedEntries;

  scrubbedEntries = self->_scrubbedEntries;
  if (!scrubbedEntries)
  {
    -[MFFileArchiveDirectory _scrubContentDirectory](self, "_scrubContentDirectory");
    scrubbedEntries = self->_scrubbedEntries;
  }
  return (id)-[NSMutableDictionary allValues](scrubbedEntries, "allValues");
}

+ (CentralHeader)_centralHeader:(id)a3
{
  id v3;
  CentralHeader *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x36)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = (CentralHeader *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
  if (*(_DWORD *)v4->var0 != 33639248)
  {
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, "#Attachments Failed to validate archive central header", v7, 2u);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

+ (CentralDirectory)_centralDirectory:(id)a3
{
  id v3;
  CentralDirectory *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x16)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = (CentralDirectory *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
  if (*(_DWORD *)v4->var0 != 101010256)
  {
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, "#Attachments Failed to validate archive central directory", v7, 2u);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

+ (_NSRange)_rangeOfCentralDirectory:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = a3 - 22;
  v4 = 22;
  result.length = v4;
  result.location = v3;
  return result;
}

+ (BOOL)_hasZipSignature:(id)a3
{
  id v3;
  id v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    v5 = memmem((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), &localHeaderSignatureString, 4uLL) != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)setArchiveEntry:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *entries;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    entries = self->_entries;
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](entries, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "merge:", v5);
    }
    else
    {
      v9 = self->_entries;
      if (!v9)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11 = self->_entries;
        self->_entries = v10;

        v9 = self->_entries;
      }
      objc_msgSend(v5, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v5, v12);

    }
  }

  return v5 != 0;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSData)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_mainEntry, 0);
  objc_storeStrong((id *)&self->_scrubbedEntries, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end

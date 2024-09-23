@implementation NMSFTP

- (NMSFTP)initWithSession:(id)a3
{
  id v4;
  NMSFTP *v5;
  NMSFTP *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMSFTP;
  v5 = -[NMSFTP init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NMSFTP setSession:](v5, "setSession:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw(CFSTR("You have to provide a valid NMSSHSession!"));
  }

  return v6;
}

- (BOOL)connect
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;

  -[NMSFTP session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  libssh2_session_set_blocking(objc_msgSend(v3, "rawSession"), 1);

  -[NMSFTP session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSFTP setSftpSession:](self, "setSftpSession:", libssh2_sftp_init(objc_msgSend(v4, "rawSession")));

  if (-[NMSFTP sftpSession](self, "sftpSession"))
  {
    -[NMSFTP setConnected:](self, "setConnected:", 1);
    return -[NMSFTP isConnected](self, "isConnected");
  }
  else
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to init SFTP session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logError:", v7);

    return 0;
  }
}

- (void)disconnect
{
  libssh2_sftp_shutdown((uint64_t *)-[NMSFTP sftpSession](self, "sftpSession"));
  -[NMSFTP setConnected:](self, "setConnected:", 0);
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  _LIBSSH2_SFTP *v8;
  id v9;
  const void *v10;
  id v11;
  const char *v12;
  id v13;
  const void *v14;
  id v15;
  const char *v16;
  unsigned int v17;

  v6 = a4;
  v7 = a3;
  v8 = -[NMSFTP sftpSession](self, "sftpSession");
  v9 = objc_retainAutorelease(v7);
  v10 = (const void *)objc_msgSend(v9, "UTF8String");
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  LODWORD(v11) = strlen(v12);
  v13 = objc_retainAutorelease(v6);
  v14 = (const void *)objc_msgSend(v13, "UTF8String");
  v15 = objc_retainAutorelease(v13);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");

  v17 = strlen(v16);
  return libssh2_sftp_rename_ex((uint64_t)v8, v10, v11, v14, v17, 7u) == 0;
}

- (_LIBSSH2_SFTP_HANDLE)openDirectoryAtPath:(id)a3
{
  id v4;
  _LIBSSH2_SFTP *v5;
  id v6;
  const void *v7;
  id v8;
  unsigned int v9;
  _LIBSSH2_SFTP_HANDLE *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = -[NMSFTP sftpSession](self, "sftpSession");
  v6 = objc_retainAutorelease(v4);
  v7 = (const void *)objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = strlen((const char *)objc_msgSend(v8, "UTF8String"));
  v10 = (_LIBSSH2_SFTP_HANDLE *)libssh2_sftp_open_ex(v5, v7, v9, 0, 0, 1);
  if (!v10)
  {
    -[NMSFTP session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = objc_msgSend(v12, "code");
    objc_msgSend(v12, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Could not open directory at path %@ (Error %li: %@)"), v8, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logError:", v17);

    if (objc_msgSend(v12, "code") == -31)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SFTP error %lu"), libssh2_sftp_last_error((uint64_t)-[NMSFTP sftpSession](self, "sftpSession")));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logError:", v19);

    }
  }

  return v10;
}

- (BOOL)directoryExistsAtPath:(id)a3
{
  _LIBSSH2_SFTP_HANDLE *v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;

  v3 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", a3, 1, 0);
  if (v3)
  {
    v4 = (uint64_t)v3;
    v10 = 0;
    v9 = 0u;
    memset(v8, 0, sizeof(v8));
    v5 = libssh2_sftp_fstat_ex(v3, (uint64_t *)v8, 0);
    libssh2_sftp_close_handle(v4);
    if (v5)
      v6 = 0;
    else
      v6 = (v9 & 0xF000) == 0x4000;
    LOBYTE(v3) = v6;
  }
  return (char)v3;
}

- (BOOL)createDirectoryAtPath:(id)a3
{
  id v4;
  _LIBSSH2_SFTP *v5;
  id v6;
  const void *v7;
  id v8;
  const char *v9;
  unsigned int v10;

  v4 = a3;
  v5 = -[NMSFTP sftpSession](self, "sftpSession");
  v6 = objc_retainAutorelease(v4);
  v7 = (const void *)objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = strlen(v9);
  return libssh2_sftp_mkdir_ex((uint64_t)v5, v7, v10, 493) == 0;
}

- (BOOL)removeDirectoryAtPath:(id)a3
{
  id v4;
  _LIBSSH2_SFTP *v5;
  id v6;
  const void *v7;
  id v8;
  const char *v9;
  unsigned int v10;

  v4 = a3;
  v5 = -[NMSFTP sftpSession](self, "sftpSession");
  v6 = objc_retainAutorelease(v4);
  v7 = (const void *)objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = strlen(v9);
  return libssh2_sftp_rmdir_ex((uint64_t)v5, v7, v10) == 0;
}

- (id)contentsOfDirectoryAtPath:(id)a3
{
  id v4;
  _LIBSSH2_SFTP_HANDLE *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  NMSFTPFile *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v16[3];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[512];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NMSFTP openDirectoryAtPath:](self, "openDirectoryAtPath:", v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      v7 = libssh2_sftp_readdir_ex((uint64_t)v5, v22, 0x200uLL, 0, 0, (uint64_t)&v18);
      if (v7 < 1)
        break;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v22, v7, 4);
      if ((objc_msgSend(&unk_24F93C618, "containsObject:", v8) & 1) == 0)
      {
        if ((v20 & 0xF000) == 0x4000)
        {
          objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
          v9 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v9;
        }
        v10 = -[NMSFTPFile initWithFilename:]([NMSFTPFile alloc], "initWithFilename:", v8);
        v16[0] = v18;
        v16[1] = v19;
        v16[2] = v20;
        v17 = v21;
        -[NMSFTPFile populateValuesFromSFTPAttributes:](v10, "populateValuesFromSFTPAttributes:", v16);
        objc_msgSend(v6, "addObject:", v10);

      }
    }
    if (v7 < 0)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to read directory"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logError:", v12);

    }
    if ((libssh2_sftp_close_handle((uint64_t)v5) & 0x80000000) != 0)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to close directory"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logError:", v14);

    }
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_49134);
    v5 = (_LIBSSH2_SFTP_HANDLE *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)infoForFileAtPath:(id)a3
{
  id v4;
  _LIBSSH2_SFTP_HANDLE *v5;
  NMSFTPFile *v6;
  int v7;
  NMSFTPFile *v8;
  void *v9;
  _OWORD v11[3];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v4 = a3;
  v5 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", v4, 1, 0);
  v6 = (NMSFTPFile *)v5;
  if (v5)
  {
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    v7 = libssh2_sftp_fstat_ex(v5, (uint64_t *)&v13, 0);
    libssh2_sftp_close_handle((uint64_t)v6);
    if (v7 < 0)
    {
      v6 = 0;
    }
    else
    {
      v8 = [NMSFTPFile alloc];
      objc_msgSend(v4, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NMSFTPFile initWithFilename:](v8, "initWithFilename:", v9);

      v11[0] = v13;
      v11[1] = v14;
      v11[2] = v15;
      v12 = v16;
      -[NMSFTPFile populateValuesFromSFTPAttributes:](v6, "populateValuesFromSFTPAttributes:", v11);
    }
  }

  return v6;
}

- (_LIBSSH2_SFTP_HANDLE)openFileAtPath:(id)a3 flags:(unint64_t)a4 mode:(int64_t)a5
{
  unsigned int v6;
  id v8;
  _LIBSSH2_SFTP *v9;
  id v10;
  const void *v11;
  id v12;
  unsigned int v13;
  _LIBSSH2_SFTP_HANDLE *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  v8 = a3;
  v9 = -[NMSFTP sftpSession](self, "sftpSession");
  v10 = objc_retainAutorelease(v8);
  v11 = (const void *)objc_msgSend(v10, "UTF8String");
  v12 = objc_retainAutorelease(v10);
  v13 = strlen((const char *)objc_msgSend(v12, "UTF8String"));
  v14 = (_LIBSSH2_SFTP_HANDLE *)libssh2_sftp_open_ex(v9, v11, v13, v6, a5, 0);
  if (!v14)
  {
    -[NMSFTP session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = objc_msgSend(v16, "code");
    objc_msgSend(v16, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Could not open file at path %@ (Error %li: %@)"), v12, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logError:", v21);

    if (objc_msgSend(v16, "code") == -31)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SFTP error %lu"), libssh2_sftp_last_error((uint64_t)-[NMSFTP sftpSession](self, "sftpSession")));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logError:", v23);

    }
  }

  return v14;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  _LIBSSH2_SFTP_HANDLE *v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;

  v3 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", a3, 1, 0);
  if (v3)
  {
    v4 = (uint64_t)v3;
    v10 = 0;
    v9 = 0u;
    memset(v8, 0, sizeof(v8));
    v5 = libssh2_sftp_fstat_ex(v3, (uint64_t *)v8, 0);
    libssh2_sftp_close_handle(v4);
    if (v5)
      v6 = 1;
    else
      v6 = (v9 & 0xF000) == 0x4000;
    LOBYTE(v3) = !v6;
  }
  return (char)v3;
}

- (BOOL)createSymbolicLinkAtPath:(id)a3 withDestinationPath:(id)a4
{
  id v6;
  id v7;
  _LIBSSH2_SFTP *v8;
  id v9;
  const void *v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  unsigned int v17;

  v6 = a4;
  v7 = a3;
  v8 = -[NMSFTP sftpSession](self, "sftpSession");
  v9 = objc_retainAutorelease(v6);
  v10 = (const void *)objc_msgSend(v9, "UTF8String");
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  LODWORD(v11) = strlen(v12);
  v13 = objc_retainAutorelease(v7);
  v14 = (void *)objc_msgSend(v13, "UTF8String");
  v15 = objc_retainAutorelease(v13);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");

  v17 = strlen(v16);
  return libssh2_sftp_symlink_ex((uint64_t)v8, v10, v11, v14, v17, 0) == 0;
}

- (BOOL)removeFileAtPath:(id)a3
{
  id v4;
  _LIBSSH2_SFTP *v5;
  id v6;
  const void *v7;
  id v8;
  const char *v9;
  unsigned int v10;

  v4 = a3;
  v5 = -[NMSFTP sftpSession](self, "sftpSession");
  v6 = objc_retainAutorelease(v4);
  v7 = (const void *)objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = strlen(v9);
  return libssh2_sftp_unlink_ex((uint64_t)v5, v7, v10) == 0;
}

- (id)contentsAtPath:(id)a3
{
  return -[NMSFTP contentsAtPath:progress:](self, "contentsAtPath:progress:", a3, 0);
}

- (id)contentsAtPath:(id)a3 progress:(id)a4
{
  id v6;
  uint64_t (**v7)(id, _QWORD, uint64_t);
  _LIBSSH2_SFTP_HANDLE *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v18[16384];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (uint64_t (**)(id, _QWORD, uint64_t))a4;
  v8 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", v6, 1, 0);
  if (v8)
  {
    -[NMSFTP infoForFileAtPath:](self, "infoForFileAtPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v11 = 0;
      while (1)
      {
        v12 = libssh2_sftp_read((uint64_t)v8, v18, 0x4000uLL);
        if (v12 < 1)
          break;
        objc_msgSend(v10, "appendBytes:length:", v18, v12);
        v11 += v12;
        if (v7)
        {
          objc_msgSend(v9, "fileSize");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v7[2](v7, v11, objc_msgSend(v13, "integerValue"));

          if ((v14 & 1) == 0)
          {
            libssh2_sftp_close_handle((uint64_t)v8);
            goto LABEL_10;
          }
        }
      }
      libssh2_sftp_close_handle((uint64_t)v8);
      if ((v12 & 0x8000000000000000) == 0)
      {
        v8 = (_LIBSSH2_SFTP_HANDLE *)objc_msgSend(v10, "copy");
        goto LABEL_11;
      }
LABEL_10:
      v8 = 0;
LABEL_11:

    }
    else
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contentsAtPath:progress: failed to get file attributes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logWarn:", v16);

      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)writeContents:(id)a3 toFileAtPath:(id)a4
{
  return -[NMSFTP writeContents:toFileAtPath:progress:](self, "writeContents:toFileAtPath:progress:", a3, a4, 0);
}

- (BOOL)writeContents:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;

  v8 = (void *)MEMORY[0x24BDBCE90];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "inputStreamWithData:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NMSFTP writeStream:toFileAtPath:progress:](self, "writeStream:toFileAtPath:progress:", v11, v10, v9);

  return (char)self;
}

- (BOOL)writeFileAtPath:(id)a3 toFileAtPath:(id)a4
{
  return -[NMSFTP writeFileAtPath:toFileAtPath:progress:](self, "writeFileAtPath:toFileAtPath:progress:", a3, a4, 0);
}

- (BOOL)writeFileAtPath:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;

  v8 = (void *)MEMORY[0x24BDBCE90];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "inputStreamWithFileAtPath:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NMSFTP writeStream:toFileAtPath:progress:](self, "writeStream:toFileAtPath:progress:", v11, v10, v9);

  return (char)self;
}

- (BOOL)writeStream:(id)a3 toFileAtPath:(id)a4
{
  return -[NMSFTP writeStream:toFileAtPath:progress:](self, "writeStream:toFileAtPath:progress:", a3, a4, 0);
}

- (BOOL)writeStream:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LIBSSH2_SFTP_HANDLE *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "streamStatus"))
    objc_msgSend(v8, "open");
  if ((objc_msgSend(v8, "hasBytesAvailable") & 1) == 0)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No bytes available in the stream"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logWarn:", v15);

LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v11 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", v9, 26, 420);
  if (!v11)
  {
    objc_msgSend(v8, "close");
    goto LABEL_8;
  }
  v12 = (uint64_t)v11;
  v13 = -[NMSFTP writeStream:toSFTPHandle:progress:](self, "writeStream:toSFTPHandle:progress:", v8, v11, v10);
  libssh2_sftp_close_handle(v12);
  objc_msgSend(v8, "close");
LABEL_9:

  return v13;
}

- (BOOL)appendContents:(id)a3 toFileAtPath:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BDBCE90];
  v7 = a4;
  objc_msgSend(v6, "inputStreamWithData:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NMSFTP appendStream:toFileAtPath:](self, "appendStream:toFileAtPath:", v8, v7);

  return (char)self;
}

- (BOOL)appendStream:(id)a3 toFileAtPath:(id)a4
{
  id v6;
  id v7;
  _LIBSSH2_SFTP_HANDLE *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  _OWORD v16[3];
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "streamStatus"))
    objc_msgSend(v6, "open");
  if ((objc_msgSend(v6, "hasBytesAvailable") & 1) == 0)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No bytes available in the stream"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logWarn:", v14);
LABEL_10:

    goto LABEL_11;
  }
  v8 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", v7, 11, 420);
  if (!v8)
  {
    objc_msgSend(v6, "close");
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v9 = (uint64_t)v8;
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  if ((libssh2_sftp_fstat_ex(v8, (uint64_t *)v16, 0) & 0x80000000) != 0)
  {
    objc_msgSend(v6, "close");
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get attributes of file %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logError:", v14);
    goto LABEL_10;
  }
  libssh2_sftp_seek64(v9, *((uint64_t *)&v16[0] + 1));
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Seek to position %ld"), *((_QWORD *)&v16[0] + 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logVerbose:", v11);

  v12 = -[NMSFTP writeStream:toSFTPHandle:](self, "writeStream:toSFTPHandle:", v6, v9);
  libssh2_sftp_close_handle(v9);
  objc_msgSend(v6, "close");
LABEL_12:

  return v12;
}

- (BOOL)writeStream:(id)a3 toSFTPHandle:(_LIBSSH2_SFTP_HANDLE *)a4
{
  return -[NMSFTP writeStream:toSFTPHandle:progress:](self, "writeStream:toSFTPHandle:progress:", a3, a4, 0);
}

- (BOOL)writeStream:(id)a3 toSFTPHandle:(_LIBSSH2_SFTP_HANDLE *)a4 progress:(id)a5
{
  id v7;
  unsigned int (**v8)(id, _QWORD);
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  BOOL v12;
  _BYTE v14[16384];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (unsigned int (**)(id, _QWORD))a5;
  if (objc_msgSend(v7, "hasBytesAvailable"))
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = objc_msgSend(v7, "read:maxLength:", v14, 0x4000);
      if (v11 >= 1)
      {
        v9 = libssh2_sftp_write(a4, (uint64_t)v14, v11);
        v10 += v9;
        if (v8 && !v8[2](v8, v10))
          goto LABEL_9;
        if (v9 < 0)
          break;
      }
    }
    while (objc_msgSend(v7, "hasBytesAvailable"));
    v12 = (v9 | v11) >= 0;
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (BOOL)copyContentsOfPath:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  uint64_t (**v10)(id, _QWORD, uint64_t);
  _LIBSSH2_SFTP_HANDLE *v11;
  _LIBSSH2_SFTP_HANDLE *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v24;
  char v25[16384];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(id, _QWORD, uint64_t))a5;
  v11 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", v8, 1, 0);
  v12 = -[NMSFTP openFileAtPath:flags:mode:](self, "openFileAtPath:flags:mode:", v9, 11, 420);
  -[NMSFTP infoForFileAtPath:](self, "infoForFileAtPath:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v24 = v9;
    v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v15 = 0;
    while (1)
    {
      v16 = libssh2_sftp_read((uint64_t)v11, v25, 0x4000uLL);
      v17 = v16 < 1;
      if (v16 < 1)
        break;
      v18 = v16;
      objc_msgSend(v14, "appendBytes:length:", v25, v16);
      libssh2_sftp_write(v12, (uint64_t)v25, v18);
      v15 += v18;
      if (v10)
      {
        objc_msgSend(v13, "fileSize");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v10[2](v10, v15, objc_msgSend(v19, "integerValue"));

        if ((v20 & 1) == 0)
          break;
      }
    }
    libssh2_sftp_close_handle((uint64_t)v11);
    libssh2_sftp_close_handle((uint64_t)v12);

    v9 = v24;
  }
  else
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contentsAtPath:progress: failed to get file attributes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logWarn:", v22);

    v17 = 0;
  }

  return v17;
}

- (NMSSHSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (_LIBSSH2_SFTP)sftpSession
{
  return self->_sftpSession;
}

- (void)setSftpSession:(_LIBSSH2_SFTP *)a3
{
  self->_sftpSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

uint64_t __36__NMSFTP_contentsOfDirectoryAtPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)connectWithSession:(id)a3
{
  id v3;
  NMSFTP *v4;

  v3 = a3;
  v4 = -[NMSFTP initWithSession:]([NMSFTP alloc], "initWithSession:", v3);

  -[NMSFTP connect](v4, "connect");
  return v4;
}

@end

@implementation BRCPackageManifestReader

- (Class)itemClass
{
  return (Class)-[PBMessageStreamReader classOfNextMessage](self->_reader, "classOfNextMessage");
}

- (void)setItemClass:(Class)a3
{
  -[PBMessageStreamReader setClassOfNextMessage:](self->_reader, "setClassOfNextMessage:", a3);
}

- (BRCPackageManifestReader)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BRCPackageManifestReader init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (BRCPackageManifestReader)initWithInputStream:(id)a3
{
  id v5;
  BRCPackageManifestReader *v6;
  BRCPackageManifestReader *v7;
  id *p_stream;
  uint64_t v9;
  PBMessageStreamReader *reader;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BRCPackageManifestReader;
  v6 = -[BRCPackageManifestReader init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    p_stream = (id *)&v6->_stream;
    objc_storeStrong((id *)&v6->_stream, a3);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D82BA0]), "initWithStream:", *p_stream);
    reader = v7->_reader;
    v7->_reader = (PBMessageStreamReader *)v9;

    -[PBMessageStreamReader setClassOfNextMessage:](v7->_reader, "setClassOfNextMessage:", objc_opt_class());
    objc_msgSend(v5, "open");
    v11 = (void *)-[PBMessageStreamReader nextMessage](v7->_reader, "nextMessage");
    v12 = v11;
    if (v11 && objc_msgSend(v11, "version") == 1)
    {
      -[PBMessageStreamReader setClassOfNextMessage:](v7->_reader, "setClassOfNextMessage:", objc_opt_class());
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v16 = objc_msgSend(v12, "version");
        objc_msgSend(*p_stream, "streamError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v20 = v12;
        v21 = 1024;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = v13;
        _os_log_error_impl(&dword_1CBD43000, v14, (os_log_type_t)0x90u, "[ERROR] unable to read package header %@ with version %d - %@%@", buf, 0x26u);

      }
      -[BRCPackageManifestReader done](v7, "done");

      v7 = 0;
    }

  }
  return v7;
}

- (BRCPackageManifestReader)initWithURL:(id)a3
{
  void *v4;
  BRCPackageManifestReader *v5;

  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCPackageManifestReader initWithInputStream:](self, "initWithInputStream:", v4);

  return v5;
}

- (BRCPackageManifestReader)initWithAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BRCPackageManifestReader *v11;

  v4 = a3;
  objc_msgSend(v4, "fileID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "deviceID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v4, "deviceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");
    objc_msgSend(v4, "fileID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BRCPackageManifestReader initWithDeviceID:fileID:](self, "initWithDeviceID:fileID:", v9, objc_msgSend(v10, "unsignedLongLongValue"));

  }
  else
  {
    objc_msgSend(v4, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BRCPackageManifestReader initWithURL:](self, "initWithURL:", v8);
  }

  return v11;
}

- (BRCPackageManifestReader)initWithDeviceID:(int)a3 fileID:(unint64_t)a4
{
  void *v5;
  void *v6;
  BRCPackageManifestReader *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithDeviceID:fileID:", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCPackageManifestReader initWithInputStream:](self, "initWithInputStream:", v6);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BRCPackageManifestReader done](self, "done");
  v3.receiver = self;
  v3.super_class = (Class)BRCPackageManifestReader;
  -[BRCPackageManifestReader dealloc](&v3, sel_dealloc);
}

- (void)done
{
  PBMessageStreamReader *reader;
  NSInputStream *stream;

  -[NSInputStream close](self->_stream, "close");
  reader = self->_reader;
  self->_reader = 0;

  stream = self->_stream;
  self->_stream = 0;

}

- (id)nextObject
{
  PBMessageStreamReader *reader;
  void *v4;
  NSError *v5;
  NSError *error;
  void *v7;
  NSObject *v8;
  void *v10;
  NSObject *v11;

  reader = self->_reader;
  if (!reader)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCPackageManifestReader nextObject].cold.2();

    reader = self->_reader;
  }
  v4 = (void *)-[PBMessageStreamReader nextMessage](reader, "nextMessage");
  if (!v4)
  {
    if (-[NSInputStream streamStatus](self->_stream, "streamStatus") == 7)
    {
      -[NSInputStream streamError](self->_stream, "streamError");
      v5 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v5;

      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
        -[BRCPackageManifestReader nextObject].cold.1();

    }
    -[BRCPackageManifestReader done](self, "done");
  }
  return v4;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)nextObject
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _reader%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end

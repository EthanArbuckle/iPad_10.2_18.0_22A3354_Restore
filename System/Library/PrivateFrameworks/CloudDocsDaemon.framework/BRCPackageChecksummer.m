@implementation BRCPackageChecksummer

- (NSData)signature
{
  return -[BRCChecksummingOutputStream signature](self->_stream, "signature");
}

- (BRCPackageChecksummer)init
{
  BRCPackageChecksummer *v2;
  BRCChecksummingOutputStream *v3;
  BRCChecksummingOutputStream *stream;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCPackageChecksummer;
  v2 = -[BRCPackageChecksummer init](&v6, sel_init);
  if (v2)
  {
    v3 = -[BRCChecksummingOutputStream initWithTag:]([BRCChecksummingOutputStream alloc], "initWithTag:", 27);
    stream = v2->_stream;
    v2->_stream = v3;

    -[BRCChecksummingOutputStream open](v2->_stream, "open");
    -[BRCChecksummingOutputStream write:maxLength:](v2->_stream, "write:maxLength:", "version: 1\n", 11);
  }
  return v2;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  int v10;
  id v11;
  const char *v12;
  int64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  unsigned __int8 *v22;
  uint64_t v23;
  char *v24;
  _BYTE *v25;
  unsigned int v26;
  BRCChecksummingOutputStream *stream;
  void *v28;
  NSObject *v29;
  BOOL v30;
  void *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  int v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "type") == 4)
  {
LABEL_40:
    v30 = 1;
    goto LABEL_41;
  }
  if (-[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", (char *)&addItem_error__tags + (int)objc_msgSend(v6, "type"), 1) != -1&& -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &addItem_error__nul, 1) != -1)
  {
    objc_msgSend(v6, "path");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");

    if (!v8)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCPackageChecksummer addItem:error:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 22, CFSTR("NULL path for item: %@"), v6);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_17;
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, (os_log_type_t)0x90u))
        goto LABEL_16;
      v34 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v41 = "-[BRCPackageChecksummer addItem:error:]";
      v42 = 2080;
      if (!a4)
        v34 = "(ignored by caller)";
      goto LABEL_54;
    }
    if (-[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", v8, strlen(v8) + 1) != -1)
    {
      objc_msgSend(v6, "quarantineInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "br_qtnFlags");

      v39 = v10;
      if (!v10
        || -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &v39, 4) != -1
        && -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &addItem_error__nul, 1) != -1)
      {
        if (objc_msgSend(v6, "type") == 3)
        {
          objc_msgSend(v6, "symlinkContent");
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");

          if (v12)
          {
            v13 = -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", v12, strlen(v12) + 1);
            goto LABEL_30;
          }
          brc_bread_crumbs();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            -[BRCPackageChecksummer addItem:error:].cold.3();

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 22, CFSTR("NULL path for item symlink: %@"), v6);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
LABEL_17:
            if (a4)
              *a4 = objc_retainAutorelease(v16);

            goto LABEL_39;
          }
          brc_bread_crumbs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, (os_log_type_t)0x90u))
          {
LABEL_16:

            goto LABEL_17;
          }
          v34 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v41 = "-[BRCPackageChecksummer addItem:error:]";
          v42 = 2080;
          if (!a4)
            v34 = "(ignored by caller)";
LABEL_54:
          v43 = v34;
          v44 = 2112;
          v45 = v16;
          v46 = 2112;
          v47 = v17;
          _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          goto LABEL_16;
        }
        if (objc_msgSend(v6, "type") != 2)
        {
LABEL_31:
          -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &addItem_error__nl, 1);
          goto LABEL_32;
        }
        if ((!objc_msgSend(v6, "isWritable")
           || -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &addItem_error__w, 1) != -1)
          && (!objc_msgSend(v6, "isExecutable")
           || -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &addItem_error__x, 1) != -1)
          && -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &addItem_error__nul, 1) != -1)
        {
          objc_msgSend(v6, "signature");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");

          objc_msgSend(v6, "signature");
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = (unsigned __int8 *)objc_msgSend(v21, "bytes");

          v23 = 2 * v20;
          v24 = (char *)&v38 - ((2 * v20 + 16) & 0xFFFFFFFFFFFFFFF0);
          if (v20)
          {
            v25 = v24 + 1;
            do
            {
              v26 = *v22++;
              *(v25 - 1) = a0123456789abcd[(unint64_t)v26 >> 4];
              *v25 = a0123456789abcd[v26 & 0xF];
              v25 += 2;
              --v20;
            }
            while (v20);
          }
          v24[v23] = 0;
          v13 = -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:");
LABEL_30:
          if (v13 == -1)
            goto LABEL_32;
          goto LABEL_31;
        }
      }
    }
  }
LABEL_32:
  stream = self->_stream;
  if (!stream)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[BRCPackageChecksummer addItem:error:].cold.1();

    stream = self->_stream;
  }
  if (-[BRCChecksummingOutputStream streamStatus](stream, "streamStatus") != 7)
    goto LABEL_40;
  -[BRCChecksummingOutputStream streamError](self->_stream, "streamError");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      v35 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v41 = "-[BRCPackageChecksummer addItem:error:]";
      v42 = 2080;
      if (!a4)
        v35 = "(ignored by caller)";
      v43 = v35;
      v44 = 2112;
      v45 = v16;
      v46 = 2112;
      v47 = v28;
      _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
  {
    v16 = objc_retainAutorelease(v16);
    *a4 = v16;
  }
LABEL_39:

  v30 = 0;
LABEL_41:

  return v30;
}

- (void)done
{
  -[BRCChecksummingOutputStream close](self->_stream, "close");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)addItem:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _stream%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addItem:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: NULL path for item: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)addItem:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: NULL path for item symlink content: %@%@");
  OUTLINED_FUNCTION_2();
}

@end

@implementation NSPByteParser

- (NSPByteParser)initWithData:(id)a3
{
  id v5;
  NSPByteParser *v6;
  NSPByteParser *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSPByteParser;
  v6 = -[NSPByteParser init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v7->_cursor = (const char *)v8;
    v7->_offset = 0;
    v7->_bytes = (const char *)v8;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPByteParser *v4;
  void *v5;
  NSPByteParser *v6;

  v4 = +[NSPByteParser allocWithZone:](NSPByteParser, "allocWithZone:", a3);
  -[NSPByteParser data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSPByteParser initWithData:](v4, "initWithData:", v5);

  return v6;
}

- (BOOL)advanceBy:(unint64_t)a3 andCopyTo:(void *)a4
{
  const char *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = -[NSPByteParser cursor](self, "cursor");
  v8 = -[NSPByteParser offset](self, "offset");
  v9 = v8 + a3;
  -[NSPByteParser data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v8 + a3 > v11)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218240;
      v15 = a3;
      v16 = 2048;
      v17 = v8;
      _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, "Failed to advance by %lu bytes from offset %lu", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    if (a4)
      memcpy(a4, v7, a3);
    -[NSPByteParser setOffset:](self, "setOffset:", v9);
    -[NSPByteParser setCursor:](self, "setCursor:", &v7[a3]);
  }
  return v9 <= v11;
}

- (id)parseDomainName
{
  __int128 v2;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v26;
  char v27;
  uint8_t buf[4];
  _DWORD v29[7];

  v4 = 0;
  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 67109376;
  v26 = v2;
  do
  {
    v27 = 1;
    v5 = -[NSPByteParser parse8Bits:](self, "parse8Bits:", &v27, v26);
    if (!v27)
    {
      nplog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = -[NSPByteParser offset](self, "offset");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v29 = v14;
        v15 = v13;
        v16 = "Failed to parse 1st label length byte at offset %lu";
LABEL_17:
        _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      }
LABEL_18:

      goto LABEL_19;
    }
    v6 = v5;
    v7 = (v5 & 0xC0) == 192;
    if ((v5 & 0xC0) == 0xC0)
    {
      v8 = -[NSPByteParser parse8Bits:](self, "parse8Bits:", &v27);
      if (v27)
      {
        v9 = v8 & 0xFFFFC0FF | ((v6 & 0x3F) << 8);
        v10 = (void *)-[NSPByteParser copy](self, "copy");
        v11 = objc_msgSend(v10, "advanceBy:andCopyTo:", v9, 0);
        v27 = v11;
        if (v11)
        {
          objc_msgSend(v10, "parseDomainName");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        nplog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v24 = -[NSPByteParser offset](self, "offset");
          *(_DWORD *)buf = v26;
          v29[0] = v9;
          LOWORD(v29[1]) = 2048;
          *(_QWORD *)((char *)&v29[1] + 2) = v24;
          _os_log_error_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_ERROR, "Failed to follow pointer %u bytes from offset %lu", buf, 0x12u);
        }

LABEL_19:
        v7 = 0;
        continue;
      }
      nplog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = -[NSPByteParser offset](self, "offset");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v29 = v20;
        v15 = v13;
        v16 = "Failed to parse 2nd label length byte at offset %lu";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    if (!v5)
      return v4;
    v17 = -[NSPByteParser parseBytes:](self, "parseBytes:", v5);
    if (v17)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v17, v6, 4);
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("."));
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v18 = (void *)v12;

      if (v18)
      {
        if (v4)
        {
          objc_msgSend(v4, "stringByAppendingString:", v18);
          v19 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v19;
        }
        else
        {
          v4 = v18;
        }
      }
      continue;
    }
    nplog_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = -[NSPByteParser offset](self, "offset");
      *(_DWORD *)buf = v26;
      v29[0] = v6;
      LOWORD(v29[1]) = 2048;
      *(_QWORD *)((char *)&v29[1] + 2) = v23;
      _os_log_error_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_ERROR, "Failed to parse %u label bytes at offset %lu", buf, 0x12u);
    }

    v7 = 0;
    v27 = 0;
  }
  while (!v7 && v27);
  return v4;
}

- (unsigned)parse8Bits:(BOOL *)a3
{
  unsigned __int8 v4;

  v4 = 0;
  *a3 = -[NSPByteParser advanceBy:andCopyTo:](self, "advanceBy:andCopyTo:", 1, &v4);
  return v4;
}

- (unsigned)parse16Bits:(BOOL *)a3
{
  unsigned __int16 v5;

  v5 = 0;
  *a3 = -[NSPByteParser advanceBy:andCopyTo:](self, "advanceBy:andCopyTo:", 2, &v5);
  return bswap32(v5) >> 16;
}

- (unsigned)parse32Bits:(BOOL *)a3
{
  unsigned int v4;

  v4 = 0;
  *a3 = -[NSPByteParser advanceBy:andCopyTo:](self, "advanceBy:andCopyTo:", 4, &v4);
  return bswap32(v4);
}

- (const)parseBytes:(unint64_t)a3
{
  const char *v5;

  v5 = -[NSPByteParser cursor](self, "cursor");
  if (-[NSPByteParser advanceBy:andCopyTo:](self, "advanceBy:andCopyTo:", a3, 0))
    return v5;
  else
    return 0;
}

- (id)parseAddressWithFamily:(unsigned __int8)a3
{
  int v3;
  size_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  char *v8;
  char *v9;
  void *v10;

  v3 = a3;
  if (a3 == 2)
  {
    v4 = 16;
    v5 = 4;
  }
  else
  {
    if (a3 != 30)
    {
LABEL_9:
      v10 = 0;
      return v10;
    }
    v4 = 46;
    v5 = 16;
  }
  v6 = -[NSPByteParser parseBytes:](self, "parseBytes:", v5);
  if (!v6)
    goto LABEL_9;
  v7 = v6;
  v8 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
  if (!v8)
    goto LABEL_9;
  v9 = v8;
  if (inet_ntop(v3, v7, v8, v4))
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v9, 4);
  else
    v10 = 0;
  free(v9);
  return v10;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (const)bytes
{
  return self->_bytes;
}

- (const)cursor
{
  return self->_cursor;
}

- (void)setCursor:(const char *)a3
{
  self->_cursor = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

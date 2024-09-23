@implementation NSData(Gzip)

- (id)PK_gzipInflate
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uLong total_out;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  z_stream strm;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2 + (v3 >> 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&strm.avail_in, 0, 104);
  v5 = objc_retainAutorelease(a1);
  strm.next_in = (Bytef *)objc_msgSend(v5, "bytes");
  strm.avail_in = objc_msgSend(v5, "length");
  v6 = 0;
  if (!inflateInit2_(&strm, 47, "1.2.12", 112))
  {
    v7 = v3 >> 1;
    do
    {
      total_out = strm.total_out;
      if (total_out >= objc_msgSend(v4, "length"))
        objc_msgSend(v4, "increaseLengthBy:", v7);
      v9 = objc_retainAutorelease(v4);
      v10 = objc_msgSend(v9, "mutableBytes");
      strm.next_out = (Bytef *)(v10 + strm.total_out);
      v11 = objc_msgSend(v9, "length");
      strm.avail_out = v11 - LODWORD(strm.total_out);
      v12 = inflate(&strm, 2);
    }
    while (!(_DWORD)v12);
    v13 = v12;
    if ((_DWORD)v12 == 1)
    {
      if (!inflateEnd(&strm))
      {
        objc_msgSend(v9, "setLength:", strm.total_out);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {
      NSLog(CFSTR("**** ERROR: inflate failed returned %d"), v12);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v17 = v13;
        _os_log_error_impl(&dword_1BE213000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "inflate failed returned %d", buf, 8u);
      }
      if (!inflateEnd(&strm))
        goto LABEL_16;
    }
    NSLog(CFSTR("**** ERROR: inflateEnd failed"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "inflateEnd failed", buf, 2u);
    }
LABEL_16:
    v6 = 0;
  }
LABEL_17:

  return v6;
}

- (id)PK_gzipDeflate
{
  id v2;
  id v3;
  void *v4;
  uLong total_out;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  z_stream v11;

  if (!objc_msgSend(a1, "length"))
  {
    v3 = a1;
    return v3;
  }
  memset(&v11.total_out, 0, 72);
  v2 = objc_retainAutorelease(a1);
  v11.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  v3 = 0;
  if (deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112))
    return v3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    total_out = v11.total_out;
    if (total_out >= objc_msgSend(v4, "length"))
      objc_msgSend(v4, "increaseLengthBy:", 0x4000);
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "mutableBytes");
    v11.next_out = (Bytef *)(v7 + v11.total_out);
    v8 = objc_msgSend(v6, "length");
    v11.avail_out = v8 - LODWORD(v11.total_out);
    deflate(&v11, 4);
  }
  while (!v11.avail_out);
  deflateEnd(&v11);
  objc_msgSend(v6, "setLength:", v11.total_out);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

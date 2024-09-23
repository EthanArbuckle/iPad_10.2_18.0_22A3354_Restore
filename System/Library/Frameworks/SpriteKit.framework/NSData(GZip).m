@implementation NSData(GZip)

- (id)gzipDeflate:()GZip
{
  float v4;
  float v5;
  BOOL v6;
  float v7;
  int v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  uLong total_out;
  id v14;
  uint64_t v15;
  int v16;
  z_stream v18;

  if (objc_msgSend(a1, "length"))
  {
    v4 = fminf(a2, 1.0);
    v5 = v4 * 9.0;
    v6 = v4 <= 0.0;
    v7 = 0.0;
    if (!v6)
      v7 = v5;
    v8 = (int)v7;
    v9 = objc_retainAutorelease(a1);
    v18.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"));
    v18.avail_out = 0;
    v18.total_out = 0;
    memset(&v18.zalloc, 0, 24);
    v10 = deflateInit2_(&v18, v8, 8, 31, 8, 0, "1.2.12", 112);
    v11 = 0;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x8000);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      while (!v18.avail_out)
      {
        total_out = v18.total_out;
        if (total_out >= objc_msgSend(v12, "length"))
          objc_msgSend(v12, "setLength:", objc_msgSend(v12, "length") + 0x8000);
        v14 = objc_retainAutorelease(v12);
        v15 = objc_msgSend(v14, "mutableBytes");
        v18.next_out = (Bytef *)(v15 + v18.total_out);
        v16 = objc_msgSend(v14, "length");
        v18.avail_out = v16 - LODWORD(v18.total_out);
        if (deflate(&v18, 4))
        {
          deflateEnd(&v18);
          v11 = 0;
          goto LABEL_13;
        }
      }
      deflateEnd(&v18);
      objc_msgSend(v12, "setLength:", v18.total_out);
      v11 = v12;
LABEL_13:

    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)makeArchive:()GZip length:level:
{
  id v5;
  float v6;
  float v7;
  BOOL v8;
  float v9;
  void *v10;
  uLong total_out;
  id v12;
  uint64_t v13;
  int v14;
  z_stream v16;

  v5 = 0;
  if (a4 && a5)
  {
    v6 = fminf(a1, 1.0);
    v7 = v6 * 9.0;
    v8 = v6 <= 0.0;
    v9 = 0.0;
    if (!v8)
      v9 = v7;
    v16.next_in = a4;
    v16.avail_in = a5;
    v16.avail_out = 0;
    v16.total_out = 0;
    memset(&v16.zalloc, 0, 24);
    v5 = 0;
    if (!deflateInit2_(&v16, (int)v9, 8, 31, 8, 0, "1.2.12", 112))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x8000);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      while (!v16.avail_out)
      {
        total_out = v16.total_out;
        if (total_out >= objc_msgSend(v10, "length"))
          objc_msgSend(v10, "setLength:", objc_msgSend(v10, "length") + 0x8000);
        v12 = objc_retainAutorelease(v10);
        v13 = objc_msgSend(v12, "mutableBytes");
        v16.next_out = (Bytef *)(v13 + v16.total_out);
        v14 = objc_msgSend(v12, "length");
        v16.avail_out = v14 - LODWORD(v16.total_out);
        if (deflate(&v16, 4))
        {
          deflateEnd(&v16);
          v5 = 0;
          goto LABEL_13;
        }
      }
      deflateEnd(&v16);
      objc_msgSend(v10, "setLength:", v16.total_out);
      v5 = v10;
LABEL_13:

    }
  }
  return v5;
}

- (id)gzipInflate
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  uLong total_out;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  BOOL v12;
  int v14;
  char v15;
  void *v16;
  z_stream v17;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2 + (v3 >> 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(a1);
  v17.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"));
  v17.zalloc = 0;
  v17.zfree = 0;
  v17.total_out = 0;
  if (inflateInit2_(&v17, 47, "1.2.12", 112))
    goto LABEL_13;
  v6 = v3 >> 1;
  do
  {
    total_out = v17.total_out;
    if (total_out >= objc_msgSend(v4, "length"))
      objc_msgSend(v4, "increaseLengthBy:", v6);
    v8 = objc_retainAutorelease(v4);
    v9 = objc_msgSend(v8, "mutableBytes");
    v17.next_out = (Bytef *)(v9 + v17.total_out);
    v10 = objc_msgSend(v8, "length");
    v17.avail_out = v10 - LODWORD(v17.total_out);
    v11 = inflate(&v17, 2);
  }
  while (!v11);
  v12 = v11 == 1;
  v14 = inflateEnd(&v17);
  v15 = !v12;
  if (v14)
    v15 = 1;
  if ((v15 & 1) != 0)
  {
LABEL_13:
    v16 = 0;
  }
  else
  {
    objc_msgSend(v8, "setLength:", v17.total_out);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

@end

@implementation NSData(NNMKCompression)

- (id)compressedData
{
  id v2;
  id v3;
  void *v4;
  uLong total_out;
  uint64_t v6;
  int v7;
  z_stream v9;

  if (objc_msgSend(a1, "length"))
  {
    memset(&v9.total_out, 0, 72);
    v2 = objc_retainAutorelease(a1);
    v9.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    v3 = 0;
    if (!deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 0x4000);
      do
      {
        total_out = v9.total_out;
        if (total_out >= objc_msgSend(v4, "length"))
          objc_msgSend(v4, "increaseLengthBy:", 0x4000);
        v3 = objc_retainAutorelease(v4);
        v6 = objc_msgSend(v3, "mutableBytes");
        v9.next_out = (Bytef *)(v6 + v9.total_out);
        v7 = objc_msgSend(v3, "length");
        v9.avail_out = v7 - LODWORD(v9.total_out);
        deflate(&v9, 4);
      }
      while (!v9.avail_out);
      deflateEnd(&v9);
      objc_msgSend(v3, "setLength:", v9.total_out);
    }
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (id)decompressedData
{
  int v2;
  int v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uLong total_out;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  z_stream v15;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "length");
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = v3 + 1;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", (v2 + (v4 >> 1)));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(a1);
  v15.avail_in = objc_msgSend(v6, "length", objc_msgSend(v6, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v15.zalloc = 0;
  v15.zfree = 0;
  v15.total_out = 0;
  v7 = 0;
  if (!inflateInit2_(&v15, 47, "1.2.12", 112))
  {
    v8 = (v4 >> 1);
    do
    {
      total_out = v15.total_out;
      if (total_out >= objc_msgSend(v5, "length"))
        objc_msgSend(v5, "increaseLengthBy:", v8);
      v10 = objc_retainAutorelease(v5);
      v11 = objc_msgSend(v10, "mutableBytes");
      v15.next_out = (Bytef *)(v11 + v15.total_out);
      v12 = objc_msgSend(v10, "length");
      v15.avail_out = v12 - LODWORD(v15.total_out);
      v13 = inflate(&v15, 2);
    }
    while (!v13);
    if (v13 == 1)
    {
      if (!inflateEnd(&v15))
      {
        objc_msgSend(v10, "setLength:", v15.total_out);
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      inflateEnd(&v15);
    }
    v7 = 0;
  }
LABEL_16:

  return v7;
}

@end

@implementation NSData(IMCompression)

- (id)_imDecompressData
{
  int v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uLong total_out;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  z_stream strm;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a1, "length") > 0xC800000)
    return 0;
  if (!objc_msgSend(a1, "length"))
    return a1;
  v3 = objc_msgSend(a1, "length");
  v4 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v3 + (v4 >> 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_15;
  memset(&strm.avail_in, 0, 104);
  v6 = objc_retainAutorelease(a1);
  strm.next_in = (Bytef *)objc_msgSend(v6, "bytes");
  strm.avail_in = objc_msgSend(v6, "length");
  v7 = 0;
  if (!inflateInit2_(&strm, 47, "1.2.12", 112))
  {
    v8 = v4 >> 1;
    do
    {
      total_out = strm.total_out;
      if (total_out >= objc_msgSend(v5, "length"))
        objc_msgSend(v5, "increaseLengthBy:", v8);
      v10 = objc_retainAutorelease(v5);
      v11 = objc_msgSend(v10, "mutableBytes");
      strm.next_out = (Bytef *)(v11 + strm.total_out);
      v12 = objc_msgSend(v10, "length");
      strm.avail_out = v12 - LODWORD(strm.total_out);
      v13 = inflate(&strm, 2);
    }
    while (!v13);
    if (v13 == 1)
    {
      if (!inflateEnd(&strm))
      {
        objc_msgSend(v10, "setLength:", strm.total_out);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      inflateEnd(&strm);
    }
LABEL_15:
    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (id)_imOptionallyDecompressData
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_imDecompressData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = a1;
  v5 = v4;

  return v5;
}

@end

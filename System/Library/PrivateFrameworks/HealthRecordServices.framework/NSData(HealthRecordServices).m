@implementation NSData(HealthRecordServices)

- (id)hk_base45Encoded
{
  unint64_t v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t i;
  int v8;
  unsigned __int16 v9;
  uint64_t v10;
  unsigned __int16 v11;
  unsigned int v12;
  _BYTE *v13;
  int v14;
  int v15;
  char v16;
  void *v17;

  v2 = objc_msgSend(a1, "length");
  v3 = malloc_type_malloc(3 * (v2 >> 1) + 2 * (v2 & 1) + 1, 0x78194FB1uLL);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
    if (v2)
    {
      LODWORD(v6) = 0;
      for (i = 0; i < v2; i += 2)
      {
        v8 = *(unsigned __int8 *)(v5 + i);
        if (i + 1 >= v2)
        {
          v10 = (((v8 - ((unsigned __int16)(109 * v8) >> 8)) >> 1) + ((109 * v8) >> 8)) >> 5;
          v16 = hk_base45Encoded_characterSet[(v8 - 45 * v10)];
          v14 = v6 + 1;
          v4[v6] = v16;
          v15 = 2;
        }
        else
        {
          v9 = _byteswap_ushort(*(_WORD *)(v5 + i));
          v10 = (((unsigned __int16)(v9 - ((745 * v9) >> 16)) >> 1) + ((745 * v9) >> 16)) >> 10;
          v11 = v9 - 2025 * v10;
          v12 = v11 / 0x2Du;
          v13 = &v4[v6];
          *v13 = hk_base45Encoded_characterSet[v11 % 0x2Du];
          v14 = v6 + 2;
          v13[1] = hk_base45Encoded_characterSet[v12];
          v15 = 3;
        }
        v6 = (v6 + v15);
        v4[v14] = hk_base45Encoded_characterSet[v10];
      }
    }
    else
    {
      v6 = 0;
    }
    v4[v6] = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    free(v4);
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)hk_zlibCompressedIncludingHeaderAndTrailer:()HealthRecordServices errorOut:
{
  void *v5;
  void *v6;
  uLong v7;
  id v8;
  id v9;
  unsigned int v11;

  objc_msgSend(a1, "compressedDataUsingAlgorithm:error:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a3 & 1) != 0)
    {
      v7 = adler32(0, 0, 0);
      v8 = objc_retainAutorelease(a1);
      v11 = bswap32(adler32(v7, (const Bytef *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length")));
      objc_msgSend(MEMORY[0x24BDBCEC8], "data");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendBytes:length:", &hk_zlibCompressedIncludingHeaderAndTrailer_errorOut__defaultCompression, 2);
      objc_msgSend(v9, "appendData:", v6);
      objc_msgSend(v9, "appendBytes:length:", &v11, 4);
    }
    else
    {
      v9 = v5;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end

@implementation NSData(GEOMapService)

- (id)_geo_compressedDataViaAlgo:()GEOMapService
{
  size_t v6;
  id v7;
  uint8_t *v8;
  id v9;
  size_t v10;
  size_t v11;
  unsigned int v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  if ((unint64_t)objc_msgSend(a1, "length") > 0x100000)
    return 0;
  v6 = 3 * ((unint64_t)objc_msgSend(a1, "length") >> 2);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v6 + 4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (uint8_t *)(objc_msgSend(v7, "mutableBytes") + 4);
  v9 = objc_retainAutorelease(a1);
  v10 = compression_encode_buffer(v8, v6, (const uint8_t *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 0, a3);
  if (v10)
  {
    v11 = v10;
    v12 = bswap32(objc_msgSend(v9, "length"));
    v13 = objc_retainAutorelease(v7);
    *(_DWORD *)objc_msgSend(v13, "mutableBytes") = v12;
    objc_msgSend(v13, "setLength:", v11 + 4);
    v14 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_FAULT, "Unable to compress data", v16, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)_geo_decompressedDataViaAlgo:()GEOMapService
{
  id v5;
  size_t v6;
  void *v7;
  id v9;
  uint8_t *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  if ((unint64_t)objc_msgSend(a1, "length") <= 0x100000
    && (unint64_t)objc_msgSend(a1, "length") >= 5
    && (v5 = objc_retainAutorelease(a1), v6 = bswap32(*(_DWORD *)objc_msgSend(v5, "bytes")),
                                         v6 <= 0x100000))
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (uint8_t *)objc_msgSend(v9, "mutableBytes");
    v11 = objc_retainAutorelease(v5);
    if (compression_decode_buffer(v10, v6, (const uint8_t *)(objc_msgSend(v11, "bytes") + 4), objc_msgSend(v11, "length") - 4, 0, a3) == v6)
    {
      v7 = (void *)objc_msgSend(v9, "copy");
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_FAULT, "Unable to decompress data", v13, 2u);
      }

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end

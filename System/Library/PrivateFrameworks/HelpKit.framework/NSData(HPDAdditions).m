@implementation NSData(HPDAdditions)

- (uint8_t)hpd_dataUsingCompressionAlgorithm:()HPDAdditions operation:
{
  compression_status v7;
  compression_status v8;
  id v9;
  _BOOL4 v10;
  uint8_t *v11;
  uint8_t *v12;
  void *v13;
  compression_status v15;
  compression_stream v16;

  if (!objc_msgSend(a1, "length")
    || (memset(&v16, 0, sizeof(v16)), v7 = compression_stream_init(&v16, a4, a3), v7 == COMPRESSION_STATUS_ERROR))
  {
    v12 = 0;
  }
  else
  {
    v8 = v7;
    v9 = objc_retainAutorelease(a1);
    v16.src_ptr = (const uint8_t *)objc_msgSend(v9, "bytes");
    v16.src_size = objc_msgSend(v9, "length");
    v10 = a4 == COMPRESSION_STREAM_ENCODE;
    v11 = (uint8_t *)malloc_type_malloc(0x1000uLL, 0xBBE1E143uLL);
    v12 = v11;
    if (v11)
    {
      v16.dst_ptr = v11;
      v16.dst_size = 4096;
      v13 = (void *)objc_opt_new();
      if (v8 == COMPRESSION_STATUS_OK)
      {
        while (1)
        {
          v15 = compression_stream_process(&v16, v10);
          if (v15)
            break;
          if (!v16.dst_size)
          {
            objc_msgSend(v13, "appendBytes:length:", v12, 4096);
            v16.dst_ptr = v12;
            v16.dst_size = 4096;
          }
        }
        if (v15 == COMPRESSION_STATUS_ERROR)
        {

          v13 = 0;
        }
        else if (v15 == COMPRESSION_STATUS_END && v16.dst_size != 4096)
        {
          objc_msgSend(v13, "appendBytes:length:", v12, 4096 - v16.dst_size);
        }
      }
      free(v12);
      compression_stream_destroy(&v16);
      v12 = (uint8_t *)objc_msgSend(v13, "copy");

    }
    else
    {
      compression_stream_destroy(&v16);
    }
  }
  return v12;
}

- (uint64_t)hpd_compressedDataUsingAlgorithm:()HPDAdditions
{
  return objc_msgSend(a1, "hpd_dataUsingCompressionAlgorithm:operation:", a3, 0);
}

- (uint64_t)hpd_decompressedDataUsingAlgorithm:()HPDAdditions
{
  return objc_msgSend(a1, "hpd_dataUsingCompressionAlgorithm:operation:", a3, 1);
}

@end

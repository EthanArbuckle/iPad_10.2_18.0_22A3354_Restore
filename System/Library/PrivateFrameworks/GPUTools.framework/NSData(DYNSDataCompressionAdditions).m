@implementation NSData(DYNSDataCompressionAdditions)

+ (uint64_t)DYCompressionAlgorithmFromString:()DYNSDataCompressionAdditions
{
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE396E0]) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE396E8]) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE396D8]) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE396D0]))
    return 3;
  return 0;
}

+ (uint64_t)DYStringFromCompressionAlgorithm:()DYNSDataCompressionAdditions
{
  uint64_t *v3;
  uint64_t result;

  switch(a3)
  {
    case 0:
      v3 = (uint64_t *)MEMORY[0x24BE396E0];
      goto LABEL_7;
    case 1:
      v3 = (uint64_t *)MEMORY[0x24BE396E8];
      goto LABEL_7;
    case 2:
      v3 = (uint64_t *)MEMORY[0x24BE396D8];
      goto LABEL_7;
    case 3:
      v3 = (uint64_t *)MEMORY[0x24BE396D0];
LABEL_7:
      result = *v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)dy_compressedDataWithAlgorithm:()DYNSDataCompressionAdditions
{
  void *v3;
  int v4;
  compression_algorithm v5;
  size_t v6;
  const uint8_t *v7;
  uint8_t *v8;
  size_t v9;
  size_t v10;
  void *v11;

  v3 = a1;
  if (a3)
  {
    if (a3 == 1)
      v4 = 517;
    else
      v4 = 2049;
    if (a3 == 3)
      v5 = COMPRESSION_LZ4;
    else
      v5 = v4;
    v6 = objc_msgSend(a1, "length");
    v7 = (const uint8_t *)objc_msgSend(v3, "bytes");
    v8 = (uint8_t *)malloc_type_malloc(v6 + 128, 0x71A70526uLL);
    mach_absolute_time();
    v9 = compression_encode_buffer(v8, v6 + 128, v7, v6, 0, v5);
    if (v9)
    {
      v10 = v9;
      v11 = malloc_type_realloc(v8, v9, 0x7C7DC975uLL);
      if (v11)
        return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, v10, 1);
    }
    free(v8);
    return 0;
  }
  return (uint64_t)v3;
}

- (uint64_t)dy_decompressedDataWithAlgorithm:()DYNSDataCompressionAdditions outputLength:
{
  void *v4;
  int v6;
  compression_algorithm v7;
  uint64_t v8;
  size_t v9;
  const uint8_t *v10;
  uint8_t *v11;
  size_t v12;

  v4 = a1;
  if (!a3)
    return (uint64_t)v4;
  if (a3 == 1)
    v6 = 517;
  else
    v6 = 2049;
  if (a3 == 3)
    v7 = COMPRESSION_LZ4;
  else
    v7 = v6;
  v8 = objc_msgSend(a1, "length");
  if (!v8)
    return 0;
  v9 = v8;
  v10 = (const uint8_t *)objc_msgSend(v4, "bytes");
  v11 = (uint8_t *)malloc_type_malloc(a4, 0x65CCCB78uLL);
  mach_absolute_time();
  v12 = compression_decode_buffer(v11, a4, v10, v9, 0, v7);
  if (a4 && !v12)
  {
    free(v11);
    return 0;
  }
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, a4, 1);
}

@end

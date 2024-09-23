@implementation NSData(Signing)

- (id)dc_compressedData:()Signing
{
  uint64_t v5;
  size_t v6;
  uint8_t *v7;
  uint8_t *v8;
  id v9;
  size_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = objc_msgSend(a1, "length");
  if (v5 < 0)
  {
    _DCLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSData(Signing) dc_compressedData:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_9;
  }
  v6 = 2 * v5;
  v7 = (uint8_t *)malloc_type_malloc(2 * v5, 0x7C50DA5EuLL);
  if (!v7)
  {
    _DCLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSData(Signing) dc_compressedData:].cold.2(v12, v20, v21, v22, v23, v24, v25, v26);
LABEL_9:

LABEL_10:
    v11 = 0;
    return v11;
  }
  v8 = v7;
  v9 = objc_retainAutorelease(a1);
  v10 = compression_encode_buffer(v8, v6, (const uint8_t *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 0, a3);
  if (!v10)
  {
    _DCLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[NSData(Signing) dc_compressedData:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);

    free(v8);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (void)dc_compressedData:()Signing .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, a1, a3, "Overflow while attempting to compress data!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)dc_compressedData:()Signing .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, a1, a3, "Failed to allocate buffer for compressed data!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)dc_compressedData:()Signing .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, a1, a3, "Failed to compress data!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end

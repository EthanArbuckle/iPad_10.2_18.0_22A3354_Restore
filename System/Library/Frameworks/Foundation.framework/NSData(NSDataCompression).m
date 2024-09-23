@implementation NSData(NSDataCompression)

- (id)_decompressedDataUsingCompressionAlgorithm:()NSDataCompression error:
{
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__NSData_NSDataCompression___decompressedDataUsingCompressionAlgorithm_error___block_invoke;
  v8[3] = &unk_1E0F4D288;
  v8[4] = &v9;
  objc_msgSend(a1, "_produceDataWithCompressionOperation:algorithm:handler:", 1, a3, v8);
  v5 = (void *)v10[5];
  if (a4 && !v5)
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 5377, 0);
    v5 = (void *)v10[5];
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_compressedDataUsingCompressionAlgorithm:()NSDataCompression error:
{
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSData_NSDataCompression___compressedDataUsingCompressionAlgorithm_error___block_invoke;
  v8[3] = &unk_1E0F4D288;
  v8[4] = &v9;
  objc_msgSend(a1, "_produceDataWithCompressionOperation:algorithm:handler:", 0, a3, v8);
  v5 = (void *)v10[5];
  if (a4 && !v5)
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 5376, 0);
    v5 = (void *)v10[5];
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)_produceDataWithCompressionOperation:()NSDataCompression algorithm:handler:
{
  id v9;
  _NSDataCompressor *v10;
  uint64_t v11;
  _NSDataCompressor *v12;
  uint64_t *v13;
  BOOL v14;
  id v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v10 = [_NSDataCompressor alloc];
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke;
  v21[3] = &unk_1E0F4D238;
  v21[4] = v9;
  v12 = -[_NSDataCompressor initWithAlgorithm:operation:dataHandler:](v10, "initWithAlgorithm:operation:dataHandler:", a4, a3, v21);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke_2;
  v16[3] = &unk_1E0F4D260;
  v16[4] = v12;
  v16[5] = &v17;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v16);
  v13 = v18;
  if (*((_BYTE *)v18 + 24))
  {
    v14 = -[_NSDataCompressor finishProcessing](v12, "finishProcessing");
    v13 = v18;
  }
  else
  {
    v14 = 0;
  }
  *((_BYTE *)v13 + 24) = v14;

  if (*((_BYTE *)v18 + 24))
    v15 = v9;
  else
    v15 = 0;
  (*(void (**)(uint64_t, id))(a5 + 16))(a5, v15);

  _Block_object_dispose(&v17, 8);
}

- (uint64_t)compressedDataUsingAlgorithm:()NSDataCompression error:
{
  return objc_msgSend(a1, "_compressedDataUsingCompressionAlgorithm:error:", _NSAlgToCompAlg(a3), a4);
}

- (uint64_t)decompressedDataUsingAlgorithm:()NSDataCompression error:
{
  return objc_msgSend(a1, "_decompressedDataUsingCompressionAlgorithm:error:", _NSAlgToCompAlg(a3), a4);
}

@end

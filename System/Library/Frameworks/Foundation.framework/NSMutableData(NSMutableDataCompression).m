@implementation NSMutableData(NSMutableDataCompression)

- (BOOL)_compressUsingCompressionAlgorithm:()NSMutableDataCompression error:
{
  void *v7;
  int v8;
  _BOOL8 v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = (void *)MEMORY[0x186DA8F78]();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__NSMutableData_NSMutableDataCompression___compressUsingCompressionAlgorithm_error___block_invoke;
  v11[3] = &unk_1E0F4D2B0;
  v11[4] = a1;
  v11[5] = &v12;
  objc_msgSend(a1, "_produceDataWithCompressionOperation:algorithm:handler:", 0, a3, v11);
  objc_autoreleasePoolPop(v7);
  v8 = *((unsigned __int8 *)v13 + 24);
  if (a4 && !*((_BYTE *)v13 + 24))
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 5376, 0);
    v8 = *((unsigned __int8 *)v13 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)_decompressUsingCompressionAlgorithm:()NSMutableDataCompression error:
{
  void *v7;
  int v8;
  _BOOL8 v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = (void *)MEMORY[0x186DA8F78]();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__NSMutableData_NSMutableDataCompression___decompressUsingCompressionAlgorithm_error___block_invoke;
  v11[3] = &unk_1E0F4D2B0;
  v11[4] = a1;
  v11[5] = &v12;
  objc_msgSend(a1, "_produceDataWithCompressionOperation:algorithm:handler:", 1, a3, v11);
  objc_autoreleasePoolPop(v7);
  v8 = *((unsigned __int8 *)v13 + 24);
  if (a4 && !*((_BYTE *)v13 + 24))
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 5377, 0);
    v8 = *((unsigned __int8 *)v13 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (uint64_t)compressUsingAlgorithm:()NSMutableDataCompression error:
{
  return objc_msgSend(a1, "_compressUsingCompressionAlgorithm:error:", _NSAlgToCompAlg(a3), a4);
}

- (uint64_t)decompressUsingAlgorithm:()NSMutableDataCompression error:
{
  return objc_msgSend(a1, "_decompressUsingCompressionAlgorithm:error:", _NSAlgToCompAlg(a3), a4);
}

@end

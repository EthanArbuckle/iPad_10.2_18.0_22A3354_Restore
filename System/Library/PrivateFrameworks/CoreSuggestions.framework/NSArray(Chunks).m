@implementation NSArray(Chunks)

- (void)sg_enumerateChunksOfSize:()Chunks usingBlock:
{
  void (**v7)(id, void *, _BYTE *);
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGArrays.m"), 191, CFSTR("Chunk size must be > 0"));

  }
  v8 = 0;
  do
  {
    if (v8 >= objc_msgSend(a1, "count"))
      break;
    v9 = (void *)MEMORY[0x1A8583A40]();
    v14 = 0;
    v10 = objc_msgSend(a1, "count");
    v11 = v10 - v8 >= a3 ? a3 : v10 - v8;
    objc_msgSend(a1, "subarrayWithRange:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12, &v14);

    LODWORD(v12) = v14;
    v8 += v11;
    objc_autoreleasePoolPop(v9);
  }
  while (!(_DWORD)v12);

}

@end

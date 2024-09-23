@implementation LSWriteApplicationPlaceholderToURL

void ___LSWriteApplicationPlaceholderToURL_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void **v9;
  id v10;
  char v11;
  id v12;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  v12 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v3 = _LSWriteBundlePlaceholderToURLInternal((id *)&v9, *(NSURL **)(a1 + 32), *(NSURL **)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v5 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v3, (uint64_t)"_LSWriteApplicationPlaceholderToURL_block_invoke", 62, 0);
    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v6, v5);
  if (v9 && v11)
    _LSContextDestroy(v9);
  v7 = v10;
  v9 = 0;
  v10 = 0;

  v11 = 0;
  v8 = v12;
  v12 = 0;

  objc_autoreleasePoolPop(v2);
}

@end

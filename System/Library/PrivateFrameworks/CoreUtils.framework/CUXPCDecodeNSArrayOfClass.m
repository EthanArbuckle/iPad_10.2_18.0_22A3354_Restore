@implementation CUXPCDecodeNSArrayOfClass

BOOL __CUXPCDecodeNSArrayOfClass_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;

  v4 = a3;
  if (MEMORY[0x18D78F504]() == MEMORY[0x1E0C812F8])
  {
    v10 = objc_alloc(*(Class *)(a1 + 56));
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v11 + 40);
    v12 = (void *)objc_msgSend(v10, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    v13 = v12 != 0;
    if (v12)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

  }
  else
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960540, (uint64_t)"XPC array non-dictionary value: '%s'", v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 48));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v13 = 0;
  }

  return v13;
}

@end

@implementation CUXPCDecodeNSArrayOfNSString

uint64_t __CUXPCDecodeNSArrayOfNSString_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *string_ptr;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v4 = a3;
  if (MEMORY[0x18D78F504]() != MEMORY[0x1E0C81390])
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960540, (uint64_t)"XPC array non-string value: '%s'", v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 48));
LABEL_8:
    v24 = objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;
    goto LABEL_5;
  }
  string_ptr = xpc_string_get_string_ptr(v4);
  if (!string_ptr)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960540, (uint64_t)"XPC array null string value: '%s'", v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 48));
    goto LABEL_8;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string_ptr);
  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v21);
    v22 = 1;
  }
  else
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960540, (uint64_t)"XPC array bad string value: '%s'", v16, v17, v18, v19, v20, *(_QWORD *)(a1 + 48));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    v22 = 0;
  }
LABEL_5:

  return v22;
}

@end

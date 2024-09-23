@implementation CUXPCDecodeNSArrayOfInteger

uint64_t __CUXPCDecodeNSArrayOfInteger_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t value;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;

  v4 = a3;
  v5 = MEMORY[0x18D78F504]();
  if (v5 == MEMORY[0x1E0C81328])
  {
    value = xpc_int64_get_value(v4);
  }
  else
  {
    if (v5 != MEMORY[0x1E0C81398])
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960540, (uint64_t)"XPC array non-int value: '%s'", v6, v7, v8, v9, v10, a1[6]);
      goto LABEL_4;
    }
    value = xpc_uint64_get_value(v4);
  }
  if (value >= a1[7] && value <= a1[8])
  {
    v22 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", value);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v14);
    v12 = 1;
    goto LABEL_13;
  }
  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960586, (uint64_t)"XPC array int out-of-range: '%s', %lld, min %lld, max %lld", v16, v17, v18, v19, v20, a1[6]);
LABEL_4:
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v11;
LABEL_13:

  return v12;
}

@end

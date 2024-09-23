@implementation BSXPCDecodeObject

BOOL ___BSXPCDecodeObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _BSXPCDecodeObjectFromContext(*(_QWORD *)(a1 + 32), a3, 0, *(_QWORD *)(a1 + 48), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    BSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134218242;
      v10 = a2;
      v11 = 2112;
      v12 = a3;
      _os_log_error_impl(&dword_18A184000, v7, OS_LOG_TYPE_ERROR, "Array element %zu failed to decode: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  return v6 != 0;
}

BOOL ___BSXPCDecodeObject_block_invoke_218(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BSXPCDecodeObjectForKey(*(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 56), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);

  return v4 != 0;
}

@end

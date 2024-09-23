@implementation _BKSHIDEventAuthenticationKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
}

- (uint64_t)_context
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(a1 + 400);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) != 0)
    return a1 + 16;
  if (!objc_msgSend(*(id *)(a1 + 8), "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("truncated data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__context);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544642;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      v14 = 2048;
      v15 = a1;
      v16 = 2114;
      v17 = CFSTR("_BKSHIDEventAuthenticationKey.m");
      v18 = 1024;
      v19 = 49;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A126030);
  }
  v4 = a1 + 16;
  CCHmacInit((CCHmacContext *)(a1 + 16), 2u, (const void *)objc_msgSend(*(id *)(a1 + 8), "bytes"), objc_msgSend(*(id *)(a1 + 8), "length"));
  return v4;
}

@end

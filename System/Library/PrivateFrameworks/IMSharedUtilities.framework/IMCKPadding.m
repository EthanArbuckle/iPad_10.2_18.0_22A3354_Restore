@implementation IMCKPadding

+ (id)_randomDataWithLength:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3);
  if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], a3, (void *)objc_msgSend(v4, "mutableBytes")))
    return v4;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Failed to create random bytes", v7, 2u);
    }
  }

  return 0;
}

+ (int64_t)_paddingForType:(int)a3 originalSize:(int64_t)a4 error:(__CFError *)a5
{
  uint64_t (*v8)(int64_t, uint64_t, __CFError **);
  int64_t v9;
  uint64_t v10;

  if (qword_1EE503AB0 != -1)
    dispatch_once(&qword_1EE503AB0, &unk_1E3FB3B48);
  if (a3 == 3)
  {
    v8 = (uint64_t (*)(int64_t, uint64_t, __CFError **))off_1EE503AA8;
    if (off_1EE503AA8)
    {
      v9 = a4;
      v10 = 3;
      return v8(v9, v10, a5);
    }
  }
  else if (a3 == 2)
  {
    v8 = (uint64_t (*)(int64_t, uint64_t, __CFError **))off_1EE503AA8;
    if (off_1EE503AA8)
    {
      v9 = a4;
      v10 = 2;
      return v8(v9, v10, a5);
    }
  }
  else
  {
    v8 = (uint64_t (*)(int64_t, uint64_t, __CFError **))off_1EE503AA8;
    if (off_1EE503AA8)
    {
      v9 = a4;
      v10 = 1;
      return v8(v9, v10, a5);
    }
  }
  return 0;
}

+ (id)paddingForMessageOfSize:(int64_t)a3
{
  uint64_t v3;

  objc_msgSend((id)objc_opt_class(), "_paddingForType:originalSize:error:", 2, a3, 0);
  v3 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v3, sel__randomDataWithLength_);
}

@end

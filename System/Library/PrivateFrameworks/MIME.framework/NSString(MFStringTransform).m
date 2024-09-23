@implementation NSString(MFStringTransform)

- (__CFString)mf_applyTransform:()MFStringTransform
{
  id v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = v4;
  if (!v4 || !*((_QWORD *)v4 + 1))
  {
LABEL_8:
    v7 = a1;
    goto LABEL_9;
  }
  if (!objc_msgSend(a1, "length"))
  {
    v7 = &stru_1E5AA1FC8;
    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(a1, "length") >= 0xF4241)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSString(MFStringTransform) mf_applyTransform:].cold.1();

    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1AF433BF4]();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__NSString_MFStringTransform__mf_applyTransform___block_invoke;
  v13[3] = &unk_1E5AA1740;
  v14 = v5;
  withMutableCharactersAndPadding(a1, v13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = a1;
  v7 = v12;

  objc_autoreleasePoolPop(v9);
LABEL_9:

  return v7;
}

- (void)mf_applyTransform:()MFStringTransform .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1ABB13000, v0, v1, "MFStringTransform: Stripping code points: input length out of bounds.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

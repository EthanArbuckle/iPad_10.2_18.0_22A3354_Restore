@implementation CIRAWFilterImpl(CustomAccessors)

- (void)inputImage
{
  __assert_rtn("-[CIRAWFilterImpl(CustomAccessors) inputImage]", "CIRAWFilterImpl.m", 1784, "_inputImage != nil");
}

- (void)setInputDecoderVersion:()CustomAccessors .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 376);
  v4 = 136446722;
  v5 = "-[CIRAWFilterImpl(CustomAccessors) setInputDecoderVersion:]";
  v6 = 2114;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "%{public}s The file does not support version %{public}@. The version %{public}@ will be used instead.", (uint8_t *)&v4, 0x20u);
}

- (void)setInputDecoderVersion:()CustomAccessors .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136446210;
  v2 = "-[CIRAWFilterImpl(CustomAccessors) setInputDecoderVersion:]";
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "%{public}s Invalid argument type", (uint8_t *)&v1, 0xCu);
}

@end

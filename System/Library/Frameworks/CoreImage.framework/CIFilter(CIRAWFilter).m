@implementation CIFilter(CIRAWFilter)

+ (void)filterWithImageURL:()CIRAWFilter options:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446467;
  v3 = "+[CIFilter(CIRAWFilter) filterWithImageURL:options:]";
  v4 = 2113;
  v5 = a1;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}s unable to read file %{private}@.", (uint8_t *)&v2, 0x16u);
}

@end

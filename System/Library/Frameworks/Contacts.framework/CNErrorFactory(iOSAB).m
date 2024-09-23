@implementation CNErrorFactory(iOSAB)

+ (void)genericiOSABError
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Creating genericiOSABError, backtrace:", v1, 2u);
}

+ (void)errorForiOSABError:()iOSAB .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138543618;
  v6 = ABLogErrorPtr();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_18F8BD000, a3, OS_LOG_TYPE_ERROR, "errorForiOSABError:\niOSABError = %{public}@ \nCNError = %{public}@ backtrace:", (uint8_t *)&v5, 0x16u);
}

@end

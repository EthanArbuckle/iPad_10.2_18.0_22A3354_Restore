@implementation ZN14LaunchServices17BindingEvaluationL21addAlternateUTIClaimsERNS0

uint64_t **___ZN14LaunchServices17BindingEvaluationL21addAlternateUTIClaimsERNS0_5StateE_block_invoke(uint64_t **result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t **v6;
  NSObject *v7;
  uint64_t *v8;
  void *v9;
  int v10;
  uint64_t *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = result[4];
  if (*((_DWORD *)v4 + 56) != a3 && (*(_BYTE *)(a4 + 8) & 1) != 0)
  {
    v6 = result;
    result = (uint64_t **)_UTTypeConformsTo(*(void **)*v4, a3, *((_DWORD *)result + 12));
    if ((_DWORD)result)
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = v6[5];
        v9 = (void *)_CSStringCopyCFString();
        v10 = 138412546;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "Found alternate UTI for extension .%@: %@", (uint8_t *)&v10, 0x16u);

      }
      return LaunchServices::BindingEvaluation::addClaimsInBindingMap((uint64_t **)v6[4], 0, *(_DWORD *)(a4 + 12));
    }
  }
  return result;
}

@end

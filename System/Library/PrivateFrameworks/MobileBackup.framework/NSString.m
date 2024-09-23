@implementation NSString

uint64_t __60__NSString_MobileBackup__mb_stringByAppendingGreenteaSuffix__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int *v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t (*v6)(const char *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t result;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = dlopen("/System/Library/Frameworks/IOKit.framework/IOKit", 5);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSString+MobileBackup.m"), 60, CFSTR("Unable to dlopen IOKit!"));

  }
  v3 = dlopen("/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport", 5);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSString+MobileBackup.m"), 62, CFSTR("Unable top dlopen AppSupport!"));

  }
  mb_stringByAppendingGreenteaSuffix_CPGetDeviceRegionCode = (uint64_t (*)(_QWORD))dlsym(v3, "CPGetDeviceRegionCode");
  mb_stringByAppendingGreenteaSuffix_IOServiceGetMatchingService = dlsym(v2, "IOServiceGetMatchingService");
  mb_stringByAppendingGreenteaSuffix_IOServiceMatching = dlsym(v2, "IOServiceMatching");
  v4 = (unsigned int *)dlsym(v2, "kIOMainPortDefault");
  mb_stringByAppendingGreenteaSuffix_kIOMainPortDefault = (uint64_t)v4;
  if (!mb_stringByAppendingGreenteaSuffix_CPGetDeviceRegionCode
    || (v5 = (uint64_t (*)(uint64_t, uint64_t))mb_stringByAppendingGreenteaSuffix_IOServiceGetMatchingService) == 0
    || (v6 = (uint64_t (*)(const char *))mb_stringByAppendingGreenteaSuffix_IOServiceMatching) == 0
    || !v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSString+MobileBackup.m"), 68, CFSTR("Unable to setup soft linking!"));

    v5 = (uint64_t (*)(uint64_t, uint64_t))mb_stringByAppendingGreenteaSuffix_IOServiceGetMatchingService;
    v4 = (unsigned int *)mb_stringByAppendingGreenteaSuffix_kIOMainPortDefault;
    v6 = (uint64_t (*)(const char *))mb_stringByAppendingGreenteaSuffix_IOServiceMatching;
  }
  v7 = *v4;
  v8 = v6("AppleBaseband");
  v9 = v5(v7, v8);
  v10 = v9 - 1;
  if ((v9 - 1) <= 0xFFFFFFFD)
    v9 = mach_port_deallocate(*MEMORY[0x1E0C83DA0], v9);
  result = objc_msgSend((id)mb_stringByAppendingGreenteaSuffix_CPGetDeviceRegionCode(v9), "isEqualToString:", CFSTR("CH"));
  if (v10 < 0xFFFFFFFE)
    v12 = result;
  else
    v12 = 0;
  mb_stringByAppendingGreenteaSuffix_isGreenTea = v12;
  return result;
}

@end

@implementation HMCameraSnapshot

uint64_t __63__HMCameraSnapshot_HFAdditions__hf_localizedAgeForCaptureDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_MergedGlobals_314;
  _MergedGlobals_314 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_314, "setMaximumUnitCount:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ja"));

  if (v4)
    v5 = 5;
  else
    v5 = 1;
  return objc_msgSend((id)_MergedGlobals_314, "setUnitsStyle:", v5);
}

@end

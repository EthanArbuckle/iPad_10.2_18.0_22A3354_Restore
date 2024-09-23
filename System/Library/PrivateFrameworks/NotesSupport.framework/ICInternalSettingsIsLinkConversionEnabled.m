@implementation ICInternalSettingsIsLinkConversionEnabled

void __ICInternalSettingsIsLinkConversionEnabled_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("EnableLinkConversion");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

  if (+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests"))
  {
    ICInternalSettingsIsLinkConversionEnabled_isEnabled = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    ICInternalSettingsIsLinkConversionEnabled_isEnabled = objc_msgSend(v2, "BOOLForKey:", CFSTR("EnableLinkConversion"));

  }
}

@end

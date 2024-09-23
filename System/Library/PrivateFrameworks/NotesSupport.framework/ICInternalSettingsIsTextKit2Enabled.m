@implementation ICInternalSettingsIsTextKit2Enabled

void __ICInternalSettingsIsTextKit2Enabled_block_invoke()
{
  char v0;
  id v1;

  if (+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests"))
  {
    ICInternalSettingsIsTextKit2Enabled_isEnabled = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "BOOLForKey:", CFSTR("EnableTextKit2")) & 1) != 0)
      v0 = 1;
    else
      v0 = _os_feature_enabled_impl();
    ICInternalSettingsIsTextKit2Enabled_isEnabled = v0;

  }
}

@end

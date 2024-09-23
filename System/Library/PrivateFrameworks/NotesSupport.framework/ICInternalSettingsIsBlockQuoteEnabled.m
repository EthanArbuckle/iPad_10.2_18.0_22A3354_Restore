@implementation ICInternalSettingsIsBlockQuoteEnabled

void __ICInternalSettingsIsBlockQuoteEnabled_block_invoke()
{
  char v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "BOOLForKey:", CFSTR("EnableBlockQuote")) & 1) != 0)
    v0 = 1;
  else
    v0 = _os_feature_enabled_impl();
  ICInternalSettingsIsBlockQuoteEnabled_isEnabled = v0;

}

@end

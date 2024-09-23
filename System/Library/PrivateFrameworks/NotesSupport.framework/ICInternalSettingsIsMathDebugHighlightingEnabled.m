@implementation ICInternalSettingsIsMathDebugHighlightingEnabled

void __ICInternalSettingsIsMathDebugHighlightingEnabled_block_invoke()
{
  id v0;

  if (ICInternalSettingsIsMathEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_157);
  if (ICInternalSettingsIsMathEnabled_isEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    ICInternalSettingsIsMathDebugHighlightingEnabled_isEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("EnableMathDebugHighlighting"));

  }
  else
  {
    ICInternalSettingsIsMathDebugHighlightingEnabled_isEnabled = 0;
  }
}

@end

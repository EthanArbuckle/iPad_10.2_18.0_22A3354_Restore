@implementation ICInternalSettingsIsTracingEnabled

void __ICInternalSettingsIsTracingEnabled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ICInternalSettingsIsTracingEnabled_ICInternalSettingsTraceEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("internalSettings.traceEnabled"));

}

@end

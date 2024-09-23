@implementation OctagonIsSOSFeatureEnabled

void __OctagonIsSOSFeatureEnabled_block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OctagonIsSOSFeatureEnabled_sosEnabled = _os_feature_enabled_impl();
  secLogObjForScope("octagon");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (OctagonIsSOSFeatureEnabled_sosEnabled)
      v1 = CFSTR("enabled");
    else
      v1 = CFSTR("disabled");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_18A900000, v0, OS_LOG_TYPE_DEFAULT, "SOS Feature is %@ (via feature flags)", (uint8_t *)&v2, 0xCu);
  }

}

@end

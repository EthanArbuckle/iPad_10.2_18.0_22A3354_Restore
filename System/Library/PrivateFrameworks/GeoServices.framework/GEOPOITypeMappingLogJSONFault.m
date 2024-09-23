@implementation GEOPOITypeMappingLogJSONFault

void __GEOPOITypeMappingLogJSONFault_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  GEOGetGEOPOICategoryLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1885A9000, v0, OS_LOG_TYPE_FAULT, "Invalid POIType mapping JSON detected.", v1, 2u);
  }

}

@end

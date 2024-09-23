@implementation CKVisionSignpost

+ (void)signpostIntervalBeginForVFXLoad
{
  NSObject *v2;
  uint8_t v3[16];

  IMClientTelemetryLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IMSignpostWolfVFXLoad", " enableTelemetry=YES ", v3, 2u);
  }

}

+ (void)signpostIntervalEndForVFXLoad
{
  NSObject *v2;
  uint8_t v3[16];

  IMClientTelemetryLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IMSignpostWolfVFXLoad", " enableTelemetry=YES ", v3, 2u);
  }

}

+ (void)signpostIntervalBeginForQuickReply
{
  NSObject *v2;
  uint8_t v3[16];

  IMClientTelemetryLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "QuickReplyResponseRequestToComplete", " enableTelemetry=YES ", v3, 2u);
  }

}

+ (void)signpostIntervalEndForQuickReply
{
  NSObject *v2;
  uint8_t v3[16];

  IMClientTelemetryLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "QuickReplyResponseRequestToComplete", " enableTelemetry=YES ", v3, 2u);
  }

}

@end

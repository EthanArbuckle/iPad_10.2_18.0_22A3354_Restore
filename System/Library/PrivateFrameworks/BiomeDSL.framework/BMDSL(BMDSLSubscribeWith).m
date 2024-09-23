@implementation BMDSL(BMDSLSubscribeWith)

- (void)subscribeOn:()BMDSLSubscribeWith with:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AEB18000, log, OS_LOG_TYPE_FAULT, "subscribeOn:with: is no longer supported", v1, 2u);
}

@end

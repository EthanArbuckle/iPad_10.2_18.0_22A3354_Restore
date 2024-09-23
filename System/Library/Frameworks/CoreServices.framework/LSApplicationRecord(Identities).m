@implementation LSApplicationRecord(Identities)

- (void)identities
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "bundle has no personas in database?", v1, 2u);
}

@end

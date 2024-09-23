@implementation FMDFMIPManager(Private)

- (void)_postWipePrefPath
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9939000, log, OS_LOG_TYPE_FAULT, "Post wipe pref path could not obtain mobile's home directory", v1, 2u);
}

@end

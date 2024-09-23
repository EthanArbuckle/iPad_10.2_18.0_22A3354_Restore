@implementation CSAutobahnEnabledForPlatform

uint64_t __CSAutobahnEnabledForPlatform_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  result = CSFeatureEnabled(2 * ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  CSAutobahnEnabledForPlatform_enabled = result;
  return result;
}

@end

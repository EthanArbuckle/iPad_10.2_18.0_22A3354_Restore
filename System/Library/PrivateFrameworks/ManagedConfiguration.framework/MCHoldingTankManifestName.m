@implementation MCHoldingTankManifestName

void __MCHoldingTankManifestName_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(CFSTR("HoldingTankManifest.plist"), "copy");
  v1 = (void *)MCHoldingTankManifestName_str;
  MCHoldingTankManifestName_str = v0;

}

@end

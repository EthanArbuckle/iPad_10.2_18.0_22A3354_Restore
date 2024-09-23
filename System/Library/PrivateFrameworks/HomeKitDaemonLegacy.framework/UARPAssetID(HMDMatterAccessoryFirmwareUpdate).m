@implementation UARPAssetID(HMDMatterAccessoryFirmwareUpdate)

- (BOOL)isMatterAsset
{
  return (unint64_t)(objc_msgSend(a1, "type") - 15) < 2;
}

@end

@implementation UARPTLVTypes

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__UARPTLVTypes_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_sharedInstance;
}

void __30__UARPTLVTypes_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (UARPAssetTag)hsModel4cc
{
  char *v2;

  v2 = (char *)uarpAssetTagStructHeySiriModel();
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v2, v2[1], v2[2], v2[3]);
}

- (unint64_t)hsModelTlvModelType
{
  return 1619725824;
}

- (unint64_t)hsModelTlvModelLocale
{
  return 1619725825;
}

- (unint64_t)hsModelTlvModelHash
{
  return 1619725826;
}

- (unint64_t)hsModelTlvModelRole
{
  return 1619725827;
}

- (unint64_t)hsModelTlvModelDigest
{
  return 1619725828;
}

- (unint64_t)hsModelTlvModelSignature
{
  return 1619725829;
}

- (unint64_t)hsModelTlvModelCertificate
{
  return 1619725830;
}

- (unint64_t)hsModelTlvModelEngineVersion
{
  return 1619725831;
}

- (unint64_t)hsModelTlvModelEngineType
{
  return 1619725832;
}

- (unint64_t)hsModelEngineCompact
{
  return 0;
}

- (unint64_t)hsModelEngineNormal
{
  return 1;
}

- (unint64_t)hsModelDownloaded
{
  return 0;
}

- (unint64_t)hsModelPreInstalled
{
  return 1;
}

- (unint64_t)hsModelPrimary
{
  return 0;
}

- (unint64_t)hsModelFallback
{
  return 1;
}

@end

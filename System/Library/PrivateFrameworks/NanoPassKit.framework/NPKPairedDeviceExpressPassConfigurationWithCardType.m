@implementation NPKPairedDeviceExpressPassConfigurationWithCardType

BOOL __NPKPairedDeviceExpressPassConfigurationWithCardType_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "passInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cardType") == *(_QWORD *)(a1 + 32);

  return v4;
}

@end

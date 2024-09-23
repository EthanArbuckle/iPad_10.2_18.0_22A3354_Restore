@implementation NPKIdentifyDevicePaymentApplicationsForPass

void __NPKIdentifyDevicePaymentApplicationsForPass_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecureElementIdentifier:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(v4, "setState:", 1);

}

@end

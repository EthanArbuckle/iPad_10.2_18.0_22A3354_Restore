@implementation NTKAllAvailableFaceDescriptorsForDevice

void ___NTKAllAvailableFaceDescriptorsForDevice_block_invoke_2(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  NTKFaceDescriptor *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "isHardwareSpecific");
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKFaceDescriptor initWithBundleIdentifier:]([NTKFaceDescriptor alloc], "initWithBundleIdentifier:", v5);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

    v4 = v7;
  }

}

@end

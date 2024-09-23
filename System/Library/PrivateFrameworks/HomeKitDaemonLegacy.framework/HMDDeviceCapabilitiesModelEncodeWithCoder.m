@implementation HMDDeviceCapabilitiesModelEncodeWithCoder

void ____HMDDeviceCapabilitiesModelEncodeWithCoder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  NSSelectorFromString(v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "encodeBool:forKey:", objc_msgSend(v8, "BOOLValue"), v9);

  }
}

@end

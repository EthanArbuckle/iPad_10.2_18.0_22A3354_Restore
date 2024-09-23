@implementation HMDDeviceCapabilitiesModelDecodeWithCoder

void ____HMDDeviceCapabilitiesModelDecodeWithCoder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:", v8))
  {
    NSSelectorFromString(v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", v8));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v7, v5);

    }
  }

}

@end

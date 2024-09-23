@implementation HMAccessoryNumberSetting(HFAdditions)

- (uint64_t)hf_isBooleanSetting
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "maximumValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", &unk_1EA7CD240))
  {
    objc_msgSend(a1, "minimumValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqual:", &unk_1EA7CD258))
    {
      objc_msgSend(a1, "stepValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqual:", &unk_1EA7CD240);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

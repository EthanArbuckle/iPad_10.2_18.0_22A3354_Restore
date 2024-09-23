@implementation HMActionSet(HFHomeKitObjectConformance)

- (uint64_t)hf_isValidObject
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "actionSets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__HMActionSet_HFHomeKitObjectConformance__hf_isValidObject__block_invoke;
    v8[3] = &unk_1EA728840;
    v9 = v3;
    v5 = v3;
    v6 = objc_msgSend(v4, "na_any:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

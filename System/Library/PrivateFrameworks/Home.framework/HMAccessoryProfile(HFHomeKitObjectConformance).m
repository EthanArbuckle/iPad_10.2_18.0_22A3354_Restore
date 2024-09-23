@implementation HMAccessoryProfile(HFHomeKitObjectConformance)

- (id)hf_parentRoom
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isValidObject
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke;
    v9[3] = &unk_1EA727840;
    v10 = v4;
    v6 = v4;
    v7 = objc_msgSend(v5, "na_any:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)home
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

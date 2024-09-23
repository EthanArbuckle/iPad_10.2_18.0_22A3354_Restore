@implementation HMMediaSystem(HFHomeKitObjectConformance)

- (uint64_t)hf_isValidObject
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a1, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_61_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaSystems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__HMMediaSystem_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_2;
    v12[3] = &unk_1EA72CE40;
    v13 = v7;
    v9 = v7;
    v10 = objc_msgSend(v8, "na_any:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

@implementation HMMediaSystem(HFAdditions)

- (uint64_t)hf_fakeStereoPairNotFoundSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeStereoPairNotFoundSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeStereoPairGeneralSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeStereoPairGeneralSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fakeStereoPairVersionMismatchSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fakeStereoPairVersionMismatchSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)hf_fake8021xNetworkSymptom
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey(v2, CFSTR("fake8021xNetworkSymptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)hf_fakeDebugSymptoms
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "hf_fakeStereoPairVersionMismatchSymptom"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 8);
    objc_msgSend(v2, "addObject:", v3);

  }
  if (objc_msgSend(a1, "hf_fakeStereoPairGeneralSymptom"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 10);
    objc_msgSend(v2, "addObject:", v4);

  }
  if (objc_msgSend(a1, "hf_fakeStereoPairNotFoundSymptom"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 9);
    objc_msgSend(v2, "addObject:", v5);

  }
  if (objc_msgSend(a1, "hf_fake8021xNetworkSymptom"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 14);
    objc_msgSend(v2, "addObject:", v6);

  }
  objc_msgSend(a1, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HMMediaSystem_HFAdditions__hf_fakeDebugSymptoms__block_invoke;
  v10[3] = &unk_1EA72A2D8;
  v8 = v2;
  v11 = v8;
  objc_msgSend(v7, "na_each:", v10);

  return v8;
}

@end

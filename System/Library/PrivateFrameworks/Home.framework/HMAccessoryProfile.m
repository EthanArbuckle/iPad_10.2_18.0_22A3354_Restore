@implementation HMAccessoryProfile

void __65__HMAccessoryProfile_HFAdditions___profilesWithNonStandardTileUI__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378D20;
  qword_1ED378D20 = v0;

}

void __64__HMAccessoryProfile_AbstractionAdditions__hf_containedServices__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378CF0;
  qword_1ED378CF0 = v0;

}

void __71__HMAccessoryProfile_AbstractionAdditions__hf_containedCharacteristics__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378D00;
  qword_1ED378D00 = v0;

}

uint64_t __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_2;
  v15[3] = &unk_1EA7285B8;
  v16 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v4, "na_any:", v15);

  if ((v6 & 1) != 0
    || (objc_msgSend(v3, "mediaProfile"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "uniqueIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32)),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v3, "cameraProfiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_3;
    v13[3] = &unk_1EA72E998;
    v14 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v11, "na_any:", v13);

  }
  return v10;
}

uint64_t __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end

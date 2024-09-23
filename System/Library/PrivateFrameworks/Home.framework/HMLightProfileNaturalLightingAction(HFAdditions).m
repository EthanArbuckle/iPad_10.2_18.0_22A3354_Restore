@implementation HMLightProfileNaturalLightingAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  return 0;
}

- (id)hf_affectedAccessoryProfiles
{
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "lightProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_getAssociatedObject(a1, a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (objc_msgSend(a1, "lightProfile"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "containsObject:", v6),
          v6,
          (v7 & 1) == 0))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(a1, "lightProfile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(a1, a2, v10, (void *)0x301);
      v5 = v10;
    }
  }
  else
  {
    if (qword_1ED379B10 != -1)
      dispatch_once(&qword_1ED379B10, &__block_literal_global_21_11);
    v5 = (id)qword_1ED379B18;
  }
  return v5;
}

- (id)hf_affectedAccessoryRepresentables
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_setWithSafeObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

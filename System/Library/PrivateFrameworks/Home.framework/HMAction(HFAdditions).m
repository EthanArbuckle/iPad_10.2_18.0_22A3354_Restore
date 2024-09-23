@implementation HMAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  objc_class *v0;
  void *v1;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ has not implemented hf_affectedCharacteristic"), v1);

  return 0;
}

- (id)hf_affectedAccessoryProfiles
{
  objc_class *v0;
  void *v1;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ has not implemented hf_affectedAccessoryProfiles"), v1);

  if (_MergedGlobals_299 != -1)
    dispatch_once(&_MergedGlobals_299, &__block_literal_global_5_13);
  return (id)qword_1ED379AE8;
}

- (uint64_t)hf_isServiceLikeItemInvolved:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_7_13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "mediaProfileContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v14, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "profiles");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = v17;
  else
    v19 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v15, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_affectedAccessoryProfiles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_affectedCharacteristic");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v22) & 1) != 0 || (objc_msgSend(v21, "intersectsSet:", v11) & 1) != 0)
    v23 = 1;
  else
    v23 = objc_msgSend(v21, "intersectsSet:", v20);

  return v23;
}

- (id)hf_affectedAccessoryRepresentables
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ has not implemented %@"), v4, v5);

  if (qword_1ED379AF0 != -1)
    dispatch_once(&qword_1ED379AF0, &__block_literal_global_13_13);
  return (id)qword_1ED379AF8;
}

@end

@implementation HMAccessoryProfile(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;

  v4 = a1;
  if (a2 < 2)
  {
    if ((objc_msgSend(a1, "hf_isOnForContextType:", a2) & 1) == 0)
    {
      a3 = objc_msgSend(v4, "hf_hasSetForContextType:", a2) ^ 1;
      return a3 & 1;
    }
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    v5 = 2;
    return objc_msgSend(a1, "hf_isOnForContextType:", v5);
  }
  if (a2 == 3)
  {
    if (objc_msgSend(a1, "hf_hasSetForContextType:", 3))
    {
      a1 = v4;
      v5 = 3;
      return objc_msgSend(a1, "hf_isOnForContextType:", v5);
    }
LABEL_7:
    a3 = 1;
  }
  return a3 & 1;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_hasSetForContextType:", a3);

  return v5;
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isOnForContextType:", a3);

  return v5;
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_2;
    case 1:
      objc_msgSend(a1, "accessory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "hf_shouldHideForContextType:", 1);
      goto LABEL_6;
    case 2:
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(a1, "accessory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "home");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hf_currentUserIsRestrictedGuest");

        if ((v9 & 1) != 0)
          goto LABEL_10;
      }
      objc_msgSend(a1, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hf_isCamera");

      if ((v11 & 1) != 0)
      {
LABEL_10:
        v3 = 1;
      }
      else
      {
LABEL_2:
        if (_os_feature_enabled_impl())
        {
          objc_msgSend(a1, "accessory");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "home");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend(v6, "hf_currentUserIsRestrictedGuest");

LABEL_6:
        }
        else
        {
          v3 = 0;
        }
      }
      return v3 & 1;
    default:
      return v3 & 1;
  }
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("Accessory is nil for accessory profile %@!"), a1);
  objc_msgSend(a1, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_updateValue:forContextType:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

@end

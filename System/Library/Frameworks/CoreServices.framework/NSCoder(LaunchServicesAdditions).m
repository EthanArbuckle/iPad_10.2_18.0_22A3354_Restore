@implementation NSCoder(LaunchServicesAdditions)

- (id)ls_decodeArrayWithValuesOfClass:()LaunchServicesAdditions forKey:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObjects:", objc_opt_class(), a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _LSIsArrayWithValuesOfClasses(v9, v10);

    if ((v11 & 1) == 0)
    {

      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeArrayWithValuesOfClass:forKey:]", 210, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "failWithError:", v12);

      v9 = 0;
    }
  }
  return v9;
}

- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClasses:forKey:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v17[0] = objc_opt_class();
  v17[1] = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!a3)
    {
      if ((_LSIsDictionaryWithKeysAndValuesOfClasses(v12, 0, v8) & 1) != 0)
        goto LABEL_5;
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _LSIsDictionaryWithKeysAndValuesOfClasses(v12, v13, v8);

    if ((v14 & 1) == 0)
    {
LABEL_4:

      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:]", 241, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "failWithError:", v15);

      v12 = 0;
    }
  }
LABEL_5:

  return v12;
}

- (id)ls_decodeObjectOfClass:()LaunchServicesAdditions forKey:
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = a3;
  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithObjects:count:", &v10, 1);
  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x186DAE7A0]();
  if (_LSClassListContainsBundleRecord(v6))
  {
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[NSCoder(LaunchServicesAdditions) ls_decodeObjectOfClasses:forKey:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
    v17 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v17;
  }
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v6, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (v18 && (_LSIsKindOfClasses(v18, v6) & 1) == 0)
  {

    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeObjectOfClasses:forKey:]", 197, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v19);

    v18 = 0;
  }

  return v18;
}

- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClass:forKey:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  objc_msgSend(v8, "setWithObject:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", a3, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)ls_decodeSetWithValuesOfClass:()LaunchServicesAdditions forKey:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObjects:", objc_opt_class(), a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (_LSIsSetWithValuesOfClass(v9, a3) & 1) == 0)
  {

    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeSetWithValuesOfClass:forKey:]", 222, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v10);

    v9 = 0;
  }
  return v9;
}

- (void)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_182882000, a1, a3, "Caller wants to code a (maybe bundle) record object, so allowing coding the Core Types proxy too.", a5, a6, a7, a8, 0);
}

@end

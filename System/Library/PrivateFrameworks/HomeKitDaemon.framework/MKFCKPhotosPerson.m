@implementation MKFCKPhotosPerson

- (id)home
{
  void *v2;
  void *v3;

  -[MKFCKPhotosPerson user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MKFCKPhotosPerson;
  v10 = -[MKFCKPerson importIntoLocalModel:updatedProperties:context:](&v20, sel_importIntoLocalModel_updatedProperties_context_, v8, a4, v9);
  if (v10)
  {
    -[MKFCKPhotosPerson user](self, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchLocalModelWithContext:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "user");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if ((v14 & 1) == 0)
        objc_msgSend(v8, "setUser:", v12);
      -[MKFCKPhotosPerson linkedHomePerson](self, "linkedHomePerson");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchLocalModelWithContext:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "linkedHomePerson");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      if ((v18 & 1) == 0)
        objc_msgSend(v8, "setLinkedHomePerson:", v16);

    }
  }

  return v10;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isOwner") & 1) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)MKFCKPhotosPerson;
    if (!-[MKFCKPerson exportFromLocalModel:updatedProperties:context:](&v21, sel_exportFromLocalModel_updatedProperties_context_, v8, v9, v10))
    {
      v19 = 0;
      goto LABEL_16;
    }
    +[MKFCKModel fetchWithLocalModel:context:](MKFCKUser, "fetchWithLocalModel:context:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[MKFCKPhotosPerson user](self, "user");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v12);

      if ((v14 & 1) == 0)
        -[MKFCKPhotosPerson setUser:](self, "setUser:", v12);
      objc_msgSend(v8, "linkedHomePerson");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        +[MKFCKModel fetchWithLocalModel:context:](MKFCKHomePerson, "fetchWithLocalModel:context:", v15, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[MKFCKPhotosPerson linkedHomePerson](self, "linkedHomePerson");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = HMFEqualObjects();

          if ((v18 & 1) == 0)
            -[MKFCKPhotosPerson setLinkedHomePerson:](self, "setLinkedHomePerson:", v16);
        }

      }
    }

  }
  else
  {
    objc_msgSend(v10, "deleteObject:", self);
  }
  v19 = 1;
LABEL_16:

  return v19;
}

- (BOOL)validateUser:(id *)a3 error:(id *)a4
{
  id v7;
  char isKindOfClass;
  BOOL result;
  void *v10;
  MKFCKPhotosPerson *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport"))
    return 1;
  v7 = *a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v7)
      return 1;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *a3;
    v16 = 138543874;
    v17 = v13;
    v18 = 2114;
    v19 = CFSTR("user");
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("user"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v15;
  return result;
}

+ (id)rootKeyPath
{
  return CFSTR("user.home");
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKPhotosPerson"));
}

@end

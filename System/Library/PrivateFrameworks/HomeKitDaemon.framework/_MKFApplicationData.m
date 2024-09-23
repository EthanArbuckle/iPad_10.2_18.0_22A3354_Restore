@implementation _MKFApplicationData

- (NSUUID)hmd_parentModelID
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _Unwind_Exception *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = objc_opt_class();
  if ((HMDManagedObjectClassIsBSORepresentable(v3) & 1) == 0)
  {
    v8 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }
  objc_msgSend((id)objc_opt_class(), "hmd_parentAttributeKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__130524;
  v14 = __Block_byref_object_dispose__130525;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68___MKFApplicationData_HMDBackingStoreModelObject__hmd_parentModelID__block_invoke;
  v9[3] = &unk_24E7870B0;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
  v5 = (void *)v11[5];
  if (v5)
  {
    objc_msgSend(v5, "hmd_modelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return (NSUUID *)v6;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  _BOOL4 v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKFApplicationData;
  v5 = -[_MKFModel validateForInsertOrUpdate:](&v8, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    if (-[_MKFApplicationData hasValidContainer](self, "hasValidContainer"))
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", CFSTR("Must have exactly one container"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v6;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)hasValidContainer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[_MKFApplicationData hmd_parentAttributeKeyPaths](_MKFApplicationData, "hmd_parentAttributeKeyPaths", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        -[_MKFApplicationData valueForKeyPath:](self, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
    v10 = v6 == 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MKFApplicationDataDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFApplicationDataDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)appDataDictionaryForContainer:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setAppDataDictionary:(id)a3 forContainer:(id)a4
{
  id v6;
  _MKFApplicationData *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "applicationData");
  v7 = (_MKFApplicationData *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    if (!v7)
    {
      objc_msgSend(v6, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[_MKFApplicationData initWithContext:]([_MKFApplicationData alloc], "initWithContext:", v10);
      objc_msgSend(a1, "modelIDForParentRelationshipTo:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFApplicationData setModelID:](v7, "setModelID:", v11);

      v12 = (void *)objc_msgSend(v13, "copy");
      -[_MKFApplicationData setAppDataDictionary:](v7, "setAppDataDictionary:", v12);

      objc_msgSend(v6, "setApplicationData:", v7);
      goto LABEL_8;
    }
    -[_MKFApplicationData appDataDictionary](v7, "appDataDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_msgSend(v13, "copy");
      -[_MKFApplicationData setAppDataDictionary:](v7, "setAppDataDictionary:", v10);
LABEL_8:

    }
  }
  else if (v7)
  {
    objc_msgSend(v6, "setApplicationData:", 0);
    -[_MKFApplicationData managedObjectContext](v7, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteObject:", v7);
    goto LABEL_8;
  }

}

+ (id)modelIDForContainerUUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1880];
  v4 = a3;
  objc_msgSend(CFSTR("AppData"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_UUIDWithNamespace:data:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelIDForContainerUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)castIfApplicationDataContainer:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = castIfApplicationDataContainer___hmf_once_t0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&castIfApplicationDataContainer___hmf_once_t0, &__block_literal_global_191059);
  if (objc_msgSend((id)castIfApplicationDataContainer___hmf_once_v1, "objectConforms:", v4))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)hmd_parentAttributeKeyPaths
{
  if (hmd_parentAttributeKeyPaths__hmf_once_t3 != -1)
    dispatch_once(&hmd_parentAttributeKeyPaths__hmf_once_t3, &__block_literal_global_247_191045);
  return (id)hmd_parentAttributeKeyPaths__hmf_once_v4;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255875BC8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFApplicationData"));
}

@end

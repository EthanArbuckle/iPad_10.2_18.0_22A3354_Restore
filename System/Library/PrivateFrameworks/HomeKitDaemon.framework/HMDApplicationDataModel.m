@implementation HMDApplicationDataModel

+ (id)schemaHashRoot
{
  return CFSTR("3510B4A9-09DF-435C-B6C8-2B7A90888CE7");
}

+ (id)properties
{
  if (properties_onceToken_15357 != -1)
    dispatch_once(&properties_onceToken_15357, &__block_literal_global_122_15358);
  return (id)properties__properties_15359;
}

void __37__HMDApplicationDataModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("appDataDictionary");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_15359;
  properties__properties_15359 = v1;

}

- (id)cd_currentManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDApplicationDataModel;
    -[HMDBackingStoreModelObject cd_currentManagedObjectInContext:error:](&v12, sel_cd_currentManagedObjectInContext_error_, v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  Class v29;
  uint64_t v30;
  void *v31;
  void *v33;
  id v34;
  id obj;
  id *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    +[_MKFModel modelWithModelID:context:](_MKFHomeManager, "modelWithModelID:context:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDApplicationDataModel appDataDictionary](self, "appDataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("com.apple.homekit-entitledclient.identifer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAppDataDictionary:", v12);

    v13 = 1;
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)HMDApplicationDataModel;
    -[HMDBackingStoreModelObject cd_currentManagedObjectInContext:error:](&v41, sel_cd_currentManagedObjectInContext_error_, v6, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14 != 0;
    if (v14)
    {
      v36 = a4;
      -[HMDApplicationDataModel appDataDictionary](self, "appDataDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("com.apple.homekit-entitledclient.identifer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAppDataDictionary:", v16);

      -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      +[_MKFApplicationData hmd_parentAttributeKeyPaths](_MKFApplicationData, "hmd_parentAttributeKeyPaths");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v38;
        v33 = v7;
        v34 = v6;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(obj);
            v22 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v14, "valueForKeyPath:", v22);
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v26 = (void *)v23;
LABEL_18:

              v7 = v33;
              v6 = v34;
              v13 = v14 != 0;
              goto LABEL_19;
            }
            objc_msgSend(v14, "entity");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "relationshipsByName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              _HMFPreconditionFailure();
LABEL_23:
              _HMFPreconditionFailure();
            }
            objc_msgSend(v26, "destinationEntity");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "managedObjectClassName");
            v28 = (NSString *)objc_claimAutoreleasedReturnValue();
            v29 = NSClassFromString(v28);

            if (!v29)
              goto LABEL_23;
            +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v17, v29, v36);
            v30 = objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v31 = (void *)v30;
              objc_msgSend(v14, "setValue:forKey:", v30, v22);

              goto LABEL_18;
            }

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          v7 = v33;
          v6 = v34;
          v13 = v14 != 0;
          if (v19)
            continue;
          break;
        }
      }
LABEL_19:

    }
  }

  return v13;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ is unavailable"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("appDataDictionary")))
  {
    objc_msgSend(v10, "appDataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    wrapAppDataDictionary(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = (void *)*MEMORY[0x24BDBD430];
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDApplicationDataModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v17, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v10, v8, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)cd_childrenExcluding:(id)a3 fromContext:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set", a3, a4, a5);
}

+ (NSString)cd_parentReferenceName
{
  return 0;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)cd_modelWithMKFHomeManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMDApplicationDataModel *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "appDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "modelID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFApplicationData modelIDForContainerUUID:](_MKFApplicationData, "modelIDForContainerUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:]([HMDApplicationDataModel alloc], "initWithUUID:parentUUID:", v6, v5);
    wrapAppDataDictionary(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDApplicationDataModel setAppDataDictionary:](v7, "setAppDataDictionary:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

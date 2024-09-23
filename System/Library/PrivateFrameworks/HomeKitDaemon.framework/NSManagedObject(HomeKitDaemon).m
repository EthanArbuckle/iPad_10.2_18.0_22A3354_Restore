@implementation NSManagedObject(HomeKitDaemon)

- (uint64_t)hmd_validateUUID:()HomeKitDaemon key:error:
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", v8, v7, a5);

  return v9;
}

- (uint64_t)hmd_validateNumber:()HomeKitDaemon key:error:
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(), "hmd_validateNumber:key:error:", v8, v7, a5);

  return v9;
}

- (uint64_t)hmd_validateCharacteristicValue:()HomeKitDaemon key:error:
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(), "hmd_validateCharacteristicValue:key:error:", v8, v7, a5);

  return v9;
}

- (id)hmd_debugIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hmd_debugIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)mkf_createRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:relationship:relation:
{
  id v12;
  NSString *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint64_t v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(a1, "entity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "relationshipsByName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(a1, "valueForKey:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  NSProtocolFromString(v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __createNewObject(a1, +[HMCContext managedObjectClassFromProtocol:](HMCContext, "managedObjectClassFromProtocol:", v18), v15, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isToMany"))
  {
    objc_msgSend(a1, "setValue:forKey:", v19, v12);
    goto LABEL_9;
  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v20, "addObject:", v19);
    objc_msgSend(a1, "setValue:forKey:", v20, v12);

LABEL_9:
    return v19;
  }
  v24 = _HMFPreconditionFailure();
  return (id)-[NSManagedObject(HomeKitDaemon) mkf_createRelationOnProperty:modelProtocol:keyValue:](v24);
}

- (uint64_t)mkf_createRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:
{
  return objc_msgSend(a1, "mkf_createRelationOnProperty:modelProtocol:keyValue:relationship:relation:", a3, a4, a5, 0, 0);
}

- (id)mkf_materializeOrCreateRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:createdNew:
{
  id v10;
  NSString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  NSString *v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relationshipsByName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    _HMFPreconditionFailure();
LABEL_30:
    _HMFPreconditionFailure();
LABEL_31:
    _HMFPreconditionFailure();
LABEL_32:
    _HMFPreconditionFailure();
    goto LABEL_33;
  }
  if (a6)
    *a6 = 0;
  NSProtocolFromString(v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[HMCContext managedObjectClassFromProtocol:](HMCContext, "managedObjectClassFromProtocol:", v16);
  objc_msgSend(a1, "valueForKey:", v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isToMany"))
  {
    v35 = v11;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      v34 = a6;
      v21 = v10;
      v22 = v16;
      -[objc_class entity](v17, "entity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      __keyNameForEntity(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      __findObjectInSet(v20, v24, v12, (uint64_t)v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {

        v11 = v35;
        v16 = v22;
        v10 = v21;
LABEL_24:

        return v25;
      }
      v16 = v22;
      v10 = v21;
      a6 = v34;
      v11 = v35;
LABEL_21:
      if (!a6)
      {
LABEL_23:
        objc_msgSend(a1, "mkf_createRelationOnProperty:modelProtocol:keyValue:relationship:relation:", v10, v11, v12, v15, v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
LABEL_22:
      *a6 = 1;
      goto LABEL_23;
    }
    goto LABEL_30;
  }
  if (v12)
  {
    if (!v18)
      goto LABEL_21;
    v26 = v16;
    objc_msgSend(v18, "entity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    __keyNameForEntity(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "valueForKey:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqual:", v12);

    if ((v30 & 1) != 0)
    {
      v18 = v18;

      v25 = v18;
      v16 = v26;
      goto LABEL_24;
    }
    goto LABEL_31;
  }
  if (v18)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", v17) & 1) != 0)
    {
      v18 = v18;
      v25 = v18;
      goto LABEL_24;
    }
    goto LABEL_32;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class modelIDForParentRelationshipTo:](v17, "modelIDForParentRelationshipTo:", a1);
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v12 = (id)v32;
      v18 = 0;
      if (!a6)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
LABEL_33:
  v33 = _HMFPreconditionFailure();
  return (id)-[NSManagedObject(HomeKitDaemon) mkf_synchronizeRelation:items:allowCreation:](v33);
}

- (BOOL)mkf_synchronizeRelation:()HomeKitDaemon items:allowCreation:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  void *v25;
  _Unwind_Exception *v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t *v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[4];
  id v40;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relationshipsByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_msgSend(v12, "isToMany") & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  objc_msgSend(a1, "valueForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (!v16)
  {
LABEL_14:
    v27 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v35, 8);
    _Unwind_Resume(v27);
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke;
  v39[3] = &unk_24E78AB28;
  v20 = v18;
  v40 = v20;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v39);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_2;
  v28[3] = &unk_24E77C648;
  v21 = v20;
  v34 = a5;
  v29 = v21;
  v30 = a1;
  v22 = v12;
  v31 = v22;
  v33 = &v35;
  v23 = v17;
  v32 = v23;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);
  v24 = *((unsigned __int8 *)v36 + 24);
  if (*((_BYTE *)v36 + 24))
  {
    objc_msgSend(v21, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &__block_literal_global_49334);

    if ((objc_msgSend(v23, "isEqualToSet:", v16) & 1) == 0)
      objc_msgSend(a1, "setValue:forKey:", v23, v8);
  }

  _Block_object_dispose(&v35, 8);
  return v24 != 0;
}

- (void)mkf_addToRelationship:()HomeKitDaemon object:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  char v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v6 = a4;
  objc_msgSend(a1, "valueForKey:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = v11;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v12)
  {
    objc_msgSend(a1, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "relationshipsByName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "destinationEntity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "managedObjectClassName");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v18);
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v12, "addObject:", v6);
      objc_msgSend(a1, "setValue:forKey:", v12, v21);

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v20 = _HMFPreconditionFailure();
  -[NSManagedObject(HomeKitDaemon) mkf_removeFromRelationship:object:](v20);
}

- (void)mkf_removeFromRelationship:()HomeKitDaemon object:
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "valueForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v8)
  {
    objc_msgSend(v8, "removeObject:", v6);
    objc_msgSend(a1, "setValue:forKey:", v8, v9);
  }

}

- (__CFString)mkf_findRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  NSProtocolFromString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[HMCContext managedObjectClassFromProtocol:](HMCContext, "managedObjectClassFromProtocol:", v11);
  -[objc_class entity](v12, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __keyNameForEntity(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "valueForKey:", v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v15 && !v17)
  {
    v20 = (void *)_HMFPreconditionFailure();
    return __keyNameForEntity(v20);
  }
  else
  {
    __findObjectInSet(v17, v14, v10, (uint64_t)v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    return (__CFString *)v18;
  }
}

+ (id)hmd_errorForInvalidValue:()HomeKitDaemon key:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  NSStringFromClass(a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@ is invalid: %@"), v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)hmd_validateUUID:()HomeKitDaemon key:error:
{
  id v8;
  id v9;
  uint64_t v10;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  v10 = objc_opt_isKindOfClass() & (v8 != 0);
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(a1, "hmd_errorForInvalidValue:key:", v8, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (uint64_t)hmd_validateNumber:()HomeKitDaemon key:error:
{
  id v8;
  id v9;
  uint64_t v10;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  v10 = objc_opt_isKindOfClass() & (v8 != 0);
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(a1, "hmd_errorForInvalidValue:key:", v8, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (uint64_t)hmd_validateCharacteristicValue:()HomeKitDaemon key:error:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  v10 = isAllowedCharType();
  v11 = v10;
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(a1, "hmd_errorForInvalidValue:key:", v8, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end

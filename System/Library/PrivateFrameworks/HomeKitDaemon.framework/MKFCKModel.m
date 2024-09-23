@implementation MKFCKModel

- (BOOL)shouldSkipValidationDuringImport
{
  void *v2;
  BOOL v3;

  -[MKFCKModel managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmd_transactionAuthor") == 0;

  return v3;
}

- (BOOL)isFake
{
  void *v2;
  unsigned int v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[MKFCKModel flags](self, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  objc_msgSend(v2, "getUUIDBytes:", &v6);
  v3 = BYTE5(v7);

  return (v3 >> 3) & 1;
}

- (void)convertToFakeModel
{
  id v3;

  if (!-[MKFCKModel isFake](self, "isFake"))
  {
    _generateFlags(1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[MKFCKModel setFlags:](self, "setFlags:", v3);

  }
}

- (BOOL)copyPropertiesIntoLocalModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  objc_msgSend(v5, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__MKFCKModel_copyPropertiesIntoLocalModel_context___block_invoke;
  v10[3] = &unk_24E78C050;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

  return 1;
}

- (BOOL)shouldExportUpdatedPropertyInSet:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "hmf_isEmpty") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__MKFCKModel_shouldExportUpdatedPropertyInSet_name___block_invoke;
    v9[3] = &unk_24E798868;
    v10 = v6;
    v11 = &v12;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

- (BOOL)copyPropertiesFromLocalModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MKFCKModel *v12;

  v5 = a3;
  objc_msgSend(v5, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__MKFCKModel_copyPropertiesFromLocalModel_context___block_invoke;
  v10[3] = &unk_24E78C050;
  v11 = v5;
  v12 = self;
  v8 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

  return 1;
}

- (id)relationshipForLocalName:(id)a3 localModel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  objc_msgSend(a4, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relationshipsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cloudSyncKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cloudSyncInclude"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      objc_msgSend(v9, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  -[MKFCKModel entity](self, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relationshipsByName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MKFCKModel objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmd_debugIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKModel modelID](self, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MKFCKModel isFake](self, "isFake");
  v8 = "";
  if (v7)
    v8 = " [FAKE]";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@%s>"), v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)MKFCKModel;
  -[HMDManagedObject debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MKFCKModel isFake](self, "isFake");
  v6 = "";
  if (v5)
    v6 = " [FAKE]";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%s"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MKFCKModel objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmd_debugIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKModel modelID](self, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = -[MKFCKModel isFake](self, "isFake");
  v9 = "";
  if (v8)
    v9 = " [FAKE]";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %lu%s>"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hmd_debugIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MKFCKModel;
  -[NSManagedObject hmd_debugIdentifier](&v8, sel_hmd_debugIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKModel modelID](self, "modelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKFCKModel;
  -[MKFCKModel awakeFromInsert](&v4, sel_awakeFromInsert);
  _generateFlags(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKModel setPrimitiveFlags:](self, "setPrimitiveFlags:", v3);

}

- (void)didTurnIntoFault
{
  NSNumber *canonical;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKFCKModel;
  -[MKFCKModel didTurnIntoFault](&v4, sel_didTurnIntoFault);
  canonical = self->_canonical;
  self->_canonical = 0;

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MKFCKModel;
  -[MKFCKModel willSave](&v11, sel_willSave);
  -[MKFCKModel writerTimestamp](self, "writerTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[MKFCKModel isDeleted](self, "isDeleted") & 1) == 0
    && (!v3 || -[MKFCKModel hasChanges](self, "hasChanges")))
  {
    -[MKFCKModel writerVersion](self, "writerVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKModel changedValues](self, "changedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (!v3 || v6 || !v4)
    {
      if (!v3
        || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("writerTimestamp")),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            !v7))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKModel setWriterTimestamp:](self, "setWriterTimestamp:", v8);

      }
      if (!v4
        || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("writerVersion")),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            !v9))
      {
        MKFCKModelCurrentWriterVersionString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqualToString:", v10) & 1) == 0)
          -[MKFCKModel setWriterVersion:](self, "setWriterVersion:", v10);

      }
    }

  }
}

- (id)fetchLocalModelWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  MKFCKModel *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MKFCKModel entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:](HMDCoreDataCloudTransform, "localTransformableEntityFromEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBB678];
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  -[MKFCKModel modelID](self, "modelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithModelID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v12);

  v27[0] = CFSTR("modelID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v13);

  v22 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v9, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  if (!v14)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local models: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    goto LABEL_7;
  }
  if (!objc_msgSend(v14, "count"))
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v14, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v16;
}

- (id)createLocalModelWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MKFCKModel entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:](HMDCoreDataCloudTransform, "localTransformableEntityFromEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB698]), "initWithEntity:insertIntoManagedObjectContext:", v6, v4);
  v8 = v7;
  -[MKFCKModel modelID](self, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModelID:", v9);

  -[MKFCKModel writerTimestamp](self, "writerTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWriterTimestamp:", v10);

  return v8;
}

- (BOOL)isDeletedLocallyWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "hmd_coreData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKModel entity](self, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:](HMDCoreDataCloudTransform, "localTransformableEntityFromEntity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKModel modelID](self, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v6, "hmd_modelWasDeletedWithID:modelIDKey:entity:duration:context:", v9, CFSTR("modelID"), v8, v4, 0.0);

  return (char)v7;
}

- (int64_t)ensureCanonicalModel
{
  MKFCKModel *v2;
  uint64_t v3;
  NSNumber *canonical;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  MKFCKModel *v15;
  unint64_t v16;
  void *v17;
  MKFCKModel *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  MKFCKModel *v22;
  void *v23;
  MKFCKModel *v24;
  NSObject *v25;
  id v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  MKFCKModel *v30;
  NSObject *v31;
  void *v32;
  MKFCKModel *v33;
  void *v34;
  MKFCKModel *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  MKFCKModel *v39;
  BOOL v40;
  MKFCKModel *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  MKFCKModel *v47;
  void *v48;
  MKFCKModel *v49;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  MKFCKModel *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  MKFCKModel *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  MKFCKModel *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  MKFCKModel *v77;
  MKFCKModel *v78;
  id obj;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  uint8_t buf[4];
  id v88;
  __int16 v89;
  MKFCKModel *v90;
  __int16 v91;
  MKFCKModel *v92;
  __int16 v93;
  MKFCKModel *v94;
  _BYTE v95[24];
  void *v96;
  MKFCKModel *v97;
  MKFCKModel *v98;
  uint64_t v99;

  v2 = self;
  v99 = *MEMORY[0x24BDAC8D0];
  v3 = 64;
  canonical = self->_canonical;
  if (!canonical)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    if ((-[MKFCKModel isDeleted](v2, "isDeleted") & 1) != 0)
    {
      v6 = -2;
LABEL_64:
      objc_msgSend(v5, "numberWithInteger:", v6);
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = *(Class *)((char *)&v2->super.super.super.isa + v3);
      *(Class *)((char *)&v2->super.super.super.isa + v3) = (Class)v68;

      canonical = *(NSNumber **)((char *)&v2->super.super.super.isa + v3);
      return -[NSNumber integerValue](canonical, "integerValue");
    }
    -[MKFCKModel objectID](v2, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistentStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKModel managedObjectContext](v2, "managedObjectContext");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "hmd_coreData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend((id)objc_opt_class(), "cloudStoreTypes");
    objc_msgSend(v9, "cloudPrivateStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v11)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(v9, "cloudSharedStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 2 * (v8 == v12);

    }
    v78 = v2;
    if ((v13 & v10) == 0)
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v2;
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v27 = off_24E78A998[v13];
        v28 = off_24E78A9B0[v10 & 3];
        *(_DWORD *)buf = 138544130;
        v88 = v26;
        v89 = 2114;
        v90 = (MKFCKModel *)v27;
        v91 = 2114;
        v92 = (MKFCKModel *)v28;
        v93 = 2112;
        v94 = v24;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring model in %{public}@ store, should be in %{public}@ store: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v23);
      v6 = -2;
      v2 = v78;
      goto LABEL_63;
    }
    objc_msgSend((id)objc_opt_class(), "rootKeyPath");
    v14 = objc_claimAutoreleasedReturnValue();
    v80 = (void *)v14;
    if (v14)
    {
      -[MKFCKModel valueForKeyPath:](v2, "valueForKeyPath:", v14);
      v15 = (MKFCKModel *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v2;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v88 = v32;
          v89 = 2112;
          v90 = v30;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring model without an associated root: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        v33 = 0;
        v6 = 0;
        goto LABEL_62;
      }
      v77 = v15;
      v16 = -[MKFCKModel ensureCanonicalModel](v15, "ensureCanonicalModel");
      v6 = v16;
      if (v16 >= 0xFFFFFFFFFFFFFFFELL)
      {
        if ((-[MKFCKModel isDeleted](v2, "isDeleted") & 1) == 0 && v13 == 1)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = v2;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v72 = v5;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKFCKModel debugDescription](v18, "debugDescription");
            v21 = v9;
            v22 = (MKFCKModel *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v88 = v20;
            v89 = 2112;
            v90 = v77;
            v91 = 2112;
            v92 = v18;
            v93 = 2112;
            v94 = v22;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Deleting model associated with non-canonical root %@: %@\n%@", buf, 0x2Au);

            v9 = v21;
            v5 = v72;
          }

          objc_autoreleasePoolPop(v17);
          objc_msgSend(v81, "deleteObject:", v18);
        }
LABEL_61:
        v33 = v77;
LABEL_62:

LABEL_63:
        goto LABEL_64;
      }
      if (!v16)
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = v2;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v88 = v37;
          v89 = 2112;
          v90 = v77;
          v91 = 2112;
          v92 = v35;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring model while status of associated root %@ is not known: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v34);
        v6 = 0;
        goto LABEL_61;
      }

    }
    v86 = 0;
    -[MKFCKModel fetchEquivalentModels:](v2, "fetchEquivalentModels:", &v86);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v38;
    v77 = (MKFCKModel *)v86;
    if (v38)
    {
      if (objc_msgSend(v38, "count") == 1
        && (objc_msgSend(v38, "firstObject"),
            v39 = (MKFCKModel *)objc_claimAutoreleasedReturnValue(),
            v39,
            v40 = v39 == v2,
            v38 = v76,
            v40))
      {
        v6 = 1;
      }
      else
      {
        v74 = v9;
        v75 = v8;
        +[MKFCKModel canonicalModelForModels:context:](MKFCKModel, "canonicalModelForModels:context:", v38, v81);
        v41 = (MKFCKModel *)objc_claimAutoreleasedReturnValue();
        if (v13 == 1)
        {
          v71 = 64;
          v73 = v5;
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          obj = v76;
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
          v43 = v80;
          if (v42)
          {
            v44 = v42;
            v45 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(_QWORD *)v83 != v45)
                  objc_enumerationMutation(obj);
                v47 = *(MKFCKModel **)(*((_QWORD *)&v82 + 1) + 8 * i);
                if (v47 != v41)
                {
                  v48 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "willAccessValueForKey:", 0));
                  v49 = v2;
                  HMFGetOSLogHandle();
                  v50 = objc_claimAutoreleasedReturnValue();
                  v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
                  if (v43)
                  {
                    if (v51)
                    {
                      HMFGetLogIdentifier();
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MKFCKModel debugDescription](v47, "debugDescription");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v95 = 138543874;
                      *(_QWORD *)&v95[4] = v52;
                      *(_WORD *)&v95[12] = 2112;
                      *(_QWORD *)&v95[14] = v47;
                      *(_WORD *)&v95[22] = 2112;
                      v96 = v53;
                      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Merging model with non-unique modelID: %@\n%@", v95, 0x20u);

                      v2 = v78;
                    }

                    objc_autoreleasePoolPop(v48);
                    v54 = v47;
                    if (v41)
                    {
                      -[MKFCKModel entity](v41, "entity");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v55, "relationshipsByName");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_QWORD *)v95 = MEMORY[0x24BDAC760];
                      *(_QWORD *)&v95[8] = 3221225472;
                      *(_QWORD *)&v95[16] = __46__MKFCKModel_mergeRelationshipsFromDuplicate___block_invoke;
                      v96 = &unk_24E78A930;
                      v97 = v41;
                      v98 = v54;
                      objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v95);

                    }
                    v43 = v80;
                  }
                  else
                  {
                    if (v51)
                    {
                      HMFGetLogIdentifier();
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MKFCKModel debugDescription](v47, "debugDescription");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v95 = 138543874;
                      *(_QWORD *)&v95[4] = v57;
                      *(_WORD *)&v95[12] = 2112;
                      *(_QWORD *)&v95[14] = v47;
                      *(_WORD *)&v95[22] = 2112;
                      v96 = v58;
                      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Deleting model with non-unique modelID: %@\n%@", v95, 0x20u);

                      v2 = v78;
                      v43 = v80;
                    }

                    objc_autoreleasePoolPop(v48);
                  }
                  objc_msgSend(v81, "deleteObject:", v47, v71);
                }
              }
              v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
            }
            while (v44);
          }

          v3 = v71;
          v5 = v73;
        }
        v59 = (void *)MEMORY[0x227676638](-[MKFCKModel willAccessValueForKey:](v41, "willAccessValueForKey:", 0, v71));
        v60 = v2;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKFCKModel debugDescription](v41, "debugDescription");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v95 = 138543874;
          *(_QWORD *)&v95[4] = v62;
          *(_WORD *)&v95[12] = 2112;
          *(_QWORD *)&v95[14] = v41;
          *(_WORD *)&v95[22] = 2112;
          v96 = v63;
          _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Determined canonical model: %@\n%@", v95, 0x20u);

          v2 = v78;
        }

        objc_autoreleasePoolPop(v59);
        if (v41 == v60)
          v6 = 1;
        else
          v6 = -1;

        v9 = v74;
        v8 = v75;
      }
    }
    else
    {
      v64 = (void *)MEMORY[0x227676638]();
      v65 = v2;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v88 = v67;
        v89 = 2112;
        v90 = v65;
        v91 = 2114;
        v92 = v77;
        _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch equivalent models for %@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v64);
      v6 = 0;
    }

    goto LABEL_61;
  }
  return -[NSNumber integerValue](canonical, "integerValue");
}

- (id)predicateMatchingEquivalentModels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  -[MKFCKModel modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("modelID"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "rootKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1758];
    -[MKFCKModel valueForKeyPath:](self, "valueForKeyPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD14C0];
    v13[0] = v4;
    v13[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

- (id)fetchEquivalentModels:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKModel predicateMatchingEquivalentModels](self, "predicateMatchingEquivalentModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend((id)objc_opt_class(), "defaultPreloadedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v7);

  -[MKFCKModel objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAffectedStores:", v10);

  objc_msgSend(v5, "execute:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonical, 0);
}

void __46__MKFCKModel_mergeRelationshipsFromDuplicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isToMany") & 1) != 0)
  {
    v6 = objc_msgSend(v5, "isOrdered");
    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v7, "mutableOrderedSetValueForKey:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "array");
    }
    else
    {
      objc_msgSend(v7, "mutableSetValueForKey:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allObjects");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v12);

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v8, v13);
LABEL_8:

  }
}

void __51__MKFCKModel_copyPropertiesFromLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  id v17;

  v17 = a2;
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncInclude")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "BOOLValue"),
        v15,
        v16)
    && (v6 = v17) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncTransformer"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transformedValue:", v7);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncSkipIfNil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (!v12 || v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if ((v14 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v7, v6);
    }

  }
}

void __52__MKFCKModel_shouldExportUpdatedPropertyInSet_name___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __51__MKFCKModel_copyPropertiesIntoLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  id v17;

  v17 = a2;
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncInclude")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "BOOLValue"),
        v15,
        v16)
    && (v6 = v17) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncTransformer"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reverseTransformedValue:", v7);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudSyncSkipIfNil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (!v12 || v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if ((v14 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v7, v17);
    }

  }
}

+ (unint64_t)cloudStoreTypes
{
  return 3;
}

+ (NSString)rootKeyPath
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (NSArray)defaultPreloadedProperties
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("modelID");
  v3[1] = CFSTR("flags");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)appendDefaultPreloadedPropertiesTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "defaultPreloadedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v5);
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateWithModelID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("modelID"), a3);
}

+ (id)predicateWithModelIDs:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("modelID"), a3);
}

+ (id)modelWithObjectID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "defaultPreloadedProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5)
      goto LABEL_7;
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fetched object is not of the expected type: %@"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmErrorWithCode:description:reason:suggestion:", 22, 0, v13, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    a5 = 0;
    goto LABEL_7;
  }
  a5 = v11;
LABEL_7:

  return a5;
}

+ (id)modelWithModelID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateWithModelID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(a1, "defaultPreloadedProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v12);

  objc_msgSend(v10, "setFetchBatchSize:", 1);
  v21 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v10, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (v13)
  {
    objc_msgSend(v13, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v19;
      v24 = 2160;
      v25 = 1752392040;
      v26 = 2112;
      v27 = v8;
      v28 = 2114;
      v29 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch model with ID %{mask.hash}@: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v14);
  }

  return v15;
}

+ (id)logCategory
{
  return +[HMDCoreDataCloudTransform logCategory](HMDCoreDataCloudTransform, "logCategory");
}

+ (id)fetchWithLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateWithModelID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v10);

  objc_msgSend(a1, "defaultPreloadedProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v11);

  v20 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (!v12)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud models: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    goto LABEL_7;
  }
  if (!objc_msgSend(v12, "count"))
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v14;
}

+ (id)createWithLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v7);

  objc_msgSend(v9, "setModelID:", v8);
  return v9;
}

+ (id)canonicalModelForModels:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_coreData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__160483;
  v24 = __Block_byref_object_dispose__160484;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__160483;
  v18[4] = __Block_byref_object_dispose__160484;
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__MKFCKModel_canonicalModelForModels_context___block_invoke;
  v13[3] = &unk_24E78A958;
  v10 = v9;
  v14 = v10;
  v15 = &v20;
  v16 = v18;
  v17 = a1;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  v11 = (id)v21[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

+ (id)mergedDictionaryFromCloud:(id)a3 localModifications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v5);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__MKFCKModel_mergedDictionaryFromCloud_localModifications___block_invoke;
    v12[3] = &unk_24E796DA0;
    v13 = v8;
    v9 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
    v10 = (id)objc_msgSend(v9, "copy");

  }
  else
  {
    v10 = v6;
  }
  objc_autoreleasePoolPop(v7);

  return v10;
}

uint64_t __59__MKFCKModel_mergedDictionaryFromCloud_localModifications___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __46__MKFCKModel_canonicalModelForModels_context___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MKFCKModel *v18;
  SEL v19;
  id *v20;
  id *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordIDForManagedObjectID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    goto LABEL_12;
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    if (!v7)
      goto LABEL_13;
    v9 = objc_msgSend(v8, "compareToRecordID:", v7);
    if (v9 == 1)
      goto LABEL_13;
    if (!v9)
    {
      v8 = (void *)_HMFPreconditionFailureWithFormat();
      goto LABEL_7;
    }
LABEL_12:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
LABEL_13:

    return;
  }
LABEL_7:
  if (v7)
    goto LABEL_12;
  v10 = (void *)MEMORY[0x227676638](v8);
  v11 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543874;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Comparing multiple candidate models without a CKRecordID: %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:", v16);

  if (v17 == 1)
    goto LABEL_13;
  if (v17)
    goto LABEL_12;
  v18 = (MKFCKModel *)_HMFPreconditionFailureWithFormat();
  -[MKFCKModel validateModelID:error:](v18, v19, v20, v21);
}

- (BOOL)validateModelID:(id *)a3 error:(id *)a4
{
  void *v8;
  MKFCKModel *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport")
    || (objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, CFSTR("modelID"), a4) & 1) != 0)
  {
    return 1;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *a3;
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = CFSTR("modelID");
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  return 0;
}

- (BOOL)validateWriterTimestamp:(id *)a3 error:(id *)a4
{
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  MKFCKModel *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport"))
    return 1;
  v8 = *a3;
  if (!*a3)
  {
    if ((-[MKFCKModel isInserted](self, "isInserted") & 1) != 0)
      return 1;
    v8 = *a3;
  }
  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v7 = v11 != 0;
  if (!v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *a3;
      v18 = 138543874;
      v19 = v15;
      v20 = 2114;
      v21 = CFSTR("writerTimestamp");
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("writerTimestamp"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)validateWriterVersion:(id *)a3 error:(id *)a4
{
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  MKFCKModel *v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  MKFCKModel *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport"))
    return 1;
  v8 = *a3;
  if (!*a3)
  {
    if ((-[MKFCKModel isInserted](self, "isInserted") & 1) != 0)
      return 1;
    v8 = *a3;
  }
  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
    goto LABEL_15;
  MKFCKModelCurrentWriterVersionString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_14;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKModel modelID](v15, "modelID");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    v19 = *a3;
    MKFCKModelCurrentWriterVersionString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    v33 = 2112;
    v34 = v19;
    v14 = v28;
    v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Object with modelID %@ has writerVersion %@ that doesn't match current writer version %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", *a3);

  if (v21)
  {
LABEL_14:
    v7 = 1;
  }
  else
  {
LABEL_15:
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *a3;
      *(_DWORD *)buf = 138543874;
      v30 = v25;
      v31 = 2114;
      v32 = CFSTR("writerVersion");
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("writerVersion"));
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)validateFlags:(id *)a3 error:(id *)a4
{
  void *v8;
  MKFCKModel *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport")
    || (objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, CFSTR("flags"), a4) & 1) != 0)
  {
    return 1;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *a3;
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = CFSTR("flags");
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  return 0;
}

@end

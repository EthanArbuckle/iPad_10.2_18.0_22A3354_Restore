@implementation HMDCoreDataCloudTransformChangeSet

- (id)inserts
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (id)updates
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)processChange:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    objc_msgSend(v3, "changedObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "changeType");
    if (v5 == 2)
    {
      objc_msgSend(v7, "tombstone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoreDataCloudTransformChangeSet processDelete:tombstone:](a1, v4, v6);
    }
    else
    {
      if (v5 != 1)
      {
        if (!v5)
          objc_msgSend(a1[1], "addObject:", v4);
        goto LABEL_9;
      }
      objc_msgSend(v7, "updatedProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoreDataCloudTransformChangeSet processUpdate:updatedProperties:]((uint64_t)a1, v4, v6);
    }

LABEL_9:
    v3 = v7;
  }

}

- (void)processUpdate:(void *)a3 updatedProperties:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1 && (objc_msgSend(*(id *)(a1 + 8), "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "unionSet:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v8, v9);

    }
  }

}

- (void)processDelete:(void *)a3 tombstone:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (a1)
  {
    if (objc_msgSend(a1[1], "containsObject:", v10))
    {
      objc_msgSend(a1[1], "removeObject:", v10);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;

      if (v8)
        objc_msgSend(a1[5], "addObject:", v8);
      objc_msgSend(a1[2], "setObject:forKeyedSubscript:", 0, v10);
      if (v5)
        v9 = v5;
      else
        v9 = (id)MEMORY[0x24BDBD1B8];
      objc_msgSend(a1[3], "setObject:forKeyedSubscript:", v9, v10);

    }
  }

}

- (id)initWithHomeModelID:(void *)a3 clientIdentifier:(void *)a4 qualityOfService:
{
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  objc_super v20;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)HMDCoreDataCloudTransformChangeSet;
    v10 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 6, a2);
      objc_storeStrong(a1 + 8, a3);
      a1[7] = a4;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = a1[1];
      a1[1] = (id)v11;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[2];
      a1[2] = (id)v13;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = a1[3];
      a1[3] = (id)v15;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = a1[5];
      a1[5] = (id)v17;

    }
  }

  return a1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSMutableSet *inserts;
  id v6;
  void *v7;
  NSMutableDictionary *updates;
  id v9;
  void *v10;
  NSMutableDictionary *deletes;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  int64_t qualityOfService;
  NSUUID *homeModelID;
  NSString *v18;
  NSUUID *v19;
  __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableSet count](self->_inserts, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  inserts = self->_inserts;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke;
  v33[3] = &unk_24E784650;
  v34 = v3;
  v6 = v3;
  -[NSMutableSet hmf_enumerateWithAutoreleasePoolUsingBlock:](inserts, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_updates, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  updates = self->_updates;
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_2;
  v31[3] = &unk_24E784678;
  v32 = v7;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](updates, "enumerateKeysAndObjectsUsingBlock:", v31);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_deletes, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  deletes = self->_deletes;
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_3;
  v29[3] = &unk_24E7846A0;
  v30 = v10;
  v12 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deletes, "enumerateKeysAndObjectsUsingBlock:", v29);
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  qualityOfService = self->_qualityOfService;
  homeModelID = self->_homeModelID;
  v18 = self->_clientIdentifier;
  v19 = homeModelID;
  v20 = CFSTR("utilityQoS");
  v21 = CFSTR("userInitiatedQoS");
  v22 = CFSTR("userInteractiveQoS");
  if (qualityOfService != 33)
    v22 = 0;
  if (qualityOfService != 25)
    v21 = v22;
  if (qualityOfService != 17)
    v20 = (__CFString *)v21;
  v23 = CFSTR("defaultQoS");
  v24 = CFSTR("backgroundQoS");
  if (qualityOfService != 9)
    v24 = 0;
  if (qualityOfService != -1)
    v23 = v24;
  if (qualityOfService <= 16)
    v20 = (__CFString *)v23;
  v25 = v20;
  HMFBooleanToString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ %@: clientIdentifier = %@, qos = %@, transform = %@, inserts = %@, updates = %@, deletes = %@>"), v15, v19, v18, v25, v26, v6, v9, v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (NSSet)deletedModelIDs
{
  return &self->_deletedModelIDs->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_homeModelID, 0);
  objc_storeStrong((id *)&self->_deletedModelIDs, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
}

void __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hmd_debugIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  MKFPropertyNamesFromDescriptions(a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@]"), v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "hmd_debugIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);
}

void __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hmd_debugIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end

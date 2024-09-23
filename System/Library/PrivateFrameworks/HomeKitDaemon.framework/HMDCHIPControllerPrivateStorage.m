@implementation HMDCHIPControllerPrivateStorage

- (HMDCHIPControllerPrivateStorage)initWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPControllerPrivateStorage *v6;
  HMDCHIPControllerPrivateStorage *v7;
  HMDCHIPControllerPrivateStorage *v9;
  SEL v10;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDCHIPControllerPrivateStorage;
    v6 = -[HMDCHIPControllerPrivateStorage init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeWeak((id *)&v6->_home, v5);

    return v7;
  }
  else
  {
    v9 = (HMDCHIPControllerPrivateStorage *)_HMFPreconditionFailure();
    return (HMDCHIPControllerPrivateStorage *)-[HMDCHIPControllerPrivateStorage debugDictionaryRepresentation](v9, v10);
  }
}

- (NSDictionary)debugDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("Home UUID");
  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("Controller Node ID");
  v10[0] = v4;
  -[HMDCHIPControllerPrivateStorage controllerNodeID](self, "controllerNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  return (NSDictionary *)v7;
}

- (id)privateDataSourceForControllerNodeID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCHIPControllerPrivateStorage *v7;
  NSObject *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  HMDCHIPControllerPrivateDataSource *v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE buf[24];
  void *v27;
  HMDCHIPControllerPrivateStorage *v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEqualToNumber:", &unk_24E96D6D0))
  {
    v11 = v5;
    v12 = v11;
    if (!self)
    {

      goto LABEL_7;
    }
    -[HMDCHIPControllerPrivateStorage home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backingStore");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __56__HMDCHIPControllerPrivateStorage__setControllerNodeID___block_invoke;
    v27 = &unk_24E79B670;
    v28 = self;
    v17 = v16;
    v29 = v17;
    v18 = v12;
    v30 = v18;
    v32 = &v22;
    v19 = v15;
    v31 = v19;
    objc_msgSend(v19, "unsafeSynchronousBlock:", buf);
    LOBYTE(v14) = *((_BYTE *)v23 + 24) == 0;

    _Block_object_dispose(&v22, 8);
    if ((v14 & 1) == 0)
    {
      -[HMDCHIPControllerPrivateStorage setControllerNodeID:](self, "setControllerNodeID:", v18);
      v20 = [HMDCHIPControllerPrivateDataSource alloc];
      -[HMDCHIPControllerPrivateStorage home](self, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[HMDCHIPControllerPrivateDataSource initWithHome:nodeID:](v20, "initWithHome:nodeID:", v21, v18);

      goto LABEL_7;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize controller's private storage as node ID is invalid (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  self = 0;
LABEL_7:

  return self;
}

- (NSNumber)cachedLocalControllerNodeID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[HMDCHIPControllerPrivateStorage controllerNodeID](self, "controllerNodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x3032000000;
      v13 = __Block_byref_object_copy__249827;
      v14 = __Block_byref_object_dispose__249828;
      v15 = 0;
      -[HMDCHIPControllerPrivateStorage home](self, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "backingStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __52__HMDCHIPControllerPrivateStorage__fetchLocalNodeID__block_invoke;
      v9[3] = &unk_24E79B698;
      v9[4] = self;
      v9[5] = &v10;
      objc_msgSend(v6, "unsafeSynchronousBlock:", v9);
      v7 = (id)v11[5];

      _Block_object_dispose(&v10, 8);
    }
    else
    {
      v7 = 0;
    }
    -[HMDCHIPControllerPrivateStorage setControllerNodeID:](self, "setControllerNodeID:", v7);

  }
  return -[HMDCHIPControllerPrivateStorage controllerNodeID](self, "controllerNodeID");
}

- (id)valueForSDKKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__249827;
  v20 = __Block_byref_object_dispose__249828;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__HMDCHIPControllerPrivateStorage_valueForSDKKey___block_invoke;
  v12[3] = &unk_24E79B5F8;
  v12[4] = self;
  v8 = v4;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v9, "unsafeSynchronousBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (BOOL)setValue:(id)a3 forSDKKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = a4;
  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backingStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__HMDCHIPControllerPrivateStorage_setValue_forSDKKey___block_invoke;
  v17[3] = &unk_24E79B620;
  v17[4] = self;
  v12 = v11;
  v18 = v12;
  v13 = v7;
  v19 = v13;
  v14 = v6;
  v20 = v14;
  v15 = v10;
  v21 = v15;
  v22 = &v23;
  objc_msgSend(v15, "unsafeSynchronousBlock:", v17);
  LOBYTE(v8) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)v8;
}

- (BOOL)removeValueForSDKKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__HMDCHIPControllerPrivateStorage_removeValueForSDKKey___block_invoke;
  v13[3] = &unk_24E79B670;
  v13[4] = self;
  v9 = v4;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v17 = &v18;
  v11 = v7;
  v16 = v11;
  objc_msgSend(v11, "unsafeSynchronousBlock:", v13);
  LOBYTE(v6) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v6;
}

- (id)allSDKKeyValuePairs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__249827;
  v16 = __Block_byref_object_dispose__249828;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__HMDCHIPControllerPrivateStorage_allSDKKeyValuePairs__block_invoke;
  v9[3] = &unk_24E79C0A8;
  v9[4] = self;
  v6 = v5;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v6, "unsafeSynchronousBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)setSDKKeyValuePairs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke;
  v13[3] = &unk_24E79B670;
  v13[4] = self;
  v9 = v8;
  v14 = v9;
  v10 = v4;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v11, "unsafeSynchronousBlock:", v13);
  LOBYTE(v6) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v6;
}

- (BOOL)removeAllSDKKeyValuePairs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HMDCHIPControllerPrivateStorage_removeAllSDKKeyValuePairs__block_invoke;
  v9[3] = &unk_24E79C0A8;
  v9[4] = self;
  v7 = v6;
  v10 = v7;
  v11 = &v12;
  objc_msgSend(v5, "unsafeSynchronousBlock:", v9);
  LOBYTE(v3) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (-[HMDCHIPControllerPrivateStorage home](self, "home"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "home"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    -[HMDCHIPControllerPrivateStorage controllerNodeID](self, "controllerNodeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controllerNodeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[HMDCHIPControllerPrivateStorage controllerNodeID](self, "controllerNodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPControllerPrivateStorage controllerNodeID](self, "controllerNodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPControllerPrivateStorage home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Home"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCHIPControllerPrivateStorage controllerNodeID](self, "controllerNodeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Controller Node ID"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (NSNumber)controllerNodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setControllerNodeID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerNodeID, 0);
  objc_destroyWeak((id *)&self->_home);
}

void __60__HMDCHIPControllerPrivateStorage_removeAllSDKKeyValuePairs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x227676638]();
  -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[HMDCHIPControllerPrivateStorage removeAllForHome:context:](*(void **)(a1 + 32), v3, *(void **)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (id)homeWithContext:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "assertIsExecuting");
    objc_msgSend(a1, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFModel modelWithModelID:context:](_MKFHome, "modelWithModelID:context:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "home");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v12;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to find home %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)removeAllForHome:(void *)a3 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "assertIsExecuting");
    -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](a1, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v8);
    v20 = 0;
    objc_msgSend(v7, "executeRequest:error:", v9, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    objc_msgSend(v10, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v17;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all: %@", buf, 0x16u);

        v14 = v19;
      }

      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)fetchRequestForHome:(unint64_t)a3 maxExpectedCount:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  +[_MKFMatterLocalKeyValuePair fetchRequest](_MKFMatterLocalKeyValuePair, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("key");
  v13[1] = CFSTR("value");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v7);

  v8 = (void *)MEMORY[0x24BDD1758];
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("home"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v9);
  }
  else
  {
    objc_msgSend(a1, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("home"), CFSTR("modelID"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v11);

  }
  if (a3 >= 0x33)
    objc_msgSend(v6, "setFetchBatchSize:", 50);

  return v6;
}

void __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  _MKFMatterLocalKeyValuePair *v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obja;
  id obj;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  _QWORD v81[5];

  v81[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v59 = v2;
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v7 = v4;
    v58 = v3;
    v8 = v3;
    v9 = v5;
    v10 = v9;
    v61 = v8;
    v60 = v7;
    if (v6)
    {
      objc_msgSend(v9, "assertIsExecuting");
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ANY %K IN %@"), CFSTR("key"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](v6, v8, objc_msgSend(v7, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD14C0];
      objc_msgSend(v12, "predicate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v14;
      v81[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPredicate:", v16);

      v73 = 0;
      objc_msgSend(v10, "executeFetchRequest:error:", v12, &v73);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v73;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = v6;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v75 = v23;
          v76 = 2112;
          v77 = (uint64_t)v18;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch matching keys: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        v24 = (void *)MEMORY[0x227676638]();
        v25 = v21;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "predicate");
          obja = v24;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v75 = v27;
          v76 = 2112;
          v77 = (uint64_t)v28;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Failed predicate: %@", buf, 0x16u);

          v24 = obja;
        }

        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x24BDBCE30], "array");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v60;
      }

    }
    else
    {
      v19 = 0;
    }

    v29 = v61;
    v57 = v19;
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke_2;
      v69[3] = &unk_24E79B648;
      v70 = v30;
      v31 = *(id *)(a1 + 48);
      v32 = *(_QWORD *)(a1 + 32);
      v71 = v31;
      v72 = v32;
      v33 = v30;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v69);
      objc_msgSend(v33, "allObjects");
      v34 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = v7;
    }
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v34;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v66 != v37)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x227676638]();
          v42 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v75 = v44;
            v76 = 2112;
            v77 = (uint64_t)v39;
            v78 = 2112;
            v79 = v40;
            _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_DEBUG, "%{public}@Setting new value for '%@': %@", buf, 0x20u);

            v29 = v61;
          }

          objc_autoreleasePoolPop(v41);
          v45 = -[_MKFMatterLocalKeyValuePair initWithContext:]([_MKFMatterLocalKeyValuePair alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
          -[_MKFMatterLocalKeyValuePair setHome:](v45, "setHome:", v29);
          -[_MKFMatterLocalKeyValuePair setKey:](v45, "setKey:", v39);
          -[_MKFMatterLocalKeyValuePair setValue:](v45, "setValue:", v40);

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
      }
      while (v36);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v46 = *(void **)(a1 + 56);
      v64 = 0;
      v47 = objc_msgSend(v46, "save:", &v64);
      v48 = v64;
      v49 = (void *)MEMORY[0x227676638]();
      v50 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (v47)
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(*(id *)(a1 + 48), "count");
          *(_DWORD *)buf = 138543618;
          v75 = v53;
          v76 = 2048;
          v77 = v54;
          _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Successfully saved %tu value(s)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v49);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      }
      else
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(*(id *)(a1 + 48), "count");
          *(_DWORD *)buf = 138543874;
          v75 = v55;
          v76 = 2048;
          v77 = v56;
          v78 = 2112;
          v79 = v48;
          _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to save %tu value(s): %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v49);
      }

    }
    v3 = v58;
    v2 = v59;
  }

  objc_autoreleasePoolPop(v2);
}

void __55__HMDCHIPControllerPrivateStorage_setSDKKeyValuePairs___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "removeObject:", v4);
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = a1[6];
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating '%@' with the same value: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v13;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating value for '%@': %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v3, "setValue:", v5);
  }

}

void __54__HMDCHIPControllerPrivateStorage_allSDKKeyValuePairs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(void **)(a1 + 32);
  v45 = a1;
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "assertIsExecuting");
    -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](v3, 0, 0xFFFFFFFFFFFFFFFFLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    objc_msgSend(v5, "executeFetchRequest:error:", v6, &v50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v50;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v3;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v13;
        v53 = 2112;
        v54 = v8;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch all keys: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v14 = (void *)MEMORY[0x227676638]();
      v15 = v11;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "predicate");
        v41 = v2;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v17;
        v53 = 2112;
        v54 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Failed predicate: %@", buf, 0x16u);

        v2 = v41;
      }

      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v9;

  }
  v19 = v45;
  if (objc_msgSend(v3, "count"))
  {
    v42 = v2;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v40 = v3;
    obj = v3;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v24, "key", v40);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)MEMORY[0x227676638](objc_msgSend(v44, "setObject:forKeyedSubscript:", v26, v25));
          v28 = *(id *)(v19 + 32);
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v30;
            v53 = 2112;
            v54 = v25;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Found value for '%@'", buf, 0x16u);

            v19 = v45;
          }

          objc_autoreleasePoolPop(v27);
          v31 = (void *)MEMORY[0x227676638]();
          v32 = *(id *)(v19 + 32);
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v52 = v34;
            v53 = 2112;
            v54 = v25;
            v55 = 2112;
            v56 = v26;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Value for '%@': %@", buf, 0x20u);

            v19 = v45;
          }

          objc_autoreleasePoolPop(v31);
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      }
      while (v21);
    }

    v35 = objc_msgSend(v44, "copy");
    v36 = *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

    v3 = v40;
    v2 = v42;
  }
  else
  {
    v38 = *(_QWORD *)(*(_QWORD *)(v45 + 48) + 8);
    v39 = *(void **)(v38 + 40);
    *(_QWORD *)(v38 + 40) = MEMORY[0x24BDBD1B8];

  }
  objc_autoreleasePoolPop(v2);
}

void __56__HMDCHIPControllerPrivateStorage_removeValueForSDKKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  -[HMDCHIPControllerPrivateStorage fetchKeyValuePairForKey:home:context:](*(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(void **)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Removing value for '%@': %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v3);
    v11 = *(void **)(a1 + 56);
    v24 = 0;
    v12 = objc_msgSend(v11, "save:", &v24);
    v13 = v24;
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully removed '%@'", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v26 = v22;
        v27 = 2112;
        v28 = v23;
        v29 = 2112;
        v30 = v13;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove '%@': %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@No value for '%@'", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }

  objc_autoreleasePoolPop(v2);
}

- (id)fetchKeyValuePairForKey:(void *)a3 home:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    objc_msgSend(v9, "assertIsExecuting");
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("key"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPControllerPrivateStorage fetchRequestForHome:maxExpectedCount:](a1, v8, 1uLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(v12, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v14;
    v37[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v16);

    v32 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v12, &v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v32;
    if (v17)
    {
      objc_msgSend(v17, "firstObject");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v22;
        v35 = 2112;
        v36 = v18;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch single key: %@", buf, 0x16u);

        v19 = v30;
      }

      objc_autoreleasePoolPop(v19);
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v20;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v29 = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predicate");
        v31 = v7;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v26;
        v35 = 2112;
        v36 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Failed predicate: %@", buf, 0x16u);

        v7 = v31;
        v23 = v29;
      }

      objc_autoreleasePoolPop(v23);
      a1 = 0;
    }

  }
  return a1;
}

void __54__HMDCHIPControllerPrivateStorage_setValue_forSDKKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _MKFMatterLocalKeyValuePair *v4;
  _MKFMatterLocalKeyValuePair *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDCHIPControllerPrivateStorage fetchKeyValuePairForKey:home:context:](*(void **)(a1 + 32), *(void **)(a1 + 48), v3, *(void **)(a1 + 40));
    v4 = (_MKFMatterLocalKeyValuePair *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[_MKFMatterLocalKeyValuePair value](v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 56));

      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v7)
      {
        if (v11)
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(a1 + 48);
          v14 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          v37 = v12;
          v38 = 2112;
          v39 = v13;
          v40 = 2112;
          v41 = v14;
          _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating '%@' with the same value: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v8);
LABEL_21:

        goto LABEL_22;
      }
      if (v11)
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 48);
        v23 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        v37 = v21;
        v38 = 2112;
        v39 = v22;
        v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating value for '%@': %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      -[_MKFMatterLocalKeyValuePair setValue:](v5, "setValue:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      v5 = -[_MKFMatterLocalKeyValuePair initWithContext:]([_MKFMatterLocalKeyValuePair alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
      -[_MKFMatterLocalKeyValuePair setHome:](v5, "setHome:", v3);
      -[_MKFMatterLocalKeyValuePair setKey:](v5, "setKey:", *(_QWORD *)(a1 + 48));
      v15 = (void *)MEMORY[0x227676638](-[_MKFMatterLocalKeyValuePair setValue:](v5, "setValue:", *(_QWORD *)(a1 + 56)));
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 48);
        v20 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        v37 = v18;
        v38 = 2112;
        v39 = v19;
        v40 = 2112;
        v41 = v20;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Setting new value for '%@': %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
    }
    v24 = *(void **)(a1 + 64);
    v35 = 0;
    v25 = objc_msgSend(v24, "save:", &v35);
    v26 = v35;
    v27 = (void *)MEMORY[0x227676638]();
    v28 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v25)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v37 = v31;
        v38 = 2112;
        v39 = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully saved '%@'", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v37 = v33;
        v38 = 2112;
        v39 = v34;
        v40 = 2112;
        v41 = v26;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to save '%@': %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
    }

    goto LABEL_21;
  }
LABEL_22:

  objc_autoreleasePoolPop(v2);
}

void __50__HMDCHIPControllerPrivateStorage_valueForSDKKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPControllerPrivateStorage fetchKeyValuePairForKey:home:context:](v3, v4, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "value");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v26 = 138543618;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Found value for '%@'", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v26 = 138543874;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v21 = "%{public}@Value for '%@': %@";
      v22 = v17;
      v23 = OS_LOG_TYPE_DEBUG;
      v24 = 32;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v22, v23, v21, (uint8_t *)&v26, v24);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 40);
      v26 = 138543618;
      v27 = v18;
      v28 = 2112;
      v29 = v25;
      v21 = "%{public}@No value for '%@'";
      v22 = v17;
      v23 = OS_LOG_TYPE_INFO;
      v24 = 22;
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v15);
  objc_autoreleasePoolPop(v2);
}

void __52__HMDCHIPControllerPrivateStorage__fetchLocalNodeID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "matterControllerNodeID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFHome for : %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

  objc_autoreleasePoolPop(v2);
}

void __56__HMDCHIPControllerPrivateStorage__setControllerNodeID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  -[HMDCHIPControllerPrivateStorage homeWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "matterControllerNodeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HMFEqualObjects();

    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v25 = v11;
        v26 = 2112;
        v27 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating controller node id with the same value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "matterControllerNodeID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v25 = v13;
        v26 = 2112;
        v27 = v14;
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Resetting private storage as the controller node id has changed: %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      if (-[HMDCHIPControllerPrivateStorage removeAllForHome:context:](*(void **)(a1 + 32), v4, *(void **)(a1 + 40)))
      {
        objc_msgSend(v4, "setMatterControllerNodeID:", *(_QWORD *)(a1 + 48));
        v16 = *(void **)(a1 + 56);
        v23 = 0;
        v17 = objc_msgSend(v16, "save:", &v23);
        v18 = v23;
        if ((v17 & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        }
        else
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v25 = v22;
            v26 = 2112;
            v27 = v18;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to save controller node id: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
        }

      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_249865 != -1)
    dispatch_once(&logCategory__hmf_once_t33_249865, &__block_literal_global_249866);
  return (id)logCategory__hmf_once_v34_249867;
}

void __46__HMDCHIPControllerPrivateStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v34_249867;
  logCategory__hmf_once_v34_249867 = v0;

}

@end

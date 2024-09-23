@implementation COCluster

- (id)_initWithConfiguration:(id)a3 format:(id)a4 label:(id)a5
{
  id v9;
  id v10;
  id v11;
  COCluster *v12;
  COCluster *v13;
  uint64_t v14;
  NSString *format;
  uint64_t v16;
  NSString *label;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)COCluster;
  v12 = -[COCluster init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_configuration, a3);
    v14 = objc_msgSend(v10, "copy");
    format = v13->_format;
    v13->_format = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    label = v13->_label;
    v13->_label = (NSString *)v16;

  }
  return v13;
}

+ (COCluster)clusterWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_createTemplateFromConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)a1);
  objc_msgSend(v4, "prefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "_initWithConfiguration:format:label:", v4, v5, v7);

  return (COCluster *)v8;
}

+ (COCluster)homeCluster
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__COCluster_homeCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (homeCluster_onceToken != -1)
    dispatch_once(&homeCluster_onceToken, block);
  return (COCluster *)(id)homeCluster_cluster;
}

void __24__COCluster_homeCluster__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[_COClusterRealmHome realmForCurrent](_COClusterRealmHome, "realmForCurrent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:](COClusterConfiguration, "configurationWithDomain:requiredServices:options:realm:", CFSTR("COClusterHome"), 15, 1, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConfiguration:format:label:", v2, CFSTR("com.apple.%@-home-mesh"), CFSTR("COClusterHome"));
  v4 = (void *)homeCluster_cluster;
  homeCluster_cluster = v3;

}

+ (COCluster)pairCluster
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__COCluster_pairCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pairCluster_onceToken != -1)
    dispatch_once(&pairCluster_onceToken, block);
  return (COCluster *)(id)pairCluster_cluster;
}

void __24__COCluster_pairCluster__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[_COClusterRealmPair realmForCurrent](_COClusterRealmPair, "realmForCurrent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:](COClusterConfiguration, "configurationWithDomain:requiredServices:options:realm:", CFSTR("COClusterPair"), 15, 1, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConfiguration:format:label:", v2, CFSTR("com.apple.%@-media-system-mesh"), CFSTR("COClusterPair"));
  v4 = (void *)pairCluster_cluster;
  pairCluster_cluster = v3;

}

+ (COCluster)activityGroupCluster
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__COCluster_activityGroupCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (activityGroupCluster_onceToken != -1)
    dispatch_once(&activityGroupCluster_onceToken, block);
  return (COCluster *)(id)activityGroupCluster_cluster;
}

void __33__COCluster_activityGroupCluster__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[_COClusterRealmActivityGroup realmForCurrent](_COClusterRealmActivityGroup, "realmForCurrent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:](COClusterConfiguration, "configurationWithDomain:requiredServices:options:realm:", CFSTR("COClusterActivityGroup"), 15, 1, v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createTemplateFromConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConfiguration:format:label:", v2, v3, CFSTR("COClusterActivityGroup"));
  v5 = (void *)activityGroupCluster_cluster;
  activityGroupCluster_cluster = v4;

}

+ (COCluster)dynamicGroupCluster
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__COCluster_dynamicGroupCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dynamicGroupCluster_onceToken != -1)
    dispatch_once(&dynamicGroupCluster_onceToken, block);
  return (COCluster *)(id)dynamicGroupCluster_cluster;
}

void __32__COCluster_dynamicGroupCluster__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[_COClusterRealmDynamicGroup realmForCurrent](_COClusterRealmDynamicGroup, "realmForCurrent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:](COClusterConfiguration, "configurationWithDomain:requiredServices:options:realm:", CFSTR("COClusterDynamicGroup"), 15, 1, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConfiguration:format:label:", v2, CFSTR("com.apple.dynamic-group-mesh-%@"), CFSTR("COClusterDynamicGroup"));
  v4 = (void *)dynamicGroupCluster_cluster;
  dynamicGroupCluster_cluster = v3;

}

+ (id)_homeClusterForHomeKitHomeIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[_COClusterRealmHome realmWithHomeKitHomeIdentifier:](_COClusterRealmHome, "realmWithHomeKitHomeIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:](COClusterConfiguration, "configurationWithDomain:requiredServices:options:realm:", CFSTR("COClusterHome"), 15, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConfiguration:format:label:", v5, CFSTR("com.apple.%@-home-mesh"), CFSTR("COClusterHome"));

  return v6;
}

+ (id)homeClusterForHomeKitHome:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeClusterForHomeKitHomeUniqueIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (COCluster)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  COCluster *v12;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8
      || ((objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("%@")),
           v9 = (void *)objc_claimAutoreleasedReturnValue(),
           v10 = objc_msgSend(v9, "count"),
           v9,
           v10 == 2)
        ? (v11 = v7 == 0)
        : (v11 = 1),
          v11))
    {

      v12 = 0;
    }
    else
    {
      v12 = -[COCluster _initWithConfiguration:format:label:](self, "_initWithConfiguration:format:label:", v5, v6, v7);
    }

  }
  else
  {
    v12 = 0;
    v5 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  -[COCluster configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configuration"));

  -[COCluster format](self, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("format"));

  -[COCluster label](self, "label");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("label"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COCluster identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COCluster label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[COCluster configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, i(%@), l(%@), c(%@)>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COCluster configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  COCluster *v4;
  COCluster *v5;
  BOOL v6;

  v4 = (COCluster *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[COCluster _isEqualToCluster:](self, "_isEqualToCluster:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)_isEqualToCluster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[COCluster configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[COCluster format](self, "format");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "format");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[COCluster label](self, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_createTemplateFromConfiguration:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "realm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = CFSTR("%@");
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v3, "prefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lX"), objc_msgSend(v3, "requiredServices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lX"), objc_msgSend(v3, "options"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v9;
    v12[3] = CFSTR("%@");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_updateIdentifier
{
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __30__COCluster__updateIdentifier__block_invoke;
  v3[3] = &unk_24CD3F118;
  v3[4] = self;
  v3[5] = &v4;
  -[COCluster _withLock:](self, "_withLock:", v3);
  if (*((_BYTE *)v5 + 24) || !-[COCluster updateHandlerInvoked](self, "updateHandlerInvoked"))
    -[COCluster _invokeUpdateHandler](self, "_invokeUpdateHandler");
  _Block_object_dispose(&v4, 8);
}

void __30__COCluster__updateIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "realm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "format");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
    if (!v2)
    {
LABEL_6:
      if (!v8 || (objc_msgSend(v8, "isEqual:", v2) & 1) != 0)
        goto LABEL_11;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v2, "isEqual:", v8))
    goto LABEL_6;
LABEL_8:
  COLogForCategory(7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v15 = v10;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v2;
    _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p cluster identifier changing to %@ from %@", buf, 0x20u);
  }

  v11 = objc_msgSend(v8, "copy");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v11;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_11:

}

- (void)activate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
  {
    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __22__COCluster_activate___block_invoke;
    v11[3] = &unk_24CD3ED38;
    v11[4] = self;
    v12 = v4;
    -[COCluster _withLock:](self, "_withLock:", v11);
    objc_initWeak(&location, self);
    -[COCluster configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "realm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __22__COCluster_activate___block_invoke_39;
    v8[3] = &unk_24CD3F140;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "activate:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
}

void __22__COCluster_activate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  COLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 134218242;
    v10 = v3;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_21214B000, v2, OS_LOG_TYPE_DEFAULT, "%p cluster activating %@", (uint8_t *)&v9, 0x16u);
  }

  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

}

void __22__COCluster_activate___block_invoke_39(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleRealmUpdate:", v5);

}

- (void)_invokeUpdateHandler
{
  uint64_t v2;
  _QWORD v3[7];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__41;
  v8 = __Block_byref_object_dispose__42;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__COCluster__invokeUpdateHandler__block_invoke;
  v3[3] = &unk_24CD3EDF0;
  v3[4] = self;
  v3[5] = &v10;
  v3[6] = &v4;
  -[COCluster _withLock:](self, "_withLock:", v3);
  v2 = v11[5];
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v5[5]);
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
}

void __33__COCluster__invokeUpdateHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 1;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

+ (id)_clusterForCluster:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
LABEL_22:
      v5 = v6;
      goto LABEL_23;
    }
    objc_opt_class();
    objc_opt_isKindOfClass();
    v5 = 0;
    goto LABEL_23;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v7 = v4;
    if (objc_msgSend(CFSTR("COClusterHome"), "isEqual:", v7))
    {
      objc_msgSend(a1, "homeCluster");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(CFSTR("COClusterPair"), "isEqualToString:", v7))
    {
      objc_msgSend(a1, "pairCluster");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(CFSTR("COClusterActivityGroup"), "isEqualToString:", v7))
    {
      objc_msgSend(a1, "activityGroupCluster");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(CFSTR("COClusterDynamicGroup"), "isEqualToString:", v7))
      {
        v21 = 0;
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("com.apple.([0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})-home-mesh"), 0, &v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v21;
        v5 = 0;
        if (!v12)
        {
          objc_msgSend(v11, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = 0;
          if (objc_msgSend(v13, "numberOfRanges") == 2)
          {
            v14 = objc_msgSend(v13, "rangeAtIndex:", 1);
            objc_msgSend(v7, "substringWithRange:", v14, v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v20);
            +[_COClusterRealmHome realmWithHomeKitHomeIdentifier:](_COClusterRealmHome, "realmWithHomeKitHomeIdentifier:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:](COClusterConfiguration, "configurationWithDomain:requiredServices:options:realm:", CFSTR("COClusterHome"), 15, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = (id)objc_msgSend(objc_alloc((Class)a1), "_initWithConfiguration:format:label:", v17, CFSTR("com.apple.%@-home-mesh"), CFSTR("COClusterHome"));
            COLogForCategory(7);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              v23 = a1;
              v24 = 2112;
              v25 = v16;
              v26 = 2112;
              v27 = v7;
              _os_log_impl(&dword_21214B000, v18, OS_LOG_TYPE_DEFAULT, "Created legacy Home cluster %p using %@ from %@", buf, 0x20u);
            }

          }
        }

LABEL_18:
        if (v5)
          goto LABEL_23;
LABEL_19:
        COLogForCategory(7);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[COCluster _clusterForCluster:].cold.1((uint64_t)v4, v9);

        objc_msgSend(a1, "homeCluster");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(a1, "dynamicGroupCluster");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v8;
    goto LABEL_18;
  }
  v5 = v4;
  if (!v5)
    goto LABEL_19;
LABEL_23:

  return v5;
}

+ (id)_allowedClusterClasses
{
  if (_allowedClusterClasses_onceToken != -1)
    dispatch_once(&_allowedClusterClasses_onceToken, &__block_literal_global_1);
  return (id)_allowedClusterClasses_allowedClasses;
}

void __35__COCluster__allowedClusterClasses__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled");
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  v1 = (void *)_allowedClusterClasses_allowedClasses;
  _allowedClusterClasses_allowedClasses = v0;

}

+ (id)inferClusterLabelFromCluster:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 != CFSTR("COClusterDynamicGroup")
    && v3 != CFSTR("COClusterActivityGroup")
    && v3 != CFSTR("COClusterHome")
    && v3 != CFSTR("COClusterPair"))
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("com.apple.(?:(?:(?:[A-F0-9\\-]+)-(?:([a-z\\-]+)(?:-mesh)))|(?:(activity-group-mesh-[a-z-]+)(?:-[A-F0-9-]+))|(?:(dynamic-group-mesh-[a-z-]+)(?:-[A-F0-9-]+)))"), 0, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v9 = v4;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v8, "matchesInString:options:range:", v4, 0, 0, -[__CFString length](v4, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
    {
      v9 = v4;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeAtIndex:", 1);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[__CFString substringWithRange:](v4, "substringWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("home")) & 1) != 0)
      {
        v9 = CFSTR("COClusterHome");
LABEL_21:

LABEL_28:
        goto LABEL_29;
      }
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("media-system")))
      {
        v9 = CFSTR("COClusterPair");
        goto LABEL_21;
      }

    }
    if (objc_msgSend(v11, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v11, "rangeAtIndex:", 3) == 0x7FFFFFFFFFFFFFFFLL)
        v9 = v4;
      else
        v9 = CFSTR("COClusterDynamicGroup");
    }
    else
    {
      v9 = CFSTR("COClusterActivityGroup");
    }
    goto LABEL_28;
  }
  v9 = v3;
LABEL_31:

  return v9;
}

+ (id)clusterNameWithHomeKitHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@-home-mesh"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (COClusterConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)updateHandlerInvoked
{
  return self->_updateHandlerInvoked;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (void)_clusterForCluster:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21214B000, a2, OS_LOG_TYPE_ERROR, "Failed to identify cluster for %@, falling back", (uint8_t *)&v2, 0xCu);
}

@end

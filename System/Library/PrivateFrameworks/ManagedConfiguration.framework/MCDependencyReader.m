@implementation MCDependencyReader

+ (id)systemStoragePath
{
  if (systemStoragePathOverride)
    return (id)systemStoragePathOverride;
  MCSystemDependencyFilePath();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)userStoragePath
{
  if (userStoragePathOverride)
    return (id)userStoragePathOverride;
  MCUserDependencyFilePath();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setSystemStoragePath:(id)a3 userStoragePath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = objc_msgSend(a3, "copy");
  v7 = (void *)systemStoragePathOverride;
  systemStoragePathOverride = v6;

  v8 = objc_msgSend(v5, "copy");
  v9 = (void *)userStoragePathOverride;
  userStoragePathOverride = v8;

}

+ (id)sharedReader
{
  if (sharedReader_onceToken != -1)
    dispatch_once(&sharedReader_onceToken, &__block_literal_global_9);
  return (id)sharedReader_obj;
}

void __34__MCDependencyReader_sharedReader__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[12];
  int out_token;

  v0 = NSClassFromString(CFSTR("MCDependencyManager"));
  if (v0)
  {
    v1 = objc_msgSend([v0 alloc], "_init");
    v2 = (void *)sharedReader_obj;
    sharedReader_obj = v1;

  }
  else
  {
    out_token = 0;
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.dependencydidchange"), "UTF8String");
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = notify_register_dispatch(v3, &out_token, v4, &__block_literal_global_3);

    if ((_DWORD)v3)
    {
      v5 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Could not set up listener for dependency invalidation notifications", v8, 2u);
      }
    }
    v6 = -[MCDependencyReader _init]([MCDependencyReader alloc], "_init");
    v7 = (void *)sharedReader_obj;
    sharedReader_obj = (uint64_t)v6;

  }
}

void __34__MCDependencyReader_sharedReader__block_invoke_2()
{
  id v0;

  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invalidateCache");

}

- (MCDependencyReader)init
{

  return 0;
}

- (id)_init
{
  MCDependencyReader *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *memberQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDependencyReader;
  v2 = -[MCDependencyReader init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MCDependencyManager member queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)systemDomainsDict
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__MCDependencyReader_systemDomainsDict__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__MCDependencyReader_systemDomainsDict__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueSystemDomainsDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)userDomainsDict
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MCDependencyReader_userDomainsDict__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__MCDependencyReader_userDomainsDict__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueUserDomainsDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)memberQueueSystemDomainsDict
{
  NSMutableDictionary *memberQueueSystemDomainsDict;

  memberQueueSystemDomainsDict = self->_memberQueueSystemDomainsDict;
  if (!memberQueueSystemDomainsDict)
  {
    -[MCDependencyReader memberQueueRereadSystemDomainsDict](self, "memberQueueRereadSystemDomainsDict");
    memberQueueSystemDomainsDict = self->_memberQueueSystemDomainsDict;
  }
  return memberQueueSystemDomainsDict;
}

- (NSMutableDictionary)memberQueueUserDomainsDict
{
  NSMutableDictionary *memberQueueUserDomainsDict;

  memberQueueUserDomainsDict = self->_memberQueueUserDomainsDict;
  if (!memberQueueUserDomainsDict)
  {
    -[MCDependencyReader memberQueueRereadUserDomainsDict](self, "memberQueueRereadUserDomainsDict");
    memberQueueUserDomainsDict = self->_memberQueueUserDomainsDict;
  }
  return memberQueueUserDomainsDict;
}

- (id)memberQueueParentsInDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[MCDependencyReader memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = objc_claimAutoreleasedReturnValue();

  -[MCDependencyReader memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allKeys");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v7 | v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7)
      objc_msgSend(v11, "addObjectsFromArray:", v7);
    if (v10)
      objc_msgSend(v12, "addObjectsFromArray:", v10);
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

- (id)memberQueueParentsInSystemDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCDependencyReader memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)memberQueueParentsInUserDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MCDependencyReader memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)memberQueueDependentsOfParent:(id)a3 inDomain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[MCDependencyReader memberQueueDependentsOfParent:inSystemDomain:](self, "memberQueueDependentsOfParent:inSystemDomain:", v7, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  -[MCDependencyReader memberQueueDependentsOfParent:inUserDomain:](self, "memberQueueDependentsOfParent:inUserDomain:", v7, v6);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v8 | v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
      objc_msgSend(v10, "addObjectsFromArray:", v8);
    if (v9)
      objc_msgSend(v11, "addObjectsFromArray:", v9);
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

- (id)memberQueueDependentsOfParent:(id)a3 inSystemDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[MCDependencyReader memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "copy");
  return v11;
}

- (id)memberQueueDependentsOfParent:(id)a3 inUserDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[MCDependencyReader memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "copy");
  return v11;
}

- (id)parentsInDomain:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MCDependencyReader_parentsInDomain___block_invoke;
  block[3] = &unk_1E41E2CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __38__MCDependencyReader_parentsInDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueParentsInDomain:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dependentsOfParent:(id)a3 inDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__MCDependencyReader_dependentsOfParent_inDomain___block_invoke;
  v13[3] = &unk_1E41E2D18;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __50__MCDependencyReader_dependentsOfParent_inDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueDependentsOfParent:inDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)parentsInSystemDomain:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCDependencyReader_parentsInSystemDomain___block_invoke;
  block[3] = &unk_1E41E2CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__MCDependencyReader_parentsInSystemDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueParentsInSystemDomain:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)parentsInUserDomain:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MCDependencyReader_parentsInUserDomain___block_invoke;
  block[3] = &unk_1E41E2CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__MCDependencyReader_parentsInUserDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueParentsInUserDomain:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dependentsOfParent:(id)a3 inSystemDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__MCDependencyReader_dependentsOfParent_inSystemDomain___block_invoke;
  v13[3] = &unk_1E41E2D18;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __56__MCDependencyReader_dependentsOfParent_inSystemDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueDependentsOfParent:inSystemDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dependentsOfParent:(id)a3 inUserDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[MCDependencyReader memberQueue](self, "memberQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__MCDependencyReader_dependentsOfParent_inUserDomain___block_invoke;
  v13[3] = &unk_1E41E2D18;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__MCDependencyReader_dependentsOfParent_inUserDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueDependentsOfParent:inUserDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)memberQueueRereadDomainsDict
{
  -[MCDependencyReader memberQueueRereadSystemDomainsDict](self, "memberQueueRereadSystemDomainsDict");
  -[MCDependencyReader memberQueueRereadUserDomainsDict](self, "memberQueueRereadUserDomainsDict");
}

- (void)memberQueueRereadSystemDomainsDict
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  int v7;
  NSObject *v8;
  void *memberQueueSystemDomainsDict;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  uint8_t buf[16];
  uint8_t v20[16];
  uint8_t v21[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCDependencyReader systemStoragePath](MCDependencyReader, "systemStoragePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  getpid();
  +[MCDependencyReader systemStoragePath](MCDependencyReader, "systemStoragePath");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v6, "fileSystemRepresentation");
  v7 = sandbox_check();

  if (v5 && v7)
  {
    v8 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Cannot access system dependency file due to sandboxing.", buf, 2u);
    }
    memberQueueSystemDomainsDict = self->_memberQueueSystemDomainsDict;
    self->_memberQueueSystemDomainsDict = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB38B0];
    v11 = (void *)MEMORY[0x1E0C99D50];
    +[MCDependencyReader systemStoragePath](MCDependencyReader, "systemStoragePath", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MCSafePropertyListWithData:options:format:error:", v13, 0, 0, 0);
    memberQueueSystemDomainsDict = (void *)objc_claimAutoreleasedReturnValue();

    if (memberQueueSystemDomainsDict && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_DEBUG, "Reading system dependency information from file.", v20, 2u);
      }
      v15 = (NSMutableDictionary *)objc_msgSend(memberQueueSystemDomainsDict, "MCMutableDeepCopy");
    }
    else
    {
      v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_INFO, "No system dependency information found. Creating an empty dictionary.", v21, 2u);
      }
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    v17 = self->_memberQueueSystemDomainsDict;
    self->_memberQueueSystemDomainsDict = v15;

  }
}

- (void)memberQueueRereadUserDomainsDict
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  int v7;
  NSObject *v8;
  void *memberQueueUserDomainsDict;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  uint8_t buf[16];
  uint8_t v20[16];
  uint8_t v21[16];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCDependencyReader userStoragePath](MCDependencyReader, "userStoragePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  getpid();
  +[MCDependencyReader userStoragePath](MCDependencyReader, "userStoragePath");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v6, "fileSystemRepresentation");
  v7 = sandbox_check();

  if (v5 && v7)
  {
    v8 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Cannot access user dependency file due to sandboxing.", buf, 2u);
    }
    memberQueueUserDomainsDict = self->_memberQueueUserDomainsDict;
    self->_memberQueueUserDomainsDict = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB38B0];
    v11 = (void *)MEMORY[0x1E0C99D50];
    +[MCDependencyReader userStoragePath](MCDependencyReader, "userStoragePath", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MCSafePropertyListWithData:options:format:error:", v13, 0, 0, 0);
    memberQueueUserDomainsDict = (void *)objc_claimAutoreleasedReturnValue();

    if (memberQueueUserDomainsDict && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_DEBUG, "Reading user dependency information from file.", v20, 2u);
      }
      v15 = (NSMutableDictionary *)objc_msgSend(memberQueueUserDomainsDict, "MCMutableDeepCopy");
    }
    else
    {
      v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_INFO, "No user dependency information found. Creating an empty dictionary.", v21, 2u);
      }
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    v17 = self->_memberQueueUserDomainsDict;
    self->_memberQueueUserDomainsDict = v15;

  }
}

- (void)invalidateCache
{
  NSObject *v3;
  _QWORD block[5];

  -[MCDependencyReader memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MCDependencyReader_invalidateCache__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __37__MCDependencyReader_invalidateCache__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSystemDomainsDict:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUserDomainsDict:", 0);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (void)setMemberQueueSystemDomainsDict:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueSystemDomainsDict, a3);
}

- (void)setMemberQueueUserDomainsDict:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueUserDomainsDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueUserDomainsDict, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemDomainsDict, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end

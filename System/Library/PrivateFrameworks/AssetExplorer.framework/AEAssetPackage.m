@implementation AEAssetPackage

- (AEAssetPackage)initWithAssetIdentifier:(id)a3 durableURLs:(id)a4 sidecar:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  AEAssetPackage *v12;
  id v14;

  v14 = 0;
  v8 = a5;
  v9 = a3;
  _UnsuppressedURLs(a4, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  v12 = -[AEAssetPackage initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:](self, "initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:", v9, v10, v11, v8);

  return v12;
}

- (AEAssetPackage)initWithAssetIdentifier:(id)a3 durableURLs:(id)a4 suppressedTypes:(id)a5 sidecar:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AEAssetPackage *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *packageContentQueue;
  uint64_t v17;
  NSString *identifier;
  NSObject *v19;
  _QWORD v21[4];
  AEAssetPackage *v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AEAssetPackage;
  v14 = -[AEAssetPackage init](&v26, sel_init);
  if (v14)
  {
    v15 = dispatch_queue_create("com.apple.asset-explorer.package-content-queue", MEMORY[0x24BDAC9C0]);
    packageContentQueue = v14->__packageContentQueue;
    v14->__packageContentQueue = (OS_dispatch_queue *)v15;

    v17 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    v19 = v14->__packageContentQueue;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __78__AEAssetPackage_initWithAssetIdentifier_durableURLs_suppressedTypes_sidecar___block_invoke;
    v21[3] = &unk_24E23BC20;
    v22 = v14;
    v23 = v11;
    v24 = v12;
    v25 = v13;
    dispatch_barrier_sync(v19, v21);

  }
  return v14;
}

- (AEAssetPackage)init
{
  -[AEAssetPackage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[AEAssetPackage initWithAssetIdentifier:durableURLs:sidecar:](self, "initWithAssetIdentifier:durableURLs:sidecar:", CFSTR("bogus"), 0, 0);
}

- (NSString)description
{
  id v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[AEAssetPackage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("identifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[AEAssetPackage durableURLsSnapshotApplyingSuppression:](self, "durableURLsSnapshotApplyingSuppression:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("durableURLs"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[AEAssetPackage suppressedTypesSnapshot](self, "suppressedTypesSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("suppressedTypes"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[AEAssetPackage sidecarSnapshot](self, "sidecarSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("sidecar"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  v21.receiver = self;
  v21.super_class = (Class)AEAssetPackage;
  -[AEAssetPackage description](&v21, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %@>"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (AEAssetPackage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  AEAssetPackage *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AEAssetPackage.assetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("AEAssetPackage.durableURLs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("AEAssetPackage.suppressedTypes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v15, "addObject:", objc_opt_class());
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("AEAssetPackage.sidecar"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[AEAssetPackage initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:](self, "initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:", v5, v10, v14, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Coder must allow keyed coding."));
  -[AEAssetPackage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AEAssetPackage.assetIdentifier"));

  -[AEAssetPackage durableURLsSnapshotApplyingSuppression:](self, "durableURLsSnapshotApplyingSuppression:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("AEAssetPackage.durableURLs"));

  -[AEAssetPackage suppressedTypesSnapshot](self, "suppressedTypesSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AEAssetPackage.suppressedTypes"));

  -[AEAssetPackage sidecarSnapshot](self, "sidecarSnapshot");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("AEAssetPackage.sidecar"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__AEAssetPackage_copyWithZone___block_invoke;
  v7[3] = &unk_24E23BA18;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__AEAssetPackage_mutableCopyWithZone___block_invoke;
  v7[3] = &unk_24E23BA18;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)durableURLsSnapshot
{
  return -[AEAssetPackage durableURLsSnapshotApplyingSuppression:](self, "durableURLsSnapshotApplyingSuppression:", 1);
}

- (id)durableURLsSnapshotApplyingSuppression:(BOOL)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__AEAssetPackage_durableURLsSnapshotApplyingSuppression___block_invoke;
  block[3] = &unk_24E23B4C0;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)sidecarSnapshot
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
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__AEAssetPackage_sidecarSnapshot__block_invoke;
  v6[3] = &unk_24E23BA18;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)suppressedTypesSnapshot
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
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__AEAssetPackage_suppressedTypesSnapshot__block_invoke;
  v6[3] = &unk_24E23BA18;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)currentURLForType:(id)a3
{
  id v4;
  NSObject *packageContentQueue;
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
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  packageContentQueue = self->__packageContentQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__AEAssetPackage_currentURLForType___block_invoke;
  block[3] = &unk_24E23B898;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(packageContentQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_sidecarObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__AEAssetPackage__sidecarObjectForKey___block_invoke;
    block[3] = &unk_24E23B898;
    block[4] = self;
    v10 = &v11;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)sidecarPropertyListForKey:(id)a3
{
  void *v3;
  id v4;

  -[AEAssetPackage _sidecarObjectForKey:](self, "_sidecarObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(MEMORY[0x24BDD1770], "propertyList:isValidForFormat:", v3, 200))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)sidecarNumberForKey:(id)a3
{
  void *v3;
  id v4;

  -[AEAssetPackage _sidecarObjectForKey:](self, "_sidecarObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)sidecarDataForKey:(id)a3
{
  void *v3;
  id v4;

  -[AEAssetPackage _sidecarObjectForKey:](self, "_sidecarObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)sidecarDateForKey:(id)a3
{
  void *v3;
  id v4;

  -[AEAssetPackage _sidecarObjectForKey:](self, "_sidecarObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sidecarTimeForKey:(SEL)a3
{
  const __CFDictionary *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v7;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  -[AEAssetPackage _sidecarObjectForKey:](self, "_sidecarObjectForKey:", a4);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CMTimeMakeFromDictionary(&v7, v5);
    *(CMTime *)retstr = v7;
  }

  return result;
}

- (id)sidecarImageForKey:(id)a3
{
  void *v3;
  id v4;

  -[AEAssetPackage _sidecarObjectForKey:](self, "_sidecarObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)_packageContentQueue
{
  return self->__packageContentQueue;
}

- (NSMutableDictionary)_contentQueue_finalURLs
{
  return self->__contentQueue_finalURLs;
}

- (NSMutableDictionary)_contentQueueSidecar
{
  return self->__contentQueueSidecar;
}

- (NSMutableSet)_contentQueue_suppressedTypes
{
  return self->__contentQueue_suppressedTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentQueue_suppressedTypes, 0);
  objc_storeStrong((id *)&self->__contentQueueSidecar, 0);
  objc_storeStrong((id *)&self->__contentQueue_finalURLs, 0);
  objc_storeStrong((id *)&self->__packageContentQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __39__AEAssetPackage__sidecarObjectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueueSidecar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__AEAssetPackage_currentURLForType___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__AEAssetPackage_suppressedTypesSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__AEAssetPackage_sidecarSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueueSidecar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__AEAssetPackage_durableURLsSnapshotApplyingSuppression___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (*(_BYTE *)(a1 + 48))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(CFSTR("com.apple.asset-explorer-package.suppressed."), "stringByAppendingString:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary ae_moveObjectFromKey:toKey:](v3, v9, v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
  v11 = objc_msgSend(v3, "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __38__AEAssetPackage_mutableCopyWithZone___block_invoke(uint64_t a1)
{
  AEMutableAssetPackage *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = [AEMutableAssetPackage alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contentQueueSidecar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AEAssetPackage initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:](v2, "initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:", v9, v3, v4, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __31__AEAssetPackage_copyWithZone___block_invoke(uint64_t a1)
{
  AEAssetPackage *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = [AEAssetPackage alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_contentQueueSidecar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AEAssetPackage initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:](v2, "initWithAssetIdentifier:durableURLs:suppressedTypes:sidecar:", v9, v3, v4, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __78__AEAssetPackage_initWithAssetIdentifier_durableURLs_suppressedTypes_sidecar___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v2 = (void *)a1[5];
  if (v2)
    v3 = (id)objc_msgSend(v2, "mutableCopy");
  else
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  objc_storeStrong((id *)(a1[4] + 24), v3);

  v5 = (void *)a1[6];
  if (v5)
    v6 = (id)objc_msgSend(v5, "mutableCopy");
  else
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7 = v6;
  objc_storeStrong((id *)(a1[4] + 40), v6);

  v8 = (void *)a1[7];
  if (v8)
    v9 = (id)objc_msgSend(v8, "mutableCopy");
  else
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = v9;
  objc_storeStrong((id *)(a1[4] + 32), v9);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)unsuppressedURLsFromURLs:(id)a3
{
  return _UnsuppressedURLs(a3, 0);
}

- (BOOL)isURLSuppressedForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__AEAssetPackage_AEURLSuppression__isURLSuppressedForType___block_invoke;
  block[3] = &unk_24E23B898;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __59__AEAssetPackage_AEURLSuppression__isURLSuppressedForType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isFavorite
{
  return 0;
}

- (double)aspectRatio
{
  double v3;

  if (!-[AEAssetPackage pixelHeight](self, "pixelHeight"))
    return 1.0;
  v3 = (double)-[AEAssetPackage pixelWidth](self, "pixelWidth");
  return v3 / (double)-[AEAssetPackage pixelHeight](self, "pixelHeight");
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE72468];
  -[AEAssetPackage providedFullsizeImageURL](self, "providedFullsizeImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithFilenameExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)originalFilesize
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  return -[AEAssetPackage sidecarTimeForKey:](self, "sidecarTimeForKey:", CFSTR("AEAssetPackageDisplayLivePhotoStillDisplayTime"));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  return -[AEAssetPackage sidecarTimeForKey:](self, "sidecarTimeForKey:", CFSTR("AEAssetPackageDisplayLivePhotoVideoDuration"));
}

- (BOOL)hasPhotoColorAdjustments
{
  void *v2;
  char v3;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayHasPhotoColorAdjustments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)isContentEqualTo:(id)a3
{
  return self == a3;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)canPlayPhotoIris
{
  BOOL v3;

  v3 = -[AEAssetPackage containsLivePhotoContent](self, "containsLivePhotoContent");
  return v3 & !-[AEAssetPackage containsSuppressedLivePhoto](self, "containsSuppressedLivePhoto");
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayLoopingVideo
{
  return -[AEAssetPackage playbackStyle](self, "playbackStyle") == 5;
}

- (unint64_t)mediaType
{
  void *v2;
  unint64_t v3;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayMediaType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)mediaSubtypes
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayMediaSubtypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFFF5;
  if (-[AEAssetPackage canPlayPhotoIris](self, "canPlayPhotoIris"))
    v5 = 8;
  else
    v5 = 0;
  v6 = -[AEAssetPackage isHDR](self, "isHDR");
  v7 = 2;
  if (!v6)
    v7 = 0;
  v8 = v5 | v7 | v4;

  return v8;
}

- (int64_t)playbackStyle
{
  void *v2;
  int64_t v3;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayPlaybackStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (unsigned)playbackVariation
{
  void *v2;
  unsigned __int16 v3;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayPlaybackVariation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (unint64_t)pixelWidth
{
  void *v2;
  unint64_t v3;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayPixelWidth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)pixelHeight
{
  void *v2;
  unint64_t v3;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayPixelHeight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSDate)creationDate
{
  return (NSDate *)-[AEAssetPackage sidecarDateForKey:](self, "sidecarDateForKey:", CFSTR("AEAssetPackageDisplayCreationDate"));
}

- (NSDate)modificationDate
{
  return (NSDate *)-[AEAssetPackage sidecarDateForKey:](self, "sidecarDateForKey:", CFSTR("AEAssetPackageDisplayModificationDate"));
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageDisplayDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (CLLocation)location
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return -[AEAssetPackage playbackStyle](self, "playbackStyle") == 2;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (NSString)burstIdentifier
{
  return 0;
}

- (int64_t)numberOfRepresentedAssets
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (NSDictionary)providedImageMetadata
{
  return (NSDictionary *)-[AEAssetPackage sidecarPropertyListForKey:](self, "sidecarPropertyListForKey:", CFSTR("AEAssetPackageDisplayImageMetadata"));
}

- (PFAssetAdjustments)assetAdjustments
{
  void *v3;
  void *v4;

  -[AEAssetPackage sidecarPropertyListForKey:](self, "sidecarPropertyListForKey:", CFSTR("com.apple.assetexplorer.editedadjustments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[AEAssetPackage sidecarPropertyListForKey:](self, "sidecarPropertyListForKey:", CFSTR("com.apple.video.slomo")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE723D8]), "initWithPropertyListDictionary:", v3);
  }
  else
  {
    v4 = 0;
  }

  return (PFAssetAdjustments *)v4;
}

- (UIImage)providedPreviewImage
{
  return (UIImage *)-[AEAssetPackage sidecarImageForKey:](self, "sidecarImageForKey:", CFSTR("com.apple.assetexplorer.asset-preview-image"));
}

- (NSURL)providedFullsizeImageURL
{
  void *v3;
  void *v4;

  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", CFSTR("com.apple.assetexplorer.editedoriginalimage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v3;
}

- (NSURL)providedFullsizeRenderImageURL
{
  void *v3;
  void *v4;
  void *v5;

  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", CFSTR("com.apple.assetexplorer.editedoriginalimage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSURL)providedVideoURL
{
  void *v3;
  void *v4;

  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", CFSTR("com.apple.assetexplorer.editedoriginalvideo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v3;
}

- (NSURL)providedFullsizeRenderVideoURL
{
  void *v3;
  void *v4;
  void *v5;

  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", CFSTR("com.apple.assetexplorer.editedoriginalvideo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (PHLivePhoto)providedLivePhoto
{
  return 0;
}

- (AVAsset)providedAVAsset
{
  return 0;
}

- (AVAudioMix)providedAudioMix
{
  return 0;
}

- (id)reviewAssetFromPackageMetadata
{
  AEAssetPackage *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  if (v3 != v4
    || (objc_getAssociatedObject(v2, sel_reviewAssetFromPackageMetadata),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72D48]), "initWithConformingAsset:", v2);
    if (v3 == v4)
      objc_setAssociatedObject(v2, sel_reviewAssetFromPackageMetadata, v5, (void *)1);
  }
  objc_sync_exit(v2);

  return v5;
}

- (BOOL)containsLivePhotoContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  v8 = !v7;

  return v8;
}

- (BOOL)containsSuppressedLivePhoto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)*MEMORY[0x24BDF84B8];
  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AEAssetPackage isURLSuppressedForType:](self, "isURLSuppressedForType:", v6);

  if (!v5)
    v7 = 0;

  return v7;
}

- (int64_t)mediaOrigin
{
  void *v2;
  void *v3;
  int64_t v4;

  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", CFSTR("AEAssetPackageMediaOrigin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 5;

  return v4;
}

- (BOOL)containsGenerationRecipeData
{
  void *v2;
  BOOL v3;

  -[AEAssetPackage generationRecipeData](self, "generationRecipeData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)containsGenerationSourceImage
{
  void *v2;
  BOOL v3;

  -[AEAssetPackage sourceImageURL](self, "sourceImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)generationRecipeData
{
  return -[AEAssetPackage sidecarDataForKey:](self, "sidecarDataForKey:", CFSTR("com.apple.assetexplorer.generatedimagerecipe"));
}

- (id)sourceImageURL
{
  void *v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_sendSourceFromMediaOrigin:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 6;
  else
    return qword_21E25A188[a3];
}

- (id)browserItemPayload
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  -[AEAssetPackage identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE159E8]);
  -[AEAssetPackage durableURLsSnapshotApplyingSuppression:](self, "durableURLsSnapshotApplyingSuppression:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)v6;
  if (v6)
  {
    objc_msgSend(v3, "setFileURL:", v6);
    objc_msgSend(v3, "setVideoComplementFileURL:", v24);
  }
  else
  {
    objc_msgSend(v3, "setFileURL:", v24);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("com.apple.assetexplorer.alasset.url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage sidecarPropertyListForKey:](self, "sidecarPropertyListForKey:", CFSTR("com.apple.video.slomo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", *MEMORY[0x24BEBEB20]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage sidecarNumberForKey:](self, "sidecarNumberForKey:", *MEMORY[0x24BEBEB18]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v8)
  {
    v12 = v10;
    v30 = *MEMORY[0x24BE15990];
    objc_msgSend(v8, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v14);

LABEL_8:
    v10 = v12;
    goto LABEL_9;
  }
  if (v9)
  {
    v12 = v10;
    v28 = *MEMORY[0x24BE159A0];
    v29 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v13);
    goto LABEL_8;
  }
LABEL_9:
  if (v25 && v10)
  {
    v15 = *MEMORY[0x24BE15998];
    v26[0] = *MEMORY[0x24BE159A8];
    v26[1] = v15;
    v27[0] = v25;
    v27[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v16);

  }
  -[AEAssetPackage sidecarSnapshot](self, "sidecarSnapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v4, CFSTR("AEAssetPackageDurableURLs"));
  objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("AEAssetPackageSidecar"));
  objc_msgSend(v11, "setObject:forKey:", v22, CFSTR("AEAssetPackageAssetIdentifier"));
  v18 = -[AEAssetPackage _sendSourceFromMediaOrigin:](self, "_sendSourceFromMediaOrigin:", -[AEAssetPackage mediaOrigin](self, "mediaOrigin"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v19, kAEChatKitPayloadSendSource);

  v20 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v3, "setUserInfo:", v20);

  return v3;
}

@end

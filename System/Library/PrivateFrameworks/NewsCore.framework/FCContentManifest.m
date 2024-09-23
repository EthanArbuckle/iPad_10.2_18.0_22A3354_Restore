@implementation FCContentManifest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAssetKeyIDs, 0);
  objc_storeStrong((id *)&self->_avAssetIDs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_assetWrappingKeyIDs, 0);
  objc_storeStrong((id *)&self->_assetURLs, 0);
}

- (FCContentManifest)initWithAssetURLs:(id)a3
{
  return -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (FCContentManifest)initWithManifests:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  FCContentManifest *v25;
  FCContentManifest *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v25 = self;
  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "assetURLs", v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v14);

        objc_msgSend(v13, "assetWrappingKeyIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v15);

        objc_msgSend(v13, "recordIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v16);

        objc_msgSend(v13, "avAssetIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v17);

        objc_msgSend(v13, "avAssetKeyIDs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v18);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](v25, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", v19, v20, v21, v22, v23);

  return v26;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (NSArray)avAssetIDs
{
  return self->_avAssetIDs;
}

- (NSArray)assetWrappingKeyIDs
{
  return self->_assetWrappingKeyIDs;
}

- (NSArray)assetURLs
{
  return self->_assetURLs;
}

- (NSArray)avAssetKeyURIs
{
  void *v2;
  void *v3;

  -[FCContentManifest avAssetKeyIDs](self, "avAssetKeyIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_89);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)avAssetKeyIDs
{
  return self->_avAssetKeyIDs;
}

- (FCContentManifest)initWithAssetURLs:(id)a3 assetWrappingKeyIDs:(id)a4 recordIDs:(id)a5 avAssetIDs:(id)a6 avAssetKeyIDs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCContentManifest *v17;
  uint64_t v18;
  NSArray *assetURLs;
  uint64_t v20;
  NSArray *assetWrappingKeyIDs;
  uint64_t v22;
  NSArray *recordIDs;
  uint64_t v24;
  NSArray *avAssetIDs;
  uint64_t v26;
  NSArray *avAssetKeyIDs;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FCContentManifest;
  v17 = -[FCContentManifest init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    assetURLs = v17->_assetURLs;
    v17->_assetURLs = (NSArray *)v18;

    v20 = objc_msgSend(v13, "copy");
    assetWrappingKeyIDs = v17->_assetWrappingKeyIDs;
    v17->_assetWrappingKeyIDs = (NSArray *)v20;

    v22 = objc_msgSend(v14, "copy");
    recordIDs = v17->_recordIDs;
    v17->_recordIDs = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    avAssetIDs = v17->_avAssetIDs;
    v17->_avAssetIDs = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    avAssetKeyIDs = v17->_avAssetKeyIDs;
    v17->_avAssetKeyIDs = (NSArray *)v26;

  }
  return v17;
}

- (FCContentManifest)initWithAssetURLs:(id)a3 assetWrappingKeyIDs:(id)a4
{
  return -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", a3, a4, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (FCContentManifest)initWithRecordIDs:(id)a3
{
  return -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

+ (FCContentManifest)empty
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FCContentManifest_empty__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0F8380 != -1)
    dispatch_once(&qword_1ED0F8380, block);
  return (FCContentManifest *)(id)_MergedGlobals_173;
}

void __26__FCContentManifest_empty__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  v1 = (void *)_MergedGlobals_173;
  _MergedGlobals_173 = v0;

}

+ (id)manifestByMergingManifest:(id)a3 withManifest:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v9 = (void *)MEMORY[0x1E0C99D20];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __60__FCContentManifest_manifestByMergingManifest_withManifest___block_invoke;
  v18 = &unk_1E463EFB0;
  v19 = v6;
  v20 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "fc_array:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithManifests:", v12, v15, v16, v17, v18);

  return v13;
}

void __60__FCContentManifest_manifestByMergingManifest_withManifest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  objc_msgSend(v4, "fc_safelyAddObject:", *(_QWORD *)(a1 + 40));

}

- (id)description
{
  FCDescription *v3;
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

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[FCContentManifest assetURLs](self, "assetURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("assetURLs"), v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[FCContentManifest assetWrappingKeyIDs](self, "assetWrappingKeyIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("assetWrappingKeyIDs"), v9);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[FCContentManifest recordIDs](self, "recordIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("recordIDs"), v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[FCContentManifest avAssetIDs](self, "avAssetIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("avAssetIDs"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[FCContentManifest avAssetKeyIDs](self, "avAssetKeyIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("avAssetKeyIDs"), v18);

  -[FCDescription descriptionString](v3, "descriptionString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)debugDescription
{
  FCDescription *v3;
  const __CFArray *v4;
  void *v5;
  const __CFArray *v6;
  void *v7;
  const __CFArray *v8;
  void *v9;
  const __CFArray *v10;
  void *v11;
  const __CFArray *v12;
  void *v13;
  void *v14;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCContentManifest assetURLs](self, "assetURLs");
  v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  FCCFArrayDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("assetURLs"), v5);

  -[FCContentManifest assetWrappingKeyIDs](self, "assetWrappingKeyIDs");
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  FCCFArrayDescription(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("assetWrappingKeyIDs"), v7);

  -[FCContentManifest recordIDs](self, "recordIDs");
  v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  FCCFArrayDescription(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("recordIDs"), v9);

  -[FCContentManifest avAssetIDs](self, "avAssetIDs");
  v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  FCCFArrayDescription(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("avAssetIDs"), v11);

  -[FCContentManifest avAssetKeyIDs](self, "avAssetKeyIDs");
  v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  FCCFArrayDescription(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("avAssetKeyIDs"), v13);

  -[FCDescription descriptionString](v3, "descriptionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __35__FCContentManifest_avAssetKeyURIs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCContentManifest)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCContentManifest *v11;

  v4 = qword_1ED0F8390;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&qword_1ED0F8390, &__block_literal_global_16_1);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", qword_1ED0F8388, CFSTR("assetURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", qword_1ED0F8388, CFSTR("assetWrappingKeyIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", qword_1ED0F8388, CFSTR("recordIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", qword_1ED0F8388, CFSTR("avAssetIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", qword_1ED0F8388, CFSTR("avAssetKeyIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", v6, v7, v8, v9, v10);
  return v11;
}

void __35__FCContentManifest_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0F8388;
  qword_1ED0F8388 = v4;

}

- (void)encodeWithCoder:(id)a3
{
  NSArray *assetURLs;
  id v5;

  assetURLs = self->_assetURLs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetURLs, CFSTR("assetURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetWrappingKeyIDs, CFSTR("assetWrappingKeyIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordIDs, CFSTR("recordIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_avAssetIDs, CFSTR("avAssetIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_avAssetKeyIDs, CFSTR("avAssetKeyIDs"));

}

- (FCContentManifest)copyWithAssetsOnly
{
  FCContentManifest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FCContentManifest *v8;

  v3 = [FCContentManifest alloc];
  -[FCContentManifest assetURLs](self, "assetURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCContentManifest assetWrappingKeyIDs](self, "assetWrappingKeyIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCContentManifest avAssetIDs](self, "avAssetIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCContentManifest avAssetKeyIDs](self, "avAssetKeyIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](v3, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", v4, v5, MEMORY[0x1E0C9AA60], v6, v7);

  return v8;
}

- (FCContentManifest)initWithAssetWrappingKeyIDs:(id)a3
{
  return -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", MEMORY[0x1E0C9AA60], a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (FCContentManifest)initWithAVAssetIDs:(id)a3 avAssetKeyIDs:(id)a4
{
  return -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3, a4);
}

- (FCContentManifest)initWithAVAssetIDs:(id)a3
{
  return -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3, MEMORY[0x1E0C9AA60]);
}

- (FCContentManifest)initWithAVAssetKeyIDs:(id)a3
{
  return -[FCContentManifest initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:](self, "initWithAssetURLs:assetWrappingKeyIDs:recordIDs:avAssetIDs:avAssetKeyIDs:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3);
}

@end

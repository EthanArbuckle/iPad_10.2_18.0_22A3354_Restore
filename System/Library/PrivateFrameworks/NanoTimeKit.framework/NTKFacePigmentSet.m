@implementation NTKFacePigmentSet

- (BOOL)hasMultipleSlots
{
  return -[NSDictionary count](self->_collectionBySlots, "count") > 1;
}

- (id)pigmentSet
{
  void *v2;
  void *v3;

  -[NSDictionary allValues](self->_collectionBySlots, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)collectionForSlot:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4
    || (-[NSDictionary objectForKeyedSubscript:](self->_collectionBySlots, "objectForKeyedSubscript:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NTKFacePigmentSet pigmentSet](self, "pigmentSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSArray)defaultGalleryColors
{
  void *v2;
  void *v3;

  -[NTKFacePigmentSet pigmentSet](self, "pigmentSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultGalleryColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)numberOfSlots
{
  return -[NSDictionary count](self->_collectionBySlots, "count");
}

- (int64_t)numberOfItemsForAllSlots
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NTKFacePigmentSet collectionBySlots](self, "collectionBySlots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NTKFacePigmentSet_numberOfItemsForAllSlots__block_invoke;
  v5[3] = &unk_1E6BD2730;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__NTKFacePigmentSet_numberOfItemsForAllSlots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)pigmentsFromMostRecentAddableCollectionForSlot:(id)a3
{
  void *v3;
  void *v4;

  -[NTKFacePigmentSet collectionForSlot:](self, "collectionForSlot:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pigmentsFromMostRecentAddableCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pigmentsFromMostRecentAddableCollectionsForSlot:(id)a3
{
  void *v3;
  void *v4;

  -[NTKFacePigmentSet collectionForSlot:](self, "collectionForSlot:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pigmentsFromMostRecentAddableCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFacePigmentSet domain](self, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = NTKEqualObjects(v6, v7);

    if (!v8)
      goto LABEL_7;
    v9 = objc_msgSend(v5, "numberOfSlots");
    if (v9 != -[NTKFacePigmentSet numberOfSlots](self, "numberOfSlots"))
      goto LABEL_7;
    objc_msgSend(v5, "collectionBySlots");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[NTKFacePigmentSet collectionBySlots](self, "collectionBySlots");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 == v13)
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 1;
      objc_msgSend(v5, "collectionBySlots");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __29__NTKFacePigmentSet_isEqual___block_invoke;
      v17[3] = &unk_1E6BD2758;
      v17[4] = self;
      v17[5] = &v18;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

      v15 = *((_BYTE *)v19 + 24) != 0;
      _Block_object_dispose(&v18, 8);
    }
    else
    {
LABEL_7:
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __29__NTKFacePigmentSet_isEqual___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "collectionBySlots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v8, "isEqual:", v11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v9;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

- (id)description
{
  return -[NSDictionary description](self->_collectionBySlots, "description");
}

+ (id)facePigmentSetFromProtoBuffer:(id)a3 sharedCollections:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v6 = a4;
  if (a3)
  {
    v7 = a3;
    v8 = objc_alloc_init((Class)a1);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "collectionBySlotsCount"));
    objc_msgSend(v7, "collectionBySlots");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke;
    v20 = &unk_1E6BD2780;
    v21 = v6;
    v11 = v9;
    v22 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);

    v12 = (void *)v8[2];
    v8[2] = v11;
    v13 = v11;

    objc_msgSend(v7, "domain", v17, v18, v19, v20);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v8[1];
    v8[1] = v14;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPigmentCollection collectionFromProtoBuffer:sharedCollections:](NTKPigmentCollection, "collectionFromProtoBuffer:sharedCollections:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "slot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "slot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v8);

  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke_cold_1(v3, v9);

  }
}

- (id)protoBuffer
{
  NTKProtoFacePigmentSet *v3;
  NSDictionary *collectionBySlots;
  NTKProtoFacePigmentSet *v5;
  _QWORD v7[4];
  NTKProtoFacePigmentSet *v8;

  v3 = objc_alloc_init(NTKProtoFacePigmentSet);
  -[NTKProtoFacePigmentSet setDomain:](v3, "setDomain:", self->_domain);
  collectionBySlots = self->_collectionBySlots;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__NTKFacePigmentSet_protoBuffer__block_invoke;
  v7[3] = &unk_1E6BD27A8;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](collectionBySlots, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __32__NTKFacePigmentSet_protoBuffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NTKProtoCollectionBySlot *v8;

  v5 = a3;
  v6 = a2;
  v8 = objc_alloc_init(NTKProtoCollectionBySlot);
  -[NTKProtoCollectionBySlot setSlot:](v8, "setSlot:", v6);

  objc_msgSend(v5, "protoBufferIgnoringSharedCollections:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKProtoCollectionBySlot setCollection:](v8, "setCollection:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addCollectionBySlots:", v8);

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)collectionBySlots
{
  return self->_collectionBySlots;
}

- (void)setCollectionBySlots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionBySlots, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

void __69__NTKFacePigmentSet_facePigmentSetFromProtoBuffer_sharedCollections___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "formattedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "#color-sync Failure while decoding facePigmentSet from protobuffer. Protobuffer object is missing slot or collection. Collection won't be included in decoded face pigment set. %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

@implementation MPMusicPlayerStoreQueueDescriptor

- (MPMusicPlayerStoreQueueDescriptor)initWithStoreIDs:(NSArray *)storeIDs
{
  NSArray *v4;
  MPMusicPlayerStoreQueueDescriptor *v5;
  uint64_t v6;
  NSArray *v7;
  objc_super v9;

  v4 = storeIDs;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor _init](&v9, sel__init);
  if (v5)
  {
    v6 = -[NSArray copy](v4, "copy");
    v7 = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  char v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  if (-[MPMusicPlayerQueueDescriptor isEqual:](&v20, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (NSArray *)v5[10];
    v7 = self->_storeIDs;
    v8 = v7;
    if (v7 == v6)
      v9 = 1;
    else
      v9 = -[NSArray isEqual:](v7, "isEqual:", v6);

    v11 = (NSString *)v5[12];
    v12 = self->_startItemID;
    v13 = v12;
    if (v12 == v11)
      v14 = 1;
    else
      v14 = -[NSString isEqual:](v12, "isEqual:", v11);

    v15 = (NSMutableDictionary *)v5[11];
    v16 = self->_storeFronts;
    v17 = v16;
    if (v16 == v15)
      v18 = 1;
    else
      v18 = -[NSMutableDictionary isEqual:](v16, "isEqual:", v15);

    v10 = v9 & v14 & v18;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MPMusicPlayerStoreQueueDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerStoreQueueDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *storeIDs;
  uint64_t v11;
  NSString *startItemID;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *storeFronts;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPMusicPlayerStoreQueueDescriptorStoreIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerStoreQueueDescriptorStartItemID"));
    v11 = objc_claimAutoreleasedReturnValue();
    startItemID = v5->_startItemID;
    v5->_startItemID = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("MPMusicPlayerStoreQueueDescriptorStoreFronts"));
    v16 = objc_claimAutoreleasedReturnValue();
    storeFronts = v5->_storeFronts;
    v5->_storeFronts = (NSMutableDictionary *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  v4 = a3;
  -[MPMusicPlayerQueueDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIDs, CFSTR("MPMusicPlayerStoreQueueDescriptorStoreIDs"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startItemID, CFSTR("MPMusicPlayerStoreQueueDescriptorStartItemID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeFronts, CFSTR("MPMusicPlayerStoreQueueDescriptorStoreFronts"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  v4 = -[MPMusicPlayerQueueDescriptor copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSMutableDictionary mutableCopy](self->_storeFronts, "mutableCopy");
  v6 = (void *)v4[11];
  v4[11] = v5;

  v7 = -[NSArray copy](self->_storeIDs, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_startItemID, "copy");
  v10 = (void *)v4[12];
  v4[12] = v9;

  return v4;
}

- (void)setStartTime:(NSTimeInterval)startTime forItemWithStoreID:(NSString *)storeID
{
  uint64_t v6;
  uint64_t v7;
  MPIdentifierSet *v8;
  void *v9;
  MPIdentifierSet *v10;
  objc_super v11;
  _QWORD v12[5];

  v6 = -[NSString longLongValue](storeID, "longLongValue");
  if (v6)
  {
    v7 = v6;
    v8 = [MPIdentifierSet alloc];
    +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke;
    v12[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v12[4] = v7;
    v10 = -[MPIdentifierSet initWithSource:modelKind:block:](v8, "initWithSource:modelKind:block:", CFSTR("MPMusicPlayerQueueDescriptor"), v9, v12);
    v11.receiver = self;
    v11.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
    -[MPMusicPlayerQueueDescriptor _setStartTime:forIdentifiers:](&v11, sel__setStartTime_forIdentifiers_, v10, startTime);

  }
}

- (void)setEndTime:(NSTimeInterval)endTime forItemWithStoreID:(NSString *)storeID
{
  uint64_t v6;
  uint64_t v7;
  MPIdentifierSet *v8;
  void *v9;
  MPIdentifierSet *v10;
  objc_super v11;
  _QWORD v12[5];

  v6 = -[NSString longLongValue](storeID, "longLongValue");
  if (v6)
  {
    v7 = v6;
    v8 = [MPIdentifierSet alloc];
    +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke;
    v12[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v12[4] = v7;
    v10 = -[MPIdentifierSet initWithSource:modelKind:block:](v8, "initWithSource:modelKind:block:", CFSTR("MPMusicPlayerQueueDescriptor"), v9, v12);
    v11.receiver = self;
    v11.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
    -[MPMusicPlayerQueueDescriptor _setEndTime:forIdentifiers:](&v11, sel__setEndTime_forIdentifiers_, v10, endTime);

  }
}

- (NSArray)storeIDs
{
  return (NSArray *)(id)-[NSArray copy](self->_storeIDs, "copy");
}

- (BOOL)isEmpty
{
  return -[NSArray count](self->_storeIDs, "count") == 0;
}

- (void)setStoreIDs:(NSArray *)storeIDs
{
  objc_setProperty_nonatomic_copy(self, a2, storeIDs, 80);
}

- (NSString)startItemID
{
  return self->_startItemID;
}

- (void)setStartItemID:(NSString *)startItemID
{
  objc_setProperty_nonatomic_copy(self, a2, startItemID, 96);
}

- (NSDictionary)assetStoreFronts
{
  return self->_assetStoreFronts;
}

- (void)setAssetStoreFronts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetStoreFronts, 0);
  objc_storeStrong((id *)&self->_startItemID, 0);
  objc_storeStrong((id *)&self->_storeFronts, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
}

uint64_t __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke_2;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);
}

void __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAdamID:", v3);
  objc_msgSend(v4, "setSubscriptionAdamID:", *(_QWORD *)(a1 + 32));

}

uint64_t __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke_2;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);
}

void __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAdamID:", v3);
  objc_msgSend(v4, "setSubscriptionAdamID:", *(_QWORD *)(a1 + 32));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

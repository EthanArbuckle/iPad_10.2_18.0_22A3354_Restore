@implementation CNIndexClientState

- (CNIndexClientState)init
{
  CNIndexClientState *v2;
  CNIndexClientState *v3;
  CNChangeHistoryAnchor *fullSyncSnapshotAnchor;
  CNIndexClientState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNIndexClientState;
  v2 = -[CNIndexClientState init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isFullSyncDone = 0;
    fullSyncSnapshotAnchor = v2->_fullSyncSnapshotAnchor;
    v2->_indexVersion = 4;
    v2->_fullSyncSnapshotAnchor = 0;

    v3->_fullSyncOffset = 0;
    v5 = v3;
  }

  return v3;
}

+ (CNIndexClientState)clientStateWithData:(id)a3 logger:(id)a4
{
  id v5;
  id v6;
  CNIndexClientState *p_cache;
  CNIndexClientState *v8;
  void *v9;
  id v10;
  int v11;
  id v13;

  v5 = a3;
  v6 = a4;
  p_cache = (CNIndexClientState *)&OBJC_METACLASS___CNiOSABInstantMessageAddressContactPredicate.cache;
  v8 = objc_alloc_init(CNIndexClientState);
  v13 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v13);
  v10 = v13;
  if (v9)
  {
    p_cache = -[CNIndexClientState initWithCoder:]([CNIndexClientState alloc], "initWithCoder:", v9);
    v11 = 1;
  }
  else
  {
    objc_msgSend(v6, "failedToCreateUnarchiverForClientStateWithError:", v10);
    v11 = 0;
  }

  objc_msgSend(v9, "finishDecoding");
  if ((v11 | 2) == 2)
    p_cache = v8;

  return p_cache;
}

- (id)data
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[CNIndexClientState encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_indexVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFullSyncDone);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryAnchor sequenceNumber](self->_fullSyncSnapshotAnchor, "sequenceNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_fullSyncOffset);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("indexVersion"), v4, CFSTR("isFullSyncDone"), v5, CFSTR("fullSyncSnapshotAnchor.sequenceNumber"), v6, CFSTR("fullSyncOffset"), v7, 0);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNIndexClientState)initWithCoder:(id)a3
{
  id v4;
  CNIndexClientState *v5;
  CNChangeHistoryAnchor *v6;
  CNChangeHistoryAnchor *fullSyncSnapshotAnchor;
  CNIndexClientState *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNIndexClientState;
  v5 = -[CNIndexClientState init](&v10, sel_init);
  if (v5)
  {
    v5->_indexVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("1"));
    v5->_isFullSyncDone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("2"));
    v6 = -[CNChangeHistoryAnchor initWithSequenceNumber:]([CNChangeHistoryAnchor alloc], "initWithSequenceNumber:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("3")));
    fullSyncSnapshotAnchor = v5->_fullSyncSnapshotAnchor;
    v5->_fullSyncSnapshotAnchor = v6;

    v5->_fullSyncOffset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("4"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CNIndexClientState indexVersion](self, "indexVersion"), CFSTR("1"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CNIndexClientState isFullSyncDone](self, "isFullSyncDone"), CFSTR("2"));
  -[CNIndexClientState fullSyncSnapshotAnchor](self, "fullSyncSnapshotAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", objc_msgSend(v4, "sequenceNumber"), CFSTR("3"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CNIndexClientState fullSyncOffset](self, "fullSyncOffset"), CFSTR("4"));
}

- (int64_t)indexVersion
{
  return self->_indexVersion;
}

- (void)setIndexVersion:(int64_t)a3
{
  self->_indexVersion = a3;
}

- (BOOL)isFullSyncDone
{
  return self->_isFullSyncDone;
}

- (void)setIsFullSyncDone:(BOOL)a3
{
  self->_isFullSyncDone = a3;
}

- (CNChangeHistoryAnchor)fullSyncSnapshotAnchor
{
  return self->_fullSyncSnapshotAnchor;
}

- (void)setFullSyncSnapshotAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_fullSyncSnapshotAnchor, a3);
}

- (int64_t)fullSyncOffset
{
  return self->_fullSyncOffset;
}

- (void)setFullSyncOffset:(int64_t)a3
{
  self->_fullSyncOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullSyncSnapshotAnchor, 0);
}

@end

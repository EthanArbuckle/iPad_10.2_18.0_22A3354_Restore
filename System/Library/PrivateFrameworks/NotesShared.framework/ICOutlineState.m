@implementation ICOutlineState

- (ICOutlineState)initWithData:(id)a3
{
  id v4;
  ICOutlineState *v5;
  ICTTMergeableWallClockValue *v6;
  ICTTMergeableWallClockValue *mergeableValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICOutlineState;
  v5 = -[ICOutlineState init](&v9, sel_init);
  if (v5)
  {
    v6 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v4);
    mergeableValue = v5->_mergeableValue;
    v5->_mergeableValue = v6;

    -[ICOutlineState updateCollapsedUUIDs](v5, "updateCollapsedUUIDs");
  }

  return v5;
}

- (ICOutlineState)initWithCollapsedUUIDs:(id)a3
{
  id v4;
  ICOutlineState *v5;
  uint64_t v6;
  NSSet *collapsedUUIDs;
  ICTTMergeableWallClockValue *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ICTTMergeableWallClockValue *mergeableValue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICOutlineState;
  v5 = -[ICOutlineState init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    collapsedUUIDs = v5->_collapsedUUIDs;
    v5->_collapsedUUIDs = (NSSet *)v6;

    v8 = [ICTTMergeableWallClockValue alloc];
    -[ICOutlineState collapsedUUIDStrings](v5, "collapsedUUIDStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICTTMergeableWallClockValue initWithValue:timestamp:](v8, "initWithValue:timestamp:", v9, v10);
    mergeableValue = v5->_mergeableValue;
    v5->_mergeableValue = (ICTTMergeableWallClockValue *)v11;

  }
  return v5;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[ICOutlineState mergeableValue](self, "mergeableValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)mergeWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  -[ICOutlineState mergeableValue](self, "mergeableValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICOutlineState mergeableValue](self, "mergeableValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mergeableValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "merge:", v7);

    -[ICOutlineState updateCollapsedUUIDs](self, "updateCollapsedUUIDs");
    v9 = v8 == 2;
  }
  else
  {
    objc_msgSend(v4, "mergeableValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICOutlineState setMergeableValue:](self, "setMergeableValue:", v10);

    v9 = 1;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  ICOutlineState *v4;
  ICOutlineState *v5;
  BOOL v6;

  v4 = (ICOutlineState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICOutlineState isEqualToICOutlineState:](self, "isEqualToICOutlineState:", v5);

  return v6;
}

- (unint64_t)hash
{
  id v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[ICOutlineState collapsedUUIDs](self, "collapsedUUIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v5 += ICHashWithObject(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v18 = ICHashWithHashKeys(v5, v11, v12, v13, v14, v15, v16, v17, 0);
  return v18;
}

- (void)updateCollapsedUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *collapsedUUIDs;
  id v9;

  objc_opt_class();
  -[ICOutlineState mergeableValue](self, "mergeableValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_37);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  collapsedUUIDs = self->_collapsedUUIDs;
  self->_collapsedUUIDs = v7;

}

id __38__ICOutlineState_updateCollapsedUUIDs__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (NSArray)collapsedUUIDStrings
{
  void *v2;
  void *v3;
  void *v4;

  -[ICOutlineState collapsedUUIDs](self, "collapsedUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_map:", &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __38__ICOutlineState_collapsedUUIDStrings__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (BOOL)isEqualToICOutlineState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICOutlineState collapsedUUIDs](self, "collapsedUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collapsedUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToSet:", v6);
  return (char)v4;
}

- (NSSet)collapsedUUIDs
{
  return self->_collapsedUUIDs;
}

- (ICTTMergeableWallClockValue)mergeableValue
{
  return self->_mergeableValue;
}

- (void)setMergeableValue:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValue, 0);
  objc_storeStrong((id *)&self->_collapsedUUIDs, 0);
}

@end

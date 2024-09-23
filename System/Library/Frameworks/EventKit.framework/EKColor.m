@implementation EKColor

- (EKColor)initWithEventStore:(id)a3
{
  EKColor *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKColor;
  v3 = -[EKObject init](&v6, sel_init, a3);
  if (v3)
  {
    EKUUIDString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKColor setUUID:](v3, "setUUID:", v4);

    -[EKObject updatePersistentValueForKeyIfNeeded:](v3, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B820]);
  }
  return v3;
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_5 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_5, &__block_literal_global_35);
  return (id)knownIdentityKeysForComparison_keys_5;
}

void __41__EKColor_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_5;
  knownIdentityKeysForComparison_keys_5 = v0;

}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

- (NSData)data
{
  return (NSData *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B5B8]);
}

- (void)setData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B5B8]);
}

- (NSString)providerIdentifier
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B5C0]);
}

- (void)setProviderIdentifier:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B5C0]);
}

- (NSString)UUID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (NSString)externalID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (EKSource)source
{
  return (EKSource *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B5C8]);
}

- (void)setSource:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B5C8];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, objc_opt_class());

}

- (BOOL)validate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)EKColor;
  v5 = -[EKObject validate:](&v16, sel_validate_);
  if (v5)
  {
    if (!-[EKObject isNew](self, "isNew"))
    {
      v18[0] = *MEMORY[0x1E0D0B5C8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[EKObject hasUnsavedChangesInKeys:](self, "hasUnsavedChangesInKeys:", v6);

      if (v7)
      {
        if (a3)
        {
          v8 = 72;
LABEL_16:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", v8);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = 0;
          *a3 = v14;
          return v5;
        }
        goto LABEL_17;
      }
    }
    if (!-[EKObject isNew](self, "isNew"))
    {
      v17 = *MEMORY[0x1E0D0B820];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[EKObject hasUnsavedChangesInKeys:](self, "hasUnsavedChangesInKeys:", v9);

      if (v10)
      {
        if (a3)
        {
          v8 = 74;
          goto LABEL_16;
        }
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    -[EKColor externalID](self, "externalID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      -[EKColor providerIdentifier](self, "providerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {

    }
    if (a3)
    {
      v8 = 75;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  return v5;
}

- (BOOL)save:(id *)a3
{
  _BOOL4 v5;

  v5 = -[EKObject isNew](self, "isNew");
  if (v5)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 73);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[EKObject updatePersistentObject](self, "updatePersistentObject");
  }
  return !v5;
}

@end

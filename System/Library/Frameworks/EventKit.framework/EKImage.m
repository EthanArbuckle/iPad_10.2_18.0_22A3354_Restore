@implementation EKImage

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_2 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_2, &__block_literal_global_18);
  return (id)knownIdentityKeysForComparison_keys_2;
}

void __41__EKImage_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B728];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_2;
  knownIdentityKeysForComparison_keys_2 = v0;

}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)imageWithEventStore:(id)a3 systemSymbolName:(id)a4 colorData:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init((Class)objc_msgSend(a1, "frozenClass"));
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentObject:", v9);
  objc_msgSend(v10, "setName:", v8);

  objc_msgSend(v10, "setColorData:", v7);
  objc_msgSend(v10, "setType:", 1);

  return v10;
}

- (NSString)name
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B730]);
}

- (void)setName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B730]);
}

- (NSData)colorData
{
  return (NSData *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B720]);
}

- (void)setColorData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B720]);
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B740]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B740]);

}

- (id)identifier
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B728]);
}

- (void)setIdentifier:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B728]);
}

- (id)source
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B738]);
}

- (void)setSource:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B738];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, objc_opt_class());

}

- (void)saveInCalendar:(id)a3
{
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
  id v14;

  v14 = a3;
  objc_msgSend(v14, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[EKObject isNew](self, "isNew"))
  {
    -[EKImage source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v9) & 1) != 0)
      goto LABEL_10;
    -[EKImage identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistentImageForSourceID:identifier:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[EKObject setBackingObject:](self, "setBackingObject:", v13);
      -[EKObject markAsSaved](self, "markAsSaved");

      goto LABEL_10;
    }
    -[EKObject rebase](self, "rebase");

  }
  -[EKImage setSource:](self, "setSource:", v4);
  -[EKImage identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[EKImage _generateIdentifierInCalendar:](self, "_generateIdentifierInCalendar:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKImage setIdentifier:](self, "setIdentifier:", v7);

  }
  objc_msgSend(v5, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateToCachedVersionOrCacheImage:", self);

  -[EKObject backingObject](self, "backingObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isNew") && (objc_msgSend(v9, "_isPendingInsert") & 1) == 0)
    objc_msgSend(v5, "_insertObject:", v9);
LABEL_10:

}

- (id)_generateIdentifierInCalendar:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  char v17;
  _BYTE v18[3];
  unsigned __int8 md[20];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = -[EKImage type](self, "type", a3);
  if (v4 == 2)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[EKImage name](self, "name");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("custom:%@"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
      return CFSTR("icon");
    -[EKImage colorData](self, "colorData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_retainAutorelease(v5);
      CC_SHA1((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), md);
      v8 = 0;
      v9 = v18;
      do
      {
        v10 = md[v8];
        *(v9 - 1) = _generateIdentifierInCalendar__nibbleToChar[v10 & 0xF];
        *v9 = _generateIdentifierInCalendar__nibbleToChar[v10 >> 4];
        v9 += 2;
        ++v8;
      }
      while (v8 != 8);
      v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v17, 16, 4);
    }
    else
    {
      v11 = CFSTR("nocolor");
    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[EKImage name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("symbol:%@:%@"), v11, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

@end

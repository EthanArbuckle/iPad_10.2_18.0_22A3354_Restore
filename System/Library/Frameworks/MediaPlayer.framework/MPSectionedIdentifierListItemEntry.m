@implementation MPSectionedIdentifierListItemEntry

- (MPSectionedIdentifierListItemEntry)initWithCoder:(id)a3
{
  id v4;
  MPSectionedIdentifierListItemEntry *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPSectionedIdentifierListItemEntry;
  v5 = -[MPSectionedIdentifierListEntry initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iid"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("f"));
    v5->_dataSourceMoved = v8 & 1;
    v5->_dataSourceCloned = (v8 & 2) != 0;
    v5->_userRemoved = (v8 & 4) != 0;
    v5->_userMoved = (v8 & 8) != 0;
    v5->_userCloned = (v8 & 0x10) != 0;
    v5->_hasClones = (v8 & 0x20) != 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)entryType
{
  return 3;
}

- (BOOL)isRemoved
{
  return -[MPSectionedIdentifierListItemEntry isUserMoved](self, "isUserMoved")
      || -[MPSectionedIdentifierListItemEntry isUserRemoved](self, "isUserRemoved")
      || -[MPSectionedIdentifierListItemEntry isDataSourceMoved](self, "isDataSourceMoved")
      || -[MPSectionedIdentifierListItemEntry isDataSourceRemoved](self, "isDataSourceRemoved");
}

- (BOOL)isUserRemoved
{
  return self->_userRemoved;
}

- (BOOL)isUserMoved
{
  return self->_userMoved;
}

- (BOOL)isDataSourceMoved
{
  return self->_dataSourceMoved;
}

- (MPSectionedIdentifierListItemEntry)latestUserClone
{
  uint64_t v3;
  void *v4;
  MPSectionedIdentifierListItemEntry *v5;
  MPSectionedIdentifierListItemEntry *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  MPSectionedIdentifierListItemEntry *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MPSectionedIdentifierListItemEntry rootEntry](self, "rootEntry");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (MPSectionedIdentifierListItemEntry *)v3;
  else
    v5 = self;
  v6 = v5;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MPSectionedIdentifierListItemEntry clonedEntries](v6, "clonedEntries", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v13, "isRemoved"))
        {
          v14 = v13;

          goto LABEL_14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = self;
LABEL_14:

  return v14;
}

- (BOOL)isDataSourceRemoved
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[MPSectionedIdentifierListItemEntry rootEntry](self, "rootEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isDataSourceRemoved");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPSectionedIdentifierListItemEntry;
    v5 = -[MPSectionedIdentifierListEntry isDataSourceRemoved](&v8, sel_isDataSourceRemoved);
  }
  v6 = v5;

  return v6;
}

- (MPSectionedIdentifierListItemEntry)rootEntry
{
  return (MPSectionedIdentifierListItemEntry *)objc_loadWeakRetained((id *)&self->_rootEntry);
}

- (NSMutableArray)clonedEntries
{
  return self->_clonedEntries;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)hasClones
{
  return self->_hasClones;
}

- (BOOL)isUserCloned
{
  return self->_userCloned;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t dataSourceMoved;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPSectionedIdentifierListItemEntry;
  v4 = a3;
  -[MPSectionedIdentifierListEntry encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("iid"), v7.receiver, v7.super_class);
  dataSourceMoved = self->_dataSourceMoved;
  if (self->_dataSourceCloned)
    dataSourceMoved |= 2uLL;
  if (self->_userRemoved)
    dataSourceMoved |= 4uLL;
  if (self->_userMoved)
    dataSourceMoved |= 8uLL;
  if (self->_userCloned)
    dataSourceMoved |= 0x10uLL;
  if (self->_hasClones)
    v6 = dataSourceMoved | 0x20;
  else
    v6 = dataSourceMoved;
  objc_msgSend(v4, "encodeInteger:forKey:", v6, CFSTR("f"));

}

- (id)_stateDumpObject
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  void *v19;
  objc_super v20;
  _QWORD v21[9];
  _QWORD v22[11];

  v22[9] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)MPSectionedIdentifierListItemEntry;
  -[MPSectionedIdentifierListEntry _stateDumpObject](&v20, sel__stateDumpObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = -[MPSectionedIdentifierListItemEntry state](self, "state");
  v7 = v6;
  -[MPSectionedIdentifierListItemEntry itemIdentifier](self, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("_itemID"));

  v21[0] = CFSTR("userMoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  v21[1] = CFSTR("userRemoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v5 >> 8) & 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  v21[2] = CFSTR("dataSourceMoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v5 >> 16) & 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v10;
  v21[3] = CFSTR("dataSourceRemoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v5 >> 24) & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v11;
  v21[4] = CFSTR("hasClones");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIDWORD(v5) & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v12;
  v21[5] = CFSTR("isClone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v5 >> 40) & 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v13;
  v21[6] = CFSTR("isActiveClone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIWORD(v5) & 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = CFSTR("isActiveDataSourceClone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIBYTE(v5) & 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v15;
  v21[8] = CFSTR("generationNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("state"));

  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPSectionedIdentifierListEntry sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierListItemEntry itemIdentifier](self, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@ - %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)stringRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[MPSectionedIdentifierListEntry sectionIdentifier](self, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierListEntry positionKey](self, "positionKey", v3, self->_itemIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("∆"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDataSourceRemoved
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MPSectionedIdentifierListItemEntry rootEntry](self, "rootEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setDataSourceRemoved");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MPSectionedIdentifierListItemEntry;
    -[MPSectionedIdentifierListEntry setDataSourceRemoved](&v5, sel_setDataSourceRemoved);
  }

}

- (void)setDataSourceCloned
{
  self->_dataSourceCloned = 1;
}

- (void)setDataSourceMoved
{
  self->_dataSourceMoved = 1;
}

- (void)setUserRemoved
{
  self->_userRemoved = 1;
}

- (void)setUserMoved
{
  self->_userMoved = 1;
}

- (void)setUserCloned
{
  self->_userCloned = 1;
}

- ($8BEA2F14B5BFFCEA171CA5B3383F4BB6)state
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  MPSectionedIdentifierListItemEntry *v9;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  MPSectionedIdentifierListItemEntry *v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  _BOOL4 v26;
  $8BEA2F14B5BFFCEA171CA5B3383F4BB6 result;

  -[MPSectionedIdentifierListItemEntry rootEntry](self, "rootEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPSectionedIdentifierListItemEntry isUserMoved](self, "isUserMoved");
  v5 = -[MPSectionedIdentifierListItemEntry isUserRemoved](self, "isUserRemoved");
  v6 = -[MPSectionedIdentifierListItemEntry isDataSourceMoved](self, "isDataSourceMoved");
  v7 = -[MPSectionedIdentifierListItemEntry isDataSourceRemoved](self, "isDataSourceRemoved");
  v8 = -[MPSectionedIdentifierListItemEntry hasClones](self, "hasClones");
  if (v3)
  {
    -[MPSectionedIdentifierListItemEntry latestUserClone](self, "latestUserClone");
    v9 = (MPSectionedIdentifierListItemEntry *)objc_claimAutoreleasedReturnValue();
    v26 = v8;
    v10 = (unint64_t)(v9 == self) << 48;
    -[MPSectionedIdentifierListItemEntry latestDataSourceClone](self, "latestDataSourceClone");
    v11 = v7;
    v12 = v6;
    v13 = v5;
    v14 = v4;
    v15 = (MPSectionedIdentifierListItemEntry *)objc_claimAutoreleasedReturnValue();
    v16 = (unint64_t)(v15 == self) << 56;
    v17 = -[MPSectionedIdentifierListItemEntry _generationNumber](self, "_generationNumber");

    v4 = v14;
    v5 = v13;
    v6 = v12;
    v7 = v11;
    v18 = v10;
    v8 = v26;

    v19 = 0x10000000000;
  }
  else
  {
    v17 = -[MPSectionedIdentifierListItemEntry _generationNumber](self, "_generationNumber");
    v16 = 0;
    v18 = 0;
    v19 = 0;
  }

  v20 = 0x100000000;
  if (!v8)
    v20 = 0;
  v21 = 0x1000000;
  if (!v7)
    v21 = 0;
  v22 = 0x10000;
  if (!v6)
    v22 = 0;
  v23 = 256;
  if (!v5)
    v23 = 0;
  v24 = v23 | v4 | v22 | v21 | v20 | v16 | v18 | v19;
  v25 = v17;
  result.var8 = v25;
  result.var0 = v24;
  result.var1 = BYTE1(v24);
  result.var2 = BYTE2(v24);
  result.var3 = BYTE3(v24);
  result.var4 = BYTE4(v24);
  result.var5 = BYTE5(v24);
  result.var6 = BYTE6(v24);
  result.var7 = HIBYTE(v24);
  return result;
}

- (MPSectionedIdentifierListItemEntry)latestDataSourceClone
{
  uint64_t v3;
  void *v4;
  MPSectionedIdentifierListItemEntry *v5;
  MPSectionedIdentifierListItemEntry *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  MPSectionedIdentifierListItemEntry *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MPSectionedIdentifierListItemEntry rootEntry](self, "rootEntry");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (MPSectionedIdentifierListItemEntry *)v3;
  else
    v5 = self;
  v6 = v5;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MPSectionedIdentifierListItemEntry clonedEntries](v6, "clonedEntries", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isDataSourceCloned") & 1) != 0)
        {
          v14 = v13;

          goto LABEL_14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = v6;
LABEL_14:

  return v14;
}

- (id)newClonedEntry
{
  uint64_t v3;
  void *v4;
  MPSectionedIdentifierListItemEntry *v5;
  MPSectionedIdentifierListItemEntry *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[MPSectionedIdentifierListItemEntry rootEntry](self, "rootEntry");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (MPSectionedIdentifierListItemEntry *)v3;
  else
    v5 = self;
  v6 = v5;

  -[MPSectionedIdentifierListEntry sectionIdentifier](self, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierListItemEntry itemIdentifier](self, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierListEntry positionKey](self, "positionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSectionedIdentifierListItemEntry itemEntryWithSectionIdentifier:itemIdentifier:generationPrefix:](MPSectionedIdentifierListItemEntry, "itemEntryWithSectionIdentifier:itemIdentifier:generationPrefix:", v7, v8, v10);
  v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setRootEntry:", v6);
  -[MPSectionedIdentifierListEntry hostedSectionIdentifier](self, "hostedSectionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHostedSectionIdentifier:", v12);

  v11[67] = self->_userRemoved;
  v11[68] = self->_userMoved;
  v11[66] = self->_dataSourceMoved;
  -[MPSectionedIdentifierListItemEntry clonedEntries](v6, "clonedEntries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSectionedIdentifierListItemEntry setClonedEntries:](v6, "setClonedEntries:", v14);

  }
  -[MPSectionedIdentifierListItemEntry clonedEntries](v6, "clonedEntries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v11);

  v6->_hasClones = 1;
  return v11;
}

- (void)prepareForDealloc
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPSectionedIdentifierListItemEntry;
  -[MPSectionedIdentifierListEntry prepareForDealloc](&v4, sel_prepareForDealloc);
  -[MPSectionedIdentifierListItemEntry clonedEntries](self, "clonedEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (int64_t)_generationNumber
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[MPSectionedIdentifierListItemEntry rootEntry](self, "rootEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "clonedEntries"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", self),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = v6 + 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setRootEntry:(id)a3
{
  objc_storeWeak((id *)&self->_rootEntry, a3);
}

- (void)setClonedEntries:(id)a3
{
  objc_storeStrong((id *)&self->_clonedEntries, a3);
}

- (BOOL)isDataSourceCloned
{
  return self->_dataSourceCloned;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clonedEntries, 0);
  objc_destroyWeak((id *)&self->_rootEntry);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

+ (MPSectionedIdentifierListItemEntry)itemEntryWithSectionIdentifier:(id)a3 itemIdentifier:(id)a4 generationPrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("1"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("1");
  }
  v12 = objc_alloc((Class)a1);
  +[MPSectionedIdentifierListEntryPositionKey positionKeyWithDeviceIdentifier:generation:](MPSectionedIdentifierListEntryPositionKey, "positionKeyWithDeviceIdentifier:generation:", &stru_1E3163D10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_QWORD *)objc_msgSend(v12, "initWithPositionKey:sectionIdentifier:", v13, v10);

  v15 = objc_msgSend(v9, "copy");
  v16 = (void *)v14[9];
  v14[9] = v15;

  return (MPSectionedIdentifierListItemEntry *)v14;
}

+ (MPSectionedIdentifierListItemEntry)itemEntryWithSectionIdentifier:(id)a3 itemIdentifier:(id)a4
{
  return (MPSectionedIdentifierListItemEntry *)objc_msgSend(a1, "itemEntryWithSectionIdentifier:itemIdentifier:generationPrefix:", a3, a4, 0);
}

@end

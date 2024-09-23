@implementation MPSectionedIdentifierListEntry

- (MPSectionedIdentifierListEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MPSectionedIdentifierListEntry *v7;
  uint64_t v8;
  NSString *hostedSectionIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("si"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPSectionedIdentifierListEntry initWithPositionKey:sectionIdentifier:](self, "initWithPositionKey:sectionIdentifier:", v5, v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hsi"));
    v8 = objc_claimAutoreleasedReturnValue();
    hostedSectionIdentifier = v7->_hostedSectionIdentifier;
    v7->_hostedSectionIdentifier = (NSString *)v8;

    v7->_branchDepth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bd"));
    v7->_dataSourceRemoved = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dsr"));
  }

  return v7;
}

- (MPSectionedIdentifierListEntry)initWithPositionKey:(id)a3 sectionIdentifier:(id)a4
{
  id v7;
  id v8;
  MPSectionedIdentifierListEntry *v9;
  MPSectionedIdentifierListEntry *v10;
  uint64_t v11;
  NSMutableArray *nextEntries;
  uint64_t v13;
  NSString *sectionIdentifier;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPSectionedIdentifierListEntry;
  v9 = -[MPSectionedIdentifierListEntry init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_positionKey, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    nextEntries = v10->_nextEntries;
    v10->_nextEntries = (NSMutableArray *)v11;

    v13 = objc_msgSend(v8, "copy");
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSString *)v13;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)itemResult
{
  MPSectionedIdentifierListEntry *v3;

  if (-[MPSectionedIdentifierListEntry conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE2FC960))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSArray)nextEntries
{
  return &self->_nextEntries->super;
}

- (BOOL)isDataSourceRemoved
{
  return self->_dataSourceRemoved;
}

- (MPSectionedIdentifierListEntry)previousEntry
{
  return (MPSectionedIdentifierListEntry *)objc_loadWeakRetained((id *)&self->_previousEntry);
}

- (void)setPreviousEntry:(id)a3
{
  objc_storeWeak((id *)&self->_previousEntry, a3);
}

- (id)trackingEntryResult
{
  MPSectionedIdentifierListEntry *v3;

  if (-[MPSectionedIdentifierListEntry conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE2FC708))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (MPSectionedIdentifierListEntryPositionKey)positionKey
{
  return self->_positionKey;
}

- (int64_t)branchDepth
{
  return self->_branchDepth;
}

- (void)addNextEntry:(id)a3
{
  -[NSMutableArray addObject:](self->_nextEntries, "addObject:", a3);
}

- (NSString)hostedSectionIdentifier
{
  return self->_hostedSectionIdentifier;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousEntry);
  objc_storeStrong((id *)&self->_hostedSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_positionKey, 0);
  objc_storeStrong((id *)&self->_nextEntries, 0);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPSectionedIdentifierListEntry sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_stateDumpObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v20[1] = CFSTR("_sectionID");
  -[MPSectionedIdentifierListEntry sectionIdentifier](self, "sectionIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("@");
  v21[1] = v6;
  v20[2] = CFSTR("_hostedSectionIdentifier");
  -[MPSectionedIdentifierListEntry hostedSectionIdentifier](self, "hostedSectionIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("@");
  v21[2] = v9;
  v20[3] = CFSTR("nextEntries");
  -[MPSectionedIdentifierListEntry nextEntries](self, "nextEntries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("description"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("@");
  v21[3] = v13;
  v20[4] = CFSTR("previousEntry");
  -[MPSectionedIdentifierListEntry previousEntry](self, "previousEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("@");
  v21[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  MPSectionedIdentifierListEntryPositionKey *positionKey;
  id v5;

  positionKey = self->_positionKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", positionKey, CFSTR("pk"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionIdentifier, CFSTR("si"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hostedSectionIdentifier, CFSTR("hsi"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_branchDepth, CFSTR("bd"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dataSourceRemoved, CFSTR("dsr"));

}

- (int64_t)entryType
{
  return 0;
}

- (void)addBranch:(id)a3 forceBranchDepthIncrease:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a4;
  v25 = a3;
  if (!objc_msgSend(v25, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEntry.m"), 138, CFSTR("Cannot add empty branch"));

  }
  v7 = -[MPSectionedIdentifierListEntry branchDepth](self, "branchDepth");
  v8 = v7 + v4 + -[NSMutableArray count](self->_nextEntries, "count");
  if (objc_msgSend(v25, "count") != 1)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", ++v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBranchDepth:", v8);
      objc_msgSend(v13, "nextEntries");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        objc_msgSend(v13, "nextEntries");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18 == 1)
        {
          objc_msgSend(v13, "nextEntries");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 != v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEntry.m"), 152, CFSTR("Non-contiguous entries in MPSectionedIdentifierListEntryAddBranch [too many next]"));

          }
          objc_msgSend(v14, "previousEntry");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 != v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEntry.m"), 154, CFSTR("Non-contiguous entries in MPSectionedIdentifierListEntryAddBranch [disconnected previous]"));

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedIdentifierListEntry.m"), 157, CFSTR("Non-linear entries in MPSectionedIdentifierListEntryAddBranch"));
        }

      }
      else
      {
        objc_msgSend(v13, "addNextEntry:", v14);
        objc_msgSend(v14, "setPreviousEntry:", v13);
      }

    }
    while (v12 < objc_msgSend(v25, "count") - 1);
  }
  objc_msgSend(v25, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBranchDepth:", v8);

  objc_msgSend(v25, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedIdentifierListEntry addNextEntry:](self, "addNextEntry:", v10);

  objc_msgSend(v25, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreviousEntry:", self);

}

- (void)prepareForDealloc
{
  -[NSMutableArray removeAllObjects](self->_nextEntries, "removeAllObjects");
}

- (void)setDataSourceRemoved
{
  self->_dataSourceRemoved = 1;
}

- (void)setHostedSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setBranchDepth:(int64_t)a3
{
  self->_branchDepth = a3;
}

@end

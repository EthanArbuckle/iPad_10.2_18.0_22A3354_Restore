@implementation MPSectionedIdentifierListHeadEntry

- (MPSectionedIdentifierListHeadEntry)initWithPositionKey:(id)a3 sectionIdentifier:(id)a4
{
  MPSectionedIdentifierListHeadEntry *v4;
  uint64_t v5;
  NSMutableDictionary *identifiersItemEntryMap;
  uint64_t v7;
  MPSectionedIdentifierListTailEntry *tailEntry;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  v4 = -[MPSectionedIdentifierListEntry initWithPositionKey:sectionIdentifier:](&v10, sel_initWithPositionKey_sectionIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    identifiersItemEntryMap = v4->_identifiersItemEntryMap;
    v4->_identifiersItemEntryMap = (NSMutableDictionary *)v5;

    +[MPSectionedIdentifierListTailEntry tailEntryWithSectionHeadEntry:](MPSectionedIdentifierListTailEntry, "tailEntryWithSectionHeadEntry:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    tailEntry = v4->_tailEntry;
    v4->_tailEntry = (MPSectionedIdentifierListTailEntry *)v7;

  }
  return v4;
}

- (int64_t)entryType
{
  return 2;
}

- (NSMutableDictionary)identifiersItemEntryMap
{
  return self->_identifiersItemEntryMap;
}

- (id)nextEntries
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  -[MPSectionedIdentifierListEntry nextEntries](&v7, sel_nextEntries);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MPSectionedIdentifierListHeadEntry tailEntry](self, "tailEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertObject:atIndex:", v5, 0);

  return v4;
}

- (MPSectionedIdentifierListTailEntry)tailEntry
{
  return self->_tailEntry;
}

- (void)setTailEntry:(id)a3
{
  objc_storeStrong((id *)&self->_tailEntry, a3);
}

- (void)setLastItemEntry:(id)a3
{
  objc_storeStrong((id *)&self->_lastItemEntry, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[MPSectionedIdentifierListHeadEntry isShuffledHead](self, "isShuffledHead"))
    v5 = CFSTR("🔀 ");
  else
    v5 = &stru_1E3163D10;
  -[MPSectionedIdentifierListEntry sectionIdentifier](self, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@%@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (MPSectionedIdentifierListHeadEntry)initWithCoder:(id)a3
{
  id v4;
  MPSectionedIdentifierListHeadEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  v5 = -[MPSectionedIdentifierListEntry initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_shuffledHead = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isShuffled"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  v4 = a3;
  -[MPSectionedIdentifierListEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_shuffledHead, CFSTR("isShuffled"), v5.receiver, v5.super_class);

}

- (void)setBranchDepth:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  -[MPSectionedIdentifierListEntry setBranchDepth:](&v5, sel_setBranchDepth_);
  -[MPSectionedIdentifierListEntry setBranchDepth:](self->_tailEntry, "setBranchDepth:", a3);
}

- (MPSectionedIdentifierListItemEntry)lastItemEntry
{
  return self->_lastItemEntry;
}

- (MPSectionedIdentifierListDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)isShuffledHead
{
  return self->_shuffledHead;
}

- (void)setShuffledHead:(BOOL)a3
{
  self->_shuffledHead = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lastItemEntry, 0);
  objc_storeStrong((id *)&self->_tailEntry, 0);
  objc_storeStrong((id *)&self->_identifiersItemEntryMap, 0);
}

+ (MPSectionedIdentifierListHeadEntry)headEntryWithSectionIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[MPSectionedIdentifierListEntryPositionKey positionKeyWithDeviceIdentifier:generation:](MPSectionedIdentifierListEntryPositionKey, "positionKeyWithDeviceIdentifier:generation:", &stru_1E3163D10, CFSTR("1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPositionKey:sectionIdentifier:", v6, v4);

  return (MPSectionedIdentifierListHeadEntry *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

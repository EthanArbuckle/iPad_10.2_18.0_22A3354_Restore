@implementation _MPSectionedIdentifierListCloneIndexEntry

- (_MPSectionedIdentifierListCloneIndexEntry)init
{
  _MPSectionedIdentifierListCloneIndexEntry *v2;
  uint64_t v3;
  NSMutableSet *clonedEntries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPSectionedIdentifierListCloneIndexEntry;
  v2 = -[_MPSectionedIdentifierListCloneIndexEntry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    clonedEntries = v2->_clonedEntries;
    v2->_clonedEntries = (NSMutableSet *)v3;

  }
  return v2;
}

- (MPSectionedIdentifierListItemEntry)rootEntry
{
  return self->_rootEntry;
}

- (void)setRootEntry:(id)a3
{
  objc_storeStrong((id *)&self->_rootEntry, a3);
}

- (NSMutableSet)clonedEntries
{
  return self->_clonedEntries;
}

- (void)setClonedEntries:(id)a3
{
  objc_storeStrong((id *)&self->_clonedEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clonedEntries, 0);
  objc_storeStrong((id *)&self->_rootEntry, 0);
}

@end

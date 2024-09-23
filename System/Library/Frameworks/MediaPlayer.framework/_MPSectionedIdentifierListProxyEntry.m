@implementation _MPSectionedIdentifierListProxyEntry

- (int64_t)entryType
{
  return self->_entryType;
}

+ (id)startEntry
{
  _MPSectionedIdentifierListProxyEntry *v2;

  v2 = objc_alloc_init(_MPSectionedIdentifierListProxyEntry);
  v2->_entryType = 1;
  return v2;
}

+ (id)endEntry
{
  _MPSectionedIdentifierListProxyEntry *v2;

  v2 = objc_alloc_init(_MPSectionedIdentifierListProxyEntry);
  v2->_entryType = 5;
  return v2;
}

- (NSString)description
{
  unint64_t entryType;
  __CFString *v3;

  entryType = self->_entryType;
  if (entryType > 5)
    v3 = 0;
  else
    v3 = off_1E3154488[entryType];
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p entryType=%@>"), objc_opt_class(), self, v3);
}

- (id)itemResult
{
  return 0;
}

- (id)trackingEntryResult
{
  return 0;
}

- (int64_t)branchDepth
{
  return 0;
}

@end

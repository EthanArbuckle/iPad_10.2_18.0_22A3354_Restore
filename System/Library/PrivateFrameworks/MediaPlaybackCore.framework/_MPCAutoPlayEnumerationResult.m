@implementation _MPCAutoPlayEnumerationResult

- (_MPCAutoPlayEnumerationResult)initWithSectionIdentifier:(id)a3
{
  id v4;
  _MPCAutoPlayEnumerationResult *v5;
  uint64_t v6;
  NSString *sectionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MPCAutoPlayEnumerationResult;
  v5 = -[_MPCAutoPlayEnumerationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v6;

  }
  return v5;
}

- (int64_t)branchDepth
{
  return 0;
}

- (int64_t)entryType
{
  return 3;
}

- (id)trackingEntryResult
{
  return 0;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)itemIdentifier
{
  return (NSString *)CFSTR("_PLACEHOLDER_AUTOPLAY_");
}

- (BOOL)isRemoved
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end

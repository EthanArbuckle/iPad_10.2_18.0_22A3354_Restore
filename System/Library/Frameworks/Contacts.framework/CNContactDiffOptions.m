@implementation CNContactDiffOptions

- (CNContactDiffOptions)init
{
  CNContactDiffOptions *v2;
  CNContactDiffOptions *v3;
  NSArray *ignoredKeys;
  CNContactDiffOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactDiffOptions;
  v2 = -[CNContactDiffOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_ignoreUnavailableKeys = 0;
    ignoredKeys = v2->_ignoredKeys;
    v2->_ignoredKeys = (NSArray *)MEMORY[0x1E0C9AA60];

    v5 = v3;
  }

  return v3;
}

- (BOOL)ignoreUnavailableKeys
{
  return self->_ignoreUnavailableKeys;
}

- (void)setIgnoreUnavailableKeys:(BOOL)a3
{
  self->_ignoreUnavailableKeys = a3;
}

- (NSArray)ignoredKeys
{
  return self->_ignoredKeys;
}

- (void)setIgnoredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredKeys, 0);
}

@end

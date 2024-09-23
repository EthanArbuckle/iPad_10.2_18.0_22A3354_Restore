@implementation CSPrivateSearchableIndex

+ (id)defaultSearchableIndex
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CSPrivateSearchableIndex_defaultSearchableIndex__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSearchableIndex_onceToken_627 != -1)
    dispatch_once(&defaultSearchableIndex_onceToken_627, block);
  return (id)defaultSearchableIndex_sDefaultInstance_626;
}

void __50__CSPrivateSearchableIndex_defaultSearchableIndex__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithName:protectionClass:bundleIdentifier:options:disableBatching:", CFSTR("CSSearchableIndexShared"), 0, 0, 0, 1);
  v2 = (void *)defaultSearchableIndex_sDefaultInstance_626;
  defaultSearchableIndex_sDefaultInstance_626 = v1;

}

- (const)defaultIndexPath
{
  void *v2;
  id v3;
  const char *v4;

  -[CSSearchableIndex bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CSPrivateIndexDefaultPath(v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (id)initialConnection
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[CSUnhousedSearchableIndex resolvedIndexPath](self, "resolvedIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[CSUnhousedIndexConnection unhousedIndexConnectionForToken:](CSPrivateIndexConnection, "unhousedIndexConnectionForToken:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  return addExtensionToken(a3, a4, a5);
}

@end

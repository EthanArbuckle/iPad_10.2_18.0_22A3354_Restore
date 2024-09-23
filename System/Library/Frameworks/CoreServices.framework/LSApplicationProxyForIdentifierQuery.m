@implementation LSApplicationProxyForIdentifierQuery

void __71___LSApplicationProxyForIdentifierQuery_alwaysAllowedBundleIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E10759E0);
  v1 = (void *)+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result;
  +[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result = v0;

}

@end

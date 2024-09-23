@implementation LSDIconClient

id __58___LSDIconClient_getAlternateIconNameForIdentifier_reply___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "XPCConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_LSCopyBundleIdentifierForXPCConnection(v2, 0);

  return v3;
}

@end

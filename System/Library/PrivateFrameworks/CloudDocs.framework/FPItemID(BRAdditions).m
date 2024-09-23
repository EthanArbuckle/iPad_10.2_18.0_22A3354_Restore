@implementation FPItemID(BRAdditions)

+ (id)br_fpItemIDFromItemIdentifier:()BRAdditions
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[BRFileProviderHelper br_getProviderDomainIDForCurrentPersona](BRFileProviderHelper, "br_getProviderDomainIDForCurrentPersona");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC68]), "initWithProviderDomainID:itemIdentifier:", v4, v3);

  return v6;
}

@end

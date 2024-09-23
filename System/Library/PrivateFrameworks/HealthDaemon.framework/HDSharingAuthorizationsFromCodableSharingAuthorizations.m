@implementation HDSharingAuthorizationsFromCodableSharingAuthorizations

id __HDSharingAuthorizationsFromCodableSharingAuthorizations_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0CB6B90];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "authorizationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displaySubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v4, "initWithAuthorizationIdentifier:displayName:displaySubtitle:", v5, v6, v7);
  return v8;
}

@end

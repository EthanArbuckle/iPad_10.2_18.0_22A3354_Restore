@implementation TKSEPClientToken

+ (BOOL)handlesTokenID:(id)a3
{
  id v3;
  TKTokenID *v4;
  void *v5;
  char v6;

  v3 = a3;
  v4 = -[TKTokenID initWithTokenID:]([TKTokenID alloc], "initWithTokenID:", v3);

  -[TKTokenID classID](v4, "classID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD6BB0]);

  return v6;
}

+ (id)builtinTokenIDs
{
  if (builtinTokenIDs_onceToken != -1)
    dispatch_once(&builtinTokenIDs_onceToken, &__block_literal_global_6);
  return (id)builtinTokenIDs_tokenIDs;
}

void __35__TKSEPClientToken_builtinTokenIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (+[TKSEPKey hasSEP](TKSEPKey, "hasSEP"))
  {
    v0 = *MEMORY[0x1E0CD6BA0];
    v7 = *MEMORY[0x1E0CD6BB0];
    v8 = v0;
    v1 = (void *)MEMORY[0x1E0C99D20];
    v2 = &v7;
    v3 = 2;
  }
  else
  {
    v6 = *MEMORY[0x1E0CD6BA0];
    v1 = (void *)MEMORY[0x1E0C99D20];
    v2 = &v6;
    v3 = 1;
  }
  objc_msgSend(v1, "arrayWithObjects:count:", v2, v3, v6, v7, v8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)builtinTokenIDs_tokenIDs;
  builtinTokenIDs_tokenIDs = v4;

}

- (TKSEPClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TKSEPClientToken;
  return (TKSEPClientToken *)-[TKClientToken _initWithTokenID:](&v6, sel__initWithTokenID_, a3, a4, a5);
}

@end

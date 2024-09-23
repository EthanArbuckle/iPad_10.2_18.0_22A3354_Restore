@implementation GEOWalletCategoryStylingMapResource

+ (id)styleAttributesForWalletCategory:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (_MergedGlobals_324 != -1)
    dispatch_once(&_MergedGlobals_324, &__block_literal_global_188);
  if (objc_msgSend((id)qword_1ECDBCAF8, "mappingsCount"))
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend((id)qword_1ECDBCAF8, "mappings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "walletCategory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v3, "isEqualToString:", v7);

      if (v8)
        break;

      if (++v4 >= (unint64_t)objc_msgSend((id)qword_1ECDBCAF8, "mappingsCount"))
        goto LABEL_7;
    }
    objc_msgSend(v6, "stylesAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
LABEL_7:
    v9 = 0;
  }

  return v9;
}

void __72__GEOWalletCategoryStylingMapResource_styleAttributesForWalletCategory___block_invoke()
{
  void *v0;
  void *v1;
  GEOWalletCategoryStylingMap *v2;
  void *v3;
  id v4;

  +[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dataForResourceWithName:fallbackBundle:", CFSTR("WalletCategoryStylingMap"), v1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[GEOWalletCategoryStylingMap initWithData:]([GEOWalletCategoryStylingMap alloc], "initWithData:", v4);
  v3 = (void *)qword_1ECDBCAF8;
  qword_1ECDBCAF8 = (uint64_t)v2;

}

@end

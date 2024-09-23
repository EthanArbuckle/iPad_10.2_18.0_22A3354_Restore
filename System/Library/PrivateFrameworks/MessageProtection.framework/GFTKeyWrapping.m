@implementation GFTKeyWrapping

+ (id)wrapSeed:(id)a3 to:(__SecKey *)a4 legacy:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  CFDataRef v11;
  void *v12;
  CFErrorRef error;

  v7 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  error = 0;
  v11 = SecKeyCopyExternalRepresentation(a4, &error);
  objc_msgSend(v10, "addObject:", v11);

  if (a6 && error)
  {
    v12 = 0;
    *a6 = error;
  }
  else
  {
    +[GFTKeyWrapper wrapSeed:to:legacy:error:](_TtC17MessageProtection13GFTKeyWrapper, "wrapSeed:to:legacy:error:", v9, v10, v7, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)wrapSeed:(id)a3 toKeys:(id)a4 error:(id *)a5
{
  return +[GFTKeyWrapper wrapSeed:to:legacy:error:](_TtC17MessageProtection13GFTKeyWrapper, "wrapSeed:to:legacy:error:", a3, a4, 0, a5);
}

+ (id)unwrapSeed:(id)a3 usingKey:(__SecKey *)a4 legacy:(BOOL)a5 error:(id *)a6
{
  return +[GFTKeyWrapper unwrapWrappedSeed:legacy:using:error:](_TtC17MessageProtection13GFTKeyWrapper, "unwrapWrappedSeed:legacy:using:error:", a3, a5, a4, a6);
}

+ (id)encrypt:(id)a3 toKey:(__SecKey *)a4 error:(id *)a5
{
  return +[GFTKeyWrapper encrypt:to:error:](_TtC17MessageProtection13GFTKeyWrapper, "encrypt:to:error:", a3, a4, a5);
}

+ (id)decrypt:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5
{
  return +[GFTKeyWrapper decrypt:using:error:](_TtC17MessageProtection13GFTKeyWrapper, "decrypt:using:error:", a3, a4, a5);
}

@end

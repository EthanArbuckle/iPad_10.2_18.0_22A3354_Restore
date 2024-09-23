@implementation INInteraction(schema)

- (uint64_t)canConvertToSchemaOrg
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "intentResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "intentResponse");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9319A0);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)toSchemas
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "intentResponse");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(a1, "intentResponse"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF9319A0),
        v4,
        v3,
        v5))
  {
    objc_msgSend(a1, "intentResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toSchemas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)fromSchemas:()schema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CBD900], "fromSchemas:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v4, v5);
  return v6;
}

@end

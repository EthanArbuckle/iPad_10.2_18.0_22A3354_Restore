@implementation ML3Account

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = CFSTR("dsid");
    v7[1] = CFSTR("alt_dsid");
    v7[2] = CFSTR("apple_id");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)ML3AccountAllProperties;
    ML3AccountAllProperties = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3AccountAllProperties, v5);
    v6 = (void *)ML3AccountPredisambiguatedPropertyForProperties;
    ML3AccountPredisambiguatedPropertyForProperties = (uint64_t)v5;

  }
}

+ (id)databaseTable
{
  return CFSTR("account");
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3AccountPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  return (id)ML3AccountAllProperties;
}

@end

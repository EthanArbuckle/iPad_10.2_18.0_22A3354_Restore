@implementation CNMeCardSharingNameFormatter

- (CNMeCardSharingNameFormatter)initWithNameProvider:(id)a3
{
  id v5;
  CNMeCardSharingNameFormatter *v6;
  CNMeCardSharingNameFormatter *v7;
  uint64_t v8;
  NSPersonNameComponents *nameComponents;
  uint64_t v10;
  NSMutableDictionary *cachedFormattedNames;
  CNMeCardSharingNameFormatter *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNMeCardSharingNameFormatter;
  v6 = -[CNMeCardSharingNameFormatter init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nameProvider, a3);
    objc_msgSend((id)objc_opt_class(), "nameComponentsFromProvider:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    nameComponents = v7->_nameComponents;
    v7->_nameComponents = (NSPersonNameComponents *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v10 = objc_claimAutoreleasedReturnValue();
    cachedFormattedNames = v7->_cachedFormattedNames;
    v7->_cachedFormattedNames = (NSMutableDictionary *)v10;

    v12 = v7;
  }

  return v7;
}

- (id)formattedNameWithFormat:(unint64_t)a3
{
  NSMutableDictionary *cachedFormattedNames;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;

  cachedFormattedNames = self->_cachedFormattedNames;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedFormattedNames, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "formattedNameFromComponents:forProvider:withFormat:", self->_nameComponents, self->_nameProvider, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedFormattedNames;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (CNMeCardSharingNameProvider)nameProvider
{
  return self->_nameProvider;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSMutableDictionary)cachedFormattedNames
{
  return self->_cachedFormattedNames;
}

- (void)setCachedFormattedNames:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFormattedNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFormattedNames, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_nameProvider, 0);
}

+ (id)nameComponentsFromProvider:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3850];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  objc_msgSend(v4, "middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMiddleName:", v7);

  objc_msgSend(v4, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFamilyName:", v8);
  return v5;
}

+ (id)formattedNameFromProvider:(id)a3 withFormat:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "nameComponentsFromProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "formattedNameFromComponents:forProvider:withFormat:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)formattedNameFromComponents:(id)a3 forProvider:(id)a4 withFormat:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "_localizedShortNameForComponents:withStyle:options:", v7, 1, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
      objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v7, 0, 0);
    else
      objc_msgSend(v8, "givenName");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

@end

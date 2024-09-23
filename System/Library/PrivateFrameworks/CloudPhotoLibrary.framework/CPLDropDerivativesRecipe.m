@implementation CPLDropDerivativesRecipe

- (CPLDropDerivativesRecipe)initWithSourceResourceType:(unint64_t)a3 uti:(id)a4 changeType:(unint64_t)a5 droppingDerivativeTypes:(id)a6
{
  id v11;
  id v12;
  CPLDropDerivativesRecipe *v13;
  CPLDropDerivativesRecipe *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CPLDropDerivativesRecipe;
  v13 = -[CPLDropDerivativesRecipe init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_sourceResourceType = a3;
    objc_storeStrong((id *)&v13->_uti, a4);
    v14->_changeType = a5;
    objc_storeStrong((id *)&v14->_derivativeTypes, a6);
  }

  return v14;
}

- (id)description
{
  id v3;
  void *v4;
  NSString *uti;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", self->_sourceResourceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uti = self->_uti;
  +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:](CPLDropDerivativesRecipe, "shortDescriptionForResourceChangeRecordType:", self->_changeType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _shortDescriptionForArrayOfCPLResourceTypes(self->_derivativeTypes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<sourceResourceType: %@, uti: %@, changeType: %@, derivativeTypes: %@>"), v4, uti, v6, v7);

  return v8;
}

- (NSDictionary)plistDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("changeRecordType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CPLDropDerivativesRecipe changeType](self, "changeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("uti");
  -[CPLDropDerivativesRecipe uti](self, "uti");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("sourceResourceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CPLDropDerivativesRecipe sourceResourceType](self, "sourceResourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("derivativeResourceTypes");
  -[CPLDropDerivativesRecipe derivativeTypes](self, "derivativeTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (CPLDropDerivativesRecipe)initWithCoder:(id)a3
{
  id v4;
  CPLDropDerivativesRecipe *v5;
  uint64_t v6;
  NSString *uti;
  uint64_t v8;
  NSArray *derivativeTypes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLDropDerivativesRecipe;
  v5 = -[CPLDropDerivativesRecipe init](&v11, sel_init);
  if (v5)
  {
    v5->_sourceResourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dropDerivativeRecipeSourceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dropDerivativeRecipeUTI"));
    v6 = objc_claimAutoreleasedReturnValue();
    uti = v5->_uti;
    v5->_uti = (NSString *)v6;

    v5->_changeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dropDerivativeRecipeChangeType"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("dropDerivativeRecipeDerivativesType"));
    v8 = objc_claimAutoreleasedReturnValue();
    derivativeTypes = v5->_derivativeTypes;
    v5->_derivativeTypes = (NSArray *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sourceResourceType;
  id v5;

  sourceResourceType = self->_sourceResourceType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sourceResourceType, CFSTR("dropDerivativeRecipeSourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uti, CFSTR("dropDerivativeRecipeUTI"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeType, CFSTR("dropDerivativeRecipeChangeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_derivativeTypes, CFSTR("dropDerivativeRecipeDerivativesType"));

}

- (unint64_t)sourceResourceType
{
  return self->_sourceResourceType;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (NSString)uti
{
  return self->_uti;
}

- (NSArray)derivativeTypes
{
  return self->_derivativeTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivativeTypes, 0);
  objc_storeStrong((id *)&self->_uti, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescriptionForResourceChangeRecordType:(unint64_t)a3
{
  if (a3 < 3)
    return off_1E60D9A08[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CPLResourceChangeRecordType-%i"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)changeRecordTypeFromShortDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CPLDropDerivativesRecipe_changeRecordTypeFromShortDescription___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (changeRecordTypeFromShortDescription__onceToken != -1)
    dispatch_once(&changeRecordTypeFromShortDescription__onceToken, block);
  objc_msgSend((id)changeRecordTypeFromShortDescription__mapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = 0;

  return v7;
}

+ (id)archiveArrayOfCPLDropDerivativeRecipes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "cpl_archivedDataWithRootObject:", a3);
}

+ (id)unarchiveArrayOfCPLDropDerivativeRecipesFrom:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = unarchiveArrayOfCPLDropDerivativeRecipesFrom__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&unarchiveArrayOfCPLDropDerivativeRecipesFrom__onceToken, &__block_literal_global_8539);
  objc_msgSend(MEMORY[0x1E0CB3710], "cpl_safeUnarchiveObjectWithData:classes:", v4, unarchiveArrayOfCPLDropDerivativeRecipesFrom__classes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __73__CPLDropDerivativesRecipe_unarchiveArrayOfCPLDropDerivativeRecipesFrom___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)unarchiveArrayOfCPLDropDerivativeRecipesFrom__classes;
  unarchiveArrayOfCPLDropDerivativeRecipesFrom__classes = v2;

}

void __65__CPLDropDerivativesRecipe_changeRecordTypeFromShortDescription___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = 0; i != 3; ++i)
  {
    if (i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescriptionForResourceChangeRecordType:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

    }
  }
  v6 = (void *)changeRecordTypeFromShortDescription__mapping;
  changeRecordTypeFromShortDescription__mapping = (uint64_t)v2;

}

@end

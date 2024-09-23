@implementation FAEligibilityRequirements

- (FAEligibilityRequirements)initWithCoder:(id)a3
{
  id v4;
  FAEligibilityRequirements *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *properties;

  v4 = a3;
  v5 = -[FAEligibilityRequirements init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("properties"));
    v10 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;

  }
  return v5;
}

- (FAEligibilityRequirements)init
{
  return -[FAEligibilityRequirements initWithPropertyRequirements:](self, "initWithPropertyRequirements:", 0);
}

- (FAEligibilityRequirements)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FAPropertyEligibilityRequirements *v12;
  void *v13;
  FAPropertyEligibilityRequirements *v14;
  void *v15;
  FAEligibilityRequirements *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = [FAPropertyEligibilityRequirements alloc];
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[FAPropertyEligibilityRequirements initWithPropertyName:dictionaryRepresentation:](v12, "initWithPropertyName:dictionaryRepresentation:", v11, v13);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  v16 = -[FAEligibilityRequirements initWithPropertyRequirements:](self, "initWithPropertyRequirements:", v15);

  return v16;
}

- (FAEligibilityRequirements)initWithPropertyRequirements:(id)a3
{
  id v4;
  FAEligibilityRequirements *v5;
  uint64_t v6;
  NSDictionary *properties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAEligibilityRequirements;
  v5 = -[FAEligibilityRequirements init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_properties, CFSTR("properties"));
}

- (id)requirementsForPropertyName:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", a3);
}

@end

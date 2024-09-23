@implementation VCPSearchContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VCPSearchContext)initWithCoder:(id)a3
{
  id v4;
  VCPSearchContext *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *entities;
  objc_super v12;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPSearchContext;
  v5 = -[VCPSearchContext init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Entities"));
    v9 = objc_claimAutoreleasedReturnValue();
    entities = v5->_entities;
    v5->_entities = (NSMutableDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_entities, CFSTR("Entities"));
}

- (VCPSearchContext)init
{
  VCPSearchContext *v2;
  uint64_t v3;
  NSMutableDictionary *entities;
  VCPSearchContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VCPSearchContext;
  v2 = -[VCPSearchContext init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    entities = v2->_entities;
    v2->_entities = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (VCPSearchContext)initWithEntities:(id)a3
{
  id v4;
  VCPSearchContext *v5;
  VCPSearchContext *v6;

  v4 = a3;
  v5 = -[VCPSearchContext init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "count"))
      -[NSMutableDictionary addEntriesFromDictionary:](v5->_entities, "addEntriesFromDictionary:", v4);
    v6 = v5;
  }

  return v5;
}

- (void)addIdentifiers:(id)a3 forType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_entities, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_entities, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v9);

    }
    -[NSMutableDictionary setObject:forKey:](self->_entities, "setObject:forKey:", v7, v6);

  }
}

- (void)setIdentifiers:(id)a3 forType:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_entities, "setObject:forKey:", v7, v6);

  }
}

- (id)entities
{
  return self->_entities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entities, 0);
}

@end

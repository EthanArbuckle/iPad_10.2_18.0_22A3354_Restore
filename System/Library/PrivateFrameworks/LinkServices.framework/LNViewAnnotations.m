@implementation LNViewAnnotations

- (LNViewAnnotations)initWithEntities:(id)a3 intents:(id)a4
{
  id v7;
  id v8;
  LNViewAnnotations *v9;
  LNViewAnnotations *v10;
  LNViewAnnotations *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNViewAnnotations;
  v9 = -[LNViewAnnotations init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entities, a3);
    objc_storeStrong((id *)&v10->_intents, a4);
    v11 = v10;
  }

  return v10;
}

- (LNViewAnnotations)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  LNViewAnnotations *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("entities"));
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("intents"));
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12 | v8)
  {
    self = -[LNViewAnnotations initWithEntities:intents:](self, "initWithEntities:intents:", v8, v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNViewAnnotations entities](self, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entities"));

  -[LNViewAnnotations intents](self, "intents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("intents"));

}

- (NSArray)entities
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)intents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intents, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

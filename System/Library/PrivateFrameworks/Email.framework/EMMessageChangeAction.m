@implementation EMMessageChangeAction

- (EMMessageChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8;
  EMMessageChangeAction *v9;
  uint64_t v10;
  NSArray *objectIDs;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMMessageChangeAction;
  v9 = -[EMMessageChangeAction init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "ef_map:", &__block_literal_global_29);
    v10 = objc_claimAutoreleasedReturnValue();
    objectIDs = v9->_objectIDs;
    v9->_objectIDs = (NSArray *)v10;

    v9->_origin = a4;
    v9->_actor = a5;
  }

  return v9;
}

id __63__EMMessageChangeAction_initWithMessageListItems_origin_actor___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EMMessageChangeAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v9;
  EMMessageChangeAction *v10;
  EMMessageChangeAction *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMMessageChangeAction;
  v10 = -[EMMessageChangeAction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_objectIDs, a3);
    v11->_origin = a4;
    v11->_actor = a5;
  }

  return v11;
}

- (EMMessageChangeAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v9;
  EMMessageChangeAction *v10;
  EMMessageChangeAction *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMMessageChangeAction;
  v10 = -[EMMessageChangeAction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_query, a3);
    v11->_origin = a4;
    v11->_actor = a5;
  }

  return v11;
}

- (int64_t)signpostType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageChangeAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageChangeAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *objectIDs;
  uint64_t v11;
  EMQuery *query;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EMMessageChangeAction;
  v5 = -[EMMessageChangeAction init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_objectIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v9;

    v5->_origin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_origin"));
    v5->_actor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_actor"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_query"));
    v11 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (EMQuery *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMMessageChangeAction objectIDs](self, "objectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_objectIDs"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMMessageChangeAction origin](self, "origin"), CFSTR("EFPropertyKey_origin"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMMessageChangeAction actor](self, "actor"), CFSTR("EFPropertyKey_actor"));
  -[EMMessageChangeAction query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_query"));

}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  -[EMMessageChangeAction objectIDs](self, "objectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> objectIDs (%lu): %@"), v6, self, objc_msgSend(v3, "count"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)actor
{
  return self->_actor;
}

- (void)setActor:(int64_t)a3
{
  self->_actor = a3;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end

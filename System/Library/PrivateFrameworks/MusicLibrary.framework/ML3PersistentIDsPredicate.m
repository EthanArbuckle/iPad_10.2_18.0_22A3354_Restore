@implementation ML3PersistentIDsPredicate

- (ML3PersistentIDsPredicate)initWithPersistentIDs:(id)a3 shouldContain:(BOOL)a4
{
  id v7;
  ML3PersistentIDsPredicate *v8;
  ML3PersistentIDsPredicate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3PersistentIDsPredicate;
  v8 = -[ML3PersistentIDsPredicate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_shouldContain = a4;
    objc_storeStrong((id *)&v8->_persistentIDs, a3);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3PersistentIDsPredicate;
  -[ML3PersistentIDsPredicate dealloc](&v2, sel_dealloc);
}

- (ML3PersistentIDsPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3PersistentIDsPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *persistentIDs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ML3PersistentIDsPredicate;
  v5 = -[ML3Predicate initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_shouldContain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldContain"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("persistentIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    persistentIDs = v5->_persistentIDs;
    v5->_persistentIDs = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ML3PersistentIDsPredicate;
  v4 = a3;
  -[ML3Predicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldContain, CFSTR("shouldContain"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_persistentIDs, CFSTR("persistentIDs"));

}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ML3PersistentIDsPredicate;
  v3 = -[ML3Predicate hash](&v5, sel_hash) ^ self->_shouldContain;
  return v3 ^ -[NSArray hash](self->_persistentIDs, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ML3PersistentIDsPredicate *v4;
  NSUInteger v5;
  BOOL v6;
  objc_super v8;

  v4 = (ML3PersistentIDsPredicate *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ML3PersistentIDsPredicate;
    v6 = -[ML3Predicate isEqual:](&v8, sel_isEqual_, v4)
      && (v5 = -[NSArray count](self->_persistentIDs, "count"), v5 == -[NSArray count](v4->_persistentIDs, "count"))
      && self->_shouldContain == v4->_shouldContain
      && -[NSArray isEqualToArray:](self->_persistentIDs, "isEqualToArray:", v4->_persistentIDs);
  }

  return v6;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  void *v6;
  const __CFString *v7;
  unint64_t v8;
  id v9;

  v9 = a3;
  -[objc_class databaseTable](a4, "databaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v6);

  if (self->_shouldContain)
    v7 = &stru_1E5B66908;
  else
    v7 = CFSTR(" NOT");
  objc_msgSend(v9, "appendFormat:", CFSTR(".ROWID%@ IN ("), v7);
  if (-[NSArray count](self->_persistentIDs, "count"))
    objc_msgSend(v9, "appendString:", CFSTR("?"));
  if (-[NSArray count](self->_persistentIDs, "count") >= 2)
  {
    v8 = 1;
    do
    {
      objc_msgSend(v9, "appendString:", CFSTR(",?"));
      ++v8;
    }
    while (v8 < -[NSArray count](self->_persistentIDs, "count"));
  }
  objc_msgSend(v9, "appendString:", CFSTR(")"));

}

- (id)databaseStatementParameters
{
  return self->_persistentIDs;
}

- (BOOL)shouldContain
{
  return self->_shouldContain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIDs, 0);
}

+ (id)predicateWithPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 shouldContain:(BOOL)a5
{
  _BOOL8 v5;
  unint64_t v6;
  void *i;
  uint64_t v9;
  void *v10;
  ML3PersistentIDsPredicate *v11;

  v5 = a5;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v6; --v6)
  {
    v9 = *a3++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v10);

  }
  v11 = -[ML3PersistentIDsPredicate initWithPersistentIDs:shouldContain:]([ML3PersistentIDsPredicate alloc], "initWithPersistentIDs:shouldContain:", i, v5);

  return v11;
}

+ (id)predicateWithPersistentIDs:(id)a3 shouldContain:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  ML3PersistentIDsPredicate *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[ML3PersistentIDsPredicate initWithPersistentIDs:shouldContain:]([ML3PersistentIDsPredicate alloc], "initWithPersistentIDs:shouldContain:", v5, v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

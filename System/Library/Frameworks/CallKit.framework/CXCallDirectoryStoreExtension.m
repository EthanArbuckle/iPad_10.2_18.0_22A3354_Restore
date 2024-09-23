@implementation CXCallDirectoryStoreExtension

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXCallDirectoryStoreExtension identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CXCallDirectoryStoreExtension primaryKey](self, "primaryKey");
  v7 = -[CXCallDirectoryStoreExtension priority](self, "priority");
  v8 = -[CXCallDirectoryStoreExtension state](self, "state");
  -[CXCallDirectoryStoreExtension stateLastModified](self, "stateLastModified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: identifier=%@ primaryKey=%lld priority=%lld state=%ld stateLastModified=%@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryStoreExtension)initWithCoder:(id)a3
{
  id v4;
  CXCallDirectoryStoreExtension *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDate *stateLastModified;

  v4 = a3;
  v5 = -[CXCallDirectoryStoreExtension init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    NSStringFromSelector(sel_primaryKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_primaryKey = objc_msgSend(v4, "decodeInt64ForKey:", v10);

    NSStringFromSelector(sel_priority);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_priority = objc_msgSend(v4, "decodeInt64ForKey:", v11);

    NSStringFromSelector(sel_state);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", v12);

    v13 = objc_opt_class();
    NSStringFromSelector(sel_stateLastModified);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    stateLastModified = v5->_stateLastModified;
    v5->_stateLastModified = (NSDate *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[CXCallDirectoryStoreExtension identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[CXCallDirectoryStoreExtension primaryKey](self, "primaryKey");
  NSStringFromSelector(sel_primaryKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v7, v8);

  v9 = -[CXCallDirectoryStoreExtension priority](self, "priority");
  NSStringFromSelector(sel_priority);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v9, v10);

  v11 = -[CXCallDirectoryStoreExtension state](self, "state");
  NSStringFromSelector(sel_state);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

  -[CXCallDirectoryStoreExtension stateLastModified](self, "stateLastModified");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stateLastModified);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v13);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)primaryKey
{
  return self->_primaryKey;
}

- (void)setPrimaryKey:(int64_t)a3
{
  self->_primaryKey = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)stateLastModified
{
  return self->_stateLastModified;
}

- (void)setStateLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_stateLastModified, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLastModified, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

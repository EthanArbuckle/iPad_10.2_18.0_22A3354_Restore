@implementation MPServerObjectDatabaseMediaAPIImportChildRelation

- (MPServerObjectDatabaseMediaAPIImportChildRelation)initWithItemIdentifiers:(id)a3 parentIdentifiers:(id)a4 childKey:(id)a5 relativeOrder:(int64_t)a6
{
  id v10;
  id v11;
  NSString *v12;
  MPServerObjectDatabaseMediaAPIImportChildRelation *v13;
  MPServerObjectDatabaseMediaAPIImportChildRelation *v14;
  uint64_t v15;
  MPIdentifierSet *identifiers;
  uint64_t v17;
  MPIdentifierSet *parentIdentifiers;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = (NSString *)a5;
  v20.receiver = self;
  v20.super_class = (Class)MPServerObjectDatabaseMediaAPIImportChildRelation;
  v13 = -[MPServerObjectDatabaseMediaAPIImportChildRelation init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_childKey = v12;
    v13->_relativeOrder = a6;
    v15 = objc_msgSend(v10, "copy");
    identifiers = v14->_identifiers;
    v14->_identifiers = (MPIdentifierSet *)v15;

    v17 = objc_msgSend(v11, "copy");
    parentIdentifiers = v14->_parentIdentifiers;
    v14->_parentIdentifiers = (MPIdentifierSet *)v17;

  }
  return v14;
}

- (MPIdentifierSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MPIdentifierSet)parentIdentifiers
{
  return self->_parentIdentifiers;
}

- (void)setParentIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)childKey
{
  return self->_childKey;
}

- (void)setChildKey:(id)a3
{
  self->_childKey = (NSString *)a3;
}

- (int64_t)relativeOrder
{
  return self->_relativeOrder;
}

- (void)setRelativeOrder:(int64_t)a3
{
  self->_relativeOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end

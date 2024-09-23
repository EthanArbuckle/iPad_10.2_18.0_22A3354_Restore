@implementation CPLContainerRelation

- (CPLContainerRelation)initWithCoder:(id)a3
{
  id v4;
  CPLContainerRelation *v5;
  CPLContainerRelation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLContainerRelation;
  v5 = -[CPLContainerRelation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)proposedScopedIdentifierForItemScopedIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CPLScopedIdentifier *v10;
  void *v11;
  CPLScopedIdentifier *v12;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLContainerRelation containerIdentifier](self, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-IN-%@"), v7, v8);

  v10 = [CPLScopedIdentifier alloc];
  objc_msgSend(v5, "scopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v10, "initWithScopeIdentifier:identifier:", v11, v9);
  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_keyAsset)
    v5 = CFSTR("keyAsset");
  else
    v5 = &stru_1E60DF6B8;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ [position: %ld container: %@ %@]>"), v4, self->_position, self->_containerIdentifier, v5);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (BOOL)isKeyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(BOOL)a3
{
  self->_keyAsset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end

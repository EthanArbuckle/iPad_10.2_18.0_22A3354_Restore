@implementation FBKSectionIdentifierGroup

- (FBKSectionIdentifierGroup)initWithSectionIdentifier:(id)a3
{
  id v5;
  FBKSectionIdentifierGroup *v6;
  FBKSectionIdentifierGroup *v7;
  uint64_t v8;
  NSArray *givenRowIdentifiers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBKSectionIdentifierGroup;
  v6 = -[FBKSectionIdentifierGroup init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_givenSectionIdentifier, a3);
    v8 = objc_opt_new();
    givenRowIdentifiers = v7->_givenRowIdentifiers;
    v7->_givenRowIdentifiers = (NSArray *)v8;

  }
  return v7;
}

- (NSString)givenSectionIdentifier
{
  return self->_givenSectionIdentifier;
}

- (void)setGivenSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_givenSectionIdentifier, a3);
}

- (NSArray)givenRowIdentifiers
{
  return self->_givenRowIdentifiers;
}

- (void)setGivenRowIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_givenRowIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenRowIdentifiers, 0);
  objc_storeStrong((id *)&self->_givenSectionIdentifier, 0);
}

@end

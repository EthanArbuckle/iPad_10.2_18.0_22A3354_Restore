@implementation GDPersonNameComponentsBuilder

- (GDPersonNameComponentsBuilder)init
{
  GDPersonNameComponentsBuilder *v2;
  uint64_t v3;
  NSMutableArray *prefixes;
  uint64_t v5;
  NSMutableArray *givenNames;
  uint64_t v7;
  NSMutableArray *middleNames;
  uint64_t v9;
  NSMutableArray *familyNames;
  uint64_t v11;
  NSMutableArray *suffixes;
  uint64_t v13;
  NSMutableArray *nicknames;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GDPersonNameComponentsBuilder;
  v2 = -[GDPersonNameComponentsBuilder init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    prefixes = v2->_prefixes;
    v2->_prefixes = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    givenNames = v2->_givenNames;
    v2->_givenNames = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    middleNames = v2->_middleNames;
    v2->_middleNames = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    familyNames = v2->_familyNames;
    v2->_familyNames = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    suffixes = v2->_suffixes;
    v2->_suffixes = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    nicknames = v2->_nicknames;
    v2->_nicknames = (NSMutableArray *)v13;

  }
  return v2;
}

- (NSMutableArray)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
  objc_storeStrong((id *)&self->_prefixes, a3);
}

- (NSMutableArray)givenNames
{
  return self->_givenNames;
}

- (void)setGivenNames:(id)a3
{
  objc_storeStrong((id *)&self->_givenNames, a3);
}

- (NSMutableArray)middleNames
{
  return self->_middleNames;
}

- (void)setMiddleNames:(id)a3
{
  objc_storeStrong((id *)&self->_middleNames, a3);
}

- (NSMutableArray)familyNames
{
  return self->_familyNames;
}

- (void)setFamilyNames:(id)a3
{
  objc_storeStrong((id *)&self->_familyNames, a3);
}

- (NSMutableArray)suffixes
{
  return self->_suffixes;
}

- (void)setSuffixes:(id)a3
{
  objc_storeStrong((id *)&self->_suffixes, a3);
}

- (NSMutableArray)nicknames
{
  return self->_nicknames;
}

- (void)setNicknames:(id)a3
{
  objc_storeStrong((id *)&self->_nicknames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknames, 0);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_familyNames, 0);
  objc_storeStrong((id *)&self->_middleNames, 0);
  objc_storeStrong((id *)&self->_givenNames, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
}

@end

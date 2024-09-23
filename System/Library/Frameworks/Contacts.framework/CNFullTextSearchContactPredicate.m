@implementation CNFullTextSearchContactPredicate

- (CNFullTextSearchContactPredicate)initWithSearchString:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNFullTextSearchContactPredicate *v11;
  uint64_t v12;
  NSString *searchString;
  uint64_t v14;
  NSArray *containerIdentifiers;
  uint64_t v16;
  NSArray *groupIdentifiers;
  CNFullTextSearchContactPredicate *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNFullTextSearchContactPredicate;
  v11 = -[CNPredicate init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    searchString = v11->_searchString;
    v11->_searchString = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    containerIdentifiers = v11->_containerIdentifiers;
    v11->_containerIdentifiers = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    groupIdentifiers = v11->_groupIdentifiers;
    v11->_groupIdentifiers = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNFullTextSearchContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNFullTextSearchContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *searchString;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *containerIdentifiers;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *groupIdentifiers;
  CNFullTextSearchContactPredicate *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CNFullTextSearchContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_searchString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_containerIdentifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    containerIdentifiers = v5->_containerIdentifiers;
    v5->_containerIdentifiers = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_groupIdentifiers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFullTextSearchContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, CFSTR("_searchString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifiers, CFSTR("_containerIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifiers, CFSTR("_groupIdentifiers"));

}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:]"));
  -[CNFullTextSearchContactPredicate searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("searchString"), v5);

  -[CNFullTextSearchContactPredicate containerIdentifiers](self, "containerIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("containerIdentifiers"), v7);

  -[CNFullTextSearchContactPredicate groupIdentifiers](self, "groupIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("groupIdentifiers"), v9);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (NSArray)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[CNFullTextSearchContactPredicate searchString](self, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestContactMatchesWithFullTextSearch:limitTo:error:", v9, 0x7FFFFFFFFFFFFFFFLL, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

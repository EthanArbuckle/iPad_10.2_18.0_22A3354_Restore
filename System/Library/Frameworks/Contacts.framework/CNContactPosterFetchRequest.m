@implementation CNContactPosterFetchRequest

+ (id)recentPostersRequestForContactIdenfitiers:(id)a3
{
  id v3;
  CNContactPosterFetchRequest *v4;

  v3 = a3;
  v4 = -[CNContactPosterFetchRequest initWithContactIdentifiers:]([CNContactPosterFetchRequest alloc], "initWithContactIdentifiers:", v3);

  return v4;
}

+ (id)predicateForPostersMatchingContactIdentifiers:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("contactIdentifier"), a3);
}

- (CNContactPosterFetchRequest)initWithContactIdentifiers:(id)a3
{
  id v5;
  CNContactPosterFetchRequest *v6;
  CNContactPosterFetchRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactPosterFetchRequest;
  v6 = -[CNContactPosterFetchRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactIdentifiers, a3);

  return v7;
}

- (NSPersistentStoreRequest)persistentStoreRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CNContactPoster"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastUsedDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = (void *)objc_opt_class();
  -[CNContactPosterFetchRequest contactIdentifiers](self, "contactIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForPostersMatchingContactIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v8);

  return (NSPersistentStoreRequest *)v3;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

@end

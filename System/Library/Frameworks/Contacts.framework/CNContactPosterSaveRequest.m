@implementation CNContactPosterSaveRequest

+ (id)saveRequestToCreatePoster:(id)a3 forContactIdentifier:(id)a4
{
  id v5;
  id v6;
  CNContactPosterSaveRequest *v7;
  void *v8;
  void *v9;
  CNContactPosterSaveRequest *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [CNContactPosterSaveRequest alloc];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNContactPosterSaveRequest initWithContactPosters:contactIdentifiers:attributeName:operationType:](v7, "initWithContactPosters:contactIdentifiers:attributeName:operationType:", v8, v9, CFSTR("contactIdentifier"), 0);
  return v10;
}

+ (id)saveRequestToCreatePosters:(id)a3 forContactIdentifier:(id)a4
{
  id v5;
  id v6;
  CNContactPosterSaveRequest *v7;
  void *v8;
  CNContactPosterSaveRequest *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [CNContactPosterSaveRequest alloc];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CNContactPosterSaveRequest initWithContactPosters:contactIdentifiers:attributeName:operationType:](v7, "initWithContactPosters:contactIdentifiers:attributeName:operationType:", v6, v8, CFSTR("contactIdentifier"), 0);
  return v9;
}

+ (id)saveRequestToDeletePostersForContactIdentifiers:(id)a3
{
  id v3;
  CNContactPosterSaveRequest *v4;
  CNContactPosterSaveRequest *v5;

  v3 = a3;
  v4 = [CNContactPosterSaveRequest alloc];
  v5 = -[CNContactPosterSaveRequest initWithContactPosters:contactIdentifiers:attributeName:operationType:](v4, "initWithContactPosters:contactIdentifiers:attributeName:operationType:", MEMORY[0x1E0C9AA60], v3, CFSTR("contactIdentifier"), 2);

  return v5;
}

+ (id)saveRequestToDeletePosterForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactPosterSaveRequest saveRequestToDeletePosterForIdentifiers:](CNContactPosterSaveRequest, "saveRequestToDeletePosterForIdentifiers:", v5, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)saveRequestToDeletePosterForIdentifiers:(id)a3
{
  id v3;
  CNContactPosterSaveRequest *v4;
  CNContactPosterSaveRequest *v5;

  v3 = a3;
  v4 = [CNContactPosterSaveRequest alloc];
  v5 = -[CNContactPosterSaveRequest initWithContactPosters:contactIdentifiers:attributeName:operationType:](v4, "initWithContactPosters:contactIdentifiers:attributeName:operationType:", MEMORY[0x1E0C9AA60], v3, CFSTR("identifier"), 2);

  return v5;
}

- (CNContactPosterSaveRequest)initWithContactPosters:(id)a3 contactIdentifiers:(id)a4 attributeName:(id)a5 operationType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  CNContactPosterSaveRequest *v14;
  CNContactPosterSaveRequest *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNContactPosterSaveRequest;
  v14 = -[CNContactPosterSaveRequest init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_posters, a3);
    objc_storeStrong((id *)&v15->_contactIdentifiers, a4);
    v15->_operationType = a6;
    objc_storeStrong((id *)&v15->_attributeName, a5);
  }

  return v15;
}

- (NSPersistentStoreRequest)persistentStoreRequest
{
  void *v3;

  if (-[CNContactPosterSaveRequest operationType](self, "operationType") == 2)
  {
    -[CNContactPosterSaveRequest deleteStoreRequest](self, "deleteStoreRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[CNContactPosterSaveRequest operationType](self, "operationType"))
  {
    v3 = 0;
  }
  else
  {
    -[CNContactPosterSaveRequest createStoreRequest](self, "createStoreRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSPersistentStoreRequest *)v3;
}

- (id)deleteStoreRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CNContactPoster"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPosterSaveRequest contactIdentifiers](self, "contactIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    -[CNContactPosterSaveRequest attributeName](self, "attributeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPosterSaveRequest contactIdentifiers](self, "contactIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "setPredicate:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v3);

  return v9;
}

- (id)createStoreRequest
{
  return 0;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifiers, a3);
}

- (NSArray)posters
{
  return self->_posters;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (NSString)attributeName
{
  return self->_attributeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeName, 0);
  objc_storeStrong((id *)&self->_posters, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

@end

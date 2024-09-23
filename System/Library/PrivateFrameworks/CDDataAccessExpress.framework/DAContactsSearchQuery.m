@implementation DAContactsSearchQuery

+ (id)contactsSearchQueryWithSearchString:(id)a3 searchBase:(id)a4 searchScope:(id)a5 consumer:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  DAContactsSearchQuery *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[DAContactsSearchQuery initWithSearchString:searchBase:searchScope:consumer:]([DAContactsSearchQuery alloc], "initWithSearchString:searchBase:searchScope:consumer:", v12, v11, v10, v9);

  return v13;
}

- (DAContactsSearchQuery)initWithSearchString:(id)a3 searchBase:(id)a4 searchScope:(id)a5 consumer:(id)a6
{
  id v10;
  id v11;
  DAContactsSearchQuery *v12;
  DAContactsSearchQuery *v13;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DAContactsSearchQuery;
  v12 = -[DASearchQuery initWithSearchString:consumer:](&v15, sel_initWithSearchString_consumer_, a3, a6);
  v13 = v12;
  if (v12)
  {
    -[DASearchQuery setRange:](v12, "setRange:", 0, 100);
    -[DAContactsSearchQuery setSearchBase:](v13, "setSearchBase:", v10);
    -[DAContactsSearchQuery setSearchScope:](v13, "setSearchScope:", v11);
    -[DAContactsSearchQuery setIncludePhotos:](v13, "setIncludePhotos:", 1);
  }

  return v13;
}

- (DAContactsSearchQuery)initWithDictionaryRepresentation:(id)a3 consumer:(id)a4
{
  id v6;
  DAContactsSearchQuery *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DAContactsSearchQuery;
  v7 = -[DASearchQuery initWithDictionaryRepresentation:consumer:](&v12, sel_initWithDictionaryRepresentation_consumer_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContactSearchBase"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactsSearchQuery setSearchBase:](v7, "setSearchBase:", v8);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContactSearchScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactsSearchQuery setSearchScope:](v7, "setSearchScope:", v9);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContactSearchIncludePhotos"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactsSearchQuery setIncludePhotos:](v7, "setIncludePhotos:", objc_msgSend(v10, "BOOLValue"));

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DAContactsSearchQuery;
  -[DASearchQuery dictionaryRepresentation](&v10, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAContactsSearchQuery searchBase](self, "searchBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DAContactsSearchQuery searchBase](self, "searchBase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ContactSearchBase"));

  }
  -[DAContactsSearchQuery searchScope](self, "searchScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DAContactsSearchQuery searchScope](self, "searchScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ContactSearchScope"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DAContactsSearchQuery includePhotos](self, "includePhotos"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ContactSearchIncludePhotos"));

  return v3;
}

- (NSString)searchBase
{
  return self->_searchBase;
}

- (void)setSearchBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)searchScope
{
  return self->_searchScope;
}

- (void)setSearchScope:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)includePhotos
{
  return self->_includePhotos;
}

- (void)setIncludePhotos:(BOOL)a3
{
  self->_includePhotos = a3;
}

- (BOOL)calendarInitiated
{
  return self->_calendarInitiated;
}

- (void)setCalendarInitiated:(BOOL)a3
{
  self->_calendarInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchScope, 0);
  objc_storeStrong((id *)&self->_searchBase, 0);
}

@end

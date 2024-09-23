@implementation _CDPeopleSuggesterContext

+ (id)currentContext
{
  return objc_alloc_init(_CDPeopleSuggesterContext);
}

- (_CDPeopleSuggesterContext)init
{
  _CDPeopleSuggesterContext *v2;
  uint64_t v3;
  NSDate *date;
  NSString *locationUUID;
  NSString *title;
  NSString *contactPrefix;
  NSSet *seedContactIdentifiers;
  NSString *consumerIdentifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CDPeopleSuggesterContext;
  v2 = -[_CDPeopleSuggesterContext init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    date = v2->_date;
    v2->_date = (NSDate *)v3;

    locationUUID = v2->_locationUUID;
    v2->_locationUUID = 0;

    title = v2->_title;
    v2->_title = 0;

    contactPrefix = v2->_contactPrefix;
    v2->_contactPrefix = 0;

    seedContactIdentifiers = v2->_seedContactIdentifiers;
    v2->_seedContactIdentifiers = 0;

    consumerIdentifier = v2->_consumerIdentifier;
    v2->_consumerIdentifier = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    -[_CDPeopleSuggesterContext date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDate:", v5);

    -[_CDPeopleSuggesterContext locationUUID](self, "locationUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocationUUID:", v6);

    -[_CDPeopleSuggesterContext title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v7);

    -[_CDPeopleSuggesterContext contactPrefix](self, "contactPrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContactPrefix:", v8);

    -[_CDPeopleSuggesterContext seedContactIdentifiers](self, "seedContactIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSeedContactIdentifiers:", v9);

    -[_CDPeopleSuggesterContext consumerIdentifier](self, "consumerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConsumerIdentifier:", v10);

    -[_CDPeopleSuggesterContext contentUTIs](self, "contentUTIs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentUTIs:", v11);

    -[_CDPeopleSuggesterContext nearbyPeople](self, "nearbyPeople");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNearbyPeople:", v12);

    -[_CDPeopleSuggesterContext activeInteraction](self, "activeInteraction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveInteraction:", v13);

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Context {\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPeopleSuggesterContext date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                      date: %@\n"), v4);

  -[_CDPeopleSuggesterContext locationUUID](self, "locationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              locationUUID: %@\n"), v5);

  -[_CDPeopleSuggesterContext title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                     title: %@\n"), v6);

  -[_CDPeopleSuggesterContext contactPrefix](self, "contactPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("             contactPrefix: %@\n"), v7);

  -[_CDPeopleSuggesterContext seedContactIdentifiers](self, "seedContactIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    seedContactIdentifiers: %@\n"), v8);

  -[_CDPeopleSuggesterContext consumerIdentifier](self, "consumerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("        consumerIdentifier: %@\n"), v9);

  -[_CDPeopleSuggesterContext nearbyPeople](self, "nearbyPeople");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              nearbyPeople: %@\n"), v10);

  -[_CDPeopleSuggesterContext activeInteraction](self, "activeInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         activeInteraction: %@\n"), v11);

  -[_CDPeopleSuggesterContext contentUTIs](self, "contentUTIs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("               contentUTIs: %@\n"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  return v3;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)locationUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocationUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)contactPrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContactPrefix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSSet)seedContactIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSeedContactIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSSet)nearbyPeople
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNearbyPeople:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)consumerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConsumerIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)contentUTIs
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContentUTIs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (_CDInteraction)activeInteraction
{
  return (_CDInteraction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActiveInteraction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInteraction, 0);
  objc_storeStrong((id *)&self->_contentUTIs, 0);
  objc_storeStrong((id *)&self->_consumerIdentifier, 0);
  objc_storeStrong((id *)&self->_nearbyPeople, 0);
  objc_storeStrong((id *)&self->_seedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactPrefix, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end

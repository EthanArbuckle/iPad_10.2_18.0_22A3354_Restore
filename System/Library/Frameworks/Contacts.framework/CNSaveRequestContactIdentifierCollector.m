@implementation CNSaveRequestContactIdentifierCollector

- (CNSaveRequestContactIdentifierCollector)initWithSaveRequest:(id)a3
{
  id v5;
  CNSaveRequestContactIdentifierCollector *v6;
  CNSaveRequestContactIdentifierCollector *v7;
  uint64_t v8;
  NSMutableArray *allIdentifiers;
  uint64_t v10;
  NSMutableArray *insertedIdentifiers;
  CNSaveRequestContactIdentifierCollector *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNSaveRequestContactIdentifierCollector;
  v6 = -[CNSaveRequestContactIdentifierCollector init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    allIdentifiers = v7->_allIdentifiers;
    v7->_allIdentifiers = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    insertedIdentifiers = v7->_insertedIdentifiers;
    v7->_insertedIdentifiers = (NSMutableArray *)v10;

    v12 = v7;
  }

  return v7;
}

- (void)collectIdentifiers
{
  -[CNSaveRequest acceptChangeHistoryEventVisitor:](self->_request, "acceptChangeHistoryEventVisitor:", self);
}

- (NSArray)allContactIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_allIdentifiers, "copy");
}

- (NSArray)insertedContactIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_insertedIdentifiers, "copy");
}

- (void)visitAddContactEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  id v5;
  void *v6;
  void *v7;
  NSMutableArray *insertedIdentifiers;
  void *v9;
  id v10;

  allIdentifiers = self->_allIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allIdentifiers, "addObject:", v7);

  insertedIdentifiers = self->_insertedIdentifiers;
  objc_msgSend(v5, "contact");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](insertedIdentifiers, "addObject:", v9);

}

- (void)visitUpdateContactEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  void *v4;
  id v5;

  allIdentifiers = self->_allIdentifiers;
  objc_msgSend(a3, "contact");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allIdentifiers, "addObject:", v4);

}

- (void)visitDeleteContactEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  id v4;

  allIdentifiers = self->_allIdentifiers;
  objc_msgSend(a3, "contactIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allIdentifiers, "addObject:", v4);

}

- (void)visitLinkContactsEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  id v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  allIdentifiers = self->_allIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "fromContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allIdentifiers, "addObject:", v7);

  v8 = self->_allIdentifiers;
  objc_msgSend(v5, "toContact");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v8, "addObject:", v9);

}

- (void)visitPreferredContactForImageEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  id v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  allIdentifiers = self->_allIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "preferredContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allIdentifiers, "addObject:", v7);

  v8 = self->_allIdentifiers;
  objc_msgSend(v5, "unifiedContact");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v8, "addObject:", v9);

}

- (void)visitPreferredContactForNameEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  id v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  allIdentifiers = self->_allIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "preferredContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allIdentifiers, "addObject:", v7);

  v8 = self->_allIdentifiers;
  objc_msgSend(v5, "unifiedContact");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v8, "addObject:", v9);

}

- (void)visitUnlinkContactEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  void *v4;
  id v5;

  allIdentifiers = self->_allIdentifiers;
  objc_msgSend(a3, "contact");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allIdentifiers, "addObject:", v4);

}

- (void)visitDifferentMeCardEvent:(id)a3
{
  NSMutableArray *allIdentifiers;
  id v4;

  allIdentifiers = self->_allIdentifiers;
  objc_msgSend(a3, "contactIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray _cn_addNonNilObject:](allIdentifiers, "_cn_addNonNilObject:", v4);

}

- (CNSaveRequest)request
{
  return (CNSaveRequest *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)allIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)insertedIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedIdentifiers, 0);
  objc_storeStrong((id *)&self->_allIdentifiers, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

@implementation MUILocationSuggestion

+ (id)suggestionWithAddress:(id)a3 date:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6 objectID:(id)a7 messageList:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAddress:date:authors:authorEmailAddresses:objectID:messageList:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (MUILocationSuggestion)initWithAddress:(id)a3 date:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6 objectID:(id)a7 messageList:(id)a8
{
  id v15;
  id v16;
  MUILocationSuggestion *v17;
  MUILocationSuggestion *v18;
  objc_super v20;

  v15 = a3;
  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MUILocationSuggestion;
  v17 = -[MUIResultSuggestion initWithObjectID:messageList:authors:authorEmailAddresses:](&v20, sel_initWithObjectID_messageList_authors_authorEmailAddresses_, a7, a8, a5, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_address, a3);
    objc_storeStrong((id *)&v18->_date, a4);
  }

  return v18;
}

- (id)category
{
  return +[MUISearchSuggestionCategory locationCategory](MUISearchSuggestionCategory, "locationCategory");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *address;
  NSDate *date;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  address = self->_address;
  date = self->_date;
  -[MUIResultSuggestion authors](self, "authors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion authorEmailAddresses](self, "authorEmailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion messageList](self, "messageList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> address=%@ date=%@ authors=%@ authorEmailAddresses=%@ objectID=%@ messageList=%@"), v4, self, address, date, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)address
{
  return self->_address;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end

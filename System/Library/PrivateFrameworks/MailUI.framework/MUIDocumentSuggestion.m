@implementation MUIDocumentSuggestion

+ (id)suggestionWithFileURL:(id)a3 name:(id)a4 date:(id)a5 subject:(id)a6 authors:(id)a7 authorEmailAddresses:(id)a8 objectID:(id)a9 messageList:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileURL:name:date:subject:authors:authorEmailAddresses:objectID:messageList:", v24, v23, v22, v21, v20, v19, v18, v17);

  return v25;
}

- (MUIDocumentSuggestion)initWithFileURL:(id)a3 name:(id)a4 date:(id)a5 subject:(id)a6 authors:(id)a7 authorEmailAddresses:(id)a8 objectID:(id)a9 messageList:(id)a10
{
  id v17;
  MUIDocumentSuggestion *v18;
  MUIDocumentSuggestion *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v17 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MUIDocumentSuggestion;
  v18 = -[MUIResultSuggestion initWithObjectID:messageList:authors:authorEmailAddresses:](&v24, sel_initWithObjectID_messageList_authors_authorEmailAddresses_, a9, a10, a7, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fileURL, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_date, a5);
    objc_storeStrong((id *)&v19->_subject, a6);
  }

  return v19;
}

- (id)category
{
  return +[MUISearchSuggestionCategory documentCategory](MUISearchSuggestionCategory, "documentCategory");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  NSDate *date;
  NSURL *fileURL;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  name = self->_name;
  date = self->_date;
  fileURL = self->_fileURL;
  -[MUIResultSuggestion authors](self, "authors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion authorEmailAddresses](self, "authorEmailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion objectID](self, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion messageList](self, "messageList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> name=%@ date=%@ fileURL=%@ authors=%@ authorEmailAddresses=%@ objectID=%@ messageList=%@"), v4, self, name, date, fileURL, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)subject
{
  return self->_subject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end

@implementation MUILinkSuggestion

+ (id)suggestionWithURL:(id)a3 title:(id)a4 richLinkID:(id)a5 authors:(id)a6 authorEmailAddresses:(id)a7 objectID:(id)a8 messageID:(id)a9 messageList:(id)a10
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
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:title:richLinkID:authors:authorEmailAddresses:objectID:messageID:messageList:", v24, v23, v22, v21, v20, v19, v18, v17);

  return v25;
}

- (MUILinkSuggestion)initWithURL:(id)a3 title:(id)a4 richLinkID:(id)a5 authors:(id)a6 authorEmailAddresses:(id)a7 objectID:(id)a8 messageID:(id)a9 messageList:(id)a10
{
  id v17;
  MUILinkSuggestion *v18;
  MUILinkSuggestion *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)MUILinkSuggestion;
  v18 = -[MUIResultSuggestion initWithObjectID:messageList:authors:authorEmailAddresses:](&v24, sel_initWithObjectID_messageList_authors_authorEmailAddresses_, a8, a10, a6, a7);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_richLinkID, a5);
    objc_storeStrong((id *)&v19->_messageID, a9);
  }

  return v19;
}

- (id)category
{
  return +[MUISearchSuggestionCategory linkCategory](MUISearchSuggestionCategory, "linkCategory");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSURL *url;
  NSString *title;
  NSString *richLinkID;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  url = self->_url;
  title = self->_title;
  richLinkID = self->_richLinkID;
  -[MUIResultSuggestion authors](self, "authors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion authorEmailAddresses](self, "authorEmailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion objectID](self, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIResultSuggestion messageList](self, "messageList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> url=%@ title=%@ richLinkID=%@  authors=%@ authorEmailAddresses=%@ objectID=%@ messageList=%@"), v4, self, url, title, richLinkID, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)richLinkID
{
  return self->_richLinkID;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_richLinkID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end

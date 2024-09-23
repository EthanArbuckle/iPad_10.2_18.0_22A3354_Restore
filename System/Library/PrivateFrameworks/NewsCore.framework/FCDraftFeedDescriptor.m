@implementation FCDraftFeedDescriptor

- (FCDraftFeedDescriptor)initWithChannel:(id)a3 articleListID:(id)a4 issueListID:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  FCDraftFeedDescriptor *v15;
  FCDraftFeedDescriptor *v16;
  uint64_t v17;
  NSString *articleListID;
  uint64_t v19;
  FCDraftFeedDescriptor *issueListID;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("drafts-%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22.receiver = self;
  v22.super_class = (Class)FCDraftFeedDescriptor;
  v15 = -[FCFeedDescriptor initWithIdentifier:](&v22, sel_initWithIdentifier_, v14);
  v16 = v15;
  if (v10)
  {
    if (v15)
    {
      objc_storeStrong((id *)&v15->_channel, a3);
      v17 = objc_msgSend(v10, "copy");
      articleListID = v16->_articleListID;
      v16->_articleListID = (NSString *)v17;

      v19 = objc_msgSend(v11, "copy");
      issueListID = (FCDraftFeedDescriptor *)v16->_issueListID;
      v16->_issueListID = (NSString *)v19;
    }
    else
    {
      issueListID = 0;
    }
  }
  else
  {
    issueListID = v15;
    v16 = 0;
  }

  return v16;
}

- (id)name
{
  void *v2;
  void *v3;

  FCBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Drafts"), &stru_1E464BC40, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)feedType
{
  return 14;
}

- (NSString)articleListID
{
  return self->_articleListID;
}

- (NSString)issueListID
{
  return self->_issueListID;
}

- (FCChannelProviding)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_issueListID, 0);
  objc_storeStrong((id *)&self->_articleListID, 0);
}

@end

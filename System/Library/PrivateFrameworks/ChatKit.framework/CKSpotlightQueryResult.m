@implementation CKSpotlightQueryResult

- (CKSpotlightQueryResult)initWithSearchableItem:(id)a3 inSection:(id)a4 withConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKSpotlightQueryResult *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKSpotlightQueryResult;
  v11 = -[CKSpotlightQueryResult init](&v16, sel_init);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSpotlightQueryResult setIdentifier:](v11, "setIdentifier:", v14);
    -[CKSpotlightQueryResult setItem:](v11, "setItem:", v8);
    -[CKSpotlightQueryResult setConversation:](v11, "setConversation:", v10);

  }
  return v11;
}

- (NSString)messageGUID
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  -[CKSpotlightQueryResult item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("chatDomain"));

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[CKSpotlightQueryResult item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domainIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("attachmentDomain"));

    -[CKSpotlightQueryResult item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "attributeSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ownerIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return (NSString *)v6;
}

- (NSURL)previewItemURL
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;

  -[CKSpotlightQueryResult item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("attachmentDomain"));

  if (!v5)
  {
    v8 = 0;
LABEL_7:
    v8 = v8;
    v12 = v8;
    goto LABEL_8;
  }
  -[CKSpotlightQueryResult item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("pto"));

  if (!v10
    || (+[CKLivePhotoBundleUtilities getLivePhotoBundleURL:](CKLivePhotoBundleUtilities, "getLivePhotoBundleURL:", v8), (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_7;
  }
  v12 = (void *)v11;

LABEL_8:
  return (NSURL *)v12;
}

- (NSString)previewItemTitle
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKSpotlightQueryResult item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("attachmentDomain"));

  if (v5)
  {
    -[CKSpotlightQueryResult item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_spotlightItemSnippet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    -[CKSpotlightQueryResult identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v8, "isEqualToString:", v9);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
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
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)CKSpotlightQueryResult;
  -[CKSpotlightQueryResult description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSpotlightQueryResult messageGUID](self, "messageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSpotlightQueryResult previewItemTitle](self, "previewItemTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSpotlightQueryResult previewItemURL](self, "previewItemURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSpotlightQueryResult item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSpotlightQueryResult item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributeDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: messageGUID: %@, title: %@, url: %@, item: %@, item attributes: %@"), v4, v5, v6, v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)isFromMe
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKSpotlightQueryResult item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "isFromMe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CSSearchableItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

@implementation WFMessage

- (WFMessage)initWithContent:(id)a3 conversationID:(id)a4 recipientContactIDs:(id)a5 recipients:(id)a6 senderContactID:(id)a7 senderHandles:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  WFMessage *v20;
  uint64_t v21;
  NSString *content;
  uint64_t v23;
  NSString *conversationID;
  uint64_t v25;
  NSArray *recipientContactIDs;
  uint64_t v27;
  NSArray *recipients;
  uint64_t v29;
  NSString *senderContactID;
  uint64_t v31;
  NSArray *senderHandles;
  WFMessage *v33;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)WFMessage;
  v20 = -[WFMessage init](&v35, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    content = v20->_content;
    v20->_content = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    conversationID = v20->_conversationID;
    v20->_conversationID = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    recipientContactIDs = v20->_recipientContactIDs;
    v20->_recipientContactIDs = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    recipients = v20->_recipients;
    v20->_recipients = (NSArray *)v27;

    v29 = objc_msgSend(v18, "copy");
    senderContactID = v20->_senderContactID;
    v20->_senderContactID = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    senderHandles = v20->_senderHandles;
    v20->_senderHandles = (NSArray *)v31;

    v33 = v20;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFMessage content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("content"));

  -[WFMessage conversationID](self, "conversationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("conversationID"));

  -[WFMessage recipientContactIDs](self, "recipientContactIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("recipientContactIDs"));

  -[WFMessage recipients](self, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("recipients"));

  -[WFMessage senderContactID](self, "senderContactID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("senderContactID"));

  -[WFMessage senderHandles](self, "senderHandles");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("senderHandles"));

}

- (WFMessage)initWithCoder:(id)a3
{
  id v4;
  WFMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = -[WFMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("recipientContactIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("recipients"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderContactID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("senderHandles"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[WFMessage initWithContent:conversationID:recipientContactIDs:recipients:senderContactID:senderHandles:](v5, "initWithContent:conversationID:recipientContactIDs:recipients:senderContactID:senderHandles:", v6, v7, v11, v15, v16, v20);
  }

  return v5;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSArray)recipientContactIDs
{
  return self->_recipientContactIDs;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)senderContactID
{
  return self->_senderContactID;
}

- (NSArray)senderHandles
{
  return self->_senderHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderHandles, 0);
  objc_storeStrong((id *)&self->_senderContactID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_recipientContactIDs, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation MessageListSectionDataSourceUpdateRequest

- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3
{
  return -[MessageListSectionDataSourceUpdateRequest initWithSection:messageList:](self, "initWithSection:messageList:", a3, 0);
}

- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3 messageList:(id)a4
{
  id v7;
  id v8;
  MessageListSectionDataSourceUpdateRequest *v9;
  MessageListSectionDataSourceUpdateRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MessageListSectionDataSourceUpdateRequest;
  v9 = -[MessageListSectionDataSourceUpdateRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_section, a3);
    objc_storeStrong((id *)&v10->_messageList, a4);
  }

  return v10;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MessageListSectionDataSourceUpdateRequest section](self, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSourceUpdateRequest messageList](self, "messageList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p: MessageListSectionDataSourceUpdateRequest> section=%@, messageList=%@"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)section
{
  return self->_section;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

@end

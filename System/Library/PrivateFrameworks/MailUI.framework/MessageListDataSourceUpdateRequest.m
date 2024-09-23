@implementation MessageListDataSourceUpdateRequest

- (MessageListDataSourceUpdateRequest)initWithSectionUpdates:(id)a3 sectionsToRemove:(id)a4 startsWithEmptySnapshot:(BOOL)a5
{
  id v9;
  id v10;
  MessageListDataSourceUpdateRequest *v11;
  MessageListDataSourceUpdateRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MessageListDataSourceUpdateRequest;
  v11 = -[MessageListDataSourceUpdateRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sectionsToUpdate, a3);
    objc_storeStrong((id *)&v12->_sectionsToRemove, a4);
    v12->_startsWithEmptySnapshot = a5;
  }

  return v12;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MessageListDataSourceUpdateRequest sectionsToUpdate](self, "sectionsToUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSourceUpdateRequest sectionsToRemove](self, "sectionsToRemove");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p: MessageListDataSourceUpdateRequest> sectionsToUpdate=%@, sectionsToRemove=%@, startsWithEmptySnapshot=%d"), self, v4, v5, -[MessageListDataSourceUpdateRequest startsWithEmptySnapshot](self, "startsWithEmptySnapshot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)sectionsToUpdate
{
  return self->_sectionsToUpdate;
}

- (NSArray)sectionsToRemove
{
  return self->_sectionsToRemove;
}

- (BOOL)startsWithEmptySnapshot
{
  return self->_startsWithEmptySnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsToRemove, 0);
  objc_storeStrong((id *)&self->_sectionsToUpdate, 0);
}

@end

@implementation MessageListSectionUpdate

- (MessageListSectionUpdate)initWithMessageListSectionDataSource:(id)a3 animated:(BOOL)a4 cleanSnapshot:(BOOL)a5 updateHandler:(id)a6
{
  return -[MessageListSectionUpdate initWithMessageListSectionDataSource:animated:cleanSnapshot:prepareHandler:updateHandler:immediateCompletion:completionHandler:](self, "initWithMessageListSectionDataSource:animated:cleanSnapshot:prepareHandler:updateHandler:immediateCompletion:completionHandler:", a3, a4, a5, 0, a6, 0, 0);
}

- (MessageListSectionUpdate)initWithMessageListSectionDataSource:(id)a3 animated:(BOOL)a4 cleanSnapshot:(BOOL)a5 prepareHandler:(id)a6 updateHandler:(id)a7 immediateCompletion:(BOOL)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  MessageListSectionUpdate *v20;
  MessageListSectionUpdate *v21;
  void *v22;
  id prepareHandler;
  void *v24;
  id updateHandler;
  void *v26;
  id completionHandler;
  objc_super v29;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MessageListSectionUpdate;
  v20 = -[MessageListSectionUpdate init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sectionDataSource, a3);
    v21->_animated = a4;
    v21->_cleanSnapshot = a5;
    v22 = _Block_copy(v17);
    prepareHandler = v21->_prepareHandler;
    v21->_prepareHandler = v22;

    v24 = _Block_copy(v18);
    updateHandler = v21->_updateHandler;
    v21->_updateHandler = v24;

    v21->_immediateCompletion = a8;
    v26 = _Block_copy(v19);
    completionHandler = v21->_completionHandler;
    v21->_completionHandler = v26;

  }
  return v21;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MessageListSectionUpdate sectionDataSource](self, "sectionDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p: MessageListSectionUpdate> section=%@ animated=%d cleanSnapshot=%d immediateCompletion=%d"), self, v5, -[MessageListSectionUpdate animated](self, "animated"), -[MessageListSectionUpdate cleanSnapshot](self, "cleanSnapshot"), -[MessageListSectionUpdate immediateCompletion](self, "immediateCompletion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (MessageListSectionDataSource)sectionDataSource
{
  return self->_sectionDataSource;
}

- (void)setSectionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_sectionDataSource, a3);
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)cleanSnapshot
{
  return self->_cleanSnapshot;
}

- (void)setCleanSnapshot:(BOOL)a3
{
  self->_cleanSnapshot = a3;
}

- (BOOL)immediateCompletion
{
  return self->_immediateCompletion;
}

- (void)setImmediateCompletion:(BOOL)a3
{
  self->_immediateCompletion = a3;
}

- (id)prepareHandler
{
  return self->_prepareHandler;
}

- (void)setPrepareHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_prepareHandler, 0);
  objc_storeStrong((id *)&self->_sectionDataSource, 0);
}

@end

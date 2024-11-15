@implementation ECTransferMessageActionResults

- (ECTransferMessageActionResults)initWithBuilder:(id)a3
{
  void (**v4)(id, ECTransferMessageActionResults *);
  ECTransferMessageActionResults *v5;
  objc_super v7;

  v4 = (void (**)(id, ECTransferMessageActionResults *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECTransferMessageActionResults;
  v5 = -[ECTransferMessageActionResults init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (int64_t)phaseForResults
{
  return self->_phaseForResults;
}

- (void)setPhaseForResults:(int64_t)a3
{
  self->_phaseForResults = a3;
}

- (NSArray)completedItems
{
  return self->_completedItems;
}

- (void)setCompletedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)failedItems
{
  return self->_failedItems;
}

- (void)setFailedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)createdServerMessages
{
  return self->_createdServerMessages;
}

- (void)setCreatedServerMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)downloadedDataByCopyItems
{
  return self->_downloadedDataByCopyItems;
}

- (void)setDownloadedDataByCopyItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedDataByCopyItems, 0);
  objc_storeStrong((id *)&self->_createdServerMessages, 0);
  objc_storeStrong((id *)&self->_failedItems, 0);
  objc_storeStrong((id *)&self->_completedItems, 0);
}

@end

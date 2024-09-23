@implementation NTTodayResultOperation

- (NTTodayResultOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTTodayResultOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (void)setFeedPersonalizerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, a3);
}

- (NTPBTodayResultOperationInfo)operationInfo
{
  return self->_operationInfo;
}

- (void)setOperationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NFCopying)prefetchedContent
{
  return self->_prefetchedContent;
}

- (void)setPrefetchedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)headlineResultCompletionHandler
{
  return self->_headlineResultCompletionHandler;
}

- (void)setHeadlineResultCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headlineResultCompletionHandler, 0);
  objc_storeStrong((id *)&self->_prefetchedContent, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end

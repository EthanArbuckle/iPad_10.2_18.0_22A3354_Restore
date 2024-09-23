@implementation _MPAbstractNetworkArtworkLoadingContext

- (NSMutableDictionary)catalogIdentifierToCompletionHandlerMap
{
  return self->_catalogIdentifierToCompletionHandlerMap;
}

- (void)setDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_dataTask, a3);
}

- (_MPAbstractNetworkArtworkLoadingContext)init
{
  _MPAbstractNetworkArtworkLoadingContext *v2;
  uint64_t v3;
  NSMutableDictionary *catalogIdentifierToCompletionHandlerMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPAbstractNetworkArtworkLoadingContext;
  v2 = -[_MPAbstractNetworkArtworkLoadingContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    catalogIdentifierToCompletionHandlerMap = v2->_catalogIdentifierToCompletionHandlerMap;
    v2->_catalogIdentifierToCompletionHandlerMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogIdentifierToCompletionHandlerMap, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

@end

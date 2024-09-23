@implementation _MFSearchProcessResultsOperation

+ (id)operationWithResultsOfType:(unint64_t)a3 completion:(id)a4 consumer:(id)a5
{
  id v7;
  _MFSearchResultsConsumer *v8;
  _MFSearchProcessResultsOperation *v9;
  _MFSearchResultsConsumer *consumer;
  _MFSearchResultsConsumer *v11;
  void *v12;
  id completionBlock;

  v7 = a4;
  v8 = (_MFSearchResultsConsumer *)a5;
  v9 = objc_alloc_init(_MFSearchProcessResultsOperation);
  v9->_type = a3;
  consumer = v9->_consumer;
  v9->_consumer = v8;
  v11 = v8;

  v12 = _Block_copy(v7);
  completionBlock = v9->_completionBlock;
  v9->_completionBlock = v12;

  return v9;
}

- (void)main
{
  id v3;
  id v4;
  _MFSearchResultsConsumer *consumer;
  id v6;
  id v7;
  void (**completionBlock)(id, _QWORD);
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  if (_shouldCancel(self, self->_consumer)
    || !-[_MFSearchResultsConsumer _shouldProcessResultsAfterFinishingType:](self->_consumer, "_shouldProcessResultsAfterFinishingType:", self->_type))
  {
    (*((void (**)(void))self->_completionBlock + 2))();
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    consumer = self->_consumer;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40___MFSearchProcessResultsOperation_main__block_invoke;
    v10[3] = &unk_1E5A66E80;
    v10[4] = self;
    v6 = v4;
    v11 = v6;
    v7 = v3;
    v12 = v7;
    -[_MFSearchResultsConsumer _enumerateSearchResultTypesInSortOrderUsingBlock:](consumer, "_enumerateSearchResultTypesInSortOrderUsingBlock:", v10);
    completionBlock = (void (**)(id, _QWORD))self->_completionBlock;
    if (_shouldCancel(self, self->_consumer))
      v9 = 0;
    else
      v9 = v7;
    ((void (**)(id, id))completionBlock)[2](completionBlock, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_consumer, 0);
}

@end

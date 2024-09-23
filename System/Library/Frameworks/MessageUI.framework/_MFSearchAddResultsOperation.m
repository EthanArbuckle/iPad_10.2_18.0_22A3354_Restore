@implementation _MFSearchAddResultsOperation

+ (id)operationWithResults:(id)a3 ofType:(unint64_t)a4 consumer:(id)a5
{
  NSArray *v7;
  _MFSearchResultsConsumer *v8;
  _MFSearchAddResultsOperation *v9;
  NSArray *results;
  NSArray *v11;
  _MFSearchResultsConsumer *consumer;

  v7 = (NSArray *)a3;
  v8 = (_MFSearchResultsConsumer *)a5;
  v9 = objc_alloc_init(_MFSearchAddResultsOperation);
  results = v9->_results;
  v9->_results = v7;
  v11 = v7;

  v9->_type = a4;
  consumer = v9->_consumer;
  v9->_consumer = v8;

  return v9;
}

- (void)main
{
  if ((_shouldCancel(self, self->_consumer) & 1) == 0)
    -[_MFSearchResultsConsumer _addResults:ofType:](self->_consumer, "_addResults:ofType:", self->_results, self->_type);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_consumer, 0);
}

@end

@implementation _CNChangeHistoryFetchExecutionResponse

- (_CNChangeHistoryFetchExecutionResponse)initWithEvents:(id)a3 count:(int64_t)a4 token:(id)a5
{
  id v8;
  id v9;
  _CNChangeHistoryFetchExecutionResponse *v10;
  uint64_t v11;
  NSArray *events;
  uint64_t v13;
  NSData *token;
  _CNChangeHistoryFetchExecutionResponse *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_CNChangeHistoryFetchExecutionResponse;
  v10 = -[_CNChangeHistoryFetchExecutionResponse init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    events = v10->_events;
    v10->_events = (NSArray *)v11;

    v10->_count = a4;
    v13 = objc_msgSend(v9, "copy");
    token = v10->_token;
    v10->_token = (NSData *)v13;

    v15 = v10;
  }

  return v10;
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)count
{
  return self->_count;
}

- (NSData)token
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end

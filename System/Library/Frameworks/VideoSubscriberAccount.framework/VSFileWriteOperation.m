@implementation VSFileWriteOperation

- (VSFileWriteOperation)init
{
  VSFileWriteOperation *v2;
  VSOptional *v3;
  VSOptional *data;
  VSOptional *v5;
  VSOptional *destination;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSFileWriteOperation;
  v2 = -[VSFileWriteOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    data = v2->_data;
    v2->_data = v3;

    v5 = objc_alloc_init(VSOptional);
    destination = v2->_destination;
    v2->_destination = v5;

  }
  return v2;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  -[VSFileWriteOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFileWriteOperation destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7 = objc_msgSend(v4, "writeToURL:options:error:", v6, 1, &v9);
  v8 = v9;

  if ((v7 & 1) == 0)
    -[VSFileWriteOperation setError:](self, "setError:", v8);
  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");

}

- (VSOptional)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (VSOptional)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end

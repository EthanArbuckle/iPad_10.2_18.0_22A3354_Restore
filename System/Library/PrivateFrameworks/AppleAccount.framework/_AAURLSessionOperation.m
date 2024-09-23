@implementation _AAURLSessionOperation

- (_AAURLSessionOperation)initWithCompletion:(id)a3
{
  id v4;
  _AAURLSessionOperation *v5;
  uint64_t v6;
  id completion;
  NSMutableData *mutableData;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_AAURLSessionOperation;
  v5 = -[_AAURLSessionOperation init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = (id)v6;

    mutableData = v5->_mutableData;
    v5->_mutableData = 0;

  }
  return v5;
}

+ (id)operationWithCompletion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCompletion:", v4);

  return v5;
}

- (_AAURLSessionOperation)init
{
  -[_AAURLSessionOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NSData)data
{
  return (NSData *)(id)-[NSMutableData copy](self->_mutableData, "copy");
}

- (void)appendData:(id)a3
{
  NSMutableData *mutableData;
  NSMutableData *v5;
  NSMutableData *v6;

  mutableData = self->_mutableData;
  if (mutableData)
  {
    -[NSMutableData appendData:](mutableData, "appendData:", a3);
  }
  else
  {
    v5 = (NSMutableData *)objc_msgSend(a3, "mutableCopy");
    v6 = self->_mutableData;
    self->_mutableData = v5;

  }
}

- (void)invokeCompletionWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**completion)(id, void *, id, id);
  void *v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v12 = v6;
  v8 = v7;
  if ((v12 == 0) != (v8 != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: response ^ error"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }

  completion = (void (**)(id, void *, id, id))self->_completion;
  -[_AAURLSessionOperation data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  completion[2](completion, v10, v12, v8);

}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_mutableData, 0);
}

@end

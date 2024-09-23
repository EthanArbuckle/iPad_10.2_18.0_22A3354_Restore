@implementation FBKRequestRecordWrapper

- (FBKRequestRecordWrapper)initWithURL:(id)a3 httpMethod:(id)a4 responseData:(id)a5
{
  id v8;
  id v9;
  id v10;
  FBKRequestRecordWrapper *v11;
  FBKRequestRecord *v12;
  FBKRequestRecord *wrappedObject;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FBKRequestRecordWrapper;
  v11 = -[FBKRequestRecordWrapper init](&v15, sel_init);
  if (v11)
  {
    v12 = -[DEDRequestRecord initWithURL:httpMethod:responseData:]([FBKRequestRecord alloc], "initWithURL:httpMethod:responseData:", v8, v9, v10);
    wrappedObject = v11->_wrappedObject;
    v11->_wrappedObject = v12;

  }
  return v11;
}

- (FBKRequestRecordWrapper)initWithRequest:(id)a3 response:(id)a4 session:(id)a5 cookies:(id)a6 body:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FBKRequestRecordWrapper *v20;
  FBKRequestRecord *v21;
  FBKRequestRecord *wrappedObject;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FBKRequestRecordWrapper;
  v20 = -[FBKRequestRecordWrapper init](&v24, sel_init);
  if (v20)
  {
    v21 = -[DEDRequestRecord initWithRequest:response:session:cookies:body:error:]([FBKRequestRecord alloc], "initWithRequest:response:session:cookies:body:error:", v14, v15, v16, v17, v18, v19);
    wrappedObject = v20->_wrappedObject;
    v20->_wrappedObject = v21;

  }
  return v20;
}

- (void)setIsFailure:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FBKRequestRecordWrapper wrappedObject](self, "wrappedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsFailure:", v3);

}

- (FBKRequestRecord)wrappedObject
{
  return self->_wrappedObject;
}

- (void)setWrappedObject:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedObject, a3);
}

- (BOOL)isFailure
{
  return self->_isFailure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedObject, 0);
}

@end

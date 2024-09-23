@implementation _AFAssertionImpl

- (_AFAssertionImpl)initWithUUID:(id)a3 context:(id)a4 relinquishmentHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _AFAssertionImpl *v11;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  AFAssertionContext *context;
  AFTwoArgumentSafetyBlock *v16;
  void *v17;
  uint64_t v18;
  AFTwoArgumentSafetyBlock *relinquishmentHandler;
  _QWORD v21[4];
  id v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_AFAssertionImpl;
  v11 = -[_AFAssertionImpl init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    context = v11->_context;
    v11->_context = (AFAssertionContext *)v14;

    v16 = [AFTwoArgumentSafetyBlock alloc];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63___AFAssertionImpl_initWithUUID_context_relinquishmentHandler___block_invoke;
    v21[3] = &unk_1E3A2DC88;
    v22 = v10;
    +[AFError errorWithCode:](AFError, "errorWithCode:", 40);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AFTwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:](v16, "initWithBlock:defaultValue1:defaultValue2:", v21, 0, v17);
    relinquishmentHandler = v11->_relinquishmentHandler;
    v11->_relinquishmentHandler = (AFTwoArgumentSafetyBlock *)v18;

  }
  return v11;
}

- (void)invokeRelinquishmentHandlerWithContext:(id)a3 error:(id)a4
{
  -[AFTwoArgumentSafetyBlock invokeWithValue:andValue:](self->_relinquishmentHandler, "invokeWithValue:andValue:", a3, a4);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)_AFAssertionImpl;
  -[_AFAssertionImpl description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAssertionCreateDescriptionOfProperties(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@}"), v4, v5);

  return (NSString *)v6;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (AFAssertionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_relinquishmentHandler, 0);
}

@end

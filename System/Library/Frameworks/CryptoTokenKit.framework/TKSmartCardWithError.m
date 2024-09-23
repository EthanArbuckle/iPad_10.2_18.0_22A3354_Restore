@implementation TKSmartCardWithError

- (TKSmartCardWithError)initWithCard:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  TKSmartCardWithError *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "slot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)TKSmartCardWithError;
  v10 = -[TKSmartCard initWithSlot:](&v12, sel_initWithSlot_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentCard, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (void)beginSessionWithReply:(id)a3
{
  (*((void (**)(id, _QWORD, NSError *))a3 + 2))(a3, 0, self->_error);
}

- (void)transmitRequest:(id)a3 reply:(id)a4
{
  (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, self->_error);
}

- (void)sendIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 le:(id)a7 reply:(id)a8
{
  (*((void (**)(id, _QWORD, _QWORD, NSError *))a8 + 2))(a8, 0, 0, self->_error);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parentCard, 0);
}

@end

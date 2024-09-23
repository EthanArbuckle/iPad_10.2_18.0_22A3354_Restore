@implementation BBAssertion

- (BBAssertion)initWithDelegate:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  BBAssertion *v8;
  BBAssertion *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BBAssertion;
  v8 = -[BBAssertion init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_msgSend(v7, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

  }
  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "assertionExpired:transactionID:", self->_identifier, self->_transactionID);

  v4.receiver = self;
  v4.super_class = (Class)BBAssertion;
  -[BBAssertion dealloc](&v4, sel_dealloc);
}

- (void)increaseOrIgnoreTransactionID:(unint64_t)a3
{
  if (self->_transactionID < a3)
    self->_transactionID = a3;
}

- (id)identifier
{
  return self->_identifier;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (BBAssertionDelegate)delegate
{
  return (BBAssertionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

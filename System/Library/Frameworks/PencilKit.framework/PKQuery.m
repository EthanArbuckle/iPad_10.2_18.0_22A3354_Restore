@implementation PKQuery

- (PKQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4;
  PKQuery *v5;
  PKQuery *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKQuery;
  v5 = -[PKQuery init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sessionManager, v4);

  return v6;
}

- (PKRecognitionSessionManager)sessionManager
{
  return (PKRecognitionSessionManager *)objc_loadWeakRetained((id *)&self->_sessionManager);
}

- (void)setSessionManager:(id)a3
{
  objc_storeWeak((id *)&self->_sessionManager, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_sessionManager);
}

@end

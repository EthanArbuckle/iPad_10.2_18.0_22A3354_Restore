@implementation IKOnReadyStateChangeMessage

- (IKOnReadyStateChangeMessage)initWithReadyState:(unsigned int)a3 statusCode:(unsigned int)a4 statusText:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  IKOnReadyStateChangeMessage *v12;
  IKOnReadyStateChangeMessage *v13;
  uint64_t v14;
  NSString *statusText;
  uint64_t v16;
  NSError *error;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IKOnReadyStateChangeMessage;
  v12 = -[IKOnReadyStateChangeMessage init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_readyState = a3;
    v12->_statusCode = a4;
    v14 = objc_msgSend(v10, "copy");
    statusText = v13->_statusText;
    v13->_statusText = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    error = v13->_error;
    v13->_error = (NSError *)v16;

  }
  return v13;
}

- (unsigned)readyState
{
  return self->_readyState;
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
}

@end

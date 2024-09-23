@implementation INCExtensionError

- (INCExtensionError)initWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6;
  INCExtensionError *v7;
  INCExtensionError *v8;
  uint64_t v9;
  NSError *underlyingError;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INCExtensionError;
  v7 = -[INCExtensionError init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_errorCode = a3;
    v9 = objc_msgSend(v6, "copy");
    underlyingError = v8->_underlyingError;
    v8->_underlyingError = (NSError *)v9;

  }
  return v8;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
}

@end

@implementation CRKTransportPreflightResultObject

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (self->_transport)
  {
    if (_CRKLogGeneral_onceToken_26 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_26, &__block_literal_global_79);
    v3 = _CRKLogGeneral_logObj_26;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Invalidating transport that was not taken", buf, 2u);
    }
    +[CRKTransportInvalidator invalidateTransport:](CRKTransportInvalidator, "invalidateTransport:", self->_transport);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRKTransportPreflightResultObject;
  -[CRKTransportPreflightResultObject dealloc](&v4, sel_dealloc);
}

- (CRKTransportPreflightResultObject)initWithTransport:(id)a3 shouldResetBackoff:(BOOL)a4
{
  id v7;
  CRKTransportPreflightResultObject *v8;
  CRKTransportPreflightResultObject *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKTransportPreflightResultObject;
  v8 = -[CRKTransportPreflightResultObject init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transport, a3);
    v9->_shouldResetBackoff = a4;
  }

  return v9;
}

- (id)takeTransport
{
  void *v3;

  -[CRKTransportPreflightResultObject transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKTransportPreflightResultObject setTransport:](self, "setTransport:", 0);
  return v3;
}

- (BOOL)shouldResetBackoff
{
  return self->_shouldResetBackoff;
}

- (CATTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end

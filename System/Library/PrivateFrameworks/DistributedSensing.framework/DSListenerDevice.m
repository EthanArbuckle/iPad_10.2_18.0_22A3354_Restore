@implementation DSListenerDevice

- (DSListenerDevice)initWithRapportDevice:(id)a3 queue:(id)a4
{
  DSListenerDevice *v4;
  DSListenerDevice *v5;
  id responseHandler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSListenerDevice;
  v4 = -[DSRapportDevice initWithRapportDevice:queue:](&v8, sel_initWithRapportDevice_queue_, a3, a4);
  v5 = v4;
  if (v4)
  {
    responseHandler = v4->_responseHandler;
    v4->_responseHandler = 0;

  }
  return v5;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (DSClientMotionDataOptions)inOptions
{
  return self->_inOptions;
}

- (void)setInOptions:(id)a3
{
  objc_storeStrong((id *)&self->_inOptions, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_inOptions, 0);
}

@end

@implementation CLGeocoderInternal

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);
  self->_responseSilo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLGeocoderInternal;
  -[CLGeocoderInternal dealloc](&v3, sel_dealloc);
}

- (CLSilo)responseSilo
{
  return (CLSilo *)objc_getProperty(self, a2, 32, 1);
}

- (CLGeocoderInternal)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CLGeocoderInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLGeocoderInternal;
  v5 = -[CLGeocoderInternal init](&v7, sel_init);
  if (v5)
  {
    v5->_responseSilo = (CLSilo *)(id)objc_msgSend_main(MEMORY[0x1E0D44548], v2, v3, v4);
    v5->_queue = (OS_dispatch_queue *)dispatch_queue_create("CLGeocoder", 0);
  }
  return v5;
}

- (void)setResponseSilo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end

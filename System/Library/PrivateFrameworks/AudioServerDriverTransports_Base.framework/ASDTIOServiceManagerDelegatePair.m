@implementation ASDTIOServiceManagerDelegatePair

+ (id)forDelegate:(id)a3 andIOService:(id)a4
{
  id v5;
  id v6;
  ASDTIOServiceManagerDelegatePair *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(ASDTIOServiceManagerDelegatePair);
  -[ASDTIOServiceManagerDelegatePair setDelegate:](v7, "setDelegate:", v6);

  -[ASDTIOServiceManagerDelegatePair setIoService:](v7, "setIoService:", v5);
  return v7;
}

- (ASDTIOServiceManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (ASDTIOService)ioService
{
  return self->_ioService;
}

- (void)setIoService:(id)a3
{
  objc_storeStrong((id *)&self->_ioService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioService, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

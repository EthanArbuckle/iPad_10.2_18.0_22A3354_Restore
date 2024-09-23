@implementation NRLoggingXPCProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_proxy, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(self->_proxy, "forwardInvocation:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proxy, 0);
}

- (id)initWithBlahBlahBlahProxy:(id *)a1
{
  id v4;
  id *v5;

  v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 1, a2);
    v5 = a1;
  }

  return a1;
}

@end

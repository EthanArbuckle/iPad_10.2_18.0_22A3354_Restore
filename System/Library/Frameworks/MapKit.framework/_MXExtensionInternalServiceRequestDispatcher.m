@implementation _MXExtensionInternalServiceRequestDispatcher

- (void)dispatchRequest:(id)a3 vendor:(id)a4 completion:(id)a5
{
  objc_msgSend(a4, "handleRequest:completion:", a3, a5);
}

- (id)serviceProtocol
{
  return &unk_1EE079920;
}

@end

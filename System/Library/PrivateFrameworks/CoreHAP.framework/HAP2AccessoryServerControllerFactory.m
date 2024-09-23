@implementation HAP2AccessoryServerControllerFactory

- (id)createControllerWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  HAP2AccessoryServerController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HAP2AccessoryServerController initWithEncoding:secureTransport:operationQueue:]([HAP2AccessoryServerController alloc], "initWithEncoding:secureTransport:operationQueue:", v9, v8, v7);

  return v10;
}

@end

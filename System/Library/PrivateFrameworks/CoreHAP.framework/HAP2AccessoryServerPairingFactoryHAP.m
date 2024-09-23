@implementation HAP2AccessoryServerPairingFactoryHAP

- (id)createPairingDriverWithAccessoryInfo:(id)a3 transport:(id)a4 secureTransportFactory:(id)a5 encoding:(id)a6 operationQueue:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HAP2AccessoryServerPairingDriver *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = -[HAP2AccessoryServerPairingDriver initWithTransport:secureTransportFactory:encoding:featureFlags:]([HAP2AccessoryServerPairingDriver alloc], "initWithTransport:secureTransportFactory:encoding:featureFlags:", v12, v11, v10, objc_msgSend(v14, "featureFlags"));

  return v15;
}

@end

@implementation HAP2AccessoryServerSecureTransportFactoryThread

- (id)createSecureTransportWithTransport:(id)a3 isPaired:(BOOL)a4 encryptedSession:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  HAP2SerializedOperationQueue *v13;
  HAP2AccessoryServerSecureTransportThreadPaired *v14;
  HAP2AccessoryServerSecureTransportThreadPaired *v15;

  v5 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.operationQueue"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HAP2SerializedOperationQueue initWithName:]([HAP2SerializedOperationQueue alloc], "initWithName:", v12);
  if (v5)
    v14 = -[HAP2AccessoryServerSecureTransportPairVerify initWithTransport:operationQueue:]([HAP2AccessoryServerSecureTransportThreadPaired alloc], "initWithTransport:operationQueue:", v9, v13);
  else
    v14 = -[HAP2AccessoryServerSecureTransportPairSetup initWithTransport:operationQueue:encryptedSession:]([HAP2AccessoryServerSecureTransportPairSetup alloc], "initWithTransport:operationQueue:encryptedSession:", v9, v13, v7);
  v15 = v14;

  return v15;
}

@end

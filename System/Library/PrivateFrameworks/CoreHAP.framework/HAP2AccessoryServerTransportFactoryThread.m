@implementation HAP2AccessoryServerTransportFactoryThread

- (id)createTransportWithAccessoryInfo:(id)a3 discovery:(id)a4
{
  void *v5;
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  HAP2SerializedOperationQueue *v11;
  HAP2AccessoryServerTransportCoAP *v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.operationQueue"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HAP2SerializedOperationQueue initWithName:]([HAP2SerializedOperationQueue alloc], "initWithName:", v10);
  v12 = -[HAP2AccessoryServerTransportCoAP initWithAccessoryInfo:discovery:operationQueue:]([HAP2AccessoryServerTransportCoAP alloc], "initWithAccessoryInfo:discovery:operationQueue:", v7, v6, v11);

  return v12;
}

@end

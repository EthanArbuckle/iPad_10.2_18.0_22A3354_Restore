@implementation HAP2AccessoryServerEncodingFactoryThread

- (id)createEncodingWithOperationQueue:(id)a3 accessoryServerMetadata:(id)a4 encodingFeatures:(unint64_t)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HAP2AccessoryServerEncodingThread *v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HAP2AccessoryServerEncodingThread initWithEncodingFeatures:accessoryDescription:]([HAP2AccessoryServerEncodingThread alloc], "initWithEncodingFeatures:accessoryDescription:", a5, v10);
  return v11;
}

@end

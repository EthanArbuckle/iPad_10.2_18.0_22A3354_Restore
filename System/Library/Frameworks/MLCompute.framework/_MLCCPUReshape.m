@implementation _MLCCPUReshape

- (_MLCCPUReshape)initWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _MLCCPUReshape *v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:", 27, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  v7 = (void *)objc_msgSend(v5, "copy");
  v10.receiver = self;
  v10.super_class = (Class)_MLCCPUReshape;
  v8 = -[_MLCCPULayer initWithDevice:deviceOps:](&v10, sel_initWithDevice_deviceOps_, v4, v7);

  return v8;
}

+ (id)layerWithDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", v4);

  return v5;
}

@end

@implementation _MLCCPUSelect

+ (id)layerWithDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", v4);

  return v5;
}

- (_MLCCPUSelect)initWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _MLCCPUSelect *v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:", 49, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  v7 = (void *)objc_msgSend(v5, "copy");
  v10.receiver = self;
  v10.super_class = (Class)_MLCCPUSelect;
  v8 = -[_MLCCPULayer initWithDevice:deviceOps:](&v10, sel_initWithDevice_deviceOps_, v4, v7);

  return v8;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  void *v6;
  void *v7;

  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "setLayer:", v7);

  return 1;
}

@end

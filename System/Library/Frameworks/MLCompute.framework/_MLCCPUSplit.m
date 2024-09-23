@implementation _MLCCPUSplit

- (_MLCCPUSplit)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _MLCCPUSplit *v9;
  objc_super v11;

  v5 = a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:", 46, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  v8 = (void *)objc_msgSend(v6, "copy");
  v11.receiver = self;
  v11.super_class = (Class)_MLCCPUSplit;
  v9 = -[_MLCCPULayer initWithDevice:deviceOps:](&v11, sel_initWithDevice_deviceOps_, v5, v8);

  return v9;
}

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:dimension:", v6, a4);

  return v7;
}

@end

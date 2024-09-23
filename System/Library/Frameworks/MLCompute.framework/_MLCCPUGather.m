@implementation _MLCCPUGather

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:dimension:", v6, a4);

  return v7;
}

- (_MLCCPUGather)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MLCCPUGather *v11;
  objc_super v13;

  v6 = a3;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:", 50, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setScatterGatherDimension:", a4);
    objc_msgSend(v9, "setScatterReduceType:", 1);
    objc_msgSend(v7, "addObject:", v9);
  }
  v10 = (void *)objc_msgSend(v7, "copy");
  v13.receiver = self;
  v13.super_class = (Class)_MLCCPUGather;
  v11 = -[_MLCCPULayer initWithDevice:deviceOps:](&v13, sel_initWithDevice_deviceOps_, v6, v10);

  return v11;
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

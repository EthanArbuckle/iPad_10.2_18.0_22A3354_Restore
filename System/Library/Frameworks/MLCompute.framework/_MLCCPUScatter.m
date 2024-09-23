@implementation _MLCCPUScatter

+ (id)layerWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:dimension:reduceType:", v8, a4, v5);

  return v9;
}

- (_MLCCPUScatter)initWithDevice:(id)a3 dimension:(unint64_t)a4 reduceType:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _MLCCPUScatter *v13;
  objc_super v15;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:", 51, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setScatterGatherDimension:", a4);
    objc_msgSend(v11, "setScatterReduceType:", v5);
    objc_msgSend(v9, "addObject:", v11);
  }
  v12 = (void *)objc_msgSend(v9, "copy");
  v15.receiver = self;
  v15.super_class = (Class)_MLCCPUScatter;
  v13 = -[_MLCCPULayer initWithDevice:deviceOps:](&v15, sel_initWithDevice_deviceOps_, v8, v12);

  return v13;
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

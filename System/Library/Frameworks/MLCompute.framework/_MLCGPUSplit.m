@implementation _MLCGPUSplit

- (_MLCGPUSplit)initWithDevice:(id)a3 dimension:(unint64_t)a4
{
  id v5;
  _MLCGPUSplit *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_MLCGPUSplit;
  v6 = -[_MLCGPUSplit init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "deviceList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(v5, "deviceList");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7218]), "initWithDevice:", v12);
        if (v13)
        {
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "setLayer:", v6);
            objc_msgSend(v15, "setSourceOfForwardNeededForGradient:", 0);
            objc_msgSend(v15, "setResultOfForwardNeededForGradient:", 0);
            objc_msgSend(v9, "addObject:", v15);
          }

        }
      }
    }
    v16 = (void *)objc_msgSend(v9, "copy");
    v18.receiver = v6;
    v18.super_class = (Class)_MLCGPUSplit;
    -[_MLCGPULayer setDeviceOps:](&v18, sel_setDeviceOps_, v16);

  }
  return v6;
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

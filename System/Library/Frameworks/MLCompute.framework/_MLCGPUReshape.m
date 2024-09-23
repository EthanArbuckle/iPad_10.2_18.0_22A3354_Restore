@implementation _MLCGPUReshape

- (_MLCGPUReshape)initWithDevice:(id)a3
{
  id v4;
  _MLCGPUReshape *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MLCGPUReshape;
  v5 = -[_MLCGPUReshape init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "deviceList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    for (i = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy"); v7; --v7)
    {
      +[MLCGPUDeviceOps deviceOps](MLCGPUDeviceOps, "deviceOps");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "setSourceOfForwardNeededForGradient:", 0);
        objc_msgSend(v10, "setResultOfForwardNeededForGradient:", 0);
        objc_msgSend(i, "addObject:", v10);
      }

    }
    v11 = (void *)objc_msgSend(i, "copy");
    v13.receiver = v5;
    v13.super_class = (Class)_MLCGPUReshape;
    -[_MLCGPULayer setDeviceOps:](&v13, sel_setDeviceOps_, v11);

  }
  return v5;
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

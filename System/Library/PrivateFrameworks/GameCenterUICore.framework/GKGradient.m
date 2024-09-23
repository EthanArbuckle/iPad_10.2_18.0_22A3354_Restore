@implementation GKGradient

- (GKGradient)initWithColors:(id)a3 atLocations:(const double *)a4
{
  id v6;
  GKGradient *v7;
  void *v8;
  const __CFArray *v9;
  CGColorSpace *DeviceRGB;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKGradient;
  v7 = -[GKGradient init](&v14, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__GKGradient_initWithColors_atLocations___block_invoke;
    v12[3] = &unk_24DC27980;
    v13 = v8;
    v9 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v7->_CGGradient = CGGradientCreateWithColors(DeviceRGB, v9, a4);
    CFRelease(DeviceRGB);

  }
  return v7;
}

uint64_t __41__GKGradient_initWithColors_atLocations___block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
}

+ (id)gradientWithColors:(id)a3 atLocations:(const double *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColors:atLocations:", v6, a4);

  return v7;
}

- (void)dealloc
{
  CGGradient *CGGradient;
  objc_super v4;

  CGGradient = self->_CGGradient;
  if (CGGradient)
    CFRelease(CGGradient);
  v4.receiver = self;
  v4.super_class = (Class)GKGradient;
  -[GKGradient dealloc](&v4, sel_dealloc);
}

- (CGGradient)CGGradient
{
  return self->_CGGradient;
}

@end

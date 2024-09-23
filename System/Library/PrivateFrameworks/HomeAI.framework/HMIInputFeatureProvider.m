@implementation HMIInputFeatureProvider

- (HMIInputFeatureProvider)initWithPixelBuffer:(__CVBuffer *)a3 inputName:(id)a4
{
  id v7;
  HMIInputFeatureProvider *v8;
  HMIInputFeatureProvider *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMIInputFeatureProvider;
  v8 = -[HMIInputFeatureProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_pixelBuffer = a3;
    objc_storeStrong((id *)&v8->_inputName, a4);
    CVPixelBufferRetain(a3);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(-[HMIInputFeatureProvider pixelBuffer](self, "pixelBuffer"));
  v3.receiver = self;
  v3.super_class = (Class)HMIInputFeatureProvider;
  -[HMIInputFeatureProvider dealloc](&v3, sel_dealloc);
}

- (NSSet)featureNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  -[HMIInputFeatureProvider inputName](self, "inputName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[HMIInputFeatureProvider inputName](self, "inputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithPixelBuffer:", -[HMIInputFeatureProvider pixelBuffer](self, "pixelBuffer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (NSString)inputName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputName, 0);
}

@end

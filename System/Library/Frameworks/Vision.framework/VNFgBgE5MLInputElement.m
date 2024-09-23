@implementation VNFgBgE5MLInputElement

- (VNFgBgE5MLInputElement)initWithValueRef:(__IOSurface *)a3 name:(id)a4
{
  id v6;
  VNFgBgE5MLInputElement *v7;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNFgBgE5MLInputElement;
  v7 = -[VNFgBgE5MLInputElement init](&v11, sel_init);
  if (v7)
  {
    v7->_valueRef = (__IOSurface *)CFRetain(a3);
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

  }
  return v7;
}

- (void)dealloc
{
  __IOSurface *valueRef;
  objc_super v4;

  valueRef = self->_valueRef;
  if (valueRef)
  {
    CFRelease(valueRef);
    self->_valueRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNFgBgE5MLInputElement;
  -[VNFgBgE5MLInputElement dealloc](&v4, sel_dealloc);
}

- (__IOSurface)valueRef
{
  return self->_valueRef;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end

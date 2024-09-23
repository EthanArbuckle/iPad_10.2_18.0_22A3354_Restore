@implementation AVOutputDeviceIcon

- (AVOutputDeviceIcon)initWithDict:(id)a3
{
  AVOutputDeviceIcon *v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  void *v9;
  float v10;
  void *v11;
  NSData *v12;
  void *v13;
  char v14;
  AVOutputDeviceIcon *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVOutputDeviceIcon;
  v4 = -[AVOutputDeviceIcon init](&v17, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("widthPixels"));
    objc_opt_class();
    v6 = 0.0;
    v7 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "floatValue");
      v7 = v8;
    }
    v9 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("heightPixels"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      v6 = v10;
    }
    v4->_pixelSize = (NSValue *)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", v7, v6);
    v11 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("imageData"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v4->_imageData = v12;
    v13 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("prerendered"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = objc_msgSend(v13, "BOOLValue");
    else
      v14 = 1;
    v4->_prerendered = v14;
    v15 = v4;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceIcon;
  -[AVOutputDeviceIcon dealloc](&v3, sel_dealloc);
}

- (NSValue)pixelSize
{
  return self->_pixelSize;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (BOOL)isPrerendered
{
  return self->_prerendered;
}

@end

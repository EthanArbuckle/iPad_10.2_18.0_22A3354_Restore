@implementation AVExternalDeviceIcon

- (AVExternalDeviceIcon)initWithDictionary:(id)a3
{
  AVExternalDeviceIcon *v4;
  AVExternalDeviceIconInternal *v5;
  void *v6;
  char isKindOfClass;
  double v8;
  double v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  NSData *v14;
  void *v15;
  char v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVExternalDeviceIcon;
  v4 = -[AVExternalDeviceIcon init](&v18, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVExternalDeviceIconInternal);
    v4->_externalDeviceIcon = v5;
    if (v5)
    {
      v6 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("widthPixels"));
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v8 = 0.0;
      v9 = 0.0;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "floatValue", 0.0);
        v9 = v10;
      }
      v4->_externalDeviceIcon->_size.width = v9;
      v11 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("heightPixels"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "floatValue");
        v8 = v12;
      }
      v4->_externalDeviceIcon->_size.height = v8;
      v13 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("imageData"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v4->_externalDeviceIcon->_data = v14;
      v15 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("prerendered"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = objc_msgSend(v15, "BOOLValue");
      else
        v16 = 1;
      v4->_externalDeviceIcon->_prerendered = v16;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  AVExternalDeviceIconInternal *externalDeviceIcon;
  objc_super v4;

  externalDeviceIcon = self->_externalDeviceIcon;
  if (externalDeviceIcon)
  {

    CFRelease(self->_externalDeviceIcon);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVExternalDeviceIcon;
  -[AVExternalDeviceIcon dealloc](&v4, sel_dealloc);
}

- (CGSize)pixelSize
{
  AVExternalDeviceIconInternal *externalDeviceIcon;
  double width;
  double height;
  CGSize result;

  externalDeviceIcon = self->_externalDeviceIcon;
  width = externalDeviceIcon->_size.width;
  height = externalDeviceIcon->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSData)imageData
{
  return self->_externalDeviceIcon->_data;
}

- (BOOL)isPrerendered
{
  return self->_externalDeviceIcon->_prerendered;
}

@end

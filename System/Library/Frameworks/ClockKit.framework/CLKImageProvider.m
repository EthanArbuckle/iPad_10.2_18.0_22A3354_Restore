@implementation CLKImageProvider

- (id)initPrivate
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKImageProvider;
  result = -[CLKImageProvider init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 10) = 1;
  return result;
}

+ (CLKImageProvider)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKImageProvider;
  return (CLKImageProvider *)objc_msgSendSuper2(&v3, "new");
}

- (CLKImageProvider)initWithOnePieceImage:(UIImage *)onePieceImage
{
  return -[CLKImageProvider initWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:](self, "initWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", onePieceImage, 0, 0);
}

- (CLKImageProvider)initWithOnePieceImage:(UIImage *)onePieceImage twoPieceImageBackground:(UIImage *)twoPieceImageBackground twoPieceImageForeground:(UIImage *)twoPieceImageForeground
{
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  CLKImageProvider *v11;
  CLKImageProvider *v12;

  v8 = onePieceImage;
  v9 = twoPieceImageBackground;
  v10 = twoPieceImageForeground;
  v11 = -[CLKImageProvider initPrivate](self, "initPrivate");
  v12 = v11;
  if (v11)
  {
    -[CLKImageProvider setOnePieceImage:](v11, "setOnePieceImage:", v8);
    -[CLKImageProvider setTwoPieceImageBackground:](v12, "setTwoPieceImageBackground:", v9);
    -[CLKImageProvider setTwoPieceImageForeground:](v12, "setTwoPieceImageForeground:", v10);
  }

  return v12;
}

- (CLKImageProvider)initWithForegroundAccentImage:(id)a3
{
  id v4;
  CLKImageProvider *v5;
  CLKImageProvider *v6;

  v4 = a3;
  v5 = -[CLKImageProvider initPrivate](self, "initPrivate");
  v6 = v5;
  if (v5)
    -[CLKImageProvider setForegroundAccentImage:](v5, "setForegroundAccentImage:", v4);

  return v6;
}

+ (CLKImageProvider)imageProviderWithOnePieceImage:(UIImage *)onePieceImage
{
  return (CLKImageProvider *)objc_msgSend(a1, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", onePieceImage, 0, 0);
}

+ (CLKImageProvider)imageProviderWithOnePieceImage:(UIImage *)onePieceImage twoPieceImageBackground:(UIImage *)twoPieceImageBackground twoPieceImageForeground:(UIImage *)twoPieceImageForeground
{
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  void *v11;

  v8 = twoPieceImageForeground;
  v9 = twoPieceImageBackground;
  v10 = onePieceImage;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v10, v9, v8);

  return (CLKImageProvider *)v11;
}

+ (CLKImageProvider)imageProviderWithImageViewCreationHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initPrivate");
  objc_msgSend(v5, "setImageViewCreationHandler:", v4);

  return (CLKImageProvider *)v5;
}

+ (CLKImageProvider)imageProviderWithLayerMaskImage:(id)a3
{
  void *v3;

  objc_msgSend(a1, "imageProviderWithOnePieceImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUseOnePieceAsLayerMask:", 1);
  return (CLKImageProvider *)v3;
}

- (BOOL)validate
{
  UIImage *twoPieceImageForeground;
  NSObject *v5;

  if (self->_imageViewCreationHandler)
    return 1;
  if (!self->_onePieceImage)
  {
    CLKLoggingObjectForDomain(10);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CLKImageProvider validate].cold.1((uint64_t)self, v5);
    goto LABEL_13;
  }
  twoPieceImageForeground = self->_twoPieceImageForeground;
  if (!self->_twoPieceImageBackground)
  {
    if (twoPieceImageForeground)
    {
      CLKLoggingObjectForDomain(10);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CLKImageProvider validate].cold.2();
      goto LABEL_13;
    }
    return 1;
  }
  if (twoPieceImageForeground)
    return 1;
  CLKLoggingObjectForDomain(10);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[CLKImageProvider validate].cold.3();
LABEL_13:

  return 0;
}

- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 maskToCircle:(BOOL)a5
{
  if (!self->_finalized)
  {
    self->_maxSize = a4;
    -[CLKImageProvider _resizeImagesIfNecessaryWithMaxSDKSize:andMaskToCircle:](self, "_resizeImagesIfNecessaryWithMaxSDKSize:andMaskToCircle:", a5, a3.width, a3.height);
    self->_finalized = 1;
  }
}

- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5
{
  if (!self->_finalized)
  {
    self->_maxSize = a4;
    -[CLKImageProvider _resizeImagesIfNecessaryWithMaxSDKSize:andCornerRadius:](self, "_resizeImagesIfNecessaryWithMaxSDKSize:andCornerRadius:", a3.width, a3.height, a5);
    self->_finalized = 1;
  }
}

- (void)setOnePieceImage:(UIImage *)onePieceImage
{
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;

  v6 = onePieceImage;
  if ((-[UIImage isEqual:](v6, "isEqual:", self->_onePieceImage) & 1) == 0)
  {
    -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](v6, "_imageThatSuppressesAccessibilityHairlineThickening");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_onePieceImage;
    self->_onePieceImage = v4;

  }
}

- (void)setTwoPieceImageForeground:(UIImage *)twoPieceImageForeground
{
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;

  v6 = twoPieceImageForeground;
  if ((-[UIImage isEqual:](v6, "isEqual:", self->_twoPieceImageForeground) & 1) == 0)
  {
    -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](v6, "_imageThatSuppressesAccessibilityHairlineThickening");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_twoPieceImageForeground;
    self->_twoPieceImageForeground = v4;

  }
}

- (void)setTwoPieceImageBackground:(UIImage *)twoPieceImageBackground
{
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;

  v6 = twoPieceImageBackground;
  if ((-[UIImage isEqual:](v6, "isEqual:", self->_twoPieceImageBackground) & 1) == 0)
  {
    -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](v6, "_imageThatSuppressesAccessibilityHairlineThickening");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_twoPieceImageBackground;
    self->_twoPieceImageBackground = v4;

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIImage *onePieceImage;
  id v5;

  onePieceImage = self->_onePieceImage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", onePieceImage, CFSTR("OnePieceImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_twoPieceImageBackground, CFSTR("TwoPieceImageBackground"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_twoPieceImageForeground, CFSTR("TwoPieceImageForeground"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("TintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityLabel, CFSTR("AccessibilityLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_foregroundAccentImage, CFSTR("ForegroundAccentImageKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_foregroundAccentImageTinted, CFSTR("ForegroundAccentImageTintedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_finalized, CFSTR("Finalized"));
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("MaxSize"), self->_maxSize.width, self->_maxSize.height);
  objc_msgSend(v5, "encodeBool:forKey:", self->_useOnePieceAsLayerMask, CFSTR("UseOnePieceAsLayerMask"));

}

- (CLKImageProvider)initWithCoder:(id)a3
{
  id v4;
  CLKImageProvider *v5;
  void *v6;
  uint64_t v7;
  UIImage *onePieceImage;
  void *v9;
  uint64_t v10;
  UIImage *twoPieceImageBackground;
  void *v12;
  uint64_t v13;
  UIImage *twoPieceImageForeground;
  uint64_t v15;
  UIColor *tintColor;
  uint64_t v17;
  NSString *accessibilityLabel;
  uint64_t v19;
  UIImage *foregroundAccentImage;
  CGFloat v21;
  CGFloat v22;

  v4 = a3;
  v5 = -[CLKImageProvider initPrivate](self, "initPrivate");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OnePieceImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
    v7 = objc_claimAutoreleasedReturnValue();
    onePieceImage = v5->_onePieceImage;
    v5->_onePieceImage = (UIImage *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TwoPieceImageBackground"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_imageThatSuppressesAccessibilityHairlineThickening");
    v10 = objc_claimAutoreleasedReturnValue();
    twoPieceImageBackground = v5->_twoPieceImageBackground;
    v5->_twoPieceImageBackground = (UIImage *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TwoPieceImageForeground"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_imageThatSuppressesAccessibilityHairlineThickening");
    v13 = objc_claimAutoreleasedReturnValue();
    twoPieceImageForeground = v5->_twoPieceImageForeground;
    v5->_twoPieceImageForeground = (UIImage *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TintColor"));
    v15 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccessibilityLabel"));
    v17 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ForegroundAccentImageKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    foregroundAccentImage = v5->_foregroundAccentImage;
    v5->_foregroundAccentImage = (UIImage *)v19;

    v5->_foregroundAccentImageTinted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ForegroundAccentImageTintedKey"));
    v5->_finalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Finalized"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MaxSize")))
    {
      objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("MaxSize"));
      v5->_maxSize.width = v21;
      v5->_maxSize.height = v22;
    }
    v5->_useOnePieceAsLayerMask = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UseOnePieceAsLayerMask"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UIImage *onePieceImage;
  void *v6;
  UIImage *twoPieceImageBackground;
  void *v8;
  UIImage *twoPieceImageForeground;
  void *v10;
  UIColor *tintColor;
  void *v12;
  UIImage *foregroundAccentImage;
  void *v14;
  int foregroundAccentImageTinted;
  NSString *accessibilityLabel;
  void *v17;
  int useOnePieceAsLayerMask;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    onePieceImage = self->_onePieceImage;
    objc_msgSend(v4, "onePieceImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (CLKEqualObjects(onePieceImage, v6))
    {
      twoPieceImageBackground = self->_twoPieceImageBackground;
      objc_msgSend(v4, "twoPieceImageBackground");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (CLKEqualObjects(twoPieceImageBackground, v8))
      {
        twoPieceImageForeground = self->_twoPieceImageForeground;
        objc_msgSend(v4, "twoPieceImageForeground");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (CLKEqualObjects(twoPieceImageForeground, v10))
        {
          tintColor = self->_tintColor;
          objc_msgSend(v4, "tintColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (CLKEqualObjects(tintColor, v12))
          {
            foregroundAccentImage = self->_foregroundAccentImage;
            objc_msgSend(v4, "foregroundAccentImage");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (CLKEqualObjects(foregroundAccentImage, v14)
              && (foregroundAccentImageTinted = self->_foregroundAccentImageTinted,
                  foregroundAccentImageTinted == objc_msgSend(v4, "isForegroundAccentImageTinted")))
            {
              accessibilityLabel = self->_accessibilityLabel;
              objc_msgSend(v4, "accessibilityLabel");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (CLKEqualObjects(accessibilityLabel, v17))
              {
                useOnePieceAsLayerMask = self->_useOnePieceAsLayerMask;
                v19 = useOnePieceAsLayerMask == objc_msgSend(v4, "useOnePieceAsLayerMask");
              }
              else
              {
                v19 = 0;
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  unint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;

  LOBYTE(v2) = self->_foregroundAccentImageTinted;
  v4 = (double)(unint64_t)-[UIImage hash](self->_foregroundAccentImage, "hash") * 10000000.0
     + (double)v2 * 100000000.0;
  v5 = v4 + (double)(unint64_t)-[UIImage hash](self->_onePieceImage, "hash") * 1000000.0;
  v6 = v5 + (double)(unint64_t)-[UIImage hash](self->_twoPieceImageBackground, "hash") * 100000.0;
  v7 = v6 + (double)(unint64_t)-[UIImage hash](self->_twoPieceImageForeground, "hash") * 10000.0;
  v8 = v7 + (double)(unint64_t)-[UIColor hash](self->_tintColor, "hash") * 1000.0;
  v9 = -[NSString hash](self->_accessibilityLabel, "hash");
  v10 = 0x4059000000000000;
  LOBYTE(v10) = self->_useOnePieceAsLayerMask;
  return (unint64_t)(v8 + (double)v9 * 100.0 + (double)v10 * 10.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  if (self->_finalized)
    return self;
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setOnePieceImage:", self->_onePieceImage);
  objc_msgSend(v4, "setTwoPieceImageBackground:", self->_twoPieceImageBackground);
  objc_msgSend(v4, "setTwoPieceImageForeground:", self->_twoPieceImageForeground);
  objc_msgSend(v4, "setTintColor:", self->_tintColor);
  objc_msgSend(v4, "setAccessibilityLabel:", self->_accessibilityLabel);
  objc_msgSend(v4, "setImageViewCreationHandler:", self->_imageViewCreationHandler);
  objc_msgSend(v4, "setForegroundAccentImage:", self->_foregroundAccentImage);
  objc_msgSend(v4, "setForegroundAccentImageTinted:", self->_foregroundAccentImageTinted);
  objc_msgSend(v4, "setUseOnePieceAsLayerMask:", self->_useOnePieceAsLayerMask);
  return v4;
}

+ (CLKImageProvider)imageProviderWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  Class v10;
  objc_class *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (imageProviderWithJSONObjectRepresentation_bundle__onceToken != -1)
    dispatch_once(&imageProviderWithJSONObjectRepresentation_bundle__onceToken, &__block_literal_global_3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v5);
  v7 = objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("class"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  v10 = NSClassFromString(v8);
  if (!v10
    || (v11 = v10,
        (objc_msgSend((id)imageProviderWithJSONObjectRepresentation_bundle__allowedClasses, "containsObject:", v10) & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("invalid CLKFullColorImageProvider subclass: %@"), v9);
LABEL_9:
    v11 = (objc_class *)v7;
  }
  v12 = (void *)objc_msgSend([v11 alloc], "initWithJSONObjectRepresentation:bundle:", v5, v6);

  return (CLKImageProvider *)v12;
}

void __69__CLKImageProvider_imageProviderWithJSONObjectRepresentation_bundle___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)imageProviderWithJSONObjectRepresentation_bundle__allowedClasses;
  imageProviderWithJSONObjectRepresentation_bundle__allowedClasses = v2;

}

- (CLKImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  CLKImageProvider *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIImage *onePieceImage;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIImage *twoPieceImageBackground;
  void *v19;
  uint64_t v20;
  UIImage *twoPieceImageForeground;
  void *v22;
  uint64_t v23;
  UIColor *tintColor;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = -[CLKImageProvider initPrivate](self, "initPrivate");
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v6);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onePieceImage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithJSONObjectRepresentation:bundle:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_imageThatSuppressesAccessibilityHairlineThickening");
    v11 = objc_claimAutoreleasedReturnValue();
    onePieceImage = v8->_onePieceImage;
    v8->_onePieceImage = (UIImage *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("twoPieceImageBackground"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("twoPieceImageForeground"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13 && v14)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithJSONObjectRepresentation:bundle:", v13, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_imageThatSuppressesAccessibilityHairlineThickening");
      v17 = objc_claimAutoreleasedReturnValue();
      twoPieceImageBackground = v8->_twoPieceImageBackground;
      v8->_twoPieceImageBackground = (UIImage *)v17;

      objc_msgSend(MEMORY[0x24BEBD640], "imageWithJSONObjectRepresentation:bundle:", v15, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_imageThatSuppressesAccessibilityHairlineThickening");
      v20 = objc_claimAutoreleasedReturnValue();
      twoPieceImageForeground = v8->_twoPieceImageForeground;
      v8->_twoPieceImageForeground = (UIImage *)v20;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tintColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithJSONObjectRepresentation:", v22);
      tintColor = v8->_tintColor;
      v8->_tintColor = (UIColor *)v23;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("accessibilityLabel"), v25);
      objc_storeStrong((id *)&v8->_accessibilityLabel, v25);
    }

  }
  return v8;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIImage *twoPieceImageBackground;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[UIImage JSONObjectRepresentationWritingResourcesToBundlePath:](self->_onePieceImage, "JSONObjectRepresentationWritingResourcesToBundlePath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("onePieceImage"));

  twoPieceImageBackground = self->_twoPieceImageBackground;
  if (twoPieceImageBackground && self->_twoPieceImageForeground)
  {
    -[UIImage JSONObjectRepresentationWritingResourcesToBundlePath:](twoPieceImageBackground, "JSONObjectRepresentationWritingResourcesToBundlePath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("twoPieceImageBackground"));

    -[UIImage JSONObjectRepresentationWritingResourcesToBundlePath:](self->_twoPieceImageForeground, "JSONObjectRepresentationWritingResourcesToBundlePath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("twoPieceImageForeground"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_accessibilityLabel, CFSTR("accessibilityLabel"));
  -[UIColor JSONObjectRepresentation](self->_tintColor, "JSONObjectRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("tintColor"));

  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("class"));

  return v5;
}

- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 andMaskToCircle:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  _BOOL4 v22;
  int v23;
  double v24;
  void *v25;
  int v26;
  double v27;
  UIImage *v28;
  UIImage *twoPieceImageBackground;
  UIImage *v30;
  UIImage *twoPieceImageForeground;
  int v32;
  UIImage *v33;
  UIImage *onePieceImage;
  id v35;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[UIImage size](self->_onePieceImage, "size");
  v9 = v8;
  v11 = v10;
  -[UIImage size](self->_twoPieceImageBackground, "size");
  v13 = v12;
  v15 = v14;
  -[UIImage size](self->_twoPieceImageForeground, "size");
  v18 = 1.0;
  if (v13 > width)
    v18 = fmin(width / v13, 1.0);
  if (v16 > width)
  {
    v19 = width / v16;
    if (v18 > v19)
      v18 = v19;
  }
  if (v15 > height && v18 > height / v15)
    v18 = height / v15;
  if (v17 > height && v18 > height / v17)
    v18 = height / v17;
  v20 = v9 <= width && v11 <= height;
  v21 = 1.0;
  if (!v20)
  {
    if (width / v9 <= height / v11)
      v21 = width / v9;
    else
      v21 = height / v11;
  }
  v22 = CLKSizeEqualsSize(self->_maxSize.width, self->_maxSize.height, width, height);
  v23 = !v22;
  if (v18 < 1.0 || v21 < 1.0 || v23)
  {
    v24 = 1.0;
    if (!v22)
    {
      if (self->_maxSize.width / width <= self->_maxSize.height / height)
        v24 = self->_maxSize.width / width;
      else
        v24 = self->_maxSize.height / height;
    }
    +[CLKTreatedImageCache sharedInstance](CLKTreatedImageCache, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 < 1.0)
      v26 = 1;
    else
      v26 = v23;
    v35 = v25;
    if (v26 == 1)
    {
      v27 = fmin(v18, 1.0);
      objc_msgSend(v25, "imageForRawImage:scale:sdkDeviceScale:maskMode:", self->_twoPieceImageBackground, v4, v27, v24);
      v28 = (UIImage *)objc_claimAutoreleasedReturnValue();
      twoPieceImageBackground = self->_twoPieceImageBackground;
      self->_twoPieceImageBackground = v28;

      objc_msgSend(v35, "imageForRawImage:scale:sdkDeviceScale:maskMode:", self->_twoPieceImageForeground, v4, v27, v24);
      v30 = (UIImage *)objc_claimAutoreleasedReturnValue();
      twoPieceImageForeground = self->_twoPieceImageForeground;
      self->_twoPieceImageForeground = v30;

      v25 = v35;
    }
    if (v21 < 1.0)
      v32 = 1;
    else
      v32 = v23;
    if (v32 == 1)
    {
      objc_msgSend(v35, "imageForRawImage:scale:sdkDeviceScale:maskMode:", self->_onePieceImage, v4, fmin(v21, 1.0), v24);
      v33 = (UIImage *)objc_claimAutoreleasedReturnValue();
      onePieceImage = self->_onePieceImage;
      self->_onePieceImage = v33;

      v25 = v35;
    }

  }
}

- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 andCornerRadius:(double)a4
{
  double height;
  double width;
  UIImage *v8;
  UIImage *onePieceImage;
  UIImage *v10;
  UIImage *twoPieceImageBackground;
  UIImage *v12;
  UIImage *twoPieceImageForeground;
  id v14;

  height = a3.height;
  width = a3.width;
  +[CLKTreatedImageCache sharedInstance](CLKTreatedImageCache, "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_onePieceImage, width, height, self->_maxSize.width, self->_maxSize.height, a4);
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  onePieceImage = self->_onePieceImage;
  self->_onePieceImage = v8;

  objc_msgSend(v14, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_twoPieceImageBackground, width, height, self->_maxSize.width, self->_maxSize.height, a4);
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  twoPieceImageBackground = self->_twoPieceImageBackground;
  self->_twoPieceImageBackground = v10;

  objc_msgSend(v14, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_twoPieceImageForeground, width, height, self->_maxSize.width, self->_maxSize.height, a4);
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  twoPieceImageForeground = self->_twoPieceImageForeground;
  self->_twoPieceImageForeground = v12;

}

- (UIImage)onePieceImage
{
  return self->_onePieceImage;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_storeStrong((id *)&self->_tintColor, tintColor);
}

- (UIImage)twoPieceImageBackground
{
  return self->_twoPieceImageBackground;
}

- (UIImage)twoPieceImageForeground
{
  return self->_twoPieceImageForeground;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  objc_storeStrong((id *)&self->_accessibilityLabel, accessibilityLabel);
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)imageViewCreationHandler
{
  return self->_imageViewCreationHandler;
}

- (void)setImageViewCreationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)useOnePieceAsLayerMask
{
  return self->_useOnePieceAsLayerMask;
}

- (void)setUseOnePieceAsLayerMask:(BOOL)a3
{
  self->_useOnePieceAsLayerMask = a3;
}

- (UIImage)foregroundAccentImage
{
  return self->_foregroundAccentImage;
}

- (void)setForegroundAccentImage:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundAccentImage, a3);
}

- (UIColor)foregroundAccentImageColor
{
  return self->_foregroundAccentImageColor;
}

- (void)setForegroundAccentImageColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundAccentImageColor, a3);
}

- (BOOL)isForegroundAccentImageTinted
{
  return self->_foregroundAccentImageTinted;
}

- (void)setForegroundAccentImageTinted:(BOOL)a3
{
  self->_foregroundAccentImageTinted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundAccentImageColor, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImage, 0);
  objc_storeStrong(&self->_imageViewCreationHandler, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_twoPieceImageForeground, 0);
  objc_storeStrong((id *)&self->_twoPieceImageBackground, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_onePieceImage, 0);
}

- (void)validate
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_1_2(v0);
  OUTLINED_FUNCTION_0_3(&dword_2114F4000, v2, v3, "Property '%@' is not set on %@. Two-piece images require both 'twoPieceImageBackground' and 'twoPieceImageForeground' to be set.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end

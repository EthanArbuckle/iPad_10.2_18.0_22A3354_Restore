@implementation CLKFullColorImageProvider

- (id)initPrivate
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKFullColorImageProvider;
  result = -[CLKFullColorImageProvider init](&v3, sel_init);
  if (result)
  {
    *((_QWORD *)result + 8) = 0;
    *((_BYTE *)result + 16) = 1;
  }
  return result;
}

+ (CLKFullColorImageProvider)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKFullColorImageProvider;
  return (CLKFullColorImageProvider *)objc_msgSendSuper2(&v3, "new");
}

- (CLKFullColorImageProvider)initWithFullColorImage:(UIImage *)image
{
  return -[CLKFullColorImageProvider initWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:](self, "initWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", image, 0, 1);
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(UIImage *)image
{
  return (CLKFullColorImageProvider *)objc_msgSend(a1, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", image, 0, 1);
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4
{
  return -[CLKFullColorImageProvider initWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:](self, "initWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", a3, a4, 1);
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4
{
  return (CLKFullColorImageProvider *)objc_msgSend(a1, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", a3, a4, 1);
}

- (CLKFullColorImageProvider)initWithFullColorImage:(UIImage *)image tintedImageProvider:(CLKImageProvider *)tintedImageProvider
{
  return -[CLKFullColorImageProvider initWithFullColorImage:tintedImageProvider:applyScalingAndCircularMasking:](self, "initWithFullColorImage:tintedImageProvider:applyScalingAndCircularMasking:", image, tintedImageProvider, 1);
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(UIImage *)image tintedImageProvider:(CLKImageProvider *)tintedImageProvider
{
  return (CLKFullColorImageProvider *)objc_msgSend(a1, "providerWithFullColorImage:tintedImageProvider:applyScalingAndCircularMasking:", image, tintedImageProvider, 1);
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 applyScalingAndCircularMasking:(BOOL)a4
{
  return -[CLKFullColorImageProvider initWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:](self, "initWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", a3, 0, a4);
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 applyScalingAndCircularMasking:(BOOL)a4
{
  return (CLKFullColorImageProvider *)objc_msgSend(a1, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", a3, 0, a4);
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  id v9;
  id *v10;
  CLKFullColorImageProvider *v11;

  v9 = a3;
  v10 = -[CLKFullColorImageProvider initPrivate](self, "initPrivate");
  v11 = (CLKFullColorImageProvider *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 3, a3);
    v11->_applyScalingAndCircularMasking = a5;
    v11->_monochromeFilterType = a4;
  }

  return v11;
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 monochromeFilterType:(int64_t)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v8, a4, v5);

  return (CLKFullColorImageProvider *)v9;
}

- (CLKFullColorImageProvider)initWithFullColorImage:(id)a3 tintedImageProvider:(id)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  id v9;
  id v10;
  id *v11;
  CLKFullColorImageProvider *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[CLKFullColorImageProvider initPrivate](self, "initPrivate");
  v12 = (CLKFullColorImageProvider *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 3, a3);
    v12->_applyScalingAndCircularMasking = a5;
    objc_storeStrong((id *)&v12->_tintedImageProvider, a4);
  }

  return v12;
}

+ (CLKFullColorImageProvider)providerWithFullColorImage:(id)a3 tintedImageProvider:(id)a4 applyScalingAndCircularMasking:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFullColorImage:tintedImageProvider:applyScalingAndCircularMasking:", v9, v8, v5);

  return (CLKFullColorImageProvider *)v10;
}

+ (CLKFullColorImageProvider)fullColorImageProviderWithImageViewClass:(Class)a3
{
  id *v4;

  v4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initPrivate");
  objc_storeStrong(v4 + 6, a3);
  return (CLKFullColorImageProvider *)v4;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  NSString *v5;
  id v6;

  objc_storeStrong((id *)&self->_accessibilityLabel, accessibilityLabel);
  v5 = accessibilityLabel;
  -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

- (void)setTintedImageProvider:(CLKImageProvider *)tintedImageProvider
{
  void *v5;
  CLKImageProvider *v6;

  v6 = tintedImageProvider;
  objc_storeStrong((id *)&self->_tintedImageProvider, tintedImageProvider);
  -[CLKImageProvider accessibilityLabel](v6, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[CLKImageProvider setAccessibilityLabel:](v6, "setAccessibilityLabel:", self->_accessibilityLabel);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *tintColor;
  id v5;

  tintColor = self->_tintColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tintColor, CFSTR("_tintColorKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("_ImageKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_applyScalingAndCircularMasking, CFSTR("_ApplyScalingAndCircularMaskingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityLabel, CFSTR("AccessibilityLabel"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_finalized, CFSTR("Finalized"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintedImageProvider, CFSTR("TintedImageProvider"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_monochromeFilterType, CFSTR("MonochromeFilterType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_prefersFilterOverTransition, CFSTR("PrefersFilterOverTransitionKey"));

}

- (CLKFullColorImageProvider)initWithCoder:(id)a3
{
  id v4;
  CLKFullColorImageProvider *v5;
  uint64_t v6;
  UIColor *tintColor;
  uint64_t v8;
  UIImage *image;
  uint64_t v10;
  NSString *accessibilityLabel;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *metadata;
  uint64_t v21;
  CLKImageProvider *tintedImageProvider;

  v4 = a3;
  v5 = -[CLKFullColorImageProvider initPrivate](self, "initPrivate");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tintColorKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ImageKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v8;

    v5->_applyScalingAndCircularMasking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ApplyScalingAndCircularMaskingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccessibilityLabel"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v10;

    v5->_finalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Finalized"));
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("Metadata"));
    v19 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TintedImageProvider"));
    v21 = objc_claimAutoreleasedReturnValue();
    tintedImageProvider = v5->_tintedImageProvider;
    v5->_tintedImageProvider = (CLKImageProvider *)v21;

    v5->_monochromeFilterType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MonochromeFilterType"));
    v5->_prefersFilterOverTransition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PrefersFilterOverTransitionKey"));

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  UIColor *tintColor;
  void *v6;
  NSString *accessibilityLabel;
  void *v8;
  UIImage *image;
  void *v10;
  NSDictionary *metadata;
  void *v12;
  CLKImageProvider *tintedImageProvider;
  void *v14;
  Class ImageViewClass;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_applyScalingAndCircularMasking == v4[16])
  {
    tintColor = self->_tintColor;
    objc_msgSend(v4, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (CLKEqualObjects(tintColor, v6))
    {
      accessibilityLabel = self->_accessibilityLabel;
      objc_msgSend(v4, "accessibilityLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (CLKEqualObjects(accessibilityLabel, v8))
      {
        image = self->_image;
        objc_msgSend(v4, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (CLKEqualObjects(image, v10))
        {
          metadata = self->_metadata;
          objc_msgSend(v4, "metadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (CLKEqualObjects(metadata, v12))
          {
            tintedImageProvider = self->_tintedImageProvider;
            objc_msgSend(v4, "tintedImageProvider");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (CLKEqualObjects(tintedImageProvider, v14)
              && self->_monochromeFilterType == *((_QWORD *)v4 + 8)
              && self->_prefersFilterOverTransition == v4[19])
            {
              ImageViewClass = self->_ImageViewClass;
              v16 = ImageViewClass == (Class)objc_msgSend(v4, "ImageViewClass");
            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_prefersFilterOverTransition);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_monochromeFilterType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "hash") * 1000000000.0 + v4 * 1.0e11;
  v7 = v6 + (double)-[CLKImageProvider hash](self->_tintedImageProvider, "hash") * 100000000.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_applyScalingAndCircularMasking);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + (double)(unint64_t)objc_msgSend(v8, "hash") * 10000000.0;
  v10 = v9 + (double)(unint64_t)-[UIImage hash](self->_image, "hash") * 1000000.0;
  v11 = v10 + (double)(unint64_t)-[UIColor hash](self->_tintColor, "hash") * 100000.0;
  v12 = v11 + (double)-[NSString hash](self->_accessibilityLabel, "hash") * 10000.0;
  v13 = v12 + (double)(unint64_t)-[NSDictionary hash](self->_metadata, "hash") * 1000.0;
  v14 = (unint64_t)(v13 + (double)(unint64_t)-[objc_class hash](self->_ImageViewClass, "hash") * 100.0);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (self->_finalized)
    return self;
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend((id)v4, "setImage:", self->_image);
  objc_storeStrong((id *)(v4 + 8), self->_tintColor);
  *(_BYTE *)(v4 + 16) = self->_applyScalingAndCircularMasking;
  objc_storeStrong((id *)(v4 + 40), self->_accessibilityLabel);
  objc_storeStrong((id *)(v4 + 48), self->_ImageViewClass);
  v5 = -[NSDictionary copy](self->_metadata, "copy");
  v6 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v5;

  v7 = -[CLKImageProvider copy](self->_tintedImageProvider, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  *(_QWORD *)(v4 + 64) = self->_monochromeFilterType;
  *(_BYTE *)(v4 + 19) = self->_prefersFilterOverTransition;
  return (id)v4;
}

+ (CLKFullColorImageProvider)fullColorImageProviderWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
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
  if (fullColorImageProviderWithJSONObjectRepresentation_bundle__onceToken != -1)
    dispatch_once(&fullColorImageProviderWithJSONObjectRepresentation_bundle__onceToken, &__block_literal_global_8);
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
        (objc_msgSend((id)fullColorImageProviderWithJSONObjectRepresentation_bundle__allowedClasses, "containsObject:", v10) & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("invalid CLKFullColorImageProvider subclass: %@"), v9);
LABEL_9:
    v11 = (objc_class *)v7;
  }
  v12 = (void *)objc_msgSend([v11 alloc], "initWithJSONObjectRepresentation:bundle:", v5, v6);

  return (CLKFullColorImageProvider *)v12;
}

void __87__CLKFullColorImageProvider_fullColorImageProviderWithJSONObjectRepresentation_bundle___block_invoke()
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
  v3 = (void *)fullColorImageProviderWithJSONObjectRepresentation_bundle__allowedClasses;
  fullColorImageProviderWithJSONObjectRepresentation_bundle__allowedClasses = v2;

}

- (CLKFullColorImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  CLKFullColorImageProvider *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIImage *image;
  void *v13;
  uint64_t v14;
  UIColor *tintColor;
  void *v16;
  void *v17;
  CLKImageProvider *v18;
  CLKImageProvider *tintedImageProvider;
  void *v20;
  void *v21;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = -[CLKFullColorImageProvider initPrivate](self, "initPrivate");
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v6);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("applyScalingAndCircularMask"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8->_applyScalingAndCircularMasking = objc_msgSend(v9, "BOOLValue");
    else
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("applyScalingAndCircularMask"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("applyScalingAndCircularMask"), v9);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullColorImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithJSONObjectRepresentation:bundle:", v10, v7);
      v11 = objc_claimAutoreleasedReturnValue();
      image = v8->_image;
      v8->_image = (UIImage *)v11;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value in key '%@' must be a dictionary - invalid value: %@"), CFSTR("fullColorImage"), v10);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tintColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithJSONObjectRepresentation:", v13);
      tintColor = v8->_tintColor;
      v8->_tintColor = (UIColor *)v14;

    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value in key '%@' must be a dictionary - invalid value: %@"), CFSTR("tintColor"), v13);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("accessibilityLabel"), v16);
      objc_storeStrong((id *)&v8->_accessibilityLabel, v16);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tintedImageProvider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[CLKImageProvider initWithJSONObjectRepresentation:bundle:]([CLKImageProvider alloc], "initWithJSONObjectRepresentation:bundle:", v17, v23);
      tintedImageProvider = v8->_tintedImageProvider;
      v8->_tintedImageProvider = v18;

    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value in key '%@' must be a dictionary - invalid value: %@"), CFSTR("tintedImageProvider"), v17);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("monochromeFilterType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8->_monochromeFilterType = objc_msgSend(v20, "integerValue");
    else
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("monochromeFilterType"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("monochromeFilterType"), v20);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prefersFilterOverTransition"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("prefersFilterOverTransition"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("prefersFilterOverTransition"), v21);
    else
      v8->_prefersFilterOverTransition = objc_msgSend(v21, "BOOLValue");

    v7 = v23;
  }

  return v8;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[UIImage JSONObjectRepresentationWritingResourcesToBundlePath:](self->_image, "JSONObjectRepresentationWritingResourcesToBundlePath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("fullColorImage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_applyScalingAndCircularMasking);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("applyScalingAndCircularMask"));

  -[UIColor JSONObjectRepresentation](self->_tintColor, "JSONObjectRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("tintColor"));

  -[CLKImageProvider JSONObjectRepresentationWritingResourcesToBundlePath:](self->_tintedImageProvider, "JSONObjectRepresentationWritingResourcesToBundlePath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("tintedImageProvider"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_monochromeFilterType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("monochromeFilterType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_prefersFilterOverTransition);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("prefersFilterOverTransition"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_accessibilityLabel, CFSTR("accessibilityLabel"));
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("class"));

  return v5;
}

- (BOOL)validate
{
  Class ImageViewClass;
  NSObject *v5;

  if (self->_image)
    return 1;
  ImageViewClass = self->_ImageViewClass;
  if (ImageViewClass)
  {
    if (ImageViewClass != (Class)objc_opt_class())
      return 1;
  }
  CLKLoggingObjectForDomain(10);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[CLKFullColorImageProvider validate].cold.1((uint64_t)self, v5);

  return 0;
}

- (void)finalizeWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  double v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  if (!self->_finalized)
  {
    if (self->_applyScalingAndCircularMasking)
      -[CLKFullColorImageProvider _resizeImagesIfNecessaryWithMaxSDKSize:maxDeviceSize:cornerRadius:](self, "_resizeImagesIfNecessaryWithMaxSDKSize:maxDeviceSize:cornerRadius:", a3.width, a3.height, a4.width, a4.height, a5);
    self->_finalized = 1;
  }
  if (-[CLKFullColorImageProvider isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:", v9, v8, width, height, a5);

  }
  -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "foregroundAccentImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "foregroundAccentImage");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v15, "twoPieceImageBackground");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

        v23 = 0;
        goto LABEL_16;
      }
      -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "twoPieceImageForeground");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v18 = 0;
        goto LABEL_18;
      }
      -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "onePieceImage");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (id)v17;

    v18 = v23;
    if (!v23)
    {
LABEL_18:

      return;
    }
    -[CLKFullColorImageProvider image](self, "image");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[CLKFullColorImageProvider setPrefersFilterOverTransition:](self, "setPrefersFilterOverTransition:", v19 == v23);

    if (-[CLKFullColorImageProvider prefersFilterOverTransition](self, "prefersFilterOverTransition"))
    {
LABEL_17:
      v18 = v23;
      goto LABEL_18;
    }
    -[CLKFullColorImageProvider image](self, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKFullColorImageProvider setPrefersFilterOverTransition:](self, "setPrefersFilterOverTransition:", objc_msgSend(v16, "isEqual:", v23));
LABEL_16:

    goto LABEL_17;
  }
}

- (void)_resizeImagesIfNecessaryWithMaxSDKSize:(CGSize)a3 maxDeviceSize:(CGSize)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  double v8;
  double v9;
  UIImage *v11;
  UIImage *image;
  id v13;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  +[CLKTreatedImageCache sharedInstance](CLKTreatedImageCache, "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageForRawImage:maxSDKSize:maxDeviceSize:cornerRadius:", self->_image, v9, v8, width, height, a5);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v11;

}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
  objc_storeStrong((id *)&self->_image, image);
}

- (CLKImageProvider)tintedImageProvider
{
  return self->_tintedImageProvider;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (Class)ImageViewClass
{
  return self->_ImageViewClass;
}

- (BOOL)tritium_isTritiumInactiveFullColorImageProvider
{
  return self->_tritium_inactiveFullColorImageProvider;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (int64_t)monochromeFilterType
{
  return self->_monochromeFilterType;
}

- (void)setMonochromeFilterType:(int64_t)a3
{
  self->_monochromeFilterType = a3;
}

- (BOOL)prefersFilterOverTransition
{
  return self->_prefersFilterOverTransition;
}

- (void)setPrefersFilterOverTransition:(BOOL)a3
{
  self->_prefersFilterOverTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_ImageViewClass, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_tintedImageProvider, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (void)validate
{
  void *v3;
  id v4;
  id v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = v3;
  v6 = 138412802;
  v7 = CFSTR("image");
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = (id)objc_opt_class();
  v5 = v11;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x20u);

}

@end

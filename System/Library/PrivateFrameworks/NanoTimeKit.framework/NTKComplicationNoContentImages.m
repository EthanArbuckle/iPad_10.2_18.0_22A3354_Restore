@implementation NTKComplicationNoContentImages

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationNoContentImages)initWithCoder:(id)a3
{
  id v4;
  NTKComplicationNoContentImages *v5;
  uint64_t v6;
  UIImage *modularSmallImage;
  uint64_t v8;
  UIImage *utilitarianSmallImage;
  uint64_t v10;
  UIImage *circularSmallImage;
  uint64_t v12;
  UIImage *extraLargeImage;

  v4 = a3;
  v5 = -[NTKComplicationNoContentImages init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modsm"));
    v6 = objc_claimAutoreleasedReturnValue();
    modularSmallImage = v5->_modularSmallImage;
    v5->_modularSmallImage = (UIImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("utlsm"));
    v8 = objc_claimAutoreleasedReturnValue();
    utilitarianSmallImage = v5->_utilitarianSmallImage;
    v5->_utilitarianSmallImage = (UIImage *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crcsm"));
    v10 = objc_claimAutoreleasedReturnValue();
    circularSmallImage = v5->_circularSmallImage;
    v5->_circularSmallImage = (UIImage *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modxl"));
    v12 = objc_claimAutoreleasedReturnValue();
    extraLargeImage = v5->_extraLargeImage;
    v5->_extraLargeImage = (UIImage *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIImage *modularSmallImage;
  id v5;

  modularSmallImage = self->_modularSmallImage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modularSmallImage, CFSTR("modsm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_utilitarianSmallImage, CFSTR("utlsm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_circularSmallImage, CFSTR("crcsm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extraLargeImage, CFSTR("modxl"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NTKComplicationNoContentImages *v4;

  v4 = -[NTKComplicationNoContentImages init](+[NTKComplicationNoContentImages allocWithZone:](NTKComplicationNoContentImages, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_modularSmallImage, self->_modularSmallImage);
  objc_storeStrong((id *)&v4->_utilitarianSmallImage, self->_utilitarianSmallImage);
  objc_storeStrong((id *)&v4->_circularSmallImage, self->_circularSmallImage);
  objc_storeStrong((id *)&v4->_extraLargeImage, self->_extraLargeImage);
  return v4;
}

- (UIImage)modularSmallImage
{
  return self->_modularSmallImage;
}

- (void)setModularSmallImage:(id)a3
{
  objc_storeStrong((id *)&self->_modularSmallImage, a3);
}

- (UIImage)utilitarianSmallImage
{
  return self->_utilitarianSmallImage;
}

- (void)setUtilitarianSmallImage:(id)a3
{
  objc_storeStrong((id *)&self->_utilitarianSmallImage, a3);
}

- (UIImage)circularSmallImage
{
  return self->_circularSmallImage;
}

- (void)setCircularSmallImage:(id)a3
{
  objc_storeStrong((id *)&self->_circularSmallImage, a3);
}

- (UIImage)extraLargeImage
{
  return self->_extraLargeImage;
}

- (void)setExtraLargeImage:(id)a3
{
  objc_storeStrong((id *)&self->_extraLargeImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeImage, 0);
  objc_storeStrong((id *)&self->_circularSmallImage, 0);
  objc_storeStrong((id *)&self->_utilitarianSmallImage, 0);
  objc_storeStrong((id *)&self->_modularSmallImage, 0);
}

@end

@implementation NTKPeopleComplicationImageProvider

- (NTKPeopleComplicationImageProvider)init
{
  NTKPeopleComplicationImageProvider *v2;
  NTKPeopleComplicationImageProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplicationImageProvider;
  v2 = -[CLKImageProvider initPrivate](&v5, sel_initPrivate);
  v3 = v2;
  if (v2)
    -[CLKImageProvider setImageViewCreationHandler:](v2, "setImageViewCreationHandler:", &__block_literal_global_149);
  return v3;
}

NTKPeopleComplicationImageView *__42__NTKPeopleComplicationImageProvider_init__block_invoke(double a1, double a2)
{
  return -[NTKPeopleComplicationImageView initWithFrame:]([NTKPeopleComplicationImageView alloc], "initWithFrame:", 0.0, 0.0, a1, a2);
}

- (BOOL)isEqual:(id)a3
{
  NTKPeopleComplicationImageProvider *v4;
  NTKPeopleComplicationImageProvider *v5;
  double borderWidth;
  double v7;
  double fontSize;
  double v9;
  UIImage *profileImage;
  void *v11;
  NSString *fullName;
  void *v13;
  NSString *nameAbbreviation;
  void *v15;
  char v16;

  v4 = (NTKPeopleComplicationImageProvider *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v16 = 1;
    }
    else
    {
      v5 = v4;
      borderWidth = self->_borderWidth;
      -[NTKPeopleComplicationImageProvider borderWidth](v5, "borderWidth");
      if (vabdd_f64(borderWidth, v7) >= 2.22044605e-16
        || (fontSize = self->_fontSize,
            -[NTKPeopleComplicationImageProvider fontSize](v5, "fontSize"),
            vabdd_f64(fontSize, v9) >= 2.22044605e-16))
      {
        v16 = 0;
      }
      else
      {
        profileImage = self->_profileImage;
        -[NTKPeopleComplicationImageProvider profileImage](v5, "profileImage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UIImage isEqual:](profileImage, "isEqual:", v11))
        {
          fullName = self->_fullName;
          -[NTKPeopleComplicationImageProvider fullName](v5, "fullName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](fullName, "isEqualToString:", v13))
          {
            nameAbbreviation = self->_nameAbbreviation;
            -[NTKPeopleComplicationImageProvider nameAbbreviation](v5, "nameAbbreviation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[NSString isEqualToString:](nameAbbreviation, "isEqualToString:", v15);

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
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKPeopleComplicationImageProvider;
  v5 = -[CLKImageProvider copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setBorderWidth:", self->_borderWidth);
    objc_msgSend(v6, "setFontSize:", self->_fontSize);
    objc_msgSend(v6, "setProfileImage:", self->_profileImage);
    v7 = (void *)-[NSString copyWithZone:](self->_fullName, "copyWithZone:", a3);
    objc_msgSend(v6, "setFullName:", v7);

    v8 = (void *)-[NSString copyWithZone:](self->_nameAbbreviation, "copyWithZone:", a3);
    objc_msgSend(v6, "setNameAbbreviation:", v8);

  }
  return v6;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (UIImage)profileImage
{
  return self->_profileImage;
}

- (void)setProfileImage:(id)a3
{
  objc_storeStrong((id *)&self->_profileImage, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (NSString)nameAbbreviation
{
  return self->_nameAbbreviation;
}

- (void)setNameAbbreviation:(id)a3
{
  objc_storeStrong((id *)&self->_nameAbbreviation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameAbbreviation, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_profileImage, 0);
}

@end

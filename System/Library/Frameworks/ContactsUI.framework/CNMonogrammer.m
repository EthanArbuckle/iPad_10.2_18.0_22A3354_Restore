@implementation CNMonogrammer

+ (id)descriptorForRequiredKeysIncludingImage:(BOOL)a3
{
  uint64_t *v3;

  if (a3)
  {
    if (descriptorForRequiredKeysIncludingImage__cn_once_token_1 != -1)
      dispatch_once(&descriptorForRequiredKeysIncludingImage__cn_once_token_1, &__block_literal_global_35575);
    v3 = &descriptorForRequiredKeysIncludingImage__cn_once_object_1;
  }
  else
  {
    if (descriptorForRequiredKeysIncludingImage__cn_once_token_2 != -1)
      dispatch_once(&descriptorForRequiredKeysIncludingImage__cn_once_token_2, &__block_literal_global_3_35576);
    v3 = &descriptorForRequiredKeysIncludingImage__cn_once_object_2;
  }
  return (id)*v3;
}

void __57__CNMonogrammer_descriptorForRequiredKeysIncludingImage___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  v1 = *MEMORY[0x1E0C966D0];
  v7[0] = *MEMORY[0x1E0C96890];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0C96898];
  v7[2] = *MEMORY[0x1E0C966C0];
  v7[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNMonogrammer descriptorForRequiredKeysIncludingImage:]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)descriptorForRequiredKeysIncludingImage__cn_once_object_1;
  descriptorForRequiredKeysIncludingImage__cn_once_object_1 = v5;

}

- (UIImage)silhouetteMonogram
{
  UIImage *silhouetteMonogram;
  UIImage *v4;
  UIImage *v5;

  silhouetteMonogram = self->_silhouetteMonogram;
  if (!silhouetteMonogram)
  {
    v4 = -[CNMonogrammer _copyMonogramWithSilhouette](self, "_copyMonogramWithSilhouette");
    v5 = self->_silhouetteMonogram;
    self->_silhouetteMonogram = v4;

    silhouetteMonogram = self->_silhouetteMonogram;
  }
  return silhouetteMonogram;
}

- (id)_copyMonogramWithSilhouette
{
  double diameter;
  CGContext *CurrentContext;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CGContext *v10;
  void *v11;
  CGSize v13;

  diameter = self->_diameter;
  v13.width = diameter;
  v13.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v13, 0, self->_scale);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor set](self->_backgroundColor, "set");
  objc_msgSend(v5, "setLineWidth:", self->_innerBorderWidth);
  objc_msgSend(v5, "addClip");
  objc_msgSend(v5, "fill");
  objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageNamed:", self->_silhouetteImageName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_tintColor)
  {
    objc_msgSend(v6, "imageWithTintColor:");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (self->_textKnockout)
    v9 = 23;
  else
    v9 = 0;
  objc_msgSend(v7, "drawInRect:blendMode:alpha:", v9, 0.0, 0.0, diameter, diameter, 1.0);
  v10 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v10, kCGBlendModeCopy);
  objc_msgSend(v5, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v11;
}

- (CNMonogrammer)initWithStyle:(int64_t)a3 diameter:(double)a4
{
  CNMonogrammer *v6;
  CNMonogrammer *v7;
  UIColor *tintColor;
  uint64_t v9;
  UIFont *v10;
  NSString *silhouetteImageName;
  const __CFString *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  UIFont *font;
  uint64_t v18;
  UIColor *backgroundColor;
  uint64_t v20;
  uint64_t v21;
  UIColor *v22;
  uint64_t v23;
  char v24;
  UIColor *textColor;
  uint64_t v26;
  UIColor *v27;
  uint64_t v29;
  UIFont *v30;
  void *v31;
  double v32;
  uint64_t v33;
  UIFont *v34;
  uint64_t v35;
  UIFont *v36;
  uint64_t v37;
  UIFont *v38;
  uint64_t v39;
  UIFont *v40;
  uint64_t v41;
  UIFont *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)CNMonogrammer;
  v6 = -[CNMonogrammer init](&v43, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_diameter = a4;
  v6->_innerBorderWidth = 1.0;
  tintColor = v6->_tintColor;
  v6->_tintColor = 0;

  v7->_scale = 0.0;
  if (a4 <= 14.0)
  {
    v13 = (void *)MEMORY[0x1E0DC1350];
    v14 = *MEMORY[0x1E0DC1440];
    v15 = 7.0;
LABEL_19:
    objc_msgSend(v13, "systemFontOfSize:weight:", v15, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    font = v7->_font;
    v7->_font = (UIFont *)v16;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-S");
    goto LABEL_20;
  }
  if (a4 <= 20.0)
  {
    v13 = (void *)MEMORY[0x1E0DC1350];
    v14 = *MEMORY[0x1E0DC1440];
    v15 = 10.0;
    goto LABEL_19;
  }
  if (a4 <= 32.0)
  {
    v13 = (void *)MEMORY[0x1E0DC1350];
    v14 = *MEMORY[0x1E0DC1440];
    v15 = 14.0;
    goto LABEL_19;
  }
  if (a4 <= 45.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1440]);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v7->_font;
    v7->_font = (UIFont *)v29;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-M");
    goto LABEL_20;
  }
  if (a4 <= 60.0)
  {
    v31 = (void *)MEMORY[0x1E0DC1350];
    v32 = 24.0;
LABEL_33:
    objc_msgSend(v31, "systemFontOfSize:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v7->_font;
    v7->_font = (UIFont *)v33;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-L");
    goto LABEL_20;
  }
  if (a4 <= 76.0)
  {
    v31 = (void *)MEMORY[0x1E0DC1350];
    v32 = 30.0;
    goto LABEL_33;
  }
  if (a4 <= 96.0)
  {
    v31 = (void *)MEMORY[0x1E0DC1350];
    v32 = 38.0;
    goto LABEL_33;
  }
  if (a4 <= 118.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 48.0);
    v35 = objc_claimAutoreleasedReturnValue();
LABEL_36:
    v36 = v7->_font;
    v7->_font = (UIFont *)v35;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-ATV-M");
    goto LABEL_20;
  }
  if (a4 <= 120.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 52.0, *MEMORY[0x1E0DC1450]);
    v35 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (a4 <= 148.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 52.0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v7->_font;
    v7->_font = (UIFont *)v37;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-ATV-L");
    goto LABEL_20;
  }
  if (a4 <= 178.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 76.0);
    v39 = objc_claimAutoreleasedReturnValue();
LABEL_40:
    v40 = v7->_font;
    v7->_font = (UIFont *)v39;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-ATV-XL");
    goto LABEL_20;
  }
  if (a4 <= 180.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 76.0, *MEMORY[0x1E0DC1450]);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (a4 <= 250.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 87.0);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v7->_font;
    v7->_font = (UIFont *)v41;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-ATV-XXL");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 109.0, *MEMORY[0x1E0DC1450]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v7->_font;
    v7->_font = (UIFont *)v9;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = CFSTR("silhouette-EDU-XL");
  }
LABEL_20:
  v7->_silhouetteImageName = &v12->isa;

  v7->_monogrammerStyle = a3;
  switch(a3)
  {
    case 0:
      +[CNUIColorRepository monogrammerBackgroundWhiteColor](CNUIColorRepository, "monogrammerBackgroundWhiteColor");
      v18 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v7->_backgroundColor;
      v7->_backgroundColor = (UIColor *)v18;

      +[CNUIColorRepository monogrammerBackTextWhiteColor](CNUIColorRepository, "monogrammerBackTextWhiteColor");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 1:
      +[CNUIColorRepository monogrammerBackgroundGrayColor](CNUIColorRepository, "monogrammerBackgroundGrayColor");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v7->_backgroundColor;
      v7->_backgroundColor = (UIColor *)v21;

      +[CNUIColorRepository monogrammerTextGrayColor](CNUIColorRepository, "monogrammerTextGrayColor");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = 0;
      textColor = v7->_textColor;
      v7->_textColor = (UIColor *)v23;
      goto LABEL_27;
    case 2:
      +[CNUIColorRepository monogrammerBackgroundLightColor](CNUIColorRepository, "monogrammerBackgroundLightColor");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 3:
      +[CNUIColorRepository monogrammerBackgroundDarkColor](CNUIColorRepository, "monogrammerBackgroundDarkColor");
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v27 = v7->_backgroundColor;
      v7->_backgroundColor = (UIColor *)v26;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      textColor = v7->_textColor;
      v7->_textColor = (UIColor *)v20;
      v24 = 1;
LABEL_27:

      v7->_textKnockout = v24;
      break;
    default:
      return v7;
  }
  return v7;
}

- (CNMonogrammer)init
{
  CNMonogrammer *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CNMonogrammer *v7;
  uint64_t v8;
  UIColor *backgroundColor;
  uint64_t v10;
  UIFont *font;
  uint64_t v12;
  UIColor *textColor;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CNMonogrammer;
  v2 = -[CNMonogrammer init](&v15, sel_init);
  v7 = v2;
  if (v2)
  {
    v2->_diameter = 0.0;
    +[CNUIColorRepository monogrammerBackgroundStandardGrayColor](CNUIColorRepository, "monogrammerBackgroundStandardGrayColor");
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = (UIColor *)v8;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v10 = objc_claimAutoreleasedReturnValue();
    font = v7->_font;
    v7->_font = (UIFont *)v10;

    +[CNUIColorRepository monogrammerTextStandardGrayColor](CNUIColorRepository, "monogrammerTextStandardGrayColor");
    v12 = objc_claimAutoreleasedReturnValue();
    textColor = v7->_textColor;
    v7->_textColor = (UIColor *)v12;

    v7->_textKnockout = 0;
  }
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNMonogrammer.m", 91, 4, CFSTR("Please switch to initWithStyle:diameter: when creating ABMonogrammer objects"), v3, v4, v5, v6, (uint64_t)v15.receiver);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CNMonogrammer _clearMonogramCache](self, "_clearMonogramCache");
  v3.receiver = self;
  v3.super_class = (Class)CNMonogrammer;
  -[CNMonogrammer dealloc](&v3, sel_dealloc);
}

- (void)monogramsAsFlatImages
{
  UIColor *v3;
  UIColor *backgroundColor;

  if ((self->_monogrammerStyle & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    +[CNUIColorRepository monogrammerBackgroundFlatDarkColor](CNUIColorRepository, "monogrammerBackgroundFlatDarkColor");
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v3;

    -[CNMonogrammer _clearMonogramCache](self, "_clearMonogramCache");
  }
}

- (void)monogramsWithTint:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_monogrammerStyle <= 1uLL)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tintColor, a3);
    v5 = v6;
  }

}

- (void)monogramsForStark
{
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "_carScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  self->_scale = v3;

}

- (void)setDiameter:(double)a3
{
  if (self->_diameter != a3)
  {
    self->_diameter = a3;
    -[CNMonogrammer _clearMonogramCache](self, "_clearMonogramCache");
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[CNMonogrammer _clearMonogramCache](self, "_clearMonogramCache");
    v5 = v6;
  }

}

- (void)setFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    -[CNMonogrammer _clearMonogramCache](self, "_clearMonogramCache");
    v5 = v6;
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    -[CNMonogrammer _clearMonogramCache](self, "_clearMonogramCache");
    v5 = v6;
  }

}

- (void)setTextKnockout:(BOOL)a3
{
  if (self->_textKnockout != a3)
  {
    self->_textKnockout = a3;
    -[CNMonogrammer _clearMonogramCache](self, "_clearMonogramCache");
  }
}

- (double)innerBorderWidth
{
  return self->_innerBorderWidth;
}

- (id)silhouetteImageName
{
  return self->_silhouetteImageName;
}

- (id)monogramForContact:(id)a3 isContactImage:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysIncludingImage:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertKeysAreAvailable:", v8);

  if (a4)
    *a4 = 0;
  if (self->_diameter == 0.0)
  {
    v9 = 0;
  }
  else
  {
    if (!v6)
      goto LABEL_14;
    if (objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C96890])
      && (objc_msgSend(v6, "thumbnailImageData"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C96708])
      && (objc_msgSend(v6, "imageData"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = -[CNMonogrammer _copyMonogramWithImageData:](self, "_copyMonogramWithImageData:", v10);
      v9 = v11;
      if (a4)
        *a4 = v11 != 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_initialsForContact:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNMonogrammer _copyMonogramWithInitials:](self, "_copyMonogramWithInitials:", v12);

      v10 = 0;
    }

    if (!v9)
    {
LABEL_14:
      -[CNMonogrammer silhouetteMonogram](self, "silhouetteMonogram");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (id)monogramForContact:(id)a3
{
  char v4;

  v4 = 0;
  -[CNMonogrammer monogramForContact:isContactImage:](self, "monogramForContact:isContactImage:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)monogramForPersonWithFirstName:(id)a3 lastName:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  -[CNMonogrammer _initialsForFirstName:lastName:](self, "_initialsForFirstName:lastName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNMonogrammer _copyMonogramWithInitials:](self, "_copyMonogramWithInitials:", v5);

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[CNMonogrammer silhouetteMonogram](self, "silhouetteMonogram");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)monogramForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CNMonogrammer *subMonogrammer;
  CNMonogrammer *v9;
  CNMonogrammer *v10;
  void *v11;
  CNMonogrammer *v12;
  void *v13;
  void *v14;
  double diameter;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  CGSize v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMonogrammer monogramForContact:](self, "monogramForContact:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v6 = 0;
      goto LABEL_11;
    }
    v7 = (self->_diameter + self->_diameter) / 3.0;
    subMonogrammer = self->_subMonogrammer;
    if (!subMonogrammer)
    {
      v9 = -[CNMonogrammer initWithStyle:diameter:]([CNMonogrammer alloc], "initWithStyle:diameter:", self->_monogrammerStyle, v7);
      v10 = self->_subMonogrammer;
      self->_subMonogrammer = v9;

      subMonogrammer = self->_subMonogrammer;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMonogrammer monogramForContact:](subMonogrammer, "monogramForContact:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_subMonogrammer;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMonogrammer monogramForContact:](v12, "monogramForContact:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v14)
    {
      diameter = self->_diameter;
      v16 = diameter - v7;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 0.0, 0.0, diameter, diameter);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", diameter - v7, diameter - v7, v7, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25.width = diameter;
      v25.height = diameter;
      UIGraphicsBeginImageContextWithOptions(v25, 0, 0.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "set");

      objc_msgSend(v17, "fill");
      objc_msgSend(v5, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v7, v7, 1.0);
      v20 = round(self->_diameter / 12.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "set");

      v22 = (void *)MEMORY[0x1E0DC3508];
      v26.origin.x = v16;
      v26.origin.y = v16;
      v26.size.width = v7;
      v26.size.height = v7;
      v27 = CGRectInset(v26, v20 * -0.5, v20 * -0.5);
      objc_msgSend(v22, "bezierPathWithOvalInRect:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fillWithBlendMode:alpha:", 17, 1.0);
      objc_msgSend(v18, "addClip");
      objc_msgSend(v14, "drawInRect:blendMode:alpha:", 17, v16, v16, v7, v7, 1.0);
      UIGraphicsGetImageFromCurrentImageContext();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();

    }
    else
    {

      v6 = 0;
    }
  }

LABEL_11:
  return v6;
}

- (UIImage)questionMarkMonogram
{
  UIImage *questionMarkMonogram;
  UIImage *v4;
  UIImage *v5;

  questionMarkMonogram = self->_questionMarkMonogram;
  if (!questionMarkMonogram)
  {
    v4 = -[CNMonogrammer _copyMonogramWithInitials:](self, "_copyMonogramWithInitials:", CFSTR("?"));
    v5 = self->_questionMarkMonogram;
    self->_questionMarkMonogram = v4;

    questionMarkMonogram = self->_questionMarkMonogram;
  }
  return questionMarkMonogram;
}

- (UIImage)knockoutMaskMonogram
{
  UIImage *knockoutMaskMonogram;
  UIImage *v4;
  UIImage *v5;

  knockoutMaskMonogram = self->_knockoutMaskMonogram;
  if (!knockoutMaskMonogram)
  {
    v4 = -[CNMonogrammer _copyMonogramWithKnockoutMask](self, "_copyMonogramWithKnockoutMask");
    v5 = self->_knockoutMaskMonogram;
    self->_knockoutMaskMonogram = v4;

    knockoutMaskMonogram = self->_knockoutMaskMonogram;
  }
  return knockoutMaskMonogram;
}

- (void)_clearMonogramCache
{
  UIImage *silhouetteMonogram;
  UIImage *questionMarkMonogram;
  UIImage *knockoutMaskMonogram;

  silhouetteMonogram = self->_silhouetteMonogram;
  if (silhouetteMonogram)
  {
    self->_silhouetteMonogram = 0;

  }
  questionMarkMonogram = self->_questionMarkMonogram;
  if (questionMarkMonogram)
  {
    self->_questionMarkMonogram = 0;

  }
  knockoutMaskMonogram = self->_knockoutMaskMonogram;
  if (knockoutMaskMonogram)
  {
    self->_knockoutMaskMonogram = 0;

  }
}

- (id)_initialsForFirstName:(id)a3 lastName:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (!(v5 | v6) || !_isRomanName((void *)v5) || !_isRomanName((void *)v6))
    goto LABEL_12;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend((id)v5, "length");
  if (v8)
  {
    objc_msgSend((id)v5, "substringWithRange:", 0, 1);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E20507A8;
  }
  if (objc_msgSend((id)v6, "length"))
  {
    objc_msgSend((id)v6, "substringWithRange:", 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v9, &stru_1E20507A8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
LABEL_9:

LABEL_10:
  if (!objc_msgSend(v11, "length"))
  {

LABEL_12:
    v11 = 0;
  }
  objc_msgSend(v11, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_copyMonogramWithImageData:(id)a3
{
  double diameter;
  double scale;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize v10;

  if (!a3)
    return 0;
  diameter = self->_diameter;
  scale = self->_scale;
  v5 = a3;
  v10.width = diameter;
  v10.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v10, 0, scale);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addClip");
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "drawInRect:", 0.0, 0.0, diameter, diameter);
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v8;
}

- (id)_copyMonogramWithInitials:(id)a3
{
  double diameter;
  double scale;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  UIColor *tintColor;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGContext *CurrentContext;
  void *v25;
  double v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  CGSize v31;

  v30[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  diameter = self->_diameter;
  scale = self->_scale;
  v6 = a3;
  v31.width = diameter;
  v31.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v31, 0, scale);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addClip");
  -[UIColor set](self->_backgroundColor, "set");
  objc_msgSend(v7, "fill");
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  v9 = *MEMORY[0x1E0DC1138];
  v30[0] = self->_font;
  v10 = *MEMORY[0x1E0DC1140];
  v28 = v9;
  v29 = v10;
  tintColor = self->_tintColor;
  if (!tintColor)
    tintColor = self->_textColor;
  v30[1] = tintColor;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v28, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithString:attributes:", v6, v12);

  objc_msgSend(v13, "size");
  v27 = self->_scale;
  UIRectCenteredXInRectScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UIFont capHeight](self->_font, "capHeight", *(_QWORD *)&v27, v28, v29, v30[0]);
  v21 = (diameter - v20) * -0.5;
  -[UIFont pointSize](self->_font, "pointSize");
  v23 = diameter - v22 + v21;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, (CGBlendMode)(16 * self->_textKnockout));
  objc_msgSend(v13, "drawInRect:", v15, v23, v17, v19);
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v25;
}

- (id)_copyMonogramWithKnockoutMask
{
  double diameter;
  void *v3;
  void *v4;
  void *v5;
  CGSize v7;

  diameter = self->_diameter;
  v7.width = diameter;
  v7.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v7, 0, self->_scale);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addClip");
  +[CNUIColorRepository monogrammerBackgroundFlatDarkColor](CNUIColorRepository, "monogrammerBackgroundFlatDarkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  objc_msgSend(v3, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v5;
}

- (NSArray)keysToFetch
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C966D0];
  v5[0] = *MEMORY[0x1E0C96890];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0C96898];
  v5[2] = *MEMORY[0x1E0C966C0];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)font
{
  return self->_font;
}

- (double)diameter
{
  return self->_diameter;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)textKnockout
{
  return self->_textKnockout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_subMonogrammer, 0);
  objc_storeStrong((id *)&self->_silhouetteImageName, 0);
  objc_storeStrong((id *)&self->_knockoutMaskMonogram, 0);
  objc_storeStrong((id *)&self->_questionMarkMonogram, 0);
  objc_storeStrong((id *)&self->_silhouetteMonogram, 0);
}

+ (int64_t)monogramTypeForContact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C96890]);
    if (v6)
    {
      objc_msgSend(v5, "thumbnailImageData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

LABEL_20:
        v10 = 2;
        goto LABEL_21;
      }
    }
    if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
    {
      objc_msgSend(v5, "imageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = 1;
      }
      else if ((objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96700]) & 1) != 0)
      {
        v9 = objc_msgSend(v5, "imageDataAvailable");
      }
      else
      {
        v9 = 0;
      }

      if ((v6 & 1) != 0)
      {
LABEL_19:
        if ((v9 & 1) != 0)
          goto LABEL_20;
LABEL_14:
        objc_msgSend(a1, "_initialsForContact:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v11 != 0;

        goto LABEL_21;
      }
    }
    else if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96700]))
    {
      v9 = objc_msgSend(v5, "imageDataAvailable");
      if (v6)
        goto LABEL_19;
    }
    else
    {
      v9 = 0;
      if (v6)
        goto LABEL_19;
    }
    if ((v9 & 1) != 0)
      goto LABEL_20;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

+ (id)_initialsForContact:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "contactType"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "givenName");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "familyName");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 | v6 && _isRomanName((void *)v5) && _isRomanName((void *)v6))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_msgSend((id)v5, "length");
      if (v8)
      {
        objc_msgSend((id)v5, "substringWithRange:", 0, 1);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = &stru_1E20507A8;
      }
      if (objc_msgSend((id)v6, "length"))
      {
        objc_msgSend((id)v6, "substringWithRange:", 0, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v9, v12);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v9, &stru_1E20507A8);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v8)

    }
    else
    {
      v4 = 0;
    }

  }
  if (!objc_msgSend(v4, "length"))
  {

    v4 = 0;
  }
  objc_msgSend(v4, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)requiredKeyDescriptor
{
  return 0;
}

void __57__CNMonogrammer_descriptorForRequiredKeysIncludingImage___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  v1 = *MEMORY[0x1E0C966C0];
  v6[0] = *MEMORY[0x1E0C966D0];
  v6[1] = v1;
  v6[2] = *MEMORY[0x1E0C96898];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNMonogrammer descriptorForRequiredKeysIncludingImage:]_block_invoke_2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeysIncludingImage__cn_once_object_2;
  descriptorForRequiredKeysIncludingImage__cn_once_object_2 = v4;

}

@end

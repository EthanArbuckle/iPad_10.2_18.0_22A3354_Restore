@implementation IFColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)black
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __16__IFColor_black__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (black_onceToken != -1)
    dispatch_once(&black_onceToken, block);
  return (id)black_color;
}

void __16__IFColor_black__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithWhite:alpha:", 0.0, 1.0);
  v2 = (void *)black_color;
  black_color = v1;

}

+ (id)white
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __16__IFColor_white__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (white_onceToken != -1)
    dispatch_once(&white_onceToken, block);
  return (id)white_color;
}

void __16__IFColor_white__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithWhite:alpha:", 1.0, 1.0);
  v2 = (void *)white_color;
  white_color = v1;

}

+ (CGColorSpace)deviceRGBColorSpace
{
  if (deviceRGBColorSpace_onceToken != -1)
    dispatch_once(&deviceRGBColorSpace_onceToken, &__block_literal_global_0);
  return (CGColorSpace *)deviceRGBColorSpace_defaultColorSpace;
}

CGColorSpaceRef __30__IFColor_deviceRGBColorSpace__block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  deviceRGBColorSpace_defaultColorSpace = (uint64_t)result;
  return result;
}

+ (CGColorSpace)deviceGreyColorSpace
{
  if (deviceGreyColorSpace_onceToken != -1)
    dispatch_once(&deviceGreyColorSpace_onceToken, &__block_literal_global_1);
  return (CGColorSpace *)deviceGreyColorSpace_defaultColorSpace;
}

CGColorSpaceRef __31__IFColor_deviceGreyColorSpace__block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceGray();
  deviceGreyColorSpace_defaultColorSpace = (uint64_t)result;
  return result;
}

- (IFColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  void *v7;
  IFColor *v8;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD80]), "initWithRed:green:blue:alpha:colorSpace:", +[IFColor deviceRGBColorSpace](IFColor, "deviceRGBColorSpace"), a3, a4, a5, a6);
  v8 = -[IFColor initWithCIColor:](self, "initWithCIColor:", v7);

  return v8;
}

- (IFColor)initWithWhite:(double)a3 alpha:(double)a4
{
  void *v5;
  IFColor *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD80]), "initWithRed:green:blue:alpha:colorSpace:", +[IFColor deviceRGBColorSpace](IFColor, "deviceRGBColorSpace"), a3, a3, a3, a4);
  v6 = -[IFColor initWithCIColor:](self, "initWithCIColor:", v5);

  return v6;
}

- (IFColor)initWithCGColor:(CGColor *)a3
{
  void *v4;
  IFColor *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD80]), "initWithCGColor:", a3);
  v5 = -[IFColor initWithCIColor:](self, "initWithCIColor:", v4);

  return v5;
}

- (IFColor)initWithCIColor:(id)a3
{
  id v5;
  IFColor *v6;
  IFColor *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUUID *digest;

  v5 = a3;
  v6 = -[IFColor init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ciColor, a3);
    v8 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v5, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_IF_UUIDWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    digest = v7->_digest;
    v7->_digest = (NSUUID *)v10;

  }
  return v7;
}

- (IFColor)initWithSystemColor:(int64_t)a3
{
  return -[IFColor initWithSystemColor:appearance:contrast:vibrancy:](self, "initWithSystemColor:appearance:contrast:vibrancy:", a3, 0, 0, 0);
}

- (IFColor)initWithSystemColor:(int64_t)a3 appearance:(int64_t)a4 contrast:(int64_t)a5 vibrancy:(int64_t)a6
{
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  IFColor *v11;
  double v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 11:
      v13 = 1.0;
      goto LABEL_10;
    case 12:
      v13 = 0.0;
LABEL_10:
      v11 = -[IFColor initWithWhite:alpha:](self, "initWithWhite:alpha:", v13, 1.0);
      break;
    default:
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0D1A6B0], "colorWithName:designSystem:palette:colorScheme:contrast:styling:displayGamut:error:", 0, &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      if (!v7)
      {
        IFDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "localizedDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v10;

        }
      }
      v11 = -[IFColor initWithCGColor:](self, "initWithCGColor:", objc_msgSend(v7, "cgColor"));

      break;
  }

  return v11;
}

- (id)_initWithColorStr:(id)a3 appearance:(int64_t)a4 contrast:(int64_t)a5 vibrancy:(int64_t)a6
{
  id v10;
  NSObject *v11;
  IFColor *v12;
  IFColor *v13;
  uint64_t v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!objc_msgSend(v10, "compare:", CFSTR("systemBlackColor")))
  {
    v13 = self;
    v14 = 12;
LABEL_34:
    self = -[IFColor initWithSystemColor:appearance:contrast:vibrancy:](v13, "initWithSystemColor:appearance:contrast:vibrancy:", v14, a4, a5, a6);
    v12 = self;
    goto LABEL_35;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemWhiteColor")))
  {
    v13 = self;
    v14 = 11;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemRedColor")))
  {
    v13 = self;
    v14 = 0;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemOrangeColor")))
  {
    v13 = self;
    v14 = 1;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemYellowColor")))
  {
    v13 = self;
    v14 = 2;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemGreenColor")))
  {
    v13 = self;
    v14 = 3;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemMintColor")))
  {
    v13 = self;
    v14 = 5;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemTealColor")))
  {
    v13 = self;
    v14 = 4;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemCyanColor")))
  {
    v13 = self;
    v14 = 6;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemBlueColor")))
  {
    v13 = self;
    v14 = 7;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemIndigoColor")))
  {
    v13 = self;
    v14 = 8;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemPurpleColor")))
  {
    v13 = self;
    v14 = 9;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemPinkColor")))
  {
    v13 = self;
    v14 = 10;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemBrownColor")))
  {
    v13 = self;
    v14 = 14;
    goto LABEL_34;
  }
  if (!objc_msgSend(v10, "compare:", CFSTR("systemGrayColor")))
  {
    v13 = self;
    v14 = 13;
    goto LABEL_34;
  }
  IFDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_1D4106000, v11, OS_LOG_TYPE_DEFAULT, "Unknown color: %@", (uint8_t *)&v16, 0xCu);
  }

  v12 = 0;
LABEL_35:

  return v12;
}

- (IFColor)initWithCoder:(id)a3
{
  id v4;
  IFColor *v5;
  uint64_t v6;
  NSUUID *digest;
  uint64_t v8;
  CIColor *ciColor;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFColor;
  v5 = -[IFColor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("digest"));
    v6 = objc_claimAutoreleasedReturnValue();
    digest = v5->_digest;
    v5->_digest = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ciColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    ciColor = v5->_ciColor;
    v5->_ciColor = (CIColor *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *digest;
  id v5;

  digest = self->_digest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", digest, CFSTR("digest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ciColor, CFSTR("ciColor"));

}

- (CGColor)cgColor
{
  CGColorRef v2;

  v2 = CGColorCreate(-[CIColor colorSpace](self->_ciColor, "colorSpace"), -[CIColor components](self->_ciColor, "components"));
  return (CGColor *)CFAutorelease(v2);
}

- (BOOL)isEqual:(id)a3
{
  IFColor *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (IFColor *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[IFColor digest](self, "digest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IFColor digest](v4, "digest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)blendColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v6;
  IFColor *v7;
  IFColor *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  IFColor *v33;
  IFColor *v34;

  v6 = a4;
  v7 = self;
  v8 = v7;
  if (a3 >= 1.0)
  {
    v33 = (IFColor *)v6;
  }
  else if (a3 <= 0.0)
  {
    v33 = v7;
  }
  else
  {
    objc_msgSend(v6, "ciColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "red");
    v11 = v10;
    -[IFColor ciColor](v8, "ciColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "red");
    v14 = (1.0 - a3) * v13 + v11 * a3;

    objc_msgSend(v6, "ciColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "green");
    v17 = v16;
    -[IFColor ciColor](v8, "ciColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "green");
    v20 = (1.0 - a3) * v19 + v17 * a3;

    objc_msgSend(v6, "ciColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "blue");
    v23 = v22;
    -[IFColor ciColor](v8, "ciColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "blue");
    v26 = (1.0 - a3) * v25 + v23 * a3;

    objc_msgSend(v6, "ciColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alpha");
    v29 = v28;
    -[IFColor ciColor](v8, "ciColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "alpha");
    v32 = (1.0 - a3) * v31 + v29 * a3;

    v33 = -[IFColor initWithRed:green:blue:alpha:]([IFColor alloc], "initWithRed:green:blue:alpha:", v14, v20, v26, v32);
  }
  v34 = v33;

  return v34;
}

- (CIColor)ciColor
{
  return (CIColor *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)digest
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_ciColor, 0);
}

@end

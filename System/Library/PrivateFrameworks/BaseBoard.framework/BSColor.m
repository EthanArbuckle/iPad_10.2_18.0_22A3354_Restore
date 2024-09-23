@implementation BSColor

+ (id)blackColor
{
  return (id)objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  BSColor *v10;

  v10 = objc_alloc_init(BSColor);
  v10->_red = a3;
  v10->_green = a4;
  v10->_blue = a5;
  v10->_alpha = a6;
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_colorRef);
  v3.receiver = self;
  v3.super_class = (Class)BSColor;
  -[BSColor dealloc](&v3, sel_dealloc);
}

- (CGColor)CGColor
{
  BSColor *v2;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v4;
  __int128 v5;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_colorRef)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v4 = DeviceRGB;
    if (DeviceRGB)
    {
      v5 = *(_OWORD *)&v2->_blue;
      v7[0] = *(_OWORD *)&v2->_red;
      v7[1] = v5;
      v2->_colorRef = CGColorCreate(DeviceRGB, (const CGFloat *)v7);
      CGColorSpaceRelease(v4);
    }
  }
  objc_sync_exit(v2);

  return v2->_colorRef;
}

- (BOOL)isEqualToColor:(id)a3
{
  id v4;
  void *v5;
  double red;
  uint64_t v7;
  id v8;
  id v9;
  double green;
  id v11;
  id v12;
  double blue;
  id v14;
  id v15;
  double alpha;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  +[BSEqualsBuilder builderWithObject:ofExpectedClass:](BSEqualsBuilder, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  red = self->_red;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __26__BSColor_isEqualToColor___block_invoke;
  v29[3] = &unk_1E1EBF0F8;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v29, red);
  green = self->_green;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __26__BSColor_isEqualToColor___block_invoke_2;
  v27[3] = &unk_1E1EBF0F8;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v27, green);
  blue = self->_blue;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __26__BSColor_isEqualToColor___block_invoke_3;
  v25[3] = &unk_1E1EBF0F8;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v25, blue);
  alpha = self->_alpha;
  v20 = v7;
  v21 = 3221225472;
  v22 = __26__BSColor_isEqualToColor___block_invoke_4;
  v23 = &unk_1E1EBF0F8;
  v17 = v14;
  v24 = v17;
  v18 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", &v20, alpha);
  LOBYTE(v14) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return (char)v14;
}

uint64_t __26__BSColor_isEqualToColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "red");
}

uint64_t __26__BSColor_isEqualToColor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "green");
}

uint64_t __26__BSColor_isEqualToColor___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "blue");
}

uint64_t __26__BSColor_isEqualToColor___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alpha");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSColor)initWithCoder:(id)a3
{
  id v4;
  BSColor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSColor;
  v5 = -[BSColor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("r"));
    v5->_red = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("g"));
    v5->_green = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("b"));
    v5->_blue = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("a"));
    v5->_alpha = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("r"), self->_red);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("g"), self->_green);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("b"), self->_blue);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("a"), self->_alpha);

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BSColor)initWithBSXPCCoder:(id)a3
{
  id v4;
  BSColor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSColor;
  v5 = -[BSColor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("r"));
    v5->_red = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("g"));
    v5->_green = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("b"));
    v5->_blue = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("a"));
    v5->_alpha = v9;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("r"), self->_red);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("g"), self->_green);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("b"), self->_blue);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("a"), self->_alpha);

}

- (BSColor)initWithXPCDictionary:(id)a3
{
  void *v4;
  BSColor *v5;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSColor initWithBSXPCCoder:](self, "initWithBSXPCCoder:", v4);

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSColor encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("r"), 2, self->_red);
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("g"), 2, self->_green);
  v6 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("b"), 2, self->_blue);
  v7 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("a"), 2, self->_alpha);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  +[BSHashBuilder builder](BSHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCGFloat:", self->_red);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGFloat:", self->_green);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCGFloat:", self->_blue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendCGFloat:", self->_alpha);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BSColor isEqualToColor:](self, "isEqualToColor:", v4);

  return v5;
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end

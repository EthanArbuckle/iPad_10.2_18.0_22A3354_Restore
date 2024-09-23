@implementation BSUIVibrancyLUT

- (BSUIVibrancyLUT)initWithIdentifier:(id)a3 bundleURL:(id)a4
{
  return -[BSUIVibrancyLUT initWithIdentifier:bundleURL:blend:toIdentifier:](self, "initWithIdentifier:bundleURL:blend:toIdentifier:", a3, a4, 0, 0.0);
}

- (BSUIVibrancyLUT)initWithIdentifier:(id)a3 bundleURL:(id)a4 blend:(double)a5 toIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  BSUIVibrancyLUT *v12;
  uint64_t v13;
  NSString *lutIdentifier;
  uint64_t v15;
  NSURL *bundleURL;
  double v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BSUIVibrancyLUT;
  v12 = -[BSUIVibrancyLUT init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    lutIdentifier = v12->_lutIdentifier;
    v12->_lutIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    bundleURL = v12->_bundleURL;
    v12->_bundleURL = (NSURL *)v15;

    BSIntervalClip();
    v12->_blend = v17;
    objc_storeStrong((id *)&v12->_toIdentifier, a6);
  }

  return v12;
}

- (BOOL)shouldUseInterpolatedLUTForBlend:(double)a3 toIdentifier:(id)a4
{
  int v6;

  if ((BSFloatIsZero() & 1) != 0)
    return 0;
  v6 = BSFloatIsOne() ^ 1;
  if (a4)
    return v6;
  else
    return 0;
}

- (BOOL)canReuseInterpolatedLUTWithBlend:(double)a3 toIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  -[BSUIVibrancyLUT blend](self, "blend");
  if (BSFloatEqualToFloat())
  {
    -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v5))
    {
      -[BSUIVibrancyLUT interpolatedLutImage](self, "interpolatedLutImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CAFilter)resolvedLUTFilter
{
  double v3;
  double v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int IsOne;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;

  -[BSUIVibrancyLUT blend](self, "blend");
  v4 = v3;
  -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BSUIVibrancyLUT shouldUseInterpolatedLUTForBlend:toIdentifier:](self, "shouldUseInterpolatedLUTForBlend:toIdentifier:", v5, v4);

  if (v6)
  {
    -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyLUT blend](self, "blend");
    -[BSUIVibrancyLUT interpolatedImageWithFirstImage:secondImage:blend:](self, "interpolatedImageWithFirstImage:secondImage:blend:", v7, v8);
    v9 = (void *)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BSUIVibrancyLUT blend](self, "blend");
    if (BSFloatIsOne()
      && (-[BSUIVibrancyLUT toIdentifier](self, "toIdentifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      v12 = (void *)MEMORY[0x1E0CEA638];
      -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB34D0];
      -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleWithURL:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageNamed:inBundle:", v13, v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CEA638];
      -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB34D0];
      -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleWithURL:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageNamed:inBundle:", v13, v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v16;

    v9 = (void *)v13;
    v10 = v19;
  }

  if (!v10)
  {
    v20 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E30]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyLUT blend](self, "blend");
  IsOne = BSFloatIsOne();
  if (IsOne
    && (-[BSUIVibrancyLUT toIdentifier](self, "toIdentifier"), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 1;
  }
  else
  {
    -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v25 = 0;
    v24 = 1;
  }
  objc_msgSend(v20, "setName:", v23);
  if (v24)
  {

    if (!v25)
      goto LABEL_15;
LABEL_19:

    if (!IsOne)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v25)
    goto LABEL_19;
LABEL_15:
  if (IsOne)
LABEL_16:

LABEL_17:
  v26 = objc_msgSend(objc_retainAutorelease(v10), "CGImage");
  objc_msgSend(v20, "setValue:forKey:", v26, *MEMORY[0x1E0CD2D18]);
LABEL_22:

  return (CAFilter *)v20;
}

- (id)interpolatedImageWithFirstImage:(id)a3 secondImage:(id)a4 blend:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  float v27;
  float v28;
  CGSize v30;

  v8 = a3;
  v9 = a4;
  if (-[BSUIVibrancyLUT canReuseInterpolatedLUTWithBlend:toIdentifier:](self, "canReuseInterpolatedLUTWithBlend:toIdentifier:", v9, a5))
  {
    -[BSUIVibrancyLUT interpolatedLutImage](self, "interpolatedLutImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CEA638];
    v12 = (void *)MEMORY[0x1E0CB34D0];
    -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleWithURL:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageNamed:inBundle:", v8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CEA638];
    v17 = (void *)MEMORY[0x1E0CB34D0];
    -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleWithURL:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageNamed:inBundle:", v9, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (v15 && v20)
    {
      objc_msgSend(v15, "size");
      v22 = v21;
      objc_msgSend(v15, "size");
      v24 = v23;
      objc_msgSend(v15, "size");
      UIGraphicsBeginImageContext(v30);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v26 = a5;
      objc_msgSend(v25, "_solveForInput:", v26);
      v28 = v27;
      objc_msgSend(v15, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v22, v24, 1.0);
      objc_msgSend(v20, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v22, v24, v28);
      UIGraphicsGetImageFromCurrentImageContext();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      -[BSUIVibrancyLUT setInterpolatedLutImage:](self, "setInterpolatedLutImage:", v10);

    }
  }

  return v10;
}

- (NSString)groupName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyWithLuminanceReduced:(BOOL)a3
{
  int v3;
  NSString *v5;
  NSString *lutIdentifier;
  int v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  NSString *toIdentifier;
  int v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  uint64_t v18;
  BSUIVibrancyLUT *v19;
  void *v20;
  BSUIVibrancyLUT *v21;

  v3 = a3;
  v5 = self->_lutIdentifier;
  lutIdentifier = self->_lutIdentifier;
  if (lutIdentifier)
  {
    v7 = -[NSString hasPrefix:](lutIdentifier, "hasPrefix:", CFSTR("luminance_reduced_"));
    if (v7 != v3)
    {
      v8 = self->_lutIdentifier;
      if (v7)
      {
        -[NSString substringFromIndex:](v8, "substringFromIndex:", objc_msgSend(CFSTR("luminance_reduced_"), "length"));
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = v8;
      }
      v10 = v9;
      BSLutIdentifierForName(v9, v3);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (NSString *)v11;
    }
  }
  v12 = self->_toIdentifier;
  toIdentifier = self->_toIdentifier;
  if (toIdentifier)
  {
    v14 = -[NSString hasPrefix:](toIdentifier, "hasPrefix:", CFSTR("luminance_reduced_"));
    if (v14 != v3)
    {
      v15 = self->_toIdentifier;
      if (v14)
      {
        -[NSString substringFromIndex:](v15, "substringFromIndex:", objc_msgSend(CFSTR("luminance_reduced_"), "length"));
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = v15;
      }
      v17 = v16;
      BSLutIdentifierForName(v16, v3);
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (NSString *)v18;
    }
  }
  v19 = [BSUIVibrancyLUT alloc];
  -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyLUT blend](self, "blend");
  v21 = -[BSUIVibrancyLUT initWithIdentifier:bundleURL:blend:toIdentifier:](v19, "initWithIdentifier:bundleURL:blend:toIdentifier:", v5, v20, v12);

  return v21;
}

- (id)copyWithBlend:(double)a3 toIdentifier:(id)a4
{
  id v6;
  BSUIVibrancyLUT *v7;
  void *v8;
  void *v9;
  BSUIVibrancyLUT *v10;

  v6 = a4;
  v7 = [BSUIVibrancyLUT alloc];
  -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BSUIVibrancyLUT initWithIdentifier:bundleURL:blend:toIdentifier:](v7, "initWithIdentifier:bundleURL:blend:toIdentifier:", v8, v9, v6, a3);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  BSUIVibrancyLUT *v4;
  BSUIVibrancyLUT *v5;
  BSUIVibrancyLUT *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (BSUIVibrancyLUT *)a3;
  v5 = v4;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
    -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyLUT lutIdentifier](v6, "lutIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

    if (!v11)
      goto LABEL_8;
    -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyLUT bundleURL](v6, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSEqualObjects();

    if (!v14)
      goto LABEL_8;
    -[BSUIVibrancyLUT blend](self, "blend");
    -[BSUIVibrancyLUT blend](v6, "blend");
    if (!BSFloatEqualToFloat())
      goto LABEL_8;
    -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyLUT toIdentifier](v6, "toIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSEqualObjects();

    if (v17)
    {
      -[BSUIVibrancyLUT interpolatedLutImage](self, "interpolatedLutImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIVibrancyLUT interpolatedLutImage](v6, "interpolatedLutImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = BSEqualObjects();

    }
    else
    {
LABEL_8:
      v20 = 0;
    }

  }
  return v20;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  double blend;
  void *v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", self->_lutIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_bundleURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  blend = self->_blend;
  *(float *)&blend = blend;
  objc_msgSend(v5, "appendFloat:", blend);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", self->_toIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BSUIVibrancyLUT initWithIdentifier:bundleURL:blend:toIdentifier:]([BSUIVibrancyLUT alloc], "initWithIdentifier:bundleURL:blend:toIdentifier:", self->_lutIdentifier, self->_bundleURL, self->_toIdentifier, self->_blend);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("lutIdentifier"));

  -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("bundleURL"));

  -[BSUIVibrancyLUT blend](self, "blend");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("blend"));
  -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("toIdentifier"));

}

- (BSUIVibrancyLUT)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  BSUIVibrancyLUT *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lutIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("blend"));
  v8 = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BSUIVibrancyLUT initWithIdentifier:bundleURL:blend:toIdentifier:](self, "initWithIdentifier:bundleURL:blend:toIdentifier:", v5, v6, v9, v8);

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("lutIdentifier"));

  -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("bundleURL"));

  -[BSUIVibrancyLUT blend](self, "blend");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("blend"));
  -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("toIdentifier"));

}

- (BSUIVibrancyLUT)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  BSUIVibrancyLUT *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lutIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("blend"));
  v8 = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BSUIVibrancyLUT initWithIdentifier:bundleURL:blend:toIdentifier:](self, "initWithIdentifier:bundleURL:blend:toIdentifier:", v5, v6, v9, v8);

  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  -[BSUIVibrancyLUT lutIdentifier](self, "lutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v4, CFSTR("lutIdentifier"));

  -[BSUIVibrancyLUT bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v9, "appendObject:withName:", v5, CFSTR("bundleURL"));

  -[BSUIVibrancyLUT blend](self, "blend");
  v7 = (id)objc_msgSend(v9, "appendFloat:withName:", CFSTR("blend"));
  -[BSUIVibrancyLUT toIdentifier](self, "toIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v8, CFSTR("toIdentifier"));

}

- (NSString)lutIdentifier
{
  return self->_lutIdentifier;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (double)blend
{
  return self->_blend;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)interpolatedLutImage
{
  return (UIImage *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInterpolatedLutImage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedLutImage, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_lutIdentifier, 0);
}

@end

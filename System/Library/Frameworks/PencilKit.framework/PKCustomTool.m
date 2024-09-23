@implementation PKCustomTool

- (PKCustomTool)initWithCustomIdentifier:(id)a3 configuration:(id)a4 color:(id)a5 weight:(double)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  int v14;
  double v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PKCustomTool *v20;
  uint64_t v21;
  NSString *customIdentifier;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  id v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v11, "supportsColor");
  if (v12 && (v13 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("Color must be nil if tool does not support color.");
    goto LABEL_21;
  }
  v14 = objc_msgSend(v11, "supportsColor");
  if (!v12 && v14)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("Color must not be nil if tool supports color.");
    goto LABEL_21;
  }
  if (objc_msgSend(v11, "supportsColor"))
  {
    if ((objc_msgSend(v11, "supportsOpacity") & 1) == 0)
    {
      objc_msgSend(v12, "alphaComponent");
      if (v15 != 1.0 && fabs(v15 + -1.0) >= 0.000000999999997)
      {
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = CFSTR("Color must be opaque if tool does not support opacity.");
LABEL_21:
        objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, v26, 0);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v27);
      }
    }
  }
  v16 = objc_msgSend(v11, "supportsStrokeWeight");
  if (a6 != 0.0 && (v16 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("Weight must be 0 if tool does not support weight.");
    goto LABEL_21;
  }
  if (v12 && (objc_msgSend(v11, "supportsColor") & 1) != 0)
  {
    v17 = objc_msgSend(v12, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", CFSTR("com.apple.ink.custom"), v17, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PKCustomTool;
  v20 = -[PKTool _initWithInk:configuration:](&v28, sel__initWithInk_configuration_, v19, v11);

  if (v20)
  {
    v21 = objc_msgSend(v10, "copy");
    customIdentifier = v20->_customIdentifier;
    v20->_customIdentifier = (NSString *)v21;

  }
  return v20;
}

- (PKToolConfiguration)customConfigurationCopy
{
  void *v2;
  void *v3;

  -[PKTool _configuration](self, "_configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (PKToolConfiguration *)v3;
}

- (UIColor)color
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;

  -[PKTool _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsColor");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should not attempt to access color on a tool that does not support it."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  -[PKTool ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return (UIColor *)v7;
}

- (double)weight
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  id v9;

  -[PKTool _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsStrokeWeight");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should not attempt to access weight on a tool that does not support it."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  -[PKTool ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "weight");
  v7 = v6;

  return v7;
}

- (double)_width
{
  void *v3;
  int v4;
  double result;

  -[PKTool _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsStrokeWeight");

  if (!v4)
    return 0.0;
  -[PKCustomTool weight](self, "weight");
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PKCustomTool *v4;
  PKCustomTool *v5;
  PKCustomTool *v6;
  NSString *customIdentifier;
  unint64_t v8;
  NSString *v9;
  void *v10;
  BOOL v11;
  char v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unint64_t v16;
  objc_super v18;

  v4 = (PKCustomTool *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18.receiver = self;
        v18.super_class = (Class)PKCustomTool;
        if (-[PKTool isEqual:](&v18, sel_isEqual_, v5))
        {
          v6 = v5;
          customIdentifier = v6->_customIdentifier;
          v8 = self->_customIdentifier;
          v9 = customIdentifier;
          if ((NSString *)v8 == v9)
          {

          }
          else
          {
            v10 = v9;
            if (v8)
              v11 = v9 == 0;
            else
              v11 = 1;
            if (v11)
            {
              v12 = 0;
LABEL_22:

LABEL_23:
              goto LABEL_24;
            }
            v13 = objc_msgSend((id)v8, "isEqualToString:", v9);

            if (!v13)
            {
              v12 = 0;
              goto LABEL_23;
            }
          }
          -[PKTool _configuration](self, "_configuration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTool _configuration](v6, "_configuration");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v14;
          v16 = v15;
          v10 = (void *)v16;
          if (v8 | v16)
          {
            v12 = 0;
            if (v8 && v16)
              v12 = objc_msgSend((id)v8, "isEqual:", v16);
          }
          else
          {
            v12 = 1;
          }

          goto LABEL_22;
        }
      }
    }
    v12 = 0;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKCustomTool;
  v3 = -[PKTool hash](&v8, sel_hash);
  v4 = -[NSString hash](self->_customIdentifier, "hash");
  -[PKTool _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v3 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (id)copyWithColor:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  PKCustomTool *v8;
  NSString *customIdentifier;
  void *v10;
  PKCustomTool *v11;

  v4 = a3;
  -[PKTool _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (objc_msgSend(v5, "supportsStrokeWeight"))
  {
    -[PKCustomTool weight](self, "weight");
    v6 = v7;
  }

  v8 = [PKCustomTool alloc];
  customIdentifier = self->_customIdentifier;
  -[PKTool _configuration](self, "_configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKCustomTool initWithCustomIdentifier:configuration:color:weight:](v8, "initWithCustomIdentifier:configuration:color:weight:", customIdentifier, v10, v4, v6);

  return v11;
}

- (id)copyWithScrubbedColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  double v13;

  v4 = a3;
  -[PKTool _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsColor"))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  -[PKTool _configuration](self, "_configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "supportsColor"))
  {
    -[PKTool _configuration](self, "_configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "supportsOpacity") || (objc_msgSend(v7, "alphaComponent"), v10 == 1.0))
    {

    }
    else
    {
      v13 = fabs(v10 + -1.0);

      if (v13 < 0.000000999999997)
        goto LABEL_9;
      objc_msgSend(v7, "colorWithAlphaComponent:", 1.0);
      v8 = v7;
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_9:
  v11 = -[PKCustomTool copyWithColor:](self, "copyWithColor:", v7);

  return v11;
}

- (id)copyWithWeight:(double)a3
{
  void *v5;
  void *v6;
  PKCustomTool *v7;
  NSString *customIdentifier;
  void *v9;
  PKCustomTool *v10;

  -[PKTool _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsColor"))
  {
    -[PKCustomTool color](self, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  v7 = [PKCustomTool alloc];
  customIdentifier = self->_customIdentifier;
  -[PKTool _configuration](self, "_configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKCustomTool initWithCustomIdentifier:configuration:color:weight:](v7, "initWithCustomIdentifier:configuration:color:weight:", customIdentifier, v9, v6, a3);

  return v10;
}

- (id)copyWithScrubbedWeight:(double)a3
{
  void *v5;

  -[PKTool _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "supportsStrokeWeight"))
    a3 = 0.0;

  return -[PKCustomTool copyWithWeight:](self, "copyWithWeight:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSString *customIdentifier;
  void *v12;
  void *v13;

  -[PKTool _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsColor"))
  {
    -[PKCustomTool color](self, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  -[PKTool _configuration](self, "_configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (objc_msgSend(v7, "supportsStrokeWeight"))
  {
    -[PKCustomTool weight](self, "weight");
    v8 = v9;
  }

  v10 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  customIdentifier = self->_customIdentifier;
  -[PKTool _configuration](self, "_configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithCustomIdentifier:configuration:color:weight:", customIdentifier, v12, v6, v8);

  return v13;
}

- (BOOL)_isInkingTool
{
  return -[PKTool _supportsColor](self, "_supportsColor")
      || -[PKTool _supportsStrokeWeight](self, "_supportsStrokeWeight");
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIdentifier, 0);
}

@end

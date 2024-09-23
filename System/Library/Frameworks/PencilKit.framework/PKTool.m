@implementation PKTool

- (id)_initWithInk:(id)a3
{
  id v5;
  PKTool *v6;
  PKTool *v7;
  __CFString **v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *p_super;
  uint64_t v20;
  PKToolConfiguration *configuration;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKTool;
  v6 = -[PKTool init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ink, a3);
    if (objc_msgSend(v5, "_isMonolineInk"))
    {
      v8 = PKInkIdentifierMonoline;
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("com.apple.ink.fountainpen");
      v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ink.fountainpen"));

      if (v12)
        goto LABEL_8;
      objc_msgSend(v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("com.apple.ink.watercolor");
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ink.watercolor"));

      if (v14
        || (objc_msgSend(v5, "identifier"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = CFSTR("com.apple.ink.crayon"),
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ink.crayon")),
            v15,
            v16))
      {
LABEL_8:
        v9 = v11;
        goto LABEL_9;
      }
      if (objc_msgSend(v5, "_isPencilInk"))
      {
        v8 = PKInkIdentifierPencil;
      }
      else
      {
        if (objc_msgSend(v5, "_isEraserInk"))
        {
          objc_msgSend(v5, "identifier");
          p_super = objc_claimAutoreleasedReturnValue();
          +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", p_super);
          v20 = objc_claimAutoreleasedReturnValue();
          configuration = v7->_configuration;
          v7->_configuration = (PKToolConfiguration *)v20;

          goto LABEL_10;
        }
        if (objc_msgSend(v5, "_isMarkerInk"))
        {
          v8 = PKInkIdentifierMarker;
        }
        else if (objc_msgSend(v5, "_isPenInk"))
        {
          v8 = PKInkIdentifierPen;
        }
        else if (objc_msgSend(v5, "_isHandwritingInk"))
        {
          v8 = PKInkIdentifierHandwriting;
        }
        else
        {
          if (!objc_msgSend(v5, "_isLassoInk"))
          {
            p_super = os_log_create("com.apple.pencilkit", ");
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v5, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138477827;
              v25 = v22;
              _os_log_error_impl(&dword_1BE213000, p_super, OS_LOG_TYPE_ERROR, "Unable to create configuration for ink with id: %{private}@", buf, 0xCu);

            }
            goto LABEL_10;
          }
          v8 = PKInkIdentifierLasso;
        }
      }
    }
    v9 = *v8;
LABEL_9:
    +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", v9);
    v17 = objc_claimAutoreleasedReturnValue();
    p_super = &v7->_configuration->super;
    v7->_configuration = (PKToolConfiguration *)v17;
LABEL_10:

  }
  return v7;
}

- (id)_initWithInk:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  PKTool *v9;
  PKTool *v10;
  uint64_t v11;
  PKToolConfiguration *configuration;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKTool;
  v9 = -[PKTool init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ink, a3);
    v11 = objc_msgSend(v8, "copy");
    configuration = v10->_configuration;
    v10->_configuration = (PKToolConfiguration *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKTool ink](self, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    v8 = v4;
    objc_msgSend(v8, "_configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      if ((v7 & 1) == 0)
      {
        v10 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      -[PKTool _configuration](self, "_configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v10 = 0;
      else
        v10 = v7;
      if (!v11 || ((v7 ^ 1) & 1) != 0)
        goto LABEL_12;
    }
    -[PKTool _configuration](self, "_configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqual:", v13);

    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKTool ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)_inkIsInkingTool:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.lasso")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ink.objectEraser")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ink.eraser")) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v3, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ink.generationtool"));

      }
    }

  }
  return v5 ^ 1;
}

+ (id)_toolWithInk:(id)a3
{
  return +[PKTool _toolWithInk:configuration:](PKTool, "_toolWithInk:configuration:", a3, 0);
}

+ (id)_toolWithInk:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  __objc2_class *v9;
  void *v10;
  int v11;
  PKHandwritingTool *v12;
  void *v13;
  void *v14;
  int v15;
  PKHandwritingTool *v16;
  void *v18;
  int v19;
  void *v20;
  int v21;
  id v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ink.lasso"));

  if (v8)
  {
    v9 = PKLassoTool;
LABEL_9:
    v12 = (PKHandwritingTool *)objc_msgSend([v9 alloc], "_initWithInk:", v5);
    goto LABEL_10;
  }
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ink.handwriting"));

  if (v11)
  {
    v12 = objc_alloc_init(PKHandwritingTool);
    goto LABEL_10;
  }
  objc_msgSend(v5, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ink.eraser")))
  {

LABEL_8:
    v9 = PKEraserTool;
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ink.objectEraser"));

  if (v15)
    goto LABEL_8;
  objc_msgSend(v5, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.ink.generationtool"));

  if (v19)
  {
    v9 = PKGenerationTool;
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.ink.custom"));

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unable to create a custom tool using the -_toolWithInk: method."), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v12 = -[PKTool _initWithInk:configuration:]([PKInkingTool alloc], "_initWithInk:configuration:", v5, v6);
LABEL_10:
  v16 = v12;

  return v16;
}

+ (id)_toolWithTool:(id)a3 color:(id)a4 ignoringOpacity:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "ink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = __const_DKUColorGetAlpha_rgba;
  v20 = unk_1BE4FE3C0;
  DKUColorGetRGBAComponents((CGColor *)objc_msgSend(v10, "CGColor"), &v19);
  v11 = *((double *)&v20 + 1);

  v12 = 1.0;
  if (!v5)
    v12 = v11;
  objc_msgSend(v7, "colorWithAlphaComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKTool _toolWithInk:configuration:](PKTool, "_toolWithInk:configuration:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_isHandwritingTool
{
  return 0;
}

- (BOOL)_isInkingTool
{
  return 0;
}

- (BOOL)_isLassoTool
{
  _BYTE *v2;
  BOOL v3;

  -[PKTool _configuration](self, "_configuration");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[18] != 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)_isEraserTool
{
  return 0;
}

- (BOOL)_isRulerTool
{
  return 0;
}

- (BOOL)_supportsStrokeWeight
{
  void *v3;
  char v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 1;
  -[PKTool customConfigurationCopy](self, "customConfigurationCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsStrokeWeight");

  return v4;
}

- (double)_width
{
  return 0.0;
}

- (double)_strokeWeight
{
  PKTool *v3;
  void *v4;
  double v5;
  double v6;
  PKTool *v7;
  double v8;
  double v9;
  double v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self;
    -[PKTool customConfigurationCopy](v3, "customConfigurationCopy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "supportsStrokeWeight") & 1) != 0)
    {
      -[PKTool weight](v3, "weight");
      v6 = v5;

    }
    else
    {

      v6 = 2.22507386e-308;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 2.22507386e-308;
    v7 = self;
    -[PKTool width](v7, "width");
    v9 = v8;
    -[PKTool inkType](v7, "inkType");
    v3 = (PKTool *)objc_claimAutoreleasedReturnValue();

    +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", v3, v9);
    v6 = v10;
  }

  return v6;
}

- (BOOL)_supportsColor
{
  void *v3;
  char v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 1;
  -[PKTool customConfigurationCopy](self, "customConfigurationCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsColor");

  return v4;
}

- (id)_color
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PKTool color](self, "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setToolPickerItemIdentifier:(id)a3
{
  NSString *v4;
  NSString *toolPickerItemIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  toolPickerItemIdentifier = self->_toolPickerItemIdentifier;
  self->_toolPickerItemIdentifier = v4;

}

- (NSString)_toolPickerItemIdentifier
{
  NSString *toolPickerItemIdentifier;

  toolPickerItemIdentifier = self->_toolPickerItemIdentifier;
  if (toolPickerItemIdentifier)
    return toolPickerItemIdentifier;
  -[PKTool _defaultItemIdentifier](self, "_defaultItemIdentifier");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultItemIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (Class)_toolPickerItemClass
{
  return 0;
}

- (id)_toolPickerItem
{
  objc_class *v3;

  v3 = -[PKTool _toolPickerItemClass](self, "_toolPickerItemClass");
  if (v3)
    v3 = (objc_class *)objc_msgSend([v3 alloc], "initWithTool:", self);
  return v3;
}

- (id)_copyWithStrokeWeight:(double)a3
{
  PKTool *v5;
  void *v6;
  uint64_t v7;
  PKTool *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self;
    -[PKTool customConfigurationCopy](v5, "customConfigurationCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "supportsStrokeWeight"))
    {
      v10 = 0;
      goto LABEL_8;
    }
    v7 = -[PKTool copyWithWeight:](v5, "copyWithWeight:", a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v8 = self;
    -[PKTool ink](v8, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk inkFromInk:weight:](PKInk, "inkFromInk:weight:", v9, a3);
    v5 = (PKTool *)objc_claimAutoreleasedReturnValue();

    -[PKTool _configuration](v8, "_configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKTool _toolWithInk:configuration:](PKTool, "_toolWithInk:configuration:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
LABEL_8:

  return v10;
}

- (id)_copyWithColor:(id)a3
{
  id v4;
  PKTool *v5;
  void *v6;
  uint64_t v7;
  PKTool *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self;
    -[PKTool customConfigurationCopy](v5, "customConfigurationCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "supportsColor"))
    {
      v10 = 0;
      goto LABEL_8;
    }
    v7 = -[PKTool copyWithColor:](v5, "copyWithColor:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v8 = self;
    -[PKTool ink](v8, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v9, v4);
    v5 = (PKTool *)objc_claimAutoreleasedReturnValue();

    -[PKTool _configuration](v8, "_configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKTool _toolWithInk:configuration:](PKTool, "_toolWithInk:configuration:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
LABEL_8:

LABEL_10:
  return v10;
}

- (PKToolConfiguration)_configuration
{
  return self->_configuration;
}

- (PKInk)ink
{
  return self->_ink;
}

- (id)_barButtonItemsProvider
{
  return self->__barButtonItemsProvider;
}

- (void)_setBarButtonItemsProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__barButtonItemsProvider, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_toolPickerItemIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

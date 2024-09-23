@implementation IFGraphicSymbolDescriptor

+ (id)overrides
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  if (overrides_onceToken != -1)
    dispatch_once(&overrides_onceToken, &__block_literal_global_84);
  objc_msgSend((id)overrides_cache, "objectForKey:", CFSTR("overrides"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", overrides_overridesURL, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (!v4)
    {
      IFDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[IFGraphicSymbolDescriptor overrides].cold.1(v5, v6);

    }
    objc_msgSend(v4, "_IF_dictionaryForKey:", CFSTR("symbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v4, "_IF_numberForKey:", CFSTR("version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("ISVersionKey"));

    v10 = v8;
    v3 = v10;
    if (v10)
    {
      v11 = (void *)overrides_cache;
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("overrides"));

    }
  }

  return v3;
}

void __38__IFGraphicSymbolDescriptor_overrides__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)overrides_cache;
  overrides_cache = (uint64_t)v0;

  +[IFBundle coreGlyphsPrivateBundle](IFBundle, "coreGlyphsPrivateBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v3);
    -[NSObject URLForResource:withExtension:](v4, "URLForResource:withExtension:", CFSTR("container_recipes"), CFSTR("plist"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)overrides_overridesURL;
    overrides_overridesURL = v5;

  }
  else
  {
    IFDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __38__IFGraphicSymbolDescriptor_overrides__block_invoke_cold_1(v4);
  }

}

- (IFGraphicSymbolDescriptor)init
{
  IFGraphicSymbolDescriptor *v2;
  IFGraphicSymbolDescriptor *v3;
  void *v4;
  NSString *name;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IFGraphicSymbolDescriptor;
  v2 = -[IFSymbolImageDescriptor init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_size = (CGSize)vdupq_n_s64(0x4040000000000000uLL);
    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_shape = objc_msgSend(v4, "shape");

    v3->_appearance = 0;
    v3->_contrast = 0;
    v3->_vibrancy = 0;
    name = v3->_name;
    v3->_name = 0;

    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_fill = objc_msgSend(v6, "fill");

    -[IFSymbolImageDescriptor setPointSize:](v3, "setPointSize:", 0.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _OWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IFGraphicSymbolDescriptor;
  v4 = -[IFSymbolImageDescriptor copyWithZone:](&v12, sel_copyWithZone_, a3);
  v4[14] = self->_size;
  v5 = -[NSArray copy](self->_enclosureColors, "copy");
  v6 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v5;

  v7 = -[NSArray copy](self->_symbolColors, "copy");
  v8 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v7;

  *((_QWORD *)v4 + 9) = self->_renderingMode;
  v9 = -[NSString copy](self->_name, "copy");
  v10 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v9;

  *((_QWORD *)v4 + 11) = self->_appearance;
  *((_QWORD *)v4 + 12) = self->_contrast;
  *((_QWORD *)v4 + 13) = self->_vibrancy;
  v4[15] = self->_symbolOffset;
  *((_QWORD *)v4 + 14) = self->_symbolEffect;
  *((_QWORD *)v4 + 15) = self->_enclosureEffect;
  *((_QWORD *)v4 + 16) = self->_shape;
  *((_QWORD *)v4 + 17) = self->_fill;
  *((_BYTE *)v4 + 48) = self->_debugColourSet;
  return v4;
}

- (BOOL)_isDebugGraphicIconColourEnabled
{
  if (_isDebugGraphicIconColourEnabled_once != -1)
    dispatch_once(&_isDebugGraphicIconColourEnabled_once, &__block_literal_global_98);
  return _isDebugGraphicIconColourEnabled_result;
}

void __61__IFGraphicSymbolDescriptor__isDebugGraphicIconColourEnabled__block_invoke()
{
  void *v0;
  int v1;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ISDebugGraphicIcons"));

    if (v1)
      _isDebugGraphicIconColourEnabled_result = 1;
  }
}

- (id)_debugDynamicGraphicIconColor
{
  if (_debugDynamicGraphicIconColor_once != -1)
    dispatch_once(&_debugDynamicGraphicIconColor_once, &__block_literal_global_103);
  return (id)_debugDynamicGraphicIconColor_color;
}

void __58__IFGraphicSymbolDescriptor__debugDynamicGraphicIconColor__block_invoke()
{
  IFColor *v0;
  void *v1;

  v0 = -[IFColor initWithRed:green:blue:alpha:]([IFColor alloc], "initWithRed:green:blue:alpha:", 225.0, 225.0, 230.0, 255.0);
  v1 = (void *)_debugDynamicGraphicIconColor_color;
  _debugDynamicGraphicIconColor_color = (uint64_t)v0;

}

- (id)_colorForIFSystemColor:(int64_t)a3
{
  return -[IFColor initWithSystemColor:appearance:contrast:vibrancy:]([IFColor alloc], "initWithSystemColor:appearance:contrast:vibrancy:", a3, -[IFGraphicSymbolDescriptor appearance](self, "appearance"), -[IFGraphicSymbolDescriptor contrast](self, "contrast"), -[IFGraphicSymbolDescriptor vibrancy](self, "vibrancy"));
}

- (id)_resolvedColorsForColors:(id)a3 defaultColor:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v22;
    *(_QWORD *)&v10 = 138412290;
    v19 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[IFGraphicSymbolDescriptor _colorForIFSystemColor:](self, "_colorForIFSystemColor:", (int)objc_msgSend(v14, "intValue"));
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            IFDefaultLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v19;
              v26 = v14;
              _os_log_debug_impl(&dword_1D4106000, v16, OS_LOG_TYPE_DEBUG, "Unexpected color %@", buf, 0xCu);
            }

            v6[2](v6);
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        v17 = v15;
        objc_msgSend(v7, "addObject:", v15, v19);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v11);
  }

  return v7;
}

- (id)_defaultSymbolColor
{
  NSArray *enclosureColors;
  void *v4;
  uint64_t v5;
  void *v6;

  enclosureColors = self->_enclosureColors;
  if (enclosureColors && -[NSArray count](enclosureColors, "count"))
  {
    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "symbolColorAlternate");
  }
  else
  {
    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "symbolColor");
  }
  -[IFGraphicSymbolDescriptor _colorForIFSystemColor:](self, "_colorForIFSystemColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_defaultEnclosureColor
{
  NSArray *symbolColors;
  void *v4;
  uint64_t v5;
  void *v6;

  symbolColors = self->_symbolColors;
  if (symbolColors && -[NSArray count](symbolColors, "count"))
  {
    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enclosureColorAlternate");
  }
  else
  {
    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enclosureColor");
  }
  -[IFGraphicSymbolDescriptor _colorForIFSystemColor:](self, "_colorForIFSystemColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)resolvedSymbolColors
{
  NSArray *symbolColors;
  NSArray *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  symbolColors = self->_symbolColors;
  if (symbolColors && -[NSArray count](symbolColors, "count"))
  {
    v4 = self->_symbolColors;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__IFGraphicSymbolDescriptor_resolvedSymbolColors__block_invoke;
    v8[3] = &unk_1E9768648;
    v8[4] = self;
    -[IFGraphicSymbolDescriptor _resolvedColorsForColors:defaultColor:](self, "_resolvedColorsForColors:defaultColor:", v4, v8);
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IFGraphicSymbolDescriptor _defaultSymbolColor](self, "_defaultSymbolColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v7;
  }
}

uint64_t __49__IFGraphicSymbolDescriptor_resolvedSymbolColors__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_defaultSymbolColor");
}

- (NSArray)resolvedEnclosureColors
{
  uint64_t v3;
  void *v4;
  void *v5;
  void **v6;
  NSArray *enclosureColors;
  NSArray *v8;
  void *v10;
  _QWORD v11[5];
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[IFGraphicSymbolDescriptor _isDebugGraphicIconColourEnabled](self, "_isDebugGraphicIconColourEnabled")
    && !-[IFGraphicSymbolDescriptor debugColourSet](self, "debugColourSet")
    && (-[IFGraphicSymbolDescriptor _debugDynamicGraphicIconColor](self, "_debugDynamicGraphicIconColor"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v13[0] = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (void **)v13;
  }
  else
  {
    enclosureColors = self->_enclosureColors;
    if (enclosureColors && -[NSArray count](enclosureColors, "count"))
    {
      v8 = self->_enclosureColors;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __52__IFGraphicSymbolDescriptor_resolvedEnclosureColors__block_invoke;
      v11[3] = &unk_1E9768648;
      v11[4] = self;
      -[IFGraphicSymbolDescriptor _resolvedColorsForColors:defaultColor:](self, "_resolvedColorsForColors:defaultColor:", v8, v11);
      return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
    }
    -[IFGraphicSymbolDescriptor _defaultEnclosureColor](self, "_defaultEnclosureColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v12;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

uint64_t __52__IFGraphicSymbolDescriptor_resolvedEnclosureColors__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_defaultEnclosureColor");
}

- (int64_t)resolvedRenderingModeFromSuggestedMode:(int64_t)a3
{
  int64_t v4;

  v4 = -[IFGraphicSymbolDescriptor renderingMode](self, "renderingMode");
  if ((unint64_t)(v4 - 2) < 3)
    return qword_1D4139788[v4 - 2];
  if ((unint64_t)(a3 - 1) >= 3)
    return 1;
  return a3;
}

- (int64_t)resolvedShape
{
  int64_t v2;

  v2 = -[IFGraphicSymbolDescriptor shape](self, "shape");
  if (v2 == 3)
    return 2;
  else
    return v2 == 2;
}

- (int64_t)resolvedFill
{
  int64_t v2;

  v2 = -[IFGraphicSymbolDescriptor fill](self, "fill");
  if (v2 == 2)
    return 1;
  else
    return 2 * (v2 == 3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  -[IFGraphicSymbolDescriptor determineSymbolOverrides](self, "determineSymbolOverrides");
}

- (NSString)resolvedName
{
  NSString *resolvedName;

  resolvedName = self->_resolvedName;
  if (resolvedName)
    return resolvedName;
  -[IFGraphicSymbolDescriptor name](self, "name");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_addLightModeBorder
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (-[IFGraphicSymbolDescriptor fill](self, "fill") != 1
    || -[IFGraphicSymbolDescriptor appearance](self, "appearance"))
  {
    return 0;
  }
  -[IFGraphicSymbolDescriptor resolvedEnclosureColors](self, "resolvedEnclosureColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IFColor white](IFColor, "white");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (BOOL)_addDarkModeBorder
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (-[IFGraphicSymbolDescriptor fill](self, "fill") != 1
    || -[IFGraphicSymbolDescriptor appearance](self, "appearance") != 1)
  {
    return 0;
  }
  -[IFGraphicSymbolDescriptor resolvedEnclosureColors](self, "resolvedEnclosureColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IFColor black](IFColor, "black");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (double)resolvedBorderWidth
{
  void *v3;
  double v4;
  double v5;

  if (!-[IFGraphicSymbolDescriptor _addLightModeBorder](self, "_addLightModeBorder")
    && !-[IFGraphicSymbolDescriptor _addDarkModeBorder](self, "_addDarkModeBorder"))
  {
    return 0.0;
  }
  +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "borderWidth");
  v5 = v4;

  return v5;
}

- (IFColor)resolvedBorderColor
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[IFGraphicSymbolDescriptor _addLightModeBorder](self, "_addLightModeBorder"))
  {
    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "borderColorLightMode");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[IFGraphicSymbolDescriptor _addDarkModeBorder](self, "_addDarkModeBorder"))
    {
      v5 = 0;
      return (IFColor *)v5;
    }
    +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "borderColorDarkMode");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return (IFColor *)v5;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
  -[IFGraphicSymbolDescriptor determineSymbolOverrides](self, "determineSymbolOverrides");
}

- (void)determineSymbolOverrides
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D4106000, v0, v1, "Unknown override version: %@", v2);
  OUTLINED_FUNCTION_4();
}

uint64_t __53__IFGraphicSymbolDescriptor_determineSymbolOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (NSDictionary)symbolOverrides
{
  NSDictionary *symbolOverrides;

  symbolOverrides = self->_symbolOverrides;
  if (!symbolOverrides)
  {
    -[IFGraphicSymbolDescriptor determineSymbolOverrides](self, "determineSymbolOverrides");
    symbolOverrides = self->_symbolOverrides;
  }
  return symbolOverrides;
}

- (id)_overridesShapeStringForShape
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[IFGraphicSymbolDescriptor shape](self, "shape");
  v3 = CFSTR("rounded_rect");
  if (v2 == 3)
    v3 = CFSTR("capsule");
  if (v2 == 2)
    return CFSTR("circle");
  else
    return (id)v3;
}

- (double)_overridesPointSizeToShapeMultiplier
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  double result;

  -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_IF_stringForKey:", CFSTR("pointsize_to_shape_mul"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  result = v5;
  if (v5 == 0.0)
    return 1.0;
  return result;
}

- (double)pointSize
{
  void *v3;
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  objc_super v17;
  objc_super v18;

  -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_IF_stringForKey:", CFSTR("pointsize_to_shape_mul"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    IFDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[IFGraphicSymbolDescriptor pointSize].cold.1(self);

    -[IFGraphicSymbolDescriptor size](self, "size");
    v7 = v6;
    -[IFGraphicSymbolDescriptor _overridesPointSizeToShapeMultiplier](self, "_overridesPointSizeToShapeMultiplier");
    return v7 / v8;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)IFGraphicSymbolDescriptor;
    -[IFSymbolImageDescriptor pointSize](&v18, sel_pointSize);
    if (v10 >= 1.0)
    {
      v17.receiver = self;
      v17.super_class = (Class)IFGraphicSymbolDescriptor;
      -[IFSymbolImageDescriptor pointSize](&v17, sel_pointSize);
      return v15;
    }
    else
    {
      -[IFGraphicSymbolDescriptor size](self, "size");
      v12 = v11;
      +[IFGraphicSymbolDefaults sharedInstance](IFGraphicSymbolDefaults, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "enclosureSizeMultiplier");
      v9 = v12 / v14;

    }
  }
  return v9;
}

- (unint64_t)symbolSize
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_IF_stringForKey:", CFSTR("symbol_size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    IFDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[IFGraphicSymbolDescriptor symbolSize].cold.1(self);

    -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_IF_stringForKey:", CFSTR("symbol_size"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Small")))
    {
      if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Medium")))
      {
        v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Large"));

        if (!v8)
          return 3;
        goto LABEL_7;
      }
      v9 = 2;
    }
    else
    {
      v9 = 1;
    }

    return v9;
  }
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)IFGraphicSymbolDescriptor;
  return -[IFSymbolImageDescriptor symbolSize](&v11, sel_symbolSize);
}

- (int64_t)symbolWeight
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  objc_super v11;

  -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_IF_stringForKey:", CFSTR("symbol_weight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    IFDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[IFGraphicSymbolDescriptor symbolWeight].cold.1(self);

    -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_IF_stringForKey:", CFSTR("symbol_weight"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Ultralight")))
    {
      if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Thin")))
      {
        if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Light")))
        {
          if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Regular")))
          {
            if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Medium")))
            {
              if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Semibold")))
              {
                if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Bold")))
                {
                  if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Heavy")))
                  {
                    v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("Black"));

                    if (!v8)
                      return 9;
                    goto LABEL_13;
                  }
                  v9 = 8;
                }
                else
                {
                  v9 = 7;
                }
              }
              else
              {
                v9 = 6;
              }
            }
            else
            {
              v9 = 5;
            }
          }
          else
          {
            v9 = 4;
          }
        }
        else
        {
          v9 = 3;
        }
      }
      else
      {
        v9 = 2;
      }
    }
    else
    {
      v9 = 1;
    }

    return v9;
  }
LABEL_13:
  v11.receiver = self;
  v11.super_class = (Class)IFGraphicSymbolDescriptor;
  return -[IFSymbolImageDescriptor symbolWeight](&v11, sel_symbolWeight);
}

- (CGSize)symbolOffset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  double height;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  double width;
  double v26;
  CGSize result;

  -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_IF_stringForKey:", CFSTR("x_offset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_IF_stringForKey:", CFSTR("y_offset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      width = self->_symbolOffset.width;
      height = self->_symbolOffset.height;
      goto LABEL_18;
    }
  }
  IFDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[IFGraphicSymbolDescriptor symbolOffset].cold.3(self);

  -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_IF_stringForKey:", CFSTR("x_offset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;
  v12 = v10;

  -[IFGraphicSymbolDescriptor symbolOverrides](self, "symbolOverrides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_IF_stringForKey:", CFSTR("y_offset"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  if (v11 < -0.5 || v11 > 0.5)
  {
    IFDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[IFGraphicSymbolDescriptor symbolOffset].cold.1(v17, v12, v18, v19);

    v12 = 0.0;
  }
  height = v16;
  if (v16 < -0.5 || v16 > 0.5)
  {
    IFDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[IFGraphicSymbolDescriptor symbolOffset].cold.1(v21, v16, v22, v23);

    height = 0.0;
  }
  v24 = -[IFGraphicSymbolDescriptor flipXOffsetOverride](self, "flipXOffsetOverride");
  width = -v12;
  if (!v24)
    width = v12;
LABEL_18:
  v26 = height;
  result.height = v26;
  result.width = width;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)IFGraphicSymbolDescriptor;
  -[IFGraphicSymbolDescriptor description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFGraphicSymbolDescriptor size](self, "size");
  v6 = v5;
  -[IFGraphicSymbolDescriptor size](self, "size");
  v8 = v7;
  -[IFSymbolImageDescriptor scale](self, "scale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - (%0.2f, %0.2f)@%.0fx"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)enclosureColors
{
  return self->_enclosureColors;
}

- (void)setEnclosureColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)symbolColors
{
  return self->_symbolColors;
}

- (void)setSymbolColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (int64_t)contrast
{
  return self->_contrast;
}

- (void)setContrast:(int64_t)a3
{
  self->_contrast = a3;
}

- (int64_t)vibrancy
{
  return self->_vibrancy;
}

- (void)setVibrancy:(int64_t)a3
{
  self->_vibrancy = a3;
}

- (void)setSymbolOffset:(CGSize)a3
{
  self->_symbolOffset = a3;
}

- (int64_t)symbolEffect
{
  return self->_symbolEffect;
}

- (void)setSymbolEffect:(int64_t)a3
{
  self->_symbolEffect = a3;
}

- (int64_t)enclosureEffect
{
  return self->_enclosureEffect;
}

- (void)setEnclosureEffect:(int64_t)a3
{
  self->_enclosureEffect = a3;
}

- (BOOL)debugColourSet
{
  return self->_debugColourSet;
}

- (void)setDebugColourSet:(BOOL)a3
{
  self->_debugColourSet = a3;
}

- (int64_t)shape
{
  return self->_shape;
}

- (void)setShape:(int64_t)a3
{
  self->_shape = a3;
}

- (int64_t)fill
{
  return self->_fill;
}

- (void)setFill:(int64_t)a3
{
  self->_fill = a3;
}

- (void)setResolvedShape:(int64_t)a3
{
  self->_resolvedShape = a3;
}

- (void)setResolvedSymbolEffect:(int64_t)a3
{
  self->_resolvedSymbolEffect = a3;
}

- (void)setResolvedEnclosureEffect:(int64_t)a3
{
  self->_resolvedEnclosureEffect = a3;
}

- (void)setResolvedFill:(int64_t)a3
{
  self->_resolvedFill = a3;
}

- (void)setResolvedSymbolColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setResolvedEnclosureColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setResolvedBorderWidth:(double)a3
{
  self->_resolvedBorderWidth = a3;
}

- (void)setResolvedBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedBorderColor, a3);
}

- (void)setSymbolOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)flipXOffsetOverride
{
  return self->_flipXOffsetOverride;
}

- (void)setFlipXOffsetOverride:(BOOL)a3
{
  self->_flipXOffsetOverride = a3;
}

- (void)setResolvedName:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedName, 0);
  objc_storeStrong((id *)&self->_symbolOverrides, 0);
  objc_storeStrong((id *)&self->_resolvedBorderColor, 0);
  objc_storeStrong((id *)&self->_resolvedEnclosureColors, 0);
  objc_storeStrong((id *)&self->_resolvedSymbolColors, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_symbolColors, 0);
  objc_storeStrong((id *)&self->_enclosureColors, 0);
}

+ (void)overrides
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D4106000, a2, v4, "Failed to collect graphic variant overrides info. Error: %@", v5);

  OUTLINED_FUNCTION_2();
}

void __38__IFGraphicSymbolDescriptor_overrides__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D4106000, log, OS_LOG_TYPE_ERROR, "Failed to collect graphic variant info. CoreGlyphsPrivateBundle does not exist.", v1, 2u);
}

- (void)pointSize
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D4106000, v2, v3, "Found point size override for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)symbolSize
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D4106000, v2, v3, "Found symbol size override for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)symbolWeight
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D4106000, v2, v3, "Found symbol weight override for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)symbolOffset
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D4106000, v2, v3, "Found offset override for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end

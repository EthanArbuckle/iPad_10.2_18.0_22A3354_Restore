@implementation CEKSmartStyle

- (CEKSmartStyle)initWithPresetType:(int64_t)a3 castIntensity:(double)a4 toneBias:(double)a5 colorBias:(double)a6
{
  CEKSmartStyle *v7;
  uint64_t v8;
  char v9;
  void *v10;
  int64_t v11;
  double *v12;
  double *v13;
  CEKSmartStyle *v14;
  objc_super v16;
  double v17;
  double v18;
  double v19;

  v18 = a5;
  v19 = a4;
  v17 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CEKSmartStyle;
  v7 = -[CEKSmartStyle init](&v16, sel_init);
  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "castTypeForPresetType:", a3);
    v9 = objc_msgSend((id)objc_opt_class(), "isCustomizablePresetType:", a3);
    v10 = (void *)objc_opt_class();
    if ((v9 & 1) != 0)
    {
      if ((objc_msgSend(v10, "canCustomizeCastIntensityForCastType:", v8) & 1) != 0)
      {
LABEL_7:
        v7->_presetType = a3;
        v7->_castType = v8;
        v7->_castIntensity = CEKClamp(v19, 0.0, 1.0);
        v7->_toneBias = CEKClamp(v18, -1.0, 1.0);
        v7->_colorBias = CEKClamp(v17, -1.0, 1.0);
        v14 = v7;
        goto LABEL_8;
      }
      v10 = (void *)objc_opt_class();
      v11 = a3;
      v12 = 0;
      v13 = 0;
    }
    else
    {
      v12 = &v18;
      v13 = &v17;
      v11 = a3;
    }
    objc_msgSend(v10, "_getPresetValuesForPresetType:castIntensity:toneBias:colorBias:", v11, &v19, v12, v13);
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (CEKSmartStyle)initWithPresetType:(int64_t)a3
{
  double v6;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  v6 = 0.0;
  objc_msgSend((id)objc_opt_class(), "_getPresetValuesForPresetType:castIntensity:toneBias:colorBias:", a3, &v8, &v7, &v6);
  return -[CEKSmartStyle initWithPresetType:castIntensity:toneBias:colorBias:](self, "initWithPresetType:castIntensity:toneBias:colorBias:", a3, v8, v7, v6);
}

+ (CEKSmartStyle)identityStyle
{
  if (identityStyle_onceToken != -1)
    dispatch_once(&identityStyle_onceToken, &__block_literal_global_6);
  return (CEKSmartStyle *)(id)identityStyle_style;
}

void __30__CEKSmartStyle_identityStyle__block_invoke()
{
  CEKSmartStyle *v0;
  void *v1;

  v0 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", 1);
  v1 = (void *)identityStyle_style;
  identityStyle_style = (uint64_t)v0;

}

+ (CEKSmartStyle)systemStyle
{
  if (systemStyle_onceToken != -1)
    dispatch_once(&systemStyle_onceToken, &__block_literal_global_50);
  return (CEKSmartStyle *)(id)systemStyle_style;
}

void __28__CEKSmartStyle_systemStyle__block_invoke()
{
  CEKSmartStyle *v0;
  void *v1;

  v0 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", 0);
  v1 = (void *)systemStyle_style;
  systemStyle_style = (uint64_t)v0;

}

+ (int64_t)castTypeForPresetType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 0xE)
    return 0;
  else
    return a3 - 1;
}

+ (BOOL)canCustomizeCastIntensityForCastType:(int64_t)a3
{
  return a3 != 0;
}

+ (id)persistenceStringForPresetType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xF)
    return 0;
  else
    return off_1E70A5648[a3];
}

+ (int64_t)presetTypeFromPersistenceString:(id)a3 success:(BOOL *)a4
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  int64_t v8;

  v5 = objc_msgSend(a1, "_indexForPresetString:", a3);
  v6 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(&unk_1E70B4650, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (!a4)
      return v8;
    goto LABEL_5;
  }
  v8 = 1;
  if (a4)
LABEL_5:
    *a4 = v6;
  return v8;
}

+ (void)_getPresetValuesForPresetType:(int64_t)a3 castIntensity:(double *)a4 toneBias:(double *)a5 colorBias:(double *)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  float v13;
  float v14;
  float v15;

  if ((unint64_t)a3 > 0xF)
    v10 = 0;
  else
    v10 = **((id **)&unk_1E70A5548 + a3);
  objc_msgSend(MEMORY[0x1E0D08AD0], "defaultStyleForCastType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CEKSmartStyle _getPresetValuesForPresetType:castIntensity:toneBias:colorBias:].cold.1(a3, v12);

  }
  if (a4)
  {
    objc_msgSend(v11, "castIntensity");
    *a4 = v13;
  }
  if (a5)
  {
    objc_msgSend(v11, "toneBias");
    *a5 = v14;
  }
  if (a6)
  {
    objc_msgSend(v11, "colorBias");
    *a6 = v15;
  }

}

+ (id)defaultStylesIncludingSystemStyles:(BOOL)a3 systemStylePlaceholder:(BOOL)a4 creativeStyles:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CEKSmartStyle *v13;
  CEKSmartStyle *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CEKSmartStyle *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = objc_msgSend(&unk_1E70B4668, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(&unk_1E70B4668);
          v13 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "integerValue"));
          objc_msgSend(v8, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(&unk_1E70B4668, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }
  }
  if (v6)
  {
    v14 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", 0);
    objc_msgSend(v8, "addObject:", v14);

  }
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = objc_msgSend(&unk_1E70B4680, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(&unk_1E70B4680);
          v19 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "integerValue"));
          objc_msgSend(v8, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(&unk_1E70B4680, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }
  }
  return v8;
}

- (NSString)description
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = -[CEKSmartStyle isCustomized](self, "isCustomized");
  v4 = (void *)MEMORY[0x1E0CB3940];
  CEKDebugStringForSmartStylePresetType(-[CEKSmartStyle presetType](self, "presetType"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    CEKDebugStringForSmartStyleCastType(-[CEKSmartStyle castType](self, "castType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSmartStyle castIntensity](self, "castIntensity");
    v9 = v8;
    -[CEKSmartStyle toneBias](self, "toneBias");
    v11 = v10;
    -[CEKSmartStyle colorBias](self, "colorBias");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("SmartStyle(Preset:%@, Cast:%@, Intensity:%.2f, Tone:%.2f, Color:%.2f)"), v6, v7, v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("SmartStyle(Preset:%@)"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[CEKSmartStyle isEqualToSmartStyle:](self, "isEqualToSmartStyle:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToSmartStyle:(id)a3
{
  CEKSmartStyle *v4;
  CEKSmartStyle *v5;
  int64_t v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v4 = (CEKSmartStyle *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (v4 == self)
  {
    v17 = 1;
    goto LABEL_10;
  }
  v6 = -[CEKSmartStyle presetType](self, "presetType");
  if (v6 != -[CEKSmartStyle presetType](v5, "presetType"))
    goto LABEL_8;
  v7 = -[CEKSmartStyle castType](self, "castType");
  if (v7 == -[CEKSmartStyle castType](v5, "castType")
    && (-[CEKSmartStyle castIntensity](self, "castIntensity"),
        v9 = v8,
        -[CEKSmartStyle castIntensity](v5, "castIntensity"),
        vabdd_f64(v9, v10) < 0.005)
    && (-[CEKSmartStyle toneBias](self, "toneBias"),
        v12 = v11,
        -[CEKSmartStyle toneBias](v5, "toneBias"),
        vabdd_f64(v12, v13) < 0.005))
  {
    -[CEKSmartStyle colorBias](self, "colorBias");
    v15 = v14;
    -[CEKSmartStyle colorBias](v5, "colorBias");
    v17 = vabdd_f64(v15, v16) < 0.005;
  }
  else
  {
LABEL_8:
    v17 = 0;
  }
LABEL_10:

  return v17;
}

- (BOOL)isNeutral
{
  double v3;
  double v4;

  if (-[CEKSmartStyle castType](self, "castType"))
    return 0;
  -[CEKSmartStyle toneBias](self, "toneBias");
  if (fabs(v3) >= 0.005)
    return 0;
  -[CEKSmartStyle colorBias](self, "colorBias");
  return fabs(v4) < 0.005;
}

- (BOOL)isCustomizable
{
  return objc_msgSend((id)objc_opt_class(), "isCustomizablePresetType:", -[CEKSmartStyle presetType](self, "presetType"));
}

+ (BOOL)isCustomizablePresetType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0xF;
}

- (BOOL)isCustomized
{
  CEKSmartStyle *v2;
  CEKSmartStyle *v3;

  v2 = self;
  v3 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", -[CEKSmartStyle presetType](self, "presetType"));
  LOBYTE(v2) = !-[CEKSmartStyle isEqualToSmartStyle:](v2, "isEqualToSmartStyle:", v3);

  return (char)v2;
}

- (NSString)presetDisplayName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "displayNameForPresetType:", -[CEKSmartStyle presetType](self, "presetType"));
}

+ (id)displayNameForPresetType:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)a3 > 0xF)
    v3 = 0;
  else
    v3 = off_1E70A55C8[a3];
  return CEKLocalizedFrameworkString(v3, 0);
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v16;
  double v17;
  double v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0.0;
  v18 = 0.0;
  v16 = 0.0;
  objc_msgSend((id)objc_opt_class(), "_getPresetValuesForPresetType:castIntensity:toneBias:colorBias:", -[CEKSmartStyle presetType](self, "presetType"), &v18, &v17, &v16);
  v4 = -[CEKSmartStyle presetType](self, "presetType");
  v5 = 0;
  if (v4 <= 0xF)
    v5 = off_1E70A5648[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PresetType"));
  -[CEKSmartStyle castIntensity](self, "castIntensity");
  if (v6 != v18)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[CEKSmartStyle castIntensity](self, "castIntensity");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("CastIntensity"));

  }
  -[CEKSmartStyle toneBias](self, "toneBias");
  if (v9 != v17)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[CEKSmartStyle toneBias](self, "toneBias");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ToneBias"));

  }
  -[CEKSmartStyle colorBias](self, "colorBias");
  if (v12 != v16)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[CEKSmartStyle colorBias](self, "colorBias");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ColorBias"));

  }
  return (NSDictionary *)v3;
}

+ (CEKSmartStyle)styleWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  double v27;
  void *v28;
  void *v29;
  CEKSmartStyle *v30;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PresetType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CastIntensity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ToneBias"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ColorBias"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (uint64_t *)MEMORY[0x1E0CB2D50];
  if (v6)
    goto LABEL_27;
  v28 = (void *)MEMORY[0x1E0CB35C8];
  v40 = *MEMORY[0x1E0CB2D50];
  v41[0] = CFSTR("Unexpected CEKSmartStyle dictionary structure, missing required keys");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("CEKSmartStyleErrorDomain"), -1, v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_27:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || !v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || !v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || !v9)
            goto LABEL_10;
        }
      }
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *v10;
    v39 = CFSTR("Unexpected CEKSmartStyle dictionary structure, incorrect type for values of known keys");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CEKSmartStyleErrorDomain"), -2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_10:
      v14 = objc_msgSend(a1, "_indexForPresetString:", v6);
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_12;
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *v10;
      v37 = CFSTR("Unexpected CEKSmartStyle dictionary structure, incorrect value for PresetTypeKey: no preset match found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CEKSmartStyleErrorDomain"), -2, v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_12:
        objc_msgSend(&unk_1E70B4650, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "integerValue");

        v19 = v7;
        v20 = v8;
        v21 = v9;
        v34 = 0.0;
        v35 = 0.0;
        v33 = 0.0;
        objc_msgSend(a1, "_getPresetValuesForPresetType:castIntensity:toneBias:colorBias:", v18, &v35, &v34, &v33);
        if (v19)
        {
          objc_msgSend(v19, "floatValue");
          v23 = v22;
          if (v20)
            goto LABEL_14;
        }
        else
        {
          v23 = v35;
          if (v20)
          {
LABEL_14:
            objc_msgSend(v20, "floatValue");
            v25 = v24;
            if (v21)
            {
LABEL_15:
              objc_msgSend(v21, "floatValue");
              v27 = v26;
              goto LABEL_23;
            }
LABEL_22:
            v27 = v33;
LABEL_23:
            v30 = -[CEKSmartStyle initWithPresetType:castIntensity:toneBias:colorBias:]([CEKSmartStyle alloc], "initWithPresetType:castIntensity:toneBias:colorBias:", v18, v23, v25, v27);

            v13 = 0;
            if (!a4)
              goto LABEL_19;
            goto LABEL_18;
          }
        }
        v25 = v34;
        if (v21)
          goto LABEL_15;
        goto LABEL_22;
      }
    }
  }
  v30 = 0;
  if (a4)
LABEL_18:
    *a4 = objc_retainAutorelease(v13);
LABEL_19:

  return v30;
}

+ (unint64_t)_indexForPresetString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (v3)
  {
    if (_indexForPresetString__onceToken != -1)
      dispatch_once(&_indexForPresetString__onceToken, &__block_literal_global_100);
    objc_msgSend((id)_indexForPresetString__indexesByString, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "unsignedIntegerValue");
    else
      v6 = 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

void __39__CEKSmartStyle__indexForPresetString___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(&unk_1E70B4650, "count"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__CEKSmartStyle__indexForPresetString___block_invoke_2;
  v4[3] = &unk_1E70A54B0;
  v1 = v0;
  v5 = v1;
  objc_msgSend(&unk_1E70B4650, "enumerateObjectsUsingBlock:", v4);
  v2 = (void *)_indexForPresetString__indexesByString;
  _indexForPresetString__indexesByString = (uint64_t)v1;
  v3 = v1;

}

void __39__CEKSmartStyle__indexForPresetString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  __CFString *v6;
  id v7;

  v5 = objc_msgSend(a2, "integerValue");
  if (v5 > 0xF)
    v6 = 0;
  else
    v6 = off_1E70A5648[v5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (NSDictionary)analyticsDictionaryForCapture
{
  return (NSDictionary *)-[CEKSmartStyle _analyticsDictionaryForCapture:](self, "_analyticsDictionaryForCapture:", 1);
}

- (NSDictionary)analyticsDictionaryForPreferences
{
  return (NSDictionary *)-[CEKSmartStyle _analyticsDictionaryForCapture:](self, "_analyticsDictionaryForCapture:", 0);
}

- (id)_analyticsDictionaryForCapture:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
    v6 = CFSTR("smartStylePreset");
  else
    v6 = CFSTR("SmartStylePreset");
  if (v3)
    v7 = CFSTR("smartStyleCastIntensity");
  else
    v7 = CFSTR("SmartStyleCastIntensity");
  if (v3)
    v8 = CFSTR("smartStyleToneBias");
  else
    v8 = CFSTR("SmartStyleToneBias");
  if (v3)
    v9 = CFSTR("smartStyleColorBias");
  else
    v9 = CFSTR("SmartStyleColorBias");
  v10 = CFSTR("SmartStyleCustomized");
  if (v3)
    v10 = CFSTR("smartStyleCustomized");
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  v15 = v6;
  v16 = -[CEKSmartStyle presetType](self, "presetType");
  if (v16 > 0xF)
    v17 = 0;
  else
    v17 = off_1E70A5648[v16];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v15);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[CEKSmartStyle castIntensity](self, "castIntensity");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v14);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[CEKSmartStyle toneBias](self, "toneBias");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, v13);

  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[CEKSmartStyle colorBias](self, "colorBias");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CEKSmartStyle isCustomized](self, "isCustomized"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, v11);

  return v5;
}

- (int64_t)presetType
{
  return self->_presetType;
}

- (int64_t)castType
{
  return self->_castType;
}

- (double)castIntensity
{
  return self->_castIntensity;
}

- (double)toneBias
{
  return self->_toneBias;
}

- (double)colorBias
{
  return self->_colorBias;
}

+ (void)_getPresetValuesForPresetType:(unint64_t)a1 castIntensity:(NSObject *)a2 toneBias:colorBias:.cold.1(unint64_t a1, NSObject *a2)
{
  __CFString *v2;
  int v3;
  __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a1 > 0xF)
    v2 = 0;
  else
    v2 = off_1E70A5648[a1];
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B9835000, a2, OS_LOG_TYPE_ERROR, "Failed to get defaults for SmartStyle preset type %{public}@", (uint8_t *)&v3, 0xCu);
}

@end

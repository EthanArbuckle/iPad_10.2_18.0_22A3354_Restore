@implementation CAMSemanticStyle

- (CAMSemanticStyle)initWithPresetType:(int64_t)a3 sceneBias:(double)a4 warmthBias:(double)a5
{
  CAMSemanticStyle *v6;
  double v7;
  double v8;
  CAMSemanticStyle *v9;
  objc_super v11;
  double v12;
  double v13;

  v12 = a5;
  v13 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CAMSemanticStyle;
  v6 = -[CAMSemanticStyle init](&v11, sel_init);
  if (v6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isCustomizablePresetType:", a3) & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "getSceneBias:warmthBias:forPresetType:", &v13, &v12, a3);
    CEKClamp();
    v6->_sceneBias = v7;
    CEKClamp();
    v6->_warmthBias = v8;
    v6->_presetType = a3;
    v9 = v6;
  }

  return v6;
}

- (CAMSemanticStyle)initWithPresetType:(int64_t)a3
{
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend((id)objc_opt_class(), "getSceneBias:warmthBias:forPresetType:", &v7, &v6, a3);
  return -[CAMSemanticStyle initWithPresetType:sceneBias:warmthBias:](self, "initWithPresetType:sceneBias:warmthBias:", a3, v7, v6);
}

+ (CAMSemanticStyle)standardStyle
{
  if (standardStyle_onceToken != -1)
    dispatch_once(&standardStyle_onceToken, &__block_literal_global_20);
  return (CAMSemanticStyle *)(id)standardStyle_style;
}

void __33__CAMSemanticStyle_standardStyle__block_invoke()
{
  CAMSemanticStyle *v0;
  void *v1;

  v0 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 0);
  v1 = (void *)standardStyle_style;
  standardStyle_style = (uint64_t)v0;

}

+ (void)getSceneBias:(double *)a3 warmthBias:(double *)a4 forPresetType:(int64_t)a5
{
  uint64_t v5;

  if ((unint64_t)a5 <= 4)
  {
    v5 = qword_1DB9A5938[a5];
    *a3 = dbl_1DB9A5910[a5];
    *(_QWORD *)a4 = v5;
  }
}

+ (id)persistenceStringForPresetType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1EA32BCE8[a3];
}

+ (CAMSemanticStyle)styleWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString **v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  CAMSemanticStyle *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  float v30;
  double v31;
  float v32;
  id v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMSemanticStylePresetTypeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMSemanticStyleSceneBiasKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CAMSemanticStyleWarmthBiasKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !v8 || !v9)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("Unexpected CAMSemanticStyle dictionary structure, missing required keys");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("CAMSemanticStyleErrorDomain"), -1, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v11 = v7;
  else
    v11 = 0;
  v12 = v11;
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();
  if ((v13 & 1) != 0)
    v14 = v8;
  else
    v14 = 0;
  v34 = v14;
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();
  if ((v15 & 1) != 0)
    v16 = v9;
  else
    v16 = 0;
  v17 = v16;
  if ((isKindOfClass & 1) != 0 && (v13 & 1) != 0 && (v15 & 1) != 0)
  {
    v18 = objc_msgSend(a1, "_indexForPresetString:", v12);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(&unk_1EA3B3428, "objectAtIndexedSubscript:", v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");

      v27 = v34;
      objc_msgSend(v34, "floatValue");
      v31 = v30;
      objc_msgSend(v17, "floatValue");
      v25 = -[CAMSemanticStyle initWithPresetType:sceneBias:warmthBias:]([CAMSemanticStyle alloc], "initWithPresetType:sceneBias:warmthBias:", v29, v31, v32);
      v24 = 0;
      goto LABEL_22;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("Unexpected CAMSemanticStyle dictionary structure, incorrect value for CAMSemanticStylePresetTypeKey: no preset match found");
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = (const __CFString **)v41;
    v22 = &v40;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Unexpected CAMSemanticStyle dictionary structure, incorrect type for values of known keys");
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = &v39;
    v22 = &v38;
  }
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1, v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("CAMSemanticStyleErrorDomain"), -2, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v27 = v35;
LABEL_22:

LABEL_23:
  if (a4)
    *a4 = objc_retainAutorelease(v24);

  return v25;
}

+ (unint64_t)_indexForPresetString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CAMSemanticStyle__indexForPresetString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_indexForPresetString__onceToken != -1)
    dispatch_once(&_indexForPresetString__onceToken, block);
  objc_msgSend((id)_indexForPresetString__indexesByPresetString, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

void __42__CAMSemanticStyle__indexForPresetString___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(&unk_1EA3B3428, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CAMSemanticStyle__indexForPresetString___block_invoke_2;
  v6[3] = &unk_1EA32BCC8;
  v8 = *(_QWORD *)(a1 + 32);
  v3 = v2;
  v7 = v3;
  objc_msgSend(&unk_1EA3B3428, "enumerateObjectsUsingBlock:", v6);
  v4 = (void *)_indexForPresetString__indexesByPresetString;
  _indexForPresetString__indexesByPresetString = (uint64_t)v3;
  v5 = v3;

}

void __42__CAMSemanticStyle__indexForPresetString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "persistenceStringForPresetType:", objc_msgSend(a2, "integerValue"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

+ (id)defaultStyles
{
  CAMSemanticStyle *v2;
  CAMSemanticStyle *v3;
  CAMSemanticStyle *v4;
  CAMSemanticStyle *v5;
  CAMSemanticStyle *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 0);
  v3 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 2, v2);
  v9[1] = v3;
  v4 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 1);
  v9[2] = v4;
  v5 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 3);
  v9[3] = v5;
  v6 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 4);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isNeutral
{
  double v3;
  double v4;

  -[CAMSemanticStyle sceneBias](self, "sceneBias");
  if (fabs(v3) >= 0.005)
    return 0;
  -[CAMSemanticStyle warmthBias](self, "warmthBias");
  return fabs(v4) < 0.005;
}

- (BOOL)isCustomizable
{
  return objc_msgSend((id)objc_opt_class(), "isCustomizablePresetType:", -[CAMSemanticStyle presetType](self, "presetType"));
}

+ (BOOL)isCustomizablePresetType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4;
}

- (BOOL)isCustomized
{
  CAMSemanticStyle *v2;
  CAMSemanticStyle *v3;

  v2 = self;
  v3 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", -[CAMSemanticStyle presetType](self, "presetType"));
  LOBYTE(v2) = !-[CAMSemanticStyle isEqualToSemanticStyle:](v2, "isEqualToSemanticStyle:", v3);

  return (char)v2;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMSemanticStyle persistenceStringForPresetType:](CAMSemanticStyle, "persistenceStringForPresetType:", -[CAMSemanticStyle presetType](self, "presetType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CAMSemanticStylePresetTypeKey"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMSemanticStyle sceneBias](self, "sceneBias");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CAMSemanticStyleSceneBiasKey"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMSemanticStyle warmthBias](self, "warmthBias");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("CAMSemanticStyleWarmthBiasKey"));

  return (NSDictionary *)v3;
}

- (NSString)displayName
{
  -[CAMSemanticStyle makerPreset](self, "makerPreset");
  return (NSString *)CEKDisplayStringForSemanticStyleMakerPreset();
}

- (NSString)presetDisplayName
{
  double v4;
  double v5;

  v4 = 0.0;
  v5 = 0.0;
  objc_msgSend((id)objc_opt_class(), "getSceneBias:warmthBias:forPresetType:", &v5, &v4, -[CAMSemanticStyle presetType](self, "presetType"));
  -[CAMSemanticStyle _makerPresetWithSceneBias:warmthBias:](self, "_makerPresetWithSceneBias:warmthBias:", v5, v4);
  CEKDisplayStringForSemanticStyleMakerPreset();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)makerPreset
{
  double v3;
  double v4;
  double v5;

  -[CAMSemanticStyle sceneBias](self, "sceneBias");
  v4 = v3;
  -[CAMSemanticStyle warmthBias](self, "warmthBias");
  return -[CAMSemanticStyle _makerPresetWithSceneBias:warmthBias:](self, "_makerPresetWithSceneBias:warmthBias:", v4, v5);
}

- (int64_t)_makerPresetWithSceneBias:(double)a3 warmthBias:(double)a4
{
  BOOL v5;
  int64_t v6;
  int64_t v7;

  if (a3 < -0.005)
  {
    if (a4 < -0.005)
      return 9;
    v5 = a4 <= 0.005;
    v6 = 3;
    v7 = 8;
LABEL_11:
    if (v5)
      return v6;
    else
      return v7;
  }
  if (a3 > 0.005)
  {
    if (a4 < -0.005)
      return 7;
    v5 = a4 <= 0.005;
    v6 = 2;
    v7 = 6;
    goto LABEL_11;
  }
  if (a4 >= -0.005)
    return 4 * (a4 > 0.005);
  else
    return 5;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CAMSemanticStyle presetType](self, "presetType");
  if (v4 > 4)
    v5 = 0;
  else
    v5 = off_1EA32BCE8[v4];
  -[CAMSemanticStyle sceneBias](self, "sceneBias");
  v7 = v6;
  -[CAMSemanticStyle warmthBias](self, "warmthBias");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("SemanticStyle(Preset: %@, Scn: %.01f, Wrm: %.01f)"), v5, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[CAMSemanticStyle isEqualToSemanticStyle:](self, "isEqualToSemanticStyle:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToSemanticStyle:(id)a3
{
  CAMSemanticStyle *v4;
  CAMSemanticStyle *v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = (CAMSemanticStyle *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (v4 == self)
  {
    v13 = 1;
    goto LABEL_8;
  }
  v6 = -[CAMSemanticStyle presetType](self, "presetType");
  if (v6 == -[CAMSemanticStyle presetType](v5, "presetType")
    && (-[CAMSemanticStyle sceneBias](self, "sceneBias"),
        v8 = v7,
        -[CAMSemanticStyle sceneBias](v5, "sceneBias"),
        vabdd_f64(v8, v9) < 0.005))
  {
    -[CAMSemanticStyle warmthBias](self, "warmthBias");
    v11 = v10;
    -[CAMSemanticStyle warmthBias](v5, "warmthBias");
    v13 = vabdd_f64(v11, v12) < 0.005;
  }
  else
  {
LABEL_6:
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (AVSemanticStyle)avSemanticStyle
{
  void *v3;
  double v4;
  float v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x1E0C8B398];
  -[CAMSemanticStyle sceneBias](self, "sceneBias");
  v5 = v4;
  -[CAMSemanticStyle warmthBias](self, "warmthBias");
  *(float *)&v7 = v6;
  *(float *)&v6 = v5;
  return (AVSemanticStyle *)objc_msgSend(v3, "semanticStyleWithToneBias:warmthBias:", v6, v7);
}

- (NSDictionary)analyticsDictionaryForCapture
{
  return (NSDictionary *)-[CAMSemanticStyle _analyticsDictionaryForCapture:](self, "_analyticsDictionaryForCapture:", 1);
}

- (NSDictionary)analyticsDictionaryForPreferences
{
  return (NSDictionary *)-[CAMSemanticStyle _analyticsDictionaryForCapture:](self, "_analyticsDictionaryForCapture:", 0);
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
  unint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
    v6 = CFSTR("semanticStylePreset");
  else
    v6 = CFSTR("SemanticStylePreset");
  if (v3)
    v7 = CFSTR("semanticStyleToneBias");
  else
    v7 = CFSTR("SemanticStyleToneBias");
  if (v3)
    v8 = CFSTR("semanticStyleWarmthBias");
  else
    v8 = CFSTR("SemanticStyleWarmthBias");
  v9 = CFSTR("SemanticStyleCustomized");
  if (v3)
    v9 = CFSTR("semanticStyleCustomized");
  v10 = v9;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  v14 = -[CAMSemanticStyle presetType](self, "presetType");
  if (v14 > 4)
    v15 = 0;
  else
    v15 = off_1EA32BD10[v14];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v13);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMSemanticStyle sceneBias](self, "sceneBias");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v12);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMSemanticStyle warmthBias](self, "warmthBias");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMSemanticStyle isCustomized](self, "isCustomized"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v10);

  return v5;
}

- (double)sceneBias
{
  return self->_sceneBias;
}

- (double)warmthBias
{
  return self->_warmthBias;
}

- (int64_t)presetType
{
  return self->_presetType;
}

@end

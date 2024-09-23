@implementation NTKPhotoAnalysis

- (BOOL)isComplexBackground
{
  return self->_data.isComplexBackground;
}

- (BOOL)isColoredText
{
  return self->_data.isColoredText;
}

- (float)textHue
{
  return self->_data.textHue;
}

- (float)textSaturation
{
  return self->_data.textSaturation;
}

- (float)textBrightness
{
  return self->_data.textBrightness;
}

- (float)bgHue
{
  return self->_data.bgHue;
}

- (float)bgSaturation
{
  return self->_data.bgSaturation;
}

- (float)bgBrightness
{
  return self->_data.bgBrightness;
}

- (float)shadowHue
{
  return self->_data.shadowHue;
}

- (float)shadowSaturation
{
  return self->_data.shadowSaturation;
}

- (float)shadowBrightness
{
  return self->_data.shadowBrightness;
}

- ($BBBA91DF173D22D92F8479248DC92AE7)structure
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var5 = v3;
  *(_QWORD *)&retstr->var9 = *(_QWORD *)&self[1].var0;
  return self;
}

+ (BOOL)isValidDictionary:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(a1, "_dictionaryPassesBasicCheck:", v4))
    v5 = objc_msgSend(a1, "_dictionaryHasValidValues:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)_dictionaryPassesBasicCheck:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("version"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    v6 = (v5 & 0xFFFFFFFE) == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_dictionaryHasValidValues:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[13];

  v23[11] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23[0] = CFSTR("complexBackground");
  v23[1] = CFSTR("coloredText");
  v23[2] = CFSTR("textHue");
  v23[3] = CFSTR("textSaturation");
  v23[4] = CFSTR("textBrightness");
  v23[5] = CFSTR("bgHue");
  v23[6] = CFSTR("bgSaturation");
  v23[7] = CFSTR("bgBrightness");
  v23[8] = CFSTR("shadowHue");
  v23[9] = CFSTR("shadowSaturation");
  v23[10] = CFSTR("shadowBrightness");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || objc_msgSend(v14, "compare:", v6) == -1)
        {

LABEL_14:
          v16 = 0;
          goto LABEL_16;
        }
        v15 = objc_msgSend(v14, "compare:", v8);

        if (v15 == 1)
          goto LABEL_14;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 1;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_16:

  return v16;
}

- (NTKPhotoAnalysis)initWithCoder:(id)a3
{
  id v4;
  NTKPhotoAnalysis *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  NTKPhotoAnalysis *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKPhotoAnalysis;
  v5 = -[NTKPhotoAnalysis init](&v17, sel_init);
  if (v5 && objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version")) == 1)
  {
    v5->_version = 1;
    v5->_data.isComplexBackground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("complexBackground"));
    v5->_data.isColoredText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("coloredText"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("textHue"));
    v5->_data.textHue = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("textSaturation"));
    v5->_data.textSaturation = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("textBrightness"));
    v5->_data.textBrightness = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bgHue"));
    v5->_data.bgHue = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bgSaturation"));
    v5->_data.bgSaturation = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bgBrightness"));
    v5->_data.bgBrightness = v11;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shadowHue"));
    v5->_data.shadowHue = v12;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shadowSaturation"));
    v5->_data.shadowSaturation = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shadowBrightness"));
    v5->_data.shadowBrightness = v14;
    v15 = v5;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  NTKPhotoAnalysis *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  void *v22;
  float v23;
  void *v24;
  float v25;
  NTKPhotoAnalysis *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NTKPhotoAnalysis;
  v5 = -[NTKPhotoAnalysis init](&v28, sel_init);
  if (v5 && objc_msgSend((id)objc_opt_class(), "_dictionaryPassesBasicCheck:", v4))
  {
    v5->_version = 1;
    objc_msgSend(v4, "objectForKey:", CFSTR("complexBackground"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_data.isComplexBackground = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("coloredText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_data.isColoredText = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("textHue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_data.textHue = v9;

    objc_msgSend(v4, "objectForKey:", CFSTR("textSaturation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v5->_data.textSaturation = v11;

    objc_msgSend(v4, "objectForKey:", CFSTR("textBrightness"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v5->_data.textBrightness = v13;

    objc_msgSend(v4, "objectForKey:", CFSTR("bgHue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v5->_data.bgHue = v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("bgSaturation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v5->_data.bgSaturation = v17;

    objc_msgSend(v4, "objectForKey:", CFSTR("bgBrightness"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v5->_data.bgBrightness = v19;

    objc_msgSend(v4, "objectForKey:", CFSTR("shadowHue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v5->_data.shadowHue = v21;

    objc_msgSend(v4, "objectForKey:", CFSTR("shadowSaturation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v5->_data.shadowSaturation = v23;

    objc_msgSend(v4, "objectForKey:", CFSTR("shadowBrightness"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v5->_data.shadowBrightness = v25;

    v26 = v5;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NTKPhotoAnalysis)initWithStructure:(id *)a3
{
  char *v4;
  NTKPhotoAnalysis *v5;
  __int128 v6;
  __int128 v7;
  char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKPhotoAnalysis;
  v4 = -[NTKPhotoAnalysis init](&v10, sel_init);
  v5 = (NTKPhotoAnalysis *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0;
    v7 = *(_OWORD *)&a3->var5;
    *((_QWORD *)v4 + 5) = *(_QWORD *)&a3->var9;
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    *((_DWORD *)v4 + 12) = 1;
    v8 = v4;
  }

  return v5;
}

+ (id)defaultAnalysis
{
  _OWORD v3[2];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStructure:", v3);
}

+ (id)invalidAnalysis
{
  _OWORD v3[2];
  uint64_t v4;

  v3[0] = _NTKInvalidAnalysis;
  v3[1] = *(_OWORD *)algn_1B755EC1C;
  v4 = 0;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStructure:", v3);
}

+ (NTKPhotoAnalysis)analysisWithImage:(id)a3 alignment:(unint64_t)a4 deviceSizeClass:(unint64_t)a5
{
  id v7;
  CGImage *v8;
  size_t Width;
  size_t Height;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat x;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  _QWORD v31[4];
  _QWORD v32[2];
  CGRect v33;
  CGRect v34;

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v8 = (CGImage *)objc_msgSend(v7, "CGImage");
  Width = CGImageGetWidth(v8);
  Height = CGImageGetHeight(v8);
  v11 = CLKDeviceCategoryForSizeClass() - 1;
  if (v11 >= 5)
  {
    objc_msgSend(a1, "invalidAnalysis");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (double)Width;
    v13 = (double)Height;
    v14 = dbl_1B755EC38[v11];
    v15 = dbl_1B755EC88[v11];
    v16 = dbl_1B755ECB0[v11];
    v17 = dbl_1B755ECD8[v11];
    v18 = (double)Width / (double)Height;
    if (v18 > v17 / v14)
      v12 = v17 / v14 * (double)Height;
    else
      v13 = (double)Width / (v17 / v14);
    v27 = v12;
    v29 = v13;
    if (v18 > v17 / v14)
      v19 = 0.0;
    else
      v19 = ((double)Height - (double)Width / (v17 / v14)) * 0.5;
    if (v18 > v17 / v14)
      v20 = ((double)Width - v17 / v14 * (double)Height) * 0.5;
    else
      v20 = 0.0;
    v33.origin.x = 0.0;
    v33.origin.y = 0.0;
    v33.size.width = dbl_1B755ECD8[v11];
    v33.size.height = dbl_1B755EC38[v11];
    v34 = CGRectInset(v33, dbl_1B755EC60[v11], dbl_1B755EC60[v11]);
    x = v34.origin.x;
    v22 = v34.size.width;
    if (a4 == 1)
      v16 = CGRectGetMaxY(v34) - v15;
    *(CGFloat *)v31 = x;
    *(double *)&v31[1] = v16;
    *(CGFloat *)&v31[2] = v22;
    *(double *)&v31[3] = v15;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v31, "{CGRect={CGPoint=dd}{CGSize=dd}}", *(_QWORD *)&v27, *(_QWORD *)&v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NTKAnalyzePhoto(v7, v24, 0, v20, v19, v28, v30, v17, v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NTKPhotoAnalysis *)v25;
}

- (id)encodeAsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6C9F8E0, CFSTR("version"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_data.isComplexBackground);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("complexBackground"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_data.isColoredText);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coloredText"));

  *(float *)&v6 = self->_data.textHue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("textHue"));

  *(float *)&v8 = self->_data.textSaturation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("textSaturation"));

  *(float *)&v10 = self->_data.textBrightness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("textBrightness"));

  *(float *)&v12 = self->_data.bgHue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("bgHue"));

  *(float *)&v14 = self->_data.bgSaturation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("bgSaturation"));

  *(float *)&v16 = self->_data.bgBrightness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("bgBrightness"));

  *(float *)&v18 = self->_data.shadowHue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("shadowHue"));

  *(float *)&v20 = self->_data.shadowSaturation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("shadowSaturation"));

  *(float *)&v22 = self->_data.shadowBrightness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("shadowBrightness"));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeInt32:forKey:", 1, CFSTR("version"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_data.isComplexBackground, CFSTR("complexBackground"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_data.isColoredText, CFSTR("coloredText"));
  *(float *)&v4 = self->_data.textHue;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("textHue"), v4);
  *(float *)&v5 = self->_data.textSaturation;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("textSaturation"), v5);
  *(float *)&v6 = self->_data.textBrightness;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("textBrightness"), v6);
  *(float *)&v7 = self->_data.bgHue;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("bgHue"), v7);
  *(float *)&v8 = self->_data.bgSaturation;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("bgSaturation"), v8);
  *(float *)&v9 = self->_data.bgBrightness;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("bgBrightness"), v9);
  *(float *)&v10 = self->_data.shadowHue;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("shadowHue"), v10);
  *(float *)&v11 = self->_data.shadowSaturation;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("shadowSaturation"), v11);
  *(float *)&v12 = self->_data.shadowBrightness;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("shadowBrightness"), v12);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[2];
  uint64_t v8;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = *(_OWORD *)&self->_data.bgHue;
  v7[0] = *(_OWORD *)&self->_data.isComplexBackground;
  v7[1] = v5;
  v8 = *(_QWORD *)&self->_data.shadowSaturation;
  return (id)objc_msgSend(v4, "initWithStructure:", v7);
}

- (unsigned)version
{
  return self->_version;
}

@end

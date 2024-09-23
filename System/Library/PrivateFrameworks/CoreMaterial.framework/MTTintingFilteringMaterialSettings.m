@implementation MTTintingFilteringMaterialSettings

- (NSDictionary)curvesValues
{
  return self->_curvesValues;
}

- (void)_processMaterialFilteringDescription:(id)a3 defaultingToIdentity:(BOOL)a4 bundle:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  NSArray *v14;
  NSArray *luminanceValues;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  uint64_t v44;
  void *v45;
  __CFString *blurInputQuality;
  void *v47;
  void *v48;
  void *v49;
  NSString *v50;
  NSString *variableBlurInputMaskName;
  NSString *v52;
  NSDictionary *v53;
  NSDictionary *curvesValues;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("luminanceAmount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("luminanceAmount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = v11;
    objc_msgSend(v11, "floatValue");
    self->_luminanceAmount = v13;

    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("luminanceAmount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  objc_msgSend(v8, "objectForKey:", CFSTR("luminanceValues"));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  luminanceValues = v14;
  if (!v14)
  {
    luminanceValues = 0;
    if (!v6)
      luminanceValues = self->_luminanceValues;
  }
  objc_storeStrong((id *)&self->_luminanceValues, luminanceValues);

  objc_msgSend(v8, "objectForKey:", CFSTR("blurRadius"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("blurRadius"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("blurRadius"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  objc_msgSend(v17, "floatValue");
  self->_blurRadius = v19;

LABEL_14:
  objc_msgSend(v8, "objectForKey:", CFSTR("averageColorEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("averageColorEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("averageColorEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  self->_averageColorEnabled = objc_msgSend(v21, "BOOLValue");

LABEL_19:
  objc_msgSend(v8, "objectForKey:", CFSTR("saturation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("saturation"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
      goto LABEL_24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("saturation"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  objc_msgSend(v24, "floatValue");
  self->_saturation = v26;

LABEL_24:
  objc_msgSend(v8, "objectForKey:", CFSTR("brightness"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("brightness"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("brightness"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;
  objc_msgSend(v28, "floatValue");
  self->_brightness = v30;

LABEL_29:
  objc_msgSend(v8, "objectForKey:", CFSTR("colorMatrix"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("colorMatrix"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    MTCAColorMatrixMakeWithDictionaryRepresentation(v32, (uint64_t)&v55);
LABEL_31:
    v33 = v58;
    *(_OWORD *)&self->_colorMatrix.m24 = v57;
    *(_OWORD *)&self->_colorMatrix.m33 = v33;
    *(_OWORD *)&self->_colorMatrix.m42 = v59;
    v34 = v56;
    *(_OWORD *)&self->_colorMatrix.m11 = v55;
    *(_OWORD *)&self->_colorMatrix.m15 = v34;

    goto LABEL_32;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "mt_identityValueForFilter:", *MEMORY[0x1E0CD2BF0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v37;
    if (v37)
    {
      objc_msgSend(v37, "CAColorMatrixValue");
    }
    else
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v55 = 0u;
    }
    goto LABEL_31;
  }
LABEL_32:

  objc_msgSend(v8, "objectForKey:", CFSTR("zoom"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("zoom"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
      goto LABEL_40;
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("zoom"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v36;
  objc_msgSend(v36, "floatValue", v55, v56, v57, v58, v59);
  self->_zoom = v39;

LABEL_40:
  objc_msgSend(v8, "objectForKey:", CFSTR("backdropScale"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("backdropScale"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
    v42 = v41;
    objc_msgSend(v41, "floatValue", v55, v56, v57, v58, v59);
    self->_backdropScale = v43;

    goto LABEL_45;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("backdropScale"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
LABEL_45:

  objc_msgSend(v8, "objectForKey:", CFSTR("blurInputQuality"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44 || v6)
  {
    if (v44)
      blurInputQuality = (__CFString *)v44;
    else
      blurInputQuality = CFSTR("default");
  }
  else
  {
    blurInputQuality = (__CFString *)self->_blurInputQuality;
  }
  objc_storeStrong((id *)&self->_blurInputQuality, blurInputQuality);

  objc_msgSend(v8, "objectForKey:", CFSTR("blurAtEnd"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("blurAtEnd"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:
    v49 = v48;
    self->_blurAtEnd = objc_msgSend(v48, "BOOLValue", v55, v56, v57, v58, v59);

    goto LABEL_56;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("blurAtEnd"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
LABEL_56:

  objc_msgSend(v8, "objectForKey:", CFSTR("variableBlurInputMaskName"));
  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  variableBlurInputMaskName = v50;
  if (!v50)
  {
    variableBlurInputMaskName = 0;
    if (!v6)
      variableBlurInputMaskName = self->_variableBlurInputMaskName;
  }
  objc_storeStrong((id *)&self->_variableBlurInputMaskName, variableBlurInputMaskName);

  v52 = self->_variableBlurInputMaskName;
  if (v52)
  {
    if (self->_variableBlurInputMask)
    {
      CGImageRelease(self->_variableBlurInputMask);
      v52 = self->_variableBlurInputMaskName;
    }
    self->_variableBlurInputMask = MTCGImageCreateWithName(v52, v9, 0.0);
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("curvesValues"), v55, v56, v57, v58, v59);
  v53 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  curvesValues = v53;
  if (!v53)
  {
    curvesValues = 0;
    if (!v6)
      curvesValues = self->_curvesValues;
  }
  objc_storeStrong((id *)&self->_curvesValues, curvesValues);

}

- (NSString)blurInputQuality
{
  return self->_blurInputQuality;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)backdropScale
{
  return self->_backdropScale;
}

- (CAColorMatrix)colorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].m31;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[2].m22;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[2].m35;
  v4 = *(_OWORD *)&self[2].m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m44;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (double)saturation
{
  return self->_saturation;
}

- (double)luminanceAmount
{
  return self->_luminanceAmount;
}

- (double)brightness
{
  return self->_brightness;
}

- (BOOL)isBlurAtEnd
{
  return self->_blurAtEnd;
}

- (CGImage)variableBlurInputMask
{
  return self->_variableBlurInputMask;
}

- (NSArray)luminanceValues
{
  return self->_luminanceValues;
}

- (MTTintingFilteringMaterialSettings)initWithMaterialDescription:(id)a3 andDescendantDescriptions:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MTTintingFilteringMaterialSettings *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("tinting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("tinting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40.receiver = self;
  v40.super_class = (Class)MTTintingFilteringMaterialSettings;
  v13 = -[MTTintingMaterialSettings initWithTintingDescription:andDescendantDescriptions:](&v40, sel_initWithTintingDescription_andDescendantDescriptions_, v11, v12);

  if (v13)
  {
    v31 = v8;
    objc_msgSend(v8, "objectForKey:", CFSTR("materialFiltering"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTintingFilteringMaterialSettings _processMaterialFilteringDescription:defaultingToIdentity:bundle:](v13, "_processMaterialFilteringDescription:defaultingToIdentity:bundle:", v14, 1, v10);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v9, "valueForKey:", CFSTR("materialFiltering"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v19);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 != v21)
            -[MTTintingFilteringMaterialSettings _processMaterialFilteringDescription:defaultingToIdentity:bundle:](v13, "_processMaterialFilteringDescription:defaultingToIdentity:bundle:", v20, 0, v10);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v17);
    }

    objc_msgSend(v31, "objectForKey:", CFSTR("userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTintingFilteringMaterialSettings _processUserInfoDescription:](v13, "_processUserInfoDescription:", v22);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v9, "valueForKey:", CFSTR("userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v27);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28 != v29)
            -[MTTintingFilteringMaterialSettings _processUserInfoDescription:](v13, "_processUserInfoDescription:", v28);
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v25);
    }

    v8 = v31;
  }

  return v13;
}

- (void)_processUserInfoDescription:(id)a3
{
  id v4;
  NSDictionary *userInfo;
  NSDictionary *v6;
  NSDictionary *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSDictionary *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    userInfo = self->_userInfo;
    if (userInfo)
      v6 = (NSDictionary *)-[NSDictionary mutableCopy](userInfo, "mutableCopy");
    else
      v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v6;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v13, (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v14, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v15 = self->_userInfo;
    self->_userInfo = v7;

  }
}

- (double)zoom
{
  return self->_zoom;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (BOOL)isAverageColorEnabled
{
  return self->_averageColorEnabled;
}

- (void)dealloc
{
  CGImage *variableBlurInputMask;
  objc_super v4;

  variableBlurInputMask = self->_variableBlurInputMask;
  if (variableBlurInputMask)
    CGImageRelease(variableBlurInputMask);
  v4.receiver = self;
  v4.super_class = (Class)MTTintingFilteringMaterialSettings;
  -[MTTintingMaterialSettings dealloc](&v4, sel_dealloc);
}

- (NSString)variableBlurInputMaskName
{
  return self->_variableBlurInputMaskName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_curvesValues, 0);
  objc_storeStrong((id *)&self->_variableBlurInputMaskName, 0);
  objc_storeStrong((id *)&self->_blurInputQuality, 0);
  objc_storeStrong((id *)&self->_luminanceValues, 0);
}

@end

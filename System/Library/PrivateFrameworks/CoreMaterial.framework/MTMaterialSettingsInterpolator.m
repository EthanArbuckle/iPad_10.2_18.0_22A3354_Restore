@implementation MTMaterialSettingsInterpolator

void __69__MTMaterialSettingsInterpolator__isBackdropRequiredWithSubSettings___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(v9, "isEqualToString:", CFSTR("curvesValues"));
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v6 != 0;
  else
    v8 = objc_msgSend(v6, "mt_isIdentityValueForMaterialSettingsProperty:", v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (NSDictionary)curvesValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  double weighting;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MTRecipeMaterialSettingsProviding baseMaterialSettings](self->_initialSettings, "baseMaterialSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "curvesValues");
  v42 = objc_claimAutoreleasedReturnValue();

  -[MTRecipeMaterialSettingsProviding baseMaterialSettings](self->_finalSettings, "baseMaterialSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "curvesValues");
  v40 = objc_claimAutoreleasedReturnValue();

  v6 = v3;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  MTCAFilterCurvesInputValuesKeys();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v44;
    v36 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v7);
        objc_msgSend((id)v42, "objectForKey:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v40, "objectForKey:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (!(v9 | v10))
        {
          v14 = 0;
          goto LABEL_38;
        }
        v38 = v8;
        if (v9)
        {
          v12 = objc_msgSend((id)v9, "count");
          if (v12 == 4 && v11 != 0)
LABEL_15:
            v12 = objc_msgSend(v11, "count");
          if (v12 != 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v32 = v6;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 175, CFSTR("Either 'initialValues' (%@) or 'finalValues' (%@) doesn't have the required number of objects (4)"), v9, v11);

            v6 = v32;
          }
          if (v9)
            v15 = v11 == 0;
          else
            v15 = 1;
          if (!v15)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v17 = 0;
            while (1)
            {
              if (MTFloatIsZero(self->_weighting))
              {
                v18 = (void *)v9;
              }
              else
              {
                if (!MTFloatIsOne(self->_weighting))
                {
                  v20 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend((id)v9, "objectAtIndexedSubscript:", v17);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "floatValue");
                  v23 = v22;
                  weighting = self->_weighting;
                  objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "floatValue");
                  v27 = v26;
                  objc_msgSend((id)v9, "objectAtIndexedSubscript:", v17);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "floatValue");
                  v30 = v23 + weighting * (float)(v27 - v29);

                  objc_msgSend(v20, "numberWithDouble:", v30);
                  v19 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_34;
                }
                v18 = v11;
              }
              objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
              v19 = objc_claimAutoreleasedReturnValue();
LABEL_34:
              v31 = (void *)v19;
              objc_msgSend(v14, "addObject:", v19);

              if (++v17 == 4)
              {
                v6 = v36;
                goto LABEL_37;
              }
            }
          }
          goto LABEL_23;
        }
        if (v10)
          goto LABEL_15;
LABEL_23:
        if (v42 | v40)
        {
          if (v42)
            v16 = (void *)v9;
          else
            v16 = v11;
          v14 = v16;
        }
        else
        {
          v14 = 0;
        }
LABEL_37:
        objc_msgSend(v6, "setObject:forKey:", v14, v38);
LABEL_38:

        ++v7;
      }
      while (v7 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v41);
  }

  return (NSDictionary *)v6;
}

- (BOOL)_isPropertyEnabled:(id)a3 consideringWeighting:(BOOL)a4
{
  id v7;
  NSString *v8;
  SEL v9;
  int v10;
  char v11;
  double weighting;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  void *v18;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%@WithSettings:"), v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v8);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 216, CFSTR("This class doesn't respond to constructed selector '%@'"), v8);

  }
  if (self->_initialSettings)
    v10 = objc_msgSend((id)-[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v9), "mt_isIdentityValueForMaterialSettingsProperty:", v7) ^ 1;
  else
    LOBYTE(v10) = 0;
  v11 = objc_msgSend((id)-[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v9, self->_finalSettings), "mt_isIdentityValueForMaterialSettingsProperty:", v7);
  weighting = self->_weighting;
  v13 = !a4;
  v14 = weighting < 1.0 || !a4;
  v15 = v10 & v14;
  if (weighting > 0.0)
    v13 = 1;
  if (v15)
    v13 = v15;
  if ((v11 & 1) != 0)
    v16 = v15;
  else
    v16 = v13;

  return v16;
}

- (id)_filteringProperty:(id)a3 withSettings:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_filteringProtocolGetterNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[[self class] _filteringProtocolGetterNames] containsObject:filteringProperty]"));

  }
  objc_msgSend(v8, "baseMaterialSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_filteringProtocolGetterNames
{
  if (_filteringProtocolGetterNames_onceToken != -1)
    dispatch_once(&_filteringProtocolGetterNames_onceToken, &__block_literal_global_36);
  return (id)_filteringProtocolGetterNames___filteringProtocolSelectorNames;
}

- (id)_blurRadiusWithSettings:(id)a3
{
  return -[MTMaterialSettingsInterpolator _filteringProperty:withSettings:](self, "_filteringProperty:withSettings:", CFSTR("blurRadius"), a3);
}

- (id)_colorMatrixWithSettings:(id)a3
{
  return -[MTMaterialSettingsInterpolator _filteringProperty:withSettings:](self, "_filteringProperty:withSettings:", CFSTR("colorMatrix"), a3);
}

- (id)_saturationWithSettings:(id)a3
{
  return -[MTMaterialSettingsInterpolator _filteringProperty:withSettings:](self, "_filteringProperty:withSettings:", CFSTR("saturation"), a3);
}

- (id)_luminanceAmountWithSettings:(id)a3
{
  return -[MTMaterialSettingsInterpolator _filteringProperty:withSettings:](self, "_filteringProperty:withSettings:", CFSTR("luminanceAmount"), a3);
}

- (id)_brightnessWithSettings:(id)a3
{
  return -[MTMaterialSettingsInterpolator _filteringProperty:withSettings:](self, "_filteringProperty:withSettings:", CFSTR("brightness"), a3);
}

- (MTRecipeMaterialSettingsProviding)initialSettings
{
  return self->_initialSettings;
}

- (double)_floatPropertyValueForProperty:(id)a3 withTransformer:(id)a4
{
  id v7;
  id v8;
  void *v9;
  float v10;
  double v11;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;

  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__MTMaterialSettingsInterpolator__floatPropertyValueForProperty_withTransformer___block_invoke;
  v14[3] = &unk_1E5879280;
  v16 = a2;
  v14[4] = self;
  v8 = v7;
  v15 = v8;
  -[MTMaterialSettingsInterpolator _propertyValueForProperty:withTransformer:](self, "_propertyValueForProperty:withTransformer:", a3, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 242, CFSTR("Didn't get back a number as expected"));

  }
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  return v11;
}

- (id)_propertyValueForProperty:(id)a3 withTransformer:(id)a4
{
  id v7;
  void (**v8)(id, void *, void *, double);
  NSString *v9;
  SEL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;

  v7 = a3;
  v8 = (void (**)(id, void *, void *, double))a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%@WithSettings:"), v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = NSSelectorFromString(v9);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 228, CFSTR("This class doesn't respond to constructed selector '%@'"), v9);

  }
  if (self->_initialSettings)
  {
    v11 = (id)-[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "mt_identityValueForMaterialSettingsProperty:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  -[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v10, self->_finalSettings);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v8)
  {
    v8[2](v8, v12, v13, self->_weighting);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v13;
  }
  v16 = v15;

  return v16;
}

id __81__MTMaterialSettingsInterpolator__floatPropertyValueForProperty_withTransformer___block_invoke(_QWORD *a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  void *v19;
  void *v21;

  v7 = a2;
  v8 = a3;
  if (v7 && (objc_opt_respondsToSelector() & 1) == 0 || v8 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MTMaterialSettingsInterpolator.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(!initialValue || [initialValue respondsToSelector:@selector(floatValue)]) && (!finalValue || [finalValue respondsToSelector:@selector(floatValue)])"));

  }
  v9 = a1[5];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "floatValue");
  if (v9)
  {
    v12 = v11;
    objc_msgSend(v8, "floatValue");
    (*(void (**)(uint64_t, double, double, double))(v9 + 16))(v9, a4, v12, v13);
  }
  else
  {
    v15 = v11;
    objc_msgSend(v8, "floatValue");
    v17 = v16;
    objc_msgSend(v7, "floatValue");
    v14 = v15 + a4 * (float)(v17 - v18);
  }
  objc_msgSend(v10, "numberWithDouble:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

double __47__MTMaterialSettingsInterpolator_backdropScale__block_invoke(double a1, double a2, double a3)
{
  double result;
  double v4;

  if (a2 >= a3)
    result = a2;
  else
    result = a3;
  if (a2 >= a3)
    v4 = a3;
  else
    v4 = a2;
  if (a3 != 0.0 && a2 != 0.0)
    return v4;
  return result;
}

- (id)_backdropScaleWithSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "baseMaterialSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backdropScale");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)blurInputQuality
{
  MTRecipeMaterialSettingsProviding *initialSettings;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  NSString *v12;

  initialSettings = self->_initialSettings;
  v4 = CFSTR("default");
  if (initialSettings)
  {
    -[MTRecipeMaterialSettingsProviding baseMaterialSettings](initialSettings, "baseMaterialSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blurInputQuality");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("default");
    v4 = v8;

  }
  -[MTRecipeMaterialSettingsProviding baseMaterialSettings](self->_finalSettings, "baseMaterialSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blurInputQuality");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (MTCompareBlurInputQualities(v4, v10) == -1)
    v11 = v4;
  else
    v11 = v10;
  v12 = v11;

  return v12;
}

id __45__MTMaterialSettingsInterpolator_colorMatrix__block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float32x4_t v12[5];
  float32x4_t v13[5];
  float32x4_t v14[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB3B18];
  if (!v6)
  {
    memset(v13, 0, sizeof(v13));
    if (v7)
      goto LABEL_3;
LABEL_5:
    memset(v12, 0, sizeof(v12));
    goto LABEL_6;
  }
  objc_msgSend(v6, "CAColorMatrixValue");
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "CAColorMatrixValue");
LABEL_6:
  objc_msgSend(v9, "valueWithBytes:objCType:", v14, "{CAColorMatrix=ffffffffffffffffffff}", *(double *)MTCAColorMatrixInterpolate(v13, v12, v14, a1).i64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_colorMatrixColorWithSettings:(id)a3 alpha:(double)a4
{
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "baseMaterialSettings");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (objc_msgSend(v5, "tintColor"))
  {
    +[MTColor colorWithCGColor:](MTColor, "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(v5), "tintColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_tintAlphaWithSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "baseMaterialSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "tintAlpha");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isBlurEnabled
{
  return -[MTMaterialSettingsInterpolator _isPropertyEnabled:consideringWeighting:](self, "_isPropertyEnabled:consideringWeighting:", CFSTR("blurRadius"), 0);
}

- (double)weighting
{
  return self->_weighting;
}

- (BOOL)isTintEnabled
{
  return -[MTMaterialSettingsInterpolator _isTintEnabledWithSettings:](self, "_isTintEnabledWithSettings:", self->_initialSettings)|| -[MTMaterialSettingsInterpolator _isTintEnabledWithSettings:](self, "_isTintEnabledWithSettings:", self->_finalSettings);
}

- (BOOL)_isTintEnabledWithSettings:(id)a3
{
  void *v3;
  int v4;

  if (a3)
  {
    -[MTMaterialSettingsInterpolator _tintAlphaWithSettings:](self, "_tintAlphaWithSettings:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("tintAlpha")) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isSaturationEnabled
{
  return -[MTMaterialSettingsInterpolator _isPropertyEnabled:consideringWeighting:](self, "_isPropertyEnabled:consideringWeighting:", CFSTR("saturation"), 0);
}

- (BOOL)isLuminanceEnabled
{
  return -[MTMaterialSettingsInterpolator _isPropertyEnabled:consideringWeighting:](self, "_isPropertyEnabled:consideringWeighting:", CFSTR("luminanceAmount"), 0);
}

- (BOOL)isCurvesEnabled
{
  SEL v4;
  BOOL v5;
  void *v7;

  v4 = NSSelectorFromString(CFSTR("curvesValues"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 101, CFSTR("This class doesn't respond to constructed selector '%@'"), CFSTR("curvesValues"));

  }
  if (self->_initialSettings)
    v5 = -[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v4) != 0;
  else
    v5 = 0;
  return -[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v4, self->_finalSettings)|| v5;
}

- (BOOL)isColorMatrixEnabled
{
  return -[MTMaterialSettingsInterpolator _isPropertyEnabled:consideringWeighting:](self, "_isPropertyEnabled:consideringWeighting:", CFSTR("colorMatrix"), 0);
}

- (BOOL)isBrightnessEnabled
{
  return -[MTMaterialSettingsInterpolator _isPropertyEnabled:consideringWeighting:](self, "_isPropertyEnabled:consideringWeighting:", CFSTR("brightness"), 0);
}

- (BOOL)isBlurAtEnd
{
  void *v2;
  char v3;

  -[MTRecipeMaterialSettingsProviding baseMaterialSettings](self->_finalSettings, "baseMaterialSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlurAtEnd");

  return v3;
}

- (double)backdropScale
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:withTransformer:](self, "_floatPropertyValueForProperty:withTransformer:", CFSTR("backdropScale"), &__block_literal_global_26);
  return result;
}

- (CGImage)variableBlurInputMask
{
  id v3;
  CGImage *v4;

  if (self->_initialSettings)
    return 0;
  -[MTRecipeMaterialSettingsProviding baseMaterialSettings](self->_finalSettings, "baseMaterialSettings");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGImage *)objc_msgSend(v3, "variableBlurInputMask");

  return v4;
}

- (double)blurRadius
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:withTransformer:](self, "_floatPropertyValueForProperty:withTransformer:", CFSTR("blurRadius"), self->_blurRadiusTransformer);
  return result;
}

- (BOOL)isZoomEnabled
{
  return -[MTMaterialSettingsInterpolator _isPropertyEnabled:consideringWeighting:](self, "_isPropertyEnabled:consideringWeighting:", CFSTR("zoom"), 0);
}

- (id)_zoomWithSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "baseMaterialSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoom");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_floatPropertyValueForProperty:(id)a3
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:withTransformer:](self, "_floatPropertyValueForProperty:withTransformer:", a3, 0);
  return result;
}

- (CAColorMatrix)colorMatrix
{
  void *v4;
  CAColorMatrix *result;
  void *v6;

  -[MTMaterialSettingsInterpolator _propertyValueForProperty:withTransformer:](self, "_propertyValueForProperty:withTransformer:", CFSTR("colorMatrix"), &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "CAColorMatrixValue");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m15 = 0u;
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
  }

  return result;
}

- (double)saturation
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:](self, "_floatPropertyValueForProperty:", CFSTR("saturation"));
  return result;
}

- (double)luminanceAmount
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:](self, "_floatPropertyValueForProperty:", CFSTR("luminanceAmount"));
  return result;
}

- (double)brightness
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:](self, "_floatPropertyValueForProperty:", CFSTR("brightness"));
  return result;
}

- (id)_luminanceInputValues
{
  MTRecipeMaterialSettingsProviding *initialSettings;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double weighting;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;

  initialSettings = self->_initialSettings;
  if (initialSettings)
  {
    -[MTRecipeMaterialSettingsProviding baseMaterialSettings](initialSettings, "baseMaterialSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "luminanceValues");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[MTRecipeMaterialSettingsProviding baseMaterialSettings](self->_finalSettings, "baseMaterialSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "luminanceValues");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6 | v8)
  {
    if (v6 && v8)
    {
      if (objc_msgSend((id)v6, "count") != 4 || objc_msgSend((id)v8, "count") != 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 277, CFSTR("Either 'initialValues' (%@) or 'finalValues' (%@) doesn't have the required number of objects (4)"), v6, v8);

      }
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = 0;
      while (1)
      {
        if (MTFloatIsZero(self->_weighting))
        {
          v11 = (void *)v6;
        }
        else
        {
          if (!MTFloatIsOne(self->_weighting))
          {
            v13 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)v6, "objectAtIndexedSubscript:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            v16 = v15;
            weighting = self->_weighting;
            objc_msgSend((id)v8, "objectAtIndexedSubscript:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "floatValue");
            v20 = v19;
            objc_msgSend((id)v6, "objectAtIndexedSubscript:", v10);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "floatValue");
            v23 = v16 + weighting * (float)(v20 - v22);

            objc_msgSend(v13, "numberWithDouble:", v23);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          v11 = (void *)v8;
        }
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v24 = (void *)v12;
        objc_msgSend(v9, "addObject:", v12);

        if (++v10 == 4)
          goto LABEL_23;
      }
    }
    if (v6)
      v25 = (void *)v6;
    else
      v25 = (void *)v8;
    v9 = v25;
  }
  else
  {
    v9 = 0;
  }
LABEL_23:
  v26 = v9;

  return v26;
}

- (MTRecipeMaterialSettingsProviding)finalSettings
{
  return self->_finalSettings;
}

- (BOOL)isWeightingChanging
{
  return !MTFloatEqualToFloat(self->_previousWeighting, self->_weighting);
}

- (BOOL)isBackdropRequiredEver
{
  return -[MTMaterialSettingsInterpolator isBackdropRequiredFinally](self, "isBackdropRequiredFinally")
      || -[MTMaterialSettingsInterpolator isBackdropRequiredInitially](self, "isBackdropRequiredInitially");
}

- (BOOL)isBackdropRequiredFinally
{
  return -[MTMaterialSettingsInterpolator _isBackdropRequiredWithSettings:](self, "_isBackdropRequiredWithSettings:", self->_finalSettings);
}

- (BOOL)_isBackdropRequiredWithSettings:(id)a3
{
  void *v4;

  objc_msgSend(a3, "baseMaterialSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MTMaterialSettingsInterpolator _isBackdropRequiredWithSubSettings:](self, "_isBackdropRequiredWithSubSettings:", v4);

  return (char)self;
}

- (BOOL)_isBackdropRequiredWithSubSettings:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_filteringProtocolGetterNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__MTMaterialSettingsInterpolator__isBackdropRequiredWithSubSettings___block_invoke;
    v7[3] = &unk_1E58792A8;
    v9 = &v10;
    v8 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

    v5 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)setWeighting:(double)a3
{
  double weighting;

  weighting = self->_weighting;
  if (weighting != a3)
  {
    self->_previousWeighting = weighting;
    self->_weighting = a3;
  }
}

- (void)setInitialSettings:(id)a3
{
  objc_storeStrong((id *)&self->_initialSettings, a3);
}

- (MTMaterialSettingsInterpolator)initWithSettings:(id)a3
{
  id v4;
  MTMaterialSettingsInterpolator *v5;
  MTMaterialSettingsInterpolator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTMaterialSettingsInterpolator;
  v5 = -[MTMaterialSettingsInterpolator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MTMaterialSettingsInterpolator setFinalSettings:](v5, "setFinalSettings:", v4);

  return v6;
}

- (void)setFinalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_finalSettings, a3);
}

- (void)setBlurRadiusTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MTColor)tintColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__MTMaterialSettingsInterpolator_tintColor__block_invoke;
  v3[3] = &unk_1E5879238;
  v3[4] = self;
  -[MTMaterialSettingsInterpolator _colorWithGetterBlock:](self, "_colorWithGetterBlock:", v3);
  return (MTColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_colorWithGetterBlock:(id)a3
{
  void (**v5)(_QWORD, double);
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;

  v5 = (void (**)(_QWORD, double))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialSettingsInterpolator.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("getter"));

  }
  if (self->_initialSettings)
  {
    -[MTMaterialSettingsInterpolator _tintAlphaWithSettings:](self, "_tintAlphaWithSettings:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (self->_initialSettings)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7 * (1.0 - self->_weighting);
  }
  else
  {
    v8 = 0.0;
  }
  -[MTMaterialSettingsInterpolator _tintAlphaWithSettings:](self, "_tintAlphaWithSettings:", self->_finalSettings);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10 * self->_weighting;
  if (self->_initialSettings)
  {
    v5[2](v5, v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  ((void (*)(void (**)(_QWORD, double), MTRecipeMaterialSettingsProviding *, double))v5[2])(v5, self->_finalSettings, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!(v12 | v13))
    goto LABEL_21;
  if (!v12 || !v13)
  {
    if (v12)
    {
      v19 = (id)v12;
LABEL_20:
      v18 = v19;
      goto LABEL_22;
    }
    if (v13)
    {
      v19 = (id)v13;
      goto LABEL_20;
    }
LABEL_21:
    v18 = 0;
    goto LABEL_22;
  }
  objc_msgSend((id)v12, "colorWithAlphaComponent:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWithAlphaComponent:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorBlendedWithColor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  v20 = v18;

  return v20;
}

uint64_t __43__MTMaterialSettingsInterpolator_tintColor__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_colorMatrixColorWithSettings:alpha:", a2);
}

void __63__MTMaterialSettingsInterpolator__filteringProtocolGetterNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  MTProtocolGetProperties(&unk_1EEB9A320, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_filteringProtocolGetterNames___filteringProtocolSelectorNames;
  _filteringProtocolGetterNames___filteringProtocolSelectorNames = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_blurRadiusTransformer, 0);
  objc_storeStrong((id *)&self->_initialSettings, 0);
  objc_storeStrong((id *)&self->_finalSettings, 0);
}

- (id)initialSettingsInterpolator
{
  MTRecipeMaterialSettingsProviding *finalSettings;
  MTRecipeMaterialSettingsProviding *v4;
  MTMaterialSettingsInterpolator *v5;

  finalSettings = self->_finalSettings;
  if (finalSettings)
  {
    if (self->_initialSettings)
      finalSettings = self->_initialSettings;
    v4 = finalSettings;
    v5 = -[MTMaterialSettingsInterpolator initWithSettings:]([MTMaterialSettingsInterpolator alloc], "initWithSettings:", v4);

    -[MTMaterialSettingsInterpolator setWeighting:](v5, "setWeighting:", self->_previousWeighting);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)finalizeWeighting
{
  self->_previousWeighting = self->_weighting;
}

- (BOOL)isBackdropRequiredInitially
{
  return self->_initialSettings
      && -[MTMaterialSettingsInterpolator _isBackdropRequiredWithSettings:](self, "_isBackdropRequiredWithSettings:");
}

- (double)tintAlpha
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:](self, "_floatPropertyValueForProperty:", CFSTR("tintAlpha"));
  return result;
}

- (double)zoom
{
  double result;

  -[MTMaterialSettingsInterpolator _floatPropertyValueForProperty:](self, "_floatPropertyValueForProperty:", CFSTR("zoom"));
  return result;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; final settings: %@"),
    objc_opt_class(),
    self,
    self->_finalSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_initialSettings)
    objc_msgSend(v3, "appendFormat:", CFSTR("; initial settings: %@"), self->_initialSettings);
  objc_msgSend(v4, "appendFormat:", CFSTR("; weighting: %f>"), *(_QWORD *)&self->_weighting);
  return v4;
}

- (BOOL)isOverlay
{
  return self->_overlay;
}

- (id)blurRadiusTransformer
{
  return self->_blurRadiusTransformer;
}

@end

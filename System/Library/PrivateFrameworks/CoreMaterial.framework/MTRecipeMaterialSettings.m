@implementation MTRecipeMaterialSettings

- (MTTinting)baseMaterialSettings
{
  return self->_baseMaterialSettings;
}

- (id)styleNameForCategory:(id)a3
{
  if (CFSTR("platformColor") == a3)
    -[MTRecipeMaterialSettings _platformColorsStyleSetName](self, "_platformColorsStyleSetName");
  else
    -[NSDictionary objectForKey:](self->_styles, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTRecipeMaterialSettings)initWithRecipeName:(id)a3 andDescription:(id)a4 descendantDescriptions:(id)a5 bundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MTRecipeMaterialSettings *v14;
  uint64_t v15;
  NSString *recipeName;
  void *v17;
  uint64_t v18;
  NSDictionary *styles;
  MTTintingFilteringMaterialSettings *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MTTinting *baseMaterialSettings;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MTRecipeMaterialSettings;
  v14 = -[MTRecipeMaterialSettings init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    recipeName = v14->_recipeName;
    v14->_recipeName = (NSString *)v15;

    objc_msgSend(v11, "objectForKey:", CFSTR("materialSettingsVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_materialSettingsVersion = objc_msgSend(v17, "integerValue");

    objc_msgSend(v11, "objectForKey:", CFSTR("styles"));
    v18 = objc_claimAutoreleasedReturnValue();
    styles = v14->_styles;
    v14->_styles = (NSDictionary *)v18;

    v20 = [MTTintingFilteringMaterialSettings alloc];
    objc_msgSend(v11, "objectForKey:", CFSTR("baseMaterial"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", CFSTR("baseMaterial"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MTTintingFilteringMaterialSettings initWithMaterialDescription:andDescendantDescriptions:bundle:](v20, "initWithMaterialDescription:andDescendantDescriptions:bundle:", v21, v22, v13);
    baseMaterialSettings = v14->_baseMaterialSettings;
    v14->_baseMaterialSettings = (MTTinting *)v23;

  }
  return v14;
}

- (NSString)recipeName
{
  return self->_recipeName;
}

+ (id)styleSetNameForStyleSetFromRecipeWithName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR(".generatedStyleSet"));
}

- (id)_visualStyleSetDescription
{
  void *v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[10];
  _OWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  const __CFString *v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  -[MTRecipeMaterialSettings baseMaterialSettings](self, "baseMaterialSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CanGenerateVisualStylingDescriptionFromConfigurationSettings(v2))
  {
    v14 = 0;
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  v55 = 0;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __54__MTRecipeMaterialSettings__visualStyleSetDescription__block_invoke;
  v49[3] = &unk_1E5879060;
  v49[4] = &v50;
  v3 = (void (**)(_QWORD))MEMORY[0x1AF42541C](v49);
  objc_msgSend(v2, "tintColorDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v3[2](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tintColorDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("tinting"));

  }
  v29 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v46 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v47 = v29;
  v48 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v26 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v44 = *MEMORY[0x1E0CD2338];
  v45 = v26;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "saturation", v44, v26, v48, v29, v46);
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("saturation"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v2, "saturation");
    CAColorMatrixMakeSaturation();
    v36 = v31;
    v37 = v30;
    v38 = v28;
    v34 = v25;
    v35 = v27;
    CAColorMatrixConcat();
    v46 = v41;
    v47 = v42;
    v48 = v43;
    v44 = v39;
    v45 = v40;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "brightness");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("brightness"));

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v2, "brightness");
    CAColorMatrixMakeBrightness();
    v36 = v46;
    v37 = v47;
    v38 = v48;
    v34 = v44;
    v35 = v45;
    CAColorMatrixConcat();
    v46 = v41;
    v47 = v42;
    v48 = v43;
    v44 = v39;
    v45 = v40;
  }
  v13 = (void *)MEMORY[0x1E0CB3B18];
  if (v2)
    objc_msgSend(v2, "colorMatrix");
  else
    memset(v33, 0, sizeof(v33));
  objc_msgSend(v13, "valueWithBytes:objCType:", v33, "{CAColorMatrix=ffffffffffffffffffff}");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "mt_isIdentityValueForMaterialSettingsProperty:", CFSTR("colorMatrix"));

  if ((v16 & 1) == 0)
  {
    if (v2)
      objc_msgSend(v2, "colorMatrix");
    else
      memset(&v32[5], 0, 80);
    v36 = v46;
    v37 = v47;
    v38 = v48;
    v34 = v44;
    v35 = v45;
    CAColorMatrixConcat();
    v46 = v41;
    v47 = v42;
    v48 = v43;
    v44 = v39;
    v45 = v40;
  }
  v41 = v46;
  v42 = v47;
  v43 = v48;
  v39 = v44;
  v40 = v45;
  if (!MTCAColorMatrixIsIdentity(&v39))
  {
    v3[2](v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CD2F08];
    v58[1] = CFSTR("filterProperties");
    v59[0] = v18;
    v58[0] = CFSTR("filterType");
    v56 = CFSTR("inputColorMatrix");
    v32[2] = v46;
    v32[3] = v47;
    v32[4] = v48;
    v32[0] = v44;
    v32[1] = v45;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v32, "{CAColorMatrix=ffffffffffffffffffff}");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("filtering"));

  }
  if (v51[5])
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKey:", v51[5], CFSTR("secondary"));
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v50, 8);
  if (!v14)
    goto LABEL_24;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v22, "setObject:forKey:", v14, CFSTR("styles"));
  objc_msgSend(v22, "setObject:forKey:", &unk_1E587FD10, CFSTR("visualStyleSetVersion"));
LABEL_25:
  v23 = v22;

  return v23;
}

id __54__MTRecipeMaterialSettings__visualStyleSetDescription__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

- (id)_newVisualStyleSet
{
  void *v3;
  MTVisualStyleSet *v4;
  void *v5;
  void *v6;
  void *v7;
  MTVisualStyleSet *v8;

  -[MTRecipeMaterialSettings _visualStyleSetDescription](self, "_visualStyleSetDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [MTVisualStyleSet alloc];
    v5 = (void *)objc_opt_class();
    -[MTRecipeMaterialSettings recipeName](self, "recipeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleSetNameForStyleSetFromRecipeWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MTVisualStyleSet initWithName:visualStyleSetDescription:andDescendantDescriptions:](v4, "initWithName:visualStyleSetDescription:andDescendantDescriptions:", v7, v3, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_platformColorsStyleSetName
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = -[NSString hasSuffix:](self->_recipeName, "hasSuffix:", CFSTR("Dark"));
  v3 = &kMTCoreMaterialStyleNamePlatformColorsDark;
  if (!v2)
    v3 = &kMTCoreMaterialStyleNamePlatformColorsLight;
  return *v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; recipeName: %@; materialSettingsVersion: %ld; styles: %@"),
    objc_opt_class(),
    self,
    self->_recipeName,
    self->_materialSettingsVersion,
    self->_styles);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTRecipeMaterialSettings baseMaterialSettings](self, "baseMaterialSettings");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("; baseMaterialSettings: %@"), v4);
  objc_msgSend(v3, "appendString:", CFSTR(">"));

  return (NSString *)v3;
}

- (int64_t)materialSettingsVersion
{
  return self->_materialSettingsVersion;
}

- (NSDictionary)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
  objc_storeStrong((id *)&self->_styles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMaterialSettings, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_recipeName, 0);
}

@end

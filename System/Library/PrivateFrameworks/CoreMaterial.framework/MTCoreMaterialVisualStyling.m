@implementation MTCoreMaterialVisualStyling

- (NSString)tintColorName
{
  return self->_tintColorName;
}

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (MTCoreMaterialVisualStyling)initWithVisualStyleSet:(id)a3 styleName:(id)a4 description:(id)a5 andDescendantDescriptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MTCoreMaterialVisualStyling *v14;
  MTCoreMaterialVisualStyling *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v71.receiver = self;
  v71.super_class = (Class)MTCoreMaterialVisualStyling;
  v14 = -[MTCoreMaterialVisualStyling init](&v71, sel_init);
  v15 = v14;
  if (v14)
  {
    v51 = v11;
    v53 = v10;
    objc_storeWeak((id *)&v14->_visualStyleSet, v10);
    objc_storeStrong((id *)&v15->_visualStyleName, a4);
    objc_msgSend(v12, "objectForKey:", CFSTR("tinting"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreMaterialVisualStyling _processTintingDescription:](v15, "_processTintingDescription:", v16);

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v13, "valueForKey:", CFSTR("tinting"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v68;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v68 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v21);
          objc_msgSend(MEMORY[0x1E0C99E38], "null", v51, v53);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 != v23)
            -[MTCoreMaterialVisualStyling _processTintingDescription:](v15, "_processTintingDescription:", v22);
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      }
      while (v19);
    }

    objc_msgSend(v12, "objectForKey:", CFSTR("blending"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreMaterialVisualStyling _processBlendingDescription:](v15, "_processBlendingDescription:", v24);

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v13, "valueForKey:", CFSTR("blending"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v64;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v64 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v29);
          objc_msgSend(MEMORY[0x1E0C99E38], "null", v51, v53);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30 != v31)
            -[MTCoreMaterialVisualStyling _processBlendingDescription:](v15, "_processBlendingDescription:", v30);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      }
      while (v27);
    }

    if (!v15->_compositingFilter)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("filtering"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreMaterialVisualStyling _preProcessFilteringDescription:](v15, "_preProcessFilteringDescription:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreMaterialVisualStyling _processFilteringDescription:](v15, "_processFilteringDescription:", v33);

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      objc_msgSend(v13, "valueForKey:", CFSTR("filtering"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v60;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v60 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v38);
            objc_msgSend(MEMORY[0x1E0C99E38], "null", v51, v53);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39 != v40)
            {
              -[MTCoreMaterialVisualStyling _preProcessFilteringDescription:](v15, "_preProcessFilteringDescription:", v39);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[MTCoreMaterialVisualStyling _processFilteringDescription:](v15, "_processFilteringDescription:", v41);

            }
            ++v38;
          }
          while (v36 != v38);
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
        }
        while (v36);
      }

    }
    objc_msgSend(v12, "objectForKey:", CFSTR("userInfo"), v51, v53);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreMaterialVisualStyling _processUserInfoDescription:](v15, "_processUserInfoDescription:", v42);

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v13, "valueForKey:", CFSTR("userInfo"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v56;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v56 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v47);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48 != v49)
            -[MTCoreMaterialVisualStyling _processUserInfoDescription:](v15, "_processUserInfoDescription:", v48);
          ++v47;
        }
        while (v45 != v47);
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
      }
      while (v45);
    }

    v11 = v52;
    v10 = v54;
  }

  return v15;
}

- (void)_processFilteringDescription:(id)a3
{
  id v4;
  NSString *v5;
  NSString *filterType;
  NSDictionary *v7;
  NSDictionary *filterProperties;
  NSString *compositingFilter;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("filterType"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  filterType = self->_filterType;
  self->_filterType = v5;

  objc_msgSend(v4, "objectForKey:", CFSTR("filterProperties"));
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  filterProperties = self->_filterProperties;
  self->_filterProperties = v7;

  if (self->_filterType)
  {
    if (self->_filterProperties)
    {
      compositingFilter = self->_compositingFilter;
      self->_compositingFilter = 0;

    }
  }
}

- (id)_preProcessFilteringDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  _BYTE v34[80];
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v3;
  if (!v4)
  {
    v28 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
    v29 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
    v51 = v29;
    v52 = v28;
    v27 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
    v53 = v27;
    v25 = *MEMORY[0x1E0CD2338];
    v26 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
    v49 = *MEMORY[0x1E0CD2338];
    v50 = v26;
    v30 = v3;
    v6 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v46;
      v12 = *MEMORY[0x1E0CD2C00];
      v32 = *MEMORY[0x1E0CD2BB8];
      v31 = *MEMORY[0x1E0CD2F08];
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKey:", CFSTR("filterType"), v25, v26, v27, v28, v29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", v12))
          {
            objc_msgSend(v14, "objectForKey:", CFSTR("filterProperties"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", CFSTR("inputAmount"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "floatValue");

            CAColorMatrixMakeSaturation();
            v42 = v51;
            v43 = v52;
            v44 = v53;
            v40 = v49;
            v41 = v50;
            CAColorMatrixConcat();
          }
          else if (objc_msgSend(v15, "isEqualToString:", v32))
          {
            objc_msgSend(v14, "objectForKey:", CFSTR("filterProperties"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("inputAmount"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "floatValue");

            CAColorMatrixMakeBrightness();
            v37 = v51;
            v38 = v52;
            v39 = v53;
            v35 = v49;
            v36 = v50;
            CAColorMatrixConcat();
            v51 = v42;
            v52 = v43;
            v53 = v44;
            v49 = v40;
            v50 = v41;
          }
          else
          {
            if (!objc_msgSend(v15, "isEqualToString:", v31))
            {
              v51 = v29;
              v52 = v28;
              v53 = v27;
              v49 = v25;
              v50 = v26;

              goto LABEL_25;
            }
            objc_msgSend(v14, "objectForKey:", CFSTR("filterProperties"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", CFSTR("inputColorMatrix"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (MTCAColorMatrixIsDictionaryRepresentation(v21))
            {
              MTCAColorMatrixMakeWithDictionaryRepresentation(v21, (uint64_t)v34);
              v37 = v51;
              v38 = v52;
              v39 = v53;
              v35 = v49;
              v36 = v50;
              CAColorMatrixConcat();
              v51 = v42;
              v52 = v43;
              v53 = v44;
              v49 = v40;
              v50 = v41;
            }

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_25:

    v42 = v51;
    v43 = v52;
    v44 = v53;
    v40 = v49;
    v41 = v50;
    if (MTCAColorMatrixIsIdentity(&v40))
    {
      v5 = 0;
    }
    else
    {
      v57[0] = *MEMORY[0x1E0CD2F08];
      v56[0] = CFSTR("filterType");
      v56[1] = CFSTR("filterProperties");
      v54 = CFSTR("inputColorMatrix");
      v42 = v51;
      v43 = v52;
      v44 = v53;
      v40 = v49;
      v41 = v50;
      MTCAColorMatrixCreateDictionaryRepresentation(&v40, *(double *)&v50);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v3 = v30;

  }
  return v5;
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

- (void)_processBlendingDescription:(id)a3
{
  id v4;
  NSString *v5;
  NSString *compositingFilter;
  NSDictionary *v7;
  NSDictionary *filterProperties;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("compositingFilter"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  compositingFilter = self->_compositingFilter;
  self->_compositingFilter = v5;

  objc_storeStrong((id *)&self->_filterType, self->_compositingFilter);
  objc_msgSend(v4, "objectForKey:", CFSTR("filterProperties"));
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  filterProperties = self->_filterProperties;
  self->_filterProperties = v7;

}

- (void)_processTintingDescription:(id)a3
{
  NSDictionary *v4;
  NSDictionary *tintColorDescription;
  CGColor *tintColor;
  id v7;
  void *v8;
  void *v9;
  float v10;
  NSString *v11;
  NSString *tintColorName;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "objectForKey:", CFSTR("tintColor"));
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  tintColorDescription = self->_tintColorDescription;
  self->_tintColorDescription = v4;

  tintColor = self->_tintColor;
  if (tintColor)
    CGColorRelease(tintColor);
  if (self->_tintColorDescription)
  {
    +[MTColor colorWithDescription:](MTColor, "colorWithDescription:");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    self->_tintColor = CGColorRetain((CGColorRef)objc_msgSend(v7, "CGColor"));

  }
  else
  {
    self->_tintColor = 0;
  }
  objc_msgSend(v15, "objectForKey:", CFSTR("tintAlpha"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("tintAlpha"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    self->_tintAlpha = v10;

  }
  else
  {
    self->_tintAlpha = 1.0;
  }

  objc_msgSend(v15, "objectForKey:", CFSTR("tintColorName"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  tintColorName = self->_tintColorName;
  self->_tintColorName = v11;

  objc_msgSend(v15, "objectForKey:", CFSTR("tintColorUIStyle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("tintColorUIStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_tintColorUIStyle = objc_msgSend(v14, "integerValue");

  }
  else
  {
    self->_tintColorUIStyle = 0;
  }

}

- (NSDictionary)tintColorDescription
{
  return self->_tintColorDescription;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (double)tintAlpha
{
  return self->_tintAlpha;
}

- (id)filterType
{
  return self->_filterType;
}

- (id)filterProperties
{
  return self->_filterProperties;
}

- (id)compositingFilter
{
  return self->_compositingFilter;
}

- (void)_applyToLayer:(id)a3 withColorBlock:(id)a4
{
  id v6;
  void *v7;
  double tintAlpha;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && self->_tintColor)
    (*((void (**)(id))v6 + 2))(v6);
  tintAlpha = self->_tintAlpha;
  *(float *)&tintAlpha = tintAlpha;
  objc_msgSend(v16, "setOpacity:", tintAlpha);
  if (self->_compositingFilter || self->_filterType)
  {
    objc_msgSend(v16, "superlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    if (self->_compositingFilter)
    {
      -[MTCoreMaterialVisualStyling _composedFilter](self, "_composedFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCompositingFilter:", v10);
    }
    else
    {
      objc_msgSend(v16, "filters");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = (void *)MEMORY[0x1E0C9AA60];
      if (v11)
        v13 = (void *)v11;
      v14 = v13;

      -[MTCoreMaterialVisualStyling _composedFilter](self, "_composedFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObject:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setFilters:", v15);
    }

  }
}

- (CAFilter)_composedFilter
{
  CAFilter *composedFilter;
  CAFilter *v4;
  CAFilter *v5;
  NSString *compositingFilter;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  composedFilter = self->_composedFilter;
  if (!composedFilter)
  {
    if (!self->_filterType)
      return (CAFilter *)0;
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:");
    v4 = (CAFilter *)objc_claimAutoreleasedReturnValue();
    v5 = self->_composedFilter;
    self->_composedFilter = v4;

    compositingFilter = self->_compositingFilter;
    MTComposedFilterCreateDictionaryRepresentation(self->_filterType, self->_filterProperties, compositingFilter != 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (compositingFilter)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("compositingFilter"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "valueForKey:", CFSTR("filters"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v17, "isEqualToString:", CFSTR("type"), (_QWORD)v19) & 1) == 0)
          {
            objc_msgSend(v12, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAFilter setValue:forKey:](self->_composedFilter, "setValue:forKey:", v18, v17);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    composedFilter = self->_composedFilter;
  }
  return composedFilter;
}

- (int64_t)tintColorUIStyle
{
  return self->_tintColorUIStyle;
}

- (void)_getCompositingFilter:(id *)a3 tintColor:(CGColor *)a4
{
  NSString *compositingFilter;

  compositingFilter = self->_compositingFilter;
  if (compositingFilter)
  {
    if (a3)
      *a3 = objc_retainAutorelease(compositingFilter);
    if (a4)
      *a4 = self->_tintColor;
  }
}

- (void)_getFilterType:(id *)a3 vibrantColor:(CGColor *)a4 tintColor:(CGColor *)a5 inputReversed:(BOOL *)a6
{
  NSString *filterType;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  filterType = self->_filterType;
  if (filterType)
  {
    if (a3)
      *a3 = objc_retainAutorelease(filterType);
    if (a4)
    {
      -[MTCoreMaterialVisualStyling _composedFilter](self, "_composedFilter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (CGColor *)objc_msgSend(v11, "valueForKey:", CFSTR("inputColor0"));

    }
    if (a5)
    {
      -[MTCoreMaterialVisualStyling _composedFilter](self, "_composedFilter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (CGColor *)objc_msgSend(v12, "valueForKey:", CFSTR("inputColor1"));

    }
    if (a6)
    {
      -[MTCoreMaterialVisualStyling _composedFilter](self, "_composedFilter");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForKey:", CFSTR("inputReversed"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a6 = objc_msgSend(v13, "BOOLValue");

    }
  }
}

- (void)dealloc
{
  CGColor *tintColor;
  objc_super v4;

  tintColor = self->_tintColor;
  if (tintColor)
    CGColorRelease(tintColor);
  v4.receiver = self;
  v4.super_class = (Class)MTCoreMaterialVisualStyling;
  -[MTCoreMaterialVisualStyling dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v9 = CFSTR("MTDictionaryRepresentationOptionsIncludeOptimizationsKey");
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTVisualStylingSettingsCreateDictionaryRepresentation(self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; dictionary representation: %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_filterProperties, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_tintColorDescription, 0);
  objc_storeStrong((id *)&self->_composedFilter, 0);
  objc_storeStrong((id *)&self->_visualStyleName, 0);
  objc_destroyWeak((id *)&self->_visualStyleSet);
}

- (NSString)visualStyleSetName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleSet);
  objc_msgSend(WeakRetained, "visualStyleSetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)visualStyleName
{
  return self->_visualStyleName;
}

@end

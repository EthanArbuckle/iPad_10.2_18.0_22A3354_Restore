@implementation CARScreenViewArea

- (CARScreenViewArea)initWithPropertySupplier:(id)a3 displayInfoProvider:(id)a4
{
  return -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:](self, "initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:", a3, 0, 0, a4, *MEMORY[0x1E0CB2990], *(double *)(MEMORY[0x1E0CB2990] + 8), *(double *)(MEMORY[0x1E0CB2990] + 16), *(double *)(MEMORY[0x1E0CB2990] + 24));
}

- (CARScreenViewArea)initWithPropertySupplier:(id)a3 additionalInsets:(NSEdgeInsets)a4 displayInfoProvider:(id)a5
{
  return -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:](self, "initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:", a3, 0, 0, a5, a4.top, a4.left, a4.bottom, a4.right);
}

- (CARScreenViewArea)initWithPropertySupplier:(id)a3 additionalInsets:(NSEdgeInsets)a4 viewAreaDictionary:(id)a5 wantsCornerMasks:(BOOL)a6 displayInfoProvider:(id)a7
{
  double right;
  double bottom;
  double left;
  double top;
  uint64_t (**v15)(id, _QWORD);
  id v16;
  id v17;
  CARScreenViewArea *v18;
  CARScreenViewArea *v19;
  const __CFDictionary *v20;
  CGPoint *p_origin;
  CGSize size;
  const __CFDictionary *v23;
  CGPoint *v24;
  CGSize v25;
  id v26;
  id v27;
  char v28;
  void *v29;
  id v30;
  id v31;
  char v32;
  void *v33;
  id v34;
  id v35;
  char v36;
  CGSize v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  float v43;
  void *v44;
  float v45;
  void *v46;
  float v47;
  BOOL v48;
  unint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v59;
  id v60;
  objc_super v61;
  CGRect rect;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v15 = (uint64_t (**)(id, _QWORD))a3;
  v16 = a5;
  v17 = a7;
  v61.receiver = self;
  v61.super_class = (Class)CARScreenViewArea;
  v18 = -[CARScreenViewArea init](&v61, sel_init);
  v19 = v18;
  if (v15 && v18)
  {
    v60 = v17;
    objc_storeWeak((id *)&v18->_displayInfoProvider, v17);
    v20 = (const __CFDictionary *)v15[2](v15, *MEMORY[0x1E0CA4600]);
    p_origin = &v19->_visibleFrame.origin;
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v20, &rect))
    {
      size = rect.size;
      *p_origin = rect.origin;
      v19->_visibleFrame.size = size;
    }
    else
    {
      *p_origin = 0u;
      v19->_visibleFrame.size = 0u;
    }
    v23 = (const __CFDictionary *)v15[2](v15, *MEMORY[0x1E0CA45F0]);
    v24 = &v19->_safeFrame.origin;
    memset(&rect, 0, sizeof(rect));
    v59 = a6;
    if (CGRectMakeWithDictionaryRepresentation(v23, &rect))
    {
      v25 = rect.size;
      *v24 = rect.origin;
      v19->_safeFrame.size = v25;
    }
    else
    {
      *v24 = 0u;
      v19->_safeFrame.size = 0u;
    }
    v15[2](v15, *MEMORY[0x1E0CA4610]);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_opt_class();
      v27 = v26;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = objc_msgSend(v27, "BOOLValue");
      else
        v28 = 0;

    }
    else
    {
      v28 = 0;
    }

    v19->_displaysTransitionControl = v28;
    v15[2](v15, *MEMORY[0x1E0CA45F8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("viewAreaSupportsFocusTransfer"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_opt_class();
      v31 = v30;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = objc_msgSend(v31, "BOOLValue");
      else
        v32 = 0;

    }
    else
    {
      v32 = 0;
    }

    v19->_supportsFocusTransfer = v32;
    objc_msgSend(v16, "objectForKey:", CFSTR("safeArea"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", CFSTR("drawUIOutsideSafeArea"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_opt_class();
      v35 = v34;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v36 = objc_msgSend(v35, "BOOLValue");
      else
        v36 = 0;

    }
    else
    {
      v36 = 0;
    }

    v19->_supportsUIOutsideSafeArea = v36;
    v37 = v19->_safeFrame.size;
    v19->_unadjustedSafeFrame.origin = *v24;
    v19->_unadjustedSafeFrame.size = v37;
    if (CRIsInternalInstall())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "valueForKey:", CFSTR("CARCapabilitesInsets"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Top"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "floatValue");
        top = v41;
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Left"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "floatValue");
        left = v43;
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Bottom"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "floatValue");
        bottom = v45;
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Right"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "floatValue");
        right = v47;

      }
    }
    v19->_additionalInsets.top = top;
    v19->_additionalInsets.left = left;
    v19->_additionalInsets.bottom = bottom;
    v19->_additionalInsets.right = right;
    v48 = !v59;
    if (!v16)
      v48 = 0;
    v19->_shouldApplyDisplayInsets = v48;
    -[CARScreenViewArea _updateEffectiveSafeFrame](v19, "_updateEffectiveSafeFrame");
    v49 = objc_msgSend(v29, "unsignedIntegerValue");
    v17 = v60;
    if (!v29 || v49 >= 3)
    {
      CarGeneralLogging();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:].cold.1(v50, v51, v52, v53, v54, v55, v56, v57);

      v49 = 0;
    }
    v19->_statusBarEdge = v49;

  }
  return v19;
}

- (void)_updateEffectiveSafeFrame
{
  CGSize size;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  double top;
  double left;
  double bottom;
  double right;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  NSObject *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;
  NSSize v60;
  NSEdgeInsets v61;
  NSRect v62;
  NSRect v63;
  NSRect v64;
  NSEdgeInsets v65;
  NSEdgeInsets v66;

  v59 = *MEMORY[0x1E0C80C00];
  size = self->_unadjustedSafeFrame.size;
  self->_safeFrame.origin = self->_unadjustedSafeFrame.origin;
  self->_safeFrame.size = size;
  -[CARScreenViewArea displayInfoProvider](self, "displayInfoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originInDisplay");
  v6 = v5;
  v8 = v7;

  if (self->_shouldApplyDisplayInsets)
  {
    -[CARScreenViewArea displayInfoProvider](self, "displayInfoProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayPixelSize");
    v11 = v10;
    v13 = v12;

    CarGeneralLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v60.width = v11;
      v60.height = v13;
      NSStringFromSize(v60);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromRect(self->_unadjustedSafeFrame);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromRect(self->_visibleFrame);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v54 = v15;
      v55 = 2112;
      v56 = v16;
      v57 = 2112;
      v58 = v17;
      _os_log_impl(&dword_1A83A2000, v14, OS_LOG_TYPE_DEFAULT, "Display (%@) supports view areas and does not want corner masks, applying insets to edges that need to be inset. Safe frame: (%@), viewArea frame: (%@)", buf, 0x20u);

    }
    objc_msgSend((id)objc_opt_class(), "insetsForOEMUIWithDisplaySize:originInDisplay:safeFrame:viewAreaFrame:", v11, v13, v6, v8, self->_unadjustedSafeFrame.origin.x, self->_unadjustedSafeFrame.origin.y, self->_unadjustedSafeFrame.size.width, self->_unadjustedSafeFrame.size.height, *(_QWORD *)&self->_visibleFrame.origin.x, *(_QWORD *)&self->_visibleFrame.origin.y, *(_QWORD *)&self->_visibleFrame.size.width, *(_QWORD *)&self->_visibleFrame.size.height);
    top = v61.top;
    left = v61.left;
    bottom = v61.bottom;
    right = v61.right;
    v22 = *MEMORY[0x1E0CB2990];
    v23 = *(double *)(MEMORY[0x1E0CB2990] + 8);
    v24 = *(double *)(MEMORY[0x1E0CB2990] + 16);
    v25 = *(double *)(MEMORY[0x1E0CB2990] + 24);
    v65.top = *(CGFloat *)MEMORY[0x1E0CB2990];
    v65.left = v23;
    v65.bottom = v24;
    v65.right = v25;
    if (NSEdgeInsetsEqual(v61, v65))
    {
      CarGeneralLogging();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromRect(self->_safeFrame);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromRect(self->_visibleFrame);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v54 = v27;
        v55 = 2112;
        v56 = v28;
        _os_log_impl(&dword_1A83A2000, v26, OS_LOG_TYPE_DEFAULT, "No insets will be applied: Safe frame: (%@), viewArea frame: (%@)", buf, 0x16u);

      }
    }
    else
    {
      v50 = v24;
      v51 = v23;
      v52 = v22;
      v29 = left + self->_safeFrame.origin.x;
      v49 = top + self->_safeFrame.origin.y;
      v30 = self->_safeFrame.size.width - (left + right);
      v31 = self->_safeFrame.size.height - (top + bottom);
      CarGeneralLogging();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v30 < 740.0 || v31 < 456.0)
      {
        if (v33)
        {
          v63.origin.x = v29;
          v63.size.width = v30;
          v63.origin.y = v49;
          v63.size.height = v31;
          NSStringFromRect(v63);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = v37;
          _os_log_impl(&dword_1A83A2000, v32, OS_LOG_TYPE_DEFAULT, "Visible frame inset with OEM insets is too small (%@), not applying insets", buf, 0xCu);

        }
      }
      else
      {
        if (v33)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Left: %.1f, right: %.1f, top: %.1f, bottom: %.1f"), *(_QWORD *)&left, *(_QWORD *)&right, *(_QWORD *)&top, *(_QWORD *)&bottom);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromRect(self->_safeFrame);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v62.origin.x = v29;
          v62.size.width = v30;
          v62.origin.y = v49;
          v62.size.height = v31;
          NSStringFromRect(v62);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v54 = v34;
          v55 = 2112;
          v56 = v35;
          v57 = 2112;
          v58 = v36;
          _os_log_impl(&dword_1A83A2000, v32, OS_LOG_TYPE_DEFAULT, "Applying OEM UI insets: %@ before frame: %@, after frame: %@", buf, 0x20u);

        }
        self->_safeFrame.origin.x = v29;
        self->_safeFrame.origin.y = v49;
        self->_safeFrame.size.width = v30;
        self->_safeFrame.size.height = v31;
      }
      v23 = v51;
      v22 = v52;
      v24 = v50;
    }
  }
  else
  {
    v22 = *MEMORY[0x1E0CB2990];
    v23 = *(double *)(MEMORY[0x1E0CB2990] + 8);
    v24 = *(double *)(MEMORY[0x1E0CB2990] + 16);
    v25 = *(double *)(MEMORY[0x1E0CB2990] + 24);
  }
  v66.top = v22;
  v66.left = v23;
  v66.bottom = v24;
  v66.right = v25;
  if (!NSEdgeInsetsEqual(self->_additionalInsets, v66))
  {
    CarGeneralLogging();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Left: %.1f, right: %.1f, top: %.1f, bottom: %.1f"), *(_QWORD *)&self->_additionalInsets.left, *(_QWORD *)&self->_additionalInsets.right, *(_QWORD *)&self->_additionalInsets.top, *(_QWORD *)&self->_additionalInsets.bottom);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = v39;
      _os_log_impl(&dword_1A83A2000, v38, OS_LOG_TYPE_DEFAULT, "Additional insets provided: %@", buf, 0xCu);

    }
    v40 = self->_additionalInsets.left;
    v41 = self->_safeFrame.size.width - (v40 + self->_additionalInsets.right);
    if (v41 >= 740.0)
    {
      v42 = self->_additionalInsets.top;
      v43 = self->_safeFrame.size.height - (v42 + self->_additionalInsets.bottom);
      if (v43 >= 456.0)
      {
        v44 = self->_safeFrame.origin.x + v40;
        v45 = self->_safeFrame.origin.y + v42;
        CarGeneralLogging();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromRect(self->_safeFrame);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v64.origin.x = v44;
          v64.origin.y = v45;
          v64.size.width = v41;
          v64.size.height = v43;
          NSStringFromRect(v64);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = v47;
          v55 = 2112;
          v56 = v48;
          _os_log_impl(&dword_1A83A2000, v46, OS_LOG_TYPE_DEFAULT, "Applying additional insets: before frame: %@, after frame: %@", buf, 0x16u);

        }
        self->_safeFrame.origin.x = v44;
        self->_safeFrame.origin.y = v45;
        self->_safeFrame.size.width = v41;
        self->_safeFrame.size.height = v43;
      }
    }
  }
}

+ (NSEdgeInsets)insetsForOEMUIWithDisplaySize:(CGSize)a3 safeFrame:(CGRect)a4 viewAreaFrame:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSEdgeInsets result;

  objc_msgSend(a1, "insetsForOEMUIWithDisplaySize:originInDisplay:safeFrame:viewAreaFrame:", a3.width, a3.height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

+ (void)insetsForOEMUIWithDisplaySize:(double)a3 originInDisplay:(double)a4 safeFrame:(CGFloat)a5 viewAreaFrame:(CGFloat)a6
{
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double aRect;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;
  NSRect v53;
  NSRect v54;
  NSRect v55;
  NSRect v56;

  v52 = *MEMORY[0x1E0C80C00];
  v36 = a3 + a9;
  aRect = a4 + a10;
  v22 = a3 + a5;
  v23 = a4 + a6;
  CarGeneralLogging();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    BSNSStringFromCGSize();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    BSNSStringFromCGPoint();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53.origin.x = a9;
    v53.origin.y = a10;
    v53.size.width = a11;
    v53.size.height = a12;
    NSStringFromRect(v53);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54.origin.x = a5;
    v54.origin.y = a6;
    v54.size.width = a7;
    v54.size.height = a8;
    NSStringFromRect(v54);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55.origin.x = v36;
    v55.origin.y = aRect;
    v55.size.width = a11;
    v55.size.height = a12;
    NSStringFromRect(v55);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v56.origin.x = v22;
    v56.origin.y = v23;
    v56.size.width = a7;
    v56.size.height = a8;
    NSStringFromRect(v56);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v41 = v25;
    v42 = 2112;
    v43 = v26;
    v44 = 2112;
    v45 = v27;
    v46 = 2112;
    v47 = v28;
    v48 = 2112;
    v49 = v29;
    v50 = 2112;
    v51 = v30;
    _os_log_impl(&dword_1A83A2000, v24, OS_LOG_TYPE_DEFAULT, "Display pixel size: %@, origin in display: %@, incoming view area frame: %@, safe frame: %@, adjusted view area frame: %@, safe frame: %@", buf, 0x3Eu);

  }
  BSFloatEqualToFloat();
  BSFloatEqualToFloat();
  BSFloatEqualToFloat();
  BSFloatEqualToFloat();
  CarGeneralLogging();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v41 = v32;
    v42 = 2112;
    v43 = v33;
    v44 = 2112;
    v45 = v34;
    v46 = 2112;
    v47 = v35;
    _os_log_impl(&dword_1A83A2000, v31, OS_LOG_TYPE_DEFAULT, "Display supports view area, should inset: left: %@, right: %@, top: %@, bottom: %@", buf, 0x2Au);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  unint64_t v16;
  _BOOL4 v17;
  const char *v18;
  void *v19;
  objc_super v21;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v21.receiver = self;
  v21.super_class = (Class)CARScreenViewArea;
  -[CARScreenViewArea description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARScreenViewArea visibleFrame](self, "visibleFrame");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{x: %f, y: %f, w: %f, h: %f}"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARScreenViewArea safeFrame](self, "safeFrame");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{x: %f, y: %f, w: %f, h: %f}"), v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CARScreenViewArea displaysTransitionControl](self, "displaysTransitionControl");
  v16 = -[CARScreenViewArea statusBarEdge](self, "statusBarEdge");
  v17 = -[CARScreenViewArea supportsFocusTransfer](self, "supportsFocusTransfer");
  v18 = "no";
  if (v17)
    v18 = "yes";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {visibleFrame: %@ safeFrame: %@ displaysTransitionControl: %d statusBarEdge: %lu supportsFocusTransfer: %s}"), v4, v9, v14, v15, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  CARScreenViewArea *v4;
  BOOL v5;

  v4 = (CARScreenViewArea *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CARScreenViewArea isEqualToViewArea:](self, "isEqualToViewArea:", v4);
  }

  return v5;
}

- (BOOL)isEqualToViewArea:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  int v29;
  unint64_t v30;
  _BOOL4 v31;
  int v32;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v4 = a3;
  -[CARScreenViewArea visibleFrame](self, "visibleFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "visibleFrame");
  v36.origin.x = v13;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = v16;
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  if (!CGRectEqualToRect(v34, v36))
    goto LABEL_6;
  -[CARScreenViewArea safeFrame](self, "safeFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v4, "safeFrame");
  v37.origin.x = v25;
  v37.origin.y = v26;
  v37.size.width = v27;
  v37.size.height = v28;
  v35.origin.x = v18;
  v35.origin.y = v20;
  v35.size.width = v22;
  v35.size.height = v24;
  if (!CGRectEqualToRect(v35, v37))
    goto LABEL_6;
  v29 = -[CARScreenViewArea displaysTransitionControl](self, "displaysTransitionControl");
  if (v29 == objc_msgSend(v4, "displaysTransitionControl")
    && (v30 = -[CARScreenViewArea statusBarEdge](self, "statusBarEdge"), v30 == objc_msgSend(v4, "statusBarEdge")))
  {
    v31 = -[CARScreenViewArea supportsFocusTransfer](self, "supportsFocusTransfer");
    v32 = v31 ^ objc_msgSend(v4, "supportsFocusTransfer") ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v32) = 0;
  }

  return v32;
}

- (CGRect)visibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleFrame.origin.x;
  y = self->_visibleFrame.origin.y;
  width = self->_visibleFrame.size.width;
  height = self->_visibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)safeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_safeFrame.origin.x;
  y = self->_safeFrame.origin.y;
  width = self->_safeFrame.size.width;
  height = self->_safeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)displaysTransitionControl
{
  return self->_displaysTransitionControl;
}

- (void)setDisplaysTransitionControl:(BOOL)a3
{
  self->_displaysTransitionControl = a3;
}

- (unint64_t)statusBarEdge
{
  return self->_statusBarEdge;
}

- (void)setStatusBarEdge:(unint64_t)a3
{
  self->_statusBarEdge = a3;
}

- (CGRect)unadjustedSafeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unadjustedSafeFrame.origin.x;
  y = self->_unadjustedSafeFrame.origin.y;
  width = self->_unadjustedSafeFrame.size.width;
  height = self->_unadjustedSafeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUnadjustedSafeFrame:(CGRect)a3
{
  self->_unadjustedSafeFrame = a3;
}

- (BOOL)supportsFocusTransfer
{
  return self->_supportsFocusTransfer;
}

- (void)setSupportsFocusTransfer:(BOOL)a3
{
  self->_supportsFocusTransfer = a3;
}

- (BOOL)supportsUIOutsideSafeArea
{
  return self->_supportsUIOutsideSafeArea;
}

- (void)setSupportsUIOutsideSafeArea:(BOOL)a3
{
  self->_supportsUIOutsideSafeArea = a3;
}

- (BOOL)shouldApplyDisplayInsets
{
  return self->_shouldApplyDisplayInsets;
}

- (void)setShouldApplyDisplayInsets:(BOOL)a3
{
  self->_shouldApplyDisplayInsets = a3;
}

- (NSEdgeInsets)additionalInsets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_additionalInsets.top;
  left = self->_additionalInsets.left;
  bottom = self->_additionalInsets.bottom;
  right = self->_additionalInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAdditionalInsets:(NSEdgeInsets)a3
{
  self->_additionalInsets = a3;
}

- (CARDisplayInfoProviding)displayInfoProvider
{
  return (CARDisplayInfoProviding *)objc_loadWeakRetained((id *)&self->_displayInfoProvider);
}

- (void)setDisplayInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_displayInfoProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayInfoProvider);
}

- (void)initWithPropertySupplier:(uint64_t)a3 additionalInsets:(uint64_t)a4 viewAreaDictionary:(uint64_t)a5 wantsCornerMasks:(uint64_t)a6 displayInfoProvider:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, a1, a3, "Provided status bar edge is invalid, assigning default", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end

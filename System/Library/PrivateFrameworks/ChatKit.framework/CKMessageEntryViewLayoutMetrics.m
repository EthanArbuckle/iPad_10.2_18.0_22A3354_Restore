@implementation CKMessageEntryViewLayoutMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cachedMetricsRecalculatingIfNecessary
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  char v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  CKMessageEntryViewLayoutMetrics *v28;
  id v29;
  void *v30;
  void *v31;
  CKMessageEntryViewLayoutMetrics *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56[2];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CKEntryViewLayoutMetricsInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonTextFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pointSize");
  v8 = v7;
  objc_msgSend(v6, "fontName");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v10, "symbolicTraits");

  objc_msgSend(v4, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForKey:withDefault:", v8);
  v15 = v14;
  objc_msgSend(v4, "objectForKey:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v4, "BOOLValueForKey:withDefault:");
  v41 = objc_msgSend(v4, "unsignedIntegerValueForKey:withDefault:");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "buildVersion");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR("-"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  CKPreferredContentSizeCategory();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:");
  v56[0] = 0;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v44, v56);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v56[0];
  v49 = v6;
  v43 = (void *)v18;
  if (v19)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    v20 = objc_opt_isKindOfClass() ^ 1;
  }
  v47 = v11;
  v21 = objc_msgSend(v11, "isEqualToIgnoringCase:", v54);
  v46 = v12;
  v22 = objc_msgSend(v12, "isEqualToIgnoringCase:", v53);
  v45 = v13;
  v23 = objc_msgSend(v13, "isEqualToIgnoringCase:", v52);
  v48 = (void *)v9;
  v24 = objc_msgSend(v51, "isEqualToString:", v9);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isTextKit2Enabled");

  if (!CKIsRunningInCKTester()
    && (v20 & 1) == 0
    && v21
    && v22
    && v23
    && v15 == v8
    && v24
    && v42 == v26
    && v50 == v41)
  {
    v27 = v43;
    v28 = v43;
    v29 = v19;
    v30 = v48;
    v31 = v45;
  }
  else
  {
    v28 = objc_alloc_init(CKMessageEntryViewLayoutMetrics);
    v55 = v19;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, &v55);
    v32 = (CKMessageEntryViewLayoutMetrics *)objc_claimAutoreleasedReturnValue();
    v29 = v55;

    if (!v32)
    {
      _IMWarn();
      v30 = v48;
      v39 = v49;
      v31 = v45;
      v27 = v43;
      goto LABEL_20;
    }
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("CKEntryViewLayoutMetricsInfoLastCachedBuildVersion"));
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("CKEntryViewLayoutMetricsInfoData"));
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("CKEntryViewLayoutMetricsInfoLastCachedLocale"));
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("CKEntryViewLayoutMetricsInfoLastCachedSizeCategory"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("CKEntryViewLayoutMetricsInfoLastCachedBalloonTextFontSize"));

    v30 = v48;
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("CKEntryViewLayoutMetricsInfoLastCachedBalloonTextFontName"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v50);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("CKEntryViewLayoutMetricsInfoLastCachedBalloonTextFontSymbolicTraits"));

    v35 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "isTextKit2Enabled"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("CKEntryViewLayoutMetricsInfoUseTextLayoutManager"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v4, CFSTR("CKEntryViewLayoutMetricsInfo"));

    v31 = v45;
    v27 = v43;
  }
  v32 = v28;
  v28 = v32;
  v39 = v49;
LABEL_20:

  return v32;
}

- (CKMessageEntryViewLayoutMetrics)initWithCoder:(id)a3
{
  id v4;
  CKMessageEntryViewLayoutMetrics *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKMessageEntryViewLayoutMetrics;
  v5 = -[CKMessageEntryViewLayoutMetrics init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("entryViewContentInsets"));
    v5->_entryViewContentInsets.top = v6;
    v5->_entryViewContentInsets.left = v7;
    v5->_entryViewContentInsets.bottom = v8;
    v5->_entryViewContentInsets.right = v9;
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("entryViewTextAlignmentInsets"));
    v5->_entryViewTextAlignmentInsets.top = v10;
    v5->_entryViewTextAlignmentInsets.left = v11;
    v5->_entryViewTextAlignmentInsets.bottom = v12;
    v5->_entryViewTextAlignmentInsets.right = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("defaultEntryContentViewHeight"));
    v5->_defaultEntryContentViewHeight = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("defaultSubjectEntryContentViewHeight"));
    v5->_defaultSubjectEntryContentViewHeight = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("defaultEntryViewHeight"));
    v5->_defaultEntryViewHeight = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("defaultSubjectEntryViewHeight"));
    v5->_defaultSubjectEntryViewHeight = v17;
  }

  return v5;
}

- (CKMessageEntryViewLayoutMetrics)init
{
  CKMessageEntryViewLayoutMetrics *v2;
  CKMessageEntryViewLayoutMetrics *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryViewLayoutMetrics;
  v2 = -[CKMessageEntryViewLayoutMetrics init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKMessageEntryViewLayoutMetrics calculateTextMetrics](v2, "calculateTextMetrics");
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  double defaultEntryContentViewHeight;
  double defaultSubjectEntryContentViewHeight;
  double defaultEntryViewHeight;
  double defaultSubjectEntryViewHeight;
  id v12;

  top = self->_entryViewContentInsets.top;
  left = self->_entryViewContentInsets.left;
  bottom = self->_entryViewContentInsets.bottom;
  right = self->_entryViewContentInsets.right;
  v12 = a3;
  objc_msgSend(v12, "encodeUIEdgeInsets:forKey:", CFSTR("entryViewContentInsets"), top, left, bottom, right);
  objc_msgSend(v12, "encodeUIEdgeInsets:forKey:", CFSTR("entryViewTextAlignmentInsets"), self->_entryViewTextAlignmentInsets.top, self->_entryViewTextAlignmentInsets.left, self->_entryViewTextAlignmentInsets.bottom, self->_entryViewTextAlignmentInsets.right);
  defaultEntryContentViewHeight = self->_defaultEntryContentViewHeight;
  *(float *)&defaultEntryContentViewHeight = defaultEntryContentViewHeight;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("defaultEntryContentViewHeight"), defaultEntryContentViewHeight);
  defaultSubjectEntryContentViewHeight = self->_defaultSubjectEntryContentViewHeight;
  *(float *)&defaultSubjectEntryContentViewHeight = defaultSubjectEntryContentViewHeight;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("defaultSubjectEntryContentViewHeight"), defaultSubjectEntryContentViewHeight);
  defaultEntryViewHeight = self->_defaultEntryViewHeight;
  *(float *)&defaultEntryViewHeight = defaultEntryViewHeight;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("defaultEntryViewHeight"), defaultEntryViewHeight);
  defaultSubjectEntryViewHeight = self->_defaultSubjectEntryViewHeight;
  *(float *)&defaultSubjectEntryViewHeight = defaultSubjectEntryViewHeight;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("defaultSubjectEntryViewHeight"), defaultSubjectEntryViewHeight);

}

- (void)calculateTextMetrics
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CKTextMetricsRequest *v27;
  double v28;
  double v29;
  double v30;
  CKTextMetricsProvider *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v6 = fmin(v4, v5);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTextKit2Enabled");

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isTextKit2Enabled");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MADRID"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v12, "balloonTextFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v14, v16);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "entryViewVerticalTextFieldInsets");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v27 = -[CKTextMetricsRequest initWithAttributedString:]([CKTextMetricsRequest alloc], "initWithAttributedString:", v17);
    objc_msgSend(v12, "balloonLineFragmentPadding");
    -[CKTextMetricsRequest setLineFragmentPadding:](v27, "setLineFragmentPadding:");
    -[CKTextMetricsRequest setMaximumNumberOfLines:](v27, "setMaximumNumberOfLines:", 1);
    -[CKTextMetricsRequest setMaximumHeight:](v27, "setMaximumHeight:", 10000.0);
    -[CKTextMetricsRequest setMaximumWidth:](v27, "setMaximumWidth:", v6);
    v28 = v22;
    v29 = v22;
    v30 = v26;
    -[CKTextMetricsRequest setContainerInset:](v27, "setContainerInset:", v20, v29, v24, v26);
    v31 = objc_alloc_init(CKTextMetricsProvider);
    -[CKTextMetricsProvider metricsForRequest:](v31, "metricsForRequest:", v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "size");
    v34 = v33 - (v20 + v24);
    objc_msgSend(v32, "alignmentInset");
    v80 = v36;
    v81 = v35;
    v79 = v37;
    v39 = v38;
    v40 = v24 + v20 + v34;
    objc_msgSend(v12, "entryViewCoverMinHeight");
    if (v40 < v41)
    {
      v42 = (v41 - v40) * 0.5;
      v20 = v20 + v42;
      v24 = v24 + v42;
      v30 = 0.0;
      v40 = v41;
      v28 = 0.0;
    }
    objc_msgSend(v12, "entryViewVerticalCoverInsets");
    v44 = v43;
    v46 = v45;
    self->_entryViewTextAlignmentInsets.top = v81 + v20;
    self->_entryViewTextAlignmentInsets.left = v80 + v28;
    self->_entryViewTextAlignmentInsets.bottom = v79 + v24;
    self->_entryViewTextAlignmentInsets.right = v39 + v30;
    self->_defaultEntryContentViewHeight = v40;
    if (CKPixelWidth_once_6 != -1)
      dispatch_once(&CKPixelWidth_once_6, &__block_literal_global_93);
    v47 = *(double *)&CKPixelWidth_sPixel_6 + v40 * 2.0;
    v48 = v46 + v44 + self->_defaultEntryContentViewHeight;
    self->_defaultSubjectEntryContentViewHeight = v47;
    self->_defaultEntryViewHeight = v48;
    self->_defaultSubjectEntryViewHeight = v46 + v44 + v47;
    self->_entryViewContentInsets.top = v20;
    self->_entryViewContentInsets.left = v28;
    self->_entryViewContentInsets.bottom = v24;
    self->_entryViewContentInsets.right = v30;

  }
  else
  {
    objc_msgSend(v11, "entryViewVerticalTextFieldInsets");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;

    objc_msgSend(MEMORY[0x1E0CEAB18], "textViewUsingTextLayoutManager:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("MADRID"), &stru_1E276D870, CFSTR("ChatKit"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v58);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "balloonTextFont");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v60);

    objc_msgSend(v12, "setTextContainerInset:", v50, v52, v54, v56);
    v61 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    v82 = *MEMORY[0x1E0CEB4B0];
    v83 = v61;
    objc_msgSend(v12, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "balloonLineFragmentPadding");
    objc_msgSend(v14, "setLineFragmentPadding:");

    objc_msgSend(v14, "setMaximumNumberOfLines:", 1);
    objc_msgSend(v14, "sizeThatFits:textAlignmentInsets:isSingleLine:", &v82, 0, v6, 1.79769313e308);
    v64 = v54 + v50 + v63;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "entryViewCoverMinHeight");
    v67 = v66;

    if (v64 < v67)
    {
      v68 = (v67 - v64) * 0.5;
      v50 = v50 + v68;
      v54 = v54 + v68;
      v52 = 0.0;
      v56 = 0.0;
      v64 = v67;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "entryViewVerticalCoverInsets");
    v71 = v70;
    v73 = v72;

    v74 = v52 + *((double *)&v82 + 1);
    v75 = v54 + *(double *)&v83;
    v76 = v56 + *((double *)&v83 + 1);
    self->_entryViewTextAlignmentInsets.top = v50 + *(double *)&v82;
    self->_entryViewTextAlignmentInsets.left = v74;
    self->_entryViewTextAlignmentInsets.bottom = v75;
    self->_entryViewTextAlignmentInsets.right = v76;
    self->_defaultEntryContentViewHeight = v64;
    if (CKPixelWidth_once_6 != -1)
      dispatch_once(&CKPixelWidth_once_6, &__block_literal_global_93);
    v77 = *(double *)&CKPixelWidth_sPixel_6 + v64 * 2.0;
    v78 = v73 + v71 + self->_defaultEntryContentViewHeight;
    self->_defaultSubjectEntryContentViewHeight = v77;
    self->_defaultEntryViewHeight = v78;
    self->_defaultSubjectEntryViewHeight = v73 + v71 + v77;
    self->_entryViewContentInsets.top = v50;
    self->_entryViewContentInsets.left = v52;
    self->_entryViewContentInsets.bottom = v54;
    self->_entryViewContentInsets.right = v56;
  }

}

- (UIEdgeInsets)entryViewContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_entryViewContentInsets.top;
  left = self->_entryViewContentInsets.left;
  bottom = self->_entryViewContentInsets.bottom;
  right = self->_entryViewContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)entryViewTextAlignmentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_entryViewTextAlignmentInsets.top;
  left = self->_entryViewTextAlignmentInsets.left;
  bottom = self->_entryViewTextAlignmentInsets.bottom;
  right = self->_entryViewTextAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)defaultEntryContentViewHeight
{
  return self->_defaultEntryContentViewHeight;
}

- (double)defaultSubjectEntryContentViewHeight
{
  return self->_defaultSubjectEntryContentViewHeight;
}

- (double)defaultEntryViewHeight
{
  return self->_defaultEntryViewHeight;
}

- (double)defaultSubjectEntryViewHeight
{
  return self->_defaultSubjectEntryViewHeight;
}

@end

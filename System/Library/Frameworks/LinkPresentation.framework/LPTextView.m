@implementation LPTextView

- (LPTextView)initWithHost:(id)a3
{

  return 0;
}

- (LPTextView)initWithHost:(id)a3 text:(id)a4 style:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPTextView *v11;
  uint64_t v12;
  NSAttributedString *attributedString;
  uint64_t v14;
  LPTextViewStyle *style;
  void *v16;
  void *v17;
  id v18;
  LPTextView *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)LPTextView;
  v11 = -[LPComponentView initWithHost:](&v21, sel_initWithHost_, v8);
  if (v11)
  {
    truncatedAttributedStringAtMaximumMetadataLength(v9);
    v12 = objc_claimAutoreleasedReturnValue();
    attributedString = v11->_attributedString;
    v11->_attributedString = (NSAttributedString *)v12;

    objc_msgSend(v10, "adjustedForString:", v11->_attributedString);
    v14 = objc_claimAutoreleasedReturnValue();
    style = v11->_style;
    v11->_style = (LPTextViewStyle *)v14;

    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)-[LPTextView registerForTraitChanges:withHandler:](v11, "registerForTraitChanges:withHandler:", v17, &__block_literal_global_16);

    v19 = v11;
  }

  return v11;
}

uint64_t __38__LPTextView_initWithHost_text_style___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_userInterfaceStyleDidChange");
}

- (void)_buildSubviewsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (!self->_textView)
  {
    -[LPTextView effectiveAttributedString](self, "effectiveAttributedString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[LPTextView _createTextViewWithAttributedString:](self, "_createTextViewWithAttributedString:");

    -[LPTextViewStyle compositingFilter](self->_style, "compositingFilter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[LPTextViewStyle compositingFilter](self->_style, "compositingFilter");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[UILabel layer](self->_textView, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCompositingFilter:", v10);

    }
    if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = objc_msgSend(v11, "CGColor");
      -[UILabel layer](self->_textView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBorderColor:", v5);

      -[UILabel layer](self->_textView, "layer");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderWidth:", 0.5);

    }
    -[LPTextViewStyle font](self->_style, "font");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ascender");
    self->_ascender = v7;

    -[LPTextViewStyle font](self->_style, "font");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "descender");
    self->_descender = v8;

  }
}

- (BOOL)_lp_isLTR
{
  LPTextView *v2;
  LPTextView *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  objc_super v9;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v5 = objc_msgSend(v4, "semanticContentAttribute");
      v6 = v5 == 3;
      if (v5 == 3 || objc_msgSend(v4, "semanticContentAttribute") == 4)
        goto LABEL_10;
      objc_msgSend(v4, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v4 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)LPTextView;
  v6 = -[UIView _lp_isLTR](&v9, sel__lp_isLTR);
LABEL_10:

  return v6;
}

- (id)effectiveAttributedString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSAttributedString *attributedString;
  LPTextViewStyle *style;
  NSRegularExpression *emphasizedTextExpression;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v16;

  -[LPComponentView host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVibrancyForComponentView:", self);

  if ((_DWORD)v4)
  {
    -[LPTextViewStyle color](self->_style, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    vibrancyEffectStyleForColor(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6 != 0;

  }
  v7 = -[UIView _lp_prefersDarkInterface](self, "_lp_prefersDarkInterface");
  attributedString = self->_attributedString;
  style = self->_style;
  emphasizedTextExpression = self->_emphasizedTextExpression;
  -[UIView _lp_tintColor](self, "_lp_tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LPTextView _lp_isLTR](self, "_lp_isLTR");
  -[LPTextViewStyle font](self->_style, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = v12;
  +[LPTextView attributedString:resolvedAgainstStyle:withEmphasizedTextExpression:tintColor:lineBreakMode:usesVibrancy:forLTR:withFont:userInterfaceStyle:](LPTextView, "attributedString:resolvedAgainstStyle:withEmphasizedTextExpression:tintColor:lineBreakMode:usesVibrancy:forLTR:withFont:userInterfaceStyle:", attributedString, style, emphasizedTextExpression, v11, 4, v4, v16, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)attributedString:(id)a3 resolvedAgainstStyle:(id)a4 withEmphasizedTextExpression:(id)a5 tintColor:(id)a6 lineBreakMode:(int64_t)a7 usesVibrancy:(BOOL)a8 forLTR:(BOOL)a9 withFont:(id)a10 userInterfaceStyle:(int64_t)a11
{
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD *v88;
  uint64_t *v89;
  _QWORD v90[3];
  char v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _QWORD v98[4];
  id v99;
  BOOL v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  _QWORD v105[3];
  _QWORD v106[5];

  v106[3] = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v16 = a4;
  v77 = a5;
  v74 = a6;
  v75 = a10;
  v17 = objc_msgSend(v16, "textAlignment");
  v18 = 2;
  if (a9)
    v18 = 0;
  v19 = 2;
  if (!a9)
    v19 = 0;
  if (v17 != 1)
    v19 = v17 == 2;
  if (v17)
    v20 = v19;
  else
    v20 = v18;
  objc_msgSend(MEMORY[0x1E0DC33B0], "defaultParagraphStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  v78 = v22;
  objc_msgSend(v22, "setAlignment:", v20);
  objc_msgSend(v22, "setLineBreakMode:", a7);
  objc_msgSend(v16, "hyphenationFactor");
  objc_msgSend(v22, "setHyphenationFactor:");
  objc_msgSend(v16, "paragraphSpacing");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "value");
  objc_msgSend(v22, "setParagraphSpacing:");

  v24 = MEMORY[0x1E0C809B0];
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke;
  v98[3] = &unk_1E44A9608;
  v25 = v16;
  v99 = v25;
  v100 = a8;
  __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke((uint64_t)v98);
  v26 = objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__4;
  v96 = __Block_byref_object_dispose__4;
  v27 = (void *)MEMORY[0x1E0C99E08];
  v28 = *MEMORY[0x1E0DC32A8];
  v105[0] = *MEMORY[0x1E0DC32A0];
  v105[1] = v28;
  v71 = v28;
  v106[0] = v75;
  v106[1] = v26;
  v73 = (void *)v26;
  v105[2] = *MEMORY[0x1E0DC32C0];
  v106[2] = v78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryWithDictionary:", v29);
  v97 = (id)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v79, "length");
  objc_msgSend(v79, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("LPOverrideThemeAttribute"), 0, 0, 0, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = objc_msgSend(v31, "BOOLValue");

  if ((_DWORD)v29)
  {
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    v91 = 0;
    v86[0] = v24;
    v86[1] = 3221225472;
    v86[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13;
    v86[3] = &unk_1E44A9630;
    v88 = v90;
    v87 = v79;
    v89 = &v92;
    objc_msgSend(v87, "enumerateAttributesInRange:options:usingBlock:", 0, v30, 0, v86);

    _Block_object_dispose(v90, 8);
  }
  v72 = (void *)objc_msgSend(v79, "mutableCopy");
  objc_msgSend(v25, "shadow");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if (a11 == 1)
      v33 = 2;
    else
      v33 = 1;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shadow");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "valueForAppearance:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = objc_alloc_init(MEMORY[0x1E0DC33C0]);
      objc_msgSend(v36, "offset");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "asSize");
      objc_msgSend(v37, "setShadowOffset:");

      objc_msgSend(v36, "radius");
      objc_msgSend(v37, "setShadowBlurRadius:");
      objc_msgSend(v36, "color");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setShadowColor:", v39);

      objc_msgSend(v72, "addAttribute:value:range:", *MEMORY[0x1E0DC32C8], v37, 0, v30);
    }

  }
  v40 = *MEMORY[0x1E0DC3288];
  v83[0] = v24;
  v83[1] = 3221225472;
  v83[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_17;
  v83[3] = &unk_1E44A9658;
  v41 = v75;
  v84 = v41;
  v42 = v72;
  v85 = v42;
  objc_msgSend(v79, "enumerateAttribute:inRange:options:usingBlock:", v40, 0, v30, 0, v83);
  objc_msgSend(v42, "addAttributes:range:", v93[5], 0, v30);
  if (v77)
  {
    objc_msgSend(v79, "string");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v24;
    v80[1] = 3221225472;
    v80[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_2;
    v80[3] = &unk_1E44A9680;
    v81 = v42;
    v82 = v74;
    objc_msgSend(v77, "enumerateMatchesInString:options:range:usingBlock:", v43, 0, 0, v30, v80);

  }
  objc_msgSend(v25, "leadingGlyph");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "image");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v76, "platformImage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v41, "pointSize");
    objc_msgSend(v46, "configurationWithPointSize:weight:", objc_msgSend(v41, "_lp_symbolWeight"), v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "imageWithConfiguration:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "imageWithRenderingMode:", 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
    objc_msgSend(v51, "setImage:", v50);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "mutableCopy");

    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v53, "appendAttributedString:", v54);

    v103 = v71;
    objc_msgSend(v25, "leadingGlyph");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "opacity");
    objc_msgSend(v73, "colorWithAlphaComponent:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addAttributes:range:", v57, 0, 2);

    objc_msgSend(v42, "insertAttributedString:atIndex:", v53, 0);
  }
  objc_msgSend(v25, "trailingGlyph");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "image");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v59, "platformImage");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "imageWithRenderingMode:", 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
    objc_msgSend(v62, "setImage:", v61);
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    v64 = (void *)objc_msgSend(v63, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "appendAttributedString:", v65);

    v101 = v71;
    objc_msgSend(v25, "trailingGlyph");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "color");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v67;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addAttributes:range:", v68, 0, 2);

    objc_msgSend(v42, "appendAttributedString:", v64);
  }
  v69 = v42;

  _Block_object_dispose(&v92, 8);
  return v69;
}

id __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "shadow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 || !*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11 = LPLogChannelUI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13_cold_1(a1, v11);
    abort();
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v10, v8);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_17(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a2;
  if (v7)
  {
    v19 = v7;
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "_lp_isSymbolImage") & 1) != 0)
    {
      objc_msgSend(v8, "symbolConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(*(id *)(a1 + 32), "pointSize");
      objc_msgSend(v10, "configurationWithPointSize:weight:scale:", objc_msgSend(*(id *)(a1 + 32), "_lp_symbolWeight"), 1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9
        || (objc_msgSend(v9, "configurationByApplyingConfiguration:", v12),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "configurationByApplyingConfiguration:", v9),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v13, "isEqualToConfiguration:", v14),
            v14,
            v13,
            (v15 & 1) != 0))
      {
        v16 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
        objc_msgSend(v8, "_lp_imageByApplyingSymbolConfiguration:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setImage:", v17);

        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", a3, a4, v18);

      }
    }

    v7 = v19;
  }

}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = *MEMORY[0x1E0DC32A8];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "range");
  objc_msgSend(v5, "addAttributes:range:", v6, v7, v8);

}

+ (id)attributedStringHidingNonColoredRanges:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixAttributesInRange:", 0, v4);
  v6 = *MEMORY[0x1E0DC32A0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__LPTextView_attributedStringHidingNonColoredRanges___block_invoke;
  v22[3] = &unk_1E44A96A8;
  v7 = v5;
  v23 = v7;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 0, v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    v11 = *MEMORY[0x1E0DC32A8];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "rangeValue");
        objc_msgSend(v3, "addAttribute:value:range:", v11, v14, v15, v16);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

  return v3;
}

void __53__LPTextView_attributedStringHidingNonColoredRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  __int16 v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "symbolicTraits");

  if ((v8 & 0x2000) == 0)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
  }
}

- (LPTextViewStyle)style
{
  return self->_style;
}

- (double)firstLineLeading
{
  void *v2;
  double v3;
  double v4;

  -[LPTextViewStyle firstLineLeading](self->_style, "firstLineLeading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (double)lastLineDescent
{
  void *v2;
  double v3;
  double v4;

  -[LPTextViewStyle lastLineDescent](self->_style, "lastLineDescent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (double)ascender
{
  return self->_ascender;
}

- (double)descender
{
  return self->_descender;
}

- (int64_t)computedNumberOfLines
{
  -[LPTextView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  return -[UILabel _measuredNumberOfLines](self->_textView, "_measuredNumberOfLines");
}

- (void)setOverrideMaximumNumberOfLines:(int64_t)a3
{
  self->_overrideMaximumNumberOfLines = a3;
  -[UILabel setNumberOfLines:](self->_textView, "setNumberOfLines:", -[LPTextView effectiveMaximumNumberOfLines](self, "effectiveMaximumNumberOfLines"));
  -[UILabel setNumberOfLines:](self->_coloredGlyphsView, "setNumberOfLines:", -[LPTextView effectiveMaximumNumberOfLines](self, "effectiveMaximumNumberOfLines"));
}

- (UIEdgeInsets)effectiveInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[LPTextViewStyle padding](self->_style, "padding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asInsetsForLTR:", -[LPTextView _lp_isLTR](self, "_lp_isLTR"));
  v5 = v4 + self->_contentInset.top;
  v7 = v6 + self->_contentInset.left;
  v9 = v8 + self->_contentInset.bottom;
  v11 = v10 + self->_contentInset.right;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGRect)textRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[LPTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[LPTextView effectiveInsets](self, "effectiveInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (int64_t)effectiveMaximumNumberOfLines
{
  int64_t overrideMaximumNumberOfLines;

  overrideMaximumNumberOfLines = self->_overrideMaximumNumberOfLines;
  if (!overrideMaximumNumberOfLines)
    return -[LPTextViewStyle maximumLines](self->_style, "maximumLines");
  return overrideMaximumNumberOfLines;
}

- (void)layoutComponentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIVisualEffectView *effectView;

  -[LPTextView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  -[LPTextView textRect](self, "textRect");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  effectView = self->_effectView;
  if (effectView)
  {
    -[UIVisualEffectView setFrame:](effectView, "setFrame:", v3, v4, v5, v6);
    -[UILabel setFrame:](self->_coloredGlyphsView, "setFrame:", v7, v8, v9, v10);
    v7 = 0.0;
    v8 = 0.0;
  }
  -[UILabel setFrame:](self->_textView, "setFrame:", v7, v8, v9, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LPTextView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  -[LPTextView effectiveInsets](self, "effectiveInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UILabel sizeThatFits:](self->_textView, "sizeThatFits:", width - (v8 + v12), height - (v6 + v10));
  v16 = ceil(v14) - (-v13 - v9);
  v17 = ceil(v15) - (-v11 - v7);
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_updateAttributedString
{
  id v3;

  -[LPTextView effectiveAttributedString](self, "effectiveAttributedString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[LPTextView applyAttributedString:](self, "applyAttributedString:");

}

- (void)setEmphasizedTextExpression:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  -[LPTextView _updateAttributedString](self, "_updateAttributedString");
}

- (void)_userInterfaceStyleDidChange
{
  if (self->_effectView)
    -[LPTextView _updateEffectViewEffect](self, "_updateEffectViewEffect");
  -[LPTextView _updateAttributedString](self, "_updateAttributedString");
}

- (id)_createLabel
{
  id v3;
  double v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setNumberOfLines:", -[LPTextView effectiveMaximumNumberOfLines](self, "effectiveMaximumNumberOfLines"));
  objc_msgSend(v3, "setBaselineAdjustment:", 2);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  objc_msgSend(v3, "setPreferredVibrancy:", 0);
  return v3;
}

- (BOOL)_needsColoredGlyphsView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[LPComponentView host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVibrancyForComponentView:", self);

  if ((v4 & 1) == 0)
    return 0;
  -[LPTextViewStyle color](self->_style, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  vibrancyEffectStyleForColor(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue") != 0;
  else
    v7 = 0;

  return v7;
}

- (void)_updateEffectViewEffect
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[LPComponentView host](self, "host");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v10, "allowsVibrancyForComponentView:", self);

  if ((v3 & 1) != 0)
  {
    -[LPTextViewStyle color](self->_style, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    vibrancyEffectStyleForColor(v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v11;
    if (v11)
    {
      v6 = (void *)MEMORY[0x1E0DC3510];
      -[LPComponentView host](self, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "effectWithStyle:", objc_msgSend(v7, "blurEffectStyleBehindComponentView:", self));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v8, objc_msgSend(v11, "integerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v9);

      v5 = v11;
    }

  }
}

- (void)_createTextViewWithAttributedString:(id)a3
{
  UILabel *v4;
  UILabel *textView;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  UIVisualEffectView *v10;
  UIVisualEffectView *effectView;
  void *v12;
  UILabel *v13;
  UILabel *coloredGlyphsView;
  id v15;

  v15 = a3;
  -[LPTextView _createLabel](self, "_createLabel");
  v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v4;

  -[LPComponentView host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsVibrancyForComponentView:", self);

  if (v7)
  {
    -[LPTextViewStyle color](self->_style, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    vibrancyEffectStyleForColor(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
      effectView = self->_effectView;
      self->_effectView = v10;

      -[LPTextView _updateEffectViewEffect](self, "_updateEffectViewEffect");
      -[UIVisualEffectView contentView](self->_effectView, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_textView);

      -[LPTextView addSubview:](self, "addSubview:", self->_effectView);
      if (-[LPTextView _needsColoredGlyphsView](self, "_needsColoredGlyphsView"))
      {
        -[LPTextView _createLabel](self, "_createLabel");
        v13 = (UILabel *)objc_claimAutoreleasedReturnValue();
        coloredGlyphsView = self->_coloredGlyphsView;
        self->_coloredGlyphsView = v13;

        -[LPTextView addSubview:](self, "addSubview:", self->_coloredGlyphsView);
      }
    }

  }
  if (!self->_effectView)
    -[LPTextView addSubview:](self, "addSubview:", self->_textView);
  -[LPTextView applyAttributedString:](self, "applyAttributedString:", v15);

}

- (void)applyAttributedString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UILabel setAttributedText:](self->_textView, "setAttributedText:");
  if (self->_coloredGlyphsView)
  {
    +[LPTextView attributedStringHidingNonColoredRanges:](LPTextView, "attributedStringHidingNonColoredRanges:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_coloredGlyphsView, "setAttributedText:", v4);

  }
}

- (id)firstBaselineAnchor
{
  -[LPTextView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  return (id)-[UILabel firstBaselineAnchor](self->_textView, "firstBaselineAnchor");
}

- (id)lastBaselineAnchor
{
  -[LPTextView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  return (id)-[UILabel lastBaselineAnchor](self->_textView, "lastBaselineAnchor");
}

- (id)subtitleButton
{
  return 0;
}

- (int64_t)overrideMaximumNumberOfLines
{
  return self->_overrideMaximumNumberOfLines;
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_coloredGlyphsView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A0C41000, a2, OS_LOG_TYPE_ERROR, "All the attributes in the attributed string must span the entire string range: %@", (uint8_t *)&v3, 0xCu);
}

@end

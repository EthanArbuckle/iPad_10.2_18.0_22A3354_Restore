@implementation LPEmailCompatibleHTMLTextComponent

- (LPEmailCompatibleHTMLTextComponent)initWithCaption:(id)a3 style:(id)a4 themePath:(id)a5 generator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LPEmailCompatibleHTMLTextComponent *v14;
  uint64_t v15;
  LPEmailCompatibleHTMLTextComponent *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  LPEmailCompatibleHTMLTextComponent *v59;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  objc_super v71;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v71.receiver = self;
  v71.super_class = (Class)LPEmailCompatibleHTMLTextComponent;
  v14 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v71, sel_initWithTagName_themePath_generator_, CFSTR("div"), v12, v13);
  v16 = v14;
  if (v14)
  {
    LPWebLock(v14, v15);
    objc_msgSend(v10, "attributedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v10;
    v61 = v13;
    v62 = v12;
    objc_msgSend(v11, "adjustedForString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke;
    v66[3] = &unk_1E44A9E88;
    v19 = v13;
    v67 = v19;
    v20 = v12;
    v68 = v20;
    v21 = v10;
    v69 = v21;
    v11 = v18;
    v70 = v11;
    __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke((id *)v66);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "_lp_CSSText");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textScale");
    v23 = v22;
    objc_msgSend(v11, "font");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v24, "pointSize");
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%gpx"), v23 * v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "cssResolver");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localVariables");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-font-size"), v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, v30);

    CSSAlignmentFromLPTextAlignment(objc_msgSend(v11, "textAlignment"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cssResolver");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localVariables");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-text-alignment"), v20);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, v34);

    objc_msgSend(v19, "cssResolver");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lp-rich-link-"), "stringByAppendingString:", v20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v16, "element");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addStyle:toElement:inComponent:", v36, v37, v16);

    -[LPHTMLComponent generator](v16, "generator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "parentDocument");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "createElement:", CFSTR("a"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "setAttribute:value:", CFSTR("rel"), CFSTR("nofollow"));
    -[LPHTMLComponent generator](v16, "generator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "URL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "absoluteString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAttribute:value:", CFSTR("href"), v43);

    objc_msgSend(v40, "setAttribute:value:", CFSTR("style"), CFSTR("text-decoration: none"));
    objc_msgSend(v40, "setAttribute:value:", CFSTR("draggable"), CFSTR("false"));
    -[LPHTMLComponent generator](v16, "generator");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "parentDocument");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "createElement:", CFSTR("font"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "setAttribute:value:", CFSTR("color"), v64);
    v47 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v63, "_lp_CSSTextForcingUserInterfaceStyle:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("color: %@;"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAttribute:value:", CFSTR("style"), v49);

    v50 = (id)objc_msgSend(v40, "appendChild:", v46);
    -[LPHTMLComponent generator](v16, "generator");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "parentDocument");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "text");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    truncatedStringAtMaximumMetadataLength(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "createTextNode:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (id)objc_msgSend(v46, "appendChild:", v55);

    -[LPHTMLComponent element](v16, "element");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (id)objc_msgSend(v57, "appendChild:", v40);

    v59 = v16;
    v10 = v65;
    v13 = v61;
    v12 = v62;
  }

  return v16;
}

id __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke(id *a1)
{
  void (**v2)(void *, void *);
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  _QWORD aBlock[4];
  id v9;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke_2;
  aBlock[3] = &unk_1E44A9E60;
  v9 = a1[4];
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ((objc_msgSend(a1[5], "containsString:", CFSTR("mediaTopCaptionBar")) & 1) != 0
    || objc_msgSend(a1[5], "containsString:", CFSTR("mediaBottomCaptionBar")))
  {
    +[LPTheme primaryLabelColor](LPTheme, "primaryLabelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2[2](v2, v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1[6], "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1[6], "color");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    objc_msgSend(a1[7], "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2[2](v2, v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

LABEL_5:
  return v5;
}

id __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dominantImageBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "dominantImageBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "deprecatedLuminosityLevel") == 1;

    objc_msgSend(v3, "_lp_colorForcingUserInterfaceStyle:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v3;
  }
  v8 = v7;

  return v8;
}

+ (id)baseRules
{
  LPCSSVariable *v2;
  LPCSSVariable *v3;
  LPCSSVariable *v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("hidden");
  v7[0] = CFSTR("overflow");
  v7[1] = CFSTR("font-size");
  v2 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-font-size"));
  v8[1] = v2;
  v7[2] = CFSTR("font-weight");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("<theme-path>-font-_lp_CSSFontWeight"));
  v8[2] = v3;
  v7[3] = CFSTR("text-align");
  v4 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-text-alignment"));
  v8[3] = v4;
  v8[4] = CFSTR("break-word");
  v7[4] = CFSTR("word-wrap");
  v7[5] = CFSTR("text-overflow");
  v8[5] = CFSTR("ellipsis");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  objc_msgSend(a1, "baseRules", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

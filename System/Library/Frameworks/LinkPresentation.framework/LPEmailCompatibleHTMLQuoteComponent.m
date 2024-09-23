@implementation LPEmailCompatibleHTMLQuoteComponent

- (LPEmailCompatibleHTMLQuoteComponent)initWithText:(id)a3 style:(id)a4 themePath:(id)a5 generator:(id)a6
{
  id v10;
  id v11;
  id v12;
  LPEmailCompatibleHTMLQuoteComponent *v13;
  uint64_t v14;
  LPEmailCompatibleHTMLQuoteComponent *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  LPEmailCompatibleHTMLQuoteComponent *v56;
  id v58;
  objc_super v59;

  v58 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v59.receiver = self;
  v59.super_class = (Class)LPEmailCompatibleHTMLQuoteComponent;
  v13 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v59, sel_initWithTagName_themePath_generator_, CFSTR("div"), v11, v12);
  v15 = v13;
  if (v13)
  {
    LPWebLock(v13, v14);
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pointSize");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%gpt"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cssResolver");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localVariables");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-font-size"), v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, v22);

    CSSAlignmentFromLPTextAlignment(objc_msgSend(v10, "textAlignment"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cssResolver");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localVariables");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-text-alignment"), v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v26);

    objc_msgSend(v10, "color");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_lp_CSSText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cssResolver");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localVariables");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-color"), v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, v31);

    objc_msgSend(v12, "rootWidth");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "value");
    v34 = v33;
    objc_msgSend(v10, "padding");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leading");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "value");
    v38 = v37;
    objc_msgSend(v10, "padding");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailing");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "value");
    v42 = v34 - v38 - v41;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%gpx"), *(_QWORD *)&v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cssResolver");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localVariables");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-width"), v11);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v43, v46);

    objc_msgSend(v12, "cssResolver");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lp-rich-link-"), "stringByAppendingString:", v11);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v15, "element");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addStyle:toElement:inComponent:", v48, v49, v15);

    -[LPHTMLComponent element](v15, "element");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](v15, "generator");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "parentDocument");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    truncatedStringAtMaximumMetadataLength(v58);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "createTextNode:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (id)objc_msgSend(v50, "appendChild:", v54);

    v56 = v15;
  }

  return v15;
}

+ (id)baseRules
{
  LPCSSVariable *v2;
  LPCSSVariable *v3;
  LPCSSVariable *v4;
  LPCSSVariable *v5;
  LPCSSVariable *v6;
  void *v7;
  _QWORD v9[8];
  _QWORD v10[9];

  v10[8] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("hidden");
  v9[0] = CFSTR("overflow");
  v9[1] = CFSTR("color");
  v2 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-color"));
  v10[1] = v2;
  v9[2] = CFSTR("font-size");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-font-size"));
  v10[2] = v3;
  v10[3] = CFSTR("300");
  v9[3] = CFSTR("font-weight");
  v9[4] = CFSTR("margin");
  v4 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("<theme-path>-padding"));
  v10[4] = v4;
  v9[5] = CFSTR("width");
  v5 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-width"));
  v10[5] = v5;
  v10[6] = CFSTR("break-word");
  v9[6] = CFSTR("word-wrap");
  v9[7] = CFSTR("text-align");
  v6 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-text-alignment"));
  v10[7] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  objc_msgSend(a1, "baseRules", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

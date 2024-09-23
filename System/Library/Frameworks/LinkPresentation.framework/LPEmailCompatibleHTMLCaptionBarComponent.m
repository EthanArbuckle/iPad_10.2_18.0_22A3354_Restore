@implementation LPEmailCompatibleHTMLCaptionBarComponent

- (LPEmailCompatibleHTMLCaptionBarComponent)initWithStyle:(id)a3 presentationProperties:(id)a4 themePath:(id)a5 generator:(id)a6
{
  id v11;
  id v12;
  id v13;
  LPEmailCompatibleHTMLCaptionBarComponent *v14;
  LPEmailCompatibleHTMLCaptionBarComponent *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  LPEmailCompatibleHTMLCaptionBarComponent *v37;
  id v39;
  objc_super v40;

  v39 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)LPEmailCompatibleHTMLCaptionBarComponent;
  v14 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v40, sel_initWithTagName_themePath_generator_, CFSTR("table"), v12, v13);
  v15 = v14;
  if (v14)
  {
    LPWebLock();
    objc_storeStrong((id *)&v14->_style, a3);
    objc_storeStrong((id *)&v14->_presentationProperties, a4);
    -[LPHTMLComponent element](v14, "element");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_lp_CSSText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttribute:value:", CFSTR("bgcolor"), v18);

    objc_msgSend(v13, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_lp_CSSTextForcingUserInterfaceStyle:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cssResolver");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localVariables");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-backgroundColor"), v12, v39);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v23);

    objc_msgSend(v13, "dominantImageBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v13, "cssResolver");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localVariables");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("local-%@-colorFilter"), v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("initial"), v27);

    }
    -[LPHTMLComponent element](v15, "element");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAttribute:value:", CFSTR("cellpadding"), CFSTR("0"));

    -[LPHTMLComponent element](v15, "element");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAttribute:value:", CFSTR("cellspacing"), CFSTR("0"));

    -[LPHTMLComponent element](v15, "element");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootWidth");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_lp_HTMLAttributeText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAttribute:value:", CFSTR("width"), v32);

    objc_msgSend(v13, "cssResolver");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent themePath](v15, "themePath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lp-rich-link-"), "stringByAppendingString:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v15, "element");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addStyle:toElement:inComponent:", v35, v36, v15);

    -[LPEmailCompatibleHTMLCaptionBarComponent buildComponents](v15, "buildComponents");
    v37 = v15;
  }

  return v15;
}

- (void)buildComponents
{
  LPEmailCompatibleHTMLCaptionBarRowComponent *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v8;
  void *v9;
  void *v10;
  void *v11;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  LPEmailCompatibleHTMLIconComponent *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  LPEmailCompatibleHTMLIconComponent *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  LPEmailCompatibleHTMLInnerLinkComponent *v35;
  void *v36;
  void *v37;
  LPEmailCompatibleHTMLInnerLinkComponent *v38;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v39;
  void *v40;
  void *v41;
  void *v42;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v43;
  LPEmailCompatibleHTMLVerticalTextStackComponent *v44;
  void *v45;
  LPCaptionBarPresentationProperties *presentationProperties;
  void *v47;
  void *v48;
  LPEmailCompatibleHTMLVerticalTextStackComponent *v49;
  void *v50;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v51;
  void *v52;
  void *v53;
  void *v54;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  LPEmailCompatibleHTMLIconComponent *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  LPEmailCompatibleHTMLIconComponent *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  LPEmailCompatibleHTMLInnerLinkComponent *v78;
  void *v79;
  void *v80;
  LPEmailCompatibleHTMLInnerLinkComponent *v81;
  uint64_t v82;
  LPEmailCompatibleHTMLCaptionBarRowComponent *v83;

  LPWebLock(self, a2);
  v3 = [LPEmailCompatibleHTMLCaptionBarRowComponent alloc];
  -[LPHTMLComponent themePath](self, "themePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPHTMLComponent generator](self, "generator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[LPEmailCompatibleHTMLCaptionBarRowComponent initWithThemePath:generator:](v3, "initWithThemePath:generator:", v4, v5);

  -[LPHTMLComponent addChild:](self, "addChild:", v83);
  -[LPCaptionBarPresentationProperties leftIcon](self->_presentationProperties, "leftIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0x1EE5CE000;
  if (v6)
  {
    v8 = [LPEmailCompatibleHTMLCaptionBarItemComponent alloc];
    -[LPCaptionBarStyle leftIcon](self->_style, "leftIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent childThemePathWithName:](self, "childThemePathWithName:", CFSTR("leftIcon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](self, "generator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[LPEmailCompatibleHTMLCaptionBarItemComponent initWithStyle:themePath:generator:](v8, "initWithStyle:themePath:generator:", v9, v10, v11);

    -[LPHTMLComponent element](v12, "element");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarStyle leftIcon](self->_style, "leftIcon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fixedSize");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "width");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_lp_HTMLAttributeText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttribute:value:", CFSTR("width"), v17);

    -[LPHTMLComponent addChild:](v83, "addChild:", v12);
    v18 = [LPEmailCompatibleHTMLIconComponent alloc];
    -[LPCaptionBarPresentationProperties leftIcon](self->_presentationProperties, "leftIcon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarStyle leftIcon](self->_style, "leftIcon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarPresentationProperties leftIconProperties](self->_presentationProperties, "leftIconProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent childThemePathWithName:](self, "childThemePathWithName:", CFSTR("leftIcon"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](self, "generator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[LPEmailCompatibleHTMLIconComponent initWithImage:style:properties:themePath:generator:](v18, "initWithImage:style:properties:themePath:generator:", v19, v20, v21, v22, v23);

    -[LPHTMLComponent element](v24, "element");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarStyle leftIcon](self->_style, "leftIcon");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fixedSize");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "width");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_lp_HTMLAttributeText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAttribute:value:", CFSTR("width"), v29);

    -[LPHTMLComponent element](v24, "element");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarStyle leftIcon](self->_style, "leftIcon");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fixedSize");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "height");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_lp_HTMLAttributeText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAttribute:value:", CFSTR("height"), v34);

    v35 = [LPEmailCompatibleHTMLInnerLinkComponent alloc];
    -[LPHTMLComponent themePath](self, "themePath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](self, "generator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[LPEmailCompatibleHTMLInnerLinkComponent initWithThemePath:generator:](v35, "initWithThemePath:generator:", v36, v37);

    -[LPHTMLComponent addChild:](v38, "addChild:", v24);
    -[LPHTMLComponent addChild:](v12, "addChild:", v38);

    v7 = 0x1EE5CE000uLL;
  }
  v39 = [LPEmailCompatibleHTMLCaptionBarItemComponent alloc];
  v82 = *(int *)(v7 + 896);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v82), "textStack");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPHTMLComponent childThemePathWithName:](self, "childThemePathWithName:", CFSTR("textStack"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPHTMLComponent generator](self, "generator");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[LPEmailCompatibleHTMLCaptionBarItemComponent initWithStyle:themePath:generator:](v39, "initWithStyle:themePath:generator:", v40, v41, v42);

  -[LPHTMLComponent addChild:](v83, "addChild:", v43);
  v44 = [LPEmailCompatibleHTMLVerticalTextStackComponent alloc];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v82), "textStack");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  presentationProperties = self->_presentationProperties;
  -[LPHTMLComponent childThemePathWithName:](self, "childThemePathWithName:", CFSTR("textStack"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPHTMLComponent generator](self, "generator");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[LPEmailCompatibleHTMLVerticalTextStackComponent initWithStyle:presentationProperties:themePath:generator:](v44, "initWithStyle:presentationProperties:themePath:generator:", v45, presentationProperties, v47, v48);

  -[LPHTMLComponent addChild:](v43, "addChild:", v49);
  -[LPCaptionBarPresentationProperties rightIcon](self->_presentationProperties, "rightIcon");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    v51 = [LPEmailCompatibleHTMLCaptionBarItemComponent alloc];
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v82), "rightIcon");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent childThemePathWithName:](self, "childThemePathWithName:", CFSTR("rightIcon"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](self, "generator");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[LPEmailCompatibleHTMLCaptionBarItemComponent initWithStyle:themePath:generator:](v51, "initWithStyle:themePath:generator:", v52, v53, v54);

    -[LPHTMLComponent element](v55, "element");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v82), "rightIcon");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "fixedSize");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "width");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "_lp_HTMLAttributeText");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setAttribute:value:", CFSTR("width"), v60);

    -[LPHTMLComponent addChild:](v83, "addChild:", v55);
    v61 = [LPEmailCompatibleHTMLIconComponent alloc];
    -[LPCaptionBarPresentationProperties rightIcon](self->_presentationProperties, "rightIcon");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v82), "rightIcon");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarPresentationProperties rightIconProperties](self->_presentationProperties, "rightIconProperties");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent childThemePathWithName:](self, "childThemePathWithName:", CFSTR("rightIcon"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](self, "generator");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[LPEmailCompatibleHTMLIconComponent initWithImage:style:properties:themePath:generator:](v61, "initWithImage:style:properties:themePath:generator:", v62, v63, v64, v65, v66);

    -[LPHTMLComponent element](v67, "element");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v82), "rightIcon");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "fixedSize");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "width");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "_lp_HTMLAttributeText");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setAttribute:value:", CFSTR("width"), v72);

    -[LPHTMLComponent element](v67, "element");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v82), "rightIcon");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "fixedSize");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "height");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "_lp_HTMLAttributeText");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setAttribute:value:", CFSTR("height"), v77);

    v78 = [LPEmailCompatibleHTMLInnerLinkComponent alloc];
    -[LPHTMLComponent themePath](self, "themePath");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](self, "generator");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[LPEmailCompatibleHTMLInnerLinkComponent initWithThemePath:generator:](v78, "initWithThemePath:generator:", v79, v80);

    -[LPHTMLComponent addChild:](v81, "addChild:", v67);
    -[LPHTMLComponent addChild:](v55, "addChild:", v81);

  }
}

+ (id)baseRules
{
  LPCSSVariable *v2;
  LPCSSVariable *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("table-layout");
  v6[1] = CFSTR("font-family");
  v7[0] = CFSTR("fixed");
  v7[1] = CFSTR("-apple-system, Helvetica, Arial, sans-serif");
  v6[2] = CFSTR("background-color");
  v2 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-backgroundColor"));
  v7[2] = v2;
  v6[3] = CFSTR("-apple-color-filter");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-colorFilter"));
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  objc_msgSend(a1, "baseRules", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationProperties, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end

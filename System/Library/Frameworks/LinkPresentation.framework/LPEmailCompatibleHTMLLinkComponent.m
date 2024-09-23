@implementation LPEmailCompatibleHTMLLinkComponent

- (LPEmailCompatibleHTMLLinkComponent)initWithURL:(id)a3 generator:(id)a4
{
  id v6;
  id v7;
  LPEmailCompatibleHTMLLinkComponent *v8;
  uint64_t v9;
  LPEmailCompatibleHTMLLinkComponent *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  LPEmailCompatibleHTMLLinkComponent *v30;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)LPEmailCompatibleHTMLLinkComponent;
  v8 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v32, sel_initWithTagName_themePath_generator_, CFSTR("a"), &stru_1E44AB1C8, v7);
  v10 = v8;
  if (v8)
  {
    LPWebLock(v8, v9);
    if (objc_msgSend(v7, "applyCornerRadiusToLink"))
      v11 = CFSTR("10px");
    else
      v11 = CFSTR("0");
    objc_msgSend(v7, "cssResolver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localVariables");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("local-link-cornerRadius"));

    objc_msgSend(v7, "rootWidth");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_lp_CSSText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cssResolver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localVariables");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("local-link-width"));

    -[LPHTMLComponent generator](v10, "generator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cssResolver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v10, "element");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addStyle:toElement:inComponent:", CFSTR("lp-rich-link"), v20, v10);

    -[LPHTMLComponent element](v10, "element");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAttribute:value:", CFSTR("rel"), CFSTR("nofollow"));

    -[LPHTMLComponent element](v10, "element");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAttribute:value:", CFSTR("href"), v23);

    -[LPHTMLComponent element](v10, "element");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttribute:value:", CFSTR("dir"), CFSTR("ltr"));

    -[LPHTMLComponent element](v10, "element");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAttribute:value:", CFSTR("role"), CFSTR("button"));

    -[LPHTMLComponent element](v10, "element");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAttribute:value:", CFSTR("draggable"), CFSTR("false"));

    -[LPHTMLComponent element](v10, "element");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootWidth");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_lp_HTMLAttributeText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAttribute:value:", CFSTR("width"), v29);

    v30 = v10;
  }

  return v10;
}

+ (id)baseRules
{
  LPCSSVariable *v2;
  LPCSSVariable *v3;
  void *v4;
  _QWORD v6[10];
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("font-family");
  v6[1] = CFSTR("text-decoration");
  v7[0] = CFSTR("-apple-system, Helvetica, Arial, sans-serif");
  v7[1] = CFSTR("none");
  v6[2] = CFSTR("border-radius");
  v2 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-link-cornerRadius"));
  v7[2] = v2;
  v7[3] = CFSTR("hidden");
  v6[3] = CFSTR("overflow");
  v6[4] = CFSTR("width");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-link-width"));
  v7[4] = v3;
  v7[5] = CFSTR("block");
  v6[5] = CFSTR("display");
  v6[6] = CFSTR("-webkit-user-select");
  v7[6] = CFSTR("none");
  v7[7] = CFSTR("none");
  v6[7] = CFSTR("user-select");
  v6[8] = CFSTR("-webkit-user-modify");
  v6[9] = CFSTR("user-modify");
  v7[8] = CFSTR("read-only");
  v7[9] = CFSTR("read-only");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  objc_msgSend(a1, "baseRules", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

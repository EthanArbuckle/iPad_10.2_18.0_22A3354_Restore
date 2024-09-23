@implementation LPEmailCompatibleHTMLTableComponent

- (LPEmailCompatibleHTMLTableComponent)initWithThemePath:(id)a3 generator:(id)a4
{
  id v6;
  id v7;
  LPEmailCompatibleHTMLTableComponent *v8;
  uint64_t v9;
  LPEmailCompatibleHTMLTableComponent *v10;
  void *v11;
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
  LPEmailCompatibleHTMLTableComponent *v28;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)LPEmailCompatibleHTMLTableComponent;
  v8 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v30, sel_initWithTagName_themePath_generator_, CFSTR("table"), v6, v7);
  v10 = v8;
  if (v8)
  {
    LPWebLock(v8, v9);
    objc_msgSend(v7, "rootWidth");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_lp_CSSText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cssResolver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localVariables");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("local-table-width"));

    objc_msgSend(v7, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_lp_CSSText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cssResolver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localVariables");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("local-table-backgroundColor"));

    objc_msgSend(v7, "cssResolver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lp-rich-link-"), "stringByAppendingString:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v10, "element");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addStyle:toElement:inComponent:", v20, v21, v10);

    -[LPHTMLComponent element](v10, "element");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAttribute:value:", CFSTR("cellpadding"), CFSTR("0"));

    -[LPHTMLComponent element](v10, "element");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAttribute:value:", CFSTR("cellspacing"), CFSTR("0"));

    -[LPHTMLComponent element](v10, "element");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttribute:value:", CFSTR("border"), CFSTR("0"));

    -[LPHTMLComponent element](v10, "element");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootWidth");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_lp_HTMLAttributeText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAttribute:value:", CFSTR("width"), v27);

    v28 = v10;
  }

  return v10;
}

- (void)addChildAsRow:(id)a3
{
  LPHTMLComponent *v4;
  void *v5;
  LPHTMLComponent *v6;
  LPHTMLComponent *v7;
  void *v8;
  LPHTMLComponent *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = [LPHTMLComponent alloc];
  -[LPHTMLComponent generator](self, "generator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPHTMLComponent initWithTagName:themePath:generator:](v4, "initWithTagName:themePath:generator:", CFSTR("tr"), &stru_1E44AB1C8, v5);

  v7 = [LPHTMLComponent alloc];
  -[LPHTMLComponent generator](self, "generator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[LPHTMLComponent initWithTagName:themePath:generator:](v7, "initWithTagName:themePath:generator:", CFSTR("td"), &stru_1E44AB1C8, v8);

  -[LPHTMLComponent element](v9, "element");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttribute:value:", CFSTR("vertical-align"), CFSTR("center"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[LPHTMLComponent element](v9, "element");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttribute:value:", CFSTR("align"), CFSTR("center"));

  }
  -[LPHTMLComponent addChild:](v9, "addChild:", v12);
  -[LPHTMLComponent addChild:](v6, "addChild:", v9);
  -[LPHTMLComponent addChild:](self, "addChild:", v6);

}

+ (id)ruleDictionaryForStyle:(id)a3
{
  LPCSSVariable *v3;
  LPCSSVariable *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("width");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-table-width"));
  v8[0] = v3;
  v8[1] = CFSTR("fixed");
  v7[1] = CFSTR("table-layout");
  v7[2] = CFSTR("border-collapse");
  v8[2] = CFSTR("collapse");
  v7[3] = CFSTR("background-color");
  v4 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-table-backgroundColor"));
  v7[4] = CFSTR("font-family");
  v8[3] = v4;
  v8[4] = CFSTR("-apple-system, Helvetica, Arial, sans-serif");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

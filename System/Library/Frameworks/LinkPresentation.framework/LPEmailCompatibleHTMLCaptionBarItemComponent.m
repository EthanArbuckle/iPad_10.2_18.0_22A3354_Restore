@implementation LPEmailCompatibleHTMLCaptionBarItemComponent

- (LPEmailCompatibleHTMLCaptionBarItemComponent)initWithStyle:(id)a3 themePath:(id)a4 generator:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v11;
  id v12;
  void (**v13)(void *, const __CFString *, const __CFString *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  LPEmailCompatibleHTMLCaptionBarItemComponent *v22;
  id v24;
  _QWORD aBlock[4];
  id v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)LPEmailCompatibleHTMLCaptionBarItemComponent;
  v11 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v27, sel_initWithTagName_themePath_generator_, CFSTR("td"), v9, v10);
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__LPEmailCompatibleHTMLCaptionBarItemComponent_initWithStyle_themePath_generator___block_invoke;
    aBlock[3] = &unk_1E44A7FA8;
    v12 = v9;
    v26 = v12;
    v13 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(aBlock);
    v24 = v8;
    objc_msgSend(v8, "emailCompatibleMargin");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_lp_CSSText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cssResolver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localVariables");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, CFSTR("local"), CFSTR("margin"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v18);

    objc_msgSend(v10, "cssResolver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lp-rich-link-%@Item"), v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v11, "element");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addStyle:toElement:inComponent:", v20, v21, v11);

    v22 = v11;
    v8 = v24;
  }

  return v11;
}

id __82__LPEmailCompatibleHTMLCaptionBarItemComponent_initWithStyle_themePath_generator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@Item-%@"), v5, *(_QWORD *)(a1 + 32), v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Item-%@"), *(_QWORD *)(a1 + 32), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  LPCSSVariable *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("padding");
  v3 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("local-<theme-path>-margin"));
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

@implementation LPEmailCompatibleHTMLVerticalTextStackComponent

- (LPEmailCompatibleHTMLVerticalTextStackComponent)initWithStyle:(id)a3 presentationProperties:(id)a4 themePath:(id)a5 generator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LPEmailCompatibleHTMLVerticalTextStackComponent *v15;
  uint64_t v16;
  LPEmailCompatibleHTMLVerticalTextStackComponent *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  LPEmailCompatibleHTMLVerticalTextStackComponent *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)LPEmailCompatibleHTMLVerticalTextStackComponent;
  v15 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v24, sel_initWithTagName_themePath_generator_, CFSTR("div"), v13, v14);
  v17 = v15;
  if (v15)
  {
    LPWebLock(v15, v16);
    objc_storeStrong((id *)&v17->_style, a3);
    objc_storeStrong((id *)&v17->_presentationProperties, a4);
    -[LPEmailCompatibleHTMLVerticalTextStackComponent buildComponents](v17, "buildComponents");
    objc_msgSend(v14, "cssResolver");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent themePath](v17, "themePath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lp-rich-link-"), "stringByAppendingString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent element](v17, "element");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addStyle:toElement:inComponent:", v20, v21, v17);

    v22 = v17;
  }

  return v17;
}

- (id)componentForRow:(id)a3 style:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPEmailCompatibleHTMLTextComponent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  LPEmailCompatibleHTMLTextComponent *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [LPEmailCompatibleHTMLTextComponent alloc];
  objc_msgSend(v8, "leading");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leading");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-leading"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPHTMLComponent childThemePathWithName:](self, "childThemePathWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPHTMLComponent generator](self, "generator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[LPEmailCompatibleHTMLTextComponent initWithCaption:style:themePath:generator:](v11, "initWithCaption:style:themePath:generator:", v12, v13, v15, v16);

  -[LPHTMLComponent addChild:](self, "addChild:", v17);
  return v17;
}

- (void)buildComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  LPEmailCompatibleHTMLVerticalTextStackComponent *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  LPWebLock(self, a2);
  -[LPCaptionBarPresentationProperties top](self->_presentationProperties, "top");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  -[LPCaptionBarPresentationProperties bottom](self->_presentationProperties, "bottom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPVerticalTextStackViewStyle topCaption](self->_style, "topCaption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  -[LPVerticalTextStackViewStyle bottomCaption](self->_style, "bottomCaption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__LPEmailCompatibleHTMLVerticalTextStackComponent_buildComponents__block_invoke;
  v10[3] = &unk_1E44AA620;
  v11 = v8;
  v12 = &unk_1E44F0588;
  v13 = self;
  v9 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

}

void __66__LPEmailCompatibleHTMLVerticalTextStackComponent_buildComponents__block_invoke(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "leading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "componentForRow:style:name:", v10, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addChild:", v9);

  }
}

+ (id)baseRules
{
  LPCSSVariable *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("100%");
  v5[0] = CFSTR("max-width");
  v5[1] = CFSTR("margin");
  v2 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", CFSTR("<theme-path>-captionTextPadding"));
  v5[2] = CFSTR("overflow");
  v6[1] = v2;
  v6[2] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

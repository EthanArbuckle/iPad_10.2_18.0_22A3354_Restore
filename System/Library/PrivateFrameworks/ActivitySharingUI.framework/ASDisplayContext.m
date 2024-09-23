@implementation ASDisplayContext

+ (id)displayContextWithName:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ASDisplayContextCompanion")))
  {
    +[ASDisplayContext _companionContext](ASDisplayContext, "_companionContext");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("ASDisplayContextGizmo")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    +[ASDisplayContext _gizmoContext](ASDisplayContext, "_gizmoContext");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

+ (id)_companionContext
{
  if (_companionContext_onceToken != -1)
    dispatch_once(&_companionContext_onceToken, &__block_literal_global_3);
  objc_msgSend(a1, "_contentSizeChangeForContext:withBlock:", _companionContext___companionContext, &__block_literal_global_21);
  return (id)_companionContext___companionContext;
}

+ (void)_contentSizeChangeForContext:(id)a3 withBlock:(id)a4
{
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a4;
  v5 = (void *)MEMORY[0x24BEBD3C8];
  v6 = a3;
  objc_msgSend(v5, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6[9];
  if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    v10[2](v10, v8);

}

- (void)setNameFont:(id)a3
{
  objc_storeStrong((id *)&self->_nameFont, a3);
}

- (void)setDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionFont, a3);
}

void __37__ASDisplayContext__companionContext__block_invoke()
{
  ASDisplayContext *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[3];
  _QWORD v29[5];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(ASDisplayContext);
  v1 = (void *)_companionContext___companionContext;
  _companionContext___companionContext = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BEBB520], "fu_sausageFontOfSize:", 46.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setDataFont:", v2);

  objc_msgSend(MEMORY[0x24BEBB520], "fu_sausageFontOfSize:", 30.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setMultilineDataFont:", v3);

  objc_msgSend((id)_companionContext___companionContext, "dataFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SmallCapsFontForFont(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setUnitFont:", v5);

  objc_msgSend((id)_companionContext___companionContext, "multilineDataFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SmallCapsFontForFont(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setMultilineUnitFont:", v7);

  v28[0] = &unk_24EEA3590;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nonGradientTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v9;
  v28[1] = &unk_24EEA35A8;
  objc_msgSend(MEMORY[0x24BE01CA8], "briskColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nonGradientTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v11;
  v28[2] = &unk_24EEA35C0;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nonGradientTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setTitleColors:", v14);

  v26[0] = &unk_24EEA35D8;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nonGradientTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v26[1] = &unk_24EEA3590;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "nonGradientTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  v26[2] = &unk_24EEA35A8;
  objc_msgSend(MEMORY[0x24BE01CA8], "briskColors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nonGradientTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = &unk_24EEA35F0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v20;
  v26[4] = &unk_24EEA35C0;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nonGradientTextColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v22;
  v26[5] = &unk_24EEA3608;
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setKeyColors:", v24);

}

- (void)setUnitFont:(id)a3
{
  objc_storeStrong((id *)&self->_unitFont, a3);
}

- (void)setTitleColors:(id)a3
{
  objc_storeStrong((id *)&self->_titleColors, a3);
}

- (void)setMultilineUnitFont:(id)a3
{
  objc_storeStrong((id *)&self->_multilineUnitFont, a3);
}

- (void)setMultilineDataFont:(id)a3
{
  objc_storeStrong((id *)&self->_multilineDataFont, a3);
}

- (void)setKeyColors:(id)a3
{
  objc_storeStrong((id *)&self->_keyColors, a3);
}

- (void)setDataFont:(id)a3
{
  objc_storeStrong((id *)&self->_dataFont, a3);
}

- (UIFont)dataFont
{
  return self->_dataFont;
}

- (UIFont)multilineUnitFont
{
  return self->_multilineUnitFont;
}

- (id)keyColorForDisplayMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ASDisplayContext keyColors](self, "keyColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ASDisplayContext keyColors](self, "keyColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSDictionary)keyColors
{
  return self->_keyColors;
}

- (UIFont)multilineDataFont
{
  return self->_multilineDataFont;
}

void __37__ASDisplayContext__companionContext__block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  v3 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D0], 0x8000, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v7, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setDescriptionFont:", v4);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_companionContext___companionContext, "setNameFont:", v5);

  v6 = *(void **)(_companionContext___companionContext + 72);
  *(_QWORD *)(_companionContext___companionContext + 72) = v2;

}

+ (id)_gizmoContext
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D0], 0x8000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ASDisplayContext__gizmoContext__block_invoke;
  block[3] = &unk_24EE9D658;
  v5 = v3;
  v13 = v5;
  if (_gizmoContext_onceToken[0] != -1)
    dispatch_once(_gizmoContext_onceToken, block);
  v6 = _gizmoContext___gizmoContext;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __33__ASDisplayContext__gizmoContext__block_invoke_2;
  v10[3] = &unk_24EE9DD78;
  v11 = v5;
  v7 = v5;
  objc_msgSend(a1, "_contentSizeChangeForContext:withBlock:", v6, v10);
  v8 = (id)_gizmoContext___gizmoContext;

  return v8;
}

void __33__ASDisplayContext__gizmoContext__block_invoke(uint64_t a1)
{
  ASDisplayContext *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v28;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[3];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(ASDisplayContext);
  v3 = (void *)_gizmoContext___gizmoContext;
  _gizmoContext___gizmoContext = (uint64_t)v2;

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setNameFont:", v4);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setDataFont:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setDescriptionFont:", v6);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setMultilineDataFont:", v7);

  objc_msgSend((id)_gizmoContext___gizmoContext, "dataFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SmallCapsFontForFont(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setUnitFont:", v9);

  objc_msgSend((id)_gizmoContext___gizmoContext, "multilineDataFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SmallCapsFontForFont(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setMultilineUnitFont:", v11);

  v32[0] = &unk_24EEA3590;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nonGradientTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v13;
  v32[1] = &unk_24EEA35A8;
  objc_msgSend(MEMORY[0x24BE01CA8], "briskColors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nonGradientTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v15;
  v32[2] = &unk_24EEA35C0;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "nonGradientTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setTitleColors:", v18);

  v30[0] = &unk_24EEA35D8;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "nonGradientTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  v30[1] = &unk_24EEA3590;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nonGradientTextColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v21;
  v30[2] = &unk_24EEA35A8;
  objc_msgSend(MEMORY[0x24BE01CA8], "briskColors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "nonGradientTextColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v23;
  v30[3] = &unk_24EEA35F0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v24;
  v30[4] = &unk_24EEA35C0;
  objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nonGradientTextColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v26;
  v30[5] = &unk_24EEA3608;
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setKeyColors:", v28);

}

void __33__ASDisplayContext__gizmoContext__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setNameFont:", v4);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setDataFont:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setDescriptionFont:", v6);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", *(_QWORD *)(a1 + 32), 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setMultilineDataFont:", v7);

  objc_msgSend((id)_gizmoContext___gizmoContext, "dataFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SmallCapsFontForFont(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setUnitFont:", v9);

  objc_msgSend((id)_gizmoContext___gizmoContext, "multilineDataFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SmallCapsFontForFont(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gizmoContext___gizmoContext, "setMultilineUnitFont:", v11);

  v12 = *(void **)(_gizmoContext___gizmoContext + 72);
  *(_QWORD *)(_gizmoContext___gizmoContext + 72) = v3;

}

- (id)titleColorForDisplayMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ASDisplayContext titleColors](self, "titleColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ASDisplayContext titleColors](self, "titleColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (UIFont)unitFont
{
  return self->_unitFont;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (NSDictionary)titleColors
{
  return self->_titleColors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColors, 0);
  objc_storeStrong((id *)&self->_titleColors, 0);
  objc_storeStrong((id *)&self->_descriptionFont, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_multilineUnitFont, 0);
  objc_storeStrong((id *)&self->_unitFont, 0);
  objc_storeStrong((id *)&self->_multilineDataFont, 0);
  objc_storeStrong((id *)&self->_dataFont, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
}

@end

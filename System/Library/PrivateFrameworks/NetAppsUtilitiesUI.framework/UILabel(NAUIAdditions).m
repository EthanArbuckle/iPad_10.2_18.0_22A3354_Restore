@implementation UILabel(NAUIAdditions)

- (double)naui_capOffsetFromTop
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ascender");
  v4 = v3;
  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capHeight");
  v7 = v4 - v6;

  return v7;
}

- (double)naui_distanceFromBaselineToCoordinate:()NAUIAdditions inView:
{
  double v3;
  double v4;
  double Height;
  double v6;
  CGRect v8;

  objc_msgSend(a1, "convertPoint:fromView:", 0.0, a2);
  v4 = v3;
  objc_msgSend(a1, "bounds");
  Height = CGRectGetHeight(v8);
  objc_msgSend(a1, "naui_baselineOffsetFromBottom");
  return v4 - (Height - v6);
}

- (void)naui_reloadDynamicFontWithTextStyleDescriptor:()NAUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v4 = a3;
  objc_msgSend(a1, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:](NAUITextStyleDescriptor, "fontWithTextStyleDescriptor:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = a1;
  v26.super_class = (Class)&off_254E6D960;
  objc_msgSendSuper2(&v26, sel_naui_reloadDynamicFontWithTextStyleDescriptor_, v4);
  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BEBB588]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length") && objc_msgSend(v6, "length"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    v11 = objc_msgSend(v6, "length");
    v12 = *MEMORY[0x24BEBB360];
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __72__UILabel_NAUIAdditions__naui_reloadDynamicFontWithTextStyleDescriptor___block_invoke;
    v17 = &unk_24D6126F0;
    v21 = &v22;
    v18 = v4;
    v13 = v10;
    v19 = v13;
    v20 = v7;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, &v14);
    if (*((_BYTE *)v23 + 24))
      objc_msgSend(a1, "setAttributedText:", v13, v14, v15, v16, v17, v18, v19);

    _Block_object_dispose(&v22, 8);
  }

}

@end

@implementation SUUIDefaultCardLayout

- (id)attributedStringForButton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "buttonTitleStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "style");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = SUUIViewElementAlignmentForStyle(v7);
  if (v9)
    v10 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v9);
  else
    v10 = 1;
  objc_msgSend(v3, "buttonText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v8, 0, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)attributedStringForLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICardLayout layoutContext](self, "layoutContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = SUUIViewElementAlignmentForStyle(v5);
  if (v10)
    v11 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v10);
  else
    v11 = 1;
  v12 = objc_msgSend(v4, "labelViewStyle");
  if (v12 <= 5)
  {
    if (((1 << v12) & 0x1B) == 0)
    {
      if (v6)
      {
        if (v9)
          goto LABEL_17;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (v6)
    {
      if (!v9)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v9 = (void *)v13;
      }
    }
  }
LABEL_17:
  objc_msgSend(v4, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:textAlignment:", v6, v9, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "elementType") == 66)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    if (v14 < v12)
      v14 = v12;
    v15 = 12.0;
    if (objc_msgSend(v8, "elementType") != 131 && objc_msgSend(v9, "elementType") != 131)
    {
      v15 = 20.0;
      if (v14 <= 736.0)
      {
        objc_msgSend(v8, "parent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (v15 = 12.0, (objc_msgSend(v16, "isAdCard") & 1) == 0))
        {
          if (v14 <= 568.0)
            v15 = 10.0;
          else
            v15 = 15.0;
        }

      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SUUIDefaultCardLayout;
    -[SUUICardLayout topInsetForViewElement:previousViewElement:width:](&v19, sel_topInsetForViewElement_previousViewElement_width_, v8, v9, a5);
    v15 = v17;
  }

  return v15;
}

@end

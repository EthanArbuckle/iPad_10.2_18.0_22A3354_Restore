@implementation SUUIProgrammedCardLayout

+ (BOOL)allowsViewElement:(id)a3
{
  unint64_t v3;
  BOOL result;

  v3 = objc_msgSend(a3, "elementType");
  result = 1;
  if (v3 > 0x32 || ((1 << v3) & 0x6000000001000) == 0)
    return v3 == 138;
  return result;
}

- (id)attributedStringForButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SUUIViewElementAlignmentForStyle(v5);

  if (v6)
    v7 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v6);
  else
    v7 = 1;
  objc_msgSend(v4, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProgrammedCardLayout _fontForButton:](self, "_fontForButton:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v9, 0, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)attributedStringForLabel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "textAlignment");
  if (v6)
    v7 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v6);
  else
    v7 = 1;
  -[SUUICardLayout layoutContext](self, "layoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (objc_msgSend(v4, "labelViewStyle") == 5)
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProgrammedCardLayout _fontForLabel:](self, "_fontForLabel:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v12, v10, v7, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SUUIProgrammedCardLayout _stringLayoutForViewElement:width:](self, "_stringLayoutForViewElement:width:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "boundingSize");
    v7 = v6;
    objc_msgSend(v5, "baselineOffset");
    *(float *)&v8 = v7 - v8;
    v9 = 30.0 - roundf(*(float *)&v8);
  }
  else
  {
    v9 = 30.0;
  }

  return v9;
}

- (double)horizontalContentInset
{
  return 20.0;
}

- (int64_t)layoutStyle
{
  return 1;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "elementType");
  if ((unint64_t)(v10 - 49) < 2)
  {
    v11 = 20.0;
  }
  else
  {
    if (v10 == 138)
    {
      -[SUUIProgrammedCardLayout _fontForLabel:](self, "_fontForLabel:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0.0;
      if (v10 != 12)
        goto LABEL_8;
      -[SUUIProgrammedCardLayout _fontForButton:](self, "_fontForButton:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    objc_msgSend(v12, "lineHeight");
    *(float *)&v14 = v14 + v14;
    v11 = roundf(*(float *)&v14);

  }
LABEL_8:
  -[SUUIProgrammedCardLayout _stringLayoutForViewElement:width:](self, "_stringLayoutForViewElement:width:", v8, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "firstBaselineOffset");
    *(float *)&v17 = v17;
    v11 = v11 - roundf(*(float *)&v17);
  }
  -[SUUIProgrammedCardLayout _stringLayoutForViewElement:width:](self, "_stringLayoutForViewElement:width:", v9, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "boundingSize");
    v20 = v19;
    objc_msgSend(v18, "baselineOffset");
    *(float *)&v21 = v20 - v21;
    v11 = v11 - roundf(*(float *)&v21);
  }

  return v11;
}

- (id)_fontForButton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "buttonTitleStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    SUUIViewElementFontWithStyle(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementFontWithStyle(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)_fontForLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_msgSend(v3, "labelViewStyle");
    v7 = 14.0;
    if (v6 == 5)
      v7 = 20.0;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_stringLayoutForViewElement:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "elementType");
  if (v7 == 138 || v7 == 12)
  {
    -[SUUICardLayout layoutContext](self, "layoutContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelLayoutCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutForWidth:viewElement:", (uint64_t)a4, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

@implementation FBKBugFormLabel

- (FBKBugFormLabel)initWithFrame:(CGRect)a3
{
  FBKBugFormLabel *v3;
  FBKBugFormLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormLabel;
  v3 = -[FBKBugFormLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FBKBugFormLabel _initLabel](v3, "_initLabel");
  return v4;
}

- (FBKBugFormLabel)initWithCoder:(id)a3
{
  FBKBugFormLabel *v3;
  FBKBugFormLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormLabel;
  v3 = -[FBKBugFormLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[FBKBugFormLabel _initLabel](v3, "_initLabel");
  return v4;
}

- (void)_initLabel
{
  NSTextStorage *v3;
  NSTextStorage *textStorage;
  NSLayoutManager *v5;
  NSLayoutManager *layoutManager;
  id v7;
  double v8;
  double v9;
  NSTextContainer *v10;
  NSTextContainer *container;

  v3 = (NSTextStorage *)objc_alloc_init(MEMORY[0x24BEBB508]);
  textStorage = self->_textStorage;
  self->_textStorage = v3;

  v5 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x24BEBB488]);
  layoutManager = self->_layoutManager;
  self->_layoutManager = v5;

  -[NSTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", self->_layoutManager);
  v7 = objc_alloc(MEMORY[0x24BEBB4C0]);
  -[FBKBugFormLabel bounds](self, "bounds");
  v10 = (NSTextContainer *)objc_msgSend(v7, "initWithSize:", v8, v9);
  container = self->_container;
  self->_container = v10;

  -[NSTextContainer setMaximumNumberOfLines:](self->_container, "setMaximumNumberOfLines:", -[FBKBugFormLabel numberOfLines](self, "numberOfLines"));
  -[NSTextContainer setLineBreakMode:](self->_container, "setLineBreakMode:", -[FBKBugFormLabel lineBreakMode](self, "lineBreakMode"));
  -[NSTextContainer setLineFragmentPadding:](self->_container, "setLineFragmentPadding:", 0.0);
  -[NSLayoutManager addTextContainer:](self->_layoutManager, "addTextContainer:", self->_container);
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)FBKBugFormLabel;
  -[FBKBugFormLabel layoutSubviews](&v12, sel_layoutSubviews);
  -[FBKBugFormLabel bounds](self, "bounds");
  Width = CGRectGetWidth(v13);
  if (Width > 0.0)
  {
    v4 = Width;
    -[FBKBugFormLabel preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
    if (v4 != v5)
    {
      -[FBKBugFormLabel bounds](self, "bounds");
      -[FBKBugFormLabel setPreferredMaxLayoutWidth:](self, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v14));
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)FBKBugFormLabel;
  -[FBKBugFormLabel layoutSubviews](&v11, sel_layoutSubviews);
  -[FBKBugFormLabel bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[FBKBugFormLabel container](self, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSize:", v7, v9);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[FBKBugFormLabel textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormLabel attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedString:", v7);

  -[FBKBugFormLabel attributedText](self, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    v13 = *MEMORY[0x24BEBB388];
    v14 = *MEMORY[0x24BEBB320];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v15), "locationInView:", self);
        v17 = v16;
        v19 = v18;
        -[FBKBugFormLabel layoutManager](self, "layoutManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormLabel container](self, "container");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v21, 0, v17, v19);

        v29 = 0;
        v30 = 0;
        -[FBKBugFormLabel attributedText](self, "attributedText");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "attributesAtIndex:effectiveRange:", v22, &v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "objectForKey:", v13);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.100000001);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addAttribute:value:range:", v14, v26, v29, v30);

        }
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  v27 = (void *)objc_msgSend(v9, "copy");
  -[FBKBugFormLabel setAttributedText:](self, "setAttributedText:", v27);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[FBKBugFormLabel attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v13), "locationInView:", self);
        v15 = v14;
        v17 = v16;
        -[FBKBugFormLabel layoutManager](self, "layoutManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormLabel container](self, "container");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v15, v17);

        objc_msgSend(v8, "addIndex:", v20);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  -[FBKBugFormLabel attributedText](self, "attributedText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BEBB320];
  -[FBKBugFormLabel attributedText](self, "attributedText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __42__FBKBugFormLabel_touchesMoved_withEvent___block_invoke;
  v31 = &unk_24E159580;
  v32 = v8;
  v33 = v7;
  v25 = v7;
  v26 = v8;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v24, 0, &v28);

  v27 = (void *)objc_msgSend(v25, "copy", v28, v29, v30, v31);
  -[FBKBugFormLabel setAttributedText:](self, "setAttributedText:", v27);

}

uint64_t __42__FBKBugFormLabel_touchesMoved_withEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x24BEBB320], a3, a4);
  return result;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[FBKBugFormLabel attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v13), "locationInView:", self);
        v15 = v14;
        v17 = v16;
        -[FBKBugFormLabel layoutManager](self, "layoutManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormLabel container](self, "container");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v15, v17);

        objc_msgSend(v8, "addIndex:", v20);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  -[FBKBugFormLabel attributedText](self, "attributedText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BEBB320];
  -[FBKBugFormLabel attributedText](self, "attributedText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __46__FBKBugFormLabel_touchesCancelled_withEvent___block_invoke;
  v31 = &unk_24E159580;
  v32 = v8;
  v33 = v7;
  v25 = v7;
  v26 = v8;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v24, 0, &v28);

  v27 = (void *)objc_msgSend(v25, "copy", v28, v29, v30, v31);
  -[FBKBugFormLabel setAttributedText:](self, "setAttributedText:", v27);

}

uint64_t __46__FBKBugFormLabel_touchesCancelled_withEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x24BEBB320], a3, a4);
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[FBKBugFormLabel attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v6, "mutableCopy");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    v10 = *MEMORY[0x24BEBB320];
    v11 = *MEMORY[0x24BEBB388];
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v12), "locationInView:", self);
        v14 = v13;
        v16 = v15;
        -[FBKBugFormLabel layoutManager](self, "layoutManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKBugFormLabel container](self, "container");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v18, 0, v14, v16);

        v30 = 0;
        v31 = 0;
        -[FBKBugFormLabel attributedText](self, "attributedText");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "attributesAtIndex:effectiveRange:", v19, &v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "objectForKey:", v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v29, "removeAttribute:range:", v10, v30, v31);
        objc_msgSend(v21, "objectForKey:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = v23;
LABEL_16:
            v25 = v24;

            goto LABEL_17;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            if (v24)
              goto LABEL_16;
          }
        }

        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v8)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_17:

  v26 = (void *)objc_msgSend(v29, "copy");
  -[FBKBugFormLabel setAttributedText:](self, "setAttributedText:", v26);

  if (v25)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "openURL:options:completionHandler:", v25, MEMORY[0x24BDBD1B8], 0);

  }
}

- (NSTextStorage)textStorage
{
  return (NSTextStorage *)objc_getProperty(self, a2, 808, 1);
}

- (void)setTextStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_getProperty(self, a2, 816, 1);
}

- (void)setLayoutManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (NSTextContainer)container
{
  return (NSTextContainer *)objc_getProperty(self, a2, 824, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end

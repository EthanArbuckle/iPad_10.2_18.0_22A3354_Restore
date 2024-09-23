@implementation FBABugFormLabel

- (FBABugFormLabel)initWithFrame:(CGRect)a3
{
  FBABugFormLabel *v3;
  FBABugFormLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBABugFormLabel;
  v3 = -[FBABugFormLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FBABugFormLabel _initLabel](v3, "_initLabel");
  return v4;
}

- (FBABugFormLabel)initWithCoder:(id)a3
{
  FBABugFormLabel *v3;
  FBABugFormLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBABugFormLabel;
  v3 = -[FBABugFormLabel initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[FBABugFormLabel _initLabel](v3, "_initLabel");
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

  v3 = (NSTextStorage *)objc_alloc_init((Class)NSTextStorage);
  textStorage = self->_textStorage;
  self->_textStorage = v3;

  v5 = (NSLayoutManager *)objc_alloc_init((Class)NSLayoutManager);
  layoutManager = self->_layoutManager;
  self->_layoutManager = v5;

  -[NSTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", self->_layoutManager);
  v7 = objc_alloc((Class)NSTextContainer);
  -[FBABugFormLabel bounds](self, "bounds");
  v10 = (NSTextContainer *)objc_msgSend(v7, "initWithSize:", v8, v9);
  container = self->_container;
  self->_container = v10;

  -[NSTextContainer setMaximumNumberOfLines:](self->_container, "setMaximumNumberOfLines:", -[FBABugFormLabel numberOfLines](self, "numberOfLines"));
  -[NSTextContainer setLineBreakMode:](self->_container, "setLineBreakMode:", -[FBABugFormLabel lineBreakMode](self, "lineBreakMode"));
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
  v12.super_class = (Class)FBABugFormLabel;
  -[FBABugFormLabel layoutSubviews](&v12, "layoutSubviews");
  -[FBABugFormLabel bounds](self, "bounds");
  Width = CGRectGetWidth(v13);
  if (Width > 0.0)
  {
    v4 = Width;
    -[FBABugFormLabel preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
    if (v4 != v5)
    {
      -[FBABugFormLabel bounds](self, "bounds");
      -[FBABugFormLabel setPreferredMaxLayoutWidth:](self, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v14));
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)FBABugFormLabel;
  -[FBABugFormLabel layoutSubviews](&v11, "layoutSubviews");
  -[FBABugFormLabel bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel container](self, "container"));
  objc_msgSend(v10, "setSize:", v7, v9);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel textStorage](self, "textStorage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  objc_msgSend(v6, "setAttributedString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v13), "locationInView:", self);
        v15 = v14;
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel layoutManager](self, "layoutManager"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel container](self, "container"));
        v20 = objc_msgSend(v18, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v15, v17);

        v27 = 0;
        v28 = 0;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributesAtIndex:effectiveRange:", v20, &v27));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", NSLinkAttributeName));
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.100000001));
          objc_msgSend(v9, "addAttribute:value:range:", NSBackgroundColorAttributeName, v24, v27, v28);

        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  v25 = objc_msgSend(v9, "copy");
  -[FBABugFormLabel setAttributedText:](self, "setAttributedText:", v25);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = objc_alloc_init((Class)NSMutableIndexSet);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v13), "locationInView:", self);
        v15 = v14;
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel layoutManager](self, "layoutManager"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel container](self, "container"));
        v20 = objc_msgSend(v18, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v15, v17);

        objc_msgSend(v8, "addIndex:", v20);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v23 = objc_msgSend(v22, "length");
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_1000129F0;
  v30 = &unk_1000E65E0;
  v31 = v8;
  v32 = v7;
  v24 = v7;
  v25 = v8;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", NSBackgroundColorAttributeName, 0, v23, 0, &v27);

  v26 = objc_msgSend(v24, "copy", v27, v28, v29, v30);
  -[FBABugFormLabel setAttributedText:](self, "setAttributedText:", v26);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = objc_alloc_init((Class)NSMutableIndexSet);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v13), "locationInView:", self);
        v15 = v14;
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel layoutManager](self, "layoutManager"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel container](self, "container"));
        v20 = objc_msgSend(v18, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v15, v17);

        objc_msgSend(v8, "addIndex:", v20);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v23 = objc_msgSend(v22, "length");
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_100012CB0;
  v30 = &unk_1000E65E0;
  v31 = v8;
  v32 = v7;
  v24 = v7;
  v25 = v8;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", NSBackgroundColorAttributeName, 0, v23, 0, &v27);

  v26 = objc_msgSend(v24, "copy", v27, v28, v29, v30);
  -[FBABugFormLabel setAttributedText:](self, "setAttributedText:", v26);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id obj;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
  v29 = objc_msgSend(v6, "mutableCopy");

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
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v10), "locationInView:", self);
        v12 = v11;
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel layoutManager](self, "layoutManager"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel container](self, "container"));
        v17 = objc_msgSend(v15, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v16, 0, v12, v14);

        v30 = 0;
        v31 = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormLabel attributedText](self, "attributedText"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attributesAtIndex:effectiveRange:", v17, &v30));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", NSBackgroundColorAttributeName));
        if (v20)
          objc_msgSend(v29, "removeAttribute:range:", NSBackgroundColorAttributeName, v30, v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", NSLinkAttributeName));
        if (v21)
        {
          v22 = objc_opt_class(NSURL);
          if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
          {
            v24 = v21;
LABEL_16:
            v25 = v24;

            goto LABEL_17;
          }
          v23 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0)
          {
            v24 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v21));
            if (v24)
              goto LABEL_16;
          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v8)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_17:

  v26 = objc_msgSend(v29, "copy");
  -[FBABugFormLabel setAttributedText:](self, "setAttributedText:", v26);

  if (v25)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v27, "openURL:options:completionHandler:", v25, &__NSDictionary0__struct, 0);

  }
}

- (NSTextStorage)textStorage
{
  return (NSTextStorage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTextStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLayoutManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSTextContainer)container
{
  return (NSTextContainer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end

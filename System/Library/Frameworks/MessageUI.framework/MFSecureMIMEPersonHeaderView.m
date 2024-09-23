@implementation MFSecureMIMEPersonHeaderView

+ (id)_explanationLabelDefaultAttributes
{
  if (_explanationLabelDefaultAttributes_onceToken != -1)
    dispatch_once(&_explanationLabelDefaultAttributes_onceToken, &__block_literal_global_33);
  return (id)_explanationLabelDefaultAttributes_defaultAttributes;
}

void __66__MFSecureMIMEPersonHeaderView__explanationLabelDefaultAttributes__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v0, "setLineBreakMode:", 0);
  v5[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B20]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v5[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "mailSecureMIMERegularTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = *MEMORY[0x1E0DC1178];
  v6[1] = v2;
  v6[2] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_explanationLabelDefaultAttributes_defaultAttributes;
  _explanationLabelDefaultAttributes_defaultAttributes = v3;

}

- (MFSecureMIMEPersonHeaderView)initWithFrame:(CGRect)a3 warningLabelTextColor:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MFSecureMIMEPersonHeaderView *v10;
  MFSecureMIMEPersonHeaderView *v11;
  id v12;
  uint64_t v13;
  UILabel *label;
  void *v15;
  _MFSecureMIMEPersonHeaderLabel *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIView *signedLabel;
  _MFSecureMIMEPersonHeaderLabel *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIView *secureLabel;
  id v26;
  void *v27;
  _MFSecureMIMEPersonHeaderLabel *v28;
  void *v29;
  uint64_t v30;
  UIView *warningLabel;
  objc_super v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MFSecureMIMEPersonHeaderView;
  v10 = -[MFSecureMIMEPersonHeaderView initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[MFSecureMIMEPersonHeaderView setAutoresizesSubviews:](v10, "setAutoresizesSubviews:", 1);
    -[MFSecureMIMEPersonHeaderView setAutoresizingMask:](v11, "setAutoresizingMask:", 2);
    v12 = objc_alloc(MEMORY[0x1E0DC3990]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v11->_label;
    v11->_label = (UILabel *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11->_label, "setBackgroundColor:", v15);

    -[UILabel setNumberOfLines:](v11->_label, "setNumberOfLines:", 0);
    v16 = [_MFSecureMIMEPersonHeaderLabel alloc];
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("checkmark.circle.fill"), 20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "mailSecureMIMERegularTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_MFSecureMIMEPersonHeaderLabel initWithImage:text:textColor:](v16, "initWithImage:text:textColor:", v17, 0, v18);
    signedLabel = v11->_signedLabel;
    v11->_signedLabel = (UIView *)v19;

    v21 = [_MFSecureMIMEPersonHeaderLabel alloc];
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("lock.fill"), 20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "mailSecureMIMERegularTextColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[_MFSecureMIMEPersonHeaderLabel initWithImage:text:textColor:](v21, "initWithImage:text:textColor:", v22, 0, v23);
    secureLabel = v11->_secureLabel;
    v11->_secureLabel = (UIView *)v24;

    if (v9)
    {
      v26 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "mailSecureMIMEWarningColor");
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;
    v28 = [_MFSecureMIMEPersonHeaderLabel alloc];
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("questionmark.circle.fill"), 20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[_MFSecureMIMEPersonHeaderLabel initWithImage:text:textColor:](v28, "initWithImage:text:textColor:", v29, 0, v27);
    warningLabel = v11->_warningLabel;
    v11->_warningLabel = (UIView *)v30;

  }
  return v11;
}

- (MFSecureMIMEPersonHeaderView)initWithFrame:(CGRect)a3
{
  return -[MFSecureMIMEPersonHeaderView initWithFrame:warningLabelTextColor:](self, "initWithFrame:warningLabelTextColor:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setSignedLabelText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFSecureMIMEPersonHeaderView _signedLabel](self, "_signedLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSecureMIMEPersonHeaderView _setText:forLabel:](self, "_setText:forLabel:", v5, v4);

}

- (NSString)signedLabelText
{
  void *v2;
  void *v3;

  -[MFSecureMIMEPersonHeaderView _signedLabel](self, "_signedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSecureLabelText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFSecureMIMEPersonHeaderView _secureLabel](self, "_secureLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSecureMIMEPersonHeaderView _setText:forLabel:](self, "_setText:forLabel:", v5, v4);

}

- (NSString)secureLabelText
{
  void *v2;
  void *v3;

  -[MFSecureMIMEPersonHeaderView _secureLabel](self, "_secureLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setWarningLabelText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFSecureMIMEPersonHeaderView _warningLabel](self, "_warningLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSecureMIMEPersonHeaderView _setText:forLabel:](self, "_setText:forLabel:", v5, v4);

}

- (NSString)warningLabelText
{
  void *v2;
  void *v3;

  -[MFSecureMIMEPersonHeaderView _warningLabel](self, "_warningLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setExplanationText:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v8 = (__CFString *)a3;
  -[MFSecureMIMEPersonHeaderView _insert:subview:](self, "_insert:subview:", v8 != 0, self->_label);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v8)
    v5 = v8;
  else
    v5 = &stru_1E5A6A588;
  objc_msgSend((id)objc_opt_class(), "_explanationLabelDefaultAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v6);

  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v7);
  -[MFSecureMIMEPersonHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MFSecureMIMEPersonHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)explanationText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setButtons:(id)a3
{
  NSArray *v4;
  NSArray *buttons;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  buttons = self->_buttons;
  if (buttons == v4)
  {
    if ((-[NSArray isEqual:](v4, "isEqual:", v4) & 1) != 0)
      goto LABEL_12;
    buttons = self->_buttons;
  }
  -[NSArray makeObjectsPerformSelector:](buttons, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  v6 = (NSArray *)-[NSArray copy](v4, "copy");
  v7 = self->_buttons;
  self->_buttons = v6;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v4;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        -[MFSecureMIMEPersonHeaderView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[MFSecureMIMEPersonHeaderView setNeedsLayout](self, "setNeedsLayout");
LABEL_12:

}

- (void)setEditing:(BOOL)a3
{
  *((_BYTE *)self + 456) = *((_BYTE *)self + 456) & 0xFE | a3;
}

- (BOOL)editing
{
  return *((_BYTE *)self + 456) & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MFSecureMIMEPersonHeaderView heightThatFitsSubview:padding:](self, "heightThatFitsSubview:padding:", self->_signedLabel, 5.0);
  v7 = v6 + 10.0;
  -[MFSecureMIMEPersonHeaderView heightThatFitsSubview:padding:](self, "heightThatFitsSubview:padding:", self->_secureLabel, 5.0);
  v9 = v7 + v8;
  -[MFSecureMIMEPersonHeaderView heightThatFitsSubview:padding:](self, "heightThatFitsSubview:padding:", self->_warningLabel, 5.0);
  v11 = v9 + v10;
  -[MFSecureMIMEPersonHeaderView heightThatFitsMainLabel:](self, "heightThatFitsMainLabel:", width, height);
  v13 = v11 + v12;
  -[MFSecureMIMEPersonHeaderView heightThatFitsButtons](self, "heightThatFitsButtons");
  v15 = v13 + v14;
  -[MFSecureMIMEPersonHeaderView heightOfBottomMargin](self, "heightOfBottomMargin");
  v17 = v15 + v16;
  v18 = width;
  result.height = v17;
  result.width = v18;
  return result;
}

- (double)heightThatFitsSubview:(id)a3 padding:(double)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v5, "sizeThatFits:", v7, v8);
    v10 = v9 + a4;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)heightThatFitsMainLabel:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  height = a3.height;
  width = a3.width;
  -[UILabel superview](self->_label, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0.0;
  -[MFSecureMIMEPersonHeaderView widthForSizingToFitSize:](self, "widthForSizingToFitSize:", width, height);
  v8 = v7;
  -[MFSecureMIMEPersonHeaderView superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMargins");
  v11 = v8 - v10;

  -[UILabel attributedText](self->_label, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "boundingRectWithSize:options:context:", 1, 0, v11, 0.0);

  UICeilToViewScale();
  return v13 + 12.0;
}

- (double)widthForSizingToFitSize:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double result;

  if (a3.width >= 0.0)
    width = a3.width;
  else
    width = 0.0;
  if (width == 0.0)
  {
    -[MFSecureMIMEPersonHeaderView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MFSecureMIMEPersonHeaderView superview](self, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;
      -[MFSecureMIMEPersonHeaderView superview](self, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutMargins");
      width = v8 - v10;

      if (width < 0.0)
        width = 0.0;
    }
  }
  result = 320.0;
  if (width != 0.0)
    return width;
  return result;
}

- (double)heightThatFitsButtons
{
  _BOOL4 v3;
  double result;

  v3 = -[MFSecureMIMEPersonHeaderView showsButtons](self, "showsButtons");
  result = 0.0;
  if (v3)
    return (float)((float)-[NSArray count](self->_buttons, "count", 0.0) * 49.0);
  return result;
}

- (double)heightOfBottomMargin
{
  _BOOL4 v2;
  double result;

  v2 = -[MFSecureMIMEPersonHeaderView showsButtons](self, "showsButtons");
  result = 10.0;
  if (v2)
    return 6.0;
  return result;
}

- (BOOL)showsButtons
{
  return (*((_BYTE *)self + 456) & 1) == 0 && -[NSArray count](self->_buttons, "count") != 0;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[MFSecureMIMEPersonHeaderView bounds](self, "bounds");
  -[MFSecureMIMEPersonHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  UIView *v6;
  double v7;
  double MaxY;
  double v9;
  void *v10;
  UIView *v11;
  double v12;
  void *v13;
  UIView *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  CGFloat v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v37 = *MEMORY[0x1E0C80C00];
  -[MFSecureMIMEPersonHeaderView bounds](self, "bounds");
  v4 = v3;
  -[UIView superview](self->_signedLabel, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self->_signedLabel;
    -[UIView sizeToFit](v6, "sizeToFit");
    -[UIView frame](v6, "frame");
    -[UIView setFrame:](v6, "setFrame:", 0.0, 10.0, v4);
    UIRoundToViewScale();
    MaxY = v7;

    v9 = 5.0;
  }
  else
  {
    MaxY = 0.0;
    v9 = 10.0;
  }
  -[UIView superview](self->_secureLabel, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self->_secureLabel;
    -[UIView sizeToFit](v11, "sizeToFit");
    -[UIView frame](v11, "frame");
    -[UIView setFrame:](v11, "setFrame:", 0.0, v9 + MaxY, v4);
    UIRoundToViewScale();
    MaxY = v12;

    v9 = 5.0;
  }
  -[UIView superview](self->_warningLabel, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = self->_warningLabel;
    -[UIView sizeToFit](v14, "sizeToFit");
    -[UIView frame](v14, "frame");
    -[UIView setFrame:](v14, "setFrame:", 0.0, v9 + MaxY, v4);
    UIRoundToViewScale();
    MaxY = v15;

  }
  -[UILabel superview](self->_label, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MFSecureMIMEPersonHeaderView superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMargins");
    v19 = v18;

    -[UILabel attributedText](self->_label, "attributedText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4 - v19;
    objc_msgSend(v20, "boundingRectWithSize:options:context:", 1, 0, v21, 0.0);

    -[UILabel frame](self->_label, "frame");
    v22 = MaxY + 12.0;
    UICeilToViewScale();
    v24 = v23;
    -[UILabel setFrame:](self->_label, "setFrame:", 0.0, v22, v21, v23);
    v38.origin.x = 0.0;
    v38.origin.y = v22;
    v38.size.width = v21;
    v38.size.height = v24;
    MaxY = CGRectGetMaxY(v38);
  }
  if (-[NSArray count](self->_buttons, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = self->_buttons;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v29, "frame", (_QWORD)v32);
          v30 = MaxY + 6.0;
          objc_msgSend(v29, "setFrame:", 0.0, v30, v4, 43.0);
          v39.origin.x = 0.0;
          v39.origin.y = v30;
          v39.size.width = v4;
          v39.size.height = 43.0;
          MaxY = CGRectGetMaxY(v39);
          if ((*((_BYTE *)self + 456) & 1) != 0)
            v31 = 0.0;
          else
            v31 = 1.0;
          objc_msgSend(v29, "setAlpha:", v31);
          objc_msgSend(v29, "setUserInteractionEnabled:", (*((_BYTE *)self + 456) & 1) == 0);
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v26);
    }

  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFSecureMIMEPersonHeaderView bounds](self, "bounds");
  if (width != v8)
    -[MFSecureMIMEPersonHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v9.receiver = self;
  v9.super_class = (Class)MFSecureMIMEPersonHeaderView;
  -[MFSecureMIMEPersonHeaderView setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)_setText:(id)a3 forLabel:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MFSecureMIMEPersonHeaderView _insert:subview:](self, "_insert:subview:", v7 != 0, v6);
  objc_msgSend(v6, "setText:", v7);
  -[MFSecureMIMEPersonHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_insert:(BOOL)a3 subview:(id)a4
{
  _BOOL4 v4;
  MFSecureMIMEPersonHeaderView *v6;
  MFSecureMIMEPersonHeaderView *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  objc_msgSend(v8, "superview");
  v6 = (MFSecureMIMEPersonHeaderView *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (v6 != self)
      -[MFSecureMIMEPersonHeaderView addSubview:](self, "addSubview:", v8);
  }
  else if (v6)
  {
    objc_msgSend(v8, "removeFromSuperview");
  }

}

- (id)_signedLabel
{
  return self->_signedLabel;
}

- (id)_secureLabel
{
  return self->_secureLabel;
}

- (id)_warningLabel
{
  return self->_warningLabel;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_warningLabel, 0);
  objc_storeStrong((id *)&self->_secureLabel, 0);
  objc_storeStrong((id *)&self->_signedLabel, 0);
}

@end

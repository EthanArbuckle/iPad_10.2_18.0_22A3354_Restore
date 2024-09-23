@implementation HSKeylineLabel

- (HSKeylineLabel)init
{
  uint64_t v2;
  HSKeylineLabel *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
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
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _QWORD v36[2];
  _BYTE v37[128];

  v35.receiver = self;
  v35.super_class = (Class)HSKeylineLabel;
  v3 = -[HSKeylineLabel init](&v35, "init");
  if (v3)
  {
    v4 = (void *)objc_opt_new(CALayer, v2);
    -[HSKeylineLabel setLeadingKeylineLayer:](v3, "setLeadingKeylineLayer:", v4);

    v6 = (void *)objc_opt_new(CALayer, v5);
    -[HSKeylineLabel setTrailingKeylineLayer:](v3, "setTrailingKeylineLayer:", v6);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel leadingKeylineLayer](v3, "leadingKeylineLayer", 0));
    v36[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel trailingKeylineLayer](v3, "trailingKeylineLayer"));
    v36[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v13);
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor _externalSystemGrayColor](UIColor, "_externalSystemGrayColor")));
          objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel layer](v3, "layer"));
          objc_msgSend(v16, "addSublayer:", v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v11);
    }

    v18 = (void *)objc_opt_new(UILabel, v17);
    -[HSKeylineLabel setLabel:](v3, "setLabel:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](v3, "label"));
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](v3, "label"));
    objc_msgSend(v20, "setNumberOfLines:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](v3, "label"));
    -[HSKeylineLabel addSubview:](v3, "addSubview:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](v3, "label"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel centerXAnchor](v3, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    objc_msgSend(v25, "setActive:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](v3, "label"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel centerYAnchor](v3, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    objc_msgSend(v29, "setActive:", 1);

    -[HSKeylineLabel setMargin:](v3, "setMargin:", 8.0);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxX;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double MidY;
  double v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v29.receiver = self;
  v29.super_class = (Class)HSKeylineLabel;
  -[HSKeylineLabel layoutSubviews](&v29, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  objc_msgSend(v4, "scale");
  v28 = 1.0 / v5;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  MidY = CGRectGetMidY(v30);
  -[HSKeylineLabel margin](self, "margin");
  v16 = v8 - v15;
  -[HSKeylineLabel margin](self, "margin");
  v18 = v17;
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  v19 = v18 + CGRectGetMaxX(v31);
  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  v20 = CGRectGetMidY(v32);
  -[HSKeylineLabel bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v33);
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v14;
  v22 = MaxX - CGRectGetMaxX(v34);
  -[HSKeylineLabel margin](self, "margin");
  v24 = v22 - v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel leadingKeylineLayer](self, "leadingKeylineLayer"));
  objc_msgSend(v25, "setFrame:", 0.0, MidY, v16, v28);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel trailingKeylineLayer](self, "trailingKeylineLayer"));
  objc_msgSend(v26, "setFrame:", v19, v20, v24, v28);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _QWORD v18[2];
  _BYTE v19[128];

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HSKeylineLabel;
  -[HSKeylineLabel setBackgroundColor:](&v17, "setBackgroundColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel leadingKeylineLayer](self, "leadingKeylineLayer", 0));
  v18[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel trailingKeylineLayer](self, "trailingKeylineLayer"));
  v18[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v4), "CGColor"));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v10);
  }

}

- (id)firstBaselineAnchor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstBaselineAnchor"));

  return v3;
}

- (id)lastBaselineAnchor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastBaselineAnchor"));

  return v3;
}

- (NSString)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel attributedText](self, "attributedText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v4);

  -[HSKeylineLabel setAttributedText:](self, "setAttributedText:", v5);
}

- (NSAttributedString)attributedText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributedText"));

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  objc_msgSend(v5, "setAttributedText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSKeylineLabel label](self, "label"));
  objc_msgSend(v6, "sizeToFit");

  -[HSKeylineLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[HSKeylineLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
  -[HSKeylineLabel setNeedsLayout](self, "setNeedsLayout");
}

- (CALayer)leadingKeylineLayer
{
  return self->_leadingKeylineLayer;
}

- (void)setLeadingKeylineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_leadingKeylineLayer, a3);
}

- (CALayer)trailingKeylineLayer
{
  return self->_trailingKeylineLayer;
}

- (void)setTrailingKeylineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trailingKeylineLayer, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (double)margin
{
  return self->_margin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_trailingKeylineLayer, 0);
  objc_storeStrong((id *)&self->_leadingKeylineLayer, 0);
}

@end

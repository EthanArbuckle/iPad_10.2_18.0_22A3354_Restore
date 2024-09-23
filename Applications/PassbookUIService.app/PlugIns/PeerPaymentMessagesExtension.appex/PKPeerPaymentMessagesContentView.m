@implementation PKPeerPaymentMessagesContentView

- (PKPeerPaymentMessagesContentView)initWithFrame:(CGRect)a3
{
  PKPeerPaymentMessagesContentView *v3;
  void *v4;
  unsigned int v5;
  CGFloat *v6;
  CGFloat v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessagesContentView;
  v3 = -[PKPeerPaymentMessagesContentView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentTheme backgroundColor](PKPeerPaymentTheme, "backgroundColor"));
    -[PKPeerPaymentMessagesContentView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)PKContentAlignmentCentered;
    v3->_verticalPadding = 10.0;
    v5 = -[PKPeerPaymentMessagesContentView pkui_userInterfaceIdiomSupportsLargeLayouts](v3, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    v6 = (CGFloat *)&PKSetupViewConstantsMarginLarge;
    if (!v5)
      v6 = (CGFloat *)&PKSetupViewConstantsMargin;
    v7 = *v6;
    v3->_contentInset.top = 8.0;
    v3->_contentInset.left = v7;
    v3->_contentInset.bottom = 8.0;
    v3->_contentInset.right = v7;
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  double v5;
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
  double left;
  double top;
  double right;
  double v20;
  void *v21;
  id v22;
  id v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *i;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unsigned int verticalAlignment;
  uint64_t v35;
  double v36;
  unsigned int v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *k;
  void *v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  double v50;
  uint64_t v51;
  double v52;
  void *j;
  void *v54;
  double v55;
  double v56;
  double v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentView subviews](self, "subviews"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
    v56 = v5;
    v57 = v6;
    v55 = v7;
    v9 = v8;
    -[PKPeerPaymentMessagesContentView safeAreaInsets](self, "safeAreaInsets");
    v13 = v12;
    v15 = v14;
    if (self->_ignoreTopSafeArea)
      v16 = 0.0;
    else
      v16 = v10;
    top = self->_contentInset.top;
    left = self->_contentInset.left;
    right = self->_contentInset.right;
    v20 = v9 - (v11 + v16) - (top + self->_contentInset.bottom);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentView subviews](self, "subviews", &self->_contentInset));
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v22)
    {
      v23 = v22;
      v24 = v55 - (v13 + v15) - (left + right);
      v25 = v56 + v13 + left;
      v26 = top + v57 + v16;
      v27 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v67 != v27)
            objc_enumerationMutation(v21);
          v29 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v29, "sizeThatFits:", v24, v20);
          v31 = v30;
          v33 = v32;
          if (objc_msgSend(v29, "isHidden"))
            v33 = 0.0 - self->_verticalPadding;
          verticalAlignment = self->_contentAlignment.verticalAlignment;
          if ((verticalAlignment & 0xFFFFFFFD) == 1)
            v35 = 0;
          else
            v35 = verticalAlignment;
          PKSizeAlignedInRect(self->_contentAlignment.horizontalAlignment | (unint64_t)(v35 << 32), v31, v33, v25, v26, v24, v20);
          objc_msgSend(v29, "setFrame:");
          v36 = -0.0;
          if (!(_DWORD)v35)
            v36 = v33 + self->_verticalPadding;
          v26 = v26 + v36;
          v20 = v20 - (v33 + self->_verticalPadding);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v23);
    }

    v37 = self->_contentAlignment.verticalAlignment;
    if (v37 == 3)
    {
      -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
      v45 = v44;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentView subviews](self, "subviews"));
      v47 = objc_msgSend(v46, "count");

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentView subviews](self, "subviews"));
      v48 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v48)
      {
        v49 = v48;
        v50 = v45 / (double)(unint64_t)v47;
        v51 = *(_QWORD *)v59;
        v52 = 0.0;
        do
        {
          for (j = 0; j != v49; j = (char *)j + 1)
          {
            if (*(_QWORD *)v59 != v51)
              objc_enumerationMutation(v38);
            v54 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v54, "isHidden") & 1) == 0)
            {
              objc_msgSend(v54, "frame");
              objc_msgSend(v54, "setFrame:");
              v52 = v50 + v52;
            }
          }
          v49 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v49);
      }
    }
    else
    {
      if (v37 != 1)
        return;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentView subviews](self, "subviews"));
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v63;
        do
        {
          for (k = 0; k != v40; k = (char *)k + 1)
          {
            if (*(_QWORD *)v63 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)k);
            if ((objc_msgSend(v43, "isHidden") & 1) == 0)
            {
              objc_msgSend(v43, "frame");
              objc_msgSend(v43, "setFrame:");
            }
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v40);
      }
    }

  }
}

- (UILabel)label
{
  UILabel *label;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;

  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc((Class)UILabel);
    -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_label;
    self->_label = v5;

    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    v7 = self->_label;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor"));
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    v9 = self->_label;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v9, "setFont:", v10);

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (UIActivityIndicatorView)activityIndicator
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;

  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    v6 = self->_activityIndicator;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIActivityIndicatorView setColor:](v6, "setColor:", v7);

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_activityIndicator);
    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (PKPeerPaymentMessagesRoundedButton)button
{
  PKPeerPaymentMessagesRoundedButton *button;
  PKPeerPaymentMessagesRoundedButton *v4;
  PKPeerPaymentMessagesRoundedButton *v5;

  button = self->_button;
  if (!button)
  {
    v4 = (PKPeerPaymentMessagesRoundedButton *)objc_alloc_init((Class)PKPeerPaymentMessagesRoundedButton);
    v5 = self->_button;
    self->_button = v4;

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_button);
    button = self->_button;
  }
  return button;
}

- (UIImageView)imageView
{
  UIImageView *imageView;
  id v4;
  UIImageView *v5;
  UIImageView *v6;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = objc_alloc((Class)UIImageView);
    -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_imageView;
    self->_imageView = v5;

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- ($85CD2974BE96D4886BB301820D1C36C2)contentAlignment
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_contentAlignment;
}

- (void)setContentAlignment:(id)a3
{
  self->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)a3;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (BOOL)ignoreTopSafeArea
{
  return self->_ignoreTopSafeArea;
}

- (void)setIgnoreTopSafeArea:(BOOL)a3
{
  self->_ignoreTopSafeArea = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

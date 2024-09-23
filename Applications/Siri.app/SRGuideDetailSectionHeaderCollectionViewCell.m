@implementation SRGuideDetailSectionHeaderCollectionViewCell

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
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
  double v19;
  double v20;
  double v21;
  _OWORD v22[3];
  uint64_t v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_font"));
  v22[0] = xmmword_10014CF50;
  v22[1] = unk_10014CF60;
  v22[2] = xmmword_10014CF70;
  v23 = qword_10014CF80;
  +[SiriUITextContainerView sizeThatFits:text:font:textContainerStyle:](SiriUITextContainerView, "sizeThatFits:text:font:textContainerStyle:", v7, v8, v22, width, height);
  v10 = v9;
  v12 = v11;

  v13 = SiriUIPlatterStyle[31];
  v14 = SiriUIPlatterStyle[32];
  v15 = SiriUIPlatterStyle[33];
  v16 = SiriUIPlatterStyle[34];
  objc_msgSend(a1, "_leadingHorizontalOffsetWithLayoutMargins:", v13, v14, v15, v16);
  v18 = v10 - v17;
  objc_msgSend(a1, "_trailingHorizontalOffsetWithLayoutMargins:", v13, v14, v15, v16);
  v20 = v18 - v19;
  v21 = SiriUIPlatterStyle[26];
  if (v12 >= v21)
    v21 = v12;
  result.height = v21;
  result.width = v20;
  return result;
}

- (SRGuideDetailSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  SRGuideDetailSectionHeaderCollectionViewCell *v3;
  __int128 v4;
  SiriUITextContainerView *v5;
  SiriUITextContainerView *textContainerView;
  SiriUITextContainerView *v7;
  uint64_t v8;
  id v9;
  void *v10;
  SiriUITextContainerView *v11;
  SiriUITextContainerView *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v17[3];
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SRGuideDetailSectionHeaderCollectionViewCell;
  v3 = -[SRGuideDetailSectionHeaderCollectionViewCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    unk_10014CF68 = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(__int128 *)((char *)&xmmword_10014CF70 + 8) = v4;
    v5 = (SiriUITextContainerView *)objc_msgSend(objc_alloc((Class)SiriUITextContainerView), "initWithText:", 0);
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v5;

    -[SiriUITextContainerView setTextAlignment:](v3->_textContainerView, "setTextAlignment:", SiriLanguageTextAlignmentLeft());
    v7 = v3->_textContainerView;
    v9 = objc_msgSend((id)objc_opt_class(v3, v8), "_font");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SiriUITextContainerView setFont:](v7, "setFont:", v10);

    v11 = v3->_textContainerView;
    v17[0] = xmmword_10014CF50;
    v17[1] = unk_10014CF60;
    v17[2] = xmmword_10014CF70;
    v18 = qword_10014CF80;
    -[SiriUITextContainerView setTextContainerStyle:](v11, "setTextContainerStyle:", v17);
    v12 = v3->_textContainerView;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](UIColor, "siriui_lightTextColor"));
    -[SiriUITextContainerView setTextColor:](v12, "setTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDetailSectionHeaderCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v14, "addSubview:", v3->_textContainerView);

    -[SRGuideDetailSectionHeaderCollectionViewCell setKeylineType:](v3, "setKeylineType:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightKeylineColor](UIColor, "siriui_lightKeylineColor"));
    -[SRGuideDetailSectionHeaderCollectionViewCell setKeylineCustomBackgroundColor:](v3, "setKeylineCustomBackgroundColor:", v15);

  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  SiriUITextContainerView *textContainerView;
  CGFloat v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)SRGuideDetailSectionHeaderCollectionViewCell;
  -[SRGuideDetailSectionHeaderCollectionViewCell layoutSubviews](&v17, "layoutSubviews");
  objc_opt_class(self, v3);
  v4 = SiriUIPlatterStyle[31];
  v5 = SiriUIPlatterStyle[32];
  v6 = SiriUIPlatterStyle[33];
  v7 = SiriUIPlatterStyle[34];
  objc_msgSend(v8, "_leadingHorizontalOffsetWithLayoutMargins:", v4, v5, v6, v7);
  v10 = v9;
  objc_opt_class(self, v11);
  objc_msgSend(v12, "_trailingHorizontalOffsetWithLayoutMargins:", v4, v5, v6, v7);
  v14 = v13;
  textContainerView = self->_textContainerView;
  -[SRGuideDetailSectionHeaderCollectionViewCell bounds](self, "bounds");
  v16 = CGRectGetWidth(v18) - v10 - v14;
  -[SRGuideDetailSectionHeaderCollectionViewCell bounds](self, "bounds");
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:", v10, 0.0, v16, CGRectGetHeight(v19));
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRGuideDetailSectionHeaderCollectionViewCell;
  -[SRGuideDetailSectionHeaderCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[SiriUITextContainerView setText:](self->_textContainerView, "setText:", 0);
}

- (void)setText:(id)a3
{
  -[SiriUITextContainerView setText:](self->_textContainerView, "setText:", a3);
}

- (NSString)text
{
  return (NSString *)-[SiriUITextContainerView text](self->_textContainerView, "text");
}

+ (id)_font
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));
  return v5;
}

+ (double)_leadingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  double left;

  right = a3.right;
  left = a3.left;
  if (SiriUISystemLanguageIsRTL(a1, a2, *(__n128 *)&a3.top, *(__n128 *)&a3.left, *(__n128 *)&a3.bottom))
    return left;
  else
    return right;
}

+ (double)_trailingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  double left;

  right = a3.right;
  left = a3.left;
  if (SiriUISystemLanguageIsRTL(a1, a2, *(__n128 *)&a3.top, *(__n128 *)&a3.left, *(__n128 *)&a3.bottom))
    return right;
  else
    return left;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContainerView, 0);
}

@end

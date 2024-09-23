@implementation SRGuideDetailPhraseViewCell

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
  _OWORD v15[3];
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_font"));
  v15[0] = xmmword_1000C0E88;
  v15[1] = unk_1000C0E98;
  v15[2] = xmmword_1000C0EA8;
  v16 = 0x4040000000000000;
  +[SiriUITextContainerView sizeThatFits:text:font:textContainerStyle:](SiriUITextContainerView, "sizeThatFits:text:font:textContainerStyle:", v7, v8, v15, width, height);
  v10 = v9;
  v12 = v11;

  if (v12 >= SiriUIPlatterStyle[26])
    v13 = v12;
  else
    v13 = SiriUIPlatterStyle[26];
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (SRGuideDetailPhraseViewCell)initWithFrame:(CGRect)a3
{
  SRGuideDetailPhraseViewCell *v3;
  SiriUITextContainerView *v4;
  SiriUITextContainerView *textContainerView;
  SiriUITextContainerView *v6;
  uint64_t v7;
  double v8;
  id v9;
  void *v10;
  SiriUITextContainerView *v11;
  SiriUITextContainerView *v12;
  void *v13;
  void *v14;
  _OWORD v16[3];
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SRGuideDetailPhraseViewCell;
  v3 = -[SRGuideDetailPhraseViewCell initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SiriUITextContainerView *)objc_msgSend(objc_alloc((Class)SiriUITextContainerView), "initWithText:visualEffect:", 0, 0);
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v4;

    -[SiriUITextContainerView setTextAlignment:](v3->_textContainerView, "setTextAlignment:", SiriLanguageTextAlignmentLeft());
    v6 = v3->_textContainerView;
    *(_QWORD *)&v8 = objc_opt_class(v3, v7).n128_u64[0];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_font", v8));
    -[SiriUITextContainerView setFont:](v6, "setFont:", v10);

    v11 = v3->_textContainerView;
    v16[0] = xmmword_1000C0E88;
    v16[1] = unk_1000C0E98;
    v16[2] = xmmword_1000C0EA8;
    v17 = 0x4040000000000000;
    -[SiriUITextContainerView setTextContainerStyle:](v11, "setTextContainerStyle:", v16);
    v12 = v3->_textContainerView;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](UIColor, "siriui_blendEffectColor"));
    -[SiriUITextContainerView setTextColor:](v12, "setTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDetailPhraseViewCell contentView](v3, "contentView"));
    objc_msgSend(v14, "addSubview:", v3->_textContainerView);

    -[SiriUITextContainerView siriui_setBlendEffectEnabled:](v3->_textContainerView, "siriui_setBlendEffectEnabled:", 1);
    -[SRGuideDetailPhraseViewCell setKeylineType:](v3, "setKeylineType:", 0);
  }
  return v3;
}

- (void)layoutSubviews
{
  SiriUITextContainerView *textContainerView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRGuideDetailPhraseViewCell;
  -[SRGuideDetailPhraseViewCell layoutSubviews](&v5, "layoutSubviews");
  textContainerView = self->_textContainerView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDetailPhraseViewCell contentView](self, "contentView"));
  objc_msgSend(v4, "bounds");
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRGuideDetailPhraseViewCell;
  -[SRGuideDetailPhraseViewCell prepareForReuse](&v3, "prepareForReuse");
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
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContainerView, 0);
}

@end

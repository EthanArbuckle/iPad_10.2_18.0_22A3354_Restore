@implementation ASCExpandableLabel

- (ASCExpandableLabel)initWithFrame:(CGRect)a3
{
  ASCExpandableLabel *v3;
  ASCExpandableLabelTruncationButton *v4;
  uint64_t v5;
  ASCExpandableLabelTruncationButton *moreButton;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCExpandableLabel;
  v3 = -[ASCSkeletonLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [ASCExpandableLabelTruncationButton alloc];
    v5 = -[ASCExpandableLabelTruncationButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    moreButton = v3->_moreButton;
    v3->_moreButton = (ASCExpandableLabelTruncationButton *)v5;

    -[ASCExpandableLabelTruncationButton setHidden:](v3->_moreButton, "setHidden:", 1);
    -[ASCExpandableLabel addSubview:](v3, "addSubview:", v3->_moreButton);
  }
  return v3;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)ASCExpandableLabel;
  -[ASCExpandableLabel layoutSubviews](&v38, sel_layoutSubviews);
  v3 = -[ASCExpandableLabel shouldHideMoreButton](self, "shouldHideMoreButton");
  -[ASCExpandableLabel moreButton](self, "moreButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = 1;
  }
  else
  {
    -[ASCExpandableLabel bounds](self, "bounds");
    objc_msgSend(v5, "sizeThatFits:", v7, v8);
    v10 = v9;
    v12 = v11;

    -[ASCExpandableLabel bounds](self, "bounds");
    v14 = v13;
    -[ASCExpandableLabel bounds](self, "bounds");
    v16 = v14 + v15 - v10;
    -[ASCExpandableLabel bounds](self, "bounds");
    v18 = v17;
    -[ASCExpandableLabel bounds](self, "bounds");
    v20 = v18 + v19 - v12;
    -[ASCExpandableLabel languageAwareString](self, "languageAwareString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "writingDirectionOfLine:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:", -[ASCExpandableLabel numberOfLines](self, "numberOfLines") - 1, -[ASCExpandableLabel numberOfLines](self, "numberOfLines"), -[ASCExpandableLabel lineBreakMode](self, "lineBreakMode"), 1, v10);

    -[ASCExpandableLabel bounds](self, "bounds");
    +[__ASCLayoutProxy rectWithLayoutDirectionForRect:layoutDirection:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:layoutDirection:relativeTo:", v22, v16, v20, v10, v12, v23, v24, v25, v26);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[ASCExpandableLabel moreButton](self, "moreButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

    v36 = v22 == 1;
    -[ASCExpandableLabel moreButton](self, "moreButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setIsRTL:", v36);

    -[ASCExpandableLabel moreButton](self, "moreButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0;
  }
  objc_msgSend(v4, "setHidden:", v6);

}

- (void)setText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCExpandableLabel;
  v4 = a3;
  -[ASCExpandableLabel setText:](&v7, sel_setText_, v4);
  v5 = objc_alloc(MEMORY[0x1E0D426F0]);
  v6 = (void *)objc_msgSend(v5, "initWithString:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:", v4, 0, 0, 0, v7.receiver, v7.super_class);

  -[ASCExpandableLabel setLanguageAwareString:](self, "setLanguageAwareString:", v6);
}

- (void)setAttributedText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCExpandableLabel;
  v4 = a3;
  -[ASCExpandableLabel setAttributedText:](&v7, sel_setAttributedText_, v4);
  v5 = objc_alloc(MEMORY[0x1E0D426F0]);
  v6 = (void *)objc_msgSend(v5, "initWithAttributedString:baseParagraphStyle:keepStatisticsOnLanguageComponents:", v4, 0, 0, v7.receiver, v7.super_class);

  -[ASCExpandableLabel setLanguageAwareString:](self, "setLanguageAwareString:", v6);
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCExpandableLabel;
  v4 = a3;
  -[ASCExpandableLabel setFont:](&v6, sel_setFont_, v4);
  -[ASCExpandableLabel moreButton](self, "moreButton", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCExpandableLabel;
  v4 = a3;
  -[ASCExpandableLabel setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[ASCExpandableLabel moreButton](self, "moreButton", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGradientColor:", v4);

}

- (BOOL)shouldHideMoreButton
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[ASCExpandableLabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[ASCExpandableLabel attributedText](self, "attributedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = !-[ASCExpandableLabel isTruncated](self, "isTruncated");
    else
      LOBYTE(v5) = 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isTruncated
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[ASCExpandableLabel bounds](self, "bounds");
  v4 = v3;
  -[ASCExpandableLabel bounds](self, "bounds");
  v6 = v5;
  -[ASCExpandableLabel bounds](self, "bounds");
  -[ASCExpandableLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, v4, v6);
  v8 = v7;
  -[ASCExpandableLabel bounds](self, "bounds");
  return v9 < v8;
}

- (BOOL)accessibilityActivate
{
  void *v2;

  -[ASCExpandableLabel moreButton](self, "moreButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActionsForControlEvents:", 64);

  return 1;
}

- (ASCExpandableLabelTruncationButton)moreButton
{
  return self->_moreButton;
}

- (JULanguageAwareString)languageAwareString
{
  return self->_languageAwareString;
}

- (void)setLanguageAwareString:(id)a3
{
  objc_storeStrong((id *)&self->_languageAwareString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageAwareString, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
}

@end

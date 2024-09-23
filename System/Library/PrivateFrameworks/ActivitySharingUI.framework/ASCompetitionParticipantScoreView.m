@implementation ASCompetitionParticipantScoreView

- (ASCompetitionParticipantScoreView)initWithConfiguration:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  ASCompetitionParticipantScoreView *v10;
  ASCompetitionParticipantScoreView *v11;
  uint64_t v12;
  UILabel *nameLabel;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  UILabel *primaryScoreLabel;
  uint64_t v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASCompetitionParticipantScoreView;
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v10 = -[ASCompetitionParticipantScoreView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    if (objc_msgSend(v5, "showsNames"))
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
      nameLabel = v11->_nameLabel;
      v11->_nameLabel = (UILabel *)v12;

      objc_msgSend(v5, "nameFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v11->_nameLabel, "setFont:", v14);

      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v11->_nameLabel, "setTextColor:", v15);

      -[UILabel setLineBreakMode:](v11->_nameLabel, "setLineBreakMode:", 4);
      -[UILabel setAllowsDefaultTighteningForTruncation:](v11->_nameLabel, "setAllowsDefaultTighteningForTruncation:", 1);
      if (objc_msgSend(v5, "alignment") == 1)
        v16 = 1;
      else
        v16 = 4;
      -[UILabel setTextAlignment:](v11->_nameLabel, "setTextAlignment:", v16);
      -[ASCompetitionParticipantScoreView addSubview:](v11, "addSubview:", v11->_nameLabel);
    }
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
    primaryScoreLabel = v11->_primaryScoreLabel;
    v11->_primaryScoreLabel = (UILabel *)v17;

    -[UILabel setLineBreakMode:](v11->_primaryScoreLabel, "setLineBreakMode:", 4);
    if (objc_msgSend(v5, "alignment") == 1)
      v19 = 1;
    else
      v19 = 4;
    -[UILabel setTextAlignment:](v11->_primaryScoreLabel, "setTextAlignment:", v19);
    -[ASCompetitionParticipantScoreView addSubview:](v11, "addSubview:", v11->_primaryScoreLabel);
  }

  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  UILabel *secondaryScoreLabel;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[ASCompetitionParticipantScoreView layoutForWidth:](self, "layoutForWidth:", a3.width, a3.height);
  secondaryScoreLabel = self->_secondaryScoreLabel;
  if (!secondaryScoreLabel)
    secondaryScoreLabel = self->_primaryScoreLabel;
  -[UILabel _lastLineBaselineFrameOriginY](secondaryScoreLabel, "_lastLineBaselineFrameOriginY");
  v7 = v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionParticipantScoreView;
  -[ASCompetitionParticipantScoreView layoutSubviews](&v4, sel_layoutSubviews);
  -[ASCompetitionParticipantScoreView bounds](self, "bounds");
  -[ASCompetitionParticipantScoreView layoutForWidth:](self, "layoutForWidth:", v3);
}

- (void)layoutForWidth:(double)a3
{
  NSNumber *previousLayoutWidth;
  float v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double scoreLeftMargin;
  float v17;
  float scoreRightMargin;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSNumber *v27;
  NSNumber *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  previousLayoutWidth = self->_previousLayoutWidth;
  if (!previousLayoutWidth
    || (-[NSNumber floatValue](previousLayoutWidth, "floatValue"), vabdd_f64(v6, a3) >= 0.00000011920929))
  {
    -[UILabel sizeToFit](self->_nameLabel, "sizeToFit");
    -[UILabel sizeToFit](self->_primaryScoreLabel, "sizeToFit");
    -[UILabel sizeToFit](self->_secondaryScoreLabel, "sizeToFit");
    if (self->_nameLabel)
    {
      -[ASCompetitionScoreViewConfiguration nameBaselineOffset](self->_configuration, "nameBaselineOffset");
      v8 = v7;
      if (-[ASCompetitionScoreViewConfiguration wantsScaledBaselineAlignment](self->_configuration, "wantsScaledBaselineAlignment"))
      {
        -[UILabel font](self->_nameLabel, "font");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCompetitionScoreViewConfiguration nameBaselineOffset](self->_configuration, "nameBaselineOffset");
        objc_msgSend(v9, "_scaledValueForValue:");
        v8 = v10;

      }
      -[UILabel bounds](self->_nameLabel, "bounds");
      -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, 0.0, a3, CGRectGetHeight(v29));
      -[UILabel _setFirstLineBaselineFrameOriginY:](self->_nameLabel, "_setFirstLineBaselineFrameOriginY:", v8);
    }
    else
    {
      v8 = 0.0;
    }
    -[ASCompetitionScoreViewConfiguration primaryScoreBaselineOffset](self->_configuration, "primaryScoreBaselineOffset");
    v12 = v11;
    if (-[ASCompetitionScoreViewConfiguration wantsScaledBaselineAlignment](self->_configuration, "wantsScaledBaselineAlignment"))
    {
      -[UILabel font](self->_primaryScoreLabel, "font");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetitionScoreViewConfiguration primaryScoreBaselineOffset](self->_configuration, "primaryScoreBaselineOffset");
      objc_msgSend(v13, "_scaledValueForValue:");
      v12 = v14;

    }
    -[UILabel bounds](self->_primaryScoreLabel, "bounds");
    v15 = (a3 - CGRectGetWidth(v30)) * -0.5;
    scoreLeftMargin = self->_scoreLeftMargin;
    v17 = scoreLeftMargin;
    scoreRightMargin = self->_scoreRightMargin;
    v19 = fmaxf(v17, scoreRightMargin);
    v20 = v19 + v15 + v19 + v15;
    v21 = 0.0;
    if (v20 <= 0.0)
    {
      v22 = a3;
    }
    else
    {
      if (scoreLeftMargin > 0.0)
        v21 = v20 + 0.0;
      v22 = a3 - v20;
    }
    v23 = v8 + v12;
    -[UILabel bounds](self->_primaryScoreLabel, "bounds");
    -[UILabel setFrame:](self->_primaryScoreLabel, "setFrame:", v21, 0.0, v22, CGRectGetHeight(v31));
    -[UILabel _setFirstLineBaselineFrameOriginY:](self->_primaryScoreLabel, "_setFirstLineBaselineFrameOriginY:", v23);
    if (self->_secondaryScoreLabel)
    {
      -[ASCompetitionScoreViewConfiguration secondaryScoreBaselineOffset](self->_configuration, "secondaryScoreBaselineOffset");
      v25 = v23 + v24;
      v26 = self->_scoreLeftMargin;
      -[UILabel bounds](self->_secondaryScoreLabel, "bounds");
      -[UILabel setFrame:](self->_secondaryScoreLabel, "setFrame:", v26, 0.0, v22, CGRectGetHeight(v32));
      -[UILabel _setFirstLineBaselineFrameOriginY:](self->_secondaryScoreLabel, "_setFirstLineBaselineFrameOriginY:", v25);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v28 = self->_previousLayoutWidth;
    self->_previousLayoutWidth = v27;

  }
}

- (double)nameBaselineY
{
  double result;

  -[UILabel _lastLineBaselineFrameOriginY](self->_nameLabel, "_lastLineBaselineFrameOriginY");
  return result;
}

- (void)setName:(id)a3
{
  NSNumber *previousLayoutWidth;

  -[UILabel setText:](self->_nameLabel, "setText:", a3);
  previousLayoutWidth = self->_previousLayoutWidth;
  self->_previousLayoutWidth = 0;

  -[ASCompetitionParticipantScoreView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNameFontSizeReduction:(double)a3
{
  NSNumber *previousLayoutWidth;

  if (vabdd_f64(self->_nameFontSizeReduction, a3) > 0.00000011920929)
  {
    -[ASCompetitionParticipantScoreView _updateNameLabelWithFontSizeReduction:](self, "_updateNameLabelWithFontSizeReduction:");
    previousLayoutWidth = self->_previousLayoutWidth;
    self->_previousLayoutWidth = 0;

    -[ASCompetitionParticipantScoreView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrimaryScore:(unint64_t)a3
{
  NSNumber *previousLayoutWidth;

  self->_primaryScore = a3;
  -[ASCompetitionParticipantScoreView _updatePrimaryScoreLabelWithFontSizeReduction:](self, "_updatePrimaryScoreLabelWithFontSizeReduction:", self->_primaryScoreFontSizeReduction);
  previousLayoutWidth = self->_previousLayoutWidth;
  self->_previousLayoutWidth = 0;

  -[ASCompetitionParticipantScoreView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPrimaryScoreFontSizeReduction:(double)a3
{
  NSNumber *previousLayoutWidth;

  if (vabdd_f64(self->_primaryScoreFontSizeReduction, a3) > 0.00000011920929)
  {
    -[ASCompetitionParticipantScoreView _updatePrimaryScoreLabelWithFontSizeReduction:](self, "_updatePrimaryScoreLabelWithFontSizeReduction:");
    previousLayoutWidth = self->_previousLayoutWidth;
    self->_previousLayoutWidth = 0;

    -[ASCompetitionParticipantScoreView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSecondaryScore:(unint64_t)a3
{
  self->_secondaryScore = a3;
  -[ASCompetitionParticipantScoreView _updateSecondaryScoreLabel](self, "_updateSecondaryScoreLabel");
}

- (void)setScoreColor:(id)a3
{
  UIColor **p_scoreColor;
  id v6;

  p_scoreColor = &self->_scoreColor;
  objc_storeStrong((id *)&self->_scoreColor, a3);
  v6 = a3;
  -[UILabel setTextColor:](self->_secondaryScoreLabel, "setTextColor:", *p_scoreColor);

}

- (void)setSecondaryScoreEnabled:(BOOL)a3
{
  UILabel *secondaryScoreLabel;
  id v5;
  UILabel *v6;
  UILabel *v7;
  uint64_t v8;
  void *v9;
  UILabel *v10;
  NSNumber *previousLayoutWidth;

  if (self->_secondaryScoreEnabled != a3)
  {
    self->_secondaryScoreEnabled = a3;
    secondaryScoreLabel = self->_secondaryScoreLabel;
    if (a3)
    {
      if (!secondaryScoreLabel)
      {
        v5 = objc_alloc(MEMORY[0x24BEBD708]);
        v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v7 = self->_secondaryScoreLabel;
        self->_secondaryScoreLabel = v6;

        -[UILabel setLineBreakMode:](self->_secondaryScoreLabel, "setLineBreakMode:", 4);
        if (-[ASCompetitionScoreViewConfiguration alignment](self->_configuration, "alignment") == 1)
          v8 = 1;
        else
          v8 = 4;
        -[UILabel setTextAlignment:](self->_secondaryScoreLabel, "setTextAlignment:", v8);
        -[ASCompetitionScoreViewConfiguration secondaryScoreFont](self->_configuration, "secondaryScoreFont");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_secondaryScoreLabel, "setFont:", v9);

        -[UILabel setTextColor:](self->_secondaryScoreLabel, "setTextColor:", self->_scoreColor);
        -[ASCompetitionParticipantScoreView addSubview:](self, "addSubview:", self->_secondaryScoreLabel);
        -[ASCompetitionParticipantScoreView _updateSecondaryScoreLabel](self, "_updateSecondaryScoreLabel");
      }
    }
    else if (secondaryScoreLabel)
    {
      -[UILabel removeFromSuperview](secondaryScoreLabel, "removeFromSuperview");
      v10 = self->_secondaryScoreLabel;
      self->_secondaryScoreLabel = 0;

    }
    previousLayoutWidth = self->_previousLayoutWidth;
    self->_previousLayoutWidth = 0;

    -[ASCompetitionParticipantScoreView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)computePrimaryScoreFontSizeReductionForWidth:(double)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  UILabel *primaryScoreLabel;
  double result;
  _QWORD v11[5];

  -[ASCompetitionParticipantScoreView _availableScoreWidthForWidth:](self, "_availableScoreWidthForWidth:", a3);
  v5 = v4;
  -[ASCompetitionScoreViewConfiguration primaryScoreFont](self->_configuration, "primaryScoreFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v7 * 0.3;

  primaryScoreLabel = self->_primaryScoreLabel;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__ASCompetitionParticipantScoreView_computePrimaryScoreFontSizeReductionForWidth___block_invoke;
  v11[3] = &unk_24EE9D5F0;
  v11[4] = self;
  -[ASCompetitionParticipantScoreView _computeFontSizeReductionForLabel:width:maxReduction:updateBlock:](self, "_computeFontSizeReductionForLabel:width:maxReduction:updateBlock:", primaryScoreLabel, v11, v5, v8);
  return result;
}

uint64_t __82__ASCompetitionParticipantScoreView_computePrimaryScoreFontSizeReductionForWidth___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrimaryScoreLabelWithFontSizeReduction:");
}

- (double)computeNameFontSizeReductionForWidth:(double)a3
{
  _BOOL4 v5;
  double result;
  void *v7;
  double v8;
  double v9;
  UILabel *nameLabel;
  _QWORD v11[5];

  v5 = -[ASCompetitionScoreViewConfiguration showsNames](self->_configuration, "showsNames");
  result = 0.0;
  if (v5)
  {
    -[ASCompetitionScoreViewConfiguration nameFont](self->_configuration, "nameFont", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    v9 = v8 * 0.3;

    nameLabel = self->_nameLabel;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __74__ASCompetitionParticipantScoreView_computeNameFontSizeReductionForWidth___block_invoke;
    v11[3] = &unk_24EE9D5F0;
    v11[4] = self;
    -[ASCompetitionParticipantScoreView _computeFontSizeReductionForLabel:width:maxReduction:updateBlock:](self, "_computeFontSizeReductionForLabel:width:maxReduction:updateBlock:", nameLabel, v11, a3, v9);
  }
  return result;
}

uint64_t __74__ASCompetitionParticipantScoreView_computeNameFontSizeReductionForWidth___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNameLabelWithFontSizeReduction:");
}

- (double)_computeFontSizeReductionForLabel:(id)a3 width:(double)a4 maxReduction:(double)a5 updateBlock:(id)a6
{
  id v9;
  void (**v10)(_QWORD, double);
  double v11;
  double v12;

  v9 = a3;
  v10 = (void (**)(_QWORD, double))a6;
  v11 = 0.0;
  if (a4 > 1.0)
  {
    v11 = -1.0;
    if (a5 >= -1.0)
    {
      do
      {
        v11 = v11 + 1.0;
        v10[2](v10, v11);
        objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      }
      while (v11 <= a5 && v12 > a4);
    }
  }

  return v11;
}

- (double)_availableScoreWidthForWidth:(double)a3
{
  return a3 - self->_scoreLeftMargin - self->_scoreRightMargin;
}

- (void)_updateNameLabelWithFontSizeReduction:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;
  id v10;

  -[ASCompetitionScoreViewConfiguration nameFont](self->_configuration, "nameFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (fabs(a3) > 0.00000011920929)
  {
    v9 = v5;
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v9, "fontWithSize:", v7 - a3);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v10 = v6;
  -[UILabel setFont:](self->_nameLabel, "setFont:", v6);
  self->_nameFontSizeReduction = a3;

}

- (void)_updatePrimaryScoreLabelWithFontSizeReduction:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  UIColor *scoreColor;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  -[ASCompetitionScoreViewConfiguration primaryScoreFont](self->_configuration, "primaryScoreFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionScoreViewConfiguration primaryScoreUnitFont](self->_configuration, "primaryScoreUnitFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (fabs(a3) > 0.00000011920929)
  {
    objc_msgSend(v5, "pointSize");
    v8 = v7;
    objc_msgSend(v6, "pointSize");
    v10 = v9;
    objc_msgSend(v5, "fontWithSize:", v8 - a3);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fontWithSize:", v10 - a3);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
    v5 = (void *)v11;
  }
  if (-[ASCompetitionScoreViewConfiguration showsPrimaryScoreUnits](self->_configuration, "showsPrimaryScoreUnits"))
  {
    ASPointsStringWithScore(self->_primaryScore, v5, v6, self->_scoreColor);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_primaryScoreLabel, "setAttributedText:", v13);
  }
  else
  {
    if (-[ASCompetitionScoreViewConfiguration zeroPadPrimaryScore](self->_configuration, "zeroPadPrimaryScore"))
    {
      ASCompetitionZeroPaddedScoreString(self->_primaryScore);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x24BE37938];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_primaryScore);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithNumber:decimalPrecision:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v16 = objc_alloc(MEMORY[0x24BDD1458]);
    scoreColor = self->_scoreColor;
    v18 = *MEMORY[0x24BEBB360];
    v21[0] = *MEMORY[0x24BEBB368];
    v21[1] = v18;
    v22[0] = scoreColor;
    v22[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithString:attributes:", v13, v19);
    -[UILabel setAttributedText:](self->_primaryScoreLabel, "setAttributedText:", v20);

  }
  self->_primaryScoreFontSizeReduction = a3;

}

- (void)_updateSecondaryScoreLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BE37938];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_secondaryScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithNumber:decimalPrecision:", v4, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("COMPETITION_TODAY_SCORE_SUBTEXT"), &stru_24EE9E808, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_secondaryScoreLabel, "setText:", v8);

}

- (NSString)name
{
  return self->_name;
}

- (double)nameFontSizeReduction
{
  return self->_nameFontSizeReduction;
}

- (unint64_t)primaryScore
{
  return self->_primaryScore;
}

- (double)primaryScoreFontSizeReduction
{
  return self->_primaryScoreFontSizeReduction;
}

- (unint64_t)secondaryScore
{
  return self->_secondaryScore;
}

- (UIColor)scoreColor
{
  return self->_scoreColor;
}

- (BOOL)secondaryScoreEnabled
{
  return self->_secondaryScoreEnabled;
}

- (double)scoreLeftMargin
{
  return self->_scoreLeftMargin;
}

- (void)setScoreLeftMargin:(double)a3
{
  self->_scoreLeftMargin = a3;
}

- (double)scoreRightMargin
{
  return self->_scoreRightMargin;
}

- (void)setScoreRightMargin:(double)a3
{
  self->_scoreRightMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_previousLayoutWidth, 0);
  objc_storeStrong((id *)&self->_secondaryScoreLabel, 0);
  objc_storeStrong((id *)&self->_primaryScoreLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

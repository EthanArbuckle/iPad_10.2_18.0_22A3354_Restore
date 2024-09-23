@implementation ASCompetitionScoreView

- (ASCompetitionScoreView)initWithConfiguration:(id)a3
{
  void *v3;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  ASCompetitionScoreView *v11;
  ASCompetitionScoreView *v12;
  ASCompetitionParticipantScoreView *v13;
  ASCompetitionParticipantScoreView *myScoreView;
  ASCompetitionParticipantScoreView *v15;
  ASCompetitionParticipantScoreView *opponentScoreView;
  uint64_t v17;
  UILabel *scoreTypeHeaderLabel;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIImageView *achievementThumbnailView;
  double v28;
  double v29;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASCompetitionScoreView;
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = -[ASCompetitionScoreView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x24BDBF090], v8, v9, v10);
  v12 = v11;
  if (!v11)
    goto LABEL_14;
  objc_storeStrong((id *)&v11->_configuration, a3);
  v12->_isRTLLayout = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == 1;
  v13 = -[ASCompetitionParticipantScoreView initWithConfiguration:]([ASCompetitionParticipantScoreView alloc], "initWithConfiguration:", v6);
  myScoreView = v12->_myScoreView;
  v12->_myScoreView = v13;

  -[ASCompetitionScoreView addSubview:](v12, "addSubview:", v12->_myScoreView);
  v15 = -[ASCompetitionParticipantScoreView initWithConfiguration:]([ASCompetitionParticipantScoreView alloc], "initWithConfiguration:", v6);
  opponentScoreView = v12->_opponentScoreView;
  v12->_opponentScoreView = v15;

  -[ASCompetitionScoreView addSubview:](v12, "addSubview:", v12->_opponentScoreView);
  if (objc_msgSend(v6, "showsScoreTypeHeader"))
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v7, v8, v9, v10);
    scoreTypeHeaderLabel = v12->_scoreTypeHeaderLabel;
    v12->_scoreTypeHeaderLabel = (UILabel *)v17;

    objc_msgSend(v6, "headerFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_scoreTypeHeaderLabel, "setFont:", v19);

    v20 = objc_msgSend(v6, "primaryScoreSource");
    if (v20 == 2)
    {
      ActivitySharingBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = CFSTR("COMPETITION_TOTAL_WINS_HEADER");
    }
    else if (v20 == 1)
    {
      ActivitySharingBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = CFSTR("COMPETITION_TODAY_SCORE_HEADER");
    }
    else
    {
      if (v20)
      {
LABEL_10:
        objc_msgSend(v3, "localizedUppercaseString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v12->_scoreTypeHeaderLabel, "setText:", v24);

        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12->_scoreTypeHeaderLabel, "setTextColor:", v25);

        -[UILabel setTextAlignment:](v12->_scoreTypeHeaderLabel, "setTextAlignment:", 1);
        -[ASCompetitionScoreView addSubview:](v12, "addSubview:", v12->_scoreTypeHeaderLabel);
        goto LABEL_11;
      }
      ActivitySharingBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = CFSTR("COMPETITION_TOTAL_SCORE_HEADER");
    }
    objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24EE9E808, CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
LABEL_11:
  if (objc_msgSend(v6, "showsAchievementThumbnail"))
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v7, v8, v9, v10);
    achievementThumbnailView = v12->_achievementThumbnailView;
    v12->_achievementThumbnailView = (UIImageView *)v26;

    -[UIImageView setContentMode:](v12->_achievementThumbnailView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v12->_achievementThumbnailView, "setClipsToBounds:", 0);
    -[ASCompetitionScoreView addSubview:](v12, "addSubview:", v12->_achievementThumbnailView);
    if (!objc_msgSend(v6, "achievementThumbnailAlignment"))
    {
      objc_msgSend(v6, "achievementThumbnailSize");
      v29 = v28 * 0.5;
      -[ASCompetitionParticipantScoreView setScoreLeftMargin:](v12->_myScoreView, "setScoreLeftMargin:", v28 * 0.5);
      -[ASCompetitionParticipantScoreView setScoreRightMargin:](v12->_opponentScoreView, "setScoreRightMargin:", v29);
    }
  }
LABEL_14:

  return v12;
}

- (double)participantScoreViewWidthForParticipant:(int64_t)a3 maximumWidth:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double result;
  _BOOL4 isRTLLayout;
  double v14;
  double v15;
  double v16;

  -[ASCompetitionScoreViewConfiguration sideMargin](self->_configuration, "sideMargin");
  v8 = a4 + v7 * -2.0;
  -[ASCompetitionScoreViewConfiguration minimumMiddleMargin](self->_configuration, "minimumMiddleMargin");
  v10 = v8 - v9;
  v11 = -[ASCompetitionScoreViewConfiguration division](self->_configuration, "division");
  if (v11)
  {
    if (v11 == 2)
    {
      -[ASCompetitionScoreViewConfiguration minimumMiddleMargin](self->_configuration, "minimumMiddleMargin");
      v15 = (v10 + v14) * 0.5;
      -[ASCompetitionScoreViewConfiguration minimumMiddleMargin](self->_configuration, "minimumMiddleMargin");
      result = (v10 - v16) * 0.5;
      if (a3)
      {
        if (self->_isRTLLayout)
          return v15;
      }
      else if (!self->_isRTLLayout)
      {
        return v15;
      }
    }
    else if (v11 == 1)
    {
      return v10 * 0.5;
    }
  }
  else
  {
    isRTLLayout = self->_isRTLLayout;
    -[ASCompetitionScoreViewConfiguration opponentScoreViewWidth](self->_configuration, "opponentScoreViewWidth");
    if (a3)
    {
      if (isRTLLayout)
        return v10 - result;
    }
    else if (!isRTLLayout)
    {
      return v10 - result;
    }
  }
  return result;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCompetitionScoreView layoutForWidth:](self, "layoutForWidth:");
  -[ASCompetitionParticipantScoreView sizeThatFits:](self->_myScoreView, "sizeThatFits:", width, height);
  v7 = v6;
  -[ASCompetitionScoreViewConfiguration bottomMargin](self->_configuration, "bottomMargin");
  v9 = v7 + v8;
  if (-[ASCompetitionScoreViewConfiguration showsScoreTypeHeader](self->_configuration, "showsScoreTypeHeader"))
  {
    -[UILabel _lastLineBaselineFrameOriginY](self->_scoreTypeHeaderLabel, "_lastLineBaselineFrameOriginY");
    v9 = v9 + v10;
  }
  v11 = width;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionScoreView;
  -[ASCompetitionScoreView layoutSubviews](&v4, sel_layoutSubviews);
  -[ASCompetitionScoreView bounds](self, "bounds");
  -[ASCompetitionScoreView layoutForWidth:](self, "layoutForWidth:", v3);
}

- (void)layoutForWidth:(double)a3
{
  UILabel *scoreTypeHeaderLabel;
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
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  scoreTypeHeaderLabel = self->_scoreTypeHeaderLabel;
  if (scoreTypeHeaderLabel)
  {
    -[UILabel sizeToFit](scoreTypeHeaderLabel, "sizeToFit");
    -[UILabel bounds](self->_scoreTypeHeaderLabel, "bounds");
    -[UILabel setFrame:](self->_scoreTypeHeaderLabel, "setFrame:", 0.0, 0.0, a3, CGRectGetHeight(v49));
    -[ASCompetitionScoreViewConfiguration headerBaselineOffset](self->_configuration, "headerBaselineOffset");
    -[UILabel _setFirstLineBaselineFrameOriginY:](self->_scoreTypeHeaderLabel, "_setFirstLineBaselineFrameOriginY:");
  }
  -[ASCompetitionScoreViewConfiguration sideMargin](self->_configuration, "sideMargin");
  v7 = v6;
  -[UILabel _lastLineBaselineFrameOriginY](self->_scoreTypeHeaderLabel, "_lastLineBaselineFrameOriginY");
  v9 = v8;
  -[ASCompetitionScoreView participantScoreViewWidthForParticipant:maximumWidth:](self, "participantScoreViewWidthForParticipant:maximumWidth:", 1, a3);
  v11 = v10;
  -[ASCompetitionScoreView participantScoreViewWidthForParticipant:maximumWidth:](self, "participantScoreViewWidthForParticipant:maximumWidth:", 0, a3);
  v13 = v12;
  -[ASCompetitionParticipantScoreView sizeThatFits:](self->_opponentScoreView, "sizeThatFits:", a3, 1.79769313e308);
  v15 = v14;
  -[ASCompetitionParticipantScoreView setFrame:](self->_opponentScoreView, "setFrame:", v7, v9, v11, v14);
  -[ASCompetitionParticipantScoreView frame](self->_opponentScoreView, "frame");
  MaxX = CGRectGetMaxX(v50);
  -[ASCompetitionScoreViewConfiguration minimumMiddleMargin](self->_configuration, "minimumMiddleMargin");
  -[ASCompetitionParticipantScoreView setFrame:](self->_myScoreView, "setFrame:", MaxX + v17, v9, v13, v15);
  if (self->_isRTLLayout)
  {
    -[ASCompetitionParticipantScoreView frame](self->_opponentScoreView, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[ASCompetitionParticipantScoreView frame](self->_myScoreView, "frame");
    -[ASCompetitionParticipantScoreView setFrame:](self->_opponentScoreView, "setFrame:");
    -[ASCompetitionParticipantScoreView setFrame:](self->_myScoreView, "setFrame:", v19, v21, v23, v25);
  }
  if (self->_achievementThumbnailView)
  {
    -[ASCompetitionScoreViewConfiguration achievementThumbnailSize](self->_configuration, "achievementThumbnailSize");
    v27 = v26;
    -[ASCompetitionScoreViewConfiguration achievementThumbnailSize](self->_configuration, "achievementThumbnailSize");
    v29 = v28;
    v30 = -[ASCompetitionScoreViewConfiguration achievementThumbnailAlignment](self->_configuration, "achievementThumbnailAlignment");
    if (v30 == 1)
    {
      -[ASCompetitionParticipantScoreView frame](self->_myScoreView, "frame");
      v34 = CGRectGetMaxY(v51) - v29 + 2.5;
      v37 = 0.0;
      if (!self->_isRTLLayout)
      {
        -[ASCompetitionScoreViewConfiguration achievementThumbnailSize](self->_configuration, "achievementThumbnailSize", 0.0);
        v37 = a3 - v38;
      }
      goto LABEL_13;
    }
    if (!v30)
    {
      -[UILabel _lastLineBaselineFrameOriginY](self->_scoreTypeHeaderLabel, "_lastLineBaselineFrameOriginY");
      v32 = v31;
      -[ASCompetitionScoreViewConfiguration achievementThumbnailTopMargin](self->_configuration, "achievementThumbnailTopMargin");
      v34 = v32 + v33;
      if (-[ASCompetitionScoreViewConfiguration showsNames](self->_configuration, "showsNames"))
      {
        -[ASCompetitionParticipantScoreView nameBaselineY](self->_myScoreView, "nameBaselineY");
        v34 = v34 + v35;
      }
      -[ASCompetitionScoreViewConfiguration achievementThumbnailSize](self->_configuration, "achievementThumbnailSize");
      v37 = (a3 - v36) * 0.5;
LABEL_13:
      -[UIImageView setFrame:](self->_achievementThumbnailView, "setFrame:", v37, v34, v27, v29);
    }
  }
  -[ASCompetitionParticipantScoreView computeNameFontSizeReductionForWidth:](self->_myScoreView, "computeNameFontSizeReductionForWidth:", v13);
  v40 = v39;
  -[ASCompetitionParticipantScoreView computeNameFontSizeReductionForWidth:](self->_opponentScoreView, "computeNameFontSizeReductionForWidth:", v11);
  v41 = v40;
  *(float *)&v42 = v42;
  v43 = fmaxf(v41, *(float *)&v42);
  -[ASCompetitionParticipantScoreView setNameFontSizeReduction:](self->_myScoreView, "setNameFontSizeReduction:", v43);
  -[ASCompetitionParticipantScoreView setNameFontSizeReduction:](self->_opponentScoreView, "setNameFontSizeReduction:", v43);
  -[ASCompetitionParticipantScoreView computePrimaryScoreFontSizeReductionForWidth:](self->_myScoreView, "computePrimaryScoreFontSizeReductionForWidth:", v13);
  v45 = v44;
  -[ASCompetitionParticipantScoreView computePrimaryScoreFontSizeReductionForWidth:](self->_opponentScoreView, "computePrimaryScoreFontSizeReductionForWidth:", v11);
  v46 = v45;
  *(float *)&v47 = v47;
  v48 = fmaxf(v46, *(float *)&v47);
  -[ASCompetitionParticipantScoreView setPrimaryScoreFontSizeReduction:](self->_myScoreView, "setPrimaryScoreFontSizeReduction:", v48);
  -[ASCompetitionParticipantScoreView setPrimaryScoreFontSizeReduction:](self->_opponentScoreView, "setPrimaryScoreFontSizeReduction:", v48);
}

- (double)lastBaselineY
{
  CGRect v3;

  -[ASCompetitionParticipantScoreView frame](self->_myScoreView, "frame");
  return CGRectGetMaxY(v3);
}

- (void)setFriend:(id)a3 competition:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  ASCompetitionParticipantScoreView *myScoreView;
  id v29;
  void *v30;
  UIImageView *achievementThumbnailView;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  id v37;

  v37 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_colorForParticipant:competition:", 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetitionParticipantScoreView setScoreColor:](self->_opponentScoreView, "setScoreColor:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "as_colorForParticipant:competition:", 0, v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v8;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v37, "numberOfCompetitionWinsByMe");
  v10 = objc_msgSend(v37, "numberOfCompetitionWinsAgainstMe");
  if (v9 > v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_darkCompetitionGold");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetitionParticipantScoreView setScoreColor:](self->_opponentScoreView, "setScoreColor:", v11);

    objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v35 = v10;
  objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionParticipantScoreView setScoreColor:](self->_opponentScoreView, "setScoreColor:", v36);

  if (v35 <= v9)
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "as_darkCompetitionGold");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  -[ASCompetitionParticipantScoreView setScoreColor:](self->_myScoreView, "setScoreColor:", v12);

  v13 = -[ASCompetitionScoreViewConfiguration uppercaseNames](self->_configuration, "uppercaseNames");
  objc_msgSend(v37, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "uppercaseString");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v17 = -[ASCompetitionScoreViewConfiguration uppercaseNames](self->_configuration, "uppercaseNames");
  ActivitySharingBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
    v20 = CFSTR("UPPERCASE_ME");
  else
    v20 = CFSTR("ME");
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24EE9E808, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCompetitionParticipantScoreView setName:](self->_opponentScoreView, "setName:", v15);
  -[ASCompetitionParticipantScoreView setName:](self->_myScoreView, "setName:", v21);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "dailyScoreForParticipant:onDate:", 0, v22);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v6, "dailyScoreForParticipant:onDate:", 1, v24);

  v26 = -[ASCompetitionScoreViewConfiguration primaryScoreSource](self->_configuration, "primaryScoreSource");
  switch(v26)
  {
    case 2:
      -[ASCompetitionParticipantScoreView setPrimaryScore:](self->_opponentScoreView, "setPrimaryScore:", objc_msgSend(v37, "numberOfCompetitionWinsAgainstMe"));
      v27 = objc_msgSend(v37, "numberOfCompetitionWinsByMe");
      myScoreView = self->_myScoreView;
LABEL_18:
      -[ASCompetitionParticipantScoreView setPrimaryScore:](myScoreView, "setPrimaryScore:", v27);
      break;
    case 1:
      -[ASCompetitionParticipantScoreView setPrimaryScore:](self->_opponentScoreView, "setPrimaryScore:", v25);
      myScoreView = self->_myScoreView;
      v27 = v23;
      goto LABEL_18;
    case 0:
      -[ASCompetitionParticipantScoreView setPrimaryScore:](self->_opponentScoreView, "setPrimaryScore:", objc_msgSend(v6, "opponentTotalScore"));
      -[ASCompetitionParticipantScoreView setPrimaryScore:](self->_myScoreView, "setPrimaryScore:", objc_msgSend(v6, "myTotalScore"));
      if (-[ASCompetitionScoreViewConfiguration showsTodaySecondaryScore](self->_configuration, "showsTodaySecondaryScore"))
      {
        -[ASCompetitionParticipantScoreView setSecondaryScoreEnabled:](self->_opponentScoreView, "setSecondaryScoreEnabled:", objc_msgSend(v37, "hasCompletedFirstDayOfCurrentCompetition"));
        -[ASCompetitionParticipantScoreView setSecondaryScoreEnabled:](self->_myScoreView, "setSecondaryScoreEnabled:", objc_msgSend(v37, "hasCompletedFirstDayOfCurrentCompetition"));
        -[ASCompetitionParticipantScoreView setSecondaryScore:](self->_opponentScoreView, "setSecondaryScore:", v25);
        -[ASCompetitionParticipantScoreView setSecondaryScore:](self->_myScoreView, "setSecondaryScore:", v23);
      }
      break;
  }
  if (v6)
  {
    v29 = v6;
  }
  else
  {
    objc_msgSend(v37, "currentOrMostRecentCompetition");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;
  achievementThumbnailView = self->_achievementThumbnailView;
  if (achievementThumbnailView && v30)
  {
    objc_msgSend(v30, "victoryBadgeStyle");
    -[ASCompetitionScoreViewConfiguration achievementThumbnailQuality](self->_configuration, "achievementThumbnailQuality");
    ASAchievementThumbnailPathForStyle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v32, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_achievementThumbnailView, "setImage:", v34);

  }
  else
  {
    -[UIImageView setImage:](achievementThumbnailView, "setImage:", 0);
  }
  -[ASCompetitionScoreView setNeedsLayout](self, "setNeedsLayout");

}

+ (double)preferredHeightForConfiguration:(id)a3 friend:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bottomMargin");
  v8 = v7;
  if (objc_msgSend(v5, "wantsScaledBaselineAlignment"))
  {
    objc_msgSend(v5, "primaryScoreFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryScoreBaselineOffset");
    objc_msgSend(v9, "_scaledValueForValue:");
    v11 = v10;

  }
  else
  {
    objc_msgSend(v5, "primaryScoreBaselineOffset");
    v11 = v12;
  }
  v13 = v8 + v11;
  if (objc_msgSend(v5, "showsNames"))
  {
    if (objc_msgSend(v5, "wantsScaledBaselineAlignment"))
    {
      objc_msgSend(v5, "nameFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nameBaselineOffset");
      objc_msgSend(v14, "_scaledValueForValue:");
      v13 = v13 + v15;

    }
    else
    {
      objc_msgSend(v5, "nameBaselineOffset");
      v13 = v13 + v16;
    }
  }
  if (objc_msgSend(v5, "showsTodaySecondaryScore")
    && objc_msgSend(v6, "hasCompletedFirstDayOfCurrentCompetition"))
  {
    objc_msgSend(v5, "secondaryScoreFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secondaryScoreBaselineOffset");
    objc_msgSend(v17, "_scaledValueForValue:");
    v13 = v13 + v18;

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreTypeHeaderLabel, 0);
  objc_storeStrong((id *)&self->_achievementThumbnailView, 0);
  objc_storeStrong((id *)&self->_opponentScoreView, 0);
  objc_storeStrong((id *)&self->_myScoreView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

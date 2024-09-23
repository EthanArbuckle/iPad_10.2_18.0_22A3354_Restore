@implementation ASCompetitionGizmoDetailView

- (ASCompetitionGizmoDetailView)initWithDetailViewType:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  ASCompetitionGizmoDetailView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  ASCompetitionScoreView *v13;
  ASCompetitionScoreView *totalScoreView;
  int64_t modules;
  ASCompetitionMessageBubbleView *v16;
  ASCompetitionMessageBubbleView *messageBubbleView;
  uint64_t v19;
  ASCompetitionGraphView *graphView;
  ASCompetitionGraphView *v21;
  void *v22;
  uint64_t v23;
  UIView *totalWinsSeparator;
  void *v25;
  ASCompetitionScoreView *v26;
  ASCompetitionScoreView *totalWinsScoreView;
  uint64_t v28;
  UIView *timeRemainingSeparator;
  ASCompetitionTimeRemainingLabel *v30;
  ASCompetitionTimeRemainingLabel *timeRemainingLabel;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ASCompetitionGizmoDetailView;
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[ASCompetitionGizmoDetailView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x24BDBF090], v5, v6, v7);
  if (!v8)
    return v8;
  _BackgroundColorForDetailViewType((void *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionGizmoDetailView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[ASCompetitionGizmoDetailView layer](v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 6.0);

  v8->_type = a3;
  if ((unint64_t)(a3 - 1) > 5)
    v11 = 29;
  else
    v11 = qword_226B5EF10[a3 - 1];
  v8->_modules = v11;
  +[ASCompetitionScoreViewConfiguration gizmoTotalScoreConfiguration](ASCompetitionScoreViewConfiguration, "gizmoTotalScoreConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ASCompetitionScoreView initWithConfiguration:]([ASCompetitionScoreView alloc], "initWithConfiguration:", v12);
  totalScoreView = v8->_totalScoreView;
  v8->_totalScoreView = v13;

  -[ASCompetitionGizmoDetailView addSubview:](v8, "addSubview:", v8->_totalScoreView);
  modules = v8->_modules;
  if ((modules & 2) != 0)
  {
    +[ASCompetitionGraphView gizmoGraph](ASCompetitionGraphView, "gizmoGraph");
    v19 = objc_claimAutoreleasedReturnValue();
    graphView = v8->_graphView;
    v8->_graphView = (ASCompetitionGraphView *)v19;

    v21 = v8->_graphView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetitionGraphView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[ASCompetitionGizmoDetailView addSubview:](v8, "addSubview:", v8->_graphView);
    modules = v8->_modules;
    if ((modules & 4) == 0)
    {
LABEL_7:
      if ((modules & 8) == 0)
        goto LABEL_8;
LABEL_13:
      if ((modules & 4) != 0)
      {
        _CreateSeparatorView();
        v28 = objc_claimAutoreleasedReturnValue();
        timeRemainingSeparator = v8->_timeRemainingSeparator;
        v8->_timeRemainingSeparator = (UIView *)v28;

        -[ASCompetitionGizmoDetailView addSubview:](v8, "addSubview:", v8->_timeRemainingSeparator);
      }
      v30 = -[ASCompetitionTimeRemainingLabel initWithFrame:]([ASCompetitionTimeRemainingLabel alloc], "initWithFrame:", v4, v5, v6, v7);
      timeRemainingLabel = v8->_timeRemainingLabel;
      v8->_timeRemainingLabel = v30;

      -[ASCompetitionGizmoDetailView addSubview:](v8, "addSubview:", v8->_timeRemainingLabel);
      if ((v8->_modules & 0x10) != 0)
        goto LABEL_9;
      return v8;
    }
  }
  else if ((modules & 4) == 0)
  {
    goto LABEL_7;
  }
  _CreateSeparatorView();
  v23 = objc_claimAutoreleasedReturnValue();
  totalWinsSeparator = v8->_totalWinsSeparator;
  v8->_totalWinsSeparator = (UIView *)v23;

  -[ASCompetitionGizmoDetailView addSubview:](v8, "addSubview:", v8->_totalWinsSeparator);
  +[ASCompetitionScoreViewConfiguration gizmoTotalWinsConfiguration](ASCompetitionScoreViewConfiguration, "gizmoTotalWinsConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[ASCompetitionScoreView initWithConfiguration:]([ASCompetitionScoreView alloc], "initWithConfiguration:", v25);
  totalWinsScoreView = v8->_totalWinsScoreView;
  v8->_totalWinsScoreView = v26;

  -[ASCompetitionGizmoDetailView addSubview:](v8, "addSubview:", v8->_totalWinsScoreView);
  modules = v8->_modules;
  if ((modules & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((modules & 0x10) != 0)
  {
LABEL_9:
    v16 = -[ASCompetitionMessageBubbleView initWithFrame:]([ASCompetitionMessageBubbleView alloc], "initWithFrame:", v4, v5, v6, v7);
    messageBubbleView = v8->_messageBubbleView;
    v8->_messageBubbleView = v16;

    -[ASCompetitionGizmoDetailView addSubview:](v8, "addSubview:", v8->_messageBubbleView);
  }
  return v8;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionGizmoDetailView;
  -[ASCompetitionGizmoDetailView layoutSubviews](&v4, sel_layoutSubviews);
  -[ASCompetitionGizmoDetailView bounds](self, "bounds");
  -[ASCompetitionGizmoDetailView layoutForWidth:](self, "layoutForWidth:", v3);
}

- (void)layoutForWidth:(double)a3
{
  NSNumber *previousLayoutWidth;
  float v6;
  double v7;
  ASCompetitionGraphView *graphView;
  double v9;
  double v10;
  double MinY;
  double v12;
  double v13;
  double MaxY;
  double v15;
  double v16;
  UIView *timeRemainingSeparator;
  double v18;
  ASCompetitionMessageBubbleView *messageBubbleView;
  double v20;
  double Height;
  CGFloat v22;
  double v23;
  ASCompetitionTimeRemainingLabel *timeRemainingLabel;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  double v31;
  double v32;
  double v33;
  double Width;
  double v35;
  double v36;
  NSNumber *v37;
  NSNumber *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[2];
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v45 = *MEMORY[0x24BDAC8D0];
  previousLayoutWidth = self->_previousLayoutWidth;
  if (!previousLayoutWidth
    || (-[NSNumber floatValue](previousLayoutWidth, "floatValue"), vabdd_f64(v6, a3) >= 0.00000011920929))
  {
    -[ASCompetitionScoreView sizeToFit](self->_totalScoreView, "sizeToFit");
    -[ASCompetitionScoreView sizeToFit](self->_totalWinsScoreView, "sizeToFit");
    -[ASCompetitionTimeRemainingLabel sizeToFit](self->_timeRemainingLabel, "sizeToFit");
    -[ASCompetitionMessageBubbleView sizeToFit](self->_messageBubbleView, "sizeToFit");
    -[ASCompetitionScoreView sizeToFit](self->_totalWinsScoreView, "sizeToFit");
    -[ASCompetitionScoreView bounds](self->_totalScoreView, "bounds");
    -[ASCompetitionScoreView setFrame:](self->_totalScoreView, "setFrame:", 0.0, 0.0, a3, CGRectGetHeight(v46));
    -[ASCompetitionScoreView lastBaselineY](self->_totalScoreView, "lastBaselineY");
    graphView = self->_graphView;
    if (graphView)
    {
      v9 = v7 + 10.0;
      -[ASCompetitionGraphView preferredHeight](graphView, "preferredHeight");
      -[ASCompetitionGraphView setFrame:](self->_graphView, "setFrame:", 0.0, v9, a3, v10);
      -[ASCompetitionGraphView frame](self->_graphView, "frame");
      MinY = CGRectGetMinY(v47);
      -[ASCompetitionGraphView lastBaselineY](self->_graphView, "lastBaselineY");
      v7 = MinY + v12;
    }
    if (self->_totalWinsScoreView)
    {
      v13 = 6.5;
      if (!self->_graphView)
        v13 = 10.0;
      -[UIView setFrame:](self->_totalWinsSeparator, "setFrame:", 2.0, v7 + v13, a3 + -4.0, 1.5);
      -[UIView frame](self->_totalWinsSeparator, "frame");
      MaxY = CGRectGetMaxY(v48);
      -[ASCompetitionScoreView bounds](self->_totalWinsScoreView, "bounds");
      -[ASCompetitionScoreView setFrame:](self->_totalWinsScoreView, "setFrame:", 0.0, MaxY, a3, CGRectGetHeight(v49));
      -[ASCompetitionScoreView frame](self->_totalWinsScoreView, "frame");
      v15 = CGRectGetMinY(v50);
      -[ASCompetitionScoreView lastBaselineY](self->_totalWinsScoreView, "lastBaselineY");
      v7 = v15 + v16;
    }
    timeRemainingSeparator = self->_timeRemainingSeparator;
    if (timeRemainingSeparator)
    {
      v18 = 10.0;
      if (!self->_totalWinsScoreView)
        v18 = 6.5;
      -[UIView setFrame:](timeRemainingSeparator, "setFrame:", 2.0, v7 + v18, a3 + -4.0, 1.5);
      -[UIView frame](self->_timeRemainingSeparator, "frame");
      v7 = CGRectGetMaxY(v51);
    }
    if (self->_timeRemainingLabel)
    {
      messageBubbleView = self->_messageBubbleView;
      if (messageBubbleView)
      {
        v20 = 5.0;
        if (!self->_timeRemainingSeparator)
          v20 = 13.0;
        -[ASCompetitionMessageBubbleView setFrame:](messageBubbleView, "setFrame:", a3 + -5.0 + -30.0, v7 + v20, 30.0, 30.0);
        -[ASCompetitionTimeRemainingLabel bounds](self->_timeRemainingLabel, "bounds");
        Height = CGRectGetHeight(v52);
        -[ASCompetitionMessageBubbleView frame](self->_messageBubbleView, "frame");
        v22 = CGRectGetMidY(v53) + Height * -0.5;
        -[ASCompetitionMessageBubbleView frame](self->_messageBubbleView, "frame");
        v23 = CGRectGetMinX(v54) + -5.0 + -4.0;
        -[ASCompetitionTimeRemainingLabel frame](self->_timeRemainingLabel, "frame");
        -[ASCompetitionTimeRemainingLabel setFrame:](self->_timeRemainingLabel, "setFrame:", 5.0, v22, fmin(CGRectGetWidth(v55), v23), Height);
        if (objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == 1)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          timeRemainingLabel = self->_timeRemainingLabel;
          v43[0] = self->_messageBubbleView;
          v43[1] = timeRemainingLabel;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v40 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v30, "frame");
                v31 = a3 - CGRectGetWidth(v56);
                objc_msgSend(v30, "frame");
                v32 = v31 - CGRectGetMinX(v57);
                objc_msgSend(v30, "frame");
                v33 = CGRectGetMinY(v58);
                objc_msgSend(v30, "frame");
                Width = CGRectGetWidth(v59);
                objc_msgSend(v30, "frame");
                objc_msgSend(v30, "setFrame:", v32, v33, Width, CGRectGetHeight(v60));
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
            }
            while (v27);
          }

        }
      }
      else
      {
        v35 = 18.5;
        if (self->_graphView)
          v35 = 19.0;
        v36 = v7 + v35;
        -[ASCompetitionTimeRemainingLabel bounds](self->_timeRemainingLabel, "bounds");
        -[ASCompetitionTimeRemainingLabel setFrame:](self->_timeRemainingLabel, "setFrame:", 5.0, 0.0, a3 + -10.0, CGRectGetHeight(v61));
        -[ASCompetitionTimeRemainingLabel _setLastLineBaselineFrameOriginY:](self->_timeRemainingLabel, "_setLastLineBaselineFrameOriginY:", v36);
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v38 = self->_previousLayoutWidth;
    self->_previousLayoutWidth = v37;

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  ASCompetitionTimeRemainingLabel *timeRemainingLabel;
  double MaxY;
  double v7;
  uint64_t v8;
  ASCompetitionScoreView *totalWinsScoreView;
  double MinY;
  double v11;
  double v12;
  double v13;
  ASCompetitionGraphView *graphView;
  CGSize result;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  width = a3.width;
  -[ASCompetitionGizmoDetailView layoutForWidth:](self, "layoutForWidth:", a3.width, a3.height);
  timeRemainingLabel = self->_timeRemainingLabel;
  if (timeRemainingLabel)
  {
    if (self->_messageBubbleView)
    {
      -[ASCompetitionMessageBubbleView frame](self->_messageBubbleView, "frame");
      MaxY = CGRectGetMaxY(v16);
      v7 = 5.0;
    }
    else
    {
      -[ASCompetitionTimeRemainingLabel _lastLineBaselineFrameOriginY](timeRemainingLabel, "_lastLineBaselineFrameOriginY");
      v7 = 10.5;
    }
  }
  else
  {
    v8 = 424;
    totalWinsScoreView = self->_totalWinsScoreView;
    if (!totalWinsScoreView)
    {
      graphView = self->_graphView;
      if (graphView)
      {
        -[ASCompetitionGraphView frame](graphView, "frame");
        v12 = CGRectGetMaxY(v18);
        goto LABEL_8;
      }
      v8 = 416;
      totalWinsScoreView = self->_totalScoreView;
    }
    -[ASCompetitionScoreView frame](totalWinsScoreView, "frame");
    MinY = CGRectGetMinY(v17);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "lastBaselineY");
    MaxY = MinY + v11;
    v7 = 10.0;
  }
  v12 = MaxY + v7;
LABEL_8:
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)setFriend:(id)a3 competition:(id)a4
{
  ASCompetitionScoreView *totalScoreView;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  totalScoreView = self->_totalScoreView;
  v7 = a4;
  -[ASCompetitionScoreView setFriend:competition:](totalScoreView, "setFriend:competition:", v10, v7);
  -[ASCompetitionScoreView setFriend:competition:](self->_totalWinsScoreView, "setFriend:competition:", v10, v7);
  -[ASCompetitionGraphView setCompetition:](self->_graphView, "setCompetition:", v7);

  if (self->_timeRemainingLabel)
  {
    objc_msgSend(v10, "as_competitionStageString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedUppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetitionTimeRemainingLabel setText:](self->_timeRemainingLabel, "setText:", v9);

  }
  -[ASCompetitionGizmoDetailView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)supportsSmackTalkReply
{
  return self->_messageBubbleView != 0;
}

- (BOOL)isInteractionEnabled
{
  return self->_isInteractionEnabled;
}

- (void)setIsInteractionEnabled:(BOOL)a3
{
  self->_isInteractionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayoutWidth, 0);
  objc_storeStrong((id *)&self->_totalWinsSeparator, 0);
  objc_storeStrong((id *)&self->_timeRemainingSeparator, 0);
  objc_storeStrong((id *)&self->_messageBubbleView, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_totalWinsScoreView, 0);
  objc_storeStrong((id *)&self->_totalScoreView, 0);
}

@end

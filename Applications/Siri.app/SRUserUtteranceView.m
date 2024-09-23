@implementation SRUserUtteranceView

- (SRUserUtteranceView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SRUserUtteranceView *v7;
  SUICStreamingTextView *v8;
  SUICStreamingTextView *streamingTextView;
  SUICStreamingTextView *v10;
  void *v11;
  id v12;
  SUICStreamingTextView *v13;
  SRTapToEditView *v14;
  SRTapToEditView *tapToEditView;
  id v16;
  CGFloat v17;
  uint64_t v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)SRUserUtteranceView;
  v7 = -[SRUserUtteranceView initWithFrame:](&v20, "initWithFrame:");
  if (v7)
  {
    v8 = (SUICStreamingTextView *)objc_msgSend(objc_alloc((Class)SUICStreamingTextView), "initWithFrame:", x, y, width, height);
    streamingTextView = v7->_streamingTextView;
    v7->_streamingTextView = v8;

    v10 = v7->_streamingTextView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
    -[SUICStreamingTextView setFont:](v10, "setFont:", v11);

    v12 = -[SUICStreamingTextView setAnimationDuration:](v7->_streamingTextView, "setAnimationDuration:", 0.3);
    v13 = v7->_streamingTextView;
    SiriUITextHyphenationFactor(v12);
    -[SUICStreamingTextView setHyphenationFactor:](v13, "setHyphenationFactor:");
    -[SRUserUtteranceView addSubview:](v7, "addSubview:", v7->_streamingTextView);
    v14 = -[SRTapToEditView initWithFrame:]([SRTapToEditView alloc], "initWithFrame:", x, y, width, height);
    tapToEditView = v7->_tapToEditView;
    v7->_tapToEditView = v14;

    -[SRUserUtteranceView addSubview:](v7, "addSubview:", v7->_tapToEditView);
    v16 = -[SRTapToEditView setHidden:](v7->_tapToEditView, "setHidden:", 1);
    v17 = SiriUIDefaultEdgePadding;
    v7->_edgeInsets.top = 0.0;
    v7->_edgeInsets.leading = v17;
    v7->_edgeInsets.bottom = 0.0;
    v7->_edgeInsets.trailing = v17;
    -[SRUserUtteranceView recursive_setSemanticContentAttribute:](v7, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v16, v18));
  }
  return v7;
}

- (void)setChevronHidden:(BOOL)a3
{
  if (self->_blendEffectEnabled)
  {
    -[SRTapToEditView setHidden:](self->_tapToEditView, "setHidden:", a3);
    -[SRUserUtteranceView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (double)insertionAnimatedZPosition
{
  return 500.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
  objc_msgSend(v2, "ascender");
  v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  void *v3;
  double v4;
  double v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
  objc_msgSend(v3, "descender");
  v5 = v4;

  if ((-[SRTapToEditView isHidden](self->_tapToEditView, "isHidden") & 1) != 0)
    return -v5;
  -[SRTapToEditView baselineOffsetFromBottom](self->_tapToEditView, "baselineOffsetFromBottom");
  return result;
}

- (NSString)text
{
  return (NSString *)-[SUICStreamingTextView text](self->_streamingTextView, "text");
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1000596D8;
  v37 = sub_1000596E8;
  v38 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

  if (v6)
  {
    v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = (void *)v34[5];
    v34[5] = (uint64_t)v7;

    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_1000596D8;
    v31 = sub_1000596E8;
    v32 = 0;
    if (((uint64_t (*)(void))SiriUIIsTextInputEnabled)())
    {
      v9 = objc_msgSend(v6, "length");
      if ((unint64_t)v9 >= 0x8C)
        v10 = 140;
      else
        v10 = (uint64_t)v9;
    }
    else
    {
      v10 = (uint64_t)objc_msgSend(v6, "length");
    }
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1000596F0;
    v18 = &unk_100123BD8;
    v20 = &v23;
    v21 = &v27;
    v11 = v6;
    v19 = v11;
    v22 = &v33;
    objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 1027, &v15);
    if (v28[5])
      objc_msgSend((id)v34[5], "addObject:", v15, v16, v17, v18);
    v12 = objc_msgSend((id)v34[5], "count", v15, v16, v17, v18);
    if (!v12)
    {
      v12 = objc_msgSend(v11, "length");
      if (v12)
        v12 = objc_msgSend((id)v34[5], "addObject:", v11);
    }
    if (SiriUIIsTextInputEnabled(v12) && (unint64_t)objc_msgSend(v11, "length") >= 0x8D)
    {
      if (*((_BYTE *)v24 + 24) && (unint64_t)objc_msgSend((id)v34[5], "count") >= 2)
        objc_msgSend((id)v34[5], "removeLastObject");
      v13 = (void *)v34[5];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("…")));
      objc_msgSend(v13, "addObject:", v14);

    }
    -[SUICStreamingTextView setWords:](self->_streamingTextView, "setWords:", v34[5]);
    -[SUICStreamingTextView siriui_setBlendEffectEnabled:](self->_streamingTextView, "siriui_setBlendEffectEnabled:", self->_blendEffectEnabled);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);

  }
  _Block_object_dispose(&v33, 8);

}

- (void)setBlendEffectEnabled:(BOOL)a3
{
  id v4;
  SUICStreamingTextView *v5;
  SUICStreamingTextView *clonedStreamingTextView;
  uint64_t v7;
  uint64_t v8;
  SUICStreamingTextView *v9;
  void *v10;
  id v11;
  SUICStreamingTextView *v12;
  SUICStreamingTextView *v13;
  void *v14;
  SUICStreamingTextView *streamingTextView;
  void *v16;
  SUICStreamingTextView *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  if (self->_blendEffectEnabled != a3)
  {
    self->_blendEffectEnabled = a3;
    if (a3)
    {
      v4 = objc_alloc((Class)SUICStreamingTextView);
      -[SUICStreamingTextView frame](self->_streamingTextView, "frame");
      v5 = (SUICStreamingTextView *)objc_msgSend(v4, "initWithFrame:");
      clonedStreamingTextView = self->_clonedStreamingTextView;
      self->_clonedStreamingTextView = v5;

      -[SUICStreamingTextView recursive_setSemanticContentAttribute:](self->_clonedStreamingTextView, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v7, v8));
      v9 = self->_clonedStreamingTextView;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
      -[SUICStreamingTextView setFont:](v9, "setFont:", v10);

      v11 = -[SUICStreamingTextView setAnimationDuration:](self->_clonedStreamingTextView, "setAnimationDuration:", 0.0);
      v12 = self->_clonedStreamingTextView;
      SiriUITextHyphenationFactor(v11);
      -[SUICStreamingTextView setHyphenationFactor:](v12, "setHyphenationFactor:");
      v13 = self->_clonedStreamingTextView;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUICStreamingTextView words](self->_streamingTextView, "words"));
      -[SUICStreamingTextView setWords:](v13, "setWords:", v14);

      -[SRUserUtteranceView addSubview:](self, "addSubview:", self->_clonedStreamingTextView);
      streamingTextView = self->_streamingTextView;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](UIColor, "siriui_blendEffectColor"));
      -[SUICStreamingTextView setEndTextColor:](streamingTextView, "setEndTextColor:", v16);

      -[SUICStreamingTextView siriui_setBlendEffectEnabled:](self->_streamingTextView, "siriui_setBlendEffectEnabled:", 1);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100059B0C;
      v22[3] = &unk_1001225C0;
      v22[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100059B24;
      v21[3] = &unk_100123C00;
      v21[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v22, v21, 0.3);
      if (-[SRUserUtteranceView isEditable](self, "isEditable"))
      {
        -[SRTapToEditView setHidden:](self->_tapToEditView, "setHidden:", 0);
        -[SRTapToEditView setAlpha:](self->_tapToEditView, "setAlpha:", 0.0);
        v19[4] = self;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100059B60;
        v20[3] = &unk_1001225C0;
        v20[4] = self;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100059B78;
        v19[3] = &unk_100123C00;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v20, v19, 0.3);
      }
    }
    else
    {
      v17 = self->_streamingTextView;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightTextColor](UIColor, "lightTextColor"));
      -[SUICStreamingTextView setEndTextColor:](v17, "setEndTextColor:", v18);

      -[SUICStreamingTextView siriui_setBlendEffectEnabled:](self->_streamingTextView, "siriui_setBlendEffectEnabled:", 0);
    }
  }
}

- (BOOL)isBlendEffectEnabled
{
  return self->_blendEffectEnabled;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
  -[SUICStreamingTextView sizeThatFits:](self->_streamingTextView, "sizeThatFits:", SiriUIUtteranceWidthForAvailableWidthAndInsets(v6, width - v7, self->_edgeInsets.top, self->_edgeInsets.leading, self->_edgeInsets.bottom, self->_edgeInsets.trailing), 1.79769313e308);
  v9 = v8;
  if (!-[SRTapToEditView isHidden](self->_tapToEditView, "isHidden") || self->_chevronHasBeenShown)
  {
    -[SRUserUtteranceView _streamingTextMaxYToTapToEditOriginDistance](self, "_streamingTextMaxYToTapToEditOriginDistance");
    v11 = v9 + v10;
    -[SRTapToEditView sizeThatFits:](self->_tapToEditView, "sizeThatFits:", width, height);
    v9 = v11 + v12;
  }
  v13 = width;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  CGFloat v16;
  double v17;
  double v18;
  double leading;
  double v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double MaxY;
  double v30;
  double v31;
  double v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v33.receiver = self;
  v33.super_class = (Class)SRUserUtteranceView;
  -[SRUserUtteranceView layoutSubviews](&v33, "layoutSubviews");
  -[SRUserUtteranceView bounds](self, "bounds");
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v7 = CGRectGetWidth(v34);
  v8 = -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
  v10 = SiriUIUtteranceWidthForAvailableWidthAndInsets(v8, v7 - v9, self->_edgeInsets.top, self->_edgeInsets.leading, self->_edgeInsets.bottom, self->_edgeInsets.trailing);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v11 = CGRectGetHeight(v35);
  v12 = -[SUICStreamingTextView sizeThatFits:](self->_streamingTextView, "sizeThatFits:", v10, v11);
  v14 = v13;
  if (SiriLanguageIsRTL(v12, v15))
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v16 = CGRectGetWidth(v36) - v10 - self->_edgeInsets.leading;
    -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
    v18 = v16 - v17;
  }
  else
  {
    leading = self->_edgeInsets.leading;
    -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
    v18 = leading + v20;
  }
  -[SUICStreamingTextView setFrame:](self->_clonedStreamingTextView, "setFrame:", v18, y, v10, v14);
  -[SUICStreamingTextView setFrame:](self->_streamingTextView, "setFrame:", v18, y, v10, v14);
  if ((-[SRTapToEditView isHidden](self->_tapToEditView, "isHidden") & 1) == 0)
  {
    v21 = -[SRTapToEditView sizeThatFits:](self->_tapToEditView, "sizeThatFits:", v10, v11);
    v31 = v23;
    v32 = v22;
    v25 = v18;
    if (SiriLanguageIsRTL(v21, v24))
    {
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v26 = CGRectGetWidth(v37);
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v38.size.height = v31;
      v38.size.width = v32;
      v27 = v26 - CGRectGetWidth(v38) - self->_edgeInsets.leading;
      -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
      v25 = v27 - v28;
    }
    v39.origin.x = v18;
    v39.origin.y = y;
    v39.size.width = v10;
    v39.size.height = v14;
    MaxY = CGRectGetMaxY(v39);
    -[SRUserUtteranceView _streamingTextMaxYToTapToEditOriginDistance](self, "_streamingTextMaxYToTapToEditOriginDistance");
    -[SRTapToEditView setFrame:](self->_tapToEditView, "setFrame:", v25, MaxY + v30, v32, v31);
  }
}

- (double)_streamingTextMaxYToTapToEditOriginDistance
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "scale");
  v5 = v4;
  -[SRUserUtteranceView _scaledSiriTapToEditViewLeading](self, "_scaledSiriTapToEditViewLeading");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUICStreamingTextView font](self->_streamingTextView, "font"));
  objc_msgSend(v8, "descender");
  v10 = v7 + v9;
  -[SRTapToEditView firstLineBaselineOffsetFromTop](self->_tapToEditView, "firstLineBaselineOffsetFromTop");
  v12 = v10 - v11;
  v13 = floor(v12);
  if (v5 < 2.0)
    v14 = v13;
  else
    v14 = v12;

  return v14;
}

- (double)_indentWidth
{
  double v2;

  v2 = 28.0;
  if ((SiriUIIsCompactWidth(self, a2) & 1) == 0)
  {
    if (SiriUIIsCompactHeight())
      return 28.0;
    else
      return 31.0;
  }
  return v2;
}

- (double)_scaledSiriTapToEditViewLeading
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceCorrectionPromptFont](UIFont, "siriui_serverUtteranceCorrectionPromptFont"));
  objc_msgSend(v2, "_scaledValueForValue:", 26.0);
  v4 = v3;

  return v4;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToEditView, 0);
  objc_storeStrong((id *)&self->_streamingTextView, 0);
  objc_storeStrong((id *)&self->_clonedStreamingTextView, 0);
}

@end

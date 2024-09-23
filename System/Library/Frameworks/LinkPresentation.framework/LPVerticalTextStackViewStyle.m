@implementation LPVerticalTextStackViewStyle

- (LPVerticalTextStackViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  LPVerticalTextStackViewStyle *v8;
  uint64_t v9;
  LPPointUnit *firstLineLeading;
  uint64_t v11;
  LPPointUnit *lastLineDescent;
  void *v13;
  LPTextRowStyle *v14;
  LPTextRowStyle *aboveTopCaption;
  void *v16;
  void *v17;
  LPTextRowStyle *v18;
  LPTextRowStyle *topCaption;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  LPTextRowStyle *v24;
  LPTextRowStyle *bottomCaption;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  LPTextRowStyle *v30;
  LPTextRowStyle *belowBottomCaption;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  LPPointUnit *v36;
  LPPointUnit *v37;
  double v38;
  double v39;
  LPPointUnit *v40;
  LPPadding *v41;
  LPPadding *captionTextPadding;
  void *v43;
  void *v44;
  LPPadding *v45;
  LPPadding *emailCompatibleMargin;
  LPPointUnit *v47;
  void *v48;
  LPVerticalTextStackViewStyle *v49;
  _QWORD v51[4];
  LPPointUnit *v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)LPVerticalTextStackViewStyle;
  v8 = -[LPVerticalTextStackViewStyle init](&v53, sel_init);
  if (v8)
  {
    +[LPPointUnit zero](LPPointUnit, "zero");
    v9 = objc_claimAutoreleasedReturnValue();
    firstLineLeading = v8->_firstLineLeading;
    v8->_firstLineLeading = (LPPointUnit *)v9;

    +[LPPointUnit zero](LPPointUnit, "zero");
    v11 = objc_claimAutoreleasedReturnValue();
    lastLineDescent = v8->_lastLineDescent;
    v8->_lastLineDescent = (LPPointUnit *)v11;

    v8->_shouldAlignToBaselines = 1;
    topCaptionFont(a3, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[LPTextRowStyle initWithPlatform:fontScalingFactor:]([LPTextRowStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    aboveTopCaption = v8->_aboveTopCaption;
    v8->_aboveTopCaption = v14;

    -[LPTextRowStyle leading](v8->_aboveTopCaption, "leading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v13);

    -[LPTextRowStyle trailing](v8->_aboveTopCaption, "trailing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v13);

    v18 = -[LPTextRowStyle initWithPlatform:fontScalingFactor:]([LPTextRowStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    topCaption = v8->_topCaption;
    v8->_topCaption = v18;

    -[LPTextRowStyle leading](v8->_topCaption, "leading");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v13);

    -[LPTextRowStyle trailing](v8->_topCaption, "trailing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v13);

    bottomCaptionFont(a3, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[LPTextRowStyle initWithPlatform:fontScalingFactor:]([LPTextRowStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    bottomCaption = v8->_bottomCaption;
    v8->_bottomCaption = v24;

    -[LPTextRowStyle leading](v8->_bottomCaption, "leading");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v22);

    -[LPTextRowStyle trailing](v8->_bottomCaption, "trailing");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v22);

    -[LPTextRowStyle leading](v8->_bottomCaption, "leading");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setColor:", v23);

    -[LPTextRowStyle trailing](v8->_bottomCaption, "trailing");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setColor:", v23);

    v30 = -[LPTextRowStyle initWithPlatform:fontScalingFactor:]([LPTextRowStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    belowBottomCaption = v8->_belowBottomCaption;
    v8->_belowBottomCaption = v30;

    -[LPTextRowStyle leading](v8->_belowBottomCaption, "leading");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFont:", v22);

    -[LPTextRowStyle trailing](v8->_belowBottomCaption, "trailing");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFont:", v22);

    -[LPTextRowStyle leading](v8->_belowBottomCaption, "leading");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setColor:", v23);

    -[LPTextRowStyle trailing](v8->_belowBottomCaption, "trailing");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setColor:", v23);

    switch(a3)
    {
      case 0:
      case 6:
        v37 = [LPPointUnit alloc];
        v39 = 18.0;
        goto LABEL_9;
      case 1:
      case 3:
      case 4:
        v37 = [LPPointUnit alloc];
        v38 = 14.0;
        goto LABEL_10;
      case 2:
        v37 = [LPPointUnit alloc];
        v39 = 12.5;
        goto LABEL_9;
      case 5:
        v37 = [LPPointUnit alloc];
        if (a4 == 5)
          v39 = 17.0;
        else
          v39 = 19.0;
LABEL_9:
        v38 = a5 * v39;
LABEL_10:
        v36 = -[LPPointUnit initWithValue:](v37, "initWithValue:", v38);
        break;
      default:
        break;
    }
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __77__LPVerticalTextStackViewStyle_initWithPlatform_sizeClass_fontScalingFactor___block_invoke;
    v51[3] = &unk_1E44A96D0;
    v40 = v36;
    v52 = v40;
    -[LPVerticalTextStackViewStyle applyToAllTextViewStyles:](v8, "applyToAllTextViewStyles:", v51);
    v41 = objc_alloc_init(LPPadding);
    captionTextPadding = v8->_captionTextPadding;
    v8->_captionTextPadding = v41;

    outerHorizontalTextMargin((id)a3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPadding setLeading:](v8->_captionTextPadding, "setLeading:", v43);

    outerHorizontalTextMargin((id)a3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPadding setTrailing:](v8->_captionTextPadding, "setTrailing:", v44);

    v45 = objc_alloc_init(LPPadding);
    emailCompatibleMargin = v8->_emailCompatibleMargin;
    v8->_emailCompatibleMargin = v45;

    if (!initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin)
    {
      v47 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
      v48 = (void *)initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin;
      initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin = (uint64_t)v47;

    }
    -[LPPadding setTop:](v8->_emailCompatibleMargin, "setTop:");
    -[LPPadding setBottom:](v8->_emailCompatibleMargin, "setBottom:", initWithPlatform_sizeClass_fontScalingFactor__emailCompatibleVerticalMargin);
    v49 = v8;

  }
  return v8;
}

uint64_t __77__LPVerticalTextStackViewStyle_initWithPlatform_sizeClass_fontScalingFactor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFirstLineLeading:", *(_QWORD *)(a1 + 32));
}

- (void)applyToAllTextViewStyles:(id)a3
{
  id v4;

  v4 = a3;
  -[LPTextRowStyle applyToAllTextViewStyles:](self->_aboveTopCaption, "applyToAllTextViewStyles:");
  -[LPTextRowStyle applyToAllTextViewStyles:](self->_topCaption, "applyToAllTextViewStyles:", v4);
  -[LPTextRowStyle applyToAllTextViewStyles:](self->_bottomCaption, "applyToAllTextViewStyles:", v4);
  -[LPTextRowStyle applyToAllTextViewStyles:](self->_belowBottomCaption, "applyToAllTextViewStyles:", v4);

}

- (void)applyToLowerTextRowStyles:(id)a3
{
  void (**v4)(id, LPTextRowStyle *);

  v4 = (void (**)(id, LPTextRowStyle *))a3;
  v4[2](v4, self->_bottomCaption);
  v4[2](v4, self->_belowBottomCaption);

}

- (LPPointUnit)firstLineLeading
{
  return self->_firstLineLeading;
}

- (void)setFirstLineLeading:(id)a3
{
  objc_storeStrong((id *)&self->_firstLineLeading, a3);
}

- (LPPointUnit)lastLineDescent
{
  return self->_lastLineDescent;
}

- (void)setLastLineDescent:(id)a3
{
  objc_storeStrong((id *)&self->_lastLineDescent, a3);
}

- (LPTextRowStyle)aboveTopCaption
{
  return self->_aboveTopCaption;
}

- (LPTextRowStyle)topCaption
{
  return self->_topCaption;
}

- (LPTextRowStyle)bottomCaption
{
  return self->_bottomCaption;
}

- (LPTextRowStyle)belowBottomCaption
{
  return self->_belowBottomCaption;
}

- (unsigned)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(unsigned int)a3
{
  self->_maximumNumberOfLines = a3;
}

- (BOOL)shouldAlignToBaselines
{
  return self->_shouldAlignToBaselines;
}

- (void)setShouldAlignToBaselines:(BOOL)a3
{
  self->_shouldAlignToBaselines = a3;
}

- (LPPadding)captionTextPadding
{
  return self->_captionTextPadding;
}

- (LPPadding)emailCompatibleMargin
{
  return self->_emailCompatibleMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailCompatibleMargin, 0);
  objc_storeStrong((id *)&self->_captionTextPadding, 0);
  objc_storeStrong((id *)&self->_belowBottomCaption, 0);
  objc_storeStrong((id *)&self->_bottomCaption, 0);
  objc_storeStrong((id *)&self->_topCaption, 0);
  objc_storeStrong((id *)&self->_aboveTopCaption, 0);
  objc_storeStrong((id *)&self->_lastLineDescent, 0);
  objc_storeStrong((id *)&self->_firstLineLeading, 0);
}

@end

@implementation CKAggregateAcknowledgmentBalloonView

+ (id)_topBubbleSquareImageWithTraitCollection:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  if (!_topBubbleSquareImageWithTraitCollection__image
    || (objc_msgSend((id)_topBubbleSquareImageWithTraitCollection__image, "scale"),
        v5 = v4,
        objc_msgSend(v3, "displayScale"),
        v5 != v6))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aggregateAcknowledgmentTopName:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    squareImageWithName((uint64_t)v8, v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_topBubbleSquareImageWithTraitCollection__image;
    _topBubbleSquareImageWithTraitCollection__image = v9;

  }
  v11 = (id)_topBubbleSquareImageWithTraitCollection__image;

  return v11;
}

+ (id)_topBubbleInvertedTailSquareImageWithTraitCollection:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  if (!_topBubbleInvertedTailSquareImageWithTraitCollection__image
    || (objc_msgSend((id)_topBubbleInvertedTailSquareImageWithTraitCollection__image, "scale"),
        v5 = v4,
        objc_msgSend(v3, "displayScale"),
        v5 != v6))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aggregateAcknowledgmentTopName:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    squareImageWithName((uint64_t)v8, v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_topBubbleInvertedTailSquareImageWithTraitCollection__image;
    _topBubbleInvertedTailSquareImageWithTraitCollection__image = v9;

  }
  v11 = (id)_topBubbleInvertedTailSquareImageWithTraitCollection__image;

  return v11;
}

+ (id)_middleBubbleSquareImageWithTraitCollection:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  if (!_middleBubbleSquareImageWithTraitCollection__image
    || (objc_msgSend((id)_middleBubbleSquareImageWithTraitCollection__image, "scale"),
        v5 = v4,
        objc_msgSend(v3, "displayScale"),
        v5 != v6))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aggregateAcknowledgmentMiddleName:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    squareImageWithName((uint64_t)v8, v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_middleBubbleSquareImageWithTraitCollection__image;
    _middleBubbleSquareImageWithTraitCollection__image = v9;

  }
  v11 = (id)_middleBubbleSquareImageWithTraitCollection__image;

  return v11;
}

+ (id)_middleBubbleInvertedTailSquareImageWithTraitCollection:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  if (!_middleBubbleInvertedTailSquareImageWithTraitCollection__image
    || (objc_msgSend((id)_middleBubbleInvertedTailSquareImageWithTraitCollection__image, "scale"),
        v5 = v4,
        objc_msgSend(v3, "displayScale"),
        v5 != v6))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aggregateAcknowledgmentMiddleName:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    squareImageWithName((uint64_t)v8, v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_middleBubbleInvertedTailSquareImageWithTraitCollection__image;
    _middleBubbleInvertedTailSquareImageWithTraitCollection__image = v9;

  }
  v11 = (id)_middleBubbleInvertedTailSquareImageWithTraitCollection__image;

  return v11;
}

- (CKAggregateAcknowledgmentBalloonView)initWithFrame:(CGRect)a3
{
  CKAggregateAcknowledgmentBalloonView *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  CKGradientView *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKAggregateAcknowledgmentBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEmojiTapbacksEnabled");

    if (v5)
    {
      -[CKAggregateAcknowledgmentBalloonView initializeTapbackPlatters](v3, "initializeTapbackPlatters");
    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CEA658]);
      -[CKAggregateAcknowledgmentBalloonView setBackgroundView:](v3, "setBackgroundView:", v6);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "theme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transcriptBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAggregateAcknowledgmentBalloonView backgroundView](v3, "backgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v9);

      -[CKAggregateAcknowledgmentBalloonView backgroundView](v3, "backgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAggregateAcknowledgmentBalloonView addSubview:](v3, "addSubview:", v11);

      v12 = objc_alloc_init(MEMORY[0x1E0CEA658]);
      -[CKAggregateAcknowledgmentBalloonView setSolidPartsView:](v3, "setSolidPartsView:", v12);

      -[CKAggregateAcknowledgmentBalloonView solidPartsView](v3, "solidPartsView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAggregateAcknowledgmentBalloonView addSubview:](v3, "addSubview:", v13);

      v14 = objc_alloc_init(CKGradientView);
      -[CKAggregateAcknowledgmentBalloonView setGradientView:](v3, "setGradientView:", v14);

      -[CKAggregateAcknowledgmentBalloonView gradientView](v3, "gradientView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAggregateAcknowledgmentBalloonView addSubview:](v3, "addSubview:", v15);

    }
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[6];
  double v58;
  __int128 v59;
  double v60;
  __int128 v61;
  double v62;
  __int128 v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)CKAggregateAcknowledgmentBalloonView;
  -[CKBalloonView layoutSubviews](&v68, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if (v4)
  {
    -[CKAggregateAcknowledgmentBalloonView layoutPile](self, "layoutPile");
  }
  else
  {
    -[CKAggregateAcknowledgmentBalloonView backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

    -[CKAggregateAcknowledgmentBalloonView backgroundView](self, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v8, v10);

    -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, v8, v10);

    if (v10 >= v8)
      v8 = v10;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageAcknowledgmentTranscriptBalloonSize");
    v15 = v14;
    v17 = v16;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "messageAcknowledgmentTranscriptGlyphInset");
    v21 = v15 - (v19 + v20);
    v24 = v17 - (v22 + v23);

    -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    objc_msgSend(v25, "alignmentRectForFrame:");
    v28 = v27;
    v30 = v29;
    v32 = v31;

    LODWORD(v25) = -[CKBalloonView orientation](self, "orientation");
    -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "alignmentRectInsets");
    v35 = v34;
    v37 = v36;

    if ((_DWORD)v25)
      v35 = v37;
    -[CKAggregateAcknowledgmentBalloonView traitCollection](self, "traitCollection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "displayScale");
    v40 = v21 * v39;
    v41 = v24 * v39;
    v42 = v35 * v39 + floor((v30 * v39 - v21 * v39) * 0.5);
    v43 = v28 * v39 + floor((v32 * v39 - v24 * v39) * 0.5);
    v44 = 1.0;
    v45 = 1.0 / v39;
    v46 = v45 * v42;
    v47 = v45 * v43;
    v48 = v40 * v45;
    v49 = v41 * v45;

    -[CKAcknowledgmentBalloonView glyphView](self, "glyphView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v46, v47, v48, v49);

    if (-[CKBalloonView orientation](self, "orientation"))
    {
      v67 = 0uLL;
      v51 = -1.0;
      v66 = 0uLL;
    }
    else
    {
      v51 = *MEMORY[0x1E0C9BAA8];
      v67 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
      v44 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
      v66 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    -[CKAggregateAcknowledgmentBalloonView backgroundView](self, "backgroundView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v51;
    v63 = v67;
    v64 = v44;
    v65 = v66;
    objc_msgSend(v52, "setTransform:", &v62);

    -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v51;
    v59 = v67;
    v60 = v44;
    v61 = v66;
    objc_msgSend(v53, "setTransform:", &v58);

    -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v57 = v51;
    v57[1] = 0;
    v57[2] = 0;
    v57[4] = 0;
    v57[5] = 0;
    v57[3] = 0x3FF0000000000000;
    objc_msgSend(v54, "setTransform:", v57);

    -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setBounds:", 0.0, 0.0, v8, v8);

    -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setCenter:", v8 * 0.5, v8 * 0.5);

  }
}

- (void)prepareForDisplay
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)CKAggregateAcknowledgmentBalloonView;
  -[CKBalloonView prepareForDisplay](&v43, sel_prepareForDisplay);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if (v4)
  {
    -[CKAggregateAcknowledgmentBalloonView preparePileForDisplay](self, "preparePileForDisplay");
    return;
  }
  -[CKAcknowledgmentBalloonView glyphView](self, "glyphView");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CKAggregateAcknowledgmentBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v5);
  if ((unint64_t)-[CKAcknowledgmentBalloonView stackCount](self, "stackCount") < 3)
  {
    v10 = -[CKAcknowledgmentBalloonView stackCount](self, "stackCount");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CKAggregateAcknowledgmentBalloonView invertTailDirection](self, "invertTailDirection");
    if (v10 == 2)
    {
      objc_msgSend(v11, "aggregateAcknowledgmentStackBackgroundName2:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "aggregateAcknowledgmentStackName2:", -[CKAggregateAcknowledgmentBalloonView invertTailDirection](self, "invertTailDirection"));
    }
    else
    {
      objc_msgSend(v11, "aggregateAcknowledgmentTopBackgroundName:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "aggregateAcknowledgmentTopName:", -[CKAggregateAcknowledgmentBalloonView invertTailDirection](self, "invertTailDirection"));
    }
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aggregateAcknowledgmentStackBackgroundName3:", -[CKAggregateAcknowledgmentBalloonView invertTailDirection](self, "invertTailDirection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aggregateAcknowledgmentStackName3:", -[CKAggregateAcknowledgmentBalloonView invertTailDirection](self, "invertTailDirection"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v9;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckTemplateImageNamed:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAggregateAcknowledgmentBalloonView backgroundView](self, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v13);

  v15 = -[CKAcknowledgmentBalloonView coloredPart](self, "coloredPart");
  if (v15 == 2)
  {
    -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAggregateAcknowledgmentBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v20, v5);

    }
    v21 = -[CKAggregateAcknowledgmentBalloonView invertTailDirection](self, "invertTailDirection");
    v22 = (void *)objc_opt_class();
    -[CKAggregateAcknowledgmentBalloonView traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v5;
    if (v21)
      objc_msgSend(v22, "_topBubbleInvertedTailSquareImageWithTraitCollection:", v17);
    else
      objc_msgSend(v22, "_topBubbleSquareImageWithTraitCollection:", v17);
    goto LABEL_17;
  }
  if (v15 == 1)
  {
    -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAggregateAcknowledgmentBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v26, v5);

    }
    v27 = -[CKAggregateAcknowledgmentBalloonView invertTailDirection](self, "invertTailDirection");
    v28 = (void *)objc_opt_class();
    -[CKAggregateAcknowledgmentBalloonView traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v5;
    if (v27)
      objc_msgSend(v28, "_middleBubbleInvertedTailSquareImageWithTraitCollection:", v17);
    else
      objc_msgSend(v28, "_middleBubbleSquareImageWithTraitCollection:", v17);
LABEL_17:
    v23 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v23;
    -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMaskImage:", v29);

    goto LABEL_24;
  }
  v16 = (void *)v5;
  if (!v15)
  {
    -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeFromSuperview");
LABEL_24:

    objc_msgSend(MEMORY[0x1E0CEA638], "ckTemplateImageNamed:", v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage:", v31);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "theme");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "balloonColorsForColorType:", -[CKAggregateAcknowledgmentBalloonView solidColor](self, "solidColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lastObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTintColor:", v36);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "theme");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "balloonColorsForColorType:", -[CKAggregateAcknowledgmentBalloonView gradientColor](self, "gradientColor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAggregateAcknowledgmentBalloonView gradientView](self, "gradientView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setColors:", v40);

}

- (void)prepareForReuse
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAggregateAcknowledgmentBalloonView;
  -[CKAcknowledgmentBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  -[CKAggregateAcknowledgmentBalloonView setGradientReferenceView:](self, "setGradientReferenceView:", 0);
  -[CKAggregateAcknowledgmentBalloonView setInvertTailDirection:](self, "setInvertTailDirection:", 0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if (v4)
    -[CKAggregateAcknowledgmentBalloonView preparePileForReuse](self, "preparePileForReuse");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAggregateAcknowledgmentBalloonView;
  -[CKBalloonView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[CKAggregateAcknowledgmentBalloonView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemFillColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAggregateAcknowledgmentBalloonView solidPartsView](self, "solidPartsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

}

- (void)configureForAggregateAcknowledgmentChatItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKAggregateAcknowledgmentBalloonView;
  -[CKAcknowledgmentBalloonView configureForAggregateAcknowledgmentChatItem:](&v10, sel_configureForAggregateAcknowledgmentChatItem_, v4);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmojiTapbacksEnabled");

  if (v6)
    -[CKAggregateAcknowledgmentBalloonView configurePileForChatItem:](self, "configurePileForChatItem:", v4);
  v7 = (void *)MEMORY[0x1E0D35910];
  objc_msgSend(v4, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAggregateAcknowledgmentBalloonView setGradientColor:](self, "setGradientColor:", objc_msgSend(v9, "__ck_displayColor"));

  -[CKAggregateAcknowledgmentBalloonView setSolidColor:](self, "setSolidColor:", 0xFFFFFFFFLL);
  -[CKAggregateAcknowledgmentBalloonView setHidesFirstTapbackTail:](self, "setHidesFirstTapbackTail:", objc_msgSend(v4, "parentIsOrganicLayout"));

}

- (CKGradientView)gradientView
{
  return (CKGradientView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                   + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientView));
}

- (void)setGradientView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientView) = (Class)a3;
  v3 = a3;

}

- (UIImageView)backgroundView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_backgroundView));
}

- (void)setBackgroundView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_backgroundView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_backgroundView) = (Class)a3;
  v3 = a3;

}

- (UIImageView)solidPartsView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_solidPartsView));
}

- (void)setSolidPartsView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_solidPartsView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_solidPartsView) = (Class)a3;
  v3 = a3;

}

- (BOOL)hidesFirstTapbackTail
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_hidesFirstTapbackTail);
}

- (void)setHidesFirstTapbackTail:(BOOL)a3
{
  CKAggregateAcknowledgmentBalloonView *v3;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_hidesFirstTapbackTail) = a3;
  v3 = self;
  sub_18E599A60();

}

- (BOOL)wantsBorderDestOut
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_wantsBorderDestOut);
}

- (void)setWantsBorderDestOut:(BOOL)a3
{
  CKAggregateAcknowledgmentBalloonView *v3;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_wantsBorderDestOut) = a3;
  v3 = self;
  sub_18E599C38();

}

- (CKGradientReferenceView)gradientReferenceView
{
  return (CKGradientReferenceView *)(id)MEMORY[0x193FF501C]((char *)self+ OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientReferenceView, a2);
}

- (void)setGradientReferenceView:(id)a3
{
  CKAggregateAcknowledgmentBalloonView *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_18E59C820();

}

- (BOOL)invertTailDirection
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_invertTailDirection);
}

- (void)setInvertTailDirection:(BOOL)a3
{
  int v3;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.super.isa
       + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_invertTailDirection);
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_invertTailDirection) = a3;
  if (v3 != a3)
    -[CKBalloonView setNeedsPrepareForDisplay](self, sel_setNeedsPrepareForDisplay);
}

- (char)gradientColor
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientColor);
}

- (void)setGradientColor:(char)a3
{
  sub_18E599FC8(self, (uint64_t)a2, a3, &OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientColor);
}

- (char)solidColor
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_solidColor);
}

- (void)setSolidColor:(char)a3
{
  sub_18E599FC8(self, (uint64_t)a2, a3, &OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_solidColor);
}

- (void)initializeTapbackPlatters
{
  CKAggregateAcknowledgmentBalloonView *v2;

  v2 = self;
  sub_18E599FEC();

}

- (void)configurePileForChatItem:(id)a3
{
  id v4;
  CKAggregateAcknowledgmentBalloonView *v5;

  v4 = a3;
  v5 = self;
  sub_18E59A38C(v4);

}

- (void)preparePileForDisplay
{
  CKAggregateAcknowledgmentBalloonView *v2;

  v2 = self;
  sub_18E59A650();

}

- (void)layoutPile
{
  CKAggregateAcknowledgmentBalloonView *v2;

  v2 = self;
  sub_18E59AEE0();

}

- (void)preparePileForReuse
{
  CKAggregateAcknowledgmentBalloonView *v2;

  v2 = self;
  sub_18E59A930();

}

- (void)playInsertionAnimationOnTopPlatter
{
  CKAggregateAcknowledgmentBalloonView *v2;

  v2 = self;
  sub_18E59AD2C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_solidPartsView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_bottomPeekPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_viewModel));
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientReferenceView);
}

- (void)configureGestureRecognizers
{
  CKAggregateAcknowledgmentBalloonView *v2;

  v2 = self;
  CKAggregateAcknowledgmentBalloonView.configureGestureRecognizers()();

}

- (void)tapGestureRecognized:(id)a3
{
  UITapGestureRecognizer *v4;
  CKAggregateAcknowledgmentBalloonView *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  CKAggregateAcknowledgmentBalloonView.tapGestureRecognized(_:)(v4);

}

- (void)longPressGestureRecognized:(id)a3
{
  id v4;
  CKAggregateAcknowledgmentBalloonView *v5;

  v4 = a3;
  v5 = self;
  sub_18E59BD3C(v4);

}

@end

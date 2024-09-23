@implementation CKTranscriptBalloonCollectionViewCell

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKBalloonViewReuse(v4);

  -[CKTranscriptBalloonCollectionViewCell setBalloonView:](self, "setBalloonView:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  -[CKTranscriptBalloonCollectionViewCell dealloc](&v5, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  -[CKTranscriptCollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[CKTranscriptBalloonCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  -[CKTranscriptCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKBalloonViewReuse(v4);

  -[CKTranscriptBalloonCollectionViewCell setBalloonView:](self, "setBalloonView:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBalloonCollectionViewCell;
  -[CKTranscriptCollectionViewCell description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ balloonView:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setBalloonView:(id)a3
{
  CKBalloonView *v5;
  CKBalloonView **p_balloonView;
  CKBalloonView *balloonView;
  void *v8;
  void *v9;
  CKBalloonView *v10;

  v5 = (CKBalloonView *)a3;
  p_balloonView = &self->_balloonView;
  balloonView = self->_balloonView;
  if (balloonView != v5)
  {
    v10 = v5;
    -[CKBalloonView removeFromSuperview](balloonView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_balloonView, a3);
    -[CKTranscriptBalloonCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_balloonView);

    -[CKTranscriptBalloonCollectionViewCell layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", -[CKBalloonView needsGroupOpacity](*p_balloonView, "needsGroupOpacity"));

    -[CKTranscriptBalloonCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

+ (id)reuseIdentifier
{
  return CFSTR("BC");
}

- (void)configureForChatItem:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  _OWORD v16[5];

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[CKTranscriptBalloonCollectionViewCell _balloonViewForChatItem:](self, "_balloonViewForChatItem:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "configureForLocatingChatItem:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "configureForLocationShareOfferChatItem:", v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "configureForTUConversationChatItem:", v6);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v7, "configureForMessagePart:", v6);
            else
              objc_msgSend(v7, "configureForChatItem:", v6);
          }
        }
      }
    }
    objc_msgSend(v6, "size");
    v9 = v8;
    v11 = v10;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v6, "balloonDescriptor");
    else
      memset(v16, 0, sizeof(v16));
    objc_msgSend(v12, "balloonMaskSizeWithBalloonDescriptor:", v16);
    objc_msgSend(v7, "setWantsSkinnyMask:", v9 < v13);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textBalloonMinHeight");
    objc_msgSend(v7, "setWantsMultilineMask:", v11 > v15);

    -[CKTranscriptBalloonCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    _IMWarn();
  }

}

- (id)_balloonViewForChatItem:(id)a3
{
  objc_class *v4;
  void *v5;
  uint64_t v6;

  v4 = (objc_class *)objc_msgSend(a3, "balloonViewClass");
  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_class *)objc_opt_class() != v4)
  {
    CKBalloonViewForClass(v4);
    v6 = objc_claimAutoreleasedReturnValue();

    -[CKTranscriptBalloonCollectionViewCell setBalloonView:](self, "setBalloonView:", v6);
    v5 = (void *)v6;
  }
  return v5;
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForDisplayIfNeeded");

  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFilter:", v4);

}

- (void)clearFilters
{
  id v2;

  -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearFilters");

}

- (void)setAnimationPauseReasons:(int64_t)a3
{
  void *v5;
  id v6;

  if (self->_animationPauseReasons != a3)
  {
    self->_animationPauseReasons = a3;
    -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInvisibleInkEffectPaused:", a3 != 0);

    -[CKTranscriptBalloonCollectionViewCell balloonView](self, "balloonView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationPaused:", ((unint64_t)a3 >> 1) & 1);

  }
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (int64_t)animationPauseReasons
{
  return self->_animationPauseReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonView, 0);
}

@end

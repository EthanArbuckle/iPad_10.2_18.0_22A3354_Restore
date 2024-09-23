@implementation CKTranscriptTapbackSupplementaryView

- (CKTranscriptTapbackSupplementaryView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  return -[CKTranscriptTapbackSupplementaryView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  -[CKTranscriptTapbackSupplementaryView layoutSubviews](&v12, sel_layoutSubviews);
  -[CKTranscriptTapbackSupplementaryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptTapbackSupplementaryView balloonView](self, "balloonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  -[CKTranscriptTapbackSupplementaryView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKTranscriptTapbackSupplementaryView setBalloonView:](self, "setBalloonView:", 0);
}

- (void)setBalloonView:(id)a3
{
  CKAcknowledgmentBalloonView *v5;
  void **p_balloonView;
  CKAcknowledgmentBalloonView *balloonView;
  CKAcknowledgmentBalloonView *v8;

  v5 = (CKAcknowledgmentBalloonView *)a3;
  p_balloonView = (void **)&self->_balloonView;
  balloonView = self->_balloonView;
  if (balloonView != v5)
  {
    v8 = v5;
    -[CKAcknowledgmentBalloonView removeFromSuperview](balloonView, "removeFromSuperview");
    CKBalloonViewReuse(*p_balloonView);
    objc_storeStrong((id *)&self->_balloonView, a3);
    -[CKTranscriptTapbackSupplementaryView addSubview:](self, "addSubview:", *p_balloonView);
    v5 = v8;
  }

}

+ (id)supplementaryViewKindPrefix
{
  return CFSTR("t:");
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v9 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CKTranscriptTapbackSupplementaryView;
  -[CKTranscriptCollectionSupplementaryView configureForChatItem:context:animated:animationDuration:animationCurve:](&v27, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, v13, v9, a7, a6);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v12, "visibleAssociatedMessageChatItems", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v15)
  {
    v17 = v14;
    goto LABEL_13;
  }
  v16 = v15;
  v17 = 0;
  v18 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;

        v17 = v21;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  }
  while (v16);

  if (v17)
  {
    CKBalloonViewForClass((objc_class *)objc_msgSend(v17, "balloonViewClass"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptTapbackSupplementaryView setBalloonView:](self, "setBalloonView:", v22);
    objc_msgSend(v22, "configureForAggregateAcknowledgmentChatItem:", v17);

LABEL_13:
  }

}

- (CKAcknowledgmentBalloonView)balloonView
{
  return self->_balloonView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonView, 0);
}

@end

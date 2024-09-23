@implementation CKAcknowledgmentBalloonView

- (void)configureForAggregateAcknowledgmentChatItem:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmojiTapbacksEnabled");

  if (!v5
    || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "usesFannedBubbleStyle"),
        v6,
        (v7 & 1) == 0))
  {
    -[CKAcknowledgmentBalloonView legacyAcknowledgementConfigurationForChatItem:](self, "legacyAcknowledgementConfigurationForChatItem:", v8);
  }
  -[CKBalloonView setOrientation:](self, "setOrientation:", objc_msgSend(v8, "balloonOrientation"));

}

- (void)legacyAcknowledgementConfigurationForChatItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmojiTapbacksEnabled");

  if (v6)
  {
    objc_msgSend(v4, "latestTapback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[CKTapbackViewUtils viewFor:isSelected:](CKTapbackViewUtils, "viewFor:isSelected:", v7, objc_msgSend(v4, "latestIsFromMe"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAcknowledgmentBalloonView setGlyphView:](self, "setGlyphView:", v8);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "guid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412290;
          v23 = v19;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Missing tapback. Unable to render transcript view. GUID: %@", (uint8_t *)&v22, 0xCu);

        }
      }
      -[CKAcknowledgmentBalloonView setGlyphView:](self, "setGlyphView:", 0);
    }

  }
  else
  {
    v9 = objc_msgSend(v4, "latestAcknowledgmentType");
    -[CKAcknowledgmentBalloonView glyphView](self, "glyphView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || objc_msgSend(v10, "acknowledgmentType") != v9)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "theme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "acknowledgmentImageColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "ckAcknowledgementColorTypeForColor:", v14);

      +[CKAcknowledgmentGlyphView glyphViewForAcknowledgmentType:glyphColor:](CKAcknowledgmentGlyphView, "glyphViewForAcknowledgmentType:glyphColor:", v9, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAcknowledgmentBalloonView setGlyphView:](self, "setGlyphView:", v16);

    }
    objc_msgSend(v4, "acknowledgmentImageColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGlyphColor:", v17);

  }
  objc_msgSend(v4, "acknowledgments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAcknowledgmentBalloonView setStackCount:](self, "setStackCount:", objc_msgSend(v20, "count"));

  if (objc_msgSend(v4, "includesFromMe"))
  {
    if (objc_msgSend(v4, "latestIsFromMe"))
      v21 = 2;
    else
      v21 = 1;
  }
  else
  {
    v21 = 0;
  }
  -[CKAcknowledgmentBalloonView setColoredPart:](self, "setColoredPart:", v21);

}

- (int64_t)stackCount
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___CKAcknowledgmentBalloonView_stackCount);
}

- (void)setStackCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_stackCount) = (Class)a3;
}

- (int64_t)coloredPart
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___CKAcknowledgmentBalloonView_coloredPart);
}

- (void)setColoredPart:(int64_t)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR___CKAcknowledgmentBalloonView_coloredPart);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_coloredPart) = (Class)a3;
  if (v3 != a3)
    -[CKBalloonView setNeedsPrepareForDisplay](self, sel_setNeedsPrepareForDisplay);
}

- (CKTapbackViewProtocol)glyphView
{
  return (CKTapbackViewProtocol *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView));
}

- (void)setGlyphView:(id)a3
{
  void *v4;
  CKAcknowledgmentBalloonView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_18E5951CC(v4);

}

- (void)prepareForReuse
{
  CKAcknowledgmentBalloonView *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAcknowledgmentBalloonView;
  v2 = self;
  -[CKBalloonView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKAcknowledgmentBalloonView setGlyphView:](v2, sel_setGlyphView_, 0, v3.receiver, v3.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CKAcknowledgmentBalloonView_glyphView));
}

@end

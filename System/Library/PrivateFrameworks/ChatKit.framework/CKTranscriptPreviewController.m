@implementation CKTranscriptPreviewController

- (CKTranscriptPreviewController)initWithConversation:(id)a3 transcriptWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  CKTranscriptPreviewController *v12;
  CKTranscriptPreviewController *v13;
  objc_super v15;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptPreviewController;
  v12 = -[CKTranscriptPreviewController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[CKTranscriptPreviewController setConversation:](v12, "setConversation:", v11);
    -[CKTranscriptPreviewController setTranscriptWidth:](v13, "setTranscriptWidth:", a4);
    -[CKTranscriptPreviewController setLayoutMargins:](v13, "setLayoutMargins:", top, left, bottom, right);
    -[CKTranscriptPreviewController setIsInitialLayout:](v13, "setIsInitialLayout:", 1);
  }

  return v13;
}

- (void)loadView
{
  CKGradientReferenceView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CKGradientReferenceView *v8;

  v3 = [CKGradientReferenceView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v8 = -[CKGradientReferenceView initWithFrame:](v3, "initWithFrame:");

  -[CKGradientReferenceView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriptBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientReferenceView setBackgroundColor:](v8, "setBackgroundColor:", v7);

  -[CKTranscriptPreviewController setView:](self, "setView:", v8);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double Width;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CKTranscriptCollectionViewController *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CKTranscriptCollectionViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)CKTranscriptPreviewController;
  -[CKTranscriptPreviewController viewDidLayoutSubviews](&v26, sel_viewDidLayoutSubviews);
  if (-[CKTranscriptPreviewController isInitialLayout](self, "isInitialLayout"))
  {
    -[CKTranscriptPreviewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Width = CGRectGetWidth(v27);

    -[CKTranscriptPreviewController transcriptWidth](self, "transcriptWidth");
    if (Width >= v5)
      Width = v5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPreviewController layoutMargins](self, "layoutMargins");
    objc_msgSend(v6, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 1, 0, 0, 0, Width, v7, v8, v9, v10);
    v12 = v11;

    v13 = [CKTranscriptCollectionViewController alloc];
    -[CKTranscriptPreviewController conversation](self, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPreviewController layoutMargins](self, "layoutMargins");
    v19 = -[CKTranscriptCollectionViewController initWithConversation:delegate:balloonMaxWidth:marginInsets:](v13, "initWithConversation:delegate:balloonMaxWidth:marginInsets:", v14, self, v12, v15, v16, v17, v18);

    -[CKTranscriptPreviewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewController setGradientReferenceView:](v19, "setGradientReferenceView:", v20);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewController setShouldLoadDefaultConversationViewingMessageCountOnAppear:](v19, "setShouldLoadDefaultConversationViewingMessageCountOnAppear:", objc_msgSend(v21, "shouldLoadInitialViewingMessageCount"));

    -[CKTranscriptCollectionViewController collectionView](v19, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUserInteractionEnabled:", 0);
    objc_msgSend(v22, "setAutoresizingMask:", 18);
    -[CKTranscriptPreviewController setCollectionView:](self, "setCollectionView:", v22);
    -[CKTranscriptPreviewController addChildViewController:](self, "addChildViewController:", v19);
    -[CKTranscriptPreviewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v22);

    -[CKTranscriptPreviewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    objc_msgSend(v22, "setFrame:");

    -[CKTranscriptPreviewController setIsInitialLayout:](self, "setIsInitialLayout:", 0);
    -[CKTranscriptCollectionViewController scrollTranscriptToEntryViewInsertionTimeWithAnimation:](v19, "scrollTranscriptToEntryViewInsertionTimeWithAnimation:", 0);

  }
  -[CKTranscriptPreviewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "__ck_scrollToBottom:", 0);

}

- (id)textInputContextIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CKTranscriptPreviewController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIndependentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKTextInputIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3
{
  return 0;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 shouldSelectChatItem:(id)a5
{
  return 0;
}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "gradientReferenceView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "setGradientFrame:");
  objc_msgSend(v4, "scrollTranscriptToEntryViewInsertionTimeWithAnimation:", 0);

}

- (BOOL)transcriptCollectionViewControllerShouldShouldScrollToTopForStatusBarTap:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldScrollToBottomForLocalSentMessage:(id)a3
{
  return 1;
}

- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4
{
  id v4;
  char isKindOfClass;
  double result;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  result = 1.0;
  if ((isKindOfClass & 1) != 0)
    return 0.5;
  return result;
}

- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldSetupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldLayoutFullscreenEffects:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldCleanupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (id)transcriptCollectionViewControllerAdditionalFullscreenEffectViews:(id)a3
{
  return 0;
}

- (id)transcriptCollectionViewControllerOuterEffectPresentingView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitPayload:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitSticker:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (int64_t)transcriptCollectionViewControllerWantsCurrentDesiredIntent:(id)a3
{
  return 6;
}

- (id)currentlyFocusedChatItemForTapbackInTranscriptCollectionViewController:(id)a3
{
  return 0;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (CKTranscriptCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (double)transcriptWidth
{
  return self->_transcriptWidth;
}

- (void)setTranscriptWidth:(double)a3
{
  self->_transcriptWidth = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (BOOL)isInitialLayout
{
  return self->_isInitialLayout;
}

- (void)setIsInitialLayout:(BOOL)a3
{
  self->_isInitialLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end

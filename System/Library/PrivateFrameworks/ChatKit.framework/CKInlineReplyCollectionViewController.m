@implementation CKInlineReplyCollectionViewController

- (CKInlineReplyCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8
{
  CKInlineReplyCollectionViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKInlineReplyCollectionViewController;
  v8 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:](&v17, sel_initWithConversation_delegate_notifications_balloonMaxWidth_marginInsets_collectionViewSize_, a3, a4, a5, a6, a7.top, a7.left, a7.bottom, a7.right, a8.width, a8.height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "chatItemsDidChangeNotification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewController chat](v8, "chat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inlineReplyController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel_chatItemsDidChange_, v10, v12);

    if (!-[CKInlineReplyCollectionViewController isModal](v8, "isModal"))
    {
      -[CKTranscriptCollectionViewController collectionView](v8, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collectionViewLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setUseOverlayLayout:", 1);
      -[CKTranscriptCollectionViewController collectionView](v8, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "beginHoldingContentOffsetUpdatesForReason:", CFSTR("InlineReplyChatController"));

      objc_msgSend(v14, "setNeedsDynamicsUpdate");
    }
  }
  return v8;
}

- (BOOL)isModal
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CKTranscriptCollectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CKTranscriptCollectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transcriptCollectionViewControllerIsPresentedInModalInlineReply:", self);

  return v6;
}

- (BOOL)isInline
{
  return 1;
}

- (id)transcriptBackgroundColor
{
  return 0;
}

- (BOOL)_canUseOpaqueMask
{
  return 0;
}

+ (id)chatItemsDidChangeNotification
{
  return (id)*MEMORY[0x1E0D355C0];
}

- (id)imChatItems
{
  void *v2;
  void *v3;
  void *v4;

  -[CKTranscriptCollectionViewController chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineReplyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)configureCell:(id)a3 forCKChatItem:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6 animationDuration:(double)a7 animationCurve:(int64_t)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char isKindOfClass;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(v14, "setIsInReplyContext:", 1);
  v32.receiver = self;
  v32.super_class = (Class)CKInlineReplyCollectionViewController;
  -[CKTranscriptCollectionViewController configureCell:forCKChatItem:atIndexPath:animated:animationDuration:animationCurve:](&v32, sel_configureCell_forCKChatItem_atIndexPath_animated_animationDuration_animationCurve_, v14, v15, v16, v10, a8, a7);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v14;
    objc_msgSend(v17, "balloonView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v20 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v15, "color") != 1;
    -[CKInlineReplyCollectionViewController traitCollection](self, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceStyle");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "theme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "shouldBlendReplyBalloons")
      && !-[CKInlineReplyCollectionViewController isAnimatingOut](self, "isAnimatingOut")
      && ((isKindOfClass & 1) != 0 || objc_msgSend(v18, "isAudioMessage")))
    {

      if (v20)
      {
        v28 = (void *)MEMORY[0x1E0CD2780];
        -[CKInlineReplyCollectionViewController _replyTranscriptBubbleFilterForUserInterfaceStyle:](self, "_replyTranscriptBubbleFilterForUserInterfaceStyle:", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "filterWithType:", v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "layer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setCompositingFilter:", v26);

        objc_msgSend(v17, "contentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setAllowsGroupBlending:", 0);

        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(v18, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCompositingFilter:", 0);

    objc_msgSend(v17, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAllowsGroupBlending:", 1);
LABEL_9:

  }
}

- (void)loadEarlierMessagesForConversation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  -[CKTranscriptCollectionViewController chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineReplyController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v12, "capacity");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCapacity:", objc_msgSend(v8, "defaultConversationLoadMoreCount") + v7);

  -[CKTranscriptCollectionViewController chat](self, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v6, objc_msgSend(v10, "defaultConversationLoadMoreCount"), 0, 1, v4);

}

- (void)fetchEarlierMessagesForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  -[CKTranscriptCollectionViewController chat](self, "chat");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inlineReplyController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "defaultConversationLoadMoreCount");

  objc_msgSend(v5, "setCapacity:", objc_msgSend(v5, "capacity") + v10);
  objc_msgSend(v11, "fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:completion:", v8, v10, 0, v6, v4);

}

- (void)loadRecentMessagesForConversation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  -[CKTranscriptCollectionViewController chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineReplyController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v12, "capacity");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCapacity:", objc_msgSend(v8, "defaultConversationLoadMoreCount") + v7);

  -[CKTranscriptCollectionViewController chat](self, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v6, 0, objc_msgSend(v10, "defaultConversationLoadMoreCount"), 1, v4);

}

- (void)fetchRecentMessagesForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  -[CKTranscriptCollectionViewController chat](self, "chat");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inlineReplyController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "defaultConversationLoadMoreCount");

  objc_msgSend(v5, "setCapacity:", objc_msgSend(v5, "capacity") + v10);
  objc_msgSend(v11, "fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:completion:", v8, 0, v10, v6, v4);

}

- (BOOL)shouldEndShowingEditHistoryOnViewDisappearance
{
  return 0;
}

- (BOOL)_shouldMakeTextEffectStateReadyInViewDidAppearDeferredSetup
{
  return 0;
}

+ (id)initialTextEffectsState
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKInlineReplyCollectionViewController;
  objc_msgSendSuper2(&v4, sel_initialTextEffectsState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsReady:", 0);
  return v2;
}

- (void)setScrollAnchor:(double)a3
{
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  if (-[CKInlineReplyCollectionViewController isModal](self, "isModal"))
  {
    -[CKTranscriptCollectionViewController setScrollAnchor:](&v7, sel_setScrollAnchor_, a3, self, CKInlineReplyCollectionViewController, v8.receiver, v8.super_class);
  }
  else
  {
    -[CKInlineReplyCollectionViewController currentFrameMapForNextReload](self, "currentFrameMapForNextReload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[CKInlineReplyCollectionViewController targetFrameMapForAnimateOut](self, "targetFrameMapForAnimateOut");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        -[CKTranscriptCollectionViewController setScrollAnchor:](&v8, sel_setScrollAnchor_, a3, v7.receiver, v7.super_class, self, CKInlineReplyCollectionViewController);
    }
  }
}

- (id)overrideCurrentFrameMapForLayout:(id)a3
{
  void *v4;
  void *v5;

  -[CKInlineReplyCollectionViewController currentFrameMapForNextReload](self, "currentFrameMapForNextReload", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[CKInlineReplyCollectionViewController setCurrentFrameMapForNextReload:](self, "setCurrentFrameMapForNextReload:", 0);
  return v5;
}

- (id)balloonOffsetMapForLayout:(id)a3 resetsOffsetMapAfterUse:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[CKInlineReplyCollectionViewController currentBalloonOffsetMap](self, "currentBalloonOffsetMap", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v4)
    -[CKInlineReplyCollectionViewController setCurrentBalloonOffsetMap:](self, "setCurrentBalloonOffsetMap:", 0);
  return v7;
}

- (void)performCollectionViewReloadForAnimateOut
{
  void *v3;
  void *v4;
  id v5;

  -[CKTranscriptCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNeedsDynamicsUpdate");
  -[CKTranscriptCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)setTransitionProperties:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_transitionProperties, a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v5, "chatItemGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "initialBalloonOffsetX");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v14, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "associatedChatItemGUIDs", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "initialBalloonOffsetX");
        objc_msgSend(v21, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v22, v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }

  v23 = (void *)objc_msgSend(v6, "copy");
  -[CKInlineReplyCollectionViewController setCurrentBalloonOffsetMap:](self, "setCurrentBalloonOffsetMap:", v23);

}

- (void)setAnimatingOut:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_animatingOut != a3)
  {
    v3 = a3;
    self->_animatingOut = a3;
    -[CKTranscriptCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionViewLayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setInlineAnimatingOut:", v3);
  }
}

- (id)_replyTranscriptBubbleFilterForUserInterfaceStyle:(int64_t)a3
{
  id *v4;
  id v5;

  if (!UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityIsReduceMotionEnabled())
  {
    if (a3 == 1)
    {
      v4 = (id *)MEMORY[0x1E0CD2E98];
      goto LABEL_9;
    }
    if (a3 == 2)
    {
      v4 = (id *)MEMORY[0x1E0CD2EA0];
LABEL_9:
      v5 = *v4;
      return v5;
    }
  }
  v5 = 0;
  return v5;
}

- (BOOL)isAnimatingIn
{
  return self->_animatingIn;
}

- (void)setAnimatingIn:(BOOL)a3
{
  self->_animatingIn = a3;
}

- (BOOL)isAnimatingOut
{
  return self->_animatingOut;
}

- (CKInlineReplyTransitionProperties)transitionProperties
{
  return self->_transitionProperties;
}

- (NSDictionary)currentFrameMapForNextReload
{
  return self->_currentFrameMapForNextReload;
}

- (void)setCurrentFrameMapForNextReload:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrameMapForNextReload, a3);
}

- (NSDictionary)targetFrameMapForAnimateOut
{
  return self->_targetFrameMapForAnimateOut;
}

- (void)setTargetFrameMapForAnimateOut:(id)a3
{
  objc_storeStrong((id *)&self->_targetFrameMapForAnimateOut, a3);
}

- (NSDictionary)currentBalloonOffsetMap
{
  return self->_currentBalloonOffsetMap;
}

- (void)setCurrentBalloonOffsetMap:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalloonOffsetMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBalloonOffsetMap, 0);
  objc_storeStrong((id *)&self->_targetFrameMapForAnimateOut, 0);
  objc_storeStrong((id *)&self->_currentFrameMapForNextReload, 0);
  objc_storeStrong((id *)&self->_transitionProperties, 0);
}

@end

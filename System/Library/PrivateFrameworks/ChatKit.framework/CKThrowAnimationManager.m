@implementation CKThrowAnimationManager

- (CKThrowAnimationManager)init
{
  CKThrowAnimationManager *v2;
  CKChatControllerDummyAnimator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKThrowAnimationManager;
  v2 = -[CKThrowAnimationManager init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CKChatControllerDummyAnimator);
    -[CKChatControllerDummyAnimator setAnimationDelegate:](v3, "setAnimationDelegate:", v2);
    -[CKThrowAnimationManager setAnimator:](v2, "setAnimator:", v3);

  }
  return v2;
}

- (void)animationDidFinishWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CKThrowAnimationManager *v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CEAC18], "_synchronizeDrawing");
  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHiddenItems:", 0);

  -[CKThrowAnimationManager fakeUnavailabilityIndicatorCell](self, "fakeUnavailabilityIndicatorCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[CKThrowAnimationManager setFakeUnavailabilityIndicatorCell:](self, "setFakeUnavailabilityIndicatorCell:", 0);
  -[CKThrowAnimationManager fakeNotifyAnywayButtonCell](self, "fakeNotifyAnywayButtonCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[CKThrowAnimationManager setFakeNotifyAnywayButtonCell:](self, "setFakeNotifyAnywayButtonCell:", 0);
  -[CKThrowAnimationManager fakeKeyTransparencyCell](self, "fakeKeyTransparencyCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[CKThrowAnimationManager setFakeKeyTransparencyCell:](self, "setFakeKeyTransparencyCell:", 0);
  v9 = (void *)MEMORY[0x1E0CD28B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __57__CKThrowAnimationManager_animationDidFinishWithContext___block_invoke;
  v14 = &unk_1E274A108;
  v15 = self;
  v16 = v4;
  v10 = v4;
  objc_msgSend(v9, "setCompletionBlock:", &v11);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v11, v12, v13, v14, v15);
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");

}

void __57__CKThrowAnimationManager_animationDidFinishWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "sendAnimationWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_removeAllAnimations");
  objc_msgSend(*(id *)(a1 + 32), "fakeTypingIndicatorCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setFakeTypingIndicatorCell:", 0);
  objc_msgSend(*(id *)(a1 + 32), "sendAnimationManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendAnimationManagerDidStopAnimation:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-LiveBubbleSendAnimation"), CFSTR("ShelfIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[CKSnapshotUtilities _cacheSnapshotView:forGUID:](CKSnapshotUtilities, "_cacheSnapshotView:forGUID:", 0, v7);

}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKThrowAnimationManager sendAnimationManagerDelegate](self, "sendAnimationManagerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendAnimationManagerWillStartAnimation:context:", self, v4);

}

- (void)_prepareToAnimateMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKSendAnimationContext *v10;

  v4 = a3;
  v10 = objc_alloc_init(CKSendAnimationContext);
  -[CKSendAnimationContext setMessages:](v10, "setMessages:", v4);

  -[CKThrowAnimationManager sendAnimationWindow](self, "sendAnimationWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendAnimationContext setContainerView:](v10, "setContainerView:", v5);

  -[CKThrowAnimationManager sourceRect](self, "sourceRect");
  -[CKSendAnimationContext setQuickReplySourceRect:](v10, "setQuickReplySourceRect:");
  -[CKThrowAnimationManager setCurrentContext:](self, "setCurrentContext:", v10);
  -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "throwAnimationManagerPrepareForThrowAnimation:context:", self, v10);
  -[CKThrowAnimationManager _snapshotLiveBubbleIfNecessary](self, "_snapshotLiveBubbleIfNecessary");
  -[CKThrowAnimationManager _sendMessageAndCalculateDesiredTranscriptOffset](self, "_sendMessageAndCalculateDesiredTranscriptOffset");
  -[CKThrowAnimationManager _removeFakeTypingIndicatorIfNecessary](self, "_removeFakeTypingIndicatorIfNecessary");
  -[CKThrowAnimationManager _setupThrowBalloonViews](self, "_setupThrowBalloonViews");
  -[CKThrowAnimationManager _setupThrowFrames](self, "_setupThrowFrames");
  -[CKThrowAnimationManager _entryView](self, "_entryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateCompositionForReason:", 1);

  -[CKThrowAnimationManager _entryView](self, "_entryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearAudioRecordingUI");

  -[CKThrowAnimationManager sendAnimationWindow](self, "sendAnimationWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  -[CKThrowAnimationManager _hideAddedChatItems](self, "_hideAddedChatItems");
}

- (void)animateMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTranscriptScrollIntent:", 3);
  -[CKThrowAnimationManager _prepareToAnimateMessages:](self, "_prepareToAnimateMessages:", v4);

  -[CKThrowAnimationManager animator](self, "animator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginAnimationWithSendAnimationContext:", v7);

}

- (void)animateQuickReplyMessages:(id)a3
{
  void *v4;
  id v5;

  -[CKThrowAnimationManager _prepareToAnimateMessages:](self, "_prepareToAnimateMessages:", a3);
  -[CKThrowAnimationManager animator](self, "animator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginQuickReplyAnimationWithSendAnimationContext:", v4);

}

- (UIView)sendAnimationWindow
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  CKSendAnimationWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  id WeakRetained;
  double v13;
  void *sendAnimationWindow;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CKSendAnimationContainerView *v26;
  void *v27;
  UIView *v28;

  if (!self->_sendAnimationWindow)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canUseWindowedSendAnimation");

    -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "throwAnimationManagerEntryView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v7 = [CKSendAnimationWindow alloc];
      objc_msgSend(v6, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "windowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "throwAnimationWindowFrame:", self);
      v11 = -[CKSendAnimationWindow initWithWindowScene:frame:](v7, "initWithWindowScene:frame:", v9);

      -[UIView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_sendAnimationBalloonProvider);
      LODWORD(v8) = objc_msgSend(WeakRetained, "wantsOverKeyboardAnimationForSendAnimationContext:", self->_currentContext);

      v13 = -1.0;
      if ((_DWORD)v8)
        v13 = 2.0;
      -[UIView setWindowLevel:](v11, "setWindowLevel:", *MEMORY[0x1E0CEBB18] + v13);
      sendAnimationWindow = self->_sendAnimationWindow;
      self->_sendAnimationWindow = v11;
    }
    else
    {
      objc_msgSend(v6, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "windowScene");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "screen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      v26 = -[CKSendAnimationContainerView initWithFrame:]([CKSendAnimationContainerView alloc], "initWithFrame:", v19, v21, v23, v25);
      -[CKSendAnimationContainerView setUserInteractionEnabled:](v26, "setUserInteractionEnabled:", 0);
      -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "throwAnimationContainerSuperview:", self);
      sendAnimationWindow = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(sendAnimationWindow, "addSubview:", v26);
      v28 = self->_sendAnimationWindow;
      self->_sendAnimationWindow = &v26->super;

    }
  }
  return self->_sendAnimationWindow;
}

- (id)_collectionViewController
{
  void *v3;
  void *v4;

  -[CKThrowAnimationManager sendAnimationManagerDelegate](self, "sendAnimationManagerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewControllerForImpactEffectManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_entryView
{
  void *v3;
  void *v4;

  -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwAnimationManagerEntryView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_snapshotLiveBubbleIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-LiveBubbleSendAnimation"), CFSTR("ShelfIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager _entryView](self, "_entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKSnapshotUtilities _cacheSnapshotView:forGUID:](CKSnapshotUtilities, "_cacheSnapshotView:forGUID:", v6, v7);
  if (_IMWillLog())
    _IMAlwaysLog();

}

- (CGPoint)_sendMessageAndCalculateDesiredTranscriptOffset
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  CGPoint result;

  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__76;
  v37 = __Block_byref_object_dispose__76;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0x7FFFFFFFFFFFFFFFLL;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74__CKThrowAnimationManager__sendMessageAndCalculateDesiredTranscriptOffset__block_invoke;
  v28[3] = &unk_1E27548D8;
  v28[4] = &v33;
  v28[5] = &v29;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v28);

  v6 = v30[3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutAttributesForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v7 = v10;

  }
  objc_msgSend(v4, "contentOffset");
  v12 = v11;
  v14 = v13;
  -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "throwAnimationManager:canNowSendMessages:", self, v17);

  objc_msgSend(v3, "chatItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexOfObject:", v34[5]);
  v30[3] = v19;
  v20 = (void *)v34[5];
  v34[5] = 0;

  v21 = v30[3];
  v22 = v7;
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutAttributesForItemAtIndexPath:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v22 = v25;

  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  v26 = v12;
  v27 = v14 + v22 - v7;
  result.y = v27;
  result.x = v26;
  return result;
}

void __74__CKThrowAnimationManager__sendMessageAndCalculateDesiredTranscriptOffset__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (unint64_t)_indexOfLastVisibleChatItemForChatItems:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "count") - 1;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)_setupThrowFrames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double MinY;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  double v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  _QWORD v57[4];
  id v58;
  id v59;
  CKThrowAnimationManager *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  char v72;
  uint64_t v73;
  double *v74;
  uint64_t v75;
  uint64_t v76;

  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v3, "shouldUseQuickReplySourceRect");

  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager _entryView](self, "_entryView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager sendAnimationWindow](self, "sendAnimationWindow");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v5;
  objc_msgSend(v5, "marginInsets");
  v50 = v8;
  v51 = v7;
  v10 = v9;
  v12 = v11;
  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v13;
  objc_msgSend(v13, "messages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "__ck_indexesOfPartsOfMessages:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "lastIndex");
  v18 = objc_msgSend(v14, "count");
  objc_msgSend(v4, "latestScheduledMessageIndexPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v15;
  objc_msgSend(v15, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "scheduleType");

  if (v21 == 2 || !v19)
  {
    if (v17 >= v18 - 1)
      v17 = v18 - 1;
    v22 = objc_msgSend(v14, "count") - 1;
  }
  else
  {
    v17 = objc_msgSend(v19, "indexAtPosition:", objc_msgSend(v19, "length") - 1);
    v22 = v17;
  }
  -[CKThrowAnimationManager scrollViewOffsetForBottomAligningChatItemAtIndex:](self, "scrollViewOffsetForBottomAligningChatItemAtIndex:", v22);
  v24 = v23;
  -[CKThrowAnimationManager scrollViewOffsetForBottomAligningChatItemAtIndex:](self, "scrollViewOffsetForBottomAligningChatItemAtIndex:", v17);
  v26 = v25;
  objc_msgSend(v14, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTranscriptCompositionalLayout bottomTranscriptSpaceWithLastChatItem:](CKTranscriptCompositionalLayout, "bottomTranscriptSpaceWithLastChatItem:", v27);
  v29 = v28;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "isEntryViewInputAccessory"))
    objc_msgSend(v6, "throwAnimationKeyboardFrame:", self);
  else
    objc_msgSend(v54, "frame");
  MinY = CGRectGetMinY(*(CGRect *)&v31);

  objc_msgSend(v6, "throwAnimationManagerTopHeaderHeight:", self);
  v37 = v36;
  objc_msgSend(v6, "throwAnimationFinalFrameOffset:", self);
  v39 = v38;
  v73 = 0;
  v74 = (double *)&v73;
  v75 = 0x2020000000;
  v76 = 0;
  v40 = -[CKThrowAnimationManager _transcriptWillShiftDueToThrowAnimation](self, "_transcriptWillShiftDueToThrowAnimation") & (v56 ^ 1);
  v41 = MinY - (v26 + v37);
  if (v40 == 1)
    v41 = v24 - v26 + v29 + MinY;
  v74[3] = v41;
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __44__CKThrowAnimationManager__setupThrowFrames__block_invoke;
  v57[3] = &unk_1E275A048;
  v43 = v52;
  v58 = v43;
  v44 = v4;
  v66 = v51;
  v67 = v50;
  v68 = v10;
  v69 = v12;
  v59 = v44;
  v60 = self;
  v71 = v40;
  v45 = v6;
  v61 = v45;
  v46 = v54;
  v62 = v46;
  v72 = v56;
  v47 = v42;
  v63 = v47;
  v65 = &v73;
  v70 = v39;
  v48 = v53;
  v64 = v48;
  objc_msgSend(v14, "enumerateObjectsAtIndexes:options:usingBlock:", v16, 2, v57);
  objc_msgSend(v55, "setFramesOfAddedChatItems:", v47);

  _Block_object_dispose(&v73, 8);
}

void __44__CKThrowAnimationManager__setupThrowFrames__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
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
  double v30;
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
  double MaxX;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  double v81;
  double v82;
  _QWORD v83[4];
  _QWORD v84[4];
  CGRect v85;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_msgSend(v5, "cellClass");
  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v16 = (void *)objc_msgSend([v7 alloc], "initWithFrame:", v10, v12, v14, v15);
  objc_msgSend(v16, "applyLayoutAttributes:", v9);
  objc_msgSend(*(id *)(a1 + 40), "configureCell:forCKChatItem:atIndexPath:animated:animationDuration:animationCurve:", v16, v5, v6, 0, 3, 0.0);
  objc_msgSend(v16, "setNeedsLayout");
  objc_msgSend(v16, "layoutIfNeeded");
  objc_opt_class();
  v82 = v13;
  v17 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "balloonView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v16;
  }
  v19 = v18;
  objc_msgSend(v18, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v9, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v5, "contentInsets");
  v35 = v34 + *(double *)(a1 + 96);
  v37 = v36 + *(double *)(a1 + 104);
  v39 = v38 + *(double *)(a1 + 112);
  v85.origin.x = v27 + v37;
  v85.origin.y = v29 + v35;
  v85.size.width = v31 - (v37 + v40 + *(double *)(a1 + 120));
  v85.size.height = v33 - (v35 + v39);
  MaxX = CGRectGetMaxX(v85);
  objc_msgSend(v19, "frame");
  v43 = MaxX - v42;
  objc_msgSend(v19, "superview");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:fromView:", v44, v43, v21, v23, v25);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", v6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    objc_msgSend(*(id *)(a1 + 40), "configureCell:forCKChatItem:atIndexPath:animated:animationDuration:animationCurve:", v53, v5, v6, 0, 3, 0.0);
  objc_msgSend(*(id *)(a1 + 48), "scrollViewOffsetForBottomAligningChatItemAtIndex:", a3);
  v55 = v54;
  v56 = v17;
  if (*(_BYTE *)(a1 + 136))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v82;
    if (objc_msgSend(v57, "isEntryViewInputAccessory"))
    {
      objc_msgSend(*(id *)(a1 + 56), "throwAnimationManagerAccessoryViewHeight:", *(_QWORD *)(a1 + 48));
      v60 = v59;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "bounds");
      v60 = v61;
    }

    objc_msgSend(*(id *)(a1 + 64), "placeholderHeight");
    v55 = v55 - (v60 - v62);
  }
  else
  {
    v58 = v82;
  }
  v63 = v58 + v48;
  v64 = v56 + v46;
  if (*(_BYTE *)(a1 + 137))
  {
    objc_msgSend(*(id *)(a1 + 32), "superview");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "convertRect:fromView:", *(_QWORD *)(a1 + 32), v64, v63, v50, v52);
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;

    v84[0] = v67;
    v84[1] = v69;
    v84[2] = v71;
    v84[3] = v73;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v84, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "insertObject:atIndex:", v74, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "convertRect:fromView:", *(_QWORD *)(a1 + 64), v64, v63 - (v55 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) - *(double *)(a1 + 128)), v50, v52);
    v76 = v75;
    v83[0] = v77;
    v83[1] = v78;
    v83[2] = v79;
    *(double *)&v83[3] = v75;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v83, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "insertObject:atIndex:", v74, 0);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v76
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "balloonContiguousSpace");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v81
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);

  }
}

- (void)_removeAllAnimations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id obj;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "throwBalloonViews");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v66;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v66 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "textView");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "text");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "_isNaturallyRTL");

          if (v9)
            objc_msgSend(v7, "setHidden:", 0);

        }
        objc_msgSend(v6, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAllAnimations");

        objc_msgSend(v6, "removeFromSuperview");
        CKBalloonViewReuse(v6);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v3);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v42, "throwBalloonViewAttributesCollection");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v62;
    v43 = *(_QWORD *)v62;
    do
    {
      v14 = 0;
      v44 = v12;
      do
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v45);
        v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v48 = v14;
          objc_msgSend(v15, "throwBalloonView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeAllAnimations");

          objc_msgSend(v16, "removeFromSuperview");
          v47 = v16;
          CKBalloonViewReuse(v16);
          objc_msgSend(v15, "supplementaryViews");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "allKeys");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v58;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v58 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(v18, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v23));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "layer");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "removeAllAnimations");

                objc_msgSend(v24, "removeFromSuperview");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v24, "textView");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "text");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "_isNaturallyRTL");

                  if (v28)
                    objc_msgSend(v26, "setHidden:", 0);

                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  CKBalloonViewReuse(v24);

                ++v23;
              }
              while (v21 != v23);
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
            }
            while (v21);
          }

          v13 = v43;
          v12 = v44;
          v14 = v48;
        }
        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v12);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v42, "animatableViews");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v54;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v54 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v33), "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "removeAllAnimations");

        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    }
    while (v31);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v42, "animatableTextViews");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v50;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v39);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v40, "layer");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "removeAllAnimations");

        }
        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v37);
  }

}

- (id)lastVisibleCellOfType:(Class)a3 inCollectionView:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0);
  if (v5 < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v6 = v5 + 1;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6 - 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cellForItemAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if ((unint64_t)--v6 <= 1)
        goto LABEL_5;
    }

  }
  return v8;
}

- (void)_removeFakeTypingIndicatorIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[CKThrowAnimationManager fakeTypingIndicatorCell](self, "fakeTypingIndicatorCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");
    -[CKThrowAnimationManager setFakeTypingIndicatorCell:](self, "setFakeTypingIndicatorCell:", 0);

  }
}

- (void)_hideAddedChatItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__76;
  v15 = __Block_byref_object_dispose__76;
  v16 = 0;
  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_indexesOfPartsOfMessages:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v7, "mutableCopy");

  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "throwBalloonViewAttributesCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__CKThrowAnimationManager__hideAddedChatItems__block_invoke;
  v10[3] = &unk_1E275A070;
  v10[4] = &v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v3, "setHiddenItems:", v12[5]);

  _Block_object_dispose(&v11, 8);
}

void __46__CKThrowAnimationManager__hideAddedChatItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  int v9;

  v6 = (void *)MEMORY[0x1E0C99E38];
  v7 = a2;
  objc_msgSend(v6, "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "firstIndex"));
  else
    *a4 = 1;
}

- (BOOL)_transcriptWillShiftDueToThrowAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;

  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__ck_indexesOfPartsOfMessages:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lastIndex");
  v9 = objc_msgSend(v5, "count");
  if (v8 >= v9 - 1)
    v10 = v9 - 1;
  else
    v10 = v8;
  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "latestScheduledMessageIndexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "scheduleType");

  if (v14 != 2 && v12)
    v10 = objc_msgSend(v12, "indexAtPosition:", 0) - 1;
  -[CKThrowAnimationManager scrollViewOffsetForBottomAligningChatItemAtIndex:](self, "scrollViewOffsetForBottomAligningChatItemAtIndex:", v10);
  v16 = v15;
  -[CKThrowAnimationManager throwManagerDelegate](self, "throwManagerDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager _entryView](self, "_entryView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEntryViewInputAccessory"))
  {
    objc_msgSend(v17, "throwAnimationManagerAccessoryViewHeight:", self);
    v21 = v20;
  }
  else
  {
    objc_msgSend(v18, "bounds");
    v21 = v22;
  }

  objc_msgSend(v18, "placeholderHeight");
  v24 = v21 - v23;
  objc_msgSend(v17, "throwAnimationManagerTopHeaderHeight:", self);
  v26 = v16 - v24 > -v25;

  return v26;
}

- (double)_changeInEntryViewHeight
{
  void *v2;
  double Height;
  double v4;
  double v5;
  CGRect v7;

  -[CKThrowAnimationManager _entryView](self, "_entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  Height = CGRectGetHeight(v7);
  objc_msgSend(v2, "placeholderHeight");
  v5 = Height - v4;

  return v5;
}

- (void)_setupThrowBalloonViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CKThrowAnimationManager currentContext](self, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKThrowAnimationManager sendAnimationBalloonProvider](self, "sendAnimationBalloonProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "throwBalloonsForSendAnimationContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setThrowBalloonViewAttributesCollection:", v5);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "throwBalloonView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "supplementaryViews");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewTextViewContainerView"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "setHidden:", 1);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (double)scrollViewOffsetForBottomAligningChatItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  double MaxY;
  double v14;
  double v15;
  double v16;
  int64_t v18;
  int64_t v19;
  CGRect v20;

  -[CKThrowAnimationManager _collectionViewController](self, "_collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentInset");
  v7 = -v6;
  v8 = objc_msgSend(v5, "numberOfItemsInSection:", 0);
  v9 = v8 - 1;
  if (v8 >= 1)
  {
    v10 = v8;
    if (a3 < 0 || v8 <= a3)
    {
      if (_IMWillLog())
      {
        v18 = a3;
        v19 = v10;
        _IMAlwaysLog();
      }
    }
    else
    {
      v9 = a3;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, 0, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    MaxY = CGRectGetMaxY(v20);
    objc_msgSend(v5, "bounds");
    v15 = v14;
    objc_msgSend(v5, "contentInset");
    if (MaxY - (v15 - v16) >= v7)
      v7 = MaxY - (v15 - v16);

  }
  return v7;
}

- (int64_t)_indexOfLastChatItemThatWillNotStickToTheBottom:(id)a3
{
  id v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v10 = objc_msgSend(v3, "count") - 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__CKThrowAnimationManager__indexOfLastChatItemThatWillNotStickToTheBottom___block_invoke;
  v6[3] = &unk_1E274DF98;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __75__CKThrowAnimationManager__indexOfLastChatItemThatWillNotStickToTheBottom___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  char v9;
  char v10;
  char v11;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 && (v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (CKSendAnimationManagerDelegate)sendAnimationManagerDelegate
{
  return (CKSendAnimationManagerDelegate *)objc_loadWeakRetained((id *)&self->_sendAnimationManagerDelegate);
}

- (void)setSendAnimationManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sendAnimationManagerDelegate, a3);
}

- (CKSendAnimationBalloonProvider)sendAnimationBalloonProvider
{
  return (CKSendAnimationBalloonProvider *)objc_loadWeakRetained((id *)&self->_sendAnimationBalloonProvider);
}

- (void)setSendAnimationBalloonProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sendAnimationBalloonProvider, a3);
}

- (CKThrowAnimationManagerDelegate)throwManagerDelegate
{
  return (CKThrowAnimationManagerDelegate *)objc_loadWeakRetained((id *)&self->_throwManagerDelegate);
}

- (void)setThrowManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_throwManagerDelegate, a3);
}

- (UIView)quickReplySnapshot
{
  return self->_quickReplySnapshot;
}

- (void)setQuickReplySnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_quickReplySnapshot, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)audioMessageSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_audioMessageSourceRect.origin.x;
  y = self->_audioMessageSourceRect.origin.y;
  width = self->_audioMessageSourceRect.size.width;
  height = self->_audioMessageSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAudioMessageSourceRect:(CGRect)a3
{
  self->_audioMessageSourceRect = a3;
}

- (UIImageView)audioRecordingPillViewSnapshot
{
  return self->_audioRecordingPillViewSnapshot;
}

- (void)setAudioRecordingPillViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecordingPillViewSnapshot, a3);
}

- (CKSendAnimationContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (void)setSendAnimationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_sendAnimationWindow, a3);
}

- (CKChatControllerDummyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (CKTranscriptTypingIndicatorCell)fakeTypingIndicatorCell
{
  return self->_fakeTypingIndicatorCell;
}

- (void)setFakeTypingIndicatorCell:(id)a3
{
  objc_storeStrong((id *)&self->_fakeTypingIndicatorCell, a3);
}

- (CKTranscriptUnavailabilityIndicatorCell)fakeUnavailabilityIndicatorCell
{
  return self->_fakeUnavailabilityIndicatorCell;
}

- (void)setFakeUnavailabilityIndicatorCell:(id)a3
{
  objc_storeStrong((id *)&self->_fakeUnavailabilityIndicatorCell, a3);
}

- (CKTranscriptNotifyAnywayButtonCell)fakeNotifyAnywayButtonCell
{
  return self->_fakeNotifyAnywayButtonCell;
}

- (void)setFakeNotifyAnywayButtonCell:(id)a3
{
  objc_storeStrong((id *)&self->_fakeNotifyAnywayButtonCell, a3);
}

- (CKTranscriptLabelCell)fakeKeyTransparencyCell
{
  return self->_fakeKeyTransparencyCell;
}

- (void)setFakeKeyTransparencyCell:(id)a3
{
  objc_storeStrong((id *)&self->_fakeKeyTransparencyCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeKeyTransparencyCell, 0);
  objc_storeStrong((id *)&self->_fakeNotifyAnywayButtonCell, 0);
  objc_storeStrong((id *)&self->_fakeUnavailabilityIndicatorCell, 0);
  objc_storeStrong((id *)&self->_fakeTypingIndicatorCell, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_sendAnimationWindow, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_audioRecordingPillViewSnapshot, 0);
  objc_storeStrong((id *)&self->_quickReplySnapshot, 0);
  objc_destroyWeak((id *)&self->_throwManagerDelegate);
  objc_destroyWeak((id *)&self->_sendAnimationBalloonProvider);
  objc_destroyWeak((id *)&self->_sendAnimationManagerDelegate);
}

@end

@implementation CKFullScreenBalloonViewControllerPhone

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  objc_super v8;

  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");
      CKBalloonViewReuse(v7);
      -[CKFullScreenBalloonViewControllerPhone setBalloonView:](self, "setBalloonView:", 0);

    }
  }
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
    objc_msgSend(MEMORY[0x1E0CEA6C8], "setKeyboardAlpha:", 1.0);
  v8.receiver = self;
  v8.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  -[CKFullScreenBalloonViewController dealloc](&v8, sel_dealloc);
}

- (CKFullScreenBalloonViewControllerPhone)initWithChatItem:(id)a3 title:(id)a4 interfaceActions:(id)a5 gradientReferenceView:(id)a6 pluginBalloonSnapshot:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  CKFullScreenBalloonViewControllerPhone *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[CKFullScreenBalloonViewDisplayConfiguration tapbackPickerContext](CKFullScreenBalloonViewDisplayConfiguration, "tapbackPickerContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CKFullScreenBalloonViewControllerPhone initWithChatItem:title:interfaceActions:gradientReferenceView:displayConfiguration:pluginBalloonSnapshot:delegate:](self, "initWithChatItem:title:interfaceActions:gradientReferenceView:displayConfiguration:pluginBalloonSnapshot:delegate:", v19, v18, v17, v16, v20, v15, v14);

  return v21;
}

- (CKFullScreenBalloonViewControllerPhone)initWithChatItem:(id)a3 title:(id)a4 interfaceActions:(id)a5 gradientReferenceView:(id)a6 displayConfiguration:(id)a7 pluginBalloonSnapshot:(id)a8 delegate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  CKFullScreenBalloonViewControllerPhone *v23;
  CKFullScreenBalloonViewControllerPhone *v24;
  void *v25;
  char v26;
  NSObject *v27;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v29 = 138412290;
      v30 = v15;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Creating fullscreen balloon for chatItem = %@", (uint8_t *)&v29, 0xCu);
    }

  }
  v23 = -[CKFullScreenBalloonViewController initWithChatItem:gradientReferenceView:displayConfiguration:delegate:](self, "initWithChatItem:gradientReferenceView:displayConfiguration:delegate:", v15, v18, v19, v21);
  v24 = v23;
  if (v23)
  {
    -[CKFullScreenBalloonViewControllerPhone setTitle:](v23, "setTitle:", v16);
    -[CKFullScreenBalloonViewControllerPhone setInterfaceActions:](v24, "setInterfaceActions:", v17);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEmojiTapbacksEnabled");

    if ((v26 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v29 = 138412290;
          v30 = v20;
          _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "pluginBalloonSnapshot = %@", (uint8_t *)&v29, 0xCu);
        }

      }
      if (v20)
        -[CKFullScreenBalloonViewControllerPhone setBalloonView:](v24, "setBalloonView:", v20);
    }
  }

  return v24;
}

- (void)loadLivePhotoBalloonViewIfNeeded
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  __int128 v22;
  void *v23;
  int v24;
  id v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;

  if (UIAccessibilityIsReduceMotionEnabled())
    return;
  -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return;
  -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();

  if ((v6 & 1) == 0)
  {
LABEL_14:

    return;
  }
  objc_msgSend(v25, "mediaObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isIrisAsset") & 1) == 0)
  {

    goto LABEL_14;
  }

  if (v7)
  {
    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    -[CKFullScreenBalloonViewController supplementaryLayoutContext](self, "supplementaryLayoutContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_isKindOfClass();

    v11 = objc_alloc((Class)objc_opt_class());
    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ck_identityTransformFrame");
    v13 = (void *)objc_msgSend(v11, "initWithFrame:");

    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configureForMessagePart:", v14);

    objc_msgSend(v13, "setCanUseOpaqueMask:", 0);
    objc_msgSend(v13, "livePhotoView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    objc_msgSend(v13, "setAlpha:", 0.0);
    objc_msgSend(v13, "setNeedsPrepareForDisplay");
    objc_msgSend(v13, "prepareForDisplayIfNeeded");
    objc_msgSend(v13, "setNeedsLayout");
    objc_msgSend(v13, "layoutIfNeeded");
    -[CKFullScreenBalloonViewControllerPhone setLivePhotoBalloonView:](self, "setLivePhotoBalloonView:", v13);
    -[CKFullScreenBalloonViewController balloonWrapperView](self, "balloonWrapperView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    if ((v9 & 1) != 0)
    {
      -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "layoutRecipe");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rotation");
      v21 = v20;

      if (v21 != 0.0)
      {
        memset(&v28, 0, sizeof(v28));
        v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v27.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v27.c = v22;
        *(_OWORD *)&v27.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        CGAffineTransformRotate(&v28, &v27, v21 * 3.14159265 / 180.0);
        v26 = v28;
        objc_msgSend(v13, "setTransform:", &v26);
      }
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEmojiTapbacksEnabled");

    if (v24)
      objc_msgSend(v13, "setUserInteractionEnabled:", 0);

  }
}

- (void)_legacy_performInitialAnimations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  char v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  BOOL v71;
  _QWORD v72[5];
  uint8_t buf[4];
  void *v74;
  uint64_t v75;
  CGRect v76;
  CGRect v77;

  v75 = *MEMORY[0x1E0C80C00];
  if (-[CKFullScreenBalloonViewController shouldShowTapbackAttribution](self, "shouldShowTapbackAttribution"))
    -[CKFullScreenBalloonViewControllerPhone _legacy_presentTapbackVotingView](self, "_legacy_presentTapbackVotingView");
  -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performShowAnimation:", 0);

  }
  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fullScreenBalloonViewController:balloonFrameForChatItem:", self, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ck_identityTransformFrame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v76.origin.x = v23;
  v76.origin.y = v25;
  v76.size.width = v27;
  v76.size.height = v29;
  v77.origin.x = v14;
  v77.origin.y = v16;
  v77.size.width = v18;
  v77.size.height = v20;
  if (CGRectEqualToRect(v76, v77))
    v30 = 0.0;
  else
    v30 = v16 - v25;
  -[CKFullScreenBalloonViewController tintView](self, "tintView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlpha:", 0.0);

  -[CKFullScreenBalloonViewController tintView](self, "tintView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHidden:", 0);

  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_respondsToSelector();

  if ((v34 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "shouldDismissKeyboardWhenShowingFullScreenAcknowledgmentPickerForBalloonChatItem:", v36);

  }
  else
  {
    v37 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI")
    && ((IMIsRunningInMessagesExtension() | v37) & 1) == 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "fullScreenBalloonViewControllerRequestShowKeyboardSnapshot:", self);

  }
  -[CKFullScreenBalloonViewControllerPhone setBalloonYOffsetFromTranscript:](self, "setBalloonYOffsetFromTranscript:", v30);
  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "shouldPresentTintViewBeforeScrolling");

  if (v40)
    -[CKFullScreenBalloonViewControllerPhone _revealTintAnimated:](self, "_revealTintAnimated:", 1);
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_opt_respondsToSelector();

  if ((v42 & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v74 = v44;
        _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "verticallyScrollTranscriptByAmount: %@", buf, 0xCu);

      }
    }
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scrollDuration");
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __74__CKFullScreenBalloonViewControllerPhone__legacy_performInitialAnimations__block_invoke;
    v72[3] = &unk_1E274A208;
    v72[4] = self;
    objc_msgSend(v45, "fullScreenBalloonViewController:verticallyScrollTranscriptByAmount:animated:duration:completion:", self, 1, v72, v30, v47);

  }
  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setHidden:", 0);

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.translation.y"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "frame");
    objc_msgSend(v51, "numberWithDouble:", -v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFromValue:", v54);

    LODWORD(v55) = 2.25;
    objc_msgSend(v50, "setSpeed:", v55);
    objc_msgSend(v50, "setDamping:", 15.0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "replyButtonAnimationDuration");
    objc_msgSend(v50, "setDuration:");

    objc_msgSend(v50, "setRemovedOnCompletion:", 1);
    v57 = *MEMORY[0x1E0CD2B58];
    objc_msgSend(v50, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFromValue:", &unk_1E2870DB0);
    LODWORD(v59) = 1.5;
    objc_msgSend(v58, "setSpeed:", v59);
    objc_msgSend(v58, "setMass:", 1.0);
    objc_msgSend(v58, "setStiffness:", 350.0);
    objc_msgSend(v58, "setDamping:", 40.0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "replyButtonAnimationDuration");
    objc_msgSend(v58, "setDuration:");

    objc_msgSend(v58, "setRemovedOnCompletion:", 1);
    objc_msgSend(v58, "setFillMode:", v57);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFromValue:", &unk_1E2871710);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "replyButtonAnimationDuration");
    objc_msgSend(v61, "setDuration:");

    objc_msgSend(v61, "setRemovedOnCompletion:", 1);
    objc_msgSend(v61, "setFillMode:", v57);
    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "layer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addAnimation:forKey:", v61, CFSTR("opacity"));

    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addAnimation:forKey:", v50, CFSTR("translate"));

    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addAnimation:forKey:", v58, CFSTR("scale"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v69, "shouldShowHighlightButton"))
  {
    -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70 == 0;

    if (v71)
      return;
    -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "performShowAnimation:", 0);
  }

}

void __74__CKFullScreenBalloonViewControllerPhone__legacy_performInitialAnimations__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  objc_msgSend(*(id *)(a1 + 32), "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPresentTintViewBeforeScrolling");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_revealTintAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "balloonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "livePhotoBalloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "livePhotoBalloonView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "livePhotoBalloonView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "livePhotoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startPlaybackWithStyle:", 1);

  }
  else
  {
    objc_msgSend(v6, "balloonView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFollowsParentBalloonView:", 1);
  objc_msgSend(*(id *)(a1 + 32), "displayConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldShowStickers");

  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "updateStickersAnimated:", 1);
}

- (void)performInitialAnimations
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if ((v4 & 1) != 0)
  {
    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    -[CKFullScreenBalloonViewControllerPhone _updateKeyboardSnapshotIfNeeded](self, "_updateKeyboardSnapshotIfNeeded");
    -[CKFullScreenBalloonViewController tintView](self, "tintView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[CKFullScreenBalloonViewControllerPhone _balloonOffsetFromTranscriptParentBalloon](self, "_balloonOffsetFromTranscriptParentBalloon");
    v8 = v7;
    -[CKFullScreenBalloonViewControllerPhone setBalloonYOffsetFromTranscript:](self, "setBalloonYOffsetFromTranscript:");
    if (v8 == 0.0)
    {
      -[CKFullScreenBalloonViewControllerPhone _revealTintAnimated:](self, "_revealTintAnimated:", 1);
      -[CKFullScreenBalloonViewControllerPhone _presentAccessoryViews](self, "_presentAccessoryViews");
      -[CKFullScreenBalloonViewController setFollowsParentBalloonView:](self, "setFollowsParentBalloonView:", 1);
      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[CKFullScreenBalloonViewController delegate](self, "delegate");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fullScreenBalloonViewControllerDidCompleteInitialAnimation:", self);

      }
    }
    else
    {
      -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "shouldPresentTintViewBeforeScrolling");

      if (v12)
        -[CKFullScreenBalloonViewControllerPhone _revealTintAnimated:](self, "_revealTintAnimated:", 1);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __66__CKFullScreenBalloonViewControllerPhone_performInitialAnimations__block_invoke;
      v14[3] = &unk_1E274A208;
      v14[4] = self;
      -[CKFullScreenBalloonViewControllerPhone _scrollTranscriptToBalloonView:completion:](self, "_scrollTranscriptToBalloonView:completion:", v14, v8);
    }
  }
  else
  {
    -[CKFullScreenBalloonViewControllerPhone _legacy_performInitialAnimations](self, "_legacy_performInitialAnimations");
  }
}

void __66__CKFullScreenBalloonViewControllerPhone_performInitialAnimations__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPresentTintViewBeforeScrolling");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_revealTintAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_presentAccessoryViews");
  objc_msgSend(*(id *)(a1 + 32), "setFollowsParentBalloonView:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullScreenBalloonViewControllerDidCompleteInitialAnimation:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_scrollTranscriptToBalloonView:(double)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "verticallyScrollTranscriptByAmount: %@", buf, 0xCu);

      }
    }
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollDuration");
    v14 = v13;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__CKFullScreenBalloonViewControllerPhone__scrollTranscriptToBalloonView_completion___block_invoke;
    v15[3] = &unk_1E274AED0;
    v16 = v6;
    objc_msgSend(v11, "fullScreenBalloonViewController:verticallyScrollTranscriptByAmount:animated:duration:completion:", self, 1, v15, a3, v14);

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

uint64_t __84__CKFullScreenBalloonViewControllerPhone__scrollTranscriptToBalloonView_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentAccessoryViews
{
  -[CKFullScreenBalloonViewControllerPhone _presentTapbackAttributionIfNeeded](self, "_presentTapbackAttributionIfNeeded");
  -[CKFullScreenBalloonViewControllerPhone _presentOverlayBalloonView](self, "_presentOverlayBalloonView");
  -[CKFullScreenBalloonViewControllerPhone _presentTapbackPickerIfNeeded](self, "_presentTapbackPickerIfNeeded");
  -[CKFullScreenBalloonViewControllerPhone _presentStickersIfNeeded](self, "_presentStickersIfNeeded");
}

- (void)_presentTapbackAttributionIfNeeded
{
  id v3;

  if (-[CKFullScreenBalloonViewController shouldShowTapbackAttribution](self, "shouldShowTapbackAttribution"))
  {
    -[CKFullScreenBalloonViewControllerPhone attributionView](self, "attributionView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "present");

  }
}

- (void)_presentOverlayBalloonView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 1.0);

    -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "livePhotoView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startPlaybackWithStyle:", 1);

  }
  else
  {
    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);
  }

}

- (void)_presentTapbackPickerIfNeeded
{
  if (-[CKFullScreenBalloonViewController shouldShowTapbackPicker](self, "shouldShowTapbackPicker"))
    -[CKFullScreenBalloonViewControllerPhone showTapbackPicker](self, "showTapbackPicker");
}

- (void)_presentStickersIfNeeded
{
  void *v3;
  int v4;

  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowStickers");

  if (v4)
    -[CKFullScreenBalloonViewControllerPhone updateStickersAnimated:](self, "updateStickersAnimated:", 1);
}

- (double)_balloonOffsetFromTranscriptParentBalloon
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  _BOOL4 v22;
  double result;
  CGRect v24;
  CGRect v25;

  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullScreenBalloonViewController:balloonFrameForChatItem:", self, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ck_identityTransformFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v22 = CGRectEqualToRect(v24, v25);
  result = v8 - v17;
  if (v22)
    return 0.0;
  return result;
}

- (void)_updateKeyboardSnapshotIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "shouldDismissKeyboardWhenShowingFullScreenAcknowledgmentPickerForBalloonChatItem:", v6);

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    if (((IMIsRunningInMessagesExtension() | v7) & 1) == 0)
    {
      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fullScreenBalloonViewControllerRequestShowKeyboardSnapshot:", self);

    }
  }
}

- (void)_legacy_presentTapbackVotingView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  CGFloat v25;
  void *v26;
  double MidX;
  void *v28;
  double v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  CGRect v33;
  CGRect v34;
  CGRect v35;

  -[UIViewController view](self->_attributionViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CKFullScreenBalloonViewControllerPhone view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  v7 = CKIsRunningInMacCatalyst();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEmojiTapbacksEnabled");

  if (v7)
  {
    if (v9)
    {
      -[CKFullScreenBalloonViewControllerPhone updateAttributionViewControllerForDismissal](self, "updateAttributionViewControllerForDismissal");
      -[CKFullScreenBalloonViewControllerPhone showAttributionViewController:](self, "showAttributionViewController:", 0);
      -[UIViewController view](self->_attributionViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 0.0);

      v11 = (void *)MEMORY[0x1E0CEABB0];
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replyButtonAnimationDuration");
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __74__CKFullScreenBalloonViewControllerPhone__legacy_presentTapbackVotingView__block_invoke;
      v32[3] = &unk_1E274A208;
      v32[4] = self;
      objc_msgSend(v11, "animateWithDuration:animations:", v32);

      return;
    }
    v13 = CFSTR("opacity");
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFromValue:", &unk_1E2871710);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "replyButtonAnimationDuration");
    objc_msgSend(v31, "setDuration:");

    objc_msgSend(v31, "setRemovedOnCompletion:", 1);
    objc_msgSend(v31, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  }
  else
  {
    if (v9)
    {
      -[CKFullScreenBalloonViewControllerPhone updateAttributionViewControllerForDismissal](self, "updateAttributionViewControllerForDismissal");
      -[CKFullScreenBalloonViewControllerPhone showAttributionViewController:](self, "showAttributionViewController:", 1);
      return;
    }
    if (-[CKFullScreenBalloonViewController shouldShowTapbackAttribution](self, "shouldShowTapbackAttribution"))
    {
      -[CKFullScreenBalloonViewControllerPhone votingViewTargetFrame](self, "votingViewTargetFrame");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
    }
    else
    {
      v16 = *MEMORY[0x1E0C9D648];
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    -[CKFullScreenBalloonViewControllerPhone attributionViewController](self, "attributionViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v16, v18, v20, v22);

    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    v25 = v6 - CGRectGetHeight(v33);
    v13 = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDamping:", 20.0);
    objc_msgSend(v31, "setStiffness:", 50.0);
    objc_msgSend(v31, "setMass:", 1.0);
    objc_msgSend(v31, "setFillMode:", *MEMORY[0x1E0CD2B50]);
    v26 = (void *)MEMORY[0x1E0CB3B18];
    v34.origin.x = v16;
    v34.origin.y = v25;
    v34.size.width = v20;
    v34.size.height = v22;
    MidX = CGRectGetMidX(v34);
    v35.origin.x = v16;
    v35.origin.y = v25;
    v35.size.width = v20;
    v35.size.height = v22;
    objc_msgSend(v26, "valueWithCGPoint:", MidX, CGRectGetMidY(v35));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFromValue:", v28);

    LODWORD(v29) = 3.0;
    objc_msgSend(v31, "setSpeed:", v29);
  }
  -[UIViewController view](self->_attributionViewController, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAnimation:forKey:", v31, v13);

}

void __74__CKFullScreenBalloonViewControllerPhone__legacy_presentTapbackVotingView__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_revealTintAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = a3;
  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    if (v3)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9D8]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 853.41, 69.3804, 0.0, 0.0);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:timingParameters:", v7, 0.0);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke;
      v13[3] = &unk_1E274A208;
      v13[4] = self;
      objc_msgSend(v8, "addAnimations:", v13);
      objc_msgSend(v8, "startAnimation");

    }
    else
    {
      -[CKFullScreenBalloonViewControllerPhone updateTintViewAlpha](self, "updateTintViewAlpha");
    }
  }
  else
  {
    v9 = 0.0;
    if (v3)
    {
      -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tintRevealDuration");
      v9 = v11;

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke_2;
    v12[3] = &unk_1E274A208;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 2, v12, 0, v9, 0.0);
  }
}

uint64_t __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTintViewAlpha");
}

uint64_t __62__CKFullScreenBalloonViewControllerPhone__revealTintAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTintViewAlpha");
}

- (void)updateStickersAnimated:(BOOL)a3
{
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  CKFullScreenBalloonViewControllerPhone *v33;
  id v34;
  id v35;
  BOOL v36;
  id v37;
  id v38;

  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldShowStickers");

    if (v8)
    {
      -[CKFullScreenBalloonViewControllerPhone mirrorStickerCells](self, "mirrorStickerCells");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v29 = v12;

      -[CKFullScreenBalloonViewControllerPhone mirrorStickerViews](self, "mirrorStickerViews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;

      -[CKFullScreenBalloonViewControllerPhone _parentStickerChatItemGUIDToMirrorStickerViewDictionary](self, "_parentStickerChatItemGUIDToMirrorStickerViewDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v37 = 0;
      -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "IMChatItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "guid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "associatedStickerCells:stickerChatItems:chatItemGUID:", &v38, &v37, v22);
      v23 = v38;
      v24 = v37;

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __65__CKFullScreenBalloonViewControllerPhone_updateStickersAnimated___block_invoke;
      v30[3] = &unk_1E2759400;
      v31 = v24;
      v32 = v18;
      v33 = self;
      v34 = v29;
      v35 = v17;
      v36 = a3;
      v25 = v17;
      v26 = v29;
      v27 = v18;
      v28 = v24;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v30);
      -[CKFullScreenBalloonViewControllerPhone setParentStickerCells:](self, "setParentStickerCells:", v23);
      -[CKFullScreenBalloonViewControllerPhone setParentStickerChatItems:](self, "setParentStickerChatItems:", v28);
      -[CKFullScreenBalloonViewControllerPhone setMirrorStickerCells:](self, "setMirrorStickerCells:", v26);
      -[CKFullScreenBalloonViewControllerPhone setMirrorStickerViews:](self, "setMirrorStickerViews:", v25);

    }
  }
}

void __65__CKFullScreenBalloonViewControllerPhone_updateStickersAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CKStickerTranscriptCell *v11;
  CKStickerTranscriptCell *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v6, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [CKStickerTranscriptCell alloc];
    v12 = -[CKStickerTranscriptCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKStickerTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](v12, "configureForChatItem:context:animated:animationDuration:animationCurve:", v6, 0, 0, 3, 0.0);
    -[CKAssociatedMessageTranscriptCell associatedItemView](v12, "associatedItemView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v13);

    -[CKStickerTranscriptCell updateAnimationTimerObserving](v12, "updateAnimationTimerObserving");
    objc_msgSend(v5, "associatedItemView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "transform");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
    }
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    objc_msgSend(v13, "setTransform:", v17);

    objc_msgSend(*(id *)(a1 + 48), "_updateBoundsCenterFrameForMirrorAssociatedItemView:parentStickerChatItem:", v13, v6);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);
    objc_msgSend(v13, "ck_performRevealAnimated:completion:", *(unsigned __int8 *)(a1 + 72), 0);

  }
}

- (void)showAllStickers
{
  void *v3;
  int v4;
  id v5;

  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowStickers");

  if (v4)
  {
    -[CKFullScreenBalloonViewControllerPhone mirrorStickerViews](self, "mirrorStickerViews");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_231);

  }
}

uint64_t __57__CKFullScreenBalloonViewControllerPhone_showAllStickers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 1.0);
}

- (void)setStickerVisibility:(BOOL)a3 forStickerChatItemGUID:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CKFullScreenBalloonViewControllerPhone _parentStickerChatItemGUIDToMirrorStickerViewDictionary](self, "_parentStickerChatItemGUIDToMirrorStickerViewDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ck_performHideAnimated:completion:", 0, 0);
}

- (id)_parentStickerChatItemGUIDToMirrorStickerViewDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  CKFullScreenBalloonViewControllerPhone *v14;
  id v15;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[CKFullScreenBalloonViewControllerPhone parentStickerChatItems](self, "parentStickerChatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKFullScreenBalloonViewControllerPhone parentStickerChatItems](self, "parentStickerChatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __97__CKFullScreenBalloonViewControllerPhone__parentStickerChatItemGUIDToMirrorStickerViewDictionary__block_invoke;
  v13 = &unk_1E2759448;
  v14 = self;
  v15 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __97__CKFullScreenBalloonViewControllerPhone__parentStickerChatItemGUIDToMirrorStickerViewDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "mirrorStickerViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v6, "IMChatItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, v10);

}

- (void)_updateBoundsCenterFrameForMirrorAssociatedItemView:(id)a3 parentStickerChatItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v6 = a3;
  v7 = a4;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fullScreenBalloonViewController:stickerBoundsForChatItem:", self, v7);
    objc_msgSend(v6, "setBounds:");

  }
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fullScreenBalloonViewController:stickerCenterForChatItem:", self, v7);
    objc_msgSend(v6, "setCenter:");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v6;
    objc_msgSend(v14, "internalView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    if (v14)
      objc_msgSend(v14, "transform");
    v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v23 = *MEMORY[0x1E0C9BAA8];
    v24 = v17;
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v14, "setTransform:", &v23, v25, v17, v23);
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    if (v15)
      objc_msgSend(v15, "transform");
    v20 = v19;
    v21 = v18;
    v22 = v16;
    objc_msgSend(v15, "setTransform:", &v20);
    objc_msgSend(v14, "bounds");
    objc_msgSend(v15, "setFrame:");
    v20 = v26;
    v21 = v27;
    v22 = v28;
    objc_msgSend(v14, "setTransform:", &v20);
    v20 = v23;
    v21 = v24;
    v22 = v25;
    objc_msgSend(v15, "setTransform:", &v20);

  }
}

- (void)presentStickerDetailControllerWithStickers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CKStickerDetailViewController *v9;

  v4 = a3;
  v9 = -[CKStickerDetailViewController initWithStickerChatItems:]([CKStickerDetailViewController alloc], "initWithStickerChatItems:", v4);

  -[CKStickerDetailViewController setDelegate:](v9, "setDelegate:", self);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v9);
  if (CKIsRunningInMacCatalyst())
    v6 = 7;
  else
    v6 = 6;
  objc_msgSend(v5, "setModalPresentationStyle:", v6);
  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceView:", v7);

  -[CKFullScreenBalloonViewControllerPhone presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _TtC7ChatKit24CKTapbackAttributionView *v13;
  _TtC7ChatKit24CKTapbackAttributionView *v14;
  void *v15;
  _TtC7ChatKit24CKTapbackAttributionView *v16;
  CKGroupAcknowledgmentVotingViewController *v17;
  void *v18;
  CKGroupAcknowledgmentVotingViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  -[CKFullScreenBalloonViewController viewDidLoad](&v33, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
  -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "snapshotView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CKFullScreenBalloonViewControllerPhone generateDuplicateBalloonViewForChatItem:](self, "generateDuplicateBalloonViewForChatItem:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAlpha:", 0.0);
    }
    -[CKFullScreenBalloonViewControllerPhone setBalloonView:](self, "setBalloonView:", v5);
  }
  -[CKFullScreenBalloonViewController balloonWrapperView](self, "balloonWrapperView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v5);

  if (-[CKFullScreenBalloonViewControllerPhone hideBalloonView](self, "hideBalloonView"))
  {
    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

  }
  else
  {
    -[CKFullScreenBalloonViewControllerPhone loadLivePhotoBalloonViewIfNeeded](self, "loadLivePhotoBalloonViewIfNeeded");
  }
  if (-[CKFullScreenBalloonViewController shouldShowTapbackAttribution](self, "shouldShowTapbackAttribution"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEmojiTapbacksEnabled");

    if (v12)
    {
      v13 = -[CKTapbackAttributionView initWithMessagePartChatItem:]([_TtC7ChatKit24CKTapbackAttributionView alloc], "initWithMessagePartChatItem:", v4);
      -[CKTapbackAttributionView setDelegate:](v13, "setDelegate:", self);
      -[CKFullScreenBalloonViewControllerPhone setAttributionView:](self, "setAttributionView:", v13);
      -[CKFullScreenBalloonViewControllerPhone view](self, "view");
      v14 = (_TtC7ChatKit24CKTapbackAttributionView *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenBalloonViewControllerPhone attributionView](self, "attributionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
    }
    else
    {
      v17 = [CKGroupAcknowledgmentVotingViewController alloc];
      objc_msgSend(v4, "aggregateAcknowledgmentChatItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CKGroupAcknowledgmentVotingViewController initWithMessagePartChatItem:](v17, "initWithMessagePartChatItem:", v18);
      -[CKFullScreenBalloonViewControllerPhone setAttributionViewController:](self, "setAttributionViewController:", v19);

      -[CKFullScreenBalloonViewControllerPhone attributionViewController](self, "attributionViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHidden:", 1);

      -[CKFullScreenBalloonViewControllerPhone attributionViewController](self, "attributionViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenBalloonViewControllerPhone addChildViewController:](self, "addChildViewController:", v22);

      -[CKFullScreenBalloonViewControllerPhone view](self, "view");
      v13 = (_TtC7ChatKit24CKTapbackAttributionView *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenBalloonViewControllerPhone attributionViewController](self, "attributionViewController");
      v14 = (_TtC7ChatKit24CKTapbackAttributionView *)objc_claimAutoreleasedReturnValue();
      -[CKTapbackAttributionView view](v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13;
    }
    -[CKTapbackAttributionView addSubview:](v16, "addSubview:", v15);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEmojiTapbacksEnabled");

  if (v24)
  {
    if (-[CKFullScreenBalloonViewController shouldShowTapbackPicker](self, "shouldShowTapbackPicker"))
      -[CKFullScreenBalloonViewControllerPhone initializeTapbackPicker](self, "initializeTapbackPicker");
  }
  else
  {
    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHidden:", 1);

      -[CKFullScreenBalloonViewController balloonWrapperView](self, "balloonWrapperView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubview:", v28);

    }
    -[CKFullScreenBalloonViewControllerPhone addHighlightButtonIfNeeded](self, "addHighlightButtonIfNeeded");
    -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidden:", 1);

    }
  }
  self->_shouldLayoutViews = 1;
  v34[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)-[CKFullScreenBalloonViewControllerPhone registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v31, &__block_literal_global_113_2);

}

void __53__CKFullScreenBalloonViewControllerPhone_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D39840];
  v5 = a2;
  objc_msgSend(v2, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if (v4)
    objc_msgSend(v5, "updateTintViewAlpha");
  else
    objc_msgSend(v5, "updateReplyButtonColor");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  objc_super v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmojiTapbacksEnabled");

  if ((v6 & 1) == 0)
    -[CKFullScreenBalloonViewControllerPhone performClosingAnimationsAnimated:withSendAnimation:withCompletion:](self, "performClosingAnimationsAnimated:withSendAnimation:withCompletion:", v3, v3, 0);
  v7.receiver = self;
  v7.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  -[CKFullScreenBalloonViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (CGRect)preferredTapbackLayoutFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CKFullScreenBalloonViewControllerPhone view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)votingViewTargetFrame
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double y;
  double Width;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect result;

  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemMinimumLayoutMarginsForFullScreenBalloonViewController:", self);
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = *(double *)(MEMORY[0x1E0CEA080] + 8);
    v9 = *(double *)(MEMORY[0x1E0CEA080] + 24);
  }
  -[CKFullScreenBalloonViewControllerPhone view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection");

  -[CKFullScreenBalloonViewControllerPhone preferredTapbackLayoutFrame](self, "preferredTapbackLayoutFrame");
  y = v30.origin.y;
  Width = CGRectGetWidth(v30);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v14, "isEmojiTapbacksEnabled");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((_DWORD)v10)
  {
    objc_msgSend(v15, "attributionViewMaxWidth");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributionViewMinPadding");
    v19 = v18;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attributionViewHeight");
  }
  else
  {
    objc_msgSend(v15, "messageAcknowledgementVotingViewMaxWidth");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "messageAcknowledgementVotingViewMinPadding");
    v19 = v23;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "messageAcknowledgementVotingViewHeight");
  }
  v24 = v21;

  if (v11)
    v25 = v9;
  else
    v25 = v7;
  if (v11)
    v26 = v7;
  else
    v26 = v9;
  v27 = Width - (v25 + v26);
  if (v19 >= y)
    v28 = v19;
  else
    v28 = y;
  v29 = v24;
  result.size.height = v29;
  result.size.width = v27;
  result.origin.y = v28;
  result.origin.x = v25;
  return result;
}

- (double)minimumAllowedBalloonOriginY:(CGRect)a3
{
  double width;
  double y;
  double x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MinY;
  double MaxY;
  _BOOL4 v17;
  double v18;
  double v19;
  double height;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CKFullScreenBalloonViewController shouldShowTapbackAttribution](self, "shouldShowTapbackAttribution"))
  {
    -[CKFullScreenBalloonViewControllerPhone votingViewTargetFrame](self, "votingViewTargetFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[CKFullScreenBalloonViewControllerPhone preferredTapbackLayoutFrame](self, "preferredTapbackLayoutFrame");
  MinY = CGRectGetMinY(v22);
  v23.origin.x = v8;
  v23.origin.y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  MaxY = CGRectGetMaxY(v23);
  v17 = -[CKFullScreenBalloonViewController shouldShowTapbackPicker](self, "shouldShowTapbackPicker");
  v18 = 0.0;
  if (v17)
    -[CKFullScreenBalloonViewControllerPhone balloonMinimumTopOffset:](self, "balloonMinimumTopOffset:", x, y, width, height);
  if (MaxY >= MinY)
    v19 = MaxY;
  else
    v19 = MinY;
  return v19 + v18;
}

- (double)maximumAllowedBalloonOriginY
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v13;

  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullScreenBalloonViewControllerSafeAreaLayoutFrame:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  return CGRectGetMaxY(v13);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double MaxY;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double Width;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  CGFloat v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  BOOL v94;
  double v95;
  double v96;
  double v97;
  int v98;
  void *v99;
  double v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  int v110;
  CGFloat v111;
  int v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  BOOL IsEmpty;
  double v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  void *v133;
  int v134;
  void *v135;
  char v136;
  double v137;
  void *v138;
  double v139;
  NSObject *v140;
  void *v141;
  double MinY;
  double v143;
  void *v144;
  double v145;
  void *v146;
  void *v147;
  void *v148;
  char v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  double v165;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  CGFloat v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  CGFloat v175;
  CGFloat v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  objc_super v183;
  uint8_t buf[4];
  void *v185;
  uint64_t v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;

  v186 = *MEMORY[0x1E0C80C00];
  v183.receiver = self;
  v183.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  -[CKFullScreenBalloonViewControllerPhone viewDidLayoutSubviews](&v183, sel_viewDidLayoutSubviews);
  if (self->_shouldLayoutViews)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fullScreenBalloonViewController:balloonFrameForChatItem:", self, v4);
    v181 = v5;
    v182 = v6;
    v8 = v7;
    v10 = v9;

    -[CKFullScreenBalloonViewController supplementaryLayoutContext](self, "supplementaryLayoutContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();

    if ((v4 & 1) != 0)
    {
      if (self->_hasSetInitialBalloonViewFrame)
      {
        -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "frame");
        v181 = v13;
        v182 = v14;
        v8 = v15;
        v10 = v16;

      }
      -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (double *)MEMORY[0x1E0C9D648];
      v178 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v179 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      if (CKMainScreenScale_once_94 != -1)
        dispatch_once(&CKMainScreenScale_once_94, &__block_literal_global_480);
      v19 = *(double *)&CKMainScreenScale_sMainScreenScale_94;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_94 == 0.0)
        v19 = 1.0;
      objc_msgSend(v17, "setCenter:", 1.0 / v19 * (v181 * v19 + floor((v182 * v19 - v179 * v19) * 0.5)), 1.0 / v19 * (v8 * v19 + floor((v10 * v19 - v178 * v19) * 0.5)));

      -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = *v18;
      v180 = v18[1];
      objc_msgSend(v20, "setBounds:");

      -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKMainScreenScale_once_94 != -1)
        dispatch_once(&CKMainScreenScale_once_94, &__block_literal_global_480);
      v22 = *(double *)&CKMainScreenScale_sMainScreenScale_94;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_94 == 0.0)
        v22 = 1.0;
      objc_msgSend(v21, "setCenter:", 1.0 / v22 * (v181 * v22 + floor((v182 * v22 - v179 * v22) * 0.5)), 1.0 / v22 * (v8 * v22 + floor((v10 * v22 - v178 * v22) * 0.5)));

      -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBounds:", v177, v180, v182, v10);

      -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v181 = v25;
      v182 = v26;
      v8 = v27;
      v10 = v28;

    }
    else
    {
      v179 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v180 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v177 = *MEMORY[0x1E0C9D648];
      v178 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    -[CKFullScreenBalloonViewControllerPhone view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "safeAreaLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layoutFrame");
    v168 = v32;
    v169 = v31;
    v166 = v34;
    v167 = v33;

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = objc_msgSend(v35, "isEmojiTapbacksEnabled");

    if ((_DWORD)v30)
    {
      v187.origin.x = v181;
      v187.size.width = v182;
      v187.origin.y = v8;
      v187.size.height = v10;
      MaxY = CGRectGetMaxY(v187);
      -[CKFullScreenBalloonViewControllerPhone maximumAllowedBalloonOriginY](self, "maximumAllowedBalloonOriginY");
      if (MaxY > v37)
      {
        -[CKFullScreenBalloonViewControllerPhone maximumAllowedBalloonOriginY](self, "maximumAllowedBalloonOriginY");
        v8 = v38 - v10;
      }
      -[CKFullScreenBalloonViewControllerPhone minimumAllowedBalloonOriginY:](self, "minimumAllowedBalloonOriginY:", v181, v8, v182, v10);
      if (v8 < v39)
        v8 = v39;
      -[CKFullScreenBalloonViewControllerPhone votingViewTargetFrame](self, "votingViewTargetFrame");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      -[CKFullScreenBalloonViewControllerPhone attributionView](self, "attributionView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);
    }
    else
    {
      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_opt_respondsToSelector();

      if ((v50 & 1) != 0)
      {
        -[CKFullScreenBalloonViewController delegate](self, "delegate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "fullScreenBalloonViewControllerAnchorVertialOrientation:withBalloonFrame:", self, v181, v8, v182, v10);

      }
      else
      {
        v52 = 0;
      }
      -[CKFullScreenBalloonViewControllerPhone systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
      v54 = v53;
      v56 = v55;
      -[CKFullScreenBalloonViewControllerPhone view](self, "view");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "effectiveUserInterfaceLayoutDirection");
      if (v58)
        v59 = v56;
      else
        v59 = v54;
      v174 = v59;
      if (v58)
        v60 = v54;
      else
        v60 = v56;
      v165 = v60;

      -[CKFullScreenBalloonViewControllerPhone view](self, "view");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "safeAreaLayoutGuide");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "layoutFrame");
      v172 = v64;
      v173 = v63;
      v170 = v66;
      v171 = v65;

      v188.origin.y = v172;
      v188.origin.x = v173;
      v188.size.height = v170;
      v188.size.width = v171;
      Width = CGRectGetWidth(v188);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "messageAcknowledgementVotingViewMinPadding");
      v70 = v69;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "messageAcknowledgementVotingViewMaxWidth");
      v73 = v72;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "messageAcknowledgementVotingViewHeight");
      v76 = v75;

      v77 = v179;
      v78 = v180;
      v175 = v177;
      v176 = v178;
      if (-[CKFullScreenBalloonViewController shouldShowTapbackAttribution](self, "shouldShowTapbackAttribution"))
      {
        -[CKFullScreenBalloonViewControllerPhone view](self, "view");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "safeAreaInsets");
        v78 = v80;

        v77 = Width - (v174 + v165);
        if ((_DWORD)v52 == 1)
        {
          if (v77 >= v73)
            v77 = v73;
          -[CKFullScreenBalloonViewControllerPhone view](self, "view", *(_QWORD *)&v165);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "frame");
          v83 = v82;
          if (v70 >= v78)
            v78 = v70;

          v174 = v83 * 0.5 - v77 * 0.5;
        }
        else if (v70 >= v78)
        {
          v78 = v70;
        }
        -[CKFullScreenBalloonViewControllerPhone attributionViewController](self, "attributionViewController", *(_QWORD *)&v165);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "view");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setFrame:", v174, v78, v77, v76);

        v175 = v174;
        v176 = v76;
      }
      -[CKFullScreenBalloonViewControllerPhone replyButtonHeightFromBalloon](self, "replyButtonHeightFromBalloon", *(_QWORD *)&v165);
      v87 = v86;
      v88 = v78;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "replyButtonPadding");
      v91 = v90;

      v92 = 0.0;
      if (!CKIsRunningInMacCatalyst())
        goto LABEL_44;
      -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v93 == 0;

      if (v94)
        goto LABEL_44;
      v189.origin.x = v181;
      v189.size.width = v182;
      v189.origin.y = v8;
      v189.size.height = v10;
      v95 = CGRectGetMaxY(v189);
      v190.origin.x = v177;
      v190.size.height = v178;
      v190.size.width = v179;
      v190.origin.y = v180;
      v96 = v87 + v91;
      if (v96 + v95 <= CGRectGetMaxY(v190))
      {
LABEL_44:
        v98 = 0;
      }
      else
      {
        v191.origin.x = v181;
        v191.size.width = v182;
        v191.origin.y = v8;
        v191.size.height = v10;
        v97 = CGRectGetMaxY(v191);
        v192.origin.x = v177;
        v192.size.height = v178;
        v192.size.width = v179;
        v192.origin.y = v180;
        v92 = v96 + v97 - CGRectGetMaxY(v192);
        v98 = 1;
      }
      -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      v100 = v8;
      if (v99)
      {
        -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_opt_respondsToSelector();

        if ((v102 & 1) != 0)
        {
          -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setBalloonAnchorVerticalOrientation:", v52);

        }
        -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "calculateFrameRelativeToSiblingViewFrame:withinBounds:", v181, v8, v182, v10, v173, v172, v171, v170);
        v177 = v105;
        v178 = v106;
        v179 = v107;
        v100 = v108;

        v180 = v100;
      }
      v193.origin.x = v175;
      v193.size.height = v176;
      v193.origin.y = v88;
      v193.size.width = v77;
      v109 = CGRectGetMaxY(v193) + 0.0;
      if (v100 >= v109)
      {
        v112 = v98 ^ 1;
        if (v100 - v92 >= v109)
          v112 = 1;
        v110 = v98 & v112;
      }
      else
      {
        v194.origin.x = v175;
        v194.size.height = v176;
        v194.origin.y = v88;
        v194.size.width = v77;
        v110 = 0;
        v111 = CGRectGetMaxY(v194) + 0.0 - v100;
        v8 = v8 + v111;
        v180 = v180 + v111;
      }
      -[CKFullScreenBalloonViewControllerPhone view](self, "view");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "window");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "windowScene");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "statusBarManager");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "statusBarFrame");
      v117 = v116;
      v119 = v118;
      v121 = v120;
      v123 = v122;
      v195.origin.x = v177;
      v195.size.height = v178;
      v195.size.width = v179;
      v195.origin.y = v180;
      IsEmpty = CGRectIsEmpty(v195);
      v125 = 0.0;
      if (!IsEmpty)
      {
        v196.origin.x = v117;
        v196.origin.y = v119;
        v196.size.width = v121;
        v196.size.height = v123;
        v125 = CGRectGetHeight(v196) - v180;
      }
      if (v125 <= 0.0)
        v126 = -0.0;
      else
        v126 = v125;
      if (v110)
        v127 = v92;
      else
        v127 = 0.0;

      v180 = v180 + v126 - v127;
      v8 = v8 + v126 - v127;
    }

    if (self->_hasSetInitialBalloonViewFrame)
    {
      -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "frame");
      v181 = v129;
      v182 = v130;
      v8 = v131;
      v10 = v132;

    }
    else
    {
      self->_hasSetInitialBalloonViewFrame = 1;
      -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = objc_msgSend(v133, "shouldAvoidAppCardAtInitialPresentation");

      if (v134)
      {
        -[CKFullScreenBalloonViewController delegate](self, "delegate");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = objc_opt_respondsToSelector();

        v137 = 0.0;
        if ((v136 & 1) != 0)
        {
          -[CKFullScreenBalloonViewController delegate](self, "delegate");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "_expectedAppCardAndEntryViewHeight");
          v137 = v139;

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v140 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v137);
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v185 = v141;
              _os_log_impl(&dword_18DFCD000, v140, OS_LOG_TYPE_INFO, "appCardAndEntryViewHeight: %@", buf, 0xCu);

            }
          }
        }
        v197.origin.y = v168;
        v197.origin.x = v169;
        v197.size.height = v166;
        v197.size.width = v167;
        MinY = CGRectGetMinY(v197);
        v198.origin.x = v181;
        v198.size.width = v182;
        v198.origin.y = v8;
        v198.size.height = v10;
        if (CGRectGetMinY(v198) >= MinY + 16.0)
          v143 = v8;
        else
          v143 = MinY + 16.0;
        -[CKFullScreenBalloonViewControllerPhone view](self, "view");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "frame");
        v145 = CGRectGetMaxY(v199);

        v200.origin.x = v181;
        v200.size.width = v182;
        v200.origin.y = v143;
        v200.size.height = v10;
        if (CGRectGetMaxY(v200) <= v145 - v137)
          v8 = v143;
        else
          v8 = v145 - v137 - v10;
      }
    }
    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setFrame:", v181, v8, v182, v10);

    -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setFrame:", v181, v8, v182, v10);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "isEmojiTapbacksEnabled");

    if ((v149 & 1) == 0)
    {
      -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      if (v150)
      {
        -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "view");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "setFrame:", v177, v180, v179, v178);

        -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "adjustTailRelativeSiblingViewFrame:", v181, v8, v182, v10);

      }
      -[CKFullScreenBalloonViewControllerPhone updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:](self, "updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:", v181, v8, v182, v10);
    }
    -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "calculateFrameRelativeToBalloonViewFrame");
      v157 = v156;
      v159 = v158;
      v161 = v160;
      v163 = v162;
      -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "setFrame:", v157, v159, v161, v163);

    }
  }
}

- (void)updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  _BOOL8 v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

    -[CKFullScreenBalloonViewControllerPhone updateReplyButtonSizeAndLocation:layoutRelativeToHighlightButton:](self, "updateReplyButtonSizeAndLocation:layoutRelativeToHighlightButton:", v10, x, y, width, height);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  unint64_t v6;

  -[CKFullScreenBalloonViewControllerPhone view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interfaceOrientation");

    v6 = 1 << v5;
  }
  else
  {
    v6 = 30;
  }

  return v6;
}

- (void)dismissTapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  CGPoint v15;
  CGPoint v16;
  CGRect v17;
  CGRect v18;

  v4 = a3;
  -[CKFullScreenBalloonViewControllerPhone view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v15.x = v7;
  v15.y = v9;
  v12 = CGRectContainsPoint(v17, v15);

  if (-[CKFullScreenBalloonViewController shouldShowTapbackAttribution](self, "shouldShowTapbackAttribution"))
  {
    -[CKFullScreenBalloonViewControllerPhone attributionViewController](self, "attributionViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16.x = v7;
    v16.y = v9;
    v12 |= CGRectContainsPoint(v18, v16);

  }
  if ((v12 & 1) == 0)
    -[CKFullScreenBalloonViewControllerPhone beginDismissal](self, "beginDismissal");
}

- (void)beginDismissal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  -[CKFullScreenBalloonViewController beginDismissal](&v3, sel_beginDismissal);
  -[CKFullScreenBalloonViewControllerPhone closeEmojiPicker](self, "closeEmojiPicker");
}

- (void)updateBalloonViewFrame
{
  void *v3;
  int v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[5];
  objc_super v29;
  _QWORD aBlock[5];

  if (-[CKFullScreenBalloonViewController followsParentBalloonView](self, "followsParentBalloonView"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

    if (v4)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke;
      aBlock[3] = &unk_1E274A208;
      aBlock[4] = self;
      v5 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (-[CKFullScreenBalloonViewControllerPhone animatedBalloonViewFrameUpdates](self, "animatedBalloonViewFrameUpdates"))
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.25, 0.0);
      }
      else
      {
        v5[2](v5);
      }
    }
    else
    {
      v29.receiver = self;
      v29.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
      -[CKFullScreenBalloonViewController updateBalloonViewFrame](&v29, sel_updateBalloonViewFrame);
      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fullScreenBalloonViewController:balloonFrameForChatItem:", self, v7);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;

      -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

      -[CKFullScreenBalloonViewControllerPhone livePhotoBalloonView](self, "livePhotoBalloonView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

      -[CKFullScreenBalloonViewControllerPhone updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:](self, "updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:", v9, v11, v13, v15);
      -[CKFullScreenBalloonViewControllerPhone parentStickerChatItems](self, "parentStickerChatItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke_3;
      v28[3] = &unk_1E2759490;
      v28[4] = self;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v28);

      -[CKFullScreenBalloonViewControllerPhone pickerBalloonParentView](self, "pickerBalloonParentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v21 = v20;
      v23 = v22;
      v25 = v24;

      -[CKFullScreenBalloonViewControllerPhone pickerBalloonParentViewY](self, "pickerBalloonParentViewY");
      v27 = v26;
      -[CKFullScreenBalloonViewControllerPhone pickerBalloonParentView](self, "pickerBalloonParentView");
      v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFrame:", v21, v27, v23, v25);
    }

  }
}

void __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _QWORD v26[5];
  objc_super v27;

  v27.receiver = *(id *)(a1 + 32);
  v27.super_class = (Class)CKFullScreenBalloonViewControllerPhone;
  objc_msgSendSuper2(&v27, sel_updateBalloonViewFrame);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "chatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullScreenBalloonViewController:balloonFrameForChatItem:", v3, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "balloonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  objc_msgSend(*(id *)(a1 + 32), "livePhotoBalloonView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  objc_msgSend(*(id *)(a1 + 32), "updateReplyButtonSizeAndLocationForBalloonViewFrameIfNeeded:", v6, v8, v10, v12);
  objc_msgSend(*(id *)(a1 + 32), "parentStickerChatItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke_2;
  v26[3] = &unk_1E2759490;
  v26[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v26);

  objc_msgSend(*(id *)(a1 + 32), "pickerBalloonParentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(*(id *)(a1 + 32), "pickerBalloonParentViewY");
  v24 = v23;
  objc_msgSend(*(id *)(a1 + 32), "pickerBalloonParentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v24, v20, v22);

}

void __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "mirrorStickerViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateBoundsCenterFrameForMirrorAssociatedItemView:parentStickerChatItem:", v8, v6);
}

void __64__CKFullScreenBalloonViewControllerPhone_updateBalloonViewFrame__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "mirrorStickerViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateBoundsCenterFrameForMirrorAssociatedItemView:parentStickerChatItem:", v8, v6);
}

- (void)performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  void (**v23)(_QWORD);
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  void (**v37)(_QWORD);
  _QWORD v38[5];
  id v39;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v5 = a4;
  v6 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[CKFullScreenBalloonViewControllerPhone view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_4:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        if (v6)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        v14 = _Block_copy(v8);
        *(_DWORD *)buf = 138412802;
        v42 = v13;
        v43 = 1024;
        v44 = v5;
        v45 = 2112;
        v46 = v14;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "performClosingAnimationsAnimated: %@, WithSendAnimation: %d, withCompletion:%@", buf, 0x1Cu);

      }
    }
    self->_shouldLayoutViews = 0;
    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ck_identityTransformFrame");

    -[CKFullScreenBalloonViewControllerPhone balloonYOffsetFromTranscript](self, "balloonYOffsetFromTranscript");
    if (v6)
    {
      -[CKFullScreenBalloonViewController pickerBar](self, "pickerBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v5)
        objc_msgSend(v16, "performSendAnimation:", 0);
      else
        objc_msgSend(v16, "performCancelAnimation:", 0);

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEmojiTapbacksEnabled");

    if (v19)
    {
      -[CKFullScreenBalloonViewControllerPhone attributionView](self, "attributionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dismiss");

    }
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v22 = (void (**)(_QWORD))_Block_copy(aBlock);
    v38[0] = v21;
    v38[1] = 3221225472;
    v38[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_2;
    v38[3] = &unk_1E274C2E0;
    v38[4] = self;
    v39 = v8;
    v23 = (void (**)(_QWORD))_Block_copy(v38);
    if (v6
      && !-[CKFullScreenBalloonViewControllerPhone animationsDisabledForTesting](self, "animationsDisabledForTesting"))
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEmojiTapbacksEnabled");

      if (v25)
      {
        -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "tintDismissDuration");
        v28 = v27;

        -[CKFullScreenBalloonViewControllerPhone pickerBalloonParentView](self, "pickerBalloonParentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dismiss");

      }
      else
      {
        v28 = 0.2;
      }
      -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[CKFullScreenBalloonViewControllerPhone highlightButton](self, "highlightButton");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "performHideAnimationWithDuration:completion:", v23, v28);

        v23 = 0;
      }
      v33 = (void *)MEMORY[0x1E0CEABB0];
      v36[0] = v21;
      v36[1] = 3221225472;
      v36[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_3;
      v36[3] = &unk_1E274AED0;
      v37 = v22;
      v34[0] = v21;
      v34[1] = 3221225472;
      v34[2] = __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_4;
      v34[3] = &unk_1E274C308;
      v23 = v23;
      v35 = v23;
      objc_msgSend(v33, "animateWithDuration:delay:options:animations:completion:", 0, v36, v34, v28, 0.0);

    }
    else
    {
      v22[2](v22);
      v23[2](v23);
    }

    goto LABEL_32;
  }
  v11 = CKIsRunningInMessagesNotificationExtension();

  if (v11)
    goto LABEL_4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "not performing closingAnimations: view is currently not presented", buf, 2u);
    }

  }
LABEL_32:

}

void __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "tintView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "updateAttributionViewControllerForDismissal");
  objc_msgSend(*(id *)(a1 + 32), "replyButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "replyButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

  }
}

uint64_t __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setInterfaceActions:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullScreenBalloonViewControllerDidDisappear:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "replyButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "replyButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "balloonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "balloonView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");
    CKBalloonViewReuse(v11);
    objc_msgSend(*(id *)(a1 + 32), "setBalloonView:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "highlightButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "highlightButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

  }
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fullScreenBalloonViewControllerRequestDismissKeyboardSnapshot:", *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEmojiTapbacksEnabled");

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fullScreenBalloonViewController:updateTapbackPileAppearanceAsHidden:", *(_QWORD *)(a1 + 32), 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fullScreenBalloonViewController:updateTranscriptBalloonViewAppearanceAsHidden:", *(_QWORD *)(a1 + 32), 0);

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __108__CKFullScreenBalloonViewControllerPhone_performClosingAnimationsAnimated_withSendAnimation_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateTintViewAlpha
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[CKFullScreenBalloonViewControllerPhone traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v4 == 2)
    objc_msgSend(v5, "darkModeTintAlpha");
  else
    objc_msgSend(v5, "tintAlpha");
  v7 = v6;
  -[CKFullScreenBalloonViewController tintView](self, "tintView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  char v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  id v41;

  v41 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmojiTapbacksEnabled");

  if (v5)
  {
    objc_msgSend(v41, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB890]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;

    -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = v9 - v18 + -24.0;
    if (v19 < v14)
    {
      v20 = v14 + v19 - v14;
      -[CKFullScreenBalloonViewControllerPhone minimumAllowedBalloonOriginY:](self, "minimumAllowedBalloonOriginY:", v12, v14, v16, v18);
      if (v21 >= v20)
        v20 = v21;
      -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFrame:", v12, v20, v16, v18);

      -[CKFullScreenBalloonViewControllerPhone pickerBalloonParentView](self, "pickerBalloonParentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v25 = v24;
      v27 = v26;
      v29 = v28;

      -[CKFullScreenBalloonViewControllerPhone pickerBalloonParentViewY](self, "pickerBalloonParentViewY");
      v31 = v30;
      -[CKFullScreenBalloonViewControllerPhone pickerBalloonParentView](self, "pickerBalloonParentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFrame:", v25, v31, v27, v29);

      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) != 0)
      {
        v35 = v20 - v14;
        -[CKFullScreenBalloonViewController delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "collectionView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "contentOffset");
        v39 = v38;
        objc_msgSend(v37, "contentOffset");
        objc_msgSend(v37, "setContentOffset:", v39, v40 - v35);

      }
    }
  }

}

- (void)balloonViewTapped:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5
{
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmojiTapbacksEnabled");

  if ((v7 & 1) == 0)
    -[CKFullScreenBalloonViewControllerPhone beginDismissal](self, "beginDismissal");
}

- (void)balloonViewDoubleTapped:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmojiTapbacksEnabled");

  if ((v5 & 1) == 0)
    -[CKFullScreenBalloonViewControllerPhone beginDismissal](self, "beginDismissal");
}

- (void)balloonViewLongTouched:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmojiTapbacksEnabled");

  if ((v5 & 1) == 0)
    -[CKFullScreenBalloonViewControllerPhone beginDismissal](self, "beginDismissal");
}

- (void)tapbackAttributionView:(id)a3 didTapToSaveSticker:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullScreenBalloonViewController:didTapToSaveSticker:", self, v8);

  }
}

- (void)stickerDetailViewController:(id)a3 selectedStickerPackWithAdamID:(id)a4
{
  id v5;
  void *v6;
  char v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __100__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_selectedStickerPackWithAdamID___block_invoke;
    v8[3] = &unk_1E274A108;
    v8[4] = self;
    v9 = v5;
    -[CKFullScreenBalloonViewControllerPhone dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

  }
}

void __100__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_selectedStickerPackWithAdamID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullScreenBalloonViewController:stickerPackTappedWithAdamID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullScreenBalloonViewControllerHandleDismissTap:", *(_QWORD *)(a1 + 32));

}

- (void)stickerDetailViewController:(id)a3 deletedStickerWithTransferGUID:(id)a4
{
  id v5;
  void *v6;
  char v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_deletedStickerWithTransferGUID___block_invoke;
    v8[3] = &unk_1E274A108;
    v8[4] = self;
    v9 = v5;
    -[CKFullScreenBalloonViewControllerPhone dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

  }
}

void __101__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_deletedStickerWithTransferGUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullScreenBalloonViewController:deleteStickerWithTransferGUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullScreenBalloonViewControllerHandleDismissTap:", *(_QWORD *)(a1 + 32));

}

- (void)stickerDetailViewController:(id)a3 didRequestSaveSticker:(id)a4
{
  id v5;
  void *v6;
  char v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __92__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_didRequestSaveSticker___block_invoke;
    v8[3] = &unk_1E274A108;
    v8[4] = self;
    v9 = v5;
    -[CKFullScreenBalloonViewControllerPhone dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

  }
}

void __92__CKFullScreenBalloonViewControllerPhone_stickerDetailViewController_didRequestSaveSticker___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullScreenBalloonViewController:didRequestSaveSticker:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullScreenBalloonViewControllerHandleDismissTap:", *(_QWORD *)(a1 + 32));

}

- (void)_stickerDetailViewControllerCloseButtonPressed:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__CKFullScreenBalloonViewControllerPhone__stickerDetailViewControllerCloseButtonPressed___block_invoke;
  v3[3] = &unk_1E274A208;
  v3[4] = self;
  -[CKFullScreenBalloonViewControllerPhone dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __89__CKFullScreenBalloonViewControllerPhone__stickerDetailViewControllerCloseButtonPressed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullScreenBalloonViewControllerHandleDismissTap:", *(_QWORD *)(a1 + 32));

}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke;
  v8[3] = &unk_1E274A208;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke_2;
  v7[3] = &unk_1E274A1B8;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v8, v7, 0.2, 0.0);
}

void __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "livePhotoBalloonView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __80__CKFullScreenBalloonViewControllerPhone_livePhotoView_didEndPlaybackWithStyle___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "livePhotoBalloonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setLivePhotoBalloonView:", 0);
}

- (void)disableAnimationsForTesting
{
  -[CKFullScreenBalloonViewControllerPhone setAnimationsDisabledForTesting:](self, "setAnimationsDisabledForTesting:", 1);
}

- (BOOL)shouldPresentAsTapbackKeyboardInput
{
  void *v2;
  char v3;

  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPresentAsTapbackKeyboardInput");

  return v3;
}

- (void)setupReplyButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewControllerPhone setReplyButtonBorderLayer:](self, "setReplyButtonBorderLayer:", v34);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replyButtonBorderWidth");
  objc_msgSend(v34, "setLineWidth:");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replyButtonBorderColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setStrokeColor:", objc_msgSend(v6, "cgColor"));

  objc_msgSend(v34, "setFillColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E8]));
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewControllerPhone setReplyButtonMaskLayer:](self, "setReplyButtonMaskLayer:", v7);
  v8 = (void *)MEMORY[0x1E0CEA398];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replyButtonBackgroundBlurRadius");
  objc_msgSend(v8, "effectWithBlurRadius:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v10);
  -[CKFullScreenBalloonViewControllerPhone setReplyButtonEffectView:](self, "setReplyButtonEffectView:", v11);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replyButtonColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v14);

  v15 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[CKFullScreenBalloonViewControllerPhone setReplyButtonView:](self, "setReplyButtonView:", v15);
  objc_msgSend(v15, "addSubview:", v11);
  objc_msgSend(v15, "setUserInteractionEnabled:", 0);
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMask:", v7);

  objc_msgSend(v15, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v34);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewController setReplyButton:](self, "setReplyButton:", v18);
  objc_msgSend(v18, "setAutoresizingMask:", 5);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "replyButtonEdgeInsets");
  objc_msgSend(v18, "setContentEdgeInsets:");

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel_replyButtonPressed_, 64);
  objc_msgSend(v18, "addSubview:", v15);
  objc_msgSend(v18, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentsScale:", 0.0);

  if (IMEnableInlineReplyGlyph())
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("arrowshape.turn.up.backward.fill"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:forState:", v21, 0);
    objc_msgSend(v18, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bringSubviewToFront:", v22);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v23);
  }
  else
  {
    objc_msgSend(v18, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "replyButtonFont");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v26);

    objc_msgSend(v18, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAdjustsFontForContentSizeCategory:", 1);

    CKFrameworkBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("INLINE_REPLY_ORB_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:forState:", v29, 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "theme");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "replyButtonTextColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitleColor:forState:", v30, 0);

  }
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewControllerPhone setTintViewMaskLayer:](self, "setTintViewMaskLayer:", v31);
  -[CKFullScreenBalloonViewController tintView](self, "tintView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMask:", v31);

}

- (void)updateReplyButtonSizeAndLocation:(CGRect)a3 layoutRelativeToHighlightButton:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  NSObject *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double MaxY;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  CGPath *Mutable;
  void *v63;
  CGPath *v64;
  void *v65;
  CGPath *v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  int v83;
  double v84;
  __int16 v85;
  double v86;
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v87 = *MEMORY[0x1E0C80C00];
  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeToFit");

    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v81 = v14;
    v82 = v13;

    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v79 = v17;
    v80 = v16;
    v19 = v18;
    v21 = v20;

    -[CKFullScreenBalloonViewController tintView](self, "tintView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v23;
    v26 = v25;

    if (v19 <= 0.0 || v21 <= 0.0)
    {
      if (!IMOSLoggingEnabled())
        return;
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v83 = 134218240;
        v84 = v19;
        v85 = 2048;
        v86 = v21;
        _os_log_impl(&dword_18DFCD000, v37, OS_LOG_TYPE_INFO, "Invalid reply button size, width = %f, height = %f", (uint8_t *)&v83, 0x16u);
      }
      goto LABEL_21;
    }
    v75 = v26;
    v76 = v24;
    if (v4)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "replyButtonRelativePosition");
      v29 = v28;

      -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "transcriptOrientation");

      v32 = x;
      v33 = y;
      v34 = width;
      v35 = height;
      if (v31)
        v36 = v29 + CGRectGetMaxX(*(CGRect *)&v32) - v82;
      else
        v36 = CGRectGetMinX(*(CGRect *)&v32) - v29;
      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = width;
      v91.size.height = height;
      MaxY = CGRectGetMaxY(v91);
      -[CKFullScreenBalloonViewControllerPhone traitCollection](self, "traitCollection");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "displayScale");
      v78 = round((MaxY + v21 * -0.5) * v58) / v58;

    }
    else
    {
      -[CKFullScreenBalloonViewControllerPhone replyButtonVerticalOffset](self, "replyButtonVerticalOffset");
      v77 = v38;
      v88.origin.x = x;
      v88.origin.y = y;
      v88.size.width = width;
      v88.size.height = height;
      v74 = CGRectGetMaxY(v88);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "replyButtonHorizontalOriginOffsetPercent");
      v41 = v40;
      -[CKFullScreenBalloonViewControllerPhone traitCollection](self, "traitCollection");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "displayScale");
      v44 = v43;

      -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v42) = objc_msgSend(v45, "transcriptOrientation") == 2;

      -[CKFullScreenBalloonViewControllerPhone view](self, "view");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      v78 = v74 - v77;
      v48 = round(v19 * v41 * v44) / v44;
      if ((_DWORD)v42)
      {
        objc_msgSend(v46, "layoutMargins");
        v50 = v49;

        v89.origin.x = x;
        v89.origin.y = y;
        v89.size.width = width;
        v89.size.height = height;
        v36 = fmax(v50, v48 + CGRectGetMinX(v89) - v19);
      }
      else
      {
        objc_msgSend(v46, "frame");
        v52 = v51;
        -[CKFullScreenBalloonViewControllerPhone view](self, "view");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "layoutMargins");
        v55 = v52 - v54 - v19;

        v90.origin.x = x;
        v90.origin.y = y;
        v90.size.width = width;
        v90.size.height = height;
        v36 = fmin(v55, CGRectGetMaxX(v90) - v48);
      }
    }
    v59 = fmin(v19, v21) * 0.5;
    if (v59 > 0.0)
    {
      -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setFrame:", v36, v78, v82, v81);

      -[CKFullScreenBalloonViewControllerPhone replyButtonEffectView](self, "replyButtonEffectView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setFrame:", v80, v79, v19, v21);

      Mutable = CGPathCreateMutable();
      v92.origin.x = v80;
      v92.origin.y = v79;
      v92.size.width = v19;
      v92.size.height = v21;
      CGPathAddRoundedRect(Mutable, 0, v92, v59, v59);
      -[CKFullScreenBalloonViewControllerPhone replyButtonBorderLayer](self, "replyButtonBorderLayer");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setPath:", Mutable);

      CGPathRelease(Mutable);
      v64 = CGPathCreateMutable();
      v93.origin.y = v79;
      v93.origin.x = v80;
      v93.size.width = v19;
      v93.size.height = v21;
      CGPathAddRoundedRect(v64, 0, v93, v59, v59);
      -[CKFullScreenBalloonViewControllerPhone replyButtonMaskLayer](self, "replyButtonMaskLayer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setPath:", v64);

      CGPathRelease(v64);
      v66 = CGPathCreateMutable();
      v94.origin.y = v78;
      v94.origin.x = v36;
      v94.size.height = v81;
      v94.size.width = v82;
      v95 = CGRectOffset(v94, -v76, -v75);
      v67 = v95.origin.x;
      v68 = v95.origin.y;
      v69 = v95.size.width;
      v70 = v95.size.height;
      -[CKFullScreenBalloonViewController tintView](self, "tintView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bounds");
      CGPathAddRect(v66, 0, v96);

      v97.origin.x = v67;
      v97.origin.y = v68;
      v97.size.width = v69;
      v97.size.height = v70;
      CGPathAddRoundedRect(v66, 0, v97, v59, v59);
      -[CKFullScreenBalloonViewControllerPhone tintViewMaskLayer](self, "tintViewMaskLayer");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setPath:", v66);

      -[CKFullScreenBalloonViewControllerPhone tintViewMaskLayer](self, "tintViewMaskLayer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setFillRule:", *MEMORY[0x1E0CD2B70]);

      CGPathRelease(v66);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v83 = 134217984;
        v84 = v59;
        _os_log_impl(&dword_18DFCD000, v37, OS_LOG_TYPE_INFO, "Invalid corner width for reply button, width = %f", (uint8_t *)&v83, 0xCu);
      }
LABEL_21:

    }
  }
}

- (void)updateReplyButtonColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKFullScreenBalloonViewControllerPhone replyButtonEffectView](self, "replyButtonEffectView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replyButtonColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v7);

    -[CKFullScreenBalloonViewControllerPhone replyButtonBorderLayer](self, "replyButtonBorderLayer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replyButtonBorderColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v10, "cgColor"));

  }
}

- (double)replyButtonVerticalOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyButtonVerticalOriginOffsetPercent");
  v10 = v7 * v9;
  -[CKFullScreenBalloonViewControllerPhone traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = round(v10 * v12) / v12;

  return v13;
}

- (double)replyButtonHeightFromBalloon
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[CKFullScreenBalloonViewControllerPhone replyButtonVerticalOffset](self, "replyButtonVerticalOffset");
  v5 = v4;
  -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 - v5;

  return v8;
}

- (void)messageHightlightButtonWasClicked:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(a3, "isHighlighted");
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullScreenBalloonViewController:sendMessageHighlight:forChatItem:", self, v4, v7);

  }
}

- (void)messageHightlightButtonDidFinishAnimating:(id)a3
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a3, "removeFromSuperview");
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullScreenBalloonViewControllerMessageHighlightButtonDidFinishAnimating:", self);

  }
}

- (CGRect)messageHightlightButtonBalloonViewFrame:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CKFullScreenBalloonViewControllerPhone balloonView](self, "balloonView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ck_identityTransformFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)messageHightlightButtonReplyButtonFrame:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[CKFullScreenBalloonViewController replyButton](self, "replyButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKFullScreenBalloonViewController replyButton](self, "replyButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (char)messageHightlightButtonTranscriptOrientation:(id)a3
{
  void *v3;
  char v4;

  -[CKFullScreenBalloonViewController chatItem](self, "chatItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transcriptOrientation");

  return v4;
}

- (void)addHighlightButtonIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  CKMessageHighlightButton *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if ((v4 & 1) == 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "fullScreenBalloonViewControllerShouldShowHightlightButton:forChatItem:", self, v12);

      if (v8)
      {
        v9 = -[CKMessageHighlightButton initWithInitialState:]([CKMessageHighlightButton alloc], "initWithInitialState:", objc_msgSend(v12, "syndicationType") != 0);
        -[CKMessageHighlightButton setDelegate:](v9, "setDelegate:", self);
        -[CKFullScreenBalloonViewController balloonWrapperView](self, "balloonWrapperView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", v9);

        -[CKFullScreenBalloonViewControllerPhone view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bringSubviewToFront:", v9);

        -[CKFullScreenBalloonViewControllerPhone setHighlightButton:](self, "setHighlightButton:", v9);
      }

    }
  }
}

- (CKTapbackPickerBalloonParentView)pickerBalloonParentView
{
  return self->_pickerBalloonParentView;
}

- (void)setPickerBalloonParentView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerBalloonParentView, a3);
}

- (CKTapbackPickerViewController)tapbackPickerViewController
{
  return self->_tapbackPickerViewController;
}

- (void)setTapbackPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackPickerViewController, a3);
}

- (UIViewController)attributionViewController
{
  return self->_attributionViewController;
}

- (void)setAttributionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_attributionViewController, a3);
}

- (_TtC7ChatKit24CKTapbackAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionView, a3);
}

- (UIView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (NSArray)interfaceActions
{
  return self->_interfaceActions;
}

- (void)setInterfaceActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (CKLivePhotoBalloonView)livePhotoBalloonView
{
  return self->_livePhotoBalloonView;
}

- (void)setLivePhotoBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoBalloonView, a3);
}

- (UIVisualEffectView)replyButtonEffectView
{
  return self->_replyButtonEffectView;
}

- (void)setReplyButtonEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_replyButtonEffectView, a3);
}

- (CAShapeLayer)replyButtonBorderLayer
{
  return self->_replyButtonBorderLayer;
}

- (void)setReplyButtonBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_replyButtonBorderLayer, a3);
}

- (CAShapeLayer)replyButtonMaskLayer
{
  return self->_replyButtonMaskLayer;
}

- (void)setReplyButtonMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_replyButtonMaskLayer, a3);
}

- (CAShapeLayer)tintViewMaskLayer
{
  return self->_tintViewMaskLayer;
}

- (void)setTintViewMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_tintViewMaskLayer, a3);
}

- (UIView)replyButtonView
{
  return self->_replyButtonView;
}

- (void)setReplyButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_replyButtonView, a3);
}

- (double)balloonYOffsetFromTranscript
{
  return self->_balloonYOffsetFromTranscript;
}

- (void)setBalloonYOffsetFromTranscript:(double)a3
{
  self->_balloonYOffsetFromTranscript = a3;
}

- (BOOL)animationsDisabledForTesting
{
  return self->_animationsDisabledForTesting;
}

- (void)setAnimationsDisabledForTesting:(BOOL)a3
{
  self->_animationsDisabledForTesting = a3;
}

- (CKMessageHighlightButton)highlightButton
{
  return self->_highlightButton;
}

- (void)setHighlightButton:(id)a3
{
  objc_storeStrong((id *)&self->_highlightButton, a3);
}

- (BOOL)hideBalloonView
{
  return self->_hideBalloonView;
}

- (void)setHideBalloonView:(BOOL)a3
{
  self->_hideBalloonView = a3;
}

- (BOOL)hasSetInitialBalloonViewFrame
{
  return self->_hasSetInitialBalloonViewFrame;
}

- (void)setHasSetInitialBalloonViewFrame:(BOOL)a3
{
  self->_hasSetInitialBalloonViewFrame = a3;
}

- (BOOL)animatedBalloonViewFrameUpdates
{
  return self->_animatedBalloonViewFrameUpdates;
}

- (void)setAnimatedBalloonViewFrameUpdates:(BOOL)a3
{
  self->_animatedBalloonViewFrameUpdates = a3;
}

- (NSArray)parentStickerCells
{
  return self->_parentStickerCells;
}

- (void)setParentStickerCells:(id)a3
{
  objc_storeStrong((id *)&self->_parentStickerCells, a3);
}

- (NSArray)parentStickerChatItems
{
  return self->_parentStickerChatItems;
}

- (void)setParentStickerChatItems:(id)a3
{
  objc_storeStrong((id *)&self->_parentStickerChatItems, a3);
}

- (NSArray)mirrorStickerCells
{
  return self->_mirrorStickerCells;
}

- (void)setMirrorStickerCells:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1280);
}

- (NSArray)mirrorStickerViews
{
  return self->_mirrorStickerViews;
}

- (void)setMirrorStickerViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorStickerViews, 0);
  objc_storeStrong((id *)&self->_mirrorStickerCells, 0);
  objc_storeStrong((id *)&self->_parentStickerChatItems, 0);
  objc_storeStrong((id *)&self->_parentStickerCells, 0);
  objc_storeStrong((id *)&self->_highlightButton, 0);
  objc_storeStrong((id *)&self->_replyButtonView, 0);
  objc_storeStrong((id *)&self->_tintViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_replyButtonMaskLayer, 0);
  objc_storeStrong((id *)&self->_replyButtonBorderLayer, 0);
  objc_storeStrong((id *)&self->_replyButtonEffectView, 0);
  objc_storeStrong((id *)&self->_livePhotoBalloonView, 0);
  objc_storeStrong((id *)&self->_interfaceActions, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_attributionViewController, 0);
  objc_storeStrong((id *)&self->_tapbackPickerViewController, 0);
  objc_storeStrong((id *)&self->_pickerBalloonParentView, 0);
}

- (void)initializeTapbackPicker
{
  CKFullScreenBalloonViewControllerPhone *v2;

  v2 = self;
  sub_18E62FA98();

}

- (void)showTapbackPicker
{
  CKFullScreenBalloonViewControllerPhone *v2;

  v2 = self;
  sub_18E62FDAC();

}

- (double)pickerBalloonParentViewY
{
  CKFullScreenBalloonViewControllerPhone *v2;
  double v3;
  double v4;

  v2 = self;
  sub_18E630654();
  v4 = v3;

  return v4;
}

- (void)updateAttributionViewControllerForAppearance
{
  UIViewController *v2;
  UIViewController *v3;
  UIView *v4;
  CKFullScreenBalloonViewControllerPhone *v5;
  CKFullScreenBalloonViewControllerPhone *v6;
  CKFullScreenBalloonViewControllerPhone *v7;

  v7 = self;
  v2 = -[CKFullScreenBalloonViewControllerPhone attributionViewController](v7, sel_attributionViewController);
  if (!v2)
  {
    v6 = v7;
    goto LABEL_5;
  }
  v3 = v2;
  -[CKFullScreenBalloonViewControllerPhone votingViewTargetFrame](v7, sel_votingViewTargetFrame);
  v4 = -[UIViewController view](v3, sel_view);
  if (v4)
  {
    v5 = (CKFullScreenBalloonViewControllerPhone *)v4;
    UIRectGetCenter();
    -[CKFullScreenBalloonViewControllerPhone setCenter:](v5, sel_setCenter_);

    v6 = v5;
LABEL_5:

    return;
  }
  __break(1u);
}

- (void)showAttributionViewController:(BOOL)a3
{
  CKFullScreenBalloonViewControllerPhone *v4;

  v4 = self;
  sub_18E630898(a3);

}

- (void)updateAttributionViewControllerForDismissal
{
  CKFullScreenBalloonViewControllerPhone *v2;

  v2 = self;
  sub_18E630A98();

}

- (void)insertSticker:(id)a3
{
  id v5;
  CKFullScreenBalloonViewControllerPhone *v6;

  v5 = a3;
  v6 = self;
  sub_18E630C0C(a3);

}

- (void)sendTouchBarTapback:(int64_t)a3
{
  CKFullScreenBalloonViewControllerPhone *v4;

  v4 = self;
  sub_18E630E70(a3);

}

- (double)balloonMinimumTopOffset:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CKFullScreenBalloonViewControllerPhone *v7;
  double v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_18E63152C(x, y, width, height);

  return v8;
}

- (id)generateDuplicateBalloonViewForChatItem:(id)a3
{
  id v3;
  CKFullScreenBalloonViewControllerPhone *v4;
  id v5;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = sub_18E63179C((uint64_t)v5, 0, 256);

  }
  return v3;
}

- (void)tapbackPickerViewController:(id)a3 didSelectTapback:(id)a4
{
  id v6;
  id v7;
  CKFullScreenBalloonViewControllerPhone *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E634E20((uint64_t)v7, (SEL *)&selRef_fullScreenBalloonViewController_didSelectTapback_, "didSelectTapback: during double-tap");

}

- (void)tapbackPickerViewController:(id)a3 didDeselectTapback:(id)a4
{
  id v6;
  id v7;
  CKFullScreenBalloonViewControllerPhone *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E634E20((uint64_t)v7, (SEL *)&selRef_fullScreenBalloonViewController_didDeselectTapback_, "didDeselectTapback: during double-tap");

}

- (id)contextualCKChatItemsForTapbackPickerViewController:(id)a3
{
  CKFullScreenBalloonViewControllerPhone *v4;
  CKFullScreenBalloonViewControllerPhone *v5;
  CKFullScreenBalloonViewControllerDelegate *v6;
  CKFullScreenBalloonViewControllerPhone *v7;
  void *v8;

  v4 = (CKFullScreenBalloonViewControllerPhone *)a3;
  v5 = self;
  v6 = -[CKFullScreenBalloonViewController delegate](v5, sel_delegate);
  if (v6)
  {
    v7 = (CKFullScreenBalloonViewControllerPhone *)-[CKFullScreenBalloonViewControllerDelegate contextualChatItemsForFullScreenBalloonViewController:](v6, sel_contextualChatItemsForFullScreenBalloonViewController_, v5);
    swift_unknownObjectRelease();
    sub_18E53AAA0();
    sub_18E768AE0();

    v4 = v5;
    v5 = v7;
  }

  sub_18E53AAA0();
  v8 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)smartEmojiResponses:(id)a3 chatItem:(id)a4
{
  id v6;
  CKFullScreenBalloonViewControllerPhone *v7;
  id v8;
  CKFullScreenBalloonViewControllerDelegate *v9;
  CKFullScreenBalloonViewControllerDelegate *v10;
  CKFullScreenBalloonViewControllerPhone *v11;
  void *v12;

  v6 = a3;
  v7 = self;
  v8 = a4;
  v9 = -[CKFullScreenBalloonViewController delegate](v7, sel_delegate);
  if (!v9)
    goto LABEL_5;
  v10 = v9;
  if ((-[CKFullScreenBalloonViewControllerDelegate respondsToSelector:](v9, sel_respondsToSelector_, sel_fullScreenBalloonViewControllerSmartEmojiResponses_) & 1) == 0)
  {
    swift_unknownObjectRelease();
LABEL_5:

    goto LABEL_6;
  }
  v11 = (CKFullScreenBalloonViewControllerPhone *)-[CKFullScreenBalloonViewControllerDelegate fullScreenBalloonViewControllerSmartEmojiResponses:](v10, sel_fullScreenBalloonViewControllerSmartEmojiResponses_, v7);
  sub_18E768AE0();

  swift_unknownObjectRelease();
  v7 = v11;
LABEL_6:

  v12 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v12;
}

- (void)tapbackPickerBalloonParentView:(id)a3 didInsertTapback:(id)a4
{
  id v6;
  id v7;
  CKFullScreenBalloonViewControllerPhone *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CKFullScreenBalloonViewControllerPhone.tapbackPickerBalloonParentView(_:didInsertTapback:)((uint64_t)v6, (uint64_t)v7);

}

- (id)shouldShowStickerSuggestionsFor:(void *)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a1;
  v6 = objc_msgSend(v5, sel_delegate);
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(v6, sel_respondsToSelector_, sel_fullScreenBalloonViewControllerShouldEnableStickerTapbacks_) & 1) != 0)
    {
      v8 = objc_msgSend(v7, sel_fullScreenBalloonViewControllerShouldEnableStickerTapbacks_, v5);

      swift_unknownObjectRelease();
      return v8;
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
  return 0;
}

- (id)textInputContextIdentifier:(id)a3
{
  id v4;
  CKFullScreenBalloonViewControllerPhone *v5;
  CKFullScreenBalloonViewControllerDelegate *v6;
  CKFullScreenBalloonViewControllerDelegate *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = self;
  v6 = -[CKFullScreenBalloonViewController delegate](v5, sel_delegate);
  if (!v6)
  {

    goto LABEL_7;
  }
  v7 = v6;
  if ((-[CKFullScreenBalloonViewControllerDelegate respondsToSelector:](v6, sel_respondsToSelector_, sel_textInputContextIdentifierForFullScreenBalloonViewController_) & 1) == 0|| (v8 = -[CKFullScreenBalloonViewControllerDelegate textInputContextIdentifierForFullScreenBalloonViewController:](v7, sel_textInputContextIdentifierForFullScreenBalloonViewController_, v5)) == 0)
  {

    swift_unknownObjectRelease();
LABEL_7:
    v10 = 0;
    return v10;
  }
  v9 = v8;
  sub_18E768984();

  swift_unknownObjectRelease();
  v10 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)tapbackPickerBalloonParentView:(id)a3 requestedPresentPlugin:(id)a4 payloadID:(id)a5
{
  uint64_t v7;
  id v8;
  CKFullScreenBalloonViewControllerDelegate *v9;
  CKFullScreenBalloonViewControllerDelegate *v10;
  void *v11;
  void *v12;
  CKFullScreenBalloonViewControllerPhone *v13;

  if (a4)
    v7 = sub_18E76887C();
  else
    v7 = 0;
  sub_18E768984();
  v8 = a3;
  v13 = self;
  v9 = -[CKFullScreenBalloonViewController delegate](v13, sel_delegate);
  if (!v9)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v10 = v9;
  if ((-[CKFullScreenBalloonViewControllerDelegate respondsToSelector:](v9, sel_respondsToSelector_, sel_fullScreenBalloonViewController_requestedPresentPlugin_withPayloadID_) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  if (v7)
    v11 = (void *)sub_18E768864();
  else
    v11 = 0;
  v12 = (void *)sub_18E768954();
  -[CKFullScreenBalloonViewControllerDelegate fullScreenBalloonViewController:requestedPresentPlugin:withPayloadID:](v10, sel_fullScreenBalloonViewController_requestedPresentPlugin_withPayloadID_, v13, v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

LABEL_13:
}

- (void)tapbackPickerBalloonParentViewRequestedAppCardDismiss:(id)a3
{
  sub_18E6330D8(self, (uint64_t)a2, a3, (SEL *)&selRef_fullScreenBalloonViewControllerRequestedAppCardDismiss_);
}

- (void)tapbackPickerBalloonParentViewRequestedShowEmojiKeyboard:(id)a3
{
  sub_18E6330D8(self, (uint64_t)a2, a3, (SEL *)&selRef_fullScreenBalloonViewControllerWillTransitionToKeyboardInput_);
}

- (void)tapbackPickerBalloonParentViewReturningToSuggestionPicker:(id)a3
{
  sub_18E6330D8(self, (uint64_t)a2, a3, (SEL *)&selRef_fullScreenBalloonViewControllerWillReturnToSuggestionsPicker_);
}

- (id)tapbackPickerBalloonParentViewTapbackPileView:(id)a3
{
  id v4;
  CKFullScreenBalloonViewControllerPhone *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _sSo38CKFullScreenBalloonViewControllerPhoneC7ChatKitE013tapbackPickerc6Parentd11TapbackPileD0ySo025CKAggregateAcknowledgmentcD0CSgAC0ljckD0CF_0();

  return v6;
}

- (id)tapbackPickerBalloonParentViewTapbackBackingBalloon:(id)a3
{
  id v4;
  CKFullScreenBalloonViewControllerPhone *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _sSo38CKFullScreenBalloonViewControllerPhoneC7ChatKitE013tapbackPickerc6Parentd14TapbackBackingC0ySo6UIViewCSgAC0ljckD0CF_0();

  return v6;
}

- (id)tapbackPickerBalloonParentViewTapbackTintableMessageBalloon:(id)a3
{
  id v4;
  CKFullScreenBalloonViewControllerPhone *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = CKFullScreenBalloonViewControllerPhone.tapbackPickerBalloonParentViewTapbackTintableMessageBalloon(_:)((uint64_t)v4);

  return v6;
}

- (void)keyCommandSelectTapback:(id)a3
{
  id v4;
  CKFullScreenBalloonViewControllerPhone *v5;

  v4 = a3;
  v5 = self;
  sub_18E6335B4(v4);

}

@end

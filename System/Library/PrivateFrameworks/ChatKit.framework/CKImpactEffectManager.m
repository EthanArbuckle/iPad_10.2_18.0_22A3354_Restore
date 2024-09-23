@implementation CKImpactEffectManager

+ (id)effectIdentifiers
{
  if (effectIdentifiers_onceToken != -1)
    dispatch_once(&effectIdentifiers_onceToken, &__block_literal_global_124);
  return (id)effectIdentifiers_effects;
}

void __42__CKImpactEffectManager_effectIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.MobileSMS.expressivesend.invisibleink");
  v2[1] = CFSTR("com.apple.MobileSMS.expressivesend.gentle");
  v2[2] = CFSTR("com.apple.MobileSMS.expressivesend.loud");
  v2[3] = CFSTR("com.apple.MobileSMS.expressivesend.impact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)effectIdentifiers_effects;
  effectIdentifiers_effects = v0;

}

+ (id)maskingStringForID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.impact")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_IMPACT_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.loud")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_LOUD_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.gentle")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_GENTLE_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_INVISIBLE_INK_MESSAGE");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.focus")))
    {
      v7 = 0;
      goto LABEL_12;
    }
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_FOCUS_MESSAGE");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v7;
}

+ (BOOL)identifierIsValidImpactEffect:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.impact")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.loud")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.gentle")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.focus")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.pop"));
  }

  return v4;
}

+ (BOOL)identifierIsAnimatedImpactEffect:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (objc_msgSend(a1, "identifierIsValidImpactEffect:", v4))
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

+ (BOOL)identifierShouldPlayInWindow:(id)a3
{
  int v3;

  v3 = objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.impact"));
  if (v3)
    LOBYTE(v3) = CKIsRunningInMessages() != 0;
  return v3;
}

+ (id)localizedEffectNameForEffectWithIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = localizedEffectNameForEffectWithIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&localizedEffectNameForEffectWithIdentifier__onceToken, &__block_literal_global_76_3);
  objc_msgSend((id)localizedEffectNameForEffectWithIdentifier__effectNames, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __68__CKImpactEffectManager_localizedEffectNameForEffectWithIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("com.apple.MobileSMS.expressivesend.invisibleink");
  CKFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_INVISIBLE_INK_NAME_NORMAL_CASE"), &stru_1E276D870, CFSTR("ChatKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = CFSTR("com.apple.MobileSMS.expressivesend.gentle");
  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_GENTLE_NAME_NORMAL_CASE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("com.apple.MobileSMS.expressivesend.loud");
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_LOUD_NAME_NORMAL_CASE"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("com.apple.MobileSMS.expressivesend.impact");
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_IMPACT_NAME_NORMAL_CASE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)localizedEffectNameForEffectWithIdentifier__effectNames;
  localizedEffectNameForEffectWithIdentifier__effectNames = v8;

}

- (CKImpactEffectManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKImpactEffectManager;
  return -[CKImpactEffectManager init](&v3, sel_init);
}

- (void)animateMessages:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expressiveSendStyleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImpactEffectManager _animateLastMessage:withEffectIdentifier:beginAnimationFromTranscriptPresentedState:](self, "_animateLastMessage:withEffectIdentifier:beginAnimationFromTranscriptPresentedState:", v5, v4, 0);

}

- (void)animateMessages:(id)a3 withEffectIdentifier:(id)a4 beginAnimationFromTranscriptPresentedState:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKImpactEffectManager _animateLastMessage:withEffectIdentifier:beginAnimationFromTranscriptPresentedState:](self, "_animateLastMessage:withEffectIdentifier:beginAnimationFromTranscriptPresentedState:", v9, v8, v5);

}

- (void)setupAudioPlayerWithURL:(id)a3
{
  id v4;
  CKImpactEffectMediaObject *v5;
  CKAudioController *v6;
  void *v7;
  CKAudioController *v8;
  CKAudioController *audioController;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CKImpactEffectMediaObject initWithImpactEffectAudioFileURL:]([CKImpactEffectMediaObject alloc], "initWithImpactEffectAudioFileURL:", v4);

  v6 = [CKAudioController alloc];
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKAudioController initWithMediaObjects:](v6, "initWithMediaObjects:", v7);
  audioController = self->_audioController;
  self->_audioController = v8;

  -[CKAudioController setShouldUseAVPlayer:](self->_audioController, "setShouldUseAVPlayer:", CKSupportsAdvancedHaptics());
  -[CKAudioController setDelegate:](self->_audioController, "setDelegate:", self);
  -[CKAudioController setShouldStopPlayingWhenSilent:](self->_audioController, "setShouldStopPlayingWhenSilent:", 1);
  -[CKAudioController setShouldDuckOthers:](self->_audioController, "setShouldDuckOthers:", 0);
  -[CKAudioController setShouldUseSpeaker:](self->_audioController, "setShouldUseSpeaker:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__audioSessionOptionsWillChange_, CFSTR("CKAudioSessionControllerSessionOptionsWillChangeNotification"), v11);

}

- (void)playSoundForEffectIdentifier:(id)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.pop")) & 1) != 0)
  {
    v4 = CFSTR("Pop");
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.impact")))
      goto LABEL_8;
    v4 = CFSTR("Slam");
  }
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("m4r"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKImpactEffectManager setupAudioPlayerWithURL:](self, "setupAudioPlayerWithURL:", v6);
  -[CKAudioController prepareToPlay](self->_audioController, "prepareToPlay");
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.pop")) & 1) == 0)
    -[CKAudioController play](self->_audioController, "play");

LABEL_8:
}

- (void)playSoundForPopAnimation
{
  -[CKAudioController play](self->_audioController, "play");
}

- (void)playUndoSendAnimationForChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  NSString *undoSendChatItemGUID;
  void *v14;

  v4 = a3;
  -[CKImpactEffectManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewControllerForImpactEffectManager:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "chatItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "__ck_indexOfPartOfMessage:withMessagePartIndex:", v8, objc_msgSend(v4, "index"));
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKImpactEffectManager playUndoSendAnimationForChatItem:].cold.1(v10);
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject IMChatItem](v10, "IMChatItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "guid");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    undoSendChatItemGUID = self->_undoSendChatItemGUID;
    self->_undoSendChatItemGUID = v12;

  }
  objc_msgSend(v4, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImpactEffectManager _animateLastMessage:withEffectIdentifier:beginAnimationFromTranscriptPresentedState:](self, "_animateLastMessage:withEffectIdentifier:beginAnimationFromTranscriptPresentedState:", v14, CFSTR("com.apple.MobileSMS.expressivesend.pop"), 0);

}

- (void)_animateLastMessage:(id)a3 withEffectIdentifier:(id)a4 beginAnimationFromTranscriptPresentedState:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v21 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "fileTransferGUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
      objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v14, "transferForGUID:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v14) = +[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForFileTransfer:](CKCommSafetyHelper, "shouldDisableTranscriptCapabilitiesForFileTransfer:", v15);
      if ((v14 & 1) != 0)
        goto LABEL_19;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  if (!-[CKImpactEffectManager isAnimating](self, "isAnimating")
    && !-[CKImpactEffectManager isDisabled](self, "isDisabled")
    && +[CKImpactEffectManager identifierIsAnimatedImpactEffect:](CKImpactEffectManager, "identifierIsAnimatedImpactEffect:", v7))
  {
    -[CKImpactEffectManager playSoundForEffectIdentifier:](self, "playSoundForEffectIdentifier:", v7);
    if (_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__onceToken != -1)
      dispatch_once(&_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__onceToken, &__block_literal_global_96_1);
    objc_msgSend((id)_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator, "setAnimationDelegate:", self);
    if (+[CKImpactEffectManager identifierShouldPlayInWindow:](CKImpactEffectManager, "identifierShouldPlayInWindow:", v7))
    {
      -[CKImpactEffectManager _renderEffectInWindow](self, "_renderEffectInWindow");
    }
    -[CKImpactEffectManager _sendAnimationContextForIdentifier:message:isSender:beginAnimationFromTranscriptPresentedState:](self, "_sendAnimationContextForIdentifier:message:isSender:beginAnimationFromTranscriptPresentedState:", v7, v6, objc_msgSend(v6, "isFromMe"), v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImpactEffectManager expressiveSendAnimationBackdrop](self, "expressiveSendAnimationBackdrop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackdropLayer:", v16);

    -[CKImpactEffectManager delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendAnimationManagerWillStartAnimation:context:", self, v8);

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.pop")))
    {
      -[CKImpactEffectManager delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "collectionViewControllerForImpactEffectManager:", self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContainerView:", v20);

    }
    objc_msgSend((id)_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator, "beginAnimationWithSendAnimationContext:", v8);
LABEL_19:

  }
}

void __109__CKImpactEffectManager__animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState___block_invoke()
{
  CKChatControllerDummyAnimator *v0;
  void *v1;

  v0 = objc_alloc_init(CKChatControllerDummyAnimator);
  v1 = (void *)_animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator;
  _animateLastMessage_withEffectIdentifier_beginAnimationFromTranscriptPresentedState__sAnimator = (uint64_t)v0;

}

- (void)_renderEffectInView
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  -[CKImpactEffectManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewControllerForImpactEffectManager:", self);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  v5 = objc_alloc_init(MEMORY[0x1E0CEA970]);
  objc_msgSend(v5, "setClipsToBounds:", 0);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[CKImpactEffectManager setExpressiveSendScrollView:](self, "setExpressiveSendScrollView:", v5);
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  objc_msgSend(v19, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transcriptCollectionViewControllerOuterEffectPresentingView:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  objc_msgSend(v19, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v5, "setFrame:", v12, v14, v16, v18);
}

- (void)_renderEffectInWindow
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[CKImpactEffectManager expressiveSendAnimationWindow](self, "expressiveSendAnimationWindow");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CKImpactEffectManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionViewControllerForImpactEffectManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_alloc_init(MEMORY[0x1E0CEAC18]);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v6);

    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWindowScene:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
    v11 = objc_alloc_init(MEMORY[0x1E0CEA970]);
    objc_msgSend(v11, "setClipsToBounds:", 0);
    objc_msgSend(v11, "setAutoresizingMask:", 18);
    -[CKImpactEffectManager setExpressiveSendScrollView:](self, "setExpressiveSendScrollView:", v11);
    objc_msgSend(v10, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v11);

    objc_msgSend(v3, "setRootViewController:", v10);
    objc_msgSend(v3, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", &unk_1E28708B8, CFSTR("inputRadius"));
    objc_msgSend(v13, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    v14 = objc_alloc_init(MEMORY[0x1E0CD2708]);
    objc_msgSend(v14, "setAllowsGroupBlending:", 0);
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFilters:", v15);

    objc_msgSend(v3, "rootViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertSublayer:atIndex:", v14, 0);

    -[CKImpactEffectManager setExpressiveSendAnimationBackdrop:](self, "setExpressiveSendAnimationBackdrop:", v14);
  }
  -[CKImpactEffectManager setExpressiveSendAnimationWindow:](self, "setExpressiveSendAnimationWindow:", v3);
  -[CKImpactEffectManager _sizeAnimationWindow](self, "_sizeAnimationWindow");
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)matchScrollViewOffset:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[CKImpactEffectManager expressiveSendScrollView](self, "expressiveSendScrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v9, "setContentOffset:", v6, v8);
}

- (void)stopAllEffects
{
  -[CKImpactEffectManager stopPlayingSound](self, "stopPlayingSound");
  -[CKImpactEffectManager _cleanupExpressiveSendComponents](self, "_cleanupExpressiveSendComponents");
}

- (void)_sizeAnimationWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[CKImpactEffectManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewControllerForImpactEffectManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  -[CKImpactEffectManager expressiveSendAnimationWindow](self, "expressiveSendAnimationWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  objc_msgSend(v6, "convertRect:toView:", 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationControllerWindowLevel");
  objc_msgSend(v5, "setLevel:");

  objc_msgSend(v31, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  objc_msgSend(v16, "convertRect:toView:", 0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v5, "rootViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  -[CKImpactEffectManager expressiveSendAnimationBackdrop](self, "expressiveSendAnimationBackdrop");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  objc_msgSend(v27, "setFrame:");

}

- (id)_sendAnimationContextForIdentifier:(id)a3 message:(id)a4 isSender:(BOOL)a5 beginAnimationFromTranscriptPresentedState:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  CKImpactEffectManager *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  int v49;
  double v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  id v70;
  _BOOL4 v71;
  _BOOL4 v72;
  id v73;
  void *v74;
  CKSendAnimationContext *v75;
  CKImpactEffectManager *v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t i;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[16];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  _QWORD v106[4];
  id v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  id v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v71 = a6;
  v72 = a5;
  v120 = *MEMORY[0x1E0C80C00];
  v73 = a3;
  v8 = a4;
  v75 = objc_alloc_init(CKSendAnimationContext);
  v76 = self;
  -[CKImpactEffectManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionViewControllerForImpactEffectManager:", v76);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatItems");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__43;
  v113 = __Block_byref_object_dispose__43;
  v114 = 0;
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __120__CKImpactEffectManager__sendAnimationContextForIdentifier_message_isSender_beginAnimationFromTranscriptPresentedState___block_invoke;
  v106[3] = &unk_1E2755CB8;
  v70 = v8;
  v107 = v70;
  v108 = &v109;
  objc_msgSend(v74, "enumerateObjectsWithOptions:usingBlock:", 2, v106);
  v105 = 0;
  -[CKImpactEffectManager _visibleCells:aboveItem:](v76, "_visibleCells:aboveItem:", &v105, v110[5]);
  v11 = v105;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v11;
  v83 = v12;
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
  if (v79)
  {
    v78 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v79; ++i)
      {
        if (*(_QWORD *)v102 != v78)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        objc_msgSend(v14, "subviews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
        if (v16)
        {
          v80 = v14;
          v17 = 0;
          v84 = v15;
          v86 = *(_QWORD *)v98;
          do
          {
            v18 = 0;
            v19 = v17;
            do
            {
              if (*(_QWORD *)v98 != v86)
                objc_enumerationMutation(v84);
              v17 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * v18);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v95 = 0u;
                v96 = 0u;
                v93 = 0u;
                v94 = 0u;
                objc_msgSend(v17, "subviews");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (id)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
                if (v21)
                {
                  v22 = v13;
                  v23 = *(_QWORD *)v94;
                  while (2)
                  {
                    for (j = 0; j != v21; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v94 != v23)
                        objc_enumerationMutation(v20);
                      v25 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v21 = v25;
                        goto LABEL_23;
                      }
                    }
                    v21 = (id)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
                    if (v21)
                      continue;
                    break;
                  }
LABEL_23:
                  v12 = v83;
                  v13 = v22;
                }

              }
              else
              {
                v21 = 0;
              }
              objc_msgSend(v12, "addObject:", v17);
              if (v21)
              {
                objc_msgSend(v13, "addObject:", v21);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v26);

              }
              ++v18;
              v19 = v17;
            }
            while (v18 != v16);
            v16 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
          }
          while (v16);

          v14 = v80;
          v15 = v84;
        }

      }
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
    }
    while (v79);
  }

  v27 = v76;
  if (+[CKImpactEffectManager identifierShouldPlayInWindow:](CKImpactEffectManager, "identifierShouldPlayInWindow:", v73)&& objc_msgSend(v12, "count"))
  {
    -[CKImpactEffectManager delegate](v76, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "collectionViewControllerForImpactEffectManager:", v76);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "balloonViewForChatItem:", v110[5]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "chatItemForCell:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

    -[CKImpactEffectManager expressiveSendAnimationBalloon](v76, "expressiveSendAnimationBalloon");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[CKImpactEffectManager expressiveSendAnimationBalloon](v76, "expressiveSendAnimationBalloon");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      CKBalloonViewReuse(v35);

    }
    -[CKImpactEffectManager cloneBalloonForAnimationWithChatItem:](v76, "cloneBalloonForAnimationWithChatItem:", v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImpactEffectManager setExpressiveSendAnimationBalloon:](v76, "setExpressiveSendAnimationBalloon:", v36);
    v37 = objc_msgSend(v12, "indexOfObject:", v31);
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
      v38 = 0;
    else
      v38 = v37;
    objc_msgSend(v12, "objectAtIndex:", v38);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "frame");
    v40 = v39;
    v42 = v41;
    objc_msgSend(v87, "superview");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "convertPoint:toView:", v30, v40, v42);
    v45 = v44;
    v47 = v46;

    objc_msgSend(v30, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "flipsHorizontalAxis");

    if (v49)
    {
      objc_msgSend(v30, "frame");
      v45 = v50 - v45;
    }
    objc_msgSend(v36, "frame");
    objc_msgSend(v36, "setFrame:", v45, v47);
    -[CKImpactEffectManager setOriginalBalloonView:](v76, "setOriginalBalloonView:", v87);
    if (v36)
    {
      objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v38, v36);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v51, OS_LOG_TYPE_INFO, "_sendAnimationContextForIdentifier clone is nil", buf, 2u);
      }

    }
    v81 = (void *)v33;
    v85 = v30;
    v52 = v29;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend(v36, "subviews");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v89;
      while (2)
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v89 != v55)
            objc_enumerationMutation(v53);
          v57 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v60 = v57;

            v58 = v85;
            v59 = v81;
            if (v60)
              objc_msgSend(v13, "replaceObjectAtIndex:withObject:", 0, v60);
            goto LABEL_59;
          }
        }
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v88, v116, 16);
        if (v54)
          continue;
        break;
      }
    }

    v58 = v85;
    v59 = v81;
    v60 = 0;
LABEL_59:

    -[CKImpactEffectManager expressiveSendScrollView](v76, "expressiveSendScrollView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", v36);

    v27 = v76;
  }
  objc_msgSend(v12, "firstObject");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFirstObject");
  while (v62)
  {
    v63 = (void *)objc_opt_class();
    if ((objc_msgSend(v63, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      v67 = v62;
      v115 = v67;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_69:
      v27 = v76;
      goto LABEL_71;
    }
    objc_msgSend(v12, "firstObject");
    v64 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "removeFirstObject");
    v27 = v76;
    objc_msgSend(v13, "removeFirstObject");
    v62 = (void *)v64;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v65, OS_LOG_TYPE_INFO, "_sendAnimationContextForIdentifier throwBalloonView is nil", buf, 2u);
    }

    v66 = 0;
    goto LABEL_69;
  }
  v66 = 0;
LABEL_71:
  -[CKSendAnimationContext setAnimatableViews:](v75, "setAnimatableViews:", v12);
  -[CKSendAnimationContext setAnimatableTextViews:](v75, "setAnimatableTextViews:", v13);
  -[CKSendAnimationContext setImpactIdentifier:](v75, "setImpactIdentifier:", v73);
  -[CKSendAnimationContext setThrowBalloonViews:](v75, "setThrowBalloonViews:", v66);
  -[CKSendAnimationContext setIsSender:](v75, "setIsSender:", v72);
  -[CKImpactEffectManager expressiveSendScrollView](v27, "expressiveSendScrollView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendAnimationContext setContainerView:](v75, "setContainerView:", v68);

  -[CKSendAnimationContext setBeginAnimationFromTranscriptPresentedState:](v75, "setBeginAnimationFromTranscriptPresentedState:", v71);
  _Block_object_dispose(&v109, 8);

  return v75;
}

void __120__CKImpactEffectManager__sendAnimationContextForIdentifier_message_isSender_beginAnimationFromTranscriptPresentedState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "IMChatItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isReplyContextPreview") & 1) == 0)
    {
      objc_msgSend(v9, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsString:", v11);

      if (v12)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *a4 = 1;
      }
    }

    v8 = v13;
  }

}

- (id)cloneBalloonForAnimationWithChatItem:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CKBalloonViewForClass((objc_class *)objc_msgSend(v3, "impactBalloonViewClass"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureForMessagePart:", v3);
    objc_msgSend(v4, "setCanUseOpaqueMask:", 0);
    objc_msgSend(v3, "size");
    v6 = v5;
    v8 = v7;
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v11 = objc_msgSend(v3, "itemIsReplyContextPreview");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "replyBalloonMaskSizeWithTailShape:isMultiline:", 1, 0);
      objc_msgSend(v4, "setWantsSkinnyMask:", v6 < v14);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textReplyPreviewBalloonMinHeight");
    }
    else
    {
      objc_msgSend(v12, "balloonMaskSizeWithTailShape:isMultiline:", 1, 0);
      objc_msgSend(v4, "setWantsSkinnyMask:", v6 < v17);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textBalloonMinHeight");
    }
    objc_msgSend(v4, "setWantsMultilineMask:", v8 > v16);

    objc_msgSend(v4, "setFrame:", v9, v10, v6, v8);
    objc_msgSend(v4, "layoutIfNeeded");
    objc_msgSend(v4, "prepareForDisplayIfNeeded");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)popAnimationDidBegin
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CKImpactEffectManager *v8;

  -[CKImpactEffectManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewControllerForImpactEffectManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__CKImpactEffectManager_popAnimationDidBegin__block_invoke;
  v6[3] = &unk_1E274A108;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __45__CKImpactEffectManager_popAnimationDidBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPoppedBalloonGUIDHiddenUntilNextChatItemUpdate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
}

- (void)animationWillBeginWithContext:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "impactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    -[CKImpactEffectManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionViewControllerForImpactEffectManager:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

    objc_msgSend(v7, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    objc_msgSend(v16, "impactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = +[CKImpactEffectManager identifierShouldPlayInWindow:](CKImpactEffectManager, "identifierShouldPlayInWindow:", v10);

    if ((_DWORD)v9)
    {
      -[CKImpactEffectManager expressiveSendScrollView](self, "expressiveSendScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentOffset");
      objc_msgSend(v11, "setContentOffset:");

      -[CKImpactEffectManager originalBalloonView](self, "originalBalloonView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

    }
    -[CKImpactEffectManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chatForSendAnimationManager:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "beginHoldingChatItemsUpdatesForReason:", *MEMORY[0x1E0D35388]);
    -[CKImpactEffectManager setIsAnimating:](self, "setIsAnimating:", 1);

  }
}

- (void)animationDidFinishWithContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "impactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink"));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "impactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImpactEffectManager setIsAnimating:](self, "setIsAnimating:", 0);
    if (+[CKImpactEffectManager identifierShouldPlayInWindow:](CKImpactEffectManager, "identifierShouldPlayInWindow:", v7))
    {
      -[CKImpactEffectManager originalBalloonView](self, "originalBalloonView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 0);

      -[CKImpactEffectManager setOriginalBalloonView:](self, "setOriginalBalloonView:", 0);
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__CKImpactEffectManager_animationDidFinishWithContext___block_invoke;
    v10[3] = &unk_1E274A108;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

void __55__CKImpactEffectManager_animationDidFinishWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CKSendAnimationContext *v5;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupExpressiveSendComponents");
  v5 = objc_alloc_init(CKSendAnimationContext);
  -[CKSendAnimationContext setImpactIdentifier:](v5, "setImpactIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAnimationManagerDidStopAnimation:context:", *(_QWORD *)(a1 + 32), v5);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatForSendAnimationManager:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "endHoldingChatItemsUpdatesForReason:", *MEMORY[0x1E0D35388]);
}

- (void)_visibleCells:(id *)a3 aboveItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKImpactEffectManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewControllerForImpactEffectManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathsForVisibleItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v24 = v5;
  objc_msgSend(v8, "cellForChatItem:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForCell:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_120_0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v11;
  objc_msgSend(v11, "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "row");
        if (v19 <= objc_msgSend(v12, "row"))
        {
          objc_msgSend(v9, "cellForItemAtIndexPath:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v6, "addObject:", v20);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v6);

}

uint64_t __49__CKImpactEffectManager__visibleCells_aboveItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "row");
  v6 = objc_msgSend(v4, "row");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (void)_cleanupExpressiveSendComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKImpactEffectManager expressiveSendAnimationBalloon](self, "expressiveSendAnimationBalloon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKImpactEffectManager expressiveSendAnimationBalloon](self, "expressiveSendAnimationBalloon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKBalloonViewReuse(v4);

  -[CKImpactEffectManager setExpressiveSendAnimationBalloon:](self, "setExpressiveSendAnimationBalloon:", 0);
  -[CKImpactEffectManager expressiveSendScrollView](self, "expressiveSendScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHidden:", 1);
  -[CKImpactEffectManager expressiveSendScrollView](self, "expressiveSendScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[CKImpactEffectManager setExpressiveSendScrollView:](self, "setExpressiveSendScrollView:", 0);
  -[CKImpactEffectManager expressiveSendAnimationWindow](self, "expressiveSendAnimationWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[CKImpactEffectManager setExpressiveSendAnimationWindow:](self, "setExpressiveSendAnimationWindow:", 0);
  -[CKImpactEffectManager setExpressiveSendAnimationBackdrop:](self, "setExpressiveSendAnimationBackdrop:", 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("CKAudioSessionControllerSessionOptionsWillChangeNotification"), v4);

  v5.receiver = self;
  v5.super_class = (Class)CKImpactEffectManager;
  -[CKImpactEffectManager dealloc](&v5, sel_dealloc);
}

- (void)_audioSessionOptionsWillChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKAudioSessionControllerSessionNotificationOptionsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "unsignedIntegerValue") & 2) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CKImpactEffectManager__audioSessionOptionsWillChange___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __56__CKImpactEffectManager__audioSessionOptionsWillChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopPlayingSound");
}

- (void)stopPlayingSound
{
  CKAudioController *audioController;

  audioController = self->_audioController;
  if (audioController)
  {
    -[CKAudioController pause](audioController, "pause");
    -[CKAudioController stop](self->_audioController, "stop");
  }
}

- (CKSendAnimationManagerDelegate)sendAnimationManagerDelegate
{
  return (CKSendAnimationManagerDelegate *)objc_loadWeakRetained((id *)&self->sendAnimationManagerDelegate);
}

- (void)setSendAnimationManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->sendAnimationManagerDelegate, a3);
}

- (CKSendAnimationBalloonProvider)sendAnimationBalloonProvider
{
  return (CKSendAnimationBalloonProvider *)objc_loadWeakRetained((id *)&self->sendAnimationBalloonProvider);
}

- (void)setSendAnimationBalloonProvider:(id)a3
{
  objc_storeWeak((id *)&self->sendAnimationBalloonProvider, a3);
}

- (CKSendAnimationManagerDelegate)delegate
{
  return (CKSendAnimationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (NSString)animatingIdentifier
{
  return self->_animatingIdentifier;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (UIWindow)expressiveSendAnimationWindow
{
  return self->_expressiveSendAnimationWindow;
}

- (void)setExpressiveSendAnimationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_expressiveSendAnimationWindow, a3);
}

- (CKBalloonView)expressiveSendAnimationBalloon
{
  return self->_expressiveSendAnimationBalloon;
}

- (void)setExpressiveSendAnimationBalloon:(id)a3
{
  objc_storeStrong((id *)&self->_expressiveSendAnimationBalloon, a3);
}

- (CKBalloonView)originalBalloonView
{
  return self->_originalBalloonView;
}

- (void)setOriginalBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_originalBalloonView, a3);
}

- (UIScrollView)expressiveSendScrollView
{
  return self->_expressiveSendScrollView;
}

- (void)setExpressiveSendScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_expressiveSendScrollView, a3);
}

- (CABackdropLayer)expressiveSendAnimationBackdrop
{
  return self->_expressiveSendAnimationBackdrop;
}

- (void)setExpressiveSendAnimationBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_expressiveSendAnimationBackdrop, a3);
}

- (CKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_audioController, a3);
}

- (NSString)undoSendChatItemGUID
{
  return self->_undoSendChatItemGUID;
}

- (void)setUndoSendChatItemGUID:(id)a3
{
  objc_storeStrong((id *)&self->_undoSendChatItemGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSendChatItemGUID, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_expressiveSendAnimationBackdrop, 0);
  objc_storeStrong((id *)&self->_expressiveSendScrollView, 0);
  objc_storeStrong((id *)&self->_originalBalloonView, 0);
  objc_storeStrong((id *)&self->_expressiveSendAnimationBalloon, 0);
  objc_storeStrong((id *)&self->_expressiveSendAnimationWindow, 0);
  objc_storeStrong((id *)&self->_animatingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->sendAnimationBalloonProvider);
  objc_destroyWeak((id *)&self->sendAnimationManagerDelegate);
}

- (void)playUndoSendAnimationForChatItem:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Unable to find chat item index coresponding to chat item", v1, 2u);
}

@end

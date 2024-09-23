@implementation CKFullScreenEffectManager

+ (id)localizedMaskStringForEffectWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_BALLOONS_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKConfettiEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_CONFETTI_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKLasersEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_LASERS_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKFireworksEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_FIREWORKS_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKShootingStarEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_SHOOTING_STAR_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKSparklesEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_CELEBRATION_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHeartEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_LOVE_MESSAGE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKEchoEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_ECHO_MESSAGE");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKSpotlightEffect")))
    {
      v7 = 0;
      goto LABEL_20;
    }
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SUMMARY_SPOTLIGHT_MESSAGE");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v7;
}

- (CKFullScreenEffectManager)init
{
  CKFullScreenEffectManager *v2;
  CKScheduledUpdater *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKFullScreenEffectManager;
  v2 = -[CKFullScreenEffectManager init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CKScheduledUpdater initWithTarget:action:]([CKScheduledUpdater alloc], "initWithTarget:action:", v2, sel_triggerNextEffect);
    -[CKFullScreenEffectManager setTriggerUpdater:](v2, "setTriggerUpdater:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_didReceiveMemoryWarning, *MEMORY[0x1E0CEB298], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKScheduledUpdater invalidate](self->_triggerUpdater, "invalidate");
  -[NSTimer invalidate](self->_effectDurationTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CKFullScreenEffectManager;
  -[CKFullScreenEffectManager dealloc](&v4, sel_dealloc);
}

- (void)didReceiveMemoryWarning
{
  void *v2;

  v2 = (void *)sFullscreenEffectMap;
  sFullscreenEffectMap = 0;

}

- (id)fullscreenEffectMap
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)sFullscreenEffectMap;
  if (!sFullscreenEffectMap)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/Messages/iMessageEffects"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 7, &__block_literal_global_39);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          objc_msgSend(v11, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v3, "setObject:forKey:", v11, v12);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v11;
              _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Failed to get bundle identifier for %@", buf, 0xCu);
            }

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v8);
    }

    v14 = (void *)sFullscreenEffectMap;
    sFullscreenEffectMap = (uint64_t)v3;

    v2 = (void *)sFullscreenEffectMap;
  }
  return v2;
}

uint64_t __48__CKFullScreenEffectManager_fullscreenEffectMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Couldn't enumerate %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return 1;
}

- (id)localizedDisplayNameForEffectWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CKFullScreenEffectManager fullscreenEffectMap](self, "fullscreenEffectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedInfoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("CFBundleDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedPickerTitleForEffectWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessibilityPreferredContentSizeCategory");

  if (v6)
    v7 = CFSTR("AXEffectPickerTitle");
  else
    v7 = CFSTR("EffectPickerTitle");
  -[CKFullScreenEffectManager fullscreenEffectMap](self, "fullscreenEffectMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedInfoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)effectIdentifiers
{
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.messages.effect.CKEchoEffect");
  v3[1] = CFSTR("com.apple.messages.effect.CKSpotlightEffect");
  v3[2] = CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect");
  v3[3] = CFSTR("com.apple.messages.effect.CKConfettiEffect");
  v3[4] = CFSTR("com.apple.messages.effect.CKHeartEffect");
  v3[5] = CFSTR("com.apple.messages.effect.CKLasersEffect");
  v3[6] = CFSTR("com.apple.messages.effect.CKFireworksEffect");
  v3[7] = CFSTR("com.apple.messages.effect.CKSparklesEffect");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)effectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    -[CKFullScreenEffectManager fullscreenEffectMap](self, "fullscreenEffectMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if ((objc_msgSend(v6, "isLoaded") & 1) == 0)
        objc_msgSend(v6, "load");
      v7 = objc_alloc_init((Class)objc_msgSend(v6, "principalClass"));
      objc_msgSend(v7, "setIdentifier:", v4);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)startFullscreenEffectForChatItem:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  __CFString *v45;
  id v46;
  _QWORD aBlock[4];
  id v48;
  CKFullScreenEffectManager *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v6, "supportsCommunicationSafety")
      && objc_msgSend(v6, "isCommSafetySensitive"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Do not execute effects for sensitive messages", buf, 2u);
        }
LABEL_16:

      }
    }
    else
    {
      objc_msgSend(v6, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isStewie");

      if (v12)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Do not execute effects for Stewie chat", buf, 2u);
          }
          goto LABEL_16;
        }
      }
      else
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        -[CKFullScreenEffectManager effectQueue](self, "effectQueue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v51;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v51 != v15)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "triggeringChatItem");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqual:", v6);

              if ((v18 & 1) != 0)
              {

                goto LABEL_42;
              }
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
            if (v14)
              continue;
            break;
          }
        }

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke;
        aBlock[3] = &unk_1E274DE18;
        v19 = v6;
        v48 = v19;
        v49 = self;
        v20 = _Block_copy(aBlock);
        if (__CurrentTestName)
        {
          v21 = objc_msgSend((id)__CurrentTestName, "rangeOfString:", CFSTR("Transcript"));
          v23 = v22;
          v24 = objc_msgSend((id)__CurrentTestName, "rangeOfString:", CFSTR("FSM"));
          if (v23)
          {
            if (v25)
            {
              objc_msgSend((id)__CurrentTestName, "substringWithRange:", v21 + v23, v24 - (v21 + v23));
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (-[__CFString containsString:](v26, "containsString:", CFSTR("Balloons")))
              {

                v26 = CFSTR("HappyBirthday");
              }
              -[CKFullScreenEffectManager effectIdentifiers](self, "effectIdentifiers");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v44[0] = MEMORY[0x1E0C809B0];
              v44[1] = 3221225472;
              v44[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_104;
              v44[3] = &unk_1E274DE40;
              v45 = v26;
              v46 = v19;
              v28 = v26;
              objc_msgSend(v27, "enumerateObjectsUsingBlock:", v44);

            }
          }
        }
        -[CKFullScreenEffectManager fullscreenEffectMap](self, "fullscreenEffectMap");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "message");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "expressiveSendStyleID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32 == 0;

        if (v33)
        {
          if (objc_msgSend(MEMORY[0x1E0D397F8], "supportsScreenEffects"))
          {
            objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "message");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "plainBody");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_108;
            v42[3] = &unk_1E274DE68;
            v42[4] = self;
            v43 = v20;
            objc_msgSend(v39, "responsesForMessage:maximumResponses:forContext:withLanguage:options:completionBlock:", v41, 1, 0, v7, 576, v42);

          }
        }
        else if (v20)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v19, "message");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "expressiveSendStyleID");
              v36 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v56 = v36;
              _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Starting effect for explicit identifier: %@", buf, 0xCu);

            }
          }
          objc_msgSend(v19, "message");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "expressiveSendStyleID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, void *, _QWORD))v20 + 2))(v20, v38, 0);

        }
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "-[CKFullScreenEffectManager startFullscreenEffectForChatItem:language:]";
      v57 = 2112;
      v58 = (id)objc_opt_class();
      v9 = v58;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "%s called with non-message part chat item (type %@). Please file a bug", buf, 0x16u);

    }
    goto LABEL_16;
  }
LABEL_42:

}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isFromMe"))
    v6 = (_DWORD)a3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackEvent:", *MEMORY[0x1E0D385A0]);

  }
  objc_msgSend(*(id *)(a1 + 40), "effectForIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessageOrientation:", objc_msgSend(*(id *)(a1 + 32), "isFromMe"));
  objc_msgSend(v8, "setTriggeredByResponseKit:", a3);
  objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 40));
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "effectQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEffectQueue:", v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "effectQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v8);

    objc_msgSend(v8, "setTriggeringChatItem:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "triggerUpdater");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsUpdate");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "triggerUpdater");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Starting effect: %@ updater: %@", (uint8_t *)&v16, 0x16u);

      }
    }
  }

}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_104(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "rangeOfString:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExpressiveSendStyleID:", v7);

    *a4 = 1;
  }

}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_2;
  block[3] = &unk_1E274CC10;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __71__CKFullScreenEffectManager_startFullscreenEffectForChatItem_language___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      v2 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v2;
      _os_log_impl(&dword_18DFCD000, v1, OS_LOG_TYPE_INFO, "Starting effect for RK responses: %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v3;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "RK attributes: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v3, "objectForKey:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("moment"));

    if (v6)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "fullscreenEffectMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v22 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v11, "infoDictionary");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", CFSTR("Triggers"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "objectForKey:", CFSTR("subtype"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "containsObject:", v14);

            if (v15)
            {
              v16 = *(_QWORD *)(a1 + 48);
              if (v16)
              {
                objc_msgSend(v11, "bundleIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *, uint64_t))(v16 + 16))(v16, v17, 1);

              }
              goto LABEL_23;
            }

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_23:

    }
  }
}

- (void)triggerNextEffect
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[CKFullScreenEffectManager effectQueue](self, "effectQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CKFullScreenEffectManager effectQueue](self, "effectQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[CKFullScreenEffectManager effectDurationTimer](self, "effectDurationTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[CKFullScreenEffectManager beginHoldingUpdatesForKey:](self, "beginHoldingUpdatesForKey:", CFSTR("CKFullscreenEffectManagerUpdatesPlaying"));
    objc_msgSend(v7, "prepareSoundEffect");

  }
}

- (void)fullScreenEffectDidPrepareSoundEffect:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "duration");
  v5 = v4;
  if (__CurrentTestName)
  {
    objc_msgSend(v12, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKFullScreenEffectManager idleDurationAfterEffectWithIdentifier:](CKFullScreenEffectManager, "idleDurationAfterEffectWithIdentifier:", v6);
    v8 = v7;

    v5 = v5 - v8;
  }
  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_stopFullscreenEffect, 0, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTimer:forMode:", v9, *MEMORY[0x1E0C99860]);

  -[CKFullScreenEffectManager setEffectDurationTimer:](self, "setEffectDurationTimer:", v9);
  -[CKFullScreenEffectManager setCurrentEffect:](self, "setCurrentEffect:", v12);
  -[CKFullScreenEffectManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "effectManager:didStartEffect:", self, v12);

}

- (void)stopFullscreenEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKFullScreenEffectManager effectDurationTimer](self, "effectDurationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CKFullScreenEffectManager setEffectDurationTimer:](self, "setEffectDurationTimer:", 0);
  -[CKFullScreenEffectManager currentEffect](self, "currentEffect");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CKFullScreenEffectManager setCurrentEffect:](self, "setCurrentEffect:", 0);
    -[CKFullScreenEffectManager endHoldingUpdatesForKey:](self, "endHoldingUpdatesForKey:", CFSTR("CKFullscreenEffectManagerUpdatesPlaying"));
    -[CKFullScreenEffectManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectManager:didStopEffect:", self, v7);

    -[CKFullScreenEffectManager effectQueue](self, "effectQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v7);

  }
  -[CKFullScreenEffectManager triggerUpdater](self, "triggerUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdate");

}

- (void)beginHoldingUpdatesForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKFullScreenEffectManager triggerUpdater](self, "triggerUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginHoldingUpdatesForKey:", v4);

}

- (void)endHoldingUpdatesForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKFullScreenEffectManager triggerUpdater](self, "triggerUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endHoldingUpdatesForKey:", v4);

}

+ (double)delayBeforeEffectWithIdentifier:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = 1.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKConfettiEffect")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect")))
      v4 = 0.15;
    else
      v4 = 0.0;
  }

  return v4;
}

+ (double)idleDurationAfterEffectWithIdentifier:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKConfettiEffect")) & 1) != 0)
  {
    v4 = 0.4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect")))
  {
    v4 = 0.55;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (CKFullScreenEffect)currentEffect
{
  return self->_currentEffect;
}

- (void)setCurrentEffect:(id)a3
{
  objc_storeStrong((id *)&self->_currentEffect, a3);
}

- (CKFullScreenEffectManagerDelegate)delegate
{
  return (CKFullScreenEffectManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)effectQueue
{
  return self->_effectQueue;
}

- (void)setEffectQueue:(id)a3
{
  objc_storeStrong((id *)&self->_effectQueue, a3);
}

- (NSTimer)effectDurationTimer
{
  return self->_effectDurationTimer;
}

- (void)setEffectDurationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_effectDurationTimer, a3);
}

- (CKScheduledUpdater)triggerUpdater
{
  return self->_triggerUpdater;
}

- (void)setTriggerUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_triggerUpdater, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerUpdater, 0);
  objc_storeStrong((id *)&self->_effectDurationTimer, 0);
  objc_storeStrong((id *)&self->_effectQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentEffect, 0);
}

@end

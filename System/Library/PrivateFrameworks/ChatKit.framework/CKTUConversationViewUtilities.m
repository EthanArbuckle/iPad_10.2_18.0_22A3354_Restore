@implementation CKTUConversationViewUtilities

+ (id)faceTimeIconForTUConversation:(id)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = CFSTR("video.fill");
  if (a3 && !objc_msgSend(MEMORY[0x1E0D35818], "conversationIsVideoCall:"))
    v3 = CFSTR("phone.fill");
  v4 = (void *)MEMORY[0x1E0CEA638];
  v5 = v3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tuConversationBalloonIconConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:withConfiguration:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sharePlayIcon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:withConfiguration:", CFSTR("shareplay"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)activityBundleIdentifierForTUConversation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D35818], "activitySessionForTUConversation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)activityIconForTUConversation:(id)a3 iconSize:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEA950];
  v6 = a3;
  objc_msgSend(v5, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  +[CKTUConversationViewUtilities activityBundleIdentifierForTUConversation:](CKTUConversationViewUtilities, "activityBundleIdentifierForTUConversation:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 1, 0);
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v10);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a4, a4, v9);
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "prepareImagesForImageDescriptors:", v14);

    objc_msgSend(v12, "imageForImageDescriptor:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", objc_msgSend(v15, "CGImage"), 0, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)activityImageForTUConversation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D35818], "isScreenShareActivityForTUConversation:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("rectangle.inset.filled.and.person.filled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationWithHierarchicalColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageByApplyingSymbolConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35818], "activityMetadataForTUConversation:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v11 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v4, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithData:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v10;
}

+ (BOOL)activityHasImageForTUConversation:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D35818], "activeTUConversationHasActivitySession:", v3))
  {
    if ((objc_msgSend(MEMORY[0x1E0D35818], "isScreenShareActivityForTUConversation:", v3) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D35818], "activityMetadataForTUConversation:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "imageData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v6 != 0;

      }
      else
      {
        v4 = 0;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (CGSize)faceTimeIconSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationBalloonFaceTimeIconDimensions");
  v4 = v3;

  v5 = v4;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (id)titleForAVMode:(unint64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAVLessSharePlayEnabled");

  if (v5)
  {
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3)
      v8 = CFSTR("FACE_TIME_DEFAULT");
    else
      v8 = CFSTR("EXPANSE_DEFAULT");
  }
  else
  {
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("FACE_TIME_DEFAULT");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)activityTitleForTUConversation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D35818], "activeTUConversationHasActivitySession:", v3))
  {
    if (objc_msgSend(MEMORY[0x1E0D35818], "isScreenShareActivityForTUConversation:", v3))
    {
      objc_msgSend(MEMORY[0x1E0D35818], "remoteParticipantHandleSharingScreenForTUConversation:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fullName");
      }
      else
      {
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EXPANSE_LOCAL_SCREENSHARE"), &stru_1E276D870, CFSTR("ChatKit"));
      }
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0D35818], "activityMetadataForTUConversation:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityAppNameForTUConversation:](CKTUConversationViewUtilities, "activityAppNameForTUConversation:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "title");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v7 = (void *)v6;

      v5 = v7;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v3)
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACE_TIME_DEFAULT"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", objc_msgSend(v3, "avMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v5;
}

+ (id)activityTextForTUConversation:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D35818], "isScreenShareActivityForTUConversation:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35818], "activityMetadataForTUConversation:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "subTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)activityAppNameForTUConversation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D35818], "activitySessionForTUConversation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedApplicationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "fallbackApplicationName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (void)formatLPImageForScreenShare:(id)a3 conversation:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CEA478];
  v5 = a3;
  objc_msgSend(v4, "systemWhiteColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setOverlaidTextColor:", v7);
}

+ (id)joinStateStatusStringForTUConversation:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "mergedActiveRemoteParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MultiwayOverrideActiveParticipants"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "integerForKey:", CFSTR("MultiwayOverrideActiveParticipants"));

  }
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%lu People Active"), &stru_1E276D870, CFSTR("IMSharedUtilities"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACETIME_WAITING"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (unint64_t)ckTUConversationStateForTUConversation:(id)a3
{
  id v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Setting state to CKTUConversationStateCallEnded for nil TUConversation", (uint8_t *)&v11, 2u);
      }
      goto LABEL_17;
    }
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  v4 = objc_msgSend(MEMORY[0x1E0D35818], "activeTUConversationHasActivitySession:", v3);
  v5 = objc_msgSend(v3, "state");
  if (v5 > 4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "TUConversationState is TUConversationStateCallEnded. Setting state to CKTUConversationStateCallEnded for TUConversation %@", (uint8_t *)&v11, 0xCu);
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v6 = 3;
  if (!v4)
    v6 = 1;
  v7 = 2;
  if (v4)
    v7 = 4;
  if (((1 << v5) & 0x13) != 0)
    v8 = v6;
  else
    v8 = v7;
LABEL_19:

  return v8;
}

+ (id)activityDescriptionStringForTUConversation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  const __CFString *v16;

  objc_msgSend(MEMORY[0x1E0D35818], "activitySessionForTUConversation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CPGroupActivityGenericContext")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("CPGroupActivityWorkoutTogetherContext")))
  {
    goto LABEL_3;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CPGroupActivityListenTogetherContext")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("CPGroupActivityWatchTogetherContext")))
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("EXPANSE_ACTIVITY_DESCRIPTION_PLAYING");
    goto LABEL_4;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("CPGroupActivityScreenSharingContext")))
  {
LABEL_3:
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("EXPANSE_ACTIVITY_DESCRIPTION_DEFAULT");
LABEL_4:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v4, "originator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9)
    v16 = CFSTR("EXPANSE_ACTIVITY_DESCRIPTIONE_VIEWING");
  else
    v16 = CFSTR("EXPANSE_ACTIVITY_DESCRIPTION_SHARING");
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  objc_msgSend(v11, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

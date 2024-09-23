@implementation IMFaceTimeUtilities

+ (id)currentCallForTUConversation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeConversationForCall:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (v16)
        {
          v17 = v11;

          v8 = v17;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)activeTUConversationHasActivitySession:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  +[IMFaceTimeUtilities activitySessionForTUConversation:](IMFaceTimeUtilities, "activitySessionForTUConversation:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)joinExistingConversationForTUCoversation:(id)a3 videoEnabled:(BOOL)a4 wantsStagingArea:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  _BYTE v13[22];
  __int16 v14;
  void *v15;
  uint64_t v16;

  v5 = a5;
  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD308]), "initWithConversation:", v7);
    objc_msgSend(v8, "setVideoEnabled:", v6);
    objc_msgSend(v8, "setWantsStagingArea:", v5);
    objc_msgSend(v8, "setOriginatingUIType:", 19);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = CFSTR("NO");
        *(_DWORD *)v13 = 138412802;
        *(_QWORD *)&v13[4] = v7;
        *(_WORD *)&v13[12] = 2112;
        if (v6)
          v10 = CFSTR("YES");
        *(_QWORD *)&v13[14] = v10;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Joining TUConversation %@ with videoEnabled %@ using join request: %@", v13, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance", *(_OWORD *)v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "launchAppForJoinRequest:", v8);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "***** --- We are trying to join a TUConversation, but we do not have a local conversation for this chat --- ****", v13, 2u);
    }

  }
}

+ (void)initiateTUConversationForParticipants:(id)a3 senderAddress:(id)a4 videoEnabled:(BOOL)a5 groupID:(id)a6 displayName:(id)a7 screenShareType:(unint64_t)a8
{
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  _BOOL4 v41;
  id v42;
  id v43;
  id v44;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[3];
  _QWORD v52[3];
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v41 = a5;
  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v43 = a4;
  v42 = a6;
  v44 = a7;
  if (IMDeviceIsGreenTea() && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "IMFaceTimeUtilities: request to initiate a group facetime for a green tea device. Only TUDialRequests are supported in this configuration, so this request will fail.", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1E0DBD2F8];
        objc_msgSend(v17, "ID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "normalizedHandleWithDestinationID:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = objc_alloc(MEMORY[0x1E0DBD2A0]);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v21, "initWithHandles:", v22);

          objc_msgSend(v13, "addObject:", v23);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v17;
            _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Skipping handle (%@) as the ID is nil", buf, 0xCu);
          }

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v13, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD308]), "initWithRemoteMembers:", v13);
    v26 = v25;
    if (v41)
      v27 = 2;
    else
      v27 = 1;
    objc_msgSend(v25, "setAvMode:", v27);
    objc_msgSend(v26, "setVideoEnabled:", v41);
    objc_msgSend(v26, "setRequestToShareMyScreen:", a8 == 1);
    objc_msgSend(v26, "setRequestToShareScreen:", a8 == 2);
    objc_msgSend(v26, "setShouldSuppressInCallUI:", 1);
    objc_msgSend(MEMORY[0x1E0DBD2C0], "expanseProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProvider:", v28);

    if (a8)
      v29 = 32;
    else
      v29 = 18;
    objc_msgSend(v26, "setOriginatingUIType:", v29);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DBD2F8], "normalizedHandleWithDestinationID:", v43);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCallerID:", v30);

    }
    if ((unint64_t)objc_msgSend(obj, "count") < 2)
    {
      v39 = objc_alloc(MEMORY[0x1E0C99E60]);
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD288]), "initWithHandleType:notificationStyles:", 2, 4);
      v51[0] = v31;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD288]), "initWithHandleType:notificationStyles:", 3, 4);
      v51[1] = v33;
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD288]), "initWithHandleType:notificationStyles:", 1, 4);
      v51[2] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v39, "initWithArray:", v35);
    }
    else
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v42);
      objc_msgSend(v26, "setMessagesGroupUUID:", v31);
      objc_msgSend(v26, "setMessagesGroupName:", v44);
      v32 = objc_alloc(MEMORY[0x1E0C99E60]);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD288]), "initWithHandleType:notificationStyles:", 2, 2);
      v52[0] = v33;
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD288]), "initWithHandleType:notificationStyles:", 3, 2);
      v52[1] = v34;
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD288]), "initWithHandleType:notificationStyles:", 1, 2);
      v52[2] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v32, "initWithArray:", v36);

    }
    objc_msgSend(v26, "setInvitationPreferences:", v37);
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "launchAppForJoinRequest:", v26);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "IMFaceTimeUtilities: Not starting FaceTime as the conversation has no valid participants.", buf, 2u);
    }

  }
}

+ (void)initiateTUDialRequestForSingleParticipant:(id)a3 videoEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "initiateTUDialRequestForSingleParticipant", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v8, "providers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
LABEL_7:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
      if ((objc_msgSend(v13, "isFaceTimeProvider") & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v10)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    v14 = v13;

    if (!v14)
      goto LABEL_16;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithProvider:", v14);
    v16 = (void *)MEMORY[0x1E0DBD2F8];
    objc_msgSend(v5, "ID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "normalizedHandleWithDestinationID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHandle:", v18);

    objc_msgSend(v15, "setVideo:", v4);
    objc_msgSend(v15, "setShouldSuppressInCallUI:", 1);
    objc_msgSend(v15, "setOriginatingUIType:", 18);
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "launchAppForDialRequest:completion:", v15, 0);

  }
  else
  {
LABEL_13:

LABEL_16:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "providers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Could not find FaceTime Provider, all providers: %@", buf, 0xCu);

      }
    }
  }

}

+ (void)leaveTUConversation
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Leaving active video call", v5, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeVideoCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFaceTimeUtilities leaveTUCall:](IMFaceTimeUtilities, "leaveTUCall:", v4);

}

+ (void)leaveTUCall:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Leaving TUCall %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectCall:", v3);

}

+ (BOOL)isScreenShareActivityForTUConversation:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  +[IMFaceTimeUtilities activitySessionForTUConversation:](IMFaceTimeUtilities, "activitySessionForTUConversation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "isScreenSharingActivity");
  else
    v5 = 0;

  return v5;
}

+ (id)activitySessionForTUConversation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAVLessSharePlayEnabled");

  objc_msgSend(v4, "activitySessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (objc_msgSend(a1, "conversationIsAVLessSharePlay:", v4))
      {
        objc_msgSend(v4, "stagedActivitySession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)remoteParticipantHandleSharingScreenForTUConversation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[IMFaceTimeUtilities activitySessionForTUConversation:](IMFaceTimeUtilities, "activitySessionForTUConversation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isScreenSharingActivity"))
  {
    objc_msgSend(v4, "originator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)activityMetadataForTUConversation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0D39840];
  v5 = a3;
  objc_msgSend(v4, "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAVLessSharePlayEnabled");

  if (v7)
  {
    objc_msgSend(a1, "activitySessionForTUConversation:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "activitySessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (BOOL)conversationIsVideoCall:(id)a3
{
  id v3;
  uint64_t v4;
  SEL v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "avMode");
  v5 = NSSelectorFromString(CFSTR("resolvedAudioVideoMode"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "performSelector:", v5);

  return v4 == 2;
}

+ (BOOL)conversationIsAVLessSharePlay:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAVLessSharePlayEnabled");

  if (v5)
    v6 = objc_msgSend(v3, "avMode") == 0;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)platformSupportsStagingArea
{
  return 1;
}

@end

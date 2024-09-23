@implementation IMChat

- (BOOL)isMuted
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isMutedChat:", self);

  return (char)self;
}

- (NSString)lastAddressedHandleID
{
  return self->_lastAddressedHandleID;
}

- (NSString)originalGroupID
{
  return self->_originalGroupID;
}

- (BOOL)isCategorized
{
  void *v3;
  BOOL v4;
  void *v5;

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("wasDetectedAsSMSSpam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("SMSCategory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v5, "intValue") > 0;

  }
  return v4;
}

- (IMSharedEmergencyInfo)emergencyUserInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D39A60];
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37768]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoFromDictionary:isStewieTranscriptSharingMessage:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMSharedEmergencyInfo *)v4;
}

- (id)displayNameWithDescriptor:(IMChatDisplayNameDescriptor)a3
{
  int64_t var3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  int64_t v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  const __CFString *v70;
  _BYTE v71[128];
  _QWORD v72[4];

  var3 = a3.var3;
  v72[1] = *MEMORY[0x1E0C80C00];
  v46 = *(_DWORD *)&a3.var0;
  v4 = !a3.var0;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("isContact"), 0);
  v72[0] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = sub_1A1FFE598;
    v56[3] = &unk_1E4721090;
    v56[4] = self;
    objc_msgSend(v44, "__imArrayByApplyingBlock:", v56);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v44, "__imArrayByApplyingBlock:", &unk_1E4721068);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((v46 & 0x10000) != 0)
  {
    -[IMChat _participantListStringForNames:visibleNameCount:](self, "_participantListStringForNames:visibleNameCount:", v47, var3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(v47, "count");
    if (v6)
    {
      v48 = v6 - 1;
      if (v6 == 1)
      {
        objc_msgSend(v47, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "copy");

      }
      else
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        obj = v47;
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
        if (v9)
        {
          v10 = 0;
          v11 = *(_QWORD *)v53;
          do
          {
            v12 = 0;
            v13 = v48 - v10;
            v49 = v10;
            v14 = -v10;
            do
            {
              if (*(_QWORD *)v53 != v11)
                objc_enumerationMutation(obj);
              v15 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v12);
              if (v14 == v12)
              {
                v16 = (void *)MEMORY[0x1E0CB3940];
                IMSharedUtilitiesFrameworkBundle();
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PARTICIPANT_ADDRESS_FIRST_ITEM"), &stru_1E4725068, CFSTR("IMSharedUtilities"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "localizedStringWithFormat:", v18, v15);
                v19 = v8;
                v8 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v20 = (void *)MEMORY[0x1E0CB3940];
                IMSharedUtilitiesFrameworkBundle();
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = v21;
                if (v13 == v12)
                  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PARTICIPANT_ADDRESS_FINAL_ITEM"), &stru_1E4725068, CFSTR("IMSharedUtilities"));
                else
                  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PARTICIPANT_ADDRESS_NON_FINAL_ITEM"), &stru_1E4725068, CFSTR("IMSharedUtilities"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "localizedStringWithFormat:", v18, v15);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "stringByAppendingString:", v19);
                v22 = objc_claimAutoreleasedReturnValue();

                v8 = (void *)v22;
              }

              ++v12;
            }
            while (v9 != v12);
            v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
            v10 = v49 + v9;
            v9 = v23;
          }
          while (v23);
        }

      }
    }
    else
    {
      v8 = 0;
    }
  }
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("wasAutoDetectedForSpam"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("wasDetectedAsSMSSpam"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "intValue"))
  {
    v27 = 1;
  }
  else
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("SMSCategory"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v28, "intValue") == 1;

  }
  v29 = -[IMChat isFiltered](self, "isFiltered");
  if (v29)
    v30 = v25;
  else
    v30 = 0;
  if ((v30 & 1) != 0 || v27 && (v46 & 0x100) == 0)
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    IMSharedUtilitiesFrameworkBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("MAYBE_JUNK"), &stru_1E4725068, CFSTR("IMSharedUtilities"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringWithFormat:", v33, v8);
    v34 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v34;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("YES");
      *(_DWORD *)buf = 138413826;
      v58 = v36;
      if ((v46 & 1) != 0)
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      v62 = v38;
      v59 = 2112;
      if (v29)
        v39 = CFSTR("YES");
      else
        v39 = CFSTR("NO");
      v60 = v8;
      if (v25)
        v40 = CFSTR("YES");
      else
        v40 = CFSTR("NO");
      v61 = 2112;
      if ((v46 & 0x100) != 0)
        v41 = CFSTR("YES");
      else
        v41 = CFSTR("NO");
      v63 = 2112;
      if (!v27)
        v37 = CFSTR("NO");
      v64 = v39;
      v65 = 2112;
      v66 = v40;
      v67 = 2112;
      v68 = v41;
      v69 = 2112;
      v70 = v37;
      _os_log_impl(&dword_1A1FF4000, v35, OS_LOG_TYPE_INFO, "Determining conversation name for chat guid: %@ name: %@ wantsRawAddress: %@ isFiltered %@ wasAutoDetectedAsSMSSpam %@ isSpamFilteringEnabled: %@ wasDetectedAsSMSSpam %@", buf, 0x48u);

    }
  }

  return v8;
}

- (NSDate)lastTUConversationCreatedDate
{
  return (NSDate *)-[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("lastTUConversationCreatedDate"));
}

- (unint64_t)recoverableMessagesCount
{
  return self->_recoverableMessagesCount;
}

- (void)_calculateDowngradeState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  BOOL v32;
  uint8_t buf[4];
  IMChat *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!-[IMChat ignoreDowngradeStatusUpdates](self, "ignoreDowngradeStatusUpdates"))
  {
    if (-[IMChat isDowngraded](self, "isDowngraded"))
    {
      +[IMService smsService](IMService, "smsService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[IMChat lastMessage](self, "lastMessage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sender");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "service");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!+[IMServiceImpl smsEnabled](IMServiceImpl, "smsEnabled"))
      goto LABEL_35;
    if (-[IMChat chatStyle](self, "chatStyle") != 45)
      goto LABEL_35;
    +[IMService smsService](IMServiceImpl, "smsService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v6 || !-[IMChat _recipientIsPhoneNumber](self, "_recipientIsPhoneNumber"))
      goto LABEL_35;
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D36C30]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7
      || (v9 = (void *)MEMORY[0x1E0C99D68],
          objc_msgSend(v7, "doubleValue"),
          objc_msgSend(v9, "dateWithTimeIntervalSince1970:"),
          v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue()),
          v10 == 0.0))
    {
      -[IMChat lastMessage](self, "lastMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "code");

      v23 = IMOSLoggingEnabled();
      if (v22 != 43)
      {
        if (v23)
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = self;
            _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "Marking self (%@) as upgraded because it does not have a downgrade time specified", buf, 0xCu);
          }

        }
        goto LABEL_34;
      }
      if (v23)
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = self;
          _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "User resent as SMS in response to blackhole error; Marking chat (%@) as downgraded.",
            buf,
            0xCu);
        }

      }
      -[IMChat _updateDowngradeState:checkAgainInterval:](self, "_updateDowngradeState:checkAgainInterval:", 1, 0.0);
    }
    else
    {
      -[IMChat _consecutiveDowngradeAttemptsViaManualDowngrades:](self, "_consecutiveDowngradeAttemptsViaManualDowngrades:", 0);
      v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      -[IMChat _consecutiveDowngradeAttemptsViaManualDowngrades:](self, "_consecutiveDowngradeAttemptsViaManualDowngrades:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = sub_1A21306E8(v12, *(void **)&v11);
      v32 = 0;
      v14 = sub_1A213067C(*(void **)&v10, &v32);
      if (!v32)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v34 = self;
            v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Marking self (%@) as upgraded because it's time since downgrade is in the future (%@). This should not happen. File a radar.", buf, 0x16u);
          }

        }
        -[IMChat _clearDowngradeMarkers](self, "_clearDowngradeMarkers");
        goto LABEL_33;
      }
      v15 = v14;
      v16 = sub_1A2130654(v13);
      v17 = v16;
      if (v15 >= v16)
      {
        v18 = IMOSLoggingEnabled();
        if (v13)
        {
          if (v18)
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413570;
              v34 = self;
              v35 = 2048;
              v36 = v15;
              v37 = 2048;
              v38 = v13;
              v39 = 2112;
              v40 = v11;
              v41 = 2112;
              v42 = v12;
              v43 = 2048;
              v44 = v17;
              _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Marking chat (%@) as upgraded because it's been %5.2f seconds since downgrade, larger than threshold for %ld (%@ auto, %@ manual) consecutive downgraded messages (%5.2f)", buf, 0x3Eu);
            }

          }
        }
        else if (v18)
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = self;
            _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Marking chat (%@) as upgraded because there are no active downgrade markers.", buf, 0xCu);
          }

        }
LABEL_33:

LABEL_34:
LABEL_35:
        -[IMChat _updateDowngradeState:checkAgainInterval:](self, "_updateDowngradeState:checkAgainInterval:", 2, 0.0);
LABEL_36:

        return;
      }
      objc_msgSend(*(id *)&v10, "dateByAddingTimeInterval:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceNow");
      v29 = v28;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v34 = self;
          v35 = 2112;
          v36 = v11;
          v37 = 2112;
          v38 = (uint64_t)v12;
          v39 = 2048;
          v40 = v29;
          _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "Marking chat (%@) as downgraded because of %@ automatic downgrades, %@ manual downgrades, with %5.2f seconds until next update check.", buf, 0x2Au);
        }

      }
      -[IMChat _updateDowngradeState:checkAgainInterval:](self, "_updateDowngradeState:checkAgainInterval:", 1, v29);

    }
    goto LABEL_36;
  }
}

- (BOOL)ignoreDowngradeStatusUpdates
{
  return self->_ignoreDowngradeStatusUpdates;
}

- (void)invalidateSpamIndicatorCachedValuesIfNeeded
{
  if (-[IMChat cachedShouldShowReportSpam](self, "cachedShouldShowReportSpam") == 2)
    -[IMChat setCachedShouldShowReportSpam:](self, "setCachedShouldShowReportSpam:", 0);
  if (-[IMChat cachedShouldShowSpam](self, "cachedShouldShowSpam") == 2)
    -[IMChat setCachedShouldShowSpam:](self, "setCachedShouldShowSpam:", 0);
}

- (int64_t)cachedShouldShowSpam
{
  return self->_cachedShouldShowSpam;
}

- (int64_t)cachedShouldShowReportSpam
{
  return self->_cachedShouldShowReportSpam;
}

- (void)contextInfo
{
  return self->_context;
}

- (void)setContextInfo:(void *)a3
{
  self->_context = a3;
}

- (int64_t)isFiltered
{
  return self->_isFiltered;
}

- (void)_setJoinState:(int64_t)a3 quietly:(BOOL)a4
{
  if (self->_joinState == a3)
  {
    -[IMChat _clearPendingMessages](self, "_clearPendingMessages");
  }
  else
  {
    self->_joinState = a3;
    -[IMChat _clearPendingMessages](self, "_clearPendingMessages");
    if (!a4)
      -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatJoinStateDidChangeNotification"), 0);
  }
}

- (void)_clearPendingMessages
{
  NSObject *v3;
  NSMutableArray *messagesPendingJoin;
  void *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  NSMutableArray *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_joinState == 3 && self->_messagesPendingJoin)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        messagesPendingJoin = self->_messagesPendingJoin;
        *(_DWORD *)buf = 138412290;
        v21 = messagesPendingJoin;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "messages pending join: %@", buf, 0xCu);
      }

    }
    v5 = (void *)-[NSMutableArray copy](self->_messagesPendingJoin, "copy");
    v6 = self->_messagesPendingJoin;
    self->_messagesPendingJoin = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v16;
      *(_QWORD *)&v9 = 138412290;
      v14 = v9;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(NSMutableArray **)(*((_QWORD *)&v15 + 1) + 8 * v11);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v14;
              v21 = v12;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Un-pending message: %@", buf, 0xCu);
            }

          }
          -[IMChat _sendMessage:adjustingSender:shouldQueue:](self, "_sendMessage:adjustingSender:shouldQueue:", v12, 0, 1, v14, (_QWORD)v15);
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

- (int64_t)joinState
{
  return self->_joinState;
}

- (NSMutableSet)_guids
{
  return self->_guids;
}

- (void)_setDBUnreadCount:(unint64_t)a3 postNotification:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  NSObject *v7;
  unint64_t dbUnreadCount;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  IMChat *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_dbUnreadCount != a3)
  {
    v4 = a4;
    self->_dbUnreadCount = a3;
    v6 = -[IMChat unreadMessageCount](self, "unreadMessageCount");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        dbUnreadCount = self->_dbUnreadCount;
        *(_DWORD *)buf = 67109634;
        v14 = dbUnreadCount;
        v15 = 1024;
        v16 = v6;
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "_dbUnreadCount changed to %d: Posting new unread count of %d for %@", buf, 0x18u);
      }

    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6, CFSTR("__kIMChatUnreadKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatUnreadCountChangedNotification"), v10);

    }
  }
}

- (int64_t)autoDonationBehavior
{
  return self->_autoDonationBehavior;
}

- (void)setPersonCentricID:(id)a3
{
  objc_storeStrong((id *)&self->_personCentricID, a3);
}

- (void)_setJoinState:(int64_t)a3
{
  -[IMChat _setJoinState:quietly:](self, "_setJoinState:quietly:", a3, 0);
}

- (id)_initWithDictionaryRepresentation:(id)a3 items:(id)a4 participantsHint:(id)a5 accountHint:(id)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  char v36;
  id *v37;
  NSObject *v38;
  CFMutableDictionaryRef Mutable;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id *v45;
  uint64_t v47;
  int v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id obj;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  IMChat *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v67 = a4;
  v9 = a5;
  v61 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      MarcoLoggingStringForMessageData();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v79 = self;
      v80 = 2112;
      v81 = v11;
      v82 = 2112;
      v83 = v67;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "chat: _initWithDictionaryRepresentation: %@  dictionary: %@  messages: %@", buf, 0x20u);

    }
  }
  objc_msgSend(v69, "objectForKey:", CFSTR("guid"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("roomName"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("displayName"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("properties"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("lastAddressedLocalHandle"));
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("lastAddressedSIMID"));
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("groupID"));
  v66 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("originalGroupID"));
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("isFiltered"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("hasHadSuccessfulQuery"));
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("engramID"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("lastMessageTimeStampOnLoad"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("mergedPinningIdentifiers"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("replySuggestions"));
  v62 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("isRecovered"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKey:", CFSTR("isDeletingIncomingMessages"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C9AAB0];
  if (v12)
    v14 = (void *)v12;
  v55 = v14;
  v15 = (void *)MEMORY[0x1E0C9AAA0];
  if (v13)
    v15 = (void *)v13;
  v54 = v15;
  objc_msgSend(v69, "objectForKey:", CFSTR("style"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v47) = objc_msgSend(v16, "intValue");

  objc_msgSend(v69, "objectForKey:", CFSTR("state"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v17, "intValue");

  if (v61)
  {
    v72 = v61;
  }
  else
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKey:", CFSTR("accountID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountForUniqueID:", v19);
    v72 = (id)objc_claimAutoreleasedReturnValue();

    if (!v72)
    {
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectForKey:", CFSTR("serviceName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bestAccountForService:", v22);
      v72 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v68 = v9;
  v71 = v68;
  if (!objc_msgSend(v68, "count"))
  {
    v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v69, "objectForKey:", CFSTR("participants"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v74;
      v25 = *MEMORY[0x1E0D36D90];
      v26 = *MEMORY[0x1E0D36E10];
      v27 = *MEMORY[0x1E0D36D68];
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v74 != v24)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v29, "objectForKey:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "imHandleWithID:alreadyCanonical:", v30, objc_msgSend(v30, "_appearsToBePhoneNumber"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v71, "addObject:", v33);
            objc_msgSend(v33, "_setOriginalID:countryCode:updateSiblings:", v31, v32, 1);
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v23);
    }

  }
  v34 = objc_msgSend(v55, "integerValue");
  v35 = objc_msgSend(v54, "BOOLValue");
  v36 = objc_msgSend(v60, "BOOLValue");
  BYTE2(v47) = objc_msgSend(v59, "BOOLValue");
  BYTE1(v47) = v36;
  LOBYTE(v47) = v35;
  v37 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](self, "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", v58, v72, BYTE4(v47), v57, v56, 0, 0, v67, v71, v34, v47);
  if (v37)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v79) = v49;
        _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_DEBUG, "Setting initial join state: %d", buf, 8u);
      }

    }
    objc_msgSend(v37, "_setJoinState:quietly:", v49, 1);
    objc_msgSend(v37, "_setChatProperties:", v53);
    if (!v37[40])
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v40 = v37[40];
      v37[40] = Mutable;

    }
    if (v37[11] != v66)
      objc_storeStrong(v37 + 11, v66);
    objc_storeStrong(v37 + 77, v52);
    objc_msgSend(v37, "_updateEngramID:", v51);
    if (v37[10] != v65)
      objc_storeStrong(v37 + 10, v65);
    if (v37[75] != v64)
      objc_storeStrong(v37 + 75, v64);
    if ((v49 - 3) <= 1)
    {
      objc_msgSend(v37, "participants");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_setParticipantState:forHandles:postNotification:", 16, v41, 0);

    }
    v37[32] = (id)objc_msgSend(v50, "longLongValue");
    if (objc_msgSend(v63, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v63);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v37[22];
      v37[22] = (id)v42;

    }
    if (objc_msgSend(v62, "count"))
      objc_storeStrong(v37 + 23, v62);
    objc_msgSend(v69, "objectForKey:", *MEMORY[0x1E0D37790]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v37 + 42) = objc_msgSend(v44, "BOOLValue");

    v45 = v37;
  }

  return v37;
}

- (id)valueForChatProperty:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_chatProperties, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSArray)participants
{
  return self->_participants;
}

- (unint64_t)messageCount
{
  void *v2;
  unint64_t v3;

  -[IMItemsController _items](self, "_items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unsigned)chatStyle
{
  return self->_style;
}

- (BOOL)isStewieSharingChat
{
  NSNumber *cachedStewieSharingChat;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  cachedStewieSharingChat = self->_cachedStewieSharingChat;
  if (!cachedStewieSharingChat)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[IMChat emergencyUserInfo](self, "emergencyUserInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInt:", v5 != 0);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedStewieSharingChat;
    self->_cachedStewieSharingChat = v6;

    cachedStewieSharingChat = self->_cachedStewieSharingChat;
  }
  return -[NSNumber BOOLValue](cachedStewieSharingChat, "BOOLValue");
}

- (NSDate)lastFinishedMessageDate
{
  void *v3;
  void *v4;

  -[IMItemsController _lastFinishedMessage](self, "_lastFinishedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "time");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)-[IMChat lastMessageTimeStampOnLoad](self, "lastMessageTimeStampOnLoad"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v4;
}

- (void)_updateEngramID:(id)a3
{
  id v4;
  void *v5;
  NSData **p_engramID;
  NSObject *v7;
  NSData *engramID;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "__im_engramDataRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    p_engramID = &self->_engramID;
    if (-[NSData isEqualToData:](*p_engramID, "isEqualToData:", v5))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v9) = 0;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "EngramIDs are equal, not updating", (uint8_t *)&v9, 2u);
        }
LABEL_11:

      }
    }
    else
    {
      objc_storeStrong((id *)p_engramID, v5);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v9 = 138412290;
          v10 = v4;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Updating engramID string version: %@", (uint8_t *)&v9, 0xCu);
        }
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  engramID = self->_engramID;
  self->_engramID = 0;

LABEL_13:
}

- (unint64_t)stateForParticipant:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  NSMutableDictionary *participantStates;
  void *v9;
  void *v10;

  v4 = a3;
  if (self->_style == 45
    && (-[IMChat participants](self, "participants"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 16;
  }
  else
  {
    participantStates = self->_participantStates;
    objc_msgSend(v4, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](participantStates, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "integerValue");

  }
  return v7;
}

- (id)_initWithGUID:(id)a3 account:(id)a4 style:(unsigned __int8)a5 roomName:(id)a6 displayName:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 items:(id)a10 participants:(id)a11 isFiltered:(int64_t)a12 hasHadSuccessfulQuery:(BOOL)a13 isRecovered:(BOOL)a14 isDeletingIncomingMessages:(BOOL)a15
{
  id v21;
  char *v22;
  id *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void **v27;
  id v28;
  id v29;
  _BOOL4 v30;
  id *v31;
  CFMutableDictionaryRef Mutable;
  id v33;
  CFMutableDictionaryRef v34;
  id v35;
  CFMutableSetRef v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *i;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  _BOOL4 v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  IMOrderingTools *v67;
  NSObject *v68;
  void *v69;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  uint8_t buf[4];
  void *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v74 = a4;
  v72 = a6;
  v73 = a7;
  v76 = a8;
  v75 = a9;
  v21 = a10;
  obj = a11;
  v91.receiver = self;
  v91.super_class = (Class)IMChat;
  v22 = -[IMItemsController _initWithItems:](&v91, sel__initWithItems_, v21);
  v23 = (id *)v22;
  if (v22)
  {
    objc_msgSend(v22, "setIsFiltered:", a12);
    *((_BYTE *)v23 + 60) = 1;
    *((_BYTE *)v23 + 59) = 0;
    *((_BYTE *)v23 + 62) = 0;
    *((_BYTE *)v23 + 67) = 0;
    *((_BYTE *)v23 + 48) = a13;
    *((_BYTE *)v23 + 46) = a14;
    *((_BYTE *)v23 + 47) = a15;
    *((_BYTE *)v23 + 54) = 0;
    *((_BYTE *)v23 + 55) = 0;
    *((_BYTE *)v23 + 40) = 1;
    if (objc_msgSend(v76, "length"))
      objc_storeStrong(v23 + 10, a8);
    if (objc_msgSend(v75, "length"))
      objc_storeStrong(v23 + 75, a9);
    v23[16] = 0;
    objc_msgSend(v23, "chatRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_noteChatInit:", v23);

    +[IMChat chatItemUpdaterLogHandle](IMChat, "chatItemUpdaterLogHandle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D399C8]), "initWithLogHandle:delegate:", v71, v23);
    v26 = v23[67];
    v23[67] = (id)v25;

    objc_storeStrong(v23 + 18, a7);
    objc_storeStrong(v23 + 14, a4);
    *((_BYTE *)v23 + 41) = a5;
    v27 = v23 + 17;
    objc_storeStrong(v23 + 17, a6);
    v28 = obj;
    v29 = obj;
    if (!obj)
    {
      v29 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      v28 = 0;
    }
    v30 = v28 == 0;
    v31 = v23 + 15;
    objc_storeStrong(v23 + 15, v29);
    if (v30)

    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v33 = v23[38];
    v23[38] = Mutable;

    v34 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v35 = v23[40];
    v23[40] = v34;

    v36 = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
    v37 = v23[12];
    v23[12] = v36;

    v23[53] = (id)-1;
    *((_BYTE *)v23 + 50) = 0;
    if (!*v27 && objc_msgSend(v23, "chatStyle") != 45)
    {
      objc_msgSend(v23, "chatRegistry");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "generateUnusedChatIdentifierForGroupChatWithAccount:", v74);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *v27;
      *v27 = (void *)v39;

    }
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v41 = v21;
    v42 = (void *)objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v88;
      while (2)
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(_QWORD *)v88 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v45, "_senderHandle");
          v27 = (void **)objc_claimAutoreleasedReturnValue();
          if (v27 && (objc_msgSend(v45, "isFromMe") & 1) == 0)
          {
            *((_BYTE *)v23 + 50) = objc_msgSend(v45, "_isInvitation");
            if (!objc_msgSend(*v31, "count"))
            {
              v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v27, 0);
              v47 = *v31;
              *v31 = (id)v46;

            }
            goto LABEL_26;
          }

        }
        v42 = (void *)objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
        if (v42)
          continue;
        break;
      }
    }
LABEL_26:

    v48 = v77;
    v49 = v77;
    if (!v77)
    {
      objc_msgSend(v23, "chatIdentifier");
      v27 = (void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "service");
      v31 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "internalName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)IMCopyGUIDForChat();
      v48 = 0;
    }
    v50 = v48 == 0;
    objc_storeStrong(v23 + 13, v49);
    if (v50)
    {

    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v51 = v41;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v84 != v53)
            objc_enumerationMutation(v51);
          v55 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v23, "_configureLocationShareItem:", v55);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v55, "isFinished"))
            *((_BYTE *)v23 + 52) = 1;
        }
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      }
      while (v52);
    }

    if (objc_msgSend(obj, "count"))
    {
      if (qword_1ECF122D0 != -1)
        dispatch_once(&qword_1ECF122D0, &unk_1E471D858);
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v56 = obj;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      if (v57)
      {
        v58 = *(_QWORD *)v80;
        do
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v80 != v58)
              objc_enumerationMutation(v56);
            v60 = v23[38];
            v61 = qword_1ECF122D8;
            objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * k), "guid");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setObject:forKey:", v61, v62);

          }
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
        }
        while (v57);
      }

    }
    if (objc_msgSend(v23, "isBusinessChat") && objc_msgSend(obj, "count"))
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "name");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_setDisplayName:", v64);

    }
    if (objc_msgSend(v23, "isStewieEmergencyChat"))
    {
      if (objc_msgSend(obj, "count"))
      {
        objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
        v65 = objc_claimAutoreleasedReturnValue();
        -[NSObject name](v65, "name");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_setDisplayName:", v66);

      }
      else
      {
        IMLogHandleForCategory();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          sub_1A219762C();
      }

    }
    objc_msgSend(v23, "_initialize");
    if (qword_1ECF122C8 != -1)
      dispatch_once(&qword_1ECF122C8, &unk_1E4720E60);
    if (byte_1EE65F388)
    {
      v67 = objc_alloc_init(IMOrderingTools);
      objc_storeStrong(v23 + 62, v67);
      -[IMOrderingTools startTrackingChat:](v67, "startTrackingChat:", v23);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v23, "orderingTools");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v93 = v69;
          _os_log_impl(&dword_1A1FF4000, v68, OS_LOG_TYPE_INFO, "We are monitoring message ordering under automation {tools %@}", buf, 0xCu);

        }
      }

    }
  }

  return v23;
}

- (BOOL)isBusinessChat
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[IMChat participants](self, "participants", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isBusiness") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setIsFiltered:(int64_t)a3
{
  int64_t isFiltered;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  IMChat *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  isFiltered = self->_isFiltered;
  if (isFiltered != a3)
  {
    if (isFiltered == 2)
    {
      -[IMChat invalidateSpamIndicatorCachedValuesIfNeeded](self, "invalidateSpamIndicatorCachedValuesIfNeeded");
      self->_isFiltered = a3;
    }
    else
    {
      self->_isFiltered = a3;
      if (a3)
        return;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 134218242;
        v8 = -[IMChat isFiltered](self, "isFiltered");
        v9 = 2112;
        v10 = self;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Updating isFiltered to %ld for chat %@", (uint8_t *)&v7, 0x16u);
      }

    }
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatIsFilteredChangedNotification"), 0);
    -[IMChat _updateChatItemsWithDataDetectorResultsForReason:](self, "_updateChatItemsWithDataDetectorResultsForReason:", CFSTR("updateIsFiltered:NO"));
  }
}

- (BOOL)isStewieEmergencyChat
{
  void *v2;
  char v3;

  -[IMChat chatIdentifier](self, "chatIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = IMIsStringStewieEmergency();

  return v3;
}

- (BOOL)isStewieRoadsideChat
{
  void *v2;
  char v3;

  -[IMChat chatIdentifier](self, "chatIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = IMIsStringStewieRoadside();

  return v3;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)chatIdentifier
{
  NSString *identifier;
  int style;
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  void *v13;

  identifier = self->_identifier;
  if (!identifier)
  {
    style = self->_style;
    switch(style)
    {
      case '#':
        -[IMChat roomName](self, "roomName");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = self->_identifier;
        self->_identifier = v8;

        break;
      case '+':
        -[IMChat guid](self, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        IMComponentsFromChatGUID();
        v5 = 0;

        if (v5)
        {
          v11 = (NSString *)v5;
        }
        else
        {
          -[IMChat roomName](self, "roomName");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        v12 = self->_identifier;
        self->_identifier = v11;

        -[NSString uppercaseString](self->_identifier, "uppercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChat setGroupChatIdentifierUppercase:](self, "setGroupChatIdentifierUppercase:", v13);

        goto LABEL_11;
      case '-':
        -[IMChat recipient](self, "recipient");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ID");
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
        v7 = self->_identifier;
        self->_identifier = v6;

LABEL_11:
        break;
    }
    identifier = self->_identifier;
  }
  return identifier;
}

- (IMAccount)account
{
  return self->_account;
}

- (BOOL)_shouldRegisterChat
{
  return 1;
}

- (NSString)personCentricID
{
  return self->_personCentricID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)verifyFiltering
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[IMChat isFiltered](self, "isFiltered"))
  {
    v3 = -[IMChat isCategorized](self, "isCategorized");
    v4 = -[IMChat supportsFilteringExtensions](self, "supportsFilteringExtensions");
    v5 = v4;
    if ((!v4 || v3)
      && ((sub_1A200DA5C() & 1) != 0 || IMIsRunningInUnitTesting())
      && -[IMChat isFiltered](self, "isFiltered"))
    {
      if (v5)
      {
        if (-[IMChat isOscarChat](self, "isOscarChat")
          && -[IMChat containsMessageFromContactOrMe](self, "containsMessageFromContactOrMe"))
        {
          goto LABEL_31;
        }
        if (-[IMChat containsMessageFromContactOrMe](self, "containsMessageFromContactOrMe")
          && (-[IMChat isFiltered](self, "isFiltered") > 1 ? (v6 = 1) : (v6 = v3), (v6 & 1) == 0)
          || -[IMChat hasKnownParticipants](self, "hasKnownParticipants"))
        {
          -[IMChat updateIsFiltered:](self, "updateIsFiltered:", 0);
          -[IMChat clearSMSCategory](self, "clearSMSCategory");
          return;
        }
        if (-[IMChat isStewieChat](self, "isStewieChat") || -[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
LABEL_31:
          -[IMChat updateIsFiltered:](self, "updateIsFiltered:", 0);
      }
      else
      {
        -[IMChat account](self, "account");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "service");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMService smsService](IMServiceImpl, "smsService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
          -[IMChat clearSMSCategory](self, "clearSMSCategory");
        if (-[IMChat containsMessageFromContactOrMe](self, "containsMessageFromContactOrMe")
          || -[IMChat hasKnownParticipants](self, "hasKnownParticipants"))
        {
          -[IMChat updateIsFiltered:](self, "updateIsFiltered:", 0);
        }
        if (-[IMChat shouldBeAllowListed](self, "shouldBeAllowListed")
          || -[IMChat isStewieChat](self, "isStewieChat")
          || -[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
        {
          -[IMChat updateIsFiltered:](self, "updateIsFiltered:", 0);
        }
        if (+[IMChatRegistry hasInitializedChatFiltering](IMChatRegistry, "hasInitializedChatFiltering"))
          MEMORY[0x1E0DE7D20](self, sel_autoReportSpam);
        else
          -[IMChat markAsAutoSpamReported](self, "markAsAutoSpamReported");
      }
    }
  }
}

- (id)chatRegistry
{
  return +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
}

- (void)_setChatProperties:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary **p_chatProperties;
  NSMutableDictionary *chatProperties;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;

  v5 = (NSMutableDictionary *)a3;
  p_chatProperties = &self->_chatProperties;
  chatProperties = self->_chatProperties;
  if (chatProperties != v5)
  {
    v8 = 0;
    v22 = v5;
    if (v5 && chatProperties)
    {
      v9 = -[NSMutableDictionary count](chatProperties, "count");
      v10 = -[NSMutableDictionary count](v22, "count");
      v5 = v22;
      if (v9 == v10)
      {
        v11 = -[NSMutableDictionary isEqualToDictionary:](*p_chatProperties, "isEqualToDictionary:", v22);
        v5 = v22;
        v8 = v11;
      }
      else
      {
        v8 = 0;
      }
    }
    -[NSMutableDictionary valueForKey:](v5, "valueForKey:", CFSTR("wasAutoDetectedForSpam"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");
    -[NSMutableDictionary valueForKey:](*p_chatProperties, "valueForKey:", CFSTR("wasAutoDetectedForSpam"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v8 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      -[NSMutableDictionary valueForKey:](v22, "valueForKey:", *MEMORY[0x1E0D37720]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat associatedBusinessID](self, "associatedBusinessID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "isEqualToString:", v18) ^ 1;

    }
    objc_storeStrong((id *)&self->_chatProperties, a3);
    if (!*p_chatProperties)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v20 = *p_chatProperties;
      *p_chatProperties = (NSMutableDictionary *)Mutable;

    }
    v5 = v22;
    if ((v8 & 1) == 0)
    {
      -[IMChat setWasDetectedAsSMSSpamCacheStatus:](self, "setWasDetectedAsSMSSpamCacheStatus:", 0);
      -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatPropertiesChangedNotification"), 0);
      -[IMChat _delayedInvalidateDowngradeState](self, "_delayedInvalidateDowngradeState");
      if (v13 != v15)
        -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Report spam"), &unk_1E4721158);
      v5 = v22;
      if (v16)
      {
        -[IMChat recipient](self, "recipient");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "associatedBusinessIDChanged");

        v5 = v22;
      }
    }
  }

}

- (IMHandle)recipient
{
  return (IMHandle *)-[NSArray lastObject](self->_participants, "lastObject");
}

- (void)_delayedInvalidateDowngradeState
{
  void *v3;
  void *v4;
  id v5;

  -[IMChat downgradeStateUpdater](self, "downgradeStateUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AC8]), "initWithTarget:action:", self, sel__invalidateDowngradeState);
    -[IMChat setDowngradeStateUpdater:](self, "setDowngradeStateUpdater:", v4);

  }
  -[IMChat downgradeStateUpdater](self, "downgradeStateUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdate");

}

- (IMScheduledUpdater)downgradeStateUpdater
{
  return self->_downgradeStateUpdater;
}

- (void)setDowngradeStateUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_downgradeStateUpdater, a3);
}

- (id)associatedBusinessID
{
  void *v3;

  if (-[IMChat isStewieRoadsideChat](self, "isStewieRoadsideChat"))
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37720]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_postNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstLoad");

  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Notification posted: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__mainThreadPostNotificationName:object:userInfo:", v6, self, v7);

  }
}

+ (BOOL)isGUIDInAttemptingListInScrutinyMode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4 && (objc_msgSend(v4, "isEqualToString:", v3) & 1) != 0;

  return v6;
}

+ (id)chatItemUpdaterLogHandle
{
  if (qword_1EE65F398 != -1)
    dispatch_once(&qword_1EE65F398, &unk_1E4720E80);
  return (id)qword_1EE65F3A0;
}

- (void)setGroupChatIdentifierUppercase:(id)a3
{
  objc_storeStrong((id *)&self->_groupChatIdentifierUppercase, a3);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (id)displayNameWithRawAddress:(BOOL)a3 isSpamFilteringEnabled:(BOOL)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_displayNameWithDescriptor_);
}

- (BOOL)isSMS
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService smsService](IMService, "smsService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

- (id)conversation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeConversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[IMChat mapsToTUConversation:](self, "mapsToTUConversation:", v10))
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)participantHandleIDs
{
  void *v2;
  void *v3;

  -[IMChat participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByApplyingBlock:", &unk_1E4721C50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_compareChat:(id)a3 withDate:(id)a4 withDate:(id)a5
{
  id v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a3;
  v9 = objc_msgSend(a4, "compare:", a5);
  if (!v9)
  {
    v10 = -[IMChat lastFinishedMessageID](self, "lastFinishedMessageID");
    v11 = objc_msgSend(v8, "lastFinishedMessageID");
    v12 = -1;
    if (v11 >= v10)
      v12 = 1;
    if (v11 == v10)
      v9 = 0;
    else
      v9 = v12;
  }

  return v9;
}

- (unint64_t)unreadMessageCount
{
  int64_t dbUnreadCount;

  dbUnreadCount = self->_dbUnreadCount;
  if ((dbUnreadCount | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL)
    return 0;
  else
    return dbUnreadCount & ~(dbUnreadCount >> 63);
}

- (void)setMergedPinningIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mergedPinningIdentifiers, a3);
}

- (void)setHasHadSuccessfulQuery:(BOOL)a3
{
  id v4;

  if (a3 && !self->_hasHadSuccessfulQuery)
  {
    self->_hasHadSuccessfulQuery = a3;
    -[IMChat chatRegistry](self, "chatRegistry");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_markHasHadSuccessfulQueryForChat:", self);

  }
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  int v3;
  int allowedByScreenTime;
  NSObject *v6;
  void *v7;
  int v8;
  IMChat *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))
  {
    allowedByScreenTime = self->_allowedByScreenTime;
    self->_allowedByScreenTime = v3;
    if (allowedByScreenTime != v3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowedByScreenTime);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412546;
          v9 = self;
          v10 = 2112;
          v11 = v7;
          _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "chat: %@ allowedByScreenTime changed to: %@", (uint8_t *)&v8, 0x16u);

        }
      }
      -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatAllowedByScreenTimeChangedNotification"), 0);
      -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", *MEMORY[0x1E0D373C8], 0);
    }
  }
}

- (IMMessage)lastMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _lastMessage](self, "_lastMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (int64_t)lastMessageTimeStampOnLoad
{
  return self->_lastMessageTimeStampOnLoad;
}

- (IMMessage)lastIncomingFinishedMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _lastIncomingFinishedMessage](self, "_lastIncomingFinishedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (IMMessage)lastFinishedMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _lastFinishedMessage](self, "_lastFinishedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (BOOL)isStewieChat
{
  void *v2;
  char v3;

  -[IMChat chatIdentifier](self, "chatIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1A8582818]();

  return v3;
}

- (BOOL)isGroupChat
{
  return -[IMChat chatStyle](self, "chatStyle") != 45;
}

- (BOOL)allowedByScreenTime
{
  void *v3;
  char v4;

  if (!+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))return 1;
  IMSharedDowntimeController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowedToShowConversationForChat:sync:", self, 0);

  return v4;
}

- (id)allChatProperties
{
  return self->_chatProperties;
}

+ (void)setChatItemRulesClass:(Class)a3
{
  qword_1EE65F340 = (uint64_t)a3;
}

- (void)refreshServiceForSending
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1EE65F380 != -1)
    dispatch_once(&qword_1EE65F380, &unk_1E471E320);
  if (byte_1EE65F390)
  {
    IMGetCachedDomainValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v9 = 138412290;
          v10 = v3;
          _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Overriding service for sending to %@ per user-default", (uint8_t *)&v9, 0xCu);
        }

      }
      -[IMChat _targetToService:newComposition:](self, "_targetToService:newComposition:", v4, 0);

      return;
    }
    if (v3 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v3;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Ignoring service for sending override to %@ because service does not exist", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isServiceForSendingRefactorEnabled");

  if (v8)
  {
    if (-[IMChat ignoreDowngradeStatusUpdates](self, "ignoreDowngradeStatusUpdates"))
    {
      -[IMChat setIgnoreDowngradeStatusUpdates:](self, "setIgnoreDowngradeStatusUpdates:", 0);
      if (!-[IMChat downgradeState](self, "downgradeState"))
        -[IMChat _invalidateDowngradeState](self, "_invalidateDowngradeState");
    }
    -[IMChat _refreshServiceForSendingWithDaemon](self, "_refreshServiceForSendingWithDaemon");
  }
  else
  {
    -[IMChat _refreshServiceForSendingWithLegacyPath](self, "_refreshServiceForSendingWithLegacyPath");
  }
}

- (void)_refreshServiceForSendingWithLegacyPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  IMChat *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {

  }
  else
  {
    +[IMService smsService](IMServiceImpl, "smsService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v6)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v4;
          v26 = 2112;
          v27 = self;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "(-refreshServiceForSending) bailing, current service isn't useful: %@, chat %@", buf, 0x16u);
        }

      }
      goto LABEL_18;
    }
  }
  if (-[IMChat ignoreDowngradeStatusUpdates](self, "ignoreDowngradeStatusUpdates"))
  {
    -[IMChat setIgnoreDowngradeStatusUpdates:](self, "setIgnoreDowngradeStatusUpdates:", 0);
    if (!-[IMChat downgradeState](self, "downgradeState"))
      -[IMChat _invalidateDowngradeState](self, "_invalidateDowngradeState");
  }
  -[IMChat participants](self, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__imArrayByApplyingBlock:", &unk_1E471D3B8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v22;
      v26 = 2112;
      v27 = self;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "(-refreshServiceForSending) addresses: %@, chat: %@", buf, 0x16u);
    }

  }
  v10 = -[IMChat shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh");
  v21 = -[IMChat receivedResponseForChat](self, "receivedResponseForChat");
  -[IMChat account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loginIMHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_stripFZIDPrefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  IMChatCanonicalIDSIDsForAddress();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[IMChat _resetForceServerStatusRefresh](self, "_resetForceServerStatusRefresh");
  -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IMChat isDowngraded](self, "isDowngraded");
  -[IMChat account](self, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1A2029C64;
  v23[3] = &unk_1E471E1A0;
  v23[4] = self;
  IMChatCalculateServiceForSendingNewComposeMaybeForceWithKTData(v22, self, v15, v16, v17, 0, 0, 0, v18, v21, v20, v23);

LABEL_18:
}

- (void)downgradeMessage:(id)a3 manualDowngrade:(BOOL)a4
{
  MEMORY[0x1E0DE7D20](self, sel_downgradeMessage_manualDowngrade_downgradeChat_);
}

- (void)downgradeMessage:(id)a3 manualDowngrade:(BOOL)a4 downgradeChat:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  id v9;

  v5 = a5;
  v6 = a4;
  -[IMChat participants](self, "participants", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    if (v5)
      -[IMChat _updateDowngradeState:checkAgainInterval:](self, "_updateDowngradeState:checkAgainInterval:", 1, 0.0);
    else
      -[IMChat _setAndIncrementDowngradeMarkersForManual:](self, "_setAndIncrementDowngradeMarkersForManual:", v6);
  }
  +[IMService smsService](IMService, "smsService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat _targetToService:newComposition:](self, "_targetToService:newComposition:", v8, 0);

}

- (BOOL)_accountIsOperational:(id)a3 forService:(id)a4
{
  id v5;
  char v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    v7 = a4;
    objc_msgSend(v5, "service");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v7)
      v6 = objc_msgSend(v5, "_isUsableForSending");
    else
      v6 = 0;
  }

  return v6;
}

- (id)_previousAccountForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = a3;
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("CKChatPreviousAccountsDictionaryKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountForUniqueID:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_setPreviousAccount:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v6)
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("CKChatPreviousAccountsDictionaryKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = (id)objc_msgSend(v7, "mutableCopy");
    else
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v9;
    if (v14)
    {
      objc_msgSend(v14, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_10:
        -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v10, CFSTR("CKChatPreviousAccountsDictionaryKey"));

        goto LABEL_11;
      }
      objc_msgSend(v14, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v12, v13);

    }
    else
    {
      objc_msgSend(v6, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v12);
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (void)_targetToService:(id)a3 newComposition:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  char *v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  char *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMChat account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMChat _accountIsOperational:forService:](self, "_accountIsOperational:forService:", v7, v6);

  if (!v8 || v4)
  {
    -[IMChat account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat _previousAccountForService:](self, "_previousAccountForService:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (-[IMChat _accountIsOperational:forService:](self, "_accountIsOperational:forService:", v11, v6))
      {
        v12 = v11;
        -[IMChat _setPreviousAccount:forService:](self, "_setPreviousAccount:forService:", 0, v6);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "name");
            v14 = (char *)(id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 138412802;
            v34 = v14;
            v35 = 2112;
            v36 = v15;
            v37 = 2112;
            v38 = v12;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Targeting chat from [%@] to [%@] with preference to previous account: %@", (uint8_t *)&v33, 0x20u);

          }
        }
        if (!v4)
          goto LABEL_33;
LABEL_13:
        +[IMService smsService](IMServiceImpl, "smsService");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = v16 == v6;

        if (v17)
        {
          v21 = v12;
        }
        else
        {
          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat participants](self, "participants");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "arrayByApplyingSelector:", &sel_ID);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_bestAccountForAddresses:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "service");
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = v22 == v6;

          if (!v23)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                v33 = 138412546;
                v34 = (const char *)v21;
                v35 = 2112;
                v36 = v6;
                _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Account returned [%@] did not match the service we wanted [%@], moving to the default account", (uint8_t *)&v33, 0x16u);
              }

            }
            IMPreferredAccountForService(v6);
            v25 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v25;
          }
          if ((objc_msgSend(v21, "_isUsableForSending") & 1) != 0)
          {
            v12 = v21;
LABEL_28:
            v27 = IMOSLoggingEnabled();
            if (!v12)
            {
              if (v27)
              {
                OSLogHandleForIMFoundationCategory();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  v33 = 136315138;
                  v34 = "-[IMChat(IMChat_ServiceForSending) _targetToService:newComposition:]";
                  _os_log_impl(&dword_1A1FF4000, v32, OS_LOG_TYPE_INFO, "In (%s), expected to target to a useable account, but didn't have one", (uint8_t *)&v33, 0xCu);
                }

              }
              v12 = 0;
              goto LABEL_39;
            }
            if (v27)
            {
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v10, "name");
                v29 = (char *)(id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "name");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = 138412802;
                v34 = v29;
                v35 = 2112;
                v36 = v30;
                v37 = 2112;
                v38 = v12;
                _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "Targeting chat from [%@] to [%@] with using the default account: %@", (uint8_t *)&v33, 0x20u);

              }
            }
LABEL_33:
            -[IMChat _setAccount:](self, "_setAccount:", v12);
            objc_msgSend(v9, "service");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMChat _setPreviousAccount:forService:](self, "_setPreviousAccount:forService:", v9, v31);

LABEL_39:
            goto LABEL_40;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              v33 = 138412546;
              v34 = (const char *)v21;
              v35 = 2112;
              v36 = v6;
              _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Account returned [%@] is not operational [%@], moving to the default account", (uint8_t *)&v33, 0x16u);
            }

          }
        }
        IMPreferredAccountForService(v6);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      }
      -[IMChat _setPreviousAccount:forService:](self, "_setPreviousAccount:forService:", 0, v6);
    }
    v12 = 0;
    goto LABEL_13;
  }
LABEL_40:

}

- (BOOL)isDowngraded
{
  return -[IMChat downgradeState](self, "downgradeState") == 1;
}

- (void)_updateDowngradeState:(char)a3 checkAgainInterval:(double)a4
{
  uint64_t v5;
  int v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  IMChat *v20;
  _BYTE v21[22];
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = -[IMChat downgradeState](self, "downgradeState");
  if (-[IMChat downgradeState](self, "downgradeState") != (_DWORD)v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = -[IMChat downgradeState](self, "downgradeState");
        if (v9 == 1)
          v10 = CFSTR("Downgraded");
        else
          v10 = CFSTR("Unknown");
        if (v9 == 2)
          v10 = CFSTR("Upgraded");
        v11 = v10;
        if ((_DWORD)v5 == 1)
          v12 = CFSTR("Downgraded");
        else
          v12 = CFSTR("Unknown");
        if ((_DWORD)v5 == 2)
          v12 = CFSTR("Upgraded");
        v13 = v12;
        v14 = v13;
        *(_DWORD *)v21 = 138413314;
        v15 = CFSTR("NO");
        *(_QWORD *)&v21[4] = self;
        if (!v7)
          v15 = CFSTR("YES");
        *(_WORD *)&v21[12] = 2112;
        *(_QWORD *)&v21[14] = v11;
        v22 = 2112;
        v23 = v13;
        v24 = 2112;
        v25 = v15;
        v26 = 2048;
        v27 = a4;

      }
    }
    -[IMChat setDowngradeState:](self, "setDowngradeState:", v5, *(_OWORD *)v21);
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Posting downgrade state changed notification", v21, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("__kIMChatDowngradeStatusChanged"), self, 0);

      -[IMChat setLocalUserIsTyping:](self, "setLocalUserIsTyping:", 0);
    }
  }
  if (a4 > 0.0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v21 = 67109120;
        *(_DWORD *)&v21[4] = (int)a4;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Scheduling timer to recalculate downgrade time in %d seconds", v21, 8u);
      }

    }
    v19 = (void *)MEMORY[0x1E0DE7910];
    v20 = self;
    objc_msgSend(v19, "cancelPreviousPerformRequestsWithTarget:selector:object:", v20, sel__calculateDowngradeStateTimerFired, 0);
    -[IMChat performSelector:withObject:afterDelay:](v20, "performSelector:withObject:afterDelay:", sel__calculateDowngradeStateTimerFired, 0, a4);

  }
}

- (void)_calculateDowngradeStateTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Downgrade state recalculate timer fired", v4, 2u);
    }

  }
  -[IMChat _calculateDowngradeState](self, "_calculateDowngradeState");
}

- (id)_consecutiveDowngradeAttemptsViaManualDowngrades:(BOOL)a3
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0D36C38];
  if (!a3)
    v3 = (_QWORD *)MEMORY[0x1E0D36C28];
  return -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *v3);
}

- (void)_clearDowngradeMarkers
{
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", 0, *MEMORY[0x1E0D36C38]);
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", 0, *MEMORY[0x1E0D36C28]);
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", 0, *MEMORY[0x1E0D36C30]);
}

- (void)_setAndIncrementDowngradeMarkersForManual:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:");
  v8 = (id *)MEMORY[0x1E0D36C38];
  if (!v3)
    v8 = (id *)MEMORY[0x1E0D36C28];
  v9 = *v8;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "unsignedIntegerValue") + 1;
  else
    v12 = 1;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v12);
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v13, v9);

}

- (BOOL)_recipientIsPhoneNumber
{
  void *v2;
  void *v3;
  char v4;

  -[IMChat recipient](self, "recipient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_appearsToBePhoneNumber");

  return v4;
}

- (BOOL)suppressAccountRetargetingForNamedGroupConversation
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[IMChat shouldIgnoreiMessageSiblingGroupIdentityUpdates](self, "shouldIgnoreiMessageSiblingGroupIdentityUpdates")|| -[IMChat chatStyle](self, "chatStyle") == 45)
  {
    return 0;
  }
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_hasChat:forService:", self, v5))
  {
    -[IMChat displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldForceServerStatusRefresh
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  if (!-[IMChat supportsCapabilities:](self, "supportsCapabilities:", 512))
    goto LABEL_3;
  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[IMChat lastSentMessage](self, "lastSentMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      goto LABEL_7;
    objc_msgSend(v8, "sender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastUndeliveredMessageGUIDForForcedQuery](self, "lastUndeliveredMessageGUIDForForcedQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v11 == v12)
      v6 = (objc_msgSend(v9, "isDelivered") | v15) ^ 1;
    else
LABEL_7:
      LOBYTE(v6) = 0;

  }
  else
  {
LABEL_3:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_resetForceServerStatusRefresh
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[IMChat lastSentMessage](self, "lastSentMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat setLastUndeliveredMessageGUIDForForcedQuery:](self, "setLastUndeliveredMessageGUIDForForcedQuery:", v4);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "guid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Stopping force queries while last sent message is %@", (uint8_t *)&v7, 0xCu);

    }
  }

}

- (unint64_t)capabilities
{
  uint64_t v3;
  unint64_t v4;

  if (-[IMChat _supportsUndoSend](self, "_supportsUndoSend"))
    v3 = 2;
  else
    v3 = 0;
  v4 = v3 | -[IMChat _supportsEditMessage](self, "_supportsEditMessage");
  if (-[IMChat _supportsNameAndPhoto](self, "_supportsNameAndPhoto"))
    v4 |= 8uLL;
  if (-[IMChat _supportsAudioMessages](self, "_supportsAudioMessages"))
    v4 |= 0x40uLL;
  if (-[IMChat _supportsGroupIdentity](self, "_supportsGroupIdentity"))
    v4 |= 0x10uLL;
  if (-[IMChat _supportsGroupMutability](self, "_supportsGroupMutability"))
    v4 |= 0x20uLL;
  if (-[IMChat _supportsInlineReply](self, "_supportsInlineReply"))
    v4 |= 4uLL;
  if (-[IMChat _supportsMentions](self, "_supportsMentions"))
    v4 |= 0x80uLL;
  if (-[IMChat _supportsDeleteAndBlockGroup](self, "_supportsDeleteAndBlockGroup"))
    v4 |= 0x100uLL;
  if (-[IMChat _supportsDeliveryReceipts](self, "_supportsDeliveryReceipts"))
    v4 |= 0x200uLL;
  if (-[IMChat _supportsFaceTime](self, "_supportsFaceTime"))
    v4 |= 0x400uLL;
  if (-[IMChat _supportsSendMenu](self, "_supportsSendMenu"))
    v4 |= 0x800uLL;
  if (-[IMChat _supportsShareLocation](self, "_supportsShareLocation"))
    v4 |= 0x1000uLL;
  if (-[IMChat _supportsSimSwitch](self, "_supportsSimSwitch"))
    v4 |= 0x2000uLL;
  if (-[IMChat _supportsAlternativeCommunicationActions](self, "_supportsAlternativeCommunicationActions"))
    v4 |= 0x4000uLL;
  if (-[IMChat _supportsAttachments](self, "_supportsAttachments"))
    v4 |= 0x10000uLL;
  if (-[IMChat _supportsStickers](self, "_supportsStickers"))
    v4 |= 0x8000uLL;
  if (-[IMChat _supportsMessageEffects](self, "_supportsMessageEffects"))
    v4 |= 0x20000uLL;
  if (-[IMChat _supportsTapbacks](self, "_supportsTapbacks"))
    v4 |= 0x40000uLL;
  if (-[IMChat _supportsSendLater](self, "_supportsSendLater"))
    v4 |= 0x80000uLL;
  if (-[IMChat _supportsInlineAdaptiveImageGlyphs](self, "_supportsInlineAdaptiveImageGlyphs"))
    v4 |= 0x400000uLL;
  if (-[IMChat _supportsExpressiveText](self, "_supportsExpressiveText"))
    v4 |= 0x100000uLL;
  if (-[IMChat _supportsFocusMode](self, "_supportsFocusMode"))
    return v4 | 0x200000;
  else
    return v4;
}

- (BOOL)supportsCapabilities:(unint64_t)a3
{
  return (a3 & ~-[IMChat capabilities](self, "capabilities")) == 0;
}

- (BOOL)_isHybridGroupEligibleByCarrier
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD block[5];

  if (-[IMChat _isSMSService](self, "_isSMSService"))
  {
    v3 = (void *)MEMORY[0x1E0D39730];
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v3, "IMMMSGroupTextReplicationSupportedForPhoneNumber:simID:", v4, v5);

    return (char)v3;
  }
  else if (-[IMChat _isRCSService](self, "_isRCSService"))
  {
    objc_msgSend(MEMORY[0x1E0D39728], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "groupTextReplicationSupportedForPhoneNumber:simID:", v8, v9);

    return v10;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A2033940;
    block[3] = &unk_1E471E348;
    block[4] = self;
    if (qword_1EE65F400 != -1)
      dispatch_once(&qword_1EE65F400, block);
    return 1;
  }
}

- (BOOL)_isHybridGroup
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!-[IMChat hybridGroupState](self, "hybridGroupState"))
  {
    v3 = -[IMChat _uncachedHybridGroupStatus](self, "_uncachedHybridGroupStatus");
    v4 = v3 ? 2 : 1;
    -[IMChat setHybridGroupState:](self, "setHybridGroupState:", v4);
    -[IMChat _updateLastKnownHybridState:](self, "_updateLastKnownHybridState:", v3);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7[0] = 67109120;
        v7[1] = -[IMChat hybridGroupState](self, "hybridGroupState");
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Hybrid group state unknown, updated to %d", (uint8_t *)v7, 8u);
      }

    }
  }
  return -[IMChat hybridGroupState](self, "hybridGroupState") == 2;
}

- (BOOL)_uncachedHybridGroupStatus
{
  return -[IMChat _uncachedHybridGroupStatusWithIDSQueryResults:](self, "_uncachedHybridGroupStatusWithIDSQueryResults:", 0);
}

- (BOOL)_canPossiblyBecomeHybrid
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsReplication");

  if ((v5 & 1) == 0)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Chat is not Hybrid, not using SMS service", buf, 2u);
    }
LABEL_8:

    return 0;
  }
  if (!-[IMChat _isHybridGroupEligibleByCarrier](self, "_isHybridGroupEligibleByCarrier"))
  {
    if (!IMOSLoggingEnabled())
      return 0;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Chat is not Hybrid, disabled by carrier", buf, 2u);
    }
    goto LABEL_8;
  }
  -[IMChat participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {

    goto LABEL_23;
  }
  v8 = -[IMChat chatStyle](self, "chatStyle");

  if (v8 != 43)
  {
LABEL_23:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[IMChat participants](self, "participants");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v27 = objc_msgSend(v17, "count");
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Chat is not Hybrid, not enough participants: %lu", buf, 0xCu);

      }
    }
    return 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[IMChat participants](self, "participants", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "ID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1A858280C]();

        if ((v14 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              -[IMChat participants](self, "participants");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v27 = (uint64_t)v20;
              _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Chat is not Hybrid, not all handles are phone number: %@", buf, 0xCu);

            }
          }
          v15 = 0;
          goto LABEL_34;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_34:

  return v15;
}

- (BOOL)_uncachedHybridGroupStatusWithIDSQueryResults:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMChat _canPossiblyBecomeHybrid](self, "_canPossiblyBecomeHybrid"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[IMChat participants](self, "participants", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "ID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          IMChatCanonicalIDSIDsForAddress();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    if (!v4
      || (v13 = objc_msgSend(v4, "count"),
          -[IMChat participants](self, "participants"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "count"),
          v14,
          v13 != v15))
    {
      v16 = (void *)MEMORY[0x1E0D39880];
      IMServiceNameForCanonicalIDSAddresses();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_currentIDStatusForDestinations:service:listenerID:", v5, v17, CFSTR("IMChat+Capabilities"));
      v18 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v18;
    }
    v19 = -[IMChat _idsQueryResultsHaveMixedIDSStatus:](self, "_idsQueryResultsHaveMixedIDSStatus:", v4);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_reachabilityResultHasMixedStatus:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "allAreReachable") & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v4, "handleResults", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isReachable") & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_uncachedHybridGroupStatusWithReachabilityResult:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[IMChat _canPossiblyBecomeHybrid](self, "_canPossiblyBecomeHybrid"))
    v5 = -[IMChat _reachabilityResultHasMixedStatus:](self, "_reachabilityResultHasMixedStatus:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_idsQueryResultsHaveMixedIDSStatus:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  const char *v6;
  uint8_t v8[16];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A2034340;
  v9[3] = &unk_1E471E5C8;
  v9[4] = &v14;
  v9[5] = &v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (!v15[3])
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        v6 = "Chat is not Hybrid, not enough iMessageable participants";
LABEL_10:
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, v6, v8, 2u);
      }
LABEL_11:

    }
LABEL_12:
    v4 = 0;
    goto LABEL_13;
  }
  if (!v11[3])
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        v6 = "Chat is not Hybrid, not enough non-iMessageable participants";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v4 = 1;
LABEL_13:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v4;
}

- (BOOL)_isiMessageService
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F68]);

  return v5;
}

- (BOOL)_isSMSService
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  return v5;
}

- (BOOL)_isRCSService
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F50]);

  return v5;
}

- (BOOL)_isReplicatingService
{
  void *v2;
  void *v3;
  char v4;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsReplication");

  return v4;
}

- (BOOL)_isiMessageLiteServiceOrInCompatibleMode
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (-[IMChat shouldDisplayOffGridModeStatus](self, "shouldDisplayOffGridModeStatus"))
    return 1;
  -[IMChat account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D38F70]);

  return v7;
}

- (BOOL)_isSMSSatelliteService
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F60]);

  return v5;
}

- (BOOL)_serviceCapabilityEnabled:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[IMChat _serviceForCapabilityCheck](self, "_serviceForCapabilityCheck");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "supportsCapability:", v4) & 1) != 0
    || objc_msgSend(v5, "supportsReplication")
    && -[IMChat _isHybridGroup](self, "_isHybridGroup")
    && (objc_msgSend(v5, "supportsReplicationCapability:", v4) & 1) != 0;

  return v6;
}

- (id)_serviceForCapabilityCheck
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[IMChat shouldForceToSMS](self, "shouldForceToSMS"))
  {
    +[IMService smsService](IMServiceImpl, "smsService");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[IMChat shouldDisplayOffGridModeStatus](self, "shouldDisplayOffGridModeStatus"))
    {
      -[IMChat account](self, "account");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "service");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    +[IMService iMessageLiteService](IMServiceImpl, "iMessageLiteService");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  return v4;
}

- (BOOL)_supportsInlineReply
{
  if (-[IMChat isBusinessChat](self, "isBusinessChat")
    || -[IMChat isMakoChat](self, "isMakoChat")
    || -[IMChat isAppleChat](self, "isAppleChat")
    || -[IMChat isReadOnly](self, "isReadOnly")
    || -[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
  {
    return 0;
  }
  else
  {
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
  }
}

- (BOOL)_supportsUndoSend
{
  if (-[IMChat isReadOnly](self, "isReadOnly"))
    return 0;
  else
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
}

- (BOOL)_supportsEditMessage
{
  if (-[IMChat isReadOnly](self, "isReadOnly"))
    return 0;
  else
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
}

- (BOOL)_supportsMentions
{
  if (-[IMChat isBusinessChat](self, "isBusinessChat")
    || -[IMChat isReadOnly](self, "isReadOnly")
    || -[IMChat isStewieChat](self, "isStewieChat"))
  {
    return 0;
  }
  else
  {
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
  }
}

- (BOOL)_supportsDeleteAndBlockGroup
{
  BOOL v3;

  v3 = -[IMChat isSMS](self, "isSMS");
  return v3 & -[IMChat isGroupChat](self, "isGroupChat");
}

- (BOOL)_supportsDeliveryReceipts
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "supportsCapability:", *MEMORY[0x1E0D38DC0]))
    v5 = -[IMChat chatStyle](self, "chatStyle") == 45;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_supportsNameAndPhoto
{
  if (-[IMChat isBusinessChat](self, "isBusinessChat") || -[IMChat isReadOnly](self, "isReadOnly"))
    return 0;
  else
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
}

- (BOOL)_supportsAudioMessages
{
  void *v3;
  uint64_t v4;

  -[IMChat participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 && !-[IMChat isReadOnly](self, "isReadOnly"))
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
  else
    return 0;
}

- (BOOL)_supportsGroupIdentity
{
  int v3;
  void *v4;
  char v5;

  v3 = -[IMChat isGroupChat](self, "isGroupChat");
  if (v3)
  {
    if (-[IMChat hasLeftGroup](self, "hasLeftGroup") || -[IMChat isReadOnly](self, "isReadOnly"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSatelliteConnectionActive");

      LOBYTE(v3) = v5 ^ 1;
    }
  }
  return v3;
}

- (BOOL)_supportsGroupMutability
{
  void *v4;
  void *v5;
  char v6;

  if (!-[IMChat isGroupChat](self, "isGroupChat")
    || -[IMChat hasLeftGroup](self, "hasLeftGroup")
    || -[IMChat isReadOnly](self, "isReadOnly"))
  {
    return 0;
  }
  -[IMChat account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsMutatingGroupMembers");

  return v6;
}

- (BOOL)_supportsFaceTime
{
  void *v3;
  char v4;

  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSatelliteConnectionActive");

  if ((v4 & 1) != 0 || -[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
    return 0;
  else
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
}

- (BOOL)_supportsSendMenu
{
  int v3;

  if (-[IMChat isReadOnly](self, "isReadOnly"))
    goto LABEL_4;
  v3 = -[IMChat _supportsAttachments](self, "_supportsAttachments");
  if (v3)
  {
    if ((IMIsRunningInMessagesViewService() & 1) != 0)
    {
LABEL_4:
      LOBYTE(v3) = 0;
      return v3;
    }
    LOBYTE(v3) = IMIsRunningInMessagesTranscriptExtension() ^ 1;
  }
  return v3;
}

- (BOOL)_supportsExpressiveText
{
  if (-[IMChat isReadOnly](self, "isReadOnly")
    || -[IMChat isBusinessChat](self, "isBusinessChat")
    || -[IMChat isMakoChat](self, "isMakoChat")
    || -[IMChat isAppleChat](self, "isAppleChat")
    || -[IMChat isStewieChat](self, "isStewieChat")
    || -[IMChat isStewieEmergencyChat](self, "isStewieEmergencyChat")
    || -[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
  {
    return 0;
  }
  else
  {
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
  }
}

- (BOOL)_supportsFocusMode
{
  void *v3;
  char v4;

  if (-[IMChat chatStyle](self, "chatStyle") != 45)
    return 0;
  if (-[IMChat isReadOnly](self, "isReadOnly"))
    return 0;
  if (-[IMChat isBusinessChat](self, "isBusinessChat"))
    return 0;
  if (-[IMChat isMakoChat](self, "isMakoChat"))
    return 0;
  if (-[IMChat isAppleChat](self, "isAppleChat"))
    return 0;
  if (-[IMChat isStewieChat](self, "isStewieChat"))
    return 0;
  if (-[IMChat isStewieEmergencyChat](self, "isStewieEmergencyChat"))
    return 0;
  if (-[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
    return 0;
  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSatelliteConnectionActive");

  if ((v4 & 1) != 0)
    return 0;
  else
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
}

- (BOOL)_supportsShareLocation
{
  if (-[IMChat hasLeftGroup](self, "hasLeftGroup")
    || -[IMChat isReadOnly](self, "isReadOnly")
    || -[IMChat _isiMessageLiteServiceOrInCompatibleMode](self, "_isiMessageLiteServiceOrInCompatibleMode"))
  {
    return 0;
  }
  else
  {
    return !-[IMChat _isSMSSatelliteService](self, "_isSMSSatelliteService");
  }
}

- (BOOL)_supportsSimSwitch
{
  void *v3;
  char v4;

  if (-[IMChat isReadOnly](self, "isReadOnly"))
    return 0;
  if (-[IMChat hasLeftGroup](self, "hasLeftGroup"))
    return 0;
  if (-[IMChat isGroupChat](self, "isGroupChat")
    && (+[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isSatelliteConnectionActive"),
        v3,
        (v4 & 1) != 0))
  {
    return 0;
  }
  else
  {
    return IMSharedHelperDeviceHasMultipleActiveSubscriptions();
  }
}

- (BOOL)_supportsAlternativeCommunicationActions
{
  void *v4;
  char v5;

  if (-[IMChat _isiMessageLiteServiceOrInCompatibleMode](self, "_isiMessageLiteServiceOrInCompatibleMode")
    || -[IMChat _isSMSSatelliteService](self, "_isSMSSatelliteService"))
  {
    return 0;
  }
  if (!-[IMChat isGroupChat](self, "isGroupChat"))
    return 1;
  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSatelliteConnectionActive");

  return v5 ^ 1;
}

- (BOOL)_supportsAttachments
{
  void *v3;
  char v4;

  if (-[IMChat isGroupChat](self, "isGroupChat")
    && (+[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isSatelliteConnectionActive"),
        v3,
        (v4 & 1) != 0))
  {
    return 0;
  }
  else
  {
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
  }
}

- (BOOL)_supportsMultiPart
{
  void *v2;
  void *v3;
  char v4;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCapability:", *MEMORY[0x1E0D38E38]);

  return v4;
}

- (BOOL)_supportsStickers
{
  void *v3;
  char v4;

  if (-[IMChat isBusinessChat](self, "isBusinessChat"))
    return 0;
  if (-[IMChat isGroupChat](self, "isGroupChat"))
  {
    +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSatelliteConnectionActive");

    if ((v4 & 1) != 0)
      return 0;
  }
  if (-[IMChat isStewieChat](self, "isStewieChat")
    || -[IMChat isStewieEmergencyChat](self, "isStewieEmergencyChat")
    || -[IMChat isStewieSharingChat](self, "isStewieSharingChat")
    || -[IMChat isStewieRoadsideChat](self, "isStewieRoadsideChat"))
  {
    return 0;
  }
  else
  {
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
  }
}

- (BOOL)_supportsMessageEffects
{
  if (-[IMChat isBusinessChat](self, "isBusinessChat") || -[IMChat isStewieChat](self, "isStewieChat"))
    return 0;
  else
    return !-[IMChat _isSMSSatelliteService](self, "_isSMSSatelliteService");
}

- (BOOL)_supportsTapbacks
{
  if (-[IMChat isStewieChat](self, "isStewieChat") || -[IMChat isStewieEmergencyChat](self, "isStewieEmergencyChat"))
    return 0;
  else
    return !-[IMChat isStewieSharingChat](self, "isStewieSharingChat");
}

- (BOOL)_supportsSendLater
{
  if (-[IMChat isBusinessChat](self, "isBusinessChat")
    || -[IMChat isMakoChat](self, "isMakoChat")
    || -[IMChat isAppleChat](self, "isAppleChat")
    || -[IMChat isStewieChat](self, "isStewieChat")
    || -[IMChat isStewieEmergencyChat](self, "isStewieEmergencyChat")
    || -[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
  {
    return 0;
  }
  else
  {
    return MEMORY[0x1E0DE7D20](self, sel__serviceCapabilityEnabled_);
  }
}

- (BOOL)_supportsInlineAdaptiveImageGlyphs
{
  void *v3;
  _BOOL4 v4;

  -[IMChat _serviceForCapabilityCheck](self, "_serviceForCapabilityCheck");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "supportsCapability:", *MEMORY[0x1E0D38E10])
    || !-[IMChat _supportsAttachments](self, "_supportsAttachments")
    || -[IMChat isBusinessChat](self, "isBusinessChat")
    || -[IMChat isMakoChat](self, "isMakoChat")
    || -[IMChat isAppleChat](self, "isAppleChat")
    || -[IMChat isStewieChat](self, "isStewieChat")
    || -[IMChat isStewieEmergencyChat](self, "isStewieEmergencyChat"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = !-[IMChat isStewieSharingChat](self, "isStewieSharingChat");
  }

  return v4;
}

- (void)_updateHybridGroupStateWithPerParticipantIDSStatus:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMChat _uncachedHybridGroupStatusWithIDSQueryResults:](self, "_uncachedHybridGroupStatusWithIDSQueryResults:", v4);
  if (v5)
    v6 = 2;
  else
    v6 = 1;
  -[IMChat setHybridGroupState:](self, "setHybridGroupState:", v6);
  -[IMChat _updateLastKnownHybridState:](self, "_updateLastKnownHybridState:", v5);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = -[IMChat hybridGroupState](self, "hybridGroupState");
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Updating hybrid group state to %d using provided IDS statuses", (uint8_t *)v8, 8u);
    }

  }
}

- (void)_updateHybridGroupStateWithReachabilityResult:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMChat _uncachedHybridGroupStatusWithReachabilityResult:](self, "_uncachedHybridGroupStatusWithReachabilityResult:", v4);
  if (v5)
    v6 = 2;
  else
    v6 = 1;
  -[IMChat setHybridGroupState:](self, "setHybridGroupState:", v6);
  -[IMChat _updateLastKnownHybridState:](self, "_updateLastKnownHybridState:", v5);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = -[IMChat hybridGroupState](self, "hybridGroupState");
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Updating hybrid group state to %d using provided IDS statuses", (uint8_t *)v8, 8u);
    }

  }
}

- (BOOL)mapsToTUConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMChat chatStyle](self, "chatStyle") == 43)
  {
    -[IMChat groupID](self, "groupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagesGroupUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          -[IMChat chatIdentifier](self, "chatIdentifier");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagesGroupUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          -[IMChat groupID](self, "groupID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412802;
          v30 = v10;
          v31 = 2112;
          v32 = v12;
          v33 = 2112;
          v34 = v13;
          _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "We mapped a chat %@ to a TUConversation with messagesGroupUUID %@ for chat groupID %@", (uint8_t *)&v29, 0x20u);

        }
      }
      LOBYTE(v14) = 1;
      goto LABEL_19;
    }
LABEL_16:
    LOBYTE(v14) = 0;
    goto LABEL_19;
  }
  -[IMChat participants](self, "participants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 != 1)
    goto LABEL_16;
  objc_msgSend(v4, "remoteMembers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") == 1)
  {
    -[IMChat participants](self, "participants");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DBD2F8];
    objc_msgSend(v19, "ID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "normalizedHandleWithDestinationID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = TUHandlesAreCanonicallyEqual();
    if (v14 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        -[IMChat chatIdentifier](self, "chatIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v27;
        v31 = 2112;
        v32 = v4;
        _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "We mapped a 1x1 chat %@ to a TUConversation: %@", (uint8_t *)&v29, 0x16u);

      }
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

LABEL_19:
  return v14;
}

- (void)addHandlesToGroupFaceTimeChatIfRegistered:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[8];
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[IMChat conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "__imArrayByApplyingBlock:", &unk_1E471D438);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D39880];
    v8 = *MEMORY[0x1E0D34218];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1A2035C68;
    v10[3] = &unk_1E471E750;
    v11 = v5;
    objc_msgSend(v7, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v6, v8, CFSTR("IMChat+TelephonyUtilities"), MEMORY[0x1E0C80D38], v10);

  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_4;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "No paired Group FaceTime conversation to keep in sync", v9, 2u);
    }
  }

LABEL_4:
}

- (id)conversationWithUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeConversations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v3);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)joinExistingTUConversationWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMChat conversationWithUUID:](self, "conversationWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Found conversation %@", (uint8_t *)&v8, 0xCu);
      }

    }
    -[IMChat joinExistingConversation:](self, "joinExistingConversation:", v5);
  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1A2196170((uint64_t)v4, v7);

  }
}

- (void)joinExistingTUConversation
{
  id v3;

  -[IMChat conversation](self, "conversation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat joinExistingConversation:](self, "joinExistingConversation:", v3);

}

- (void)joinExistingConversation:(id)a3
{
  id v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  _BYTE v12[24];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMDeviceIsGreenTea())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeShowInCallUIURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TUOpenURL();

  }
  else
  {
    v5 = +[IMFaceTimeUtilities conversationIsVideoCall:](IMFaceTimeUtilities, "conversationIsVideoCall:", v3);
    v6 = +[IMFaceTimeUtilities platformSupportsStagingArea](IMFaceTimeUtilities, "platformSupportsStagingArea") & v5;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "UUID");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = CFSTR("NO");
        if (v5)
          v11 = CFSTR("YES");
        else
          v11 = CFSTR("NO");
        *(_DWORD *)v12 = 138412802;
        *(_QWORD *)&v12[4] = v8;
        *(_QWORD *)&v12[14] = v11;
        *(_WORD *)&v12[12] = 2112;
        if ((_DWORD)v6)
          v10 = CFSTR("YES");
        *(_WORD *)&v12[22] = 2112;
        v13 = v10;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Join TUConversation UUID: %@, isVideoCall: %@, wantsStagingArea: %@", v12, 0x20u);

      }
    }
    +[IMFaceTimeUtilities joinExistingConversationForTUCoversation:videoEnabled:wantsStagingArea:](IMFaceTimeUtilities, "joinExistingConversationForTUCoversation:videoEnabled:wantsStagingArea:", v3, v5, v6, *(_OWORD *)v12, *(_QWORD *)&v12[16]);
  }

}

- (void)initiateTUConversationWithVideoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v17 = 138412290;
      v18 = (unint64_t)v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] We want to initiate a TUConversation withVideo %@", (uint8_t *)&v17, 0xCu);
    }

  }
  if (-[IMChat joinState](self, "joinState"))
  {
    -[IMChat participants](self, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = objc_msgSend(MEMORY[0x1E0DBD298], "maximumNumberOfInvitedMembers") + 1;
    if (v8 - 1 < v9)
    {
      -[IMChat participants](self, "participants");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat groupID](self, "groupID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat displayName](self, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMFaceTimeUtilities initiateTUConversationForParticipants:senderAddress:videoEnabled:groupID:displayName:screenShareType:](IMFaceTimeUtilities, "initiateTUConversationForParticipants:senderAddress:videoEnabled:groupID:displayName:screenShareType:", v10, v11, v3, v12, v13, 0);

      return;
    }
    v15 = v8 > v9;
    v16 = IMOSLoggingEnabled();
    if (v15)
    {
      if (!v16)
        return;
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v17 = 134217984;
        v18 = v8;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Conversation has %lu recipients. Call is not allowed.", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      if (!v16)
        return;
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] No recipients found on conversation, so not initiating a call.", (uint8_t *)&v17, 2u);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Bailing on initiating a call because we're no longer in the chat", (uint8_t *)&v17, 2u);
    }
  }

}

- (void)initiateTUConversationWithScreenShareType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] We want to initiate a TUConversation withScreenShareType %ld", (uint8_t *)&v13, 0xCu);
    }

  }
  if (!-[IMChat joinState](self, "joinState"))
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Bailing on initiating a call because we're no longer in the chat", (uint8_t *)&v13, 2u);
    }
    goto LABEL_15;
  }
  -[IMChat participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    -[IMChat participants](self, "participants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat groupID](self, "groupID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat displayName](self, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMFaceTimeUtilities initiateTUConversationForParticipants:senderAddress:videoEnabled:groupID:displayName:screenShareType:](IMFaceTimeUtilities, "initiateTUConversationForParticipants:senderAddress:videoEnabled:groupID:displayName:screenShareType:", v8, v9, 0, v10, v11, a3);

    return;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = v7;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Unsupported number of participants for TUConversationWithScreenShare: %lu. Only 1 is allowed.", (uint8_t *)&v13, 0xCu);
    }
LABEL_15:

  }
}

- (void)initiateTUDialRequestWithVideoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v12 = 138412290;
      v13 = (uint64_t)v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilities] We want to initiate a TUDialRequest withVideo: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  -[IMChat participants](self, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    -[IMChat participants](self, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMFaceTimeUtilities initiateTUDialRequestForSingleParticipant:videoEnabled:](IMFaceTimeUtilities, "initiateTUDialRequestForSingleParticipant:videoEnabled:", v10, v3);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = v8;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Unsupported number of participants for TUDialRequest: %lu. Only 1 is allowed.", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)leaveCurrentTUCall
{
  id v2;

  -[IMChat currentTUCall](self, "currentTUCall");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[IMFaceTimeUtilities leaveTUCall:](IMFaceTimeUtilities, "leaveTUCall:", v2);

}

- (id)callDurationStringForTuCall
{
  void *v2;
  void *v3;
  void *v4;

  -[IMChat currentTUCall](self, "currentTUCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "callDurationString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)currentTUCall
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = 0x1E0DBD000uLL;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAudioAndVideoCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v30 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  v6 = 0;
  if (v30)
  {
    v29 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        objc_msgSend(*(id *)(v3 + 448), "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activeConversationForCall:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChat conversation](self, "conversation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isEqual:", v13);

        if (v14)
        {
          v15 = v8;
        }
        else
        {
          -[IMChat participants](self, "participants");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v17 != 1)
            goto LABEL_13;
          -[IMChat participants](self, "participants");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (void *)MEMORY[0x1E0DBD2F8];
          objc_msgSend(v19, "ID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "normalizedHandleWithDestinationID:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "remoteParticipantHandles");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "allObjects");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (TUHandlesAreCanonicallyEqual())
          {
            v26 = v8;

            v6 = v26;
          }
          v15 = v6;

          v6 = v19;
          v3 = 0x1E0DBD000;
        }

        v6 = v15;
LABEL_13:

        ++v7;
      }
      while (v30 != v7);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v30);
  }

  return v6;
}

- (id)activeParticipantsForTUConversation
{
  void *v2;
  void *v3;

  -[IMChat conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeRemoteParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remoteMembersForTUConversation
{
  void *v2;
  void *v3;

  -[IMChat conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)watermarkComparator
{
  if (qword_1EE65F430 != -1)
    dispatch_once(&qword_1EE65F430, &unk_1E471C250);
  return _Block_copy((const void *)qword_1EE65F428);
}

- (id)_storedWatermarkMessageID
{
  void *v3;
  void *v4;
  void *v5;

  IMWatermarkMessageIDCache();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("IMChatWatermarkMessageID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("CKChatWatermarkMessageID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", 0, CFSTR("CKChatWatermarkMessageID"));
    }
  }
  return v5;
}

- (int64_t)watermarkMessageID
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[IMChat _storedWatermarkMessageID](self, "_storedWatermarkMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IMChat lastFinishedMessageID](self, "lastFinishedMessageID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v3, "longLongValue"))
  {
    IMWatermarkMessageIDCache();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat guid](self, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, v5);

  }
  v6 = objc_msgSend(v3, "longLongValue");

  return v6;
}

- (NSDate)watermarkDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  sub_1A204334C();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("IMChatWatermarkDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("CKChatWatermarkTime"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "doubleValue");
        if (v8 > 0.0)
        {
          v9 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v7, "doubleValue");
          objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", 0, CFSTR("CKChatWatermarkTime"));
          if (v5)
          {
            sub_1A204334C();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMChat guid](self, "guid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKey:", v5, v11);

LABEL_11:
            return (NSDate *)v5;
          }
        }
      }
      else
      {
        -[IMChat lastFinishedMessageDate](self, "lastFinishedMessageDate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_11;
      }
      if (-[IMChat lastMessageTimeStampOnLoad](self, "lastMessageTimeStampOnLoad") < 1)
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)-[IMChat lastMessageTimeStampOnLoad](self, "lastMessageTimeStampOnLoad"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_11;
    }
  }
  return (NSDate *)v5;
}

- (void)updateWatermarks
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  -[IMChat guid](self, "guid");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat _storedWatermarkMessageID](self, "_storedWatermarkMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  v5 = v4;
  if (v4 <= -[IMChat lastFinishedMessageID](self, "lastFinishedMessageID"))
    v5 = -[IMChat lastFinishedMessageID](self, "lastFinishedMessageID");
  if (v14 && v5 >= 1)
  {
    IMWatermarkMessageIDCache();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v14);

  }
  -[IMChat watermarkDate](self, "watermarkDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat lastFinishedMessageDate](self, "lastFinishedMessageDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v8, "laterDate:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v9;
  }
  v12 = v11;
  if (v14 && v11)
  {
    sub_1A204334C();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, v14);

  }
  if (v5 != v4 || v8 != v12 && (objc_msgSend(v8, "isEqualToDate:", v12) & 1) == 0)
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("IMChatWatermarkDidUpdateNotification"), 0);

}

- (void)saveWatermark
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[IMChat guid](self, "guid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[IMChat watermarkMessageID](self, "watermarkMessageID");
  if (v3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v4, CFSTR("IMChatWatermarkMessageID"));

    if (v8)
    {
      IMWatermarkMessageIDCache();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectForKey:", v8);

    }
  }
  -[IMChat watermarkDate](self, "watermarkDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v6, CFSTR("IMChatWatermarkDate"));
    if (v8)
    {
      sub_1A204334C();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v8);

    }
  }

}

- (BOOL)shouldBeAllowListed
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    -[IMChat participants](self, "participants");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 == 1)
    {
      -[IMChat participants](self, "participants");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "normalizedID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMStringIsEmail()
        && ((objc_msgSend(v7, "hasSuffix:", CFSTR("@apple.com")) & 1) != 0
         || objc_msgSend(v7, "hasSuffix:", CFSTR(".apple.com"))))
      {

        return 1;
      }

    }
  }
  if (-[IMChat isAppleChat](self, "isAppleChat"))
    return 1;
  return -[IMChat isMakoChat](self, "isMakoChat");
}

- (BOOL)_hasJustSentAMessage
{
  void *v2;
  void *v3;
  BOOL v4;

  -[IMChat lastFinishedMessage](self, "lastFinishedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2 && objc_msgSend(v2, "isFromMe") && objc_msgSend(v3, "messageID") == 0;

  return v4;
}

- (int64_t)compareChatByDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "lastFinishedMessageDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat lastFinishedMessageDate](self, "lastFinishedMessageDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMChat _compareChat:withDate:withDate:](self, "_compareChat:withDate:withDate:", v4, v5, v6);

  return v7;
}

- (int64_t)compareChatByLastFinishedMessageDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IMChat _lastFinishedMessageDateForChat:](self, "_lastFinishedMessageDateForChat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat _lastFinishedMessageDateForChat:](self, "_lastFinishedMessageDateForChat:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMChat _compareChat:withDate:withDate:](self, "_compareChat:withDate:withDate:", v4, v5, v6);

  return v7;
}

- (id)_lastFinishedMessageDateForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "lastTUConversationCreatedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastFinishedMessageDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastScheduledMessageCreatedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "laterDate:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "laterDate:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (NSArray)participantDNDContactHandles
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[IMChat participantsWithState:](self, "participantsWithState:", 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "dndContactHandle", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

+ (Class)_NPSManagerClass
{
  if (qword_1EE65F440 != -1)
    dispatch_once(&qword_1EE65F440, &unk_1E471DD38);
  return (Class)(id)qword_1EE65F438;
}

+ (void)cleanWatermarkCache
{
  void *v2;
  id v3;

  IMWatermarkMessageIDCache();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  sub_1A204334C();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)createIMChatItemForTransientAttachmentWithAssetUUID:(id)a3 parentChatItemGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat guid](self, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createItemForPHAssetWithUUID:parentChatItemGUID:chatGUID:", v7, v6, v8);

}

- (IMBrand)brand
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IMChat participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isBusiness") & 1) != 0)
        {
          objc_msgSend(v6, "brand");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (IMBrand *)v3;
}

- (BOOL)isReplyEnabled
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (v4 && -[IMChat isStewieSharingChat](self, "isStewieSharingChat") || -[IMChat joinState](self, "joinState") == 4)
    return 0;
  if (-[IMChat isBusinessChat](self, "isBusinessChat") && -[IMChat isMakoChat](self, "isMakoChat"))
  {
    objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("m-reply-enabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "BOOLValue");

      if (v9)
        goto LABEL_9;
    }
    else
    {

    }
    return 0;
  }
LABEL_9:
  if (-[IMChat isBusinessChat](self, "isBusinessChat"))
    return objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat");
  else
    return 1;
}

- (IMHandle)businessHandle
{
  void *v2;
  void *v3;
  void *v4;
  IMHandle *v5;

  -[IMChat participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isBusiness"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)containsActiveBIASession
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBIAEnabled");

  if (!v4)
    return 0;
  -[IMChat allChatProperties](self, "allChatProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AMB-BIAContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKey:", CFSTR("userId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") != 0;

  return v9;
}

- (BOOL)hasSentMessageToBusiness
{
  void *v3;
  BOOL v4;

  if (!-[IMChat isBusinessChat](self, "isBusinessChat"))
    return 0;
  -[IMChat lastSentMessage](self, "lastSentMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isMapKitBusinessChat
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[IMChat participants](self, "participants", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isMapKitBusiness") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)hasVerifiedBusiness
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[IMChat isBusinessChat](self, "isBusinessChat"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[IMChat participants](self, "participants", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v20 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v7, "brand");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isVerified");

          if (v9)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v7, "displayID");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v24 = (uint64_t)v13;
                _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Handle:%@ is verified businesss", buf, 0xCu);

              }
            }
            LODWORD(v4) = 1;
            goto LABEL_21;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_21:

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = CFSTR("NO");
        if ((_DWORD)v4)
          v17 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v24 = v15;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Chat ID: %@ has verified business:%@", buf, 0x16u);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = (uint64_t)v11;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Chat with guid:%@ is not business conversation. Return NO", buf, 0xCu);

      }
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isMakoChat
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[IMChat participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isMako") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isAppleChat
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[IMChat participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isApple") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)closeSession
{
  NSObject *v3;
  int v4;
  IMChat *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Messages for Business close session for chat: %@", (uint8_t *)&v4, 0xCu);
    }

  }
  -[IMChat _closeSession:](self, "_closeSession:", 1);
}

- (void)leaveConversation
{
  NSObject *v3;
  int v4;
  IMChat *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Messages for Business leave conversation and close session for chat: %@", (uint8_t *)&v4, 0xCu);
    }

  }
  -[IMChat _closeSession:](self, "_closeSession:", 0);
}

- (void)_closeSession:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_chat_closeSession:didDeleteConversation:", self, v3);

}

- (void)sendUpdatedCollaborationMetadata:(id)a3 forMessageGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "length"))
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Sending updated collaboration metadata: %@", (uint8_t *)&v12, 0xCu);
    }

    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_chat:sendUpdatedCollaborationMetadata:forMessageGUID:", self, v6, v8);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Not sending collaboration metadata since either passed in collaboration metadata:%@ or messageGUID:%@ is nil.", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (id)_existingMessageFromMessagePartGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  objc_msgSend(v4, "messageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1A200ADC4;
  v17 = sub_1A200AC54;
  v18 = 0;
  -[IMItemsController _items](self, "_items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A2080320;
  v10[3] = &unk_1E4720068;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)_updateExistingMessageWithSyndicationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  char v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePartGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat _existingMessageFromMessagePartGUID:](self, "_existingMessageFromMessagePartGUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39948]), "initWithSyndicationAction:", v4);
    objc_msgSend(v6, "syndicationRanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v10 = (void *)MEMORY[0x1E0D39948];
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateMessagesRanges:withMessagePartSyndicationRanges:didUpdate:", v9, v11, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "_syndicationRanges:", v12);
      objc_msgSend(v7, "_imMessageItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1A2080580;
      v15[3] = &unk_1E471E7C8;
      v15[4] = self;
      v16 = v13;
      v14 = v13;
      -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("send highlight"), v15);

    }
  }

}

- (void)sendSyndicationAction:(unsigned __int8)a3 forMessagePartGUID:(id)a4 syndicatedMessagePartRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;

  length = a5.length;
  location = a5.location;
  v7 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0D39950];
  v10 = a4;
  v11 = [v9 alloc];
  -[IMChat guid](self, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:", v12, v13, v7, v10, location, length);

  if (v14)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = v14;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Sending syndication message: %@", (uint8_t *)&v25, 0xCu);
    }

    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_chat:sendSyndicationAction:", self, v14);

    -[IMChat _updateExistingMessageWithSyndicationAction:](self, "_updateExistingMessageWithSyndicationAction:", v14);
  }
  else
  {
    IMLogHandleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1A21968D8(v17, v18, v19, v20, v21, v22, v23, v24);

  }
}

- (void)sendAutoDonationUpdate:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0D39748]);
  -[IMChat guid](self, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithChatGUID:syndicationStartDate:autoDonateMessages:", v6, v7, v3);

  if (v8)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v8;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Sending syndication message: %@", (uint8_t *)&v20, 0xCu);
    }

    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_chat:sendSyndicationAction:", self, v8);

    if (v3)
      v11 = 1;
    else
      v11 = 2;
    -[IMChat setAutoDonationBehavior:](self, "setAutoDonationBehavior:", v11);
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1A21968D8(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)photoLibraryPersistedSyndicatedAssetSetDidChange
{
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("PhotoLibraryPersistenceChange"), &unk_1E471D778);
}

- (id)localizedUnreadShortcutTitle
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IMChat participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMChat unreadMessageCount](self, "unreadMessageCount");
  if (-[IMChat isGroupChat](self, "isGroupChat"))
  {
    -[IMChat displayName](self, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "displayNameForChat:", self, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0D39A58], "unreadSummaryWithUnreadCount:withParticipants:withGroupChatName:", v4, v6, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (IMChatItemRules)chatItemRules
{
  IMChatItemRules *chatItemRules;
  NSObject *v4;
  void *v5;
  void *v6;

  chatItemRules = self->_chatItemRules;
  if (!chatItemRules)
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_1A21975F4();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D36350], 43, MEMORY[0x1E0C9AA70]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autoBugCaptureWithSubType:errorPayload:", CFSTR("chatItemRules"), v5);

    chatItemRules = self->_chatItemRules;
  }
  return chatItemRules;
}

- (IMChatScrutinyController)chatScrutinyController
{
  return (IMChatScrutinyController *)+[IMChatScrutinyController sharedController](IMChatScrutinyController, "sharedController");
}

- (void)_setupObservation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->_hasBeenConfigured)
  {
    self->_hasBeenConfigured = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountLoggedOut_, CFSTR("__kIMAccountLoggedOutNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__daemonDied_, CFSTR("__kIMDaemonDidDisconnectNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__daemonAlive_, CFSTR("__kIMDaemonDidConnectNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__accountControllerUpdated_, CFSTR("__kIMAccountControllerUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__accountControllerUpdated_, CFSTR("__kIMAccountActivatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__accountControllerUpdated_, CFSTR("__kIMAccountDeactivatedNotification"), 0);

  }
}

+ (id)pendingChatForHandle:(id)a3
{
  id v3;
  IMChat *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;

  v3 = a3;
  v4 = [IMChat alloc];
  objc_msgSend(v3, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMSingleObjectArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE2(v9) = 0;
  LOWORD(v9) = 0;
  v7 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](v4, "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, v5, 45, 0, 0, 0, 0, 0, v6, 1, v9);

  return v7;
}

+ (void)_initializeFindMyController
{
  id v2;

  v2 = +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
}

- (IMChat)init
{
  uint64_t v3;

  BYTE2(v3) = 0;
  LOWORD(v3) = 0;
  return (IMChat *)-[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](self, "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, v3);
}

- (id)chatItemUpdaterLogHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "chatItemUpdaterLogHandle");
}

+ (Class)chatItemRulesClass
{
  void *v2;

  v2 = (void *)qword_1EE65F340;
  if (!qword_1EE65F340)
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  IMChat *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Dealloc: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, 0, 0);

  -[IMChat chatRegistry](self, "chatRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_noteChatDealloc:", self);

  -[IMSendProgress setDelegate:](self->_sendProgress, "setDelegate:", 0);
  -[IMSendProgress setContext:](self->_sendProgress, "setContext:", 0);
  -[IMSendProgress invalidate](self->_sendProgress, "invalidate");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[IMScheduledUpdater invalidate](self->_downgradeStateUpdater, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)IMChat;
  -[IMItemsController dealloc](&v7, sel_dealloc);
}

- (id)_initWithItems:(id)a3
{
  uint64_t v4;

  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](self, "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, 0, 45, 0, 0, 0, 0, a3, 0, 1, v4);
}

- (void)_itemsDidChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[IMChat chatRegistry](self, "chatRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstLoad");

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)IMChat;
    -[IMItemsController _itemsDidChange:](&v7, sel__itemsDidChange_, v4);
    -[IMReasonTrackingUpdater setNeedsDeferredUpdateWithReason:](self->_chatItemsUpdater, "setNeedsDeferredUpdateWithReason:", CFSTR("IMItemsChanged"));
    -[IMSendProgress updateForItems:forced:](self->_sendProgress, "updateForItems:forced:", v4, 0);
  }

}

- (void)_handleItem:(id)a3
{
  id v4;

  v4 = a3;
  -[IMChat _handleItem:forChatStyle:keepExistingIndex:](self, "_handleItem:forChatStyle:keepExistingIndex:", v4, -[IMChat chatStyle](self, "chatStyle"), 0);

}

- (void)_handleItem:(id)a3 keepExistingIndex:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[IMChat _handleItem:forChatStyle:keepExistingIndex:](self, "_handleItem:forChatStyle:keepExistingIndex:", v6, -[IMChat chatStyle](self, "chatStyle"), v4);

}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4
{
  -[IMChat _handleItem:forChatStyle:keepExistingIndex:](self, "_handleItem:forChatStyle:keepExistingIndex:", a3, a4, 0);
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 keepExistingIndex:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self, sel__handleItem_forChatStyle_updateReplyCounts_keepExistingIndex_);
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 updateReplyCounts:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self, sel__handleItem_forChatStyle_updateReplyCounts_keepExistingIndex_);
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 updateReplyCounts:(BOOL)a5 keepExistingIndex:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      v18 = 2112;
      if (v7)
        v13 = CFSTR("YES");
      v19 = v13;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Handle item for chat (%@) updateReplyCounts (%@) item:(%@)", buf, 0x20u);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)IMChat;
  -[IMItemsController _handleItem:forChatStyle:keepExistingIndex:](&v15, sel__handleItem_forChatStyle_keepExistingIndex_, v10, v8, v6);
  -[IMChat inlineReplyController](self, "inlineReplyController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertItem:", v10);

  if (v7)
    -[IMChat _updateRepliesIfNecessaryWithItem:](self, "_updateRepliesIfNecessaryWithItem:", v10);

}

- (void)_removeItem:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMChat;
  v4 = a3;
  -[IMItemsController _removeItem:](&v6, sel__removeItem_, v4);
  -[IMChat inlineReplyController](self, "inlineReplyController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItem:", v4);

}

- (void)_replaceItems:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMChat;
  v4 = a3;
  -[IMItemsController _replaceItems:](&v6, sel__replaceItems_, v4);
  -[IMChat inlineReplyController](self, "inlineReplyController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replaceItems:", v4);

}

- (void)_removeItemsForGuids:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v20 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[IMItemsController _items](self, "_items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v5, "containsObject:", v13);

          if (v14)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[IMChat _removeItem:](self, "_removeItem:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }

    v4 = v20;
  }

}

- (void)_clearUnreadCount
{
  unint64_t dbUnreadCount;
  int v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  _BYTE v15[14];
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dbUnreadCount = self->_dbUnreadCount;
  v4 = IMOSLoggingEnabled();
  if (dbUnreadCount)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = self->_dbUnreadCount;
        v14 = 138412802;
        *(_QWORD *)v15 = self;
        *(_WORD *)&v15[8] = 1024;
        *(_DWORD *)&v15[10] = v6;
        v16 = 1024;
        v17 = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Clearing [DB] unread count for %@ from %d to %d", (uint8_t *)&v14, 0x18u);
      }

    }
    self->_dbUnreadCount = 0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v14 = 67109378;
        *(_DWORD *)v15 = 0;
        *(_WORD *)&v15[4] = 2112;
        *(_QWORD *)&v15[6] = self;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "   Posting new unread count of %u for %@", (uint8_t *)&v14, 0x12u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMChat unreadMessageCount](self, "unreadMessageCount", CFSTR("__kIMChatUnreadKey")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatUnreadCountChangedNotification"), v9);

  }
  else if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_dbUnreadCount;
      v14 = 138412546;
      *(_QWORD *)v15 = self;
      *(_WORD *)&v15[8] = 1024;
      *(_DWORD *)&v15[10] = v11;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Unread count [DB] for %@ stayed at: %d", (uint8_t *)&v14, 0x12u);
    }

  }
}

- (void)_setDBUnreadCount:(unint64_t)a3
{
  -[IMChat _setDBUnreadCount:postNotification:](self, "_setDBUnreadCount:postNotification:", a3, 1);
}

- (void)_setDBFailedCount:(unint64_t)a3
{
  NSObject *v4;
  unint64_t dbFailedCount;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  IMChat *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_dbFailedCount != a3)
  {
    self->_dbFailedCount = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        dbFailedCount = self->_dbFailedCount;
        v6[0] = 67109634;
        v6[1] = dbFailedCount;
        v7 = 1024;
        v8 = -[IMChat messageFailureCount](self, "messageFailureCount");
        v9 = 2112;
        v10 = self;
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "_dbFailedCount changed to %d: Posting new failed count of %d for %@", (uint8_t *)v6, 0x18u);
      }

    }
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatMessageFailureCountChangedNotification"), 0);
  }
}

- (void)_reloadChatItemsForServiceChange
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[IMChat account](self, "account");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "service");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "internalName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChat guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Service for sending changed to %@, updating chat items for chat: %@", (uint8_t *)&v10, 0x16u);

      }
    }
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Service for sending changed"), &unk_1E4720EA0);
  }
}

- (void)_setPendingIncomingSatelliteMessageCount:(unint64_t)a3 postNotification:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int v8;
  NSObject *v9;
  unint64_t pendingIncomingSatelliteMessageCount;
  unint64_t totalSatelliteMessageCount;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  IMChat *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (v8 && self->_pendingIncomingSatelliteMessageCount != a3)
  {
    self->_pendingIncomingSatelliteMessageCount = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        pendingIncomingSatelliteMessageCount = self->_pendingIncomingSatelliteMessageCount;
        *(_DWORD *)buf = 67109378;
        v17 = pendingIncomingSatelliteMessageCount;
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "_pendingIncomingSatelliteMessageCount changed to %d for %@", buf, 0x12u);
      }

    }
    if (self->_downloadingPendingSatelliteMessages)
    {
      if (a3)
      {
        totalSatelliteMessageCount = self->_totalSatelliteMessageCount;
        if (totalSatelliteMessageCount <= a3)
          totalSatelliteMessageCount = a3;
      }
      else
      {
        totalSatelliteMessageCount = 0;
      }
      self->_totalSatelliteMessageCount = totalSatelliteMessageCount;
      -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Satellite count changed!"), &unk_1E4720EC0);
    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pendingIncomingSatelliteMessageCount, CFSTR("__kIMChatPendingIncomingSatelliteMessageCountKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatPendingIncomingSatelliteMessageCountChangedNotification"), v13);

    }
  }
}

- (void)_setIsDownloadingPendingSatelliteMessages:(BOOL)a3 postNotification:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  IMChat *v17;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (v8 && self->_downloadingPendingSatelliteMessages != v5)
  {
    self->_downloadingPendingSatelliteMessages = v5;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = CFSTR("NO");
        if (v5)
          v10 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v15 = v10;
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "_downloadingPendingSatelliteMessages changed to %@ for %@", buf, 0x16u);
      }

    }
    if (v4)
    {
      v12 = CFSTR("__kIMChatIsDownloadingPendingSatelliteMessagesKey");
      v13 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatIsDownloadingPendingSatelliteMessagesChangedNotification"), v11);

    }
  }
}

- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[IMChat _insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:limit:](self, "_insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:limit:", v11, v10, v7, v6, -[IMChat numberOfMessagesToKeepLoaded](self, "numberOfMessagesToKeepLoaded"));

}

- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6 limit:(unint64_t)a7
{
  uint64_t v7;

  LOWORD(v7) = 0;
  -[IMChat _insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:isReplacingItems:limit:hasMessagesBefore:hasMessagesAfter:](self, "_insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:isReplacingItems:limit:hasMessagesBefore:hasMessagesAfter:", a3, a4, a5, a6, 1, a7, v7);
}

- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6 isReplacingItems:(BOOL)a7 limit:(unint64_t)a8 hasMessagesBefore:(BOOL)a9 hasMessagesAfter:(BOOL)a10
{
  _BOOL8 v11;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  IMChat *v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v11 = a7;
  v29 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  if ((objc_msgSend(v15, "containsString:", CFSTR("InlineReplyHistoryLoading")) & 1) != 0
    || objc_msgSend(v15, "containsString:", CFSTR("PagedInlineReplyHistoryLoading")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[IMChat inlineReplyController](self, "inlineReplyController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Passing inline reply history request to %@", buf, 0xCu);

      }
    }
    -[IMChat inlineReplyController](self, "inlineReplyController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertHistoricalMessages:queryID:hasMessagesBefore:hasMessagesAfter:isReplacingItems:", v14, v15, a9, a10, v11);
  }
  else
  {
    self->_hasEarlierMessagesToLoad = a9;
    self->_hasMoreRecentMessagesToLoad = a10;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1A20BA4D8;
    v19[3] = &unk_1E4720EE8;
    v20 = v15;
    v22 = self;
    v23 = a8;
    v24 = a9;
    v25 = a10;
    v21 = v14;
    v26 = v11;
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) History query"), v19);

    v18 = v20;
  }

}

- (id)_archivedItemsToReplace:(id)a3 isReplacingItems:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _DWORD v11[2];
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109120;
      v11[1] = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "_archivedItemsToReplace archivedItemsCount: %d", (uint8_t *)v11, 8u);
    }

  }
  if (v4)
  {
    -[IMItemsController _removeAllItems](self, "_removeAllItems");
    v8 = v6;
  }
  else
  {
    -[IMItemsController _appendArchivedItemsToItemsArray:](self, "_appendArchivedItemsToItemsArray:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)messageForGUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[IMItemsController _itemForGUID:](self, "_itemForGUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "replyCountsByPart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReplyCountsByPart:", v5);

  }
  return v4;
}

- (IMMessage)firstMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _firstMessage](self, "_firstMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (IMMessage)lastIncomingMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _lastIncomingMessage](self, "_lastIncomingMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (IMMessage)lastIncomingFinishedMessageWithTextContent
{
  void *v2;
  void *v3;

  -[IMItemsController _lastIncomingFinishedMessageWithTextContent](self, "_lastIncomingFinishedMessageWithTextContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (id)_lastChatItemMatchingCriteria:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IMChat chatItems](self, "chatItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v10) & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (IMChatItem)lastDeletableChatItem
{
  return (IMChatItem *)MEMORY[0x1E0DE7D20](self, sel__lastChatItemMatchingCriteria_);
}

- (id)lastIncomingReplyableChatItem
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__lastChatItemMatchingCriteria_);
}

- (IMMessage)lastIncomingReplyableMessage
{
  void *v2;
  void *v3;
  void *v4;

  -[IMChat lastIncomingReplyableChatItem](self, "lastIncomingReplyableChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v4;
}

- (IMMessagePartChatItem)lastTapbackableChatItemNotFromMe
{
  return (IMMessagePartChatItem *)MEMORY[0x1E0DE7D20](self, sel__lastChatItemMatchingCriteria_);
}

- (id)lastRelatedIncomingFinishedMessageTextContentWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__lastRelatedIncomingFinishedMessageTextContentWithLimit_);
}

- (BOOL)isLastIncomingFinishedMessageNotiMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[IMItemsController _lastIncomingFinishedMessage](self, "_lastIncomingFinishedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMService, "iMessageService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "isEqualToString:", v6) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)lastMessageExists
{
  void *v2;
  BOOL v3;

  -[IMItemsController _lastMessage](self, "_lastMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setLastTUConversationCreatedDate:(id)a3
{
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", a3, CFSTR("lastTUConversationCreatedDate"));
}

- (void)setLastScheduledMessageCreatedDate:(id)a3
{
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", a3, CFSTR("lastScheduledMessageCreatedDate"));
}

- (NSDate)lastScheduledMessageCreatedDate
{
  return (NSDate *)-[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("lastScheduledMessageCreatedDate"));
}

- (IMMessage)lastSentMessage
{
  void *v2;
  void *v3;

  -[IMItemsController _lastSentMessage](self, "_lastSentMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (NSDate)lastSentMessageDate
{
  void *v2;
  void *v3;

  -[IMItemsController _lastSentMessage](self, "_lastSentMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)lastFinishedMessageID
{
  void *v2;
  int64_t v3;

  -[IMItemsController _lastFinishedMessage](self, "_lastFinishedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messageID");

  return v3;
}

- (id)messageGuidsForMyUnreadMentions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMItemsController _items](self, "_items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "message");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && objc_msgSend(v9, "hasUnseenMention"))
        {
          objc_msgSend(v10, "guid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (void)removeMentionMessageGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMItemsController _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_msgSend(v12, "message", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v4))
        {
          v15 = objc_msgSend(v12, "hasUnseenMention");

          if (!v15)
            goto LABEL_10;
          v14 = (void *)objc_msgSend(v12, "_copy");
          objc_msgSend(v14, "setHasUnseenMention:", 0);
          -[IMChat daemonController](self, "daemonController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "updateMessage:", v14);

          -[IMChat _handleItem:](self, "_handleItem:", v14);
        }

LABEL_10:
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (unint64_t)messageFailureCount
{
  int64_t dbFailedCount;

  dbFailedCount = self->_dbFailedCount;
  if ((dbFailedCount | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL)
    return 0;
  else
    return dbFailedCount & ~(dbFailedCount >> 63);
}

- (BOOL)deleteAllHistory
{
  id v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A20BB4C0;
  v5[3] = &unk_1E4720F70;
  v5[4] = self;
  v3 = -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("DeleteHistory"), 0, v5);
  -[IMChat clear](self, "clear");
  return 1;
}

- (unint64_t)markAsSpam:(unint64_t)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_markAsSpam_isJunkReportedToCarrier_);
}

- (unint64_t)markAsSpam:(unint64_t)a3 isJunkReportedToCarrier:(BOOL)a4
{
  id v6;
  NSNumber *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD v17[5];
  BOOL v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1A20BB6DC;
  v17[3] = &unk_1E471FC90;
  v17[4] = self;
  v18 = a4;
  v6 = -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("MarkAsSpam"), 1, v17);
  v7 = self->_countOfMessagesMarkedAsSpam;
  -[IMChat _setCountOfMessagesMarkedAsSpam:](self, "_setCountOfMessagesMarkedAsSpam:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[NSNumber integerValue](v7, "integerValue");
      *(_DWORD *)buf = 134217984;
      v20 = v9;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Marked %ld messages as spam", buf, 0xCu);
    }

  }
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("restoredFromBlackhole"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    v14 = 32;
  else
    v14 = a3;
  objc_msgSend(v12, "trackSpamEvent:", v14);

  v15 = -[NSNumber integerValue](v7, "integerValue");
  return v15;
}

- (void)markAsAutoSpamReported
{
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", MEMORY[0x1E0C9AAB0], CFSTR("hasBeenAutoSpamReported"));
}

- (void)autoReportSpam
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("hasBeenAutoSpamReported"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        -[IMChat chatIdentifier](self, "chatIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "autoReportSpam on self %@", (uint8_t *)&v7, 0xCu);

      }
    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_chat_markAsSpamAutomatically:", self);

    -[IMChat markAsAutoSpamReported](self, "markAsAutoSpamReported");
  }
}

- (void)reportJunkToCarrier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IMChat lastFinishedMessageItem](self, "lastFinishedMessageItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_19;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[IMChat chatItems](self, "chatItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "No chat item of type IMMessageItem found while reporting junk. Chat Items -> %@", (uint8_t *)&v18, 0xCu);

    }
LABEL_8:

    goto LABEL_19;
  }
  +[IMCarrierReportJunkHelper collectReportJunkMetricsForJunkMessageItem:junkChatStyle:totalMessagesInThread:](IMCarrierReportJunkHelper, "collectReportJunkMetricsForJunkMessageItem:junkChatStyle:totalMessagesInThread:", v3, -[IMChat chatStyle](self, "chatStyle"), -[IMChat messageCount](self, "messageCount"));
  if (!+[IMCarrierReportJunkHelper canReportJunkOverCellularServiceOfMessageItem:](IMCarrierReportJunkHelper, "canReportJunkOverCellularServiceOfMessageItem:", v3))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_19;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Cellular service not at home service. Cannot report junk", (uint8_t *)&v18, 2u);
    }
    goto LABEL_8;
  }
  if (-[IMChat isRCS](self, "isRCS"))
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService smsService](IMServiceImpl, "smsService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeAccountsForService:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMChat account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[IMChat chatStyle](self, "chatStyle");
  -[IMChat account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "internalName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMCarrierReportJunkHelper junkReportMessageItemForMessageItem:account:junkChatStyle:serviceName:](IMCarrierReportJunkHelper, "junkReportMessageItemForMessageItem:account:junkChatStyle:serviceName:", v3, v7, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "sending junk report item: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendJunkReportMessage:account:", v14, v17);

LABEL_19:
}

- (void)reportChatbotSpam:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IMItemsController _lastIncomingFinishedMessage](self, "_lastIncomingFinishedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService rcsService](IMServiceImpl, "rcsService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeAccountsForService:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();

    +[IMCarrierReportJunkHelper collectReportJunkMetricsForChatbotJunkMessageItem:totalMessagesInThread:](IMCarrierReportJunkHelper, "collectReportJunkMetricsForChatbotJunkMessageItem:totalMessagesInThread:", v5, -[IMChat messageCount](self, "messageCount"));
    v10 = IMOSLoggingEnabled();
    if (v9)
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Found RCS account, reporting chatbot spam", (uint8_t *)&v17, 2u);
        }

      }
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject uniqueID](v9, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendChatbotSpamReport:spamType:account:", v5, a3, v13);

    }
    else if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[IMChat chatItems](self, "chatItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v16;
        _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "No RCS Account found while reporting chatbot spam. Chat Items -> %@", (uint8_t *)&v17, 0xCu);

      }
    }
LABEL_16:

    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[IMChat chatItems](self, "chatItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "No chat item of type IMMessageItem found while reporting chatbot spam. Chat Items -> %@", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)markAsHasBeenBlockContact
{
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", MEMORY[0x1E0C9AAB0], CFSTR("hasBeenBlockContact"));
}

- (void)updateIsFiltered:(int64_t)a3
{
  id v4;

  if (self->_isFiltered != a3)
  {
    -[IMChat setIsFiltered:](self, "setIsFiltered:");
    -[IMChat chatRegistry](self, "chatRegistry");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_chat:updateIsFiltered:", self, self->_isFiltered);

  }
}

- (void)updateIsBlackholed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  _BOOL4 v7;
  id v8;

  v3 = a3;
  -[IMChat daemonController](self, "daemonController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilities");
  v7 = (*MEMORY[0x1E0D36CC0] & v6) == 0;

  if (v7 == v3)
  {
    -[IMChat chatRegistry](self, "chatRegistry");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_chat:updateIsBlackholed:", self, v3);

  }
}

- (void)setRecovered:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_recovered != a3)
  {
    if (a3)
    {
      self->_recovered = a3;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Updating isRecovered to YES", buf, 2u);
        }

      }
      -[IMChat chatRegistry](self, "chatRegistry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_chat:updateIsRecovered:", self, 1);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Chat - Tried to update isRecovered to NO, not allowed", v7, 2u);
      }

    }
  }
}

- (void)setDeletingIncomingMessages:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_deletingIncomingMessages != a3)
  {
    v3 = a3;
    self->_deletingIncomingMessages = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("NO");
        if (v3)
          v6 = CFSTR("YES");
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Updating isDeletingIncomingMessages to %@", (uint8_t *)&v8, 0xCu);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_chat:updateIsDeletingIncomingMessages:", self, v3);

  }
}

- (void)updateLineSwitchedTo:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "SIM Line is switched to %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Conversation line switched"), &unk_1E4720F90);

}

- (void)loadParticipantContactsIfNecessary
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMChat participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = MEMORY[0x1E0C9AA60];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v8 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cnContactWithKeys:", v6);
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

+ (id)_participantsWorkQueue
{
  if (qword_1EE65F5B0 != -1)
    dispatch_once(&qword_1EE65F5B0, &unk_1E4720FB0);
  return (id)qword_1EE65F5A8;
}

- (BOOL)hasKnownParticipants
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IMChat participants](self, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isContactButNotMe") & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  -[IMChat setHasKnownParticipantsCache:](self, "setHasKnownParticipantsCache:", v4);
  return v4;
}

- (void)invalidateHasKnownParticipantsCache
{
  MEMORY[0x1E0DE7D20](self, sel_setHasKnownParticipantsCacheStatus_);
}

- (void)setHasKnownParticipantsCache:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setHasKnownParticipantsCacheStatus_);
}

- (BOOL)hasKnownParticipantsCache
{
  unint64_t v3;

  v3 = -[IMChat hasKnownParticipantsCacheStatus](self, "hasKnownParticipantsCacheStatus");
  if (v3 >= 2)
    LOBYTE(v3) = v3 == -1 && -[IMChat hasKnownParticipants](self, "hasKnownParticipants");
  return v3;
}

- (BOOL)allParticipantsAreContacts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMChat participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isContact"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)hasMessageWithServiceCapability:(id)a3
{
  void *v3;
  BOOL v4;

  -[IMItemsController _lastMessageItemWithServiceCapability:](self, "_lastMessageItemWithServiceCapability:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasMessageFromService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "internalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[IMItemsController _lastMessageItemWithService:](self, "_lastMessageItemWithService:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isRCS
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[IMChat account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService rcsService](IMService, "rcsService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

- (BOOL)shouldForceToSMS
{
  void *v2;
  char v3;

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("shouldForceToSMS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)updateShouldForceToSMS:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("shouldForceToSMS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v7, CFSTR("shouldForceToSMS"));

  }
}

- (void)setPrefersTextResponseToIncomingAudioMessages:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v6 & 1) == 0)
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("prefersTextResponseToIncomingAudioMessages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8 != v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v9, CFSTR("prefersTextResponseToIncomingAudioMessages"));

    }
  }
}

- (void)setKeyTransparencyURIToUUIDMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  IMChat *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = *MEMORY[0x1E0D377D0];
  v17 = self;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if ((objc_msgSend(v5, "isEqualToDictionary:", v6) & 1) == 0)
  {
    v15 = (void *)objc_msgSend(v6, "copy");
    -[IMChat setValue:forChatProperty:](v17, "setValue:forChatProperty:", v15, v16);

  }
}

- (BOOL)prefersTextResponseToIncomingAudioMessages
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v4 & 1) != 0)
    return 1;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("prefersTextResponseToIncomingAudioMessages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setShouldShowAudioButtonInEntryView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAudioMessagesEntryViewRecordingEnabled");

  if (v6)
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("showAudioButtonInEntryView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8 != v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v9, CFSTR("showAudioButtonInEntryView"));

    }
  }
}

- (BOOL)shouldShowAudioButtonInEntryView
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[IMChat supportsCapabilities:](self, "supportsCapabilities:", 64);
  if (v3)
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("showAudioButtonInEntryView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)updateSMSCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterParamForCategory:subCategory:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "category");
  v8 = objc_msgSend(v6, "subCategory");
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("SMSCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 != v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v18 = v7;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Setting spam category to: %d", buf, 8u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v12, CFSTR("SMSCategory"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v13, CFSTR("SMSSubCategory"));

    v14 = a3 == 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v15, CFSTR("wasDetectedAsSMSSpam"));

    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatIsFilteredChangedNotification"), 0);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateSMSCategory:%d"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat _updateChatItemsWithDataDetectorResultsForReason:](self, "_updateChatItemsWithDataDetectorResultsForReason:", v16);

    }
  }

}

- (int64_t)chatPropertyValueFor:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 0;
  else
    return a3 - 1;
}

- (int64_t)filterCategory
{
  return -[IMChat isFiltered](self, "isFiltered") & 0xF;
}

- (int64_t)filterSubCategory
{
  return -[IMChat isFiltered](self, "isFiltered") >> 4;
}

- (void)clearSMSCategory
{
  MEMORY[0x1E0DE7D20](self, sel_updateSMSCategory_subCategory_);
}

- (BOOL)wasDetectedAsSMSSpam
{
  void *v4;
  void *v5;
  int v6;

  if (-[IMChat wasDetectedAsSMSSpamCacheStatus](self, "wasDetectedAsSMSSpamCacheStatus"))
    return -[IMChat wasDetectedAsSMSSpamCacheStatus](self, "wasDetectedAsSMSSpamCacheStatus") == 2;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("wasDetectedAsSMSSpam"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "intValue"))
  {

LABEL_6:
    -[IMChat setWasDetectedAsSMSSpamCacheStatus:](self, "setWasDetectedAsSMSSpamCacheStatus:", 2);
    return 1;
  }
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("SMSCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 == 1)
    goto LABEL_6;
  -[IMChat setWasDetectedAsSMSSpamCacheStatus:](self, "setWasDetectedAsSMSSpamCacheStatus:", 1);
  return 0;
}

- (int64_t)smsCategory
{
  void *v2;
  int64_t v3;

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("SMSCategory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)_updateChatItemsWithDataDetectorResultsForReason:(id)a3
{
  const __CFString *v4;
  id v5;
  _QWORD v6[5];

  if (a3)
    v4 = (const __CFString *)a3;
  else
    v4 = CFSTR("(IMChat) <Reason undefined>");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A20BD058;
  v6[3] = &unk_1E471E348;
  v6[4] = self;
  v5 = a3;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", v4, v6);

}

- (NSString)lastSeenMessageGuid
{
  return (NSString *)-[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37800]);
}

- (IMMessageItem)firstUnreadMessageItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  IMChat *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!-[IMChat unreadMessageCount](self, "unreadMessageCount"))
    return (IMMessageItem *)0;
  v23 = self;
  -[IMChat lastSeenMessageGuid](self, "lastSeenMessageGuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (IMMessageItem *)0;
  -[IMItemsController _items](v23, "_items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v22, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "guid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat lastSeenMessageGuid](v23, "lastSeenMessageGuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v12)
          {
            if (v6)
              v19 = v6;
            else
              v19 = v9;
            v17 = v19;

            goto LABEL_27;
          }
          v13 = v9;

          v6 = v13;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v5)
        continue;
      break;
    }

    if (v6)
    {
      objc_msgSend(v6, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat lastSeenMessageGuid](v23, "lastSeenMessageGuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if (v16)
      {
        v6 = v6;
        v17 = v6;
        goto LABEL_27;
      }
    }
  }
  else
  {

    v6 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134217984;
      v29 = v21;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Tried to identify first unread message but it was not part of the %lu loaded messages", buf, 0xCu);
    }

  }
  v17 = 0;
LABEL_27:

  return (IMMessageItem *)v17;
}

- (void)updateTranscriptSharingState:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("emergencyTranscriptSharingState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Updating transcript sharing state to %@", (uint8_t *)&v9, 0xCu);
      }

    }
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v7, CFSTR("emergencyTranscriptSharingState"));

  }
}

- (int64_t)transcriptSharingState
{
  void *v2;
  int64_t v3;

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("emergencyTranscriptSharingState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)shouldShowAutoDonationAction
{
  void *v3;
  char v4;

  if (-[IMChat isBusinessChat](self, "isBusinessChat") || !-[IMChat hasKnownParticipants](self, "hasKnownParticipants"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSharedWithYouEnabled");

  return v4;
}

- (BOOL)isAutoDonatingMessages
{
  int64_t v3;
  void *v4;
  char v5;

  v3 = -[IMChat autoDonationBehavior](self, "autoDonationBehavior");
  if (v3 == 2)
    goto LABEL_6;
  if (v3 == 1)
    return v3;
  if (v3)
  {
LABEL_6:
    LOBYTE(v3) = 0;
    return v3;
  }
  LODWORD(v3) = -[IMChat shouldShowAutoDonationAction](self, "shouldShowAutoDonationAction");
  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSharedWithYouEnabled");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setAutoDonationBehavior:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_autoDonationBehavior != a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 134218242;
        v8 = a3;
        v9 = 2112;
        v10 = v6;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Updating AutoDonateBehavior to: %ld for chat guid: %@", (uint8_t *)&v7, 0x16u);

      }
    }
    self->_autoDonationBehavior = a3;
  }
}

- (id)lastTranslatableMessageGUIDWithLanguageCode:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *MEMORY[0x1E0D37808];
  v5 = a3;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateLastMessageGUID:(id)a3 forLanguageCode:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *MEMORY[0x1E0D37808];
  v7 = a4;
  v8 = a3;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, v7);

  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v9, v6);
}

- (BOOL)isEmergencyChat
{
  void *v2;
  char v3;

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D377B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)chatSummary
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
    return 0;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37740]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D37738]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (!v5)
  {
    -[IMChat chatSummaryMessageGUID](self, "chatSummaryMessageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[IMChat lastMessage](self, "lastMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && (objc_msgSend(v12, "isEqualToString:", v10) & 1) == 0)
      {
        -[IMChat consumeSummaryIfNeeded](self, "consumeSummaryIfNeeded");

        v8 = 0;
LABEL_20:

        goto LABEL_21;
      }

    }
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D37750]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (v15)
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1A2197658();

      v8 = 0;
    }
    else
    {
      v8 = v14;
    }

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Stored summary was already consumed for chat with GUID %@.", buf, 0xCu);

    }
  }
LABEL_8:
  v8 = 0;
LABEL_21:

  return v8;
}

- (id)chatSummaryMessageGUID
{
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37740]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D37748]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)updateIsEmergencyChat:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v4, *MEMORY[0x1E0D377B0]);

}

- (void)updateAssociatedBusinessID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IMChat isStewieRoadsideChat](self, "isStewieRoadsideChat"))
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1A2197720();
    goto LABEL_14;
  }
  if ((objc_msgSend(v4, "_appearsToBeBusinessID") & 1) == 0)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1A21976BC();
LABEL_14:

    goto LABEL_15;
  }
  -[IMChat associatedBusinessID](self, "associatedBusinessID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v4;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Updating Associated business ID to: %@ for chat guid: %@", (uint8_t *)&v10, 0x16u);

      }
    }
    -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v4, *MEMORY[0x1E0D37720]);
  }
LABEL_15:

}

- (void)markBusinessChatAsSpam:(unint64_t)a3
{
  id v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A20BDEAC;
  v4[3] = &unk_1E4720FD8;
  v4[4] = self;
  v4[5] = a3;
  v3 = -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("MarkAsSpam"), 1, v4);
}

- (NSString)stewieSharingSuggestedName
{
  void *v3;
  void *v4;
  void *v5;

  if (-[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
  {
    -[IMChat emergencyUserInfo](self, "emergencyUserInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "emergencyUserPersona");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestedDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (IMHandle)emergencyUserHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  IMHandle *v7;
  IMHandle *cachedEUHandle;

  if (-[IMChat isStewieSharingChat](self, "isStewieSharingChat") && !self->_cachedEUHandle)
  {
    -[IMChat emergencyUserInfo](self, "emergencyUserInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "emergencyUserPersona");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senderID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[IMChat account](self, "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imHandleWithID:", v5);
      v7 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      cachedEUHandle = self->_cachedEUHandle;
      self->_cachedEUHandle = v7;

    }
  }
  return self->_cachedEUHandle;
}

- (void)stopTranscriptSharingWithChat
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 136315138;
        v9 = "-[IMChat stopTranscriptSharingWithChat]";
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Stop transcript sharing for %s", (uint8_t *)&v8, 0xCu);
      }

    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat chatIdentifier](self, "chatIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopTranscriptSharingWithChat:", v7);

  }
}

- (BOOL)isOscarChat
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (-[IMChat isFiltered](self, "isFiltered") != 2)
    return 0;
  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F68]);

  return v6;
}

- (BOOL)containsMessageFromContactOrMe
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[IMChat numberOfTimesRespondedToThread](self, "numberOfTimesRespondedToThread") > 0)
    return 1;
  -[IMChat lastFinishedMessageItem](self, "lastFinishedMessageItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_senderHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isContact") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[IMChat lastFinishedMessageItem](self, "lastFinishedMessageItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "isFromMe");

  }
  return v3;
}

- (int64_t)numberOfTimesRespondedToThread
{
  void *v2;
  int64_t v3;

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", CFSTR("numberOfTimesRespondedtoThread"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)clear
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  IMChat *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Clearing chat: %@", buf, 0xCu);
    }

  }
  self->_didSendAFinishedMessage = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A20BE3BC;
  v4[3] = &unk_1E471E348;
  v4[4] = self;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Clear transcript"), v4);
}

- (void)didUnregisterFromRegistry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSArray *participants;
  IMAccount *account;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat participants](self, "participants");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Chat %@ has been unregistered, removing participants (were %@)", (uint8_t *)&v10, 0x16u);

    }
  }
  -[IMItemsController _removeAllItems](self, "_removeAllItems");
  participants = self->_participants;
  self->_participants = 0;

  account = self->_account;
  self->_account = 0;

  -[IMChat setUnregistered:](self, "setUnregistered:", 1);
}

- (void)_accountLoggedOut:(id)a3
{
  id v4;
  IMAccount *v5;
  IMAccount *account;
  NSObject *v7;
  IMAccount *v8;
  int v9;
  IMChat *v10;
  __int16 v11;
  IMAccount *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (IMAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;

  if (v5 == account && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = self->_account;
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "Account Logged Out: chat: %@ account: %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)_startTiming:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_timingCollection)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_timingCollection, a3);
    v5 = v6;
  }

}

- (void)_endTiming
{
  IMTimingCollection *timingCollection;

  timingCollection = self->_timingCollection;
  self->_timingCollection = 0;

}

- (void)_postIMChatItemsDidChangeNotificationWithInserted:(id)a3 removed:(id)a4 reload:(id)a5 regenerate:(id)a6 oldChatItems:(id)a7 newChatItems:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30[0] = CFSTR("__kIMChatItemsInserted");
  v19 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v19;
  v31[0] = v19;
  v30[1] = CFSTR("__kIMChatItemsRemoved");
  v20 = (uint64_t)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v20;
  v31[1] = v20;
  v30[2] = CFSTR("__kIMChatItemsReload");
  v21 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v13;
  v31[2] = v21;
  v30[3] = CFSTR("__kIMChatItemsRegenerate");
  v22 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[3] = v22;
  v30[4] = CFSTR("__kIMChatItemsOldItems");
  v23 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[4] = v23;
  v30[5] = CFSTR("__kIMChatItemsNewItems");
  v24 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_15;
LABEL_21:

    if (v16)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v17)
    goto LABEL_21;
LABEL_15:
  if (v16)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v15)
  {
    if (v14)
      goto LABEL_18;
LABEL_24:

    if (v29)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v14)
    goto LABEL_24;
LABEL_18:
  if (!v29)
    goto LABEL_25;
LABEL_19:
  -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatItemsDidChangeNotification"), v25);

}

- (void)_setParticipantState:(unint64_t)a3 forHandle:(id)a4 postNotification:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat _setParticipantState:forHandles:postNotification:](self, "_setParticipantState:forHandles:postNotification:", a3, v10, v5, v11, v12);
}

- (void)_setParticipantState:(unint64_t)a3 forHandles:(id)a4 postNotification:(BOOL)a5
{
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  if (a3 == 128)
    v6 = 5;
  else
    v6 = -1;
  if (a3 == 64)
    v7 = 4;
  else
    v7 = v6;
  if (a3 == 32)
    v8 = 3;
  else
    v8 = v7;
  if (a3 == 16)
    v9 = 2;
  else
    v9 = -1;
  if (a3 == 8)
    v9 = 1;
  if (a3 == 4)
    v9 = 0;
  if ((uint64_t)a3 <= 31)
    v10 = v9;
  else
    v10 = v8;
  -[IMChat _participants:statusChanged:postNotification:](self, "_participants:statusChanged:postNotification:", a4, v10, a5);
}

- (void)_handleMessageGUIDDeletions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  __CFArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  IMChat *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v4;
      v28 = 2112;
      v29 = self;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Handle deleted messages: %@  in chat: %@", buf, 0x16u);
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[IMItemsController _itemForGUID:](self, "_itemForGUID:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (v7 || (v7 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8])) != 0)
            CFArrayAppendValue(v7, v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if (-[__CFArray count](v7, "count"))
    -[IMChat _updateRepliesIfNecessaryWithRemovedItems:threadIdentifiersOfRemovedParts:](self, "_updateRepliesIfNecessaryWithRemovedItems:threadIdentifiersOfRemovedParts:", v7, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v7;
  v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        -[IMChat _removeItem:](self, "_removeItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (unint64_t)paymentTypeForMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMExtensionPayloadUnarchivingClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v3, "payloadData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = (void *)objc_msgSend(v5, "initForReadingFromData:error:", v6, &v15);
  v8 = v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "_enableStrictSecureDecodingMode");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "strict-decoding 008 _enableStrictSecureDecodingMode called", buf, 2u);
      }

    }
  }
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v4, *MEMORY[0x1E0CB2CD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Failed to unarchive message payload data. Error: %@", buf, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D37E68]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EE65F5C0 != -1)
      dispatch_once(&qword_1EE65F5C0, &unk_1E4720FF8);
    if (off_1EE65F5B8)
      v13 = off_1EE65F5B8(v12);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)hasSurfRequestForPaymentType:(unint64_t)a3
{
  return a3 == 2;
}

- (BOOL)hasSurfRequestNotFromMe:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];

  v4 = a3;
  if ((objc_msgSend(v4, "isFromMe") & 1) != 0
    || (objc_msgSend(v4, "balloonBundleID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D37620]),
        v5,
        !v6))
  {
    v8 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Checking for request type in incoming SURF message for spam filtering", v10, 2u);
      }

    }
    v8 = -[IMChat hasSurfRequestForPaymentType:](self, "hasSurfRequestForPaymentType:", -[IMChat paymentTypeForMessage:](self, "paymentTypeForMessage:", v4));
  }

  return v8;
}

- (void)_fixSendingItemDateAndSortID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  int v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  _BOOL4 v21;
  int v22;
  NSObject *v23;
  const __CFString *v24;
  const __CFString *v25;
  NSObject *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  int v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItemsController _itemForGUID:](self, "_itemForGUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[IMItemsController _shouldPinUnsentMessagesToBottom](self, "_shouldPinUnsentMessagesToBottom"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "hasEditedParts"))
      objc_msgSend(v4, "setFlags:", objc_msgSend(v4, "flags") | 0x8000);
    if (v6 && objc_msgSend(v6, "unsentIsFromMeItem") && (objc_msgSend(v4, "unsentIsFromMeItem") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "We have an unsent message that has now been sent, so we want to assign it a sortID", (uint8_t *)&v31, 2u);
        }

      }
      -[IMItemsController _setSortID:](self, "_setSortID:", v4);
    }
    -[IMItemsController _items](self, "_items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "unsentIsFromMeItem") && !((v6 != 0) | objc_msgSend(v4, "isFromMe") & 1))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "The last item in the transcript is an unsent message and we are receiving an incoming message, we should display the progress bar", (uint8_t *)&v31, 2u);
        }

      }
      -[IMSendProgress setStartSendProgressImmediately:](self->_sendProgress, "setStartSendProgressImmediately:", 1);
    }

  }
  else if (v6)
  {
    if (objc_msgSend(v4, "isFromMe"))
    {
      objc_msgSend(v6, "clientSendTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setClientSendTime:", v11);

      objc_msgSend(v6, "time");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTime:", v12);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "time");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceReferenceDate");
          objc_msgSend(v14, "numberWithDouble:");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v31 = 138412290;
          v32 = v16;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Fixing message time to be found item's time %@", (uint8_t *)&v31, 0xCu);

        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = objc_msgSend(v6, "isTypingMessage");
    else
      v17 = 0;
    objc_opt_class();
    v21 = (objc_opt_isKindOfClass() & 1) != 0
       && (objc_msgSend(v6, "isTypingMessage") & 1) == 0
       && objc_msgSend(v6, "sortID") == 0;
    v22 = IMOSLoggingEnabled();
    if (v17 | v21)
    {
      if (v22)
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = CFSTR("NO");
          if (v17)
            v25 = CFSTR("YES");
          else
            v25 = CFSTR("NO");
          if (v21)
            v24 = CFSTR("YES");
          v31 = 138412546;
          v32 = v25;
          v33 = 2112;
          v34 = v24;
          _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "We have a typing indicator or the sort id for an existing item is 0, so resetting {itemIsTyping: %@ nonTypingZero %@}", (uint8_t *)&v31, 0x16u);
        }

      }
      -[IMItemsController _setSortID:](self, "_setSortID:", v4);
    }
    else
    {
      if (v22)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "messageID"));
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sortID"));
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "messageID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "sortID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138413058;
          v32 = v27;
          v33 = 2112;
          v34 = v28;
          v35 = 2112;
          v36 = v29;
          v37 = 2112;
          v38 = v30;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Need to transfer sort id over from previous item message mid %@ sid %@ item mid %@ sid %@", (uint8_t *)&v31, 0x2Au);

        }
      }
      objc_msgSend(v4, "setSortID:", objc_msgSend(v6, "sortID"));
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "isTypingMessage"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "messageID"));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "guid");
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v31 = 138412546;
          v32 = v19;
          v33 = 2112;
          v34 = v20;
          _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "we have a typing indicator so setting sortID 0 message id %@ message guid %@", (uint8_t *)&v31, 0x16u);

        }
      }
      objc_msgSend(v4, "setSortID:", 0);
    }
    else
    {
      -[IMItemsController _setSortID:](self, "_setSortID:", v4);
    }
  }

}

- (void)_persistSortIDFromReplacedItem:(id)a3 toItem:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      if (objc_msgSend(v7, "hasEditedParts"))
      {
        v8 = objc_msgSend(v5, "sortID");
        if (v8)
        {
          v9 = v8;
          v10 = objc_msgSend(v7, "sortID");
          v11 = IMOSLoggingEnabled();
          if (v10)
          {
            if (v11)
            {
              OSLogHandleForIMFoundationCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                v15 = 134217984;
                v16 = v10;
                _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Not updating sortID of edited message item, the message already has a sort ID of %ld", (uint8_t *)&v15, 0xCu);
              }

            }
          }
          else
          {
            if (v11)
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                v15 = 134217984;
                v16 = v9;
                _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Updating sortID of received edited message to %ld, to match existing sortID in transcript", (uint8_t *)&v15, 0xCu);
              }

            }
            objc_msgSend(v7, "setSortID:", v9);
          }
        }
        else
        {
          IMLogHandleForCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            sub_1A219774C();

        }
      }

    }
  }

}

- (BOOL)_handleIncomingItem:(id)a3
{
  return -[IMChat _handleIncomingItem:updateRecipient:suppressNotification:](self, "_handleIncomingItem:updateRecipient:suppressNotification:", a3, 1, 0);
}

- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4
{
  return -[IMChat _handleIncomingItem:updateRecipient:suppressNotification:](self, "_handleIncomingItem:updateRecipient:suppressNotification:", a3, a4, 0);
}

- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4 suppressNotification:(BOOL)a5
{
  return -[IMChat _handleIncomingItem:updateRecipient:suppressNotification:updateReplyCounts:](self, "_handleIncomingItem:updateRecipient:suppressNotification:updateReplyCounts:", a3, a4, a5, 1);
}

- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4 suppressNotification:(BOOL)a5 updateReplyCounts:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  char v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  int v31;
  char v32;
  char v33;
  int v34;
  char v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  char v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  _BOOL4 v74;
  int v75;
  int v76;
  int v77;
  int v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  uint8_t buf[4];
  IMChat *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v87 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    v81 = v8;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v84 = self;
        v85 = 2112;
        v86 = v10;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Handle incoming message on chat (%@) message: %@", buf, 0x16u);
      }

    }
    if (!-[IMChat canHaveMultipleParticipants](self, "canHaveMultipleParticipants")
      || !-[IMChat _isDuplicate:](self, "_isDuplicate:", v10))
    {
      objc_msgSend(v10, "message");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isSystemMessage") & 1) != 0
        || objc_msgSend(v13, "isTypingMessage") && -[IMChat isGroupChat](self, "isGroupChat"))
      {
        v12 = 0;
LABEL_68:

        goto LABEL_69;
      }
      if (objc_msgSend(v10, "type") == 4)
        -[IMChat _configureLocationShareItem:](self, "_configureLocationShareItem:", v10);
      -[IMItemsController _items](self, "_items");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[IMItemsController _indexOfItem:](self, "_indexOfItem:", v10);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v82 = 0;
      }
      else
      {
        objc_msgSend(v79, "objectAtIndex:", v14);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[IMChat _fixSendingItemDateAndSortID:](self, "_fixSendingItemDateAndSortID:", v10);
      -[IMChat _persistSortIDFromReplacedItem:toItem:](self, "_persistSortIDFromReplacedItem:toItem:", v82, v10);
      -[IMChat _handleItem:forChatStyle:updateReplyCounts:](self, "_handleItem:forChatStyle:updateReplyCounts:", v10, -[IMChat chatStyle](self, "chatStyle"), v6);
      if (objc_msgSend(v10, "associatedMessageType") == 2)
      {
        -[IMItemsController _items](self, "_items");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 - 1 >= objc_msgSend(v15, "count"))
        {
          v17 = 0;
        }
        else
        {
          -[IMItemsController _items](self, "_items");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", v14 - 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v17, "associatedMessageType") == 3)
        {
          objc_msgSend(v17, "pluginSessionGUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "pluginSessionGUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (v20)
          {
            objc_msgSend(v17, "guid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMChat messageForGUID:](self, "messageForGUID:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_imMessageItem");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            -[IMChat _handleIncomingItem:updateRecipient:suppressNotification:updateReplyCounts:](self, "_handleIncomingItem:updateRecipient:suppressNotification:updateReplyCounts:", v23, v81, v7, v6);
          }
        }

      }
      objc_msgSend(v82, "message");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v13, CFSTR("__kIMChatValueKey"), v24, CFSTR("__kIMChatOldValueKey"), 0);
      else
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v13, CFSTR("__kIMChatValueKey"), 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("__kIMChatMessageDidChangeNotification"), self, v80);

      objc_msgSend(v24, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {

      }
      else
      {
        objc_msgSend(v13, "error");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v13, CFSTR("__kIMChatValueKey"), 0);
          v29 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "postNotificationName:object:userInfo:", CFSTR("__kIMChatMessageSendFailedNotification"), self, v29);

          -[IMChat refreshServiceForSending](self, "refreshServiceForSending");
          v80 = (void *)v29;
        }
      }
      if (objc_msgSend(v24, "isRead"))
        v31 = objc_msgSend(v13, "isRead") ^ 1;
      else
        v31 = 0;
      v32 = objc_msgSend(v24, "isFinished");
      if (v14)
        v33 = v32;
      else
        v33 = 0;
      if ((v33 & 1) != 0)
      {
        v34 = 0;
        if (!v13)
          goto LABEL_44;
      }
      else
      {
        v34 = objc_msgSend(v13, "isFinished");
        if (!v13)
          goto LABEL_44;
      }
      if (!objc_msgSend(v13, "isFromMe"))
      {
        v45 = objc_msgSend(v13, "isRead");
        v46 = objc_msgSend(v13, "isCancelTypingMessage");
        v35 = v46;
        if ((v45 & 1) == 0 && ((v46 | (v31 | v34) ^ 1) & 1) == 0 && !v7)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v13, CFSTR("__kIMChatValueKey"), 0);
          v47 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "postNotificationName:object:userInfo:", CFSTR("__kIMChatMessageReceivedNotification"), self, v47);

          v35 = 0;
          v80 = (void *)v47;
        }
LABEL_45:
        if (objc_msgSend(v10, "type") == 4)
        {
          objc_msgSend(v10, "sender");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat _updateLocationShareItemsForSender:](self, "_updateLocationShareItemsForSender:", v36);

        }
        -[IMChat momentSharePresentationCache](self, "momentSharePresentationCache");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "registerMomentShareItemForMessage:", v13);

        if ((objc_msgSend(v24, "isRead") & 1) != 0 || !objc_msgSend(v13, "isRead"))
          v77 = 0;
        else
          v77 = objc_msgSend(v13, "isFromMe");
        if ((objc_msgSend(v24, "wasDataDetected") & 1) != 0)
          v78 = 0;
        else
          v78 = objc_msgSend(v13, "wasDataDetected");
        if ((objc_msgSend(v24, "isDelivered") & 1) != 0 || !objc_msgSend(v13, "isDelivered"))
          v76 = 0;
        else
          v76 = objc_msgSend(v13, "isFromMe");
        if ((objc_msgSend(v24, "isPlayed") & 1) != 0 || !objc_msgSend(v13, "isPlayed"))
          v75 = 0;
        else
          v75 = objc_msgSend(v13, "isFromMe");

        if ((v35 & 1) != 0 || objc_msgSend(v10, "type"))
        {
          v38 = 1;
LABEL_65:
          objc_msgSend(v10, "service");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMService iMessageService](IMServiceImpl, "iMessageService");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "internalName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v39, "isEqualToIgnoringCase:", v41);

          if (v42)
          {
            -[IMChat chatRegistry](self, "chatRegistry");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "_setChatHasCommunicatedOveriMessage:", self);

          }
          -[IMChat _invalidateDowngradeState](self, "_invalidateDowngradeState");
          -[IMChat updateWatermarks](self, "updateWatermarks");
          -[IMChat _setStartSendProgressImmediatelyIfNecessary](self, "_setStartSendProgressImmediatelyIfNecessary");

          v12 = v38 & (v35 ^ 1);
          goto LABEL_68;
        }
        if (objc_msgSend(v13, "isFromMe"))
          self->_didSendAFinishedMessage = 1;
        -[IMAccount service](self->_account, "service");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMService iMessageService](IMServiceImpl, "iMessageService");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49 == v50)
        {
          objc_msgSend(v13, "sender");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "account");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "service");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMService iMessageService](IMServiceImpl, "iMessageService");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v52 != v53;

        }
        else
        {
          v74 = 0;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "isTypingMessage"))
        {
          -[IMAccount service](self->_account, "service");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMService smsService](IMServiceImpl, "smsService");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v54 != v55;

        }
        else
        {
          v73 = 1;
        }
        -[IMAccount service](self->_account, "service");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMService smsService](IMServiceImpl, "smsService");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56 == v57)
        {
          objc_msgSend(v13, "sender");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "account");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "service");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMService iMessageService](IMServiceImpl, "iMessageService");
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)v58;
          if (v67 == (void *)v58)
          {
            objc_msgSend(v13, "guid");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMChat lastMessage](self, "lastMessage");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "guid");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v70, "isEqualToString:", v62);

            v69 = v66 ^ 1;
            v60 = v59;
          }
          else
          {
            v60 = (void *)v58;
            v69 = 0;
          }

        }
        else
        {
          v69 = 0;
        }

        if (((objc_msgSend(v10, "isFromMe") | v78) & 1) == 0
          && !-[IMChat canHaveMultipleParticipants](self, "canHaveMultipleParticipants"))
        {
          objc_msgSend(v13, "sender");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat recipient](self, "recipient");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v63, "isEqual:", v64) | v76 | v77 | v75 | v74;
          if (v65 == 1)
          {

LABEL_95:
            v38 = v65 ^ 1;
            goto LABEL_65;
          }

          if ((v73 & v81 & ~v69) != 0)
          {
            objc_msgSend(v13, "sender");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMChat setRecipient:](self, "setRecipient:", v63);
            goto LABEL_95;
          }
        }
        v38 = 0;
        goto LABEL_65;
      }
LABEL_44:
      v35 = objc_msgSend(v13, "isCancelTypingMessage");
      goto LABEL_45;
    }
  }
  v12 = 0;
LABEL_69:

  return v12;
}

- (void)_setStartSendProgressImmediatelyIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (-[IMItemsController _shouldPinUnsentMessagesToBottom](self, "_shouldPinUnsentMessagesToBottom"))
  {
    -[IMItemsController _items](self, "_items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMItemsController assignSortIDsToItems:shouldRecalculateSortIDForAllMessages:](self, "assignSortIDsToItems:shouldRecalculateSortIDForAllMessages:", v3, 0);

    if (-[IMSendProgress startSendProgressImmediately](self->_sendProgress, "startSendProgressImmediately"))
    {
      -[IMItemsController _items](self, "_items");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsentIsFromMeItem");

      if ((v6 & 1) == 0)
        -[IMSendProgress setStartSendProgressImmediately:](self->_sendProgress, "setStartSendProgressImmediately:", 0);
    }
  }
  if (-[IMChat isStewieChat](self, "isStewieChat"))
    -[IMSendProgress setStartSendProgressImmediately:](self->_sendProgress, "setStartSendProgressImmediately:", 1);
  if (-[IMChat _isSatelliteServiceActive](self, "_isSatelliteServiceActive"))
    -[IMSendProgress setStartSendProgressImmediately:](self->_sendProgress, "setStartSendProgressImmediately:", 1);
}

- (BOOL)_isSatelliteServiceActive
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSatelliteConnectionActive");

  if (!v4)
    return 0;
  -[IMChat account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService iMessageLiteService](IMServiceImpl, "iMessageLiteService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v11 = 1;
  }
  else
  {
    -[IMChat account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService satelliteSMSService](IMServiceImpl, "satelliteSMSService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 == v10;

  }
  return v11;
}

- (void)_participant:(id)a3 statusChanged:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat _participants:statusChanged:](self, "_participants:statusChanged:", v8, v4, v9, v10);
}

- (void)_participant:(id)a3 statusChanged:(int)a4 postNotification:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat _participants:statusChanged:postNotification:](self, "_participants:statusChanged:postNotification:", v10, v6, v5, v11, v12);
}

- (void)_participants:(id)a3 statusChanged:(int)a4
{
  -[IMChat _participants:statusChanged:postNotification:](self, "_participants:statusChanged:postNotification:", a3, *(_QWORD *)&a4, 1);
}

- (void)_participants:(id)a3 statusChanged:(int)a4 postNotification:(BOOL)a5
{
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *participantStates;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSMutableDictionary *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v31;
  void *v32;
  char v33;
  char v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  void *v42;
  uint8_t v43[128];
  uint8_t buf[4];
  IMChat *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v45 = self;
      v46 = 2112;
      v47 = v6;
      v48 = 1024;
      v49 = a4;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "chat: %@  handles: %@  status: %d", buf, 0x1Cu);
    }

  }
  v8 = 0;
  v9 = 2;
  switch(a4)
  {
    case -1:
      break;
    case 0:
      v8 = 0;
      v9 = 4;
      break;
    case 1:
      v8 = 0;
      v9 = 8;
      break;
    case 2:
      v8 = 0;
      v9 = 16;
      break;
    case 3:
      v8 = 1;
      v9 = 32;
      break;
    case 4:
      v8 = 0;
      v9 = 64;
      break;
    case 5:
      v8 = 0;
      v9 = 128;
      break;
    default:
      v8 = 0;
      v9 = 1;
      break;
  }
  v29 = v8;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (!v10)
  {

    v11 = 0;
    v32 = 0;
    v25 = 0;
    goto LABEL_60;
  }
  v34 = 0;
  v11 = 0;
  v31 = 0;
  v32 = 0;
  v12 = *(_QWORD *)v38;
  v33 = 0;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if (-[IMChat stateForParticipant:](self, "stateForParticipant:", v14) != v9)
      {
        if (!v11)
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v11, "addObject:", v14);
        v34 = 1;
      }
      if (a4 == 2)
      {
        participantStates = self->_participantStates;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "guid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](participantStates, "setObject:forKey:", v16, v17);

        if (-[IMChat canHaveMultipleParticipants](self, "canHaveMultipleParticipants")
          && !-[NSArray containsObject:](self->_participants, "containsObject:", v14))
        {
          v18 = (id)-[NSArray mutableCopy](self->_participants, "mutableCopy");
          if (!v18)
            v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v18, "addObject:", v14);
          objc_storeStrong((id *)&self->_participants, v18);
          v19 = v32;
          if (!v32)
          {
            v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v32 = v19;
          }
LABEL_35:
          objc_msgSend(v19, "addObject:", v14);

          v33 = 1;
          continue;
        }
      }
      else if ((((a4 - 3) < 3) & -[IMChat canHaveMultipleParticipants](self, "canHaveMultipleParticipants")) != 0&& -[NSArray containsObject:](self->_participants, "containsObject:", v14))
      {
        v20 = self->_participantStates;
        objc_msgSend(v14, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v20, "removeObjectForKey:", v21);

        v18 = (id)-[NSArray mutableCopy](self->_participants, "mutableCopy");
        if (!v18)
          v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v18, "removeObjectIdenticalTo:", v14);
        objc_storeStrong((id *)&self->_participants, v18);
        v19 = v31;
        if (!v31)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v31 = v19;
        }
        goto LABEL_35;
      }
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  }
  while (v10);

  if ((v33 & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = self;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_DEBUG, "chat: %@ has participants set changed. Refresh service for sending...", buf, 0xCu);
      }

    }
    -[IMChat refreshServiceForSending](self, "refreshServiceForSending");
  }
  if (!a5)
    goto LABEL_55;
  if ((v34 & 1) != 0)
  {
    v41 = CFSTR("__kIMChatValueKey");
    v23 = (void *)objc_msgSend(v11, "copy");
    v42 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatParticipantStateDidChangeNotification"), v24);

    if ((v33 & 1) == 0)
      goto LABEL_56;
LABEL_50:
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v32, "count"))
    {
      v27 = (void *)objc_msgSend(v32, "copy");
      objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("__kIMChatParticipantsDidChangeAddedParticipantsKey"));

    }
    if (objc_msgSend(v31, "count"))
    {
      v28 = (void *)objc_msgSend(v31, "copy");
      objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("__kIMChatParticipantsDidChangeRemovedParticipantsKey"));

    }
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatParticipantsDidChangeNotification"), v26);

LABEL_55:
    if ((v34 & 1) != 0)
    {
LABEL_56:
      if (v29)
        -[IMChat invalidateSpamIndicatorCachedValues](self, "invalidateSpamIndicatorCachedValues");
      else
        -[IMChat invalidateSpamIndicatorCachedValuesIfNeeded](self, "invalidateSpamIndicatorCachedValuesIfNeeded");
    }
  }
  else if ((v33 & 1) != 0)
  {
    goto LABEL_50;
  }
  v25 = v31;
LABEL_60:

}

- (void)_showErrorMessage:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0C99D80];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithObjectsAndKeys:", v5, CFSTR("__kIMChatValueKey"), 0);

  -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatErrorDidOccurNotification"), v6);
}

- (id)_performQueryWithKey:(id)a3 loadImmediately:(BOOL)a4 block:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v8 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[IMChat _validateChatRegistrationWithRegistry](self, "_validateChatRegistrationWithRegistry");
  v13 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v13)
    {
      OSLogHandleForIMEventCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = self;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Initiate query %@ for chat: %@", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v27 = sub_1A200AE34;
    v28 = sub_1A200AC8C;
    v29 = 0;
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1A20C10E8;
    v23[3] = &unk_1E4721020;
    v25 = buf;
    v24 = v11;
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = sub_1A20C113C;
    v21[3] = &unk_1E4721048;
    v22 = v12;
    objc_msgSend(v16, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", v10, v8, v23, v21);

    v18 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = 0;
        _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Attempted to initiate query with nil query block for key: %@ chat: %@", buf, 0x16u);
      }

    }
    v18 = 0;
  }

  return v18;
}

- (id)_performQueryWithKey:(id)a3 loadImmediately:(BOOL)a4 block:(id)a5
{
  return -[IMChat _performQueryWithKey:loadImmediately:block:completion:](self, "_performQueryWithKey:loadImmediately:block:completion:", a3, a4, a5, 0);
}

- (void)endListeningToAttributionChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("__kIMBalloonPluginAttributionChangedNotification"), 0);

}

- (void)beginListeningToAttributionChanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMChat chatItems](self, "chatItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0D37600];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "bundleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsString:", v7);

          if (!v12)
          {
            -[IMChat _handleBalloonPluginAttributionChanged](self, "_handleBalloonPluginAttributionChanged");

            goto LABEL_13;
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleBalloonPluginAttributionChanged, CFSTR("__kIMBalloonPluginAttributionChangedNotification"), 0);

}

- (void)_handleBalloonPluginAttributionChanged
{
  -[IMReasonTrackingUpdater setNeedsDeferredUpdateWithReason:](self->_chatItemsUpdater, "setNeedsDeferredUpdateWithReason:", CFSTR("BalloonPluginAttributionChanged"));
}

- (void)_engroupParticipantsUpdated
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Posting IMChatEngroupFinishedUpdatingNotification from IMChat", v4, 2u);
    }

  }
  -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatEngroupFinishedUpdatingNotification"), 0);
}

- (void)_validateChatRegistrationWithRegistry
{
  NSObject *v3;
  int v4;
  IMChat *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (-[IMChat isUnregistered](self, "isUnregistered") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "***WARNING*** Attempting to use a chat that has been unregistered: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)participantsWithState:(unint64_t)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_participants, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_participants;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = -[IMChat stateForParticipant:](self, "stateForParticipant:", v11, (_QWORD)v16);
        if (v12 <= 1)
          v13 = 1;
        else
          v13 = v12;
        if ((v13 & a3) != 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (void)_clearCachedIdentifier
{
  NSString *identifier;

  identifier = self->_identifier;
  self->_identifier = 0;

  -[IMChat setGroupChatIdentifierUppercase:](self, "setGroupChatIdentifierUppercase:", 0);
}

- (BOOL)canHaveMultipleParticipants
{
  return (-[IMChat chatStyle](self, "chatStyle") & 0xFFFFFFF7) == 35;
}

- (unint64_t)overallChatStatus
{
  void *v3;
  unint64_t v4;

  if (-[IMChat chatStyle](self, "chatStyle") != 45)
    return 1;
  -[IMChat recipient](self, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  return v4;
}

- (void)setRoomName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_roomName != v5 && self->_style != 45)
  {
    v6 = v5;
    -[IMChat _clearCachedIdentifier](self, "_clearCachedIdentifier");
    objc_storeStrong((id *)&self->_roomName, a3);
    v5 = v6;
  }

}

- (void)_setDisplayName:(id)a3
{
  void *v4;
  NSString **p_displayName;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  int v16;
  NSString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  IMSharedHelperTruncatedGroupDisplayName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_displayName = &self->_displayName;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0
    && (self->_style != 45
     || -[IMChat isBusinessChat](self, "isBusinessChat")
     || -[IMChat isStewieChat](self, "isStewieChat")))
  {
    if (*p_displayName
      || (objc_msgSend(v4, "trimmedString"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "length"),
          v6,
          v7))
    {
      if ((objc_msgSend(v4, "isEqualToString:") & 1) == 0)
      {
        v8 = (void *)MEMORY[0x1E0D396F8];
        -[IMChat businessHandle](self, "businessHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "placeholderNameForBrandURI:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (!v12 || !-[IMChat isBusinessChat](self, "isBusinessChat"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v14 = *p_displayName;
              v16 = 138412546;
              v17 = v14;
              v18 = 2112;
              v19 = v4;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Changing display name from %@ to %@", (uint8_t *)&v16, 0x16u);
            }

          }
          -[IMChat _clearCachedIdentifier](self, "_clearCachedIdentifier");
          objc_storeStrong((id *)&self->_displayName, v4);
          -[IMChat chatRegistry](self, "chatRegistry");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_chat:updateDisplayName:", self, v4);

          -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatDisplayNameChangedNotification"), 0);
        }
      }
    }
  }

}

- (void)_updateDisplayName:(id)a3
{
  -[IMChat _updateDisplayName:sender:](self, "_updateDisplayName:sender:", a3, 0);
}

- (void)_updateDisplayName:(id)a3 sender:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSString *displayName;
  void *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0
    && (self->_style != 45 || -[IMChat isStewieChat](self, "isStewieChat")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        displayName = self->_displayName;
        *(_DWORD *)buf = 138412546;
        v15 = displayName;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Updating display name from %@ to %@", buf, 0x16u);
      }

    }
    -[IMChat _clearCachedIdentifier](self, "_clearCachedIdentifier");
    objc_storeStrong((id *)&self->_displayName, a3);
    if (v8)
    {
      v12 = CFSTR("sender");
      v13 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatDisplayNameChangedNotification"), v11);

  }
}

- (void)setDisplayName:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *displayName;
  NSObject *v7;
  int v8;
  IMChat *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      displayName = self->_displayName;
      v8 = 138412802;
      v9 = self;
      v10 = 2112;
      v11 = displayName;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "[%@]Request to change display name from %@ to %@", (uint8_t *)&v8, 0x20u);
    }

  }
  if (-[IMChat joinState](self, "joinState"))
  {
    -[IMChat _setDisplayName:](self, "_setDisplayName:", v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Not changing display name because we're no longer in the chat", (uint8_t *)&v8, 2u);
    }

  }
}

- (id)_participantListStringForNames:(id)a3 visibleNameCount:(int64_t)a4
{
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  if (objc_msgSend(v5, "count") >= (unint64_t)a4)
    v6 = a4 & ~(a4 >> 63);
  else
    v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v5, "count") - v6;
  if (v7 == 1)
  {
    v6 = objc_msgSend(v5, "count");
    v7 = 0;
  }
  objc_msgSend(v5, "subarrayWithRange:", 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v8);
  if (v7 >= 1)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    sub_1A20F1964();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("N_OTHERS"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v13);
  }
  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_updateLastAddressedHandleID:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *lastAddressedHandleID;
  int v8;
  IMChat *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0
    && (objc_msgSend(v5, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        lastAddressedHandleID = self->_lastAddressedHandleID;
        v8 = 138412802;
        v9 = self;
        v10 = 2112;
        v11 = lastAddressedHandleID;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "[%@]Request from imagent to set client last addressed handle from %@ to %@", (uint8_t *)&v8, 0x20u);
      }

    }
    objc_storeStrong((id *)&self->_lastAddressedHandleID, a3);
    self->_senderBlackholeWarningStatus = 0;
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatLastAddressedHandleChangedNotification"), 0);
  }

}

- (void)setLastAddressedHandleID:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *lastAddressedHandleID;
  id *p_lastAddressedHandleID;
  void *v9;
  BOOL v10;
  NSObject *v11;
  IMChat *v12;
  void *v13;
  int v14;
  IMChat *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      lastAddressedHandleID = self->_lastAddressedHandleID;
      v14 = 138412802;
      v15 = self;
      v16 = 2112;
      v17 = lastAddressedHandleID;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "[%@]Request from client to update client/imagent last addressed handle from %@ to %@", (uint8_t *)&v14, 0x20u);
    }

  }
  p_lastAddressedHandleID = (id *)&self->_lastAddressedHandleID;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0
    && (objc_msgSend(v5, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]) & 1) == 0)
  {
    if ((IMSharedHelperDeviceHasMultipleSubscriptions() & 1) != 0
      || *p_lastAddressedHandleID
      || (objc_msgSend(v5, "trimmedString"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "length") == 0,
          v9,
          !v10))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (IMChat *)*p_lastAddressedHandleID;
          v14 = 138412546;
          v15 = v12;
          v16 = 2112;
          v17 = (NSString *)v5;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Changing client last addressed handle from %@ to %@", (uint8_t *)&v14, 0x16u);
        }

      }
      objc_storeStrong(p_lastAddressedHandleID, a3);
      self->_senderBlackholeWarningStatus = 0;
      -[IMChat chatRegistry](self, "chatRegistry");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_chat:updateLastAddressedHandle:", self, v5);

    }
  }

}

- (void)_updateLastAddressedSIMID:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *lastAddressedSIMID;
  int v8;
  IMChat *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length") && (IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        lastAddressedSIMID = self->_lastAddressedSIMID;
        v8 = 138412802;
        v9 = self;
        v10 = 2112;
        v11 = lastAddressedSIMID;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "[%@]Request from imagent to set client last addressed sim ID from %@ to %@", (uint8_t *)&v8, 0x20u);
      }

    }
    objc_storeStrong((id *)&self->_lastAddressedSIMID, a3);
  }

}

- (void)setLastAddressedSIMID:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *lastAddressedSIMID;
  NSString **p_lastAddressedSIMID;
  void *v9;
  BOOL v10;
  NSObject *v11;
  IMChat *v12;
  void *v13;
  int v14;
  IMChat *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      lastAddressedSIMID = self->_lastAddressedSIMID;
      v14 = 138412802;
      v15 = self;
      v16 = 2112;
      v17 = lastAddressedSIMID;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "[%@]Request from client to update client/imagent last addressed sim ID from %@ to %@", (uint8_t *)&v14, 0x20u);
    }

  }
  if (objc_msgSend(v5, "length"))
  {
    p_lastAddressedSIMID = &self->_lastAddressedSIMID;
    if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
    {
      if (*p_lastAddressedSIMID
        || (objc_msgSend(v5, "trimmedString"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "length") == 0,
            v9,
            !v10))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = (IMChat *)*p_lastAddressedSIMID;
            v14 = 138412546;
            v15 = v12;
            v16 = 2112;
            v17 = (NSString *)v5;
            _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Changing client last addressed sim ID from %@ to %@", (uint8_t *)&v14, 0x16u);
          }

        }
        objc_storeStrong((id *)&self->_lastAddressedSIMID, a3);
        -[IMChat chatRegistry](self, "chatRegistry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_chat:updateLastAddressedSIMID:", self, v5);

      }
    }
  }

}

- (NSString)deviceIndependentID
{
  if (-[IMChat isGroupChat](self, "isGroupChat"))
    -[IMChat groupID](self, "groupID");
  else
    -[IMChat persistentID](self, "persistentID");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)pinningIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  if (-[IMChat isGroupChat](self, "isGroupChat") && -[IMChat isSMS](self, "isSMS"))
  {
    -[IMChat chatRegistry](self, "chatRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat participants](self, "participants");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sortedParticipantIDHashForParticipants:usesPersonCentricID:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMChat deviceIndependentID](self, "deviceIndependentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)identityHash
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[IMChat participants](self, "participants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "ID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  -[IMChat displayName](self, "displayName");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[IMChat displayName](self, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E4725068);

    if ((v13 & 1) == 0)
    {
      -[IMChat displayName](self, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v14);

    }
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "SHA1HexString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (NSString)roomNameWithoutSuffix
{
  NSString *roomNameWithoutSuffix;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  NSString *v22;
  id v23;

  roomNameWithoutSuffix = self->_roomNameWithoutSuffix;
  if (roomNameWithoutSuffix)
    goto LABEL_5;
  v4 = -[NSString rangeOfString:](self->_roomName, "rangeOfString:", CFSTR("@"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v4, v7 = v4 + v5, v4 + v5 == -[NSString length](self->_roomName, "length")))
  {
    roomNameWithoutSuffix = self->_roomName;
LABEL_5:
    v8 = roomNameWithoutSuffix;
    return v8;
  }
  -[NSString substringFromIndex:](self->_roomName, "substringFromIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    -[IMChat account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "server");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length")
      && (v13 = objc_msgSend(v10, "rangeOfString:", v12), v13 != 0x7FFFFFFFFFFFFFFFLL)
      && (v15 = v13, v13 + v14 == objc_msgSend(v10, "length")))
    {
      -[NSString substringToIndex:](self->_roomName, "substringToIndex:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "substringToIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "hasSuffix:", CFSTR(".")))
      {
        objc_msgSend(v17, "substringToIndex:", objc_msgSend(v17, "length") - 1);
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v18;
      }
      objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 >= 2)
      {
        objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("@%@"), v17);
        v21 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v21;
      }
      v22 = self->_roomNameWithoutSuffix;
      self->_roomNameWithoutSuffix = (NSString *)v16;
      v23 = v16;

      v8 = self->_roomNameWithoutSuffix;
    }
    else
    {
      v8 = self->_roomName;
    }

  }
  else
  {
    v8 = self->_roomName;
  }

  return v8;
}

- (BOOL)hasUnhandledInvitation
{
  return self->_isFirstMessageInvitation && !self->_wasInvitationHandled;
}

- (void)acceptInvitation
{
  NSObject *v3;
  void *v4;
  int v5;
  IMChat *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  if (-[IMChat joinState](self, "joinState") != 3)
  {
    -[IMChat _setJoinState:](self, "_setJoinState:", 2);
    -[IMChat chatRegistry](self, "chatRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_chat:joinWithProperties:", self, 0);

    self->_wasInvitationHandled = 1;
  }
}

- (void)declineInvitation
{
  NSObject *v3;
  void *v4;
  int v5;
  IMChat *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  -[IMChat chatRegistry](self, "chatRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_chat_declineInvitation:", self);

  self->_wasInvitationHandled = 1;
}

- (void)_sendMessage:(id)a3 adjustingSender:(BOOL)a4 shouldQueue:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[IMChat account](self, "account");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat _sendMessage:withAccount:adjustingSender:shouldQueue:](self, "_sendMessage:withAccount:adjustingSender:shouldQueue:", v8, v9, v6, v5);

}

- (void)_sendMessage:(id)a3 withAccount:(id)a4 adjustingSender:(BOOL)a5 shouldQueue:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  IMChat *v10;
  IMChat *v11;
  NSObject *v12;
  const __CFString *v13;
  unint64_t v14;
  id v15;
  NSObject *v16;
  NSMutableArray *messagesPendingJoin;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  IMChat *v25;
  __int16 v26;
  IMChat *v27;
  __int16 v28;
  IMChat *v29;
  __int16 v30;
  NSMutableArray *v31;
  uint64_t v32;

  v6 = a6;
  v7 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = (IMChat *)a3;
  v11 = (IMChat *)a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2112;
      if (v7)
        v13 = CFSTR("YES");
      v27 = v10;
      v28 = 2112;
      v29 = (IMChat *)v13;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_DEBUG, "chat: %@   message: %@  adjusting sender: %@", buf, 0x20u);
    }

  }
  -[IMChat _updateSenderForMessageIfNeeded:adjustingSender:withAccount:](self, "_updateSenderForMessageIfNeeded:adjustingSender:withAccount:", v10, v7, v11);
  -[IMChat _updateBizIntentForMessageIfNeeded:](self, "_updateBizIntentForMessageIfNeeded:", v10);
  -[IMChat _updateLocaleForMessageIfNeeded:](self, "_updateLocaleForMessageIfNeeded:", v10);
  -[IMChat _updateTypingGUIDForMessageIfNeeded:](self, "_updateTypingGUIDForMessageIfNeeded:", v10);
  -[IMChat _updateWalletBreadcrumbingAssociationForMessageIfNeeded:](self, "_updateWalletBreadcrumbingAssociationForMessageIfNeeded:", v10);
  v23 = 0;
  v14 = -[IMChat keyTransparencyStatusForAffectedHandles:](self, "keyTransparencyStatusForAffectedHandles:", &v23);
  v15 = v23;
  -[IMChat setIsKeyTransparencyVerifiedMessage:](v10, "setIsKeyTransparencyVerifiedMessage:", (v14 < 9) & (0x130u >> v14));
  if (-[IMChat _updateJoinStateWithMessageIfNeeded:](self, "_updateJoinStateWithMessageIfNeeded:", v10))
  {
    -[IMChat _updatePayloadForMessageIfNeeded:](self, "_updatePayloadForMessageIfNeeded:", v10);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        messagesPendingJoin = self->_messagesPendingJoin;
        *(_DWORD *)buf = 138413058;
        v25 = v10;
        v26 = 2112;
        v27 = v11;
        v28 = 2112;
        v29 = self;
        v30 = 2112;
        v31 = messagesPendingJoin;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Sending message %@ to account: %@ (%@)  (Pending: %@)", buf, 0x2Au);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_chat:sendMessage:withAccount:", self, v10, v11);

    -[IMChat _refreshServiceForSendingIfNeededWithMessage:](self, "_refreshServiceForSendingIfNeededWithMessage:", v10);
  }
  -[IMChat _imMessageItem](v10, "_imMessageItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat _updateMessageItemTimeIfNeeded:](self, "_updateMessageItemTimeIfNeeded:", v19);
  -[IMChat _updateMessageItemStewieIfNeeded:](self, "_updateMessageItemStewieIfNeeded:", v19);
  if (-[IMChat scheduleType](v10, "scheduleType") == 1)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v25 = v10;
        v26 = 2112;
        v27 = v11;
        v28 = 2112;
        v29 = self;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Not updating client about scheduled message %@ to account: %@ (%@)", buf, 0x20u);
      }

    }
  }
  else if (v6)
  {
    -[IMChat _handleIncomingItem:](self, "_handleIncomingItem:", v19);
  }
  else if ((-[IMChat isTypingMessage](v10, "isTypingMessage") & 1) == 0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1A20C3034;
    v21[3] = &unk_1E471E7C8;
    v21[4] = self;
    v22 = v19;
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Sending message"), v21);

  }
}

- (NSNumber)countOfAttachmentsNotCachedLocally
{
  id v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A20C30C0;
  v5[3] = &unk_1E4720F70;
  v5[4] = self;
  v3 = -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("CountAttachmentsNotCachedLocally"), 1, v5);
  return self->_countOfAttachmentsNotCachedLocally;
}

- (NSArray)attachments
{
  id v3;
  NSArray *v4;
  NSObject *v5;
  int v6;
  _QWORD v8[5];
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A20C3264;
  v8[3] = &unk_1E4720F70;
  v8[4] = self;
  v3 = -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("LoadAttachments"), 1, v8);
  v4 = self->_attachments;
  -[IMChat _setAttachments:](self, "_setAttachments:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = -[NSArray count](v4, "count");
      *(_DWORD *)buf = 67109120;
      v10 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Return %d attachments", buf, 8u);
    }

  }
  return v4;
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[IMChat chatRegistry](self, "chatRegistry");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_chat:cancelScheduledMessageWithGUID:destinations:cancelType:", self, v9, v8, a5);

}

- (void)editScheduledMessageItem:(id)a3 atPartIndex:(int64_t)a4 withNewPartText:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a5;
  objc_msgSend(v15, "editedPartIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    objc_msgSend(v10, "removeIndex:", a4);
    objc_msgSend(v15, "setEditedPartIndexes:", v10);
  }
  objc_msgSend(v15, "failedEditPartIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v12)
  {
    objc_msgSend(v12, "removeIndex:", a4);
    objc_msgSend(v15, "setFailedEditPartIndexes:", v12);
  }
  objc_msgSend(MEMORY[0x1E0D39918], "editedMessageItemWithOriginalMessageItem:editedPartIndex:newPartText:", v15, a4, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat chatRegistry](self, "chatRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_chat:editScheduledMessageItem:previousMessageItem:partIndex:editType:", self, v13, v15, a4, 1);

}

- (void)cancelScheduledMessageItem:(id)a3 cancelType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  -[IMChat participantsWithState:](self, "participantsWithState:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__imArrayByApplyingBlock:", &unk_1E47210B0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 - 2 < 3)
    goto LABEL_4;
  if (a4 == 1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A20C35A0;
    v11[3] = &unk_1E47210D8;
    v11[4] = self;
    v12 = v6;
    v13 = v8;
    v14 = 1;
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Cancel scheduled message items"), v11);

    goto LABEL_6;
  }
  if (!a4)
  {
LABEL_4:
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat cancelScheduledMessageWithGUID:destinations:cancelType:](self, "cancelScheduledMessageWithGUID:destinations:cancelType:", v9, v10, a4);

  }
LABEL_6:

}

- (void)cancelScheduledMessageItem:(id)a3 atPartIndex:(int64_t)a4 shouldRetractSubject:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a3;
  if (objc_msgSend(v14, "partCount") == 1)
  {
    -[IMChat cancelScheduledMessageItem:cancelType:](self, "cancelScheduledMessageItem:cancelType:", v14, 1);
  }
  else
  {
    objc_msgSend(v14, "retractedPartIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (v9)
    {
      objc_msgSend(v9, "removeIndex:", a4);
      objc_msgSend(v14, "setRetractedPartIndexes:", v9);
    }
    objc_msgSend(v14, "failedRetractPartIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v11)
    {
      objc_msgSend(v11, "removeIndex:", a4);
      objc_msgSend(v14, "setFailedRetractPartIndexes:", v11);
    }
    objc_msgSend(MEMORY[0x1E0D39918], "editedMessageItemWithOriginalMessageItem:retractedPartIndex:shouldRetractSubject:", v14, a4, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat chatRegistry](self, "chatRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_chat:editScheduledMessageItem:previousMessageItem:partIndex:editType:", self, v12, v14, a4, 2);

  }
}

- (void)editScheduledMessageItems:(id)a3 scheduleType:(unint64_t)a4 deliveryTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  IMChat *v20;
  id v21;
  unint64_t v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v14, "scheduleType") == a4)
        {
          objc_msgSend(v14, "time");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v16 = v15 == v9;

          if (v16)
            continue;
        }

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = sub_1A20C39D0;
        v18[3] = &unk_1E47210D8;
        v19 = v10;
        v20 = self;
        v22 = a4;
        v21 = v9;
        -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Modifying scheduled time to be immediate"), v18);

        goto LABEL_15;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "editScheduledMessageItems ignoring request since all items are already of the scheduleType & deliveryTime", buf, 2u);
    }

  }
LABEL_15:

}

- (void)editScheduledMessageItem:(id)a3 scheduleType:(unint64_t)a4 deliveryTime:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  void *v27;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "scheduleType") == 2 && objc_msgSend(v8, "scheduleState") == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    if (a4 == 2)
    {
      if (v9 && (objc_msgSend(v9, "timeIntervalSinceNow"), v11 > 0.0))
      {
        v12 = v9;

        objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDateEdited:", v13);

        v10 = v12;
      }
      else
      {
        IMLogHandleForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1A2197778();

      }
    }
    objc_msgSend(v8, "setTime:", v10);
    objc_msgSend(v8, "setScheduleType:", a4);
    if (!objc_msgSend(v8, "scheduleType"))
      objc_msgSend(v8, "setScheduleState:", 0);
    -[IMChat account](self, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imHandleWithID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMChat account](self, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imHandleWithID:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMMessage messageFromIMMessageItem:sender:subject:](IMMessage, "messageFromIMMessageItem:sender:subject:", v8, v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!a4)
      objc_msgSend(v21, "_updateFlags:", objc_msgSend(v21, "flags") & 0xFFFFFFFFFFFF7FFFLL);
    objc_msgSend(v8, "context");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v8, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "context");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setMessage:", v22);

      }
    }
    -[IMChat sendMessage:](self, "sendMessage:", v22);
    -[IMChat _handleItem:](self, "_handleItem:", v8);

  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1A21977DC(v8, v10);
  }

}

- (void)_updateMessageItemStewieIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  if (-[IMChat isStewieChat](self, "isStewieChat"))
    objc_msgSend(v4, "setIsStewie:", 1);

}

- (void)_updateScheduledMessageTimeOffsetIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (objc_msgSend(v4, "scheduleType") == 2)
  {
    -[IMItemsController _items](self, "_items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_1A200AE34;
    v20 = sub_1A200AC8C;
    v21 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = sub_1A20C3F20;
    v13 = &unk_1E4720068;
    v6 = v4;
    v14 = v6;
    v15 = &v16;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, &v10);
    v7 = (void *)v17[5];
    if (v7)
    {
      objc_msgSend(v7, "time", v10, v11, v12, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingTimeInterval:", 0.001);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTime:", v9);

    }
    _Block_object_dispose(&v16, 8);

  }
}

- (void)_updateMessageItemTimeIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[IMItemsController _shouldPinUnsentMessagesToBottom](self, "_shouldPinUnsentMessagesToBottom"))
    -[IMChat _fixItemForSendingMessageTime:](self, "_fixItemForSendingMessageTime:", v4);
  -[IMChat _updateScheduledMessageTimeOffsetIfNeeded:](self, "_updateScheduledMessageTimeOffsetIfNeeded:", v4);

}

- (void)_updateSenderForMessageIfNeeded:(id)a3 adjustingSender:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[IMChat account](self, "account");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat _updateSenderForMessageIfNeeded:adjustingSender:withAccount:](self, "_updateSenderForMessageIfNeeded:adjustingSender:withAccount:", v6, v4, v7);

}

- (void)_updateSenderForMessageIfNeeded:(id)a3 adjustingSender:(BOOL)a4 withAccount:(id)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v7 = a5;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "loginIMHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (+[IMBalloonPluginManager isRunningPPT](IMBalloonPluginManager, "isRunningPPT"))
      {
        objc_msgSend(v8, "imHandleWithID:", CFSTR("test@icloud.com"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
    objc_msgSend(v10, "_updateSender:", v9);

  }
}

- (void)_updateBizIntentForMessageIfNeeded:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[IMChat isMapKitBusinessChat](self, "isMapKitBusinessChat"))
  {
    -[IMChat bizIntent](self, "bizIntent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }
  if ((objc_msgSend(v10, "isTypingMessage") & 1) == 0)
  {
    objc_msgSend(v10, "associatedMessageGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      v8 = 1;
    else
      v8 = v5;
    if ((v8 & 1) == 0)
    {
      -[IMChat bizIntent](self, "bizIntent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_updateBizIntent:", v9);

      -[IMChat setBizIntent:](self, "setBizIntent:", 0);
    }
  }

}

- (void)_updateLocaleForMessageIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[IMChat isBusinessChat](self, "isBusinessChat") && (objc_msgSend(v9, "isTypingMessage") & 1) == 0)
  {
    objc_msgSend(v9, "associatedMessageGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length")
      || (-[IMChat messageForGUID:](self, "messageForGUID:", v4),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "balloonBundleID"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D374C8]),
          v6,
          v5,
          v7))
    {
      -[IMChat _getCurrentLocale](self, "_getCurrentLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_updateLocale:", v8);

    }
  }

}

- (id)_getCurrentLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateTypingGUIDForMessageIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSString *currentLocationGUID;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  NSString *v16;
  NSString *typingGUID;
  NSObject *v18;
  NSString *v19;
  NSString *v20;
  NSString *localUserIsComposing;
  int v22;
  NSString *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_typingGUID)
  {
    -[IMChat account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsTypingIndicators");

    LODWORD(v5) = objc_msgSend(v4, "wasDowngraded");
    objc_msgSend(v4, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "isEqualToIgnoringCase:", self->_typingGUID);

    currentLocationGUID = self->_currentLocationGUID;
    objc_msgSend(v4, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(currentLocationGUID) = -[NSString isEqualToString:](currentLocationGUID, "isEqualToString:", v10);

    -[IMChat account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldReuseTypingIndicatorGUID");

    v14 = objc_msgSend(v4, "scheduleType");
    if (((v7 ^ 1 | v5 | v6 | currentLocationGUID) & 1) == 0
      && v13
      && v14 != 2)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "guid");
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          typingGUID = self->_typingGUID;
          v22 = 138412546;
          v23 = v16;
          v24 = 2112;
          v25 = typingGUID;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Updating typing guid on IMMessage from %@ to %@", (uint8_t *)&v22, 0x16u);

        }
      }
      objc_msgSend(v4, "_updateGUID:", self->_typingGUID);
    }
    if (objc_msgSend(v4, "isFinished"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = self->_typingGUID;
          v22 = 138412290;
          v23 = v19;
          _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, " => Message is finished, clearing typing guid: %@", (uint8_t *)&v22, 0xCu);
        }

      }
      v20 = self->_typingGUID;
      self->_typingGUID = 0;

      localUserIsComposing = self->_localUserIsComposing;
      self->_localUserIsComposing = 0;

    }
  }

}

- (void)_updateWalletBreadcrumbingAssociationForMessageIfNeeded:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  id obj;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  objc_msgSend(v27, "balloonBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D37620]);

  if (v5)
  {
    objc_msgSend(v27, "associatedMessageGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      IMExtensionPayloadUnarchivingClasses();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3710];
      objc_msgSend(v27, "payloadData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v28, v8, &v38);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v38;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v10;
          _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Finished unarchivedObjectOfClasses for payloadData. Error: [%@]", buf, 0xCu);
        }

      }
      IMSanitizedSessionIdentifierForIMExtensionPayloadUserSessionIdentifierKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[IMChat chatItems](self, "chatItems");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v32)
      {
        v31 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v35 != v31)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v13;
              objc_msgSend(v14, "message");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "payloadData");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v10;
              objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v28, v16, &v33);
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = v33;

              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = v18;
                  _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Finished unarchivedObjectOfClasses for payloadData. Error: [%@]", buf, 0xCu);
                }

              }
              IMSanitizedSessionIdentifierForIMExtensionPayloadUserSessionIdentifierKey();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20)
                v22 = v30 != 0;
              else
                v22 = 0;
              if (v22)
              {
                objc_msgSend(v20, "UUIDString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "UUIDString");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v23, "isEqualToString:", v24);

                if (v25)
                {
                  objc_msgSend(v15, "guid");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "_associatedMessageGUID:", v26);

                  objc_msgSend(v27, "_associatedMessageType:", 2);
                  v9 = (void *)v17;
                  v10 = v18;
                  goto LABEL_27;
                }
              }

              v9 = (void *)v17;
              v10 = v18;
            }
          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v32)
            continue;
          break;
        }
      }
LABEL_27:

      v6 = 0;
    }

  }
}

- (BOOL)_updateJoinStateWithMessageIfNeeded:(id)a3
{
  id v4;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *messagesPendingJoin;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  IMChat *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMChat joinState](self, "joinState") == 3 || -[IMChat joinState](self, "joinState") == 4)
  {
    v5 = 1;
  }
  else
  {
    if (!self->_messagesPendingJoin)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      messagesPendingJoin = self->_messagesPendingJoin;
      self->_messagesPendingJoin = v6;

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMChat account](self, "account");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = v4;
        v13 = 2112;
        v14 = v9;
        v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Adding pending message message %@ for account: %@ (%@)", (uint8_t *)&v11, 0x20u);

      }
    }
    -[NSMutableArray addObject:](self->_messagesPendingJoin, "addObject:", v4);
    -[IMChat join](self, "join");
    v5 = 0;
  }

  return v5;
}

- (void)_updatePayloadForMessageIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "balloonBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375F8]) & 1) != 0)
  {
    objc_msgSend(v4, "_imMessageItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getCMMState");

    if (!v7)
    {
      objc_msgSend(v4, "payloadData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "payloadData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      IMSharedHelperPayloadFromCombinedPluginPayloadData();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;

      if (v10)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "fileTransferGUIDs");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v4, "payloadData");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v25 = v13;
            v26 = 2112;
            v27 = v16;
            v28 = 2112;
            v29 = v17;
            _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Before splitting up rich links into file for msg guid %@ message payloadad data length %@, original payload data lenght %@", buf, 0x20u);

          }
        }
        objc_msgSend(v4, "setPayloadData:", v10);
        -[IMChat _updateFileAttachmentGUIDsForMessageIfNeeded:withPayloadAttachments:](self, "_updateFileAttachmentGUIDsForMessageIfNeeded:withPayloadAttachments:", v4, v11);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "fileTransferGUIDs");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v4, "payloadData");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v25 = v19;
            v26 = 2112;
            v27 = v22;
            v28 = 2112;
            v29 = v23;
            _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "After splitting up rich links into file for msg guid %@ message payloadad data length %@, original payload data lenght %@", buf, 0x20u);

          }
        }
      }

    }
  }
  else
  {

  }
}

- (void)_updateFileAttachmentGUIDsForMessageIfNeeded:(id)a3 withPayloadAttachments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    objc_msgSend(v8, "guidsForStoredAttachmentPayloadData:messageGUID:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v11, "addObjectsFromArray:", v10);
    v20 = v11;
    objc_msgSend(v6, "_updateFileTransferGUIDs:", v11);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
          +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat account](self, "account");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "assignTransfer:toMessage:account:", v17, v6, v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    v7 = v21;
  }

}

- (void)_refreshServiceForSendingIfNeededWithMessage:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "wasDowngraded") && (objc_msgSend(v4, "isSOS") & 1) == 0)
    -[IMChat refreshServiceForSending](self, "refreshServiceForSending");

}

- (void)_fixItemForSendingMessageTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMChat lastIncomingMessage](self, "lastIncomingMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat lastSentMessageDate](self, "lastSentMessageDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "time");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      objc_msgSend(v9, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      objc_msgSend(v14, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v11;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "itemToUpdateTime: %@ lastIncomingMessage time: %@ lastSentMessageDate: %@", (uint8_t *)&v30, 0x20u);

    }
  }
  if (objc_msgSend(v6, "compare:", v7) == 1)
    v16 = v6;
  else
    v16 = v7;
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;
  objc_msgSend(v4, "time");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v21 = v20 - v18 < 60.0;

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v18 + 0.100000001);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v22, "timeIntervalSinceReferenceDate");
        objc_msgSend(v24, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "time");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        objc_msgSend(v26, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412802;
        v31 = v25;
        v32 = 2112;
        v33 = v22;
        v34 = 2112;
        v35 = v28;
        _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "The last recent message was received less than a minute ago, going to use time interval: %@ date: %@ clientSendTime: %@", (uint8_t *)&v30, 0x20u);

      }
    }
    objc_msgSend(v4, "time");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClientSendTime:", v29);

    objc_msgSend(v4, "setTime:", v22);
  }

}

- (void)sendMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMChat account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat sendMessage:onAccount:](self, "sendMessage:onAccount:", v4, v5);

}

- (void)sendMessage:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bestAccountForService:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[IMChat sendMessage:onAccount:](self, "sendMessage:onAccount:", v7, v9);
}

- (void)sendMessage:(id)a3 onAccount:(id)a4
{
  __CFString *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  __CFString *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  __CFString *v56;
  uint8_t buf[4];
  const __CFString *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v50 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Client request to send message: %@", buf, 0xCu);
    }

  }
  kdebug_trace();
  if (-[__CFString isFinished](v5, "isFinished"))
  {
    objc_msgSend(v50, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == v8;

    if (v9)
    {
      -[__CFString fileTransferGUIDs](v5, "fileTransferGUIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count") == 0;

      if (!v11)
      {
        -[__CFString guid](v5, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _signpostSendFileMessage();

      }
      -[__CFString guid](v5, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString fileTransferGUIDs](v5, "fileTransferGUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "count");
      _signpostSendMessage();

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = (void *)MEMORY[0x1E0D3AB50];
      -[__CFString guid](v5, "guid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendSignal:toChannel:withUniqueStringID:withPayload:", CFSTR("MessageSent"), CFSTR("Messages"), v16, 0);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v48, "length"))
  {
    v61 = *MEMORY[0x1E0D38408];
    v62[0] = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v19, "trackEvent:withDictionary:", *MEMORY[0x1E0D386F8], v20);

  }
  if ((-[__CFString isFinished](v5, "isFinished") & 1) == 0
    && (-[__CFString isLocatingMessage](v5, "isLocatingMessage") & 1) == 0)
  {
    v34 = -[__CFString isAudioMessage](v5, "isAudioMessage");
    v22 = CFSTR("__kIMChatComposeTyping");
    if (v34)
      v22 = CFSTR("__kIMChatComposeRecording");
    goto LABEL_20;
  }
  if (-[__CFString isEmpty](v5, "isEmpty") && -[__CFString isFinished](v5, "isFinished"))
  {
    v21 = -[__CFString isAudioMessage](v5, "isAudioMessage");
    v22 = CFSTR("__kIMChatComposeRecording");
    if (!v21)
      v22 = 0;
LABEL_20:
    v23 = v22;
    -[__CFString guid](v5, "guid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat _setLocalUserIsComposing:suppliedGUID:](self, "_setLocalUserIsComposing:suppliedGUID:", v23, v24);
    goto LABEL_55;
  }
  if (-[IMChat isStewieChat](self, "isStewieChat")
    && (-[__CFString text](v5, "text"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v25, "string"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = (unint64_t)objc_msgSend(v26, "lengthOfBytesUsingEncoding:", 4) > 0xA0,
        v26,
        v25,
        v27))
  {
    -[__CFString messagesSeparatedByByteLength:](v5, "messagesSeparatedByByteLength:", 160);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[__CFString hasDataDetectorResults](v5, "hasDataDetectorResults")
         && (-[__CFString isSOS](v5, "isSOS") & 1) == 0)
  {
    -[__CFString messagesBySeparatingRichLinks](v5, "messagesBySeparatingRichLinks");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = -[__CFString hasDataDetectorResults](v5, "hasDataDetectorResults");
        objc_msgSend(v50, "service");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        v33 = CFSTR("NO");
        if (v30)
          v33 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v58 = v33;
        v59 = 2112;
        v60 = v31;
        _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "Not splitting message rich links, has data detected results (%@) and service %@", buf, 0x16u);

      }
    }
    v56 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v23 = v28;
  v35 = -[__CFString countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v23);
        v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        -[__CFString notificationIDSTokenURI](v5, "notificationIDSTokenURI");
        v39 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject length](v39, "length"))
          goto LABEL_47;
        -[__CFString notificationIDSTokenURI](v5, "notificationIDSTokenURI");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "notificationIDSTokenURI");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqualToString:", v41);

        if ((v42 & 1) == 0)
        {
          -[__CFString notificationIDSTokenURI](v5, "notificationIDSTokenURI");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setNotificationIDSTokenURI:", v43);

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v38, "notificationIDSTokenURI");
              v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v58 = v44;
              _os_log_impl(&dword_1A1FF4000, v39, OS_LOG_TYPE_INFO, "New immessage does not have notificationIDSTokenURI, it is now set to %@ before sending.", buf, 0xCu);

            }
LABEL_47:

          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            -[__CFString guid](v5, "guid");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v58 = v5;
            v59 = 2112;
            v60 = (uint64_t)v46;
            _os_log_impl(&dword_1A1FF4000, v45, OS_LOG_TYPE_INFO, "Add sending message: %@ guid: %@", buf, 0x16u);

          }
        }
        -[IMChat _sendMessage:withAccount:adjustingSender:shouldQueue:](self, "_sendMessage:withAccount:adjustingSender:shouldQueue:", v38, v50, 1, 0);
      }
      v35 = -[__CFString countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v35);
  }
  v24 = v23;
LABEL_55:

  if ((sub_1A20F18A8() & 1) == 0)
  {
    +[IMBalloonPluginAttributionController sharedInstance](IMBalloonPluginAttributionController, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "startExpiryTimer");

  }
}

- (void)sendCurrentLocationMessage
{
  void *v3;
  id v4;

  +[IMLocationManagerUtils sharedInstance](IMLocationManagerUtils, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[IMLocationManager sharedInstance](IMLocationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendCurrentLocationMessageWithChat:withLocationManager:withSourceApplicationIdentifier:foregroundAssertionForBundleIdentifier:completion:", self, v3, 0, 0, 0);

}

- (void)retractMessagePart:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "index");
  v7 = objc_msgSend(v4, "hasSubject");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isScheduledMessagesCoreEnabled")
    && objc_msgSend(v5, "scheduleType") == 2
    && objc_msgSend(v5, "scheduleState") == 2;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v11;
      v17 = 2048;
      v18 = objc_msgSend(v5, "scheduleType");
      v19 = 2048;
      v20 = objc_msgSend(v5, "scheduleState");
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Retracting/Cancelling message with guid: %@, scheduleType: %lu, scheduleState %lu", (uint8_t *)&v15, 0x20u);

    }
  }
  if (v9)
  {
    -[IMChat cancelScheduledMessageItem:atPartIndex:shouldRetractSubject:](self, "cancelScheduledMessageItem:atPartIndex:shouldRetractSubject:", v5, v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39918], "editedMessageItemWithOriginalMessageItem:retractedPartIndex:shouldRetractSubject:", v5, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat chatRegistry](self, "chatRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_chat:sendEditedMessageItem:previousMessageItem:partIndex:editType:backwardCompatabilityText:", self, v12, v5, v6, 2, 0);

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackEvent:", *MEMORY[0x1E0D38AE8]);

  }
}

- (void)retractScheduledMessagePartIndexes:(id)a3 fromChatItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "messageItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hasSubject");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138413058;
      v18 = v6;
      v19 = 2112;
      v20 = v11;
      v21 = 2048;
      v22 = objc_msgSend(v8, "scheduleType");
      v23 = 2048;
      v24 = objc_msgSend(v8, "scheduleState");
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Retracting/Cancelling scheduled message part indexes (%@) from message with guid: %@, scheduleType: %lu, scheduleState %lu", (uint8_t *)&v17, 0x2Au);

    }
  }
  if (objc_msgSend(v8, "partCount") == 1)
  {
    -[IMChat participantsWithState:](self, "participantsWithState:", 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "__imArrayByApplyingBlock:", &unk_1E47210F8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat cancelScheduledMessageWithGUID:destinations:cancelType:](self, "cancelScheduledMessageWithGUID:destinations:cancelType:", v14, v15, 1);
  }
  else
  {
    objc_msgSend(v8, "failedRetractPartIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v16, "mutableCopy");

    if (v13)
    {
      objc_msgSend(v13, "removeIndexes:", v6);
      objc_msgSend(v8, "setFailedRetractPartIndexes:", v13);
    }
    objc_msgSend(MEMORY[0x1E0D39918], "editedMessageItemWithOriginalMessageItem:retractedPartIndexes:shouldRetractSubject:", v8, v6, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat chatRegistry](self, "chatRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_chat:editScheduledMessageItem:previousMessageItem:retractingPartIndexes:", self, v14, v8, v6);
  }

}

- (void)editMessageItem:(id)a3 atPartIndex:(int64_t)a4 withNewPartText:(id)a5 backwardCompatabilityText:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isScheduledMessagesCoreEnabled")
     && objc_msgSend(v10, "scheduleType") == 2
     && objc_msgSend(v10, "scheduleState") == 2;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "guid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v16;
      v22 = 2048;
      v23 = objc_msgSend(v10, "scheduleType");
      v24 = 2048;
      v25 = objc_msgSend(v10, "scheduleState");
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Editing Message with guid: %@, scheduleType: %lu, scheduleState: %lu", (uint8_t *)&v20, 0x20u);

    }
  }
  if (v14)
  {
    -[IMChat editScheduledMessageItem:atPartIndex:withNewPartText:](self, "editScheduledMessageItem:atPartIndex:withNewPartText:", v10, a4, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39918], "editedMessageItemWithOriginalMessageItem:editedPartIndex:newPartText:", v10, a4, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat chatRegistry](self, "chatRegistry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_chat:sendEditedMessageItem:previousMessageItem:partIndex:editType:backwardCompatabilityText:", self, v17, v10, a4, 1, v12);

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trackEvent:", *MEMORY[0x1E0D38478]);

  }
}

- (void)resendEditedMessageItem:(id)a3 forPartIndex:(int64_t)a4 withBackwardCompatabilityText:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[IMChat chatRegistry](self, "chatRegistry");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_chat:resendEditedMessageItem:partIndex:withBackwardCompatabilityText:", self, v9, a4, v8);

}

- (void)beginShowingEditHistoryForChatItemGUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IMChat showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[IMChat setShowingEditHistoryForChatItemGUIDs:](self, "setShowingEditHistoryForChatItemGUIDs:", v6);

  }
  -[IMChat showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  -[IMChat inlineReplyController](self, "inlineReplyController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsUpdateChatItems");

  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Begin showing edit history"), &unk_1E4721118);
}

- (void)endShowingEditHistoryForChatItemGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMChat showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[IMChat inlineReplyController](self, "inlineReplyController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdateChatItems");

  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("End showing edit history"), &unk_1E471B9C0);
}

- (void)endShowingEditHistoryForAllChatItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[IMChat showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[IMChat showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[IMChat inlineReplyController](self, "inlineReplyController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsUpdateChatItems");

    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("End showing edit history for all items"), &unk_1E4721138);
  }
}

- (BOOL)isShowingEditHistoryForChatItemGUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMChat showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isShowingEditHistoryForAnyChatItem
{
  void *v2;
  BOOL v3;

  -[IMChat showingEditHistoryForChatItemGUIDs](self, "showingEditHistoryForChatItemGUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)repositionSticker:(id)a3 associatedChatItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Client request to reposition sticker: %@", (uint8_t *)&v16, 0xCu);
    }

  }
  objc_msgSend(v6, "_imMessageItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stripFZIDPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMItemsController _itemForGUID:](self, "_itemForGUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fileTransferGUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFileTransferGUIDs:", v13);

  objc_msgSend(v12, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBody:", v14);

  -[IMChat chatRegistry](self, "chatRegistry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_chat:repositionSticker:", self, v9);

}

- (id)messagesForScheduledMessageSectionWithTranscriptItem:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Client requested messages for scheduled message section", (uint8_t *)&v23, 2u);
    }

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMChat chatItems](self, "chatItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = v8 + 1;
  do
  {
    if ((uint64_t)(v9 - 2) < 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v23 = 138412290;
          v24 = v4;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Couldn't find requested transcriptItem: %@ in chatItems", (uint8_t *)&v23, 0xCu);
        }

      }
      v20 = v6;
      goto LABEL_21;
    }
    -[IMChat chatItems](self, "chatItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9 - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = objc_msgSend(v11, "isEqual:", v4);
    --v9;
  }
  while (!(_DWORD)v10);
  -[IMChat chatItems](self, "chatItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 < objc_msgSend(v12, "count");

  if (v13)
  {
    while (1)
    {
      -[IMChat chatItems](self, "chatItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "messageItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

      }
      -[IMChat chatItems](self, "chatItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (++v9 >= v18)
        goto LABEL_20;
    }

  }
LABEL_20:
  v20 = (id)objc_msgSend(v6, "copy");
LABEL_21:
  v21 = v20;

  return v21;
}

- (void)sendPendingSatelliteMessages
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  IMChat *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Client request to send pending satellite messages", buf, 2u);
    }

  }
  +[IMService iMessageLiteService](IMService, "iMessageLiteService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat _targetToService:newComposition:](self, "_targetToService:newComposition:", v4, 0);
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[IMItemsController _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  obj = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          v12 = objc_msgSend(v11, "isPendingSatelliteSend");
          if (v12)
          {
            objc_msgSend(v27, "insertObject:atIndex:", v11, 0);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v11, "guid");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v44 = v14;
                _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, " => Enqueuing message for satellite send %@", buf, 0xCu);

              }
            }
          }
          else if ((v7 & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v11, "guid");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v44 = v16;
                _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, " => Reached message without pending flag %@", buf, 0xCu);

              }
            }

            goto LABEL_26;
          }

          v7 = v12;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_26:

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1A20C7030;
  v34[3] = &unk_1E471F668;
  v28 = v27;
  v35 = v28;
  v36 = self;
  v17 = v26;
  v37 = v17;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Sending via satellite"), v34);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "guid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v44 = v24;
            _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, " => Dispatching message for satellite send %@", buf, 0xCu);

          }
        }
        objc_msgSend(v22, "message");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChat sendMessage:onService:](self, "sendMessage:onService:", v25, v4);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v19);
  }

}

- (void)fetchIncomingPendingMessagesOverSatellite
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  -[IMChat lastSatelliteFetchDate](self, "lastSatelliteFetchDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat lastSatelliteFetchDate](self, "lastSatelliteFetchDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  if (v8 >= 180.0)
  {
LABEL_7:
    if (-[IMChat pendingIncomingSatelliteMessageCount](self, "pendingIncomingSatelliteMessageCount"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat setLastSatelliteFetchDate:](self, "setLastSatelliteFetchDate:", v9);

      -[IMChat chatRegistry](self, "chatRegistry");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_chat_fetchIncomingPendingMessagesOverSatellite:", self);

    }
  }
}

- (void)sendGroupPhotoUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  IMChat *v9;
  NSObject *v10;
  NSObject *v11;
  IMChat *v12;
  NSObject *v13;
  void *v14;
  int v15;
  IMChat *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37788]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMAreObjectsLogicallySame();
  v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v9 = (IMChat *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v9;
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Not updating group photo guid for chatGuid %@ from %@ to %@", (uint8_t *)&v15, 0x20u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = self;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, " => Chat: %@", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v12 = (IMChat *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v12;
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Updating group photo guid for chatGuid %@ from %@ to %@", (uint8_t *)&v15, 0x20u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = self;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, " => Chat: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_chat:sendGroupPhotoUpdate:", self, v4);

  }
}

- (void)resendGroupPhoto
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37788]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = 138412290;
        v7 = v3;
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Resending group photo: %@", (uint8_t *)&v6, 0xCu);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject _chat:sendGroupPhotoUpdate:](v5, "_chat:sendGroupPhotoUpdate:", self, v3);
  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1A2197860();
  }

}

- (void)retryGroupPhotoUploadIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37788]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferForGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "transferState") == 7 && objc_msgSend(v5, "error") == 27)
  {
    -[IMChat chatRegistry](self, "chatRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_chat:retryGroupPhotoUpload:", self, v3);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Not retrying group photo upload for transfer %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (BOOL)localUserIsTyping
{
  return self->_typingGUID != 0;
}

- (BOOL)localUserIsRecording
{
  return -[NSString isEqualToString:](self->_localUserIsComposing, "isEqualToString:", CFSTR("__kIMChatComposeRecording"));
}

- (NSString)localTypingMessageGUID
{
  return self->_typingGUID;
}

- (BOOL)_shouldSendCancelTypingIndicator
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  int v10;
  double v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[IMChat latestTypingIndicatorTimeInterval](self, "latestTypingIndicatorTimeInterval");
      v10 = 134218240;
      v11 = v5;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "currentTimeInterval %f, latestTypingIndicatorTimeInterval %f", (uint8_t *)&v10, 0x16u);
    }

  }
  -[IMChat latestTypingIndicatorTimeInterval](self, "latestTypingIndicatorTimeInterval");
  return v5 - v8 > 3.0;
}

- (unint64_t)_flagsForTypingIndicatorMessage:(BOOL)a3
{
  if (a3)
    return 2097164;
  else
    return 12;
}

- (unint64_t)_flagsForCancelTypingIndicatorMessage
{
  return 13;
}

- (BOOL)_chatStyleSupportsTypingAndCancelTypingIndicators
{
  return -[IMChat chatStyle](self, "chatStyle") == 45;
}

- (void)_setLocalUserIsComposing:(id)a3 suppliedGUID:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__setLocalUserIsComposing_suppliedGUID_typingIndicatorData_);
}

- (void)_setLocalUserIsComposing:(id)a3 suppliedGUID:(id)a4 typingIndicatorData:(id)a5
{
  NSString *v9;
  id v10;
  id v11;
  NSString *localUserIsComposing;
  char v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSString *v22;
  NSString *typingGUID;
  uint64_t v24;
  NSString *v25;
  NSObject *v26;
  IMMessage *v27;
  NSObject *v28;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  IMChat *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = (NSString *)a3;
  v10 = a4;
  v11 = a5;
  localUserIsComposing = self->_localUserIsComposing;
  if (localUserIsComposing == v9)
  {
    if (!v9 || -[NSString isEqualToString:](v9, "isEqualToString:", v9))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSince1970");
      -[IMChat setLatestTypingIndicatorTimeInterval:](self, "setLatestTypingIndicatorTimeInterval:");

      goto LABEL_49;
    }
    goto LABEL_8;
  }
  if (v9)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  if (self->_typingGUID)
  {
    v13 = 1;
LABEL_9:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v31 = (uint64_t)v9;
        v32 = 2112;
        v33 = self;
        v34 = 2112;
        v35 = v10;
        _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_DEBUG, "Setting local user is composing with %@ for chat: %@   supplied guid: %@", buf, 0x20u);
      }

    }
    v16 = IMOSLoggingEnabled();
    if ((v13 & 1) != 0)
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v31 = 0x4008000000000000;
          _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Dispatching cancel typing indicator after %f seconds", buf, 0xCu);
        }

      }
      v18 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A20C7EF8;
      block[3] = &unk_1E471E348;
      block[4] = self;
      dispatch_after(v18, MEMORY[0x1E0C80D38], block);
    }
    else
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          -[IMChat latestTypingIndicatorTimeInterval](self, "latestTypingIndicatorTimeInterval");
          *(_DWORD *)buf = 134217984;
          v31 = v20;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Setting typing indicator time to %f", buf, 0xCu);
        }

      }
      if (self->_typingGUID && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = (uint64_t)v9;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, " => Updating existing composeing message to recording message: %@", buf, 0xCu);
        }

      }
      if (v10)
      {
        v22 = (NSString *)v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      typingGUID = self->_typingGUID;
      self->_typingGUID = v22;

      objc_storeStrong((id *)&self->_localUserIsComposing, a3);
      if (-[IMChat _chatStyleSupportsTypingAndCancelTypingIndicators](self, "_chatStyleSupportsTypingAndCancelTypingIndicators"))
      {
        v24 = -[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("__kIMChatComposeRecording"));
        if (-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("__kIMChatComposeTyping"))
          || -[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("__kIMChatComposeTyping")))
        {
          v25 = 0;
        }
        else
        {
          v25 = v9;
        }
        v27 = -[IMMessage initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:]([IMMessage alloc], "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:", 0, 0, 0, 0, 0, -[IMChat _flagsForTypingIndicatorMessage:](self, "_flagsForTypingIndicatorMessage:", v24), 0, self->_typingGUID, 0, v25, 0, 0, 0);
        if (-[IMChat chatStyle](self, "chatStyle") == 45)
          -[IMMessage setCustomTypingIndicatorIcon:](v27, "setCustomTypingIndicatorIcon:", v11);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v31 = (uint64_t)v27;
            _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, " => Sending start typing message: %@", buf, 0xCu);
          }

        }
        -[IMChat _sendMessage:adjustingSender:shouldQueue:](self, "_sendMessage:adjustingSender:shouldQueue:", v27, 1, 0);

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, " => Not sending start typing message, the chat style does not support it", buf, 2u);
        }

      }
    }
    goto LABEL_49;
  }
  if (localUserIsComposing)
  {
    self->_localUserIsComposing = 0;

  }
LABEL_49:

}

- (void)forceCancelTypingIndicator
{
  IMMessage *v3;
  NSObject *v4;
  NSObject *v5;
  NSString *typingGUID;
  NSString *localUserIsComposing;
  uint8_t buf[4];
  IMMessage *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_localUserIsComposing && self->_typingGUID)
  {
    if (-[IMChat _chatStyleSupportsTypingAndCancelTypingIndicators](self, "_chatStyleSupportsTypingAndCancelTypingIndicators"))
    {
      v3 = -[IMMessage initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:]([IMMessage alloc], "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:", 0, 0, 0, 0, 0, -[IMChat _flagsForCancelTypingIndicatorMessage](self, "_flagsForCancelTypingIndicatorMessage"), 0, self->_typingGUID, 0, 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v9 = v3;
          _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, " => Sending forced cancel typing message:: %@", buf, 0xCu);
        }

      }
      -[IMChat _sendMessage:adjustingSender:shouldQueue:](self, "_sendMessage:adjustingSender:shouldQueue:", v3, 1, 0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, " => Not sending forced cancel typing message, the chat style does not support it", buf, 2u);
      }

    }
    typingGUID = self->_typingGUID;
    self->_typingGUID = 0;

    localUserIsComposing = self->_localUserIsComposing;
    self->_localUserIsComposing = 0;

  }
}

- (void)setLocalUserIsComposing:(id)a3 typingIndicatorData:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__setLocalUserIsComposing_suppliedGUID_typingIndicatorData_);
}

- (void)setLocalUserIsComposing:(id)a3
{
  -[IMChat _setLocalUserIsComposing:suppliedGUID:](self, "_setLocalUserIsComposing:suppliedGUID:", a3, 0);
}

- (void)setLocalUserIsTyping:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setLocalUserIsComposing_);
}

- (void)setLocalUserIsRecording:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setLocalUserIsComposing_);
}

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMChat account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCapability:", 1024);

  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "fileTransferGUIDs", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "transferForGUID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && !-[IMChat canSendTransfer:](self, "canSendTransfer:", v14))
          {

            v15 = 0;
            goto LABEL_14;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_14:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)canSendTransfer:(id)a3
{
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  -[IMChat account](self, "account", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasCapability:", 32);

  if (!v5)
    return 0;
  if (-[IMChat chatStyle](self, "chatStyle") == 45)
    return 1;
  -[IMChat account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "supportsGroupAttachments");

  return v6;
}

- (BOOL)canSendCurrentLocationMessage
{
  return self->_currentLocationGUID == 0;
}

- (BOOL)authorizationToSendCurrentLocationMessageDetermined
{
  void *v2;
  char v3;

  +[IMLocationManager sharedInstance](IMLocationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationAuthorizationDetermined");

  return v3;
}

- (BOOL)authorizedToSendCurrentLocationMessage
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  +[IMLocationManager sharedInstance](IMLocationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationAuthorizationDetermined");

  if (v3)
  {
    +[IMLocationManager sharedInstance](IMLocationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "locationAuthorizationDenied") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)authorizationToSendCurrentLocationMessageDenied
{
  void *v2;
  char v3;

  +[IMLocationManager sharedInstance](IMLocationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationAuthorizationDenied");

  return v3;
}

- (void)updateMessage:(id)a3 withIndexesOfDeletedItems:(id)a4 withIndexToRangeMapOfDeletedItems:(id)a5 deleteDate:(id)a6
{
  IMChat *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  IMChat *v21;
  __int16 v22;
  IMChat *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = (IMChat *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_DEBUG, "chat: %@   message: %@", (uint8_t *)&v20, 0x16u);
    }

  }
  v15 = IMOSLoggingEnabled();
  if (v10)
  {
    if (v15)
    {
      OSLogHandleForIMEventCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v20 = 138412546;
        v21 = v10;
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Sending update message %@ to daemon (Chat: %@)", (uint8_t *)&v20, 0x16u);
      }

    }
    -[IMChat daemonController](self, "daemonController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat _imMessageItem](v10, "_imMessageItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateMessage:withIndexesOfDeletedItems:withIndexToRangeMapOfDeletedItems:deleteDate:", v18, v11, v12, v13);

  }
  else if (v15)
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = self;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Asked to update empty message in chat: %@", (uint8_t *)&v20, 0xCu);
    }

  }
}

- (void)__clearReadMessageCache
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Clearing read message cache", v5, 2u);
    }

  }
  -[IMChat chatRegistry](self, "chatRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateUnreadCountForChat:", self);

}

- (void)_setTimerForReadMessageCache
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___clearReadMessageCache, 0);
  -[IMChat performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___clearReadMessageCache, 0, 3.0);
}

- (void)markMessageAsRead:(id)a3
{
  id v4;

  if (a3)
  {
    IMSingleObjectArray();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[IMChat markMessagesAsRead:](self, "markMessagesAsRead:", v4);

  }
}

- (void)markMessagesAsRead:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMChat *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "guid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMItemsController _itemForGUID:](self, "_itemForGUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v12, "isRead") & 1) == 0 && (objc_msgSend(v12, "isFromMe") & 1) == 0)
            objc_msgSend(v5, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    -[IMChat chatRegistry](self, "chatRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_chat:sendReadReceiptForMessages:", self, v5);

    -[IMChat _setTimerForReadMessageCache](self, "_setTimerForReadMessageCache");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A20C8D24;
    v15[3] = &unk_1E471E7C8;
    v16 = v5;
    v17 = self;
    v14 = v5;
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Mark as read"), v15);

  }
}

- (void)markRepliedForMessageGUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  IMChat *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = sub_1A20C8EE0;
  v10 = &unk_1E471E7C8;
  v11 = self;
  v12 = v4;
  v5 = v4;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Suggested replies selected"), &v7);
  -[IMChat chatRegistry](self, "chatRegistry", v7, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_chat_markRepliedForMessageGUID:", v5);

}

- (void)replaceItemWhenReplied:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  IMChat *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[IMItemsController _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v6)
  {
    v8 = v5;
    goto LABEL_18;
  }
  v7 = v6;
  v21 = self;
  v8 = 0;
  v9 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v11, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqualToString:", v12))
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          continue;
        v12 = v8;
        v8 = v11;
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  }
  while (v7);

  if (v8)
  {
    objc_msgSend(v8, "body");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v14, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v14, "length") - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D37890]);

      if (v17)
      {
        v18 = (void *)objc_msgSend(v8, "copyAsReplied");
        objc_msgSend(v18, "_setMessageID:", objc_msgSend(v8, "messageID"));
        v19 = (void *)objc_msgSend(v8, "copyAsReplied");
        v26 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChat _replaceItems:](v21, "_replaceItems:", v20);

      }
    }

LABEL_18:
  }

}

- (void)markLastMessageAsUnread
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (-[IMChat unreadMessageCount](self, "unreadMessageCount"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "We already have unread messages, ignoring request", buf, 2u);
      }

    }
  }
  else
  {
    -[IMChat chatRegistry](self, "chatRegistry");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_chat_markLastMessageAsUnread:", self);

  }
}

- (void)markAllMessagesAsRead
{
  NSObject *v3;
  _BOOL4 v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  IMChat *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Request to mark all messages as read: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  -[IMChat markKTFailureSeen](self, "markKTFailureSeen");
  v4 = -[IMChat unreadMessageCount](self, "unreadMessageCount") == 0;
  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Chat has no unread messages, tell the daemon that we tried to mark it as read since this could affect message suppression", (uint8_t *)&v10, 2u);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_chat_sendReadReceiptForAllMessages:", self);

  }
  else
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Chat has unread messages", (uint8_t *)&v10, 2u);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_chat_sendReadReceiptForAllMessages:", self);

    -[IMChat _clearUnreadCount](self, "_clearUnreadCount");
    -[IMChat _setTimerForReadMessageCache](self, "_setTimerForReadMessageCache");
  }
}

- (void)recoverFromJunk
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (-[IMChat isFiltered](self, "isFiltered") == 2)
  {
    -[IMChat setRecovered:](self, "setRecovered:", 1);
    -[IMChat updateIsFiltered:](self, "updateIsFiltered:", 1);
    -[IMChat _reloadChatItemsForJunkStateChange](self, "_reloadChatItemsForJunkStateChange");
    -[IMChat chatRegistry](self, "chatRegistry");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_chat_recoverFromJunk:", self);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Chat is not a junk chat, not recovering", buf, 2u);
    }

  }
}

- (void)resortMessages
{
  MEMORY[0x1E0DE7D20](self, sel__resortItems);
}

- (BOOL)_isDuplicate:(id)a3
{
  return 0;
}

- (void)setValue:(id)a3 forChatProperty:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSMutableDictionary *chatProperties;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  id v20;
  BOOL v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  IMChat *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v26 = 138412802;
        v27 = v6;
        v28 = 2112;
        v29 = v7;
        v30 = 2112;
        v31 = self;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Attempt to set value: %@ for chatProperty: %@ on chat: %@", (uint8_t *)&v26, 0x20u);
      }

    }
    if (qword_1ECF12370 != -1)
      dispatch_once(&qword_1ECF12370, &unk_1E4721178);
    if ((objc_msgSend((id)qword_1ECF12378, "containsObject:", v7) & 1) != 0)
    {
      -[IMChat valueForChatProperty:](self, "valueForChatProperty:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if ((id)v9 == v6 || v6 && v9 && objc_msgSend(v6, "isEqual:", v9))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Attempt to update a chat property to the same value.", (uint8_t *)&v26, 2u);
          }

        }
      }
      else
      {
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("wasDetectedAsSMSSpam")) & 1) != 0
          || objc_msgSend(v7, "isEqualToString:", CFSTR("SMSCategory")))
        {
          -[IMChat setWasDetectedAsSMSSpamCacheStatus:](self, "setWasDetectedAsSMSSpamCacheStatus:", 0);
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v26 = 138412546;
            v27 = v7;
            v28 = 2112;
            v29 = v6;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Setting chatProperty: %@ to value: %@", (uint8_t *)&v26, 0x16u);
          }

        }
        chatProperties = self->_chatProperties;
        if (!chatProperties)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v17 = self->_chatProperties;
          self->_chatProperties = Mutable;

          chatProperties = self->_chatProperties;
        }
        if ((-[NSMutableDictionary __imIsMutable](chatProperties, "__imIsMutable") & 1) == 0)
        {
          v18 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_chatProperties, "mutableCopy");
          if (!v18)
            v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v19 = self->_chatProperties;
          self->_chatProperties = v18;

        }
        if (!v6
          || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
              v20 = (id)objc_claimAutoreleasedReturnValue(),
              v21 = v20 == v6,
              v20,
              v21))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_chatProperties, "removeObjectForKey:", v7);
        }
        else
        {
          v22 = self->_chatProperties;
          v23 = (void *)objc_msgSend(v6, "copy");
          -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v23, v7);

        }
        -[IMChat chatRegistry](self, "chatRegistry");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_chat:setValue:forChatProperty:", self, v6, v7);

        if (!-[NSMutableDictionary count](self->_chatProperties, "count"))
        {
          v25 = self->_chatProperties;
          self->_chatProperties = 0;

        }
        -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatPropertiesChangedNotification"), 0);
      }

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v7;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Attempt to modify chat property: %@ which is not in the allowlist", (uint8_t *)&v26, 0xCu);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1A219788C();

  }
}

- (void)consumeSummaryIfNeeded
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    v3 = *MEMORY[0x1E0D37740];
    -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37740]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = *MEMORY[0x1E0D37738];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D37738]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      if ((v7 & 1) == 0)
      {
        v8 = (void *)objc_msgSend(v4, "mutableCopy");
        objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v5);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            -[IMChat guid](self, "guid");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = 138412290;
            v13 = v10;
            _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Marking summary as consumed on chat with GUID %@", (uint8_t *)&v12, 0xCu);

          }
        }
        v11 = (void *)objc_msgSend(v8, "copy");
        -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v11, v3);

      }
    }

  }
}

- (void)userToggledReadReceiptSwitch:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSString *guid;
  NSMutableDictionary *chatProperties;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  _BYTE v38[24];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      guid = self->_guid;
      chatProperties = self->_chatProperties;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v38 = v3;
      *(_WORD *)&v38[4] = 2112;
      *(_QWORD *)&v38[6] = guid;
      *(_WORD *)&v38[14] = 2112;
      *(_QWORD *)&v38[16] = chatProperties;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "User toggled the read receipt setting to: %d for chat: %@ with properties prior to updating: %@", buf, 0x1Cu);
    }

  }
  v8 = *MEMORY[0x1E0D37840];
  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D37840]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v9;
  if (v9)
    v10 = objc_msgSend(v9, "integerValue") + 1;
  else
    v10 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v38 = v34;
      *(_WORD *)&v38[8] = 2112;
      *(_QWORD *)&v38[10] = v33;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Setting read receipt versionID to: %@ from: %@", buf, 0x16u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v11;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Setting read receipt value to: %@", buf, 0xCu);
    }

  }
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v34, v8);
  v14 = *MEMORY[0x1E0D37770];
  -[IMChat setValue:forChatProperty:](self, "setValue:forChatProperty:", v11, *MEMORY[0x1E0D37770]);
  v35[0] = v8;
  v35[1] = v14;
  v36[0] = v34;
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v15;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Sending generic notification to update chat properties for properties: %@", buf, 0xCu);
    }

  }
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount strippedLogin](self->_account, "strippedLogin");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bestOperationalAccountForService:withLogin:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    goto LABEL_38;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      -[IMAccount strippedLogin](self->_account, "strippedLogin");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v22;
      _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Could not find operational account with login %@, looking for next best operational account.", buf, 0xCu);

    }
  }
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bestOperationalAccountForService:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
LABEL_38:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v38 = v20;
        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "Found account for sending: %@", buf, 0xCu);
      }

    }
    -[IMChat daemonController](self, "daemonController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 60000);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount loginIMHandle](self->_account, "loginIMHandle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uniqueID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = self->_style;
    objc_msgSend(v26, "sendCommand:withProperties:toPerson:account:toChatID:identifier:style:", v27, v15, v29, v30, self->_guid, self->_identifier, v32);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Could not find operational account to use for syncing chat properties.", buf, 2u);
    }

  }
}

- (id)allPropertiesOfParticipant:(id)a3
{
  NSMutableDictionary *participantProperties;
  void *v4;
  void *v5;

  participantProperties = self->_participantProperties;
  objc_msgSend(a3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](participantProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)valueForProperty:(id)a3 ofParticipant:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMChat allPropertiesOfParticipant:](self, "allPropertiesOfParticipant:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofParticipant:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSMutableDictionary *participantProperties;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    -[IMChat allPropertiesOfParticipant:](self, "allPropertiesOfParticipant:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      participantProperties = self->_participantProperties;
      if (!participantProperties)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v14 = self->_participantProperties;
        self->_participantProperties = Mutable;

        participantProperties = self->_participantProperties;
      }
      objc_msgSend(v10, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](participantProperties, "setObject:forKey:", v11, v15);

    }
    objc_msgSend(v11, "setObject:forKey:", v17, v8);
    -[IMChat chatRegistry](self, "chatRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_chat:setProperties:ofParticipant:", self, v11, v10);

  }
}

- (id)_mergeParticipantIDs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[IMChat participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMChat participants](self, "participants", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C9AA60];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (IMSharedHelperContactsBasedMergingEnabled())
        {
          objc_msgSend(v12, "cnContactWithKeys:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else if (IMSharedHelperPersonCentricMergingEnabled())
        {
          objc_msgSend(v12, "personCentricID");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        if (!-[__CFString length](v14, "length"))
        {
          objc_msgSend(v12, "ID");
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (__CFString *)v15;
        }
        if (-[__CFString length](v14, "length"))
          v16 = v14;
        else
          v16 = CFSTR("invalidHandle");
        objc_msgSend(v5, "addObject:", v16);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_generatePersonCentricID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0D39740];
  -[IMChat guid](self, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat chatIdentifier](self, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMChat chatStyle](self, "chatStyle");
  -[IMChat groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMChat _lastKnownHybridState](self, "_lastKnownHybridState");
  -[IMChat account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "groupsMergeDisplayNames");
  -[IMChat _mergeParticipantIDs](self, "_mergeParticipantIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v11;
  objc_msgSend(v16, "personCentricIDForChatWithGUID:chatIdentifier:chatStyle:groupID:displayName:lastKnownToBeHybrid:mergeDisplayNames:participantIDs:", v3, v4, v5, v6, v7, v8, v15, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_hasCommunicatedOnService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;

  v4 = a3;
  -[IMChat account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v8 = 1;
  }
  else
  {
    -[IMChat chatRegistry](self, "chatRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_hasChat:forService:", self, v4);

  }
  return v8;
}

- (void)_setAccount:(id)a3
{
  -[IMChat _setAccount:locally:](self, "_setAccount:locally:", a3, 0);
}

- (void)_setAccount:(id)a3 locally:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unsigned __int8 *v16;
  id *p_account;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  NSArray *participants;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  _BOOL4 v53;
  char v54;
  _BOOL4 v55;
  IMChat *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  const __CFString *v67;
  uint64_t v68;

  v55 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v56 = self;
  if (-[IMChat suppressAccountRetargetingForNamedGroupConversation](self, "suppressAccountRetargetingForNamedGroupConversation"))
  {
    objc_msgSend(v6, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    self = v56;
  }
  else
  {
    v9 = 1;
  }
  if (-[IMChat joinState](self, "joinState"))
  {
    v54 = 0;
  }
  else
  {
    objc_msgSend(v6, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", v11))
    {
      -[IMAccount service](v56->_account, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMService iMessageService](IMServiceImpl, "iMessageService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
      v54 = 0;
    }

  }
  objc_msgSend(v6, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsMessaging");

  v16 = (unsigned __int8 *)v56;
  if (!v6)
    goto LABEL_67;
  p_account = (id *)&v56->_account;
  if (v56->_account == v6 || ((v9 ^ 1) & 1) != 0 || !v15)
    goto LABEL_67;
  v18 = -[IMChat joinState](v56, "joinState");
  v53 = v18 != 4;
  if (v18 != 4 && v55)
  {
    -[IMChat chatRegistry](v56, "chatRegistry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat account](v56, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (unsigned __int8 *)v56;
    v53 = (objc_msgSend(v19, "_hasChat:forService:", v56, v21) & 1) == 0 && -[IMChat joinState](v56, "joinState") == 3;

  }
  v22 = *p_account;
  if (*p_account != v6)
  {
    v23 = v16[41];
    if (v23 == 35 || v23 == 43)
    {
LABEL_31:
      objc_msgSend(v22, "service");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "service");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*p_account, "uniqueID");
          v31 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uniqueID");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          v34 = CFSTR("YES");
          *(_DWORD *)buf = 138412802;
          v63 = v31;
          v64 = 2112;
          if (v28 == v29)
            v34 = CFSTR("NO");
          v65 = v32;
          v66 = 2112;
          v67 = v34;
          _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "Trying to change group chat account from %@ to %@ (service change: %@)", buf, 0x20u);

        }
      }
      objc_storeStrong(p_account, a3);
      -[IMChat participants](v56, "participants");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "copy");

      v37 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      participants = v56->_participants;
      v56->_participants = v37;

      -[NSMutableDictionary removeAllObjects](v56->_participantStates, "removeAllObjects");
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v40 = v36;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v58 != v42)
              objc_enumerationMutation(v40);
            v44 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v44, "imHandleForOtherAccount:", v6);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v63 = v44;
                v64 = 2112;
                v65 = (uint64_t)v45;
                _os_log_impl(&dword_1A1FF4000, v46, OS_LOG_TYPE_INFO, " Old handle: %@     New handle: %@", buf, 0x16u);
              }

            }
            if (v45)
              objc_msgSend(v39, "addObject:", v45);

          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v41);
      }

      if (v53)
        v47 = 1;
      else
        v47 = 16;
      -[IMChat _addParticipants:withState:](v56, "_addParticipants:withState:", v39, v47);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          -[IMChat participants](v56, "participants");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v63 = v40;
          v64 = 2112;
          v65 = (uint64_t)v49;
          _os_log_impl(&dword_1A1FF4000, v48, OS_LOG_TYPE_INFO, " Old participants: %@        New participants: %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "postNotificationName:object:", CFSTR("__kIMChatSendingServiceChangedNotification"), v56);

      v16 = (unsigned __int8 *)v56;
      goto LABEL_58;
    }
    if (v23 == 45)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = *p_account;
          *(_DWORD *)buf = 138412546;
          v63 = v25;
          v64 = 2112;
          v65 = (uint64_t)v6;
          _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Trying to change 1-1 account from %@ to %@", buf, 0x16u);
        }

        v16 = (unsigned __int8 *)v56;
      }
      objc_msgSend(v16, "recipient");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "imHandleForOtherAccount:", v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        -[IMChat setRecipient:locally:](v56, "setRecipient:locally:", v27, v55);

      v22 = *p_account;
      goto LABEL_31;
    }
  }
LABEL_58:
  if ((v54 & 1) == 0)
  {
    if (v53)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          -[IMChat guid](v56, "guid");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v52;
          _os_log_impl(&dword_1A1FF4000, v51, OS_LOG_TYPE_INFO, "Transitioning %@ to joining state due to account change", buf, 0xCu);

        }
      }
      v16 = (unsigned __int8 *)v56;
      v56->_joinState = 2;
    }
    if (!v55)
    {
      objc_msgSend(v16, "join");
      v16 = (unsigned __int8 *)v56;
    }
  }
LABEL_67:
  objc_msgSend(v16, "_clearCachedIdentifier");

}

- (void)setRecipient:(id)a3 locally:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  IMAccount *account;
  IMAccount *v23;
  IMAccount *v24;
  IMAccount *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  void *v35;
  IMChat *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  IMAccount *v41;
  void *v42;
  IMAccount *v43;
  void *v44;
  void *v45;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  IMChat *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[IMChat recipient](self, "recipient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v7;
      v50 = 2112;
      v51 = v5;
      v52 = 2112;
      v53 = self;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Trying to change recipient from %@ to %@ (Chat: %@)", buf, 0x20u);

    }
  }
  if (v5)
  {
    -[IMChat recipient](self, "recipient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", v5) & 1) != 0)
    {
LABEL_47:

      goto LABEL_48;
    }
    if (v8
      && !a4
      && -[IMChat chatStyle](self, "chatStyle") == 45
      && (objc_msgSend(v5, "_isChatSiblingOf:", v8) & 1) == 0
      && (IMSharedHelperPersonCentricMergingEnabled() & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v8;
          v50 = 2112;
          v51 = v5;
          _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "** Cannot change recipient from %@ => %@, this is not a chat sibling", buf, 0x16u);
        }

      }
      goto LABEL_47;
    }
    if (-[IMChat chatStyle](self, "chatStyle") == 45)
    {
      objc_msgSend(v5, "originalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originalID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        objc_msgSend(v5, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "originalID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "ID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (MEMORY[0x1A858280C]())
          {
            objc_msgSend(v8, "ID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (MEMORY[0x1A858280C]())
            {
              objc_msgSend(v5, "ID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              IMCountryCodeForNumber();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "ID");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              IMCountryCodeForNumber();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v40, "isEqualToString:", v15);

              if ((v38 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("Country Code Swap"), 0, CFSTR("DSDS Privacy Violation"), CFSTR("Detected an attempt to retarget a chat at the same destination, but with a different country code"));

                goto LABEL_47;
              }
              goto LABEL_27;
            }

          }
        }

      }
    }
LABEL_27:
    -[IMChat recipient](self, "recipient");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v5;
    v41 = self->_account;
    objc_msgSend(v18, "account");
    v43 = (IMAccount *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[NSArray mutableCopy](self->_participants, "mutableCopy");
    if (!v19)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v19, "containsObjectIdenticalTo:", v45))
      objc_msgSend(v19, "removeObject:", v45);
    objc_msgSend(v19, "addObject:", v18);
    objc_storeStrong((id *)&self->_participants, v19);
    -[IMAccount service](v43, "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "supportsMessaging");

    if (((v41 != v43) & v21) == 1)
    {
      account = self->_account;
      objc_msgSend(v18, "account");
      v23 = (IMAccount *)objc_claimAutoreleasedReturnValue();
      LOBYTE(account) = account == v23;

      if ((account & 1) == 0)
      {
        objc_msgSend(v18, "account");
        v24 = (IMAccount *)objc_claimAutoreleasedReturnValue();
        v25 = self->_account;
        self->_account = v24;

        self->_senderBlackholeWarningStatus = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "postNotificationName:object:", CFSTR("__kIMChatSendingServiceChangedNotification"), self);

      }
    }
    -[IMChat _clearCachedIdentifier](self, "_clearCachedIdentifier");
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v18, CFSTR("__kIMChatValueKey"), v45, CFSTR("__kIMChatOldValueKey"), 0);
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatRecipientDidChangeNotification"), v27);
    -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatParticipantsDidChangeNotification"), 0);
    if (a4)
    {
      -[IMChat chatRegistry](self, "chatRegistry");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat account](self, "account");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "service");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "_hasChat:forService:", self, v30) & 1) != 0)
      {

      }
      else
      {
        v32 = -[IMChat joinState](self, "joinState") == 3;

        if (v32)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              -[IMChat guid](self, "guid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMChat account](self, "account");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "uniqueID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMChat account](self, "account");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "service");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "internalName");
              v36 = (IMChat *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v49 = v34;
              v50 = 2112;
              v51 = v37;
              v52 = 2112;
              v53 = v36;
              _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "Transitioning %@ to joining state because chat registry does not have chat for new account %@ on service %@", buf, 0x20u);

            }
          }
          self->_joinState = 2;
        }
      }
    }
    else if (-[IMChat joinState](self, "joinState") == 3)
    {
      -[IMChat chatRegistry](self, "chatRegistry");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_chat:joinWithProperties:", self, self->_chatProperties);

    }
    else
    {
      -[IMChat join](self, "join");
    }

    goto LABEL_47;
  }
LABEL_48:

}

- (void)setRecipient:(id)a3
{
  -[IMChat setRecipient:locally:](self, "setRecipient:locally:", a3, 0);
}

- (void)join
{
  NSObject *v3;
  NSObject *v4;
  IMChat *v5;
  int64_t joinState;
  void *v7;
  int v8;
  IMChat *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Request to join chat: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if ((unint64_t)(self->_joinState - 3) >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v5 = (IMChat *)objc_claimAutoreleasedReturnValue();
        joinState = self->_joinState;
        v8 = 138412546;
        v9 = v5;
        v10 = 2048;
        v11 = joinState;
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Transitioning %@ to joining state due to join from state %ld", (uint8_t *)&v8, 0x16u);

      }
    }
    -[IMChat _setJoinState:](self, "_setJoinState:", 2);
    -[IMChat chatRegistry](self, "chatRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_chat:joinWithProperties:", self, self->_chatProperties);

  }
}

- (void)leave
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  IMChat *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Request to leave chat: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  if (self->_style == 45)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = 138412290;
        v7 = self;
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Not allowed to leave 1:1 chat: %@", (uint8_t *)&v6, 0xCu);
      }

    }
  }
  else
  {
    if (self->_joinState == 3)
      -[IMChat _setJoinState:](self, "_setJoinState:", 1);
    -[IMChat chatRegistry](self, "chatRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_chat_leave:", self);

  }
}

- (void)remove
{
  NSObject *v3;
  void *v4;
  int v5;
  IMChat *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Request to remove chat: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  if (self->_joinState == 3)
    -[IMChat _setJoinState:](self, "_setJoinState:", 1);
  -[IMChat chatRegistry](self, "chatRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_chat_remove:", self);

}

- (void)_addParticipants:(id)a3 withState:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSArray *v14;
  NSArray *participants;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_participants, "containsObject:", v13, (_QWORD)v16))
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      v14 = (NSArray *)-[NSArray mutableCopy](self->_participants, "mutableCopy");
      if (!v14)
        v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (self->_style == 45)
        -[NSArray removeAllObjects](v14, "removeAllObjects");
      -[NSArray addObjectsFromArray:](v14, "addObjectsFromArray:", v7, (_QWORD)v16);
      participants = self->_participants;
      self->_participants = v14;

      self->_senderBlackholeWarningStatus = 0;
    }
    -[IMChat _setParticipantState:forHandles:postNotification:](self, "_setParticipantState:forHandles:postNotification:", a4, v8, 1, (_QWORD)v16);

  }
}

- (BOOL)canLeaveChat
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  if (-[IMChat chatStyle](self, "chatStyle") == 45)
    return 0;
  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsMutatingGroupMembers");

  if (!v5)
    return 0;
  -[IMChat participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)objc_msgSend(v6, "count") > 2;

  return v7;
}

- (BOOL)canAddParticipant:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  int v24;
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMChat participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else if (-[IMChat chatStyle](self, "chatStyle") == 45
         || -[IMChat joinState](self, "joinState") >= 1
         && (-[IMChat account](self, "account"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v8, "service"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v9, "supportsMutatingGroupMembers"),
             v9,
             v8,
             !v10))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[IMChat account](self, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "maxChatParticipantsForHandle:simID:", v13, v14);

    if (v15 < 1)
      goto LABEL_16;
    -[IMChat participants](self, "participants");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17 + 1;
    v21 = objc_msgSend(v11, "maxChatParticipantsForHandle:simID:", v18, v19);

    if (v20 <= v21)
    {
LABEL_16:
      v7 = 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v24 = 138412546;
          v25 = v4;
          v26 = 1024;
          v27 = v15;
          _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Cannot add participant %@  that would put us over our max size of: %d", (uint8_t *)&v24, 0x12u);
        }

      }
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)canAddParticipants:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") && -[IMChat chatStyle](self, "chatStyle") != 45)
  {
    objc_msgSend(v4, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[IMChat account](self, "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "service");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "maxChatParticipantsForHandle:simID:", v9, v10);

    if (v11 < 1)
      goto LABEL_13;
    v12 = objc_msgSend(v4, "count");
    -[IMChat participants](self, "participants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14 + v12;
    v18 = objc_msgSend(v7, "maxChatParticipantsForHandle:simID:", v15, v16);

    if (v17 <= v18)
    {
LABEL_13:
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v20 = v4;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v20);
            if (!-[IMChat canAddParticipant:](self, "canAddParticipant:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25))
            {
              v5 = 0;
              goto LABEL_23;
            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v21)
            continue;
          break;
        }
      }
      v5 = 1;
LABEL_23:

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v31 = v4;
          v32 = 1024;
          v33 = v11;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Cannot add participants: %@ that would put us over our max size of: %d", buf, 0x12u);
        }

      }
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_pendingParticipants
{
  void *v3;

  if (-[IMChat canHaveMultipleParticipants](self, "canHaveMultipleParticipants")
    && -[IMChat chatStyle](self, "chatStyle") == 43)
  {
    -[IMChat participantsWithState:](self, "participantsWithState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)inviteParticipants:(id)a3 reason:(id)a4
{
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  IMChat *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  IMChat *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[6];
  const __CFString *v53;
  id v54;
  uint8_t v55[4];
  IMChat *v56;
  __int16 v57;
  void *v58;
  uint8_t v59[128];
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v61 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Request to invite participants to chat: %@   handles: %@  reason: %@", buf, 0x20u);
    }

  }
  if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Cannot mutate participants on 1-1 chat: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v6, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[IMChat account](self, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[IMChat account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsMutatingGroupMembers");

    if ((v15 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v61 = sub_1A200AE34;
      v62 = sub_1A200AC8C;
      v63 = 0;
      v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = sub_1A20CCD4C;
      v52[3] = &unk_1E47211A0;
      v52[4] = self;
      v52[5] = buf;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v52);
      -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "maxChatParticipantsForHandle:simID:", v16, v17);

      if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
      {
        if (v18 >= 1)
        {
          v19 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
          -[IMChat participants](self, "participants");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");
          -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v19) = v21 + v19 > (unint64_t)objc_msgSend(v11, "maxChatParticipantsForHandle:simID:", v22, v23);

          if ((_DWORD)v19)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v55 = 67109120;
                LODWORD(v56) = v18;
                _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Failing to invite some participants that would put us over our max size of: %d", v55, 8u);
              }

            }
            -[IMChat participants](self, "participants");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count") == v18;

            if (v26)
            {
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "removeAllObjects");
            }
            else
            {
              -[IMChat participants](self, "participants");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "count");
              v32 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");

              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "removeObjectsInRange:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") - (v31 - v18 + v32));
            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                v34 = *(IMChat **)(*(_QWORD *)&buf[8] + 40);
                *(_DWORD *)v55 = 138412290;
                v56 = v34;
                _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "  => Will invite: %@", v55, 0xCu);
              }

            }
          }
        }
      }
      if (-[IMChat chatStyle](self, "chatStyle") == 45)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v55 = 138412290;
            v56 = self;
            _os_log_impl(&dword_1A1FF4000, v35, OS_LOG_TYPE_INFO, "Cannot mutate participants on 1-1 chat: %@", v55, 0xCu);
          }

        }
      }
      else
      {
        -[IMChat _pendingParticipants](self, "_pendingParticipants");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count") + objc_msgSend(v6, "count"));
        if (objc_msgSend(v6, "count"))
          objc_msgSend(v37, "addObjectsFromArray:", v6);
        if (objc_msgSend(v36, "count"))
          objc_msgSend(v37, "addObjectsFromArray:", v36);
        v38 = (IMChat *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v37, "count"));
        v47 = v36;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v39 = v37;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v49 != v41)
                objc_enumerationMutation(v39);
              v43 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
              if (-[IMChat stateForParticipant:](self, "stateForParticipant:", v43) != 16)
                -[IMChat addObject:](v38, "addObject:", v43);
            }
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          }
          while (v40);
        }

        if (-[IMChat count](v38, "count"))
        {
          -[IMChat addHandlesToGroupFaceTimeChatIfRegistered:](self, "addHandlesToGroupFaceTimeChatIfRegistered:", v38);
          -[IMChat _addParticipants:withState:](self, "_addParticipants:withState:", v38, 4);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v55 = 138412546;
              v56 = v38;
              v57 = 2112;
              v58 = v47;
              _os_log_impl(&dword_1A1FF4000, v44, OS_LOG_TYPE_INFO, "Inviting: %@   (Pending: %@)", v55, 0x16u);
            }

          }
          -[IMChat chatRegistry](self, "chatRegistry");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_chat:inviteParticipants:reason:", self, v38, v7);

          v53 = CFSTR("__kIMChatParticipantsDidChangeAddedParticipantsKey");
          v54 = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatParticipantsDidChangeNotification"), v46);

        }
      }
      _Block_object_dispose(buf, 8);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        -[IMChat account](self, "account");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "service");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v29;
        _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "Cannot mutate participants on chat: %@   service doesn't support it: %@", buf, 0x16u);

      }
    }

  }
}

- (void)removeParticipants:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  IMChat *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v31 = self;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@   handles: %@  reason: %@", buf, 0x20u);
    }

  }
  if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = self;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Cannot mutate participants on 1-1 chat: %@", buf, 0xCu);
      }
LABEL_37:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
  -[IMChat account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsMutatingGroupMembers");

  if ((v12 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[IMChat account](self, "account");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "service");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = self;
        v32 = 2112;
        v33 = v23;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Cannot mutate participants on chat: %@   service doesn't support it: %@", buf, 0x16u);

      }
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  -[IMChat participants](self, "participants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {

LABEL_29:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Tried to remove too many participants, ignoring", buf, 2u);
      }

    }
    goto LABEL_33;
  }
  v14 = -[IMChat canRemoveParticipants:](self, "canRemoveParticipants:", v6);

  if (!v14)
    goto LABEL_29;
  if (-[IMChat joinState](self, "joinState"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (-[NSArray containsObject:](self->_participants, "containsObject:", v20, (_QWORD)v25))
            objc_msgSend(v15, "addObject:", v20);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    -[IMChat _setParticipantState:forHandles:postNotification:](self, "_setParticipantState:forHandles:postNotification:", 256, v15, 1);
    -[IMChat chatRegistry](self, "chatRegistry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_chat:removeParticipants:reason:", self, v15, v7);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Cannot mutate participants if already left chat: %@", buf, 0xCu);
    }
    goto LABEL_37;
  }
LABEL_33:

}

- (BOOL)canRemoveParticipants:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[IMChat participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");

  return (unint64_t)(v6 - v7 + 1) > 2;
}

- (void)addPendingParticipants:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  const __CFString *v26;
  id v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[IMChat account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1A200AE34;
  v24 = sub_1A200AC8C;
  v25 = 0;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1A20CD6E4;
  v19[3] = &unk_1E47211A0;
  v19[4] = self;
  v19[5] = &v20;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v19);
  -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "maxChatParticipantsForHandle:simID:", v8, v9);

  if (objc_msgSend((id)v21[5], "count"))
  {
    if (v10 >= 1)
    {
      v11 = objc_msgSend((id)v21[5], "count");
      -[IMChat participants](self, "participants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = v13 + v11 > (unint64_t)objc_msgSend(v6, "maxChatParticipantsForHandle:simID:", v14, v15);

      if ((_DWORD)v11)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            v29 = v10;
            _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Failing to add some pending participants that would put us over our max size of: %d", buf, 8u);
          }

        }
      }
    }
  }
  if (self->_style == 45)
    v17 = 16;
  else
    v17 = 1;
  -[IMChat _addParticipants:withState:](self, "_addParticipants:withState:", v4, v17);
  v26 = CFSTR("__kIMChatParticipantsDidChangeAddedParticipantsKey");
  v27 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat _postNotification:userInfo:](self, "_postNotification:userInfo:", CFSTR("__kIMChatParticipantsDidChangeNotification"), v18);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)hasMessageFromMe
{
  return -[IMChat numberOfTimesRespondedToThread](self, "numberOfTimesRespondedToThread") > 0;
}

- (id)momentShareCache
{
  IMMomentShareCache *momentShareCache;
  IMMomentShareCache *v4;
  IMMomentShareCache *v5;
  void *v6;

  momentShareCache = self->_momentShareCache;
  if (!momentShareCache)
  {
    +[IMMomentShareCache sharedInstance](IMMomentShareCache, "sharedInstance");
    v4 = (IMMomentShareCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_momentShareCache;
    self->_momentShareCache = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__momentShareCacheDidChange_, CFSTR("IMMomentShareCacheDidChangeNotification"), self->_momentShareCache);

    momentShareCache = self->_momentShareCache;
  }
  return momentShareCache;
}

- (IMMomentSharePresentationCache)momentSharePresentationCache
{
  IMMomentSharePresentationCache *momentSharePresentationCache;
  void *v4;
  IMMomentSharePresentationCache *v5;
  IMMomentSharePresentationCache *v6;

  momentSharePresentationCache = self->_momentSharePresentationCache;
  if (!momentSharePresentationCache)
  {
    -[IMChat momentShareCache](self, "momentShareCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[IMMomentSharePresentationCache initWithMomentShareCache:]([IMMomentSharePresentationCache alloc], "initWithMomentShareCache:", v4);
    v6 = self->_momentSharePresentationCache;
    self->_momentSharePresentationCache = v5;

    -[IMMomentSharePresentationCache setDelegate:](self->_momentSharePresentationCache, "setDelegate:", self);
    momentSharePresentationCache = self->_momentSharePresentationCache;
  }
  return momentSharePresentationCache;
}

- (void)_momentShareCacheDidChange:(id)a3
{
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Moment share cache did change"), &unk_1E47211C0);
}

- (void)momentSharePresentationCacheDidChange:(id)a3
{
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Moment share presentation cache did change"), &unk_1E471C3B0);
}

- (BOOL)isPinned
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = +[IMPinnedConversationsController processSupportsPinnedConversations](IMPinnedConversationsController, "processSupportsPinnedConversations");
  if (v3)
  {
    +[IMPinnedConversationsController sharedInstance](IMPinnedConversationsController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pinnedConversationsContainsChat:", self);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldDisplayOffGridModeStatus
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v9;

  if (-[IMChat chatStyle](self, "chatStyle") != 45)
    return 0;
  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F68]);

  if (!v6)
    return 0;
  if (-[IMChat isReadOnly](self, "isReadOnly"))
    return 0;
  -[IMChat recipient](self, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "offGridMode") == 2;

  return v7;
}

- (void)autoInviteToViewOffGridModeIfNeeded
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  uint8_t v9[16];
  uint8_t buf[2];
  __int16 v11;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
  {
    if (-[IMChat _canShareStatus](self, "_canShareStatus"))
    {
      if (-[IMChat containsMessageFromContactOrMe](self, "containsMessageFromContactOrMe"))
      {
        -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
        v5 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject length](v5, "length"))
        {
          -[IMChat recipient](self, "recipient");
          v6 = objc_claimAutoreleasedReturnValue();
          -[NSObject autoInviteToViewOffGridModeIfNeededFromHandleID:](v6, "autoInviteToViewOffGridModeIfNeededFromHandleID:", v5);
        }
        else
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_17;
          OSLogHandleForIMFoundationCategory();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Not sharing off grid mode in chat with no lastAddressedHandleID", v9, 2u);
          }
        }

LABEL_17:
        return;
      }
      if (!IMOSLoggingEnabled())
        return;
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v7 = "Not sharing off grid mode in chat with non contact that I have not participated in";
      v8 = buf;
    }
    else
    {
      if (!IMOSLoggingEnabled())
        return;
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      v11 = 0;
      v7 = "Not able to share off grid mode";
      v8 = (uint8_t *)&v11;
    }
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, v7, v8, 2u);
    goto LABEL_17;
  }
}

- (BOOL)shouldDisplayUnavailabilityIndicator
{
  void *v3;
  BOOL v4;

  if (!-[IMChat supportsCapabilities:](self, "supportsCapabilities:", 0x200000))
    return 0;
  -[IMChat recipient](self, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "availability") == 2;

  return v4;
}

- (NSDate)availabilityStatusPublishedDate
{
  void *v3;
  void *v4;

  if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    -[IMChat recipient](self, "recipient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "availabilityStatusPublishedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (void)isInvitedToViewMyFocusStatusWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (-[IMChat chatStyle](self, "chatStyle") != 45)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1A21978B8();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37498], 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v6);

  }
  -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Not able to determine if sender if invited with no lastAddressedHandleID", v11, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37498], 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
  -[IMChat recipient](self, "recipient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isInvitedToViewMyFocusStatusFromHandleID:completion:", v7, v4);

}

- (id)beginObservingHandleStatuses
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Beginning observing of handle status", buf, 2u);
    }

  }
  if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    -[IMChat recipient](self, "recipient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginObservingAvailability");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Chat is not 1:1, bailing", v8, 2u);
      }

    }
    return 0;
  }
}

- (void)_reloadChatItemsForHandleAvailabilityChange
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Availability changed, updating chat items for chat: %@", (uint8_t *)&v5, 0xCu);

    }
  }
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) IMHandle availability changed"), &unk_1E471C3D0);
}

- (void)_reloadChatItemsForKeyTransparencyStatusChange
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Key Transparency changed, updating chat items for chat: %@", (uint8_t *)&v5, 0xCu);

    }
  }
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) IMHandle key transparency changed"), &unk_1E471C3F0);
}

- (void)_reloadChatItemsForSatelliteStateChangeIfRequired:(id)a3
{
  id v4;
  IMChatItemRules *chatItemRules;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  chatItemRules = self->_chatItemRules;
  -[IMChat chatItems](self, "chatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(chatItemRules) = -[IMChatItemRules _shouldReloadSatelliteChatItems:](chatItemRules, "_shouldReloadSatelliteChatItems:", v6);

  v7 = IMOSLoggingEnabled();
  if ((_DWORD)chatItemRules)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "%@, updating chat items for chat: %@", (uint8_t *)&v12, 0x16u);

      }
    }
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", v4, &unk_1E47211E0);
  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Skipping chat items update (%@) for chat: %@. Items don't need update", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)_reloadChatItemsForJunkStateChange
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Junk status changed, updating chat items for chat: %@", (uint8_t *)&v5, 0xCu);

    }
  }
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Junk status changed"), &unk_1E4721200);
}

- (void)reloadChatItemsForSuggestedRepliesChange
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Suggested replies changed, updating chat items for chat: %@", (uint8_t *)&v5, 0xCu);

    }
  }
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Suggested replies changed"), &unk_1E4721220);
}

- (void)autoInviteToViewAvailabilityIfNeeded
{
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1A20CE594;
  v3[3] = &unk_1E4721248;
  objc_copyWeak(&v4, &location);
  -[IMChat canShareFocusStatusWithCompletion:](self, "canShareFocusStatusWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)canShareFocusStatusWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, _QWORD);
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  void (**v12)(void *, _QWORD);
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A20CE910;
  aBlock[3] = &unk_1E4721298;
  v6 = v4;
  v15 = v6;
  v7 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (!-[IMChat _canShareStatus](self, "_canShareStatus"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v10 = "Not able to share focus status";
LABEL_10:
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
      }
LABEL_11:

    }
LABEL_12:
    v7[2](v7, 0);
    goto LABEL_13;
  }
  if (!-[IMChat isMessagesAuthorizedToAccessFocusStatus](self, "isMessagesAuthorizedToAccessFocusStatus"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v10 = "Not able to share focus status because Messages is not authorized to access that status";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D396E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = sub_1A20CE99C;
  v11[3] = &unk_1E4721298;
  v12 = v7;
  objc_msgSend(v8, "fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:", v11);

LABEL_13:
}

- (BOOL)isMessagesAuthorizedToAccessFocusStatus
{
  void *v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  BOOL v6;
  __int16 v8;
  uint8_t buf[2];

  objc_msgSend((id)MEMORY[0x1A858292C](CFSTR("INFocusStatusCenter"), CFSTR("Intents")), "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v2, "authorizationStatus"))
  {
    case 0:
      if (!IMOSLoggingEnabled())
        goto LABEL_13;
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      v8 = 0;
      v4 = "Focus Status authorization status is not determined. This is unexpected, as we should have prompted on app la"
           "unch. Treating as not authorized.";
      v5 = (uint8_t *)&v8;
      goto LABEL_8;
    case 1:
      IMLogHandleForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        sub_1A21978E4();
      goto LABEL_12;
    case 2:
      if (!IMOSLoggingEnabled())
        goto LABEL_13;
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v4 = "Focus Status authorization status is denied.";
        v5 = buf;
LABEL_8:
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
      }
LABEL_12:

LABEL_13:
      v6 = 0;
LABEL_14:

      return v6;
    case 3:
      v6 = 1;
      goto LABEL_14;
    default:
      goto LABEL_13;
  }
}

- (BOOL)_canShareStatus
{
  int v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  int v8;
  __int16 v10;
  uint8_t buf[2];
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;

  if (-[IMChat isSMS](self, "isSMS"))
  {
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v16 = 0;
        v5 = "Not able to share status in SMS chat";
        v6 = (uint8_t *)&v16;
LABEL_29:
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
  }
  else if (-[IMChat isRCS](self, "isRCS"))
  {
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v15 = 0;
        v5 = "Not able to share status in RCS chat";
        v6 = (uint8_t *)&v15;
        goto LABEL_29;
      }
LABEL_30:

      LOBYTE(v3) = 0;
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D396B8], "isInAppleStoreDemoMode"))
  {
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v14 = 0;
        v5 = "Not able to share status in Apple Store Demo mode.";
        v6 = (uint8_t *)&v14;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (-[IMChat isBusinessChat](self, "isBusinessChat"))
  {
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v13 = 0;
        v5 = "Not able to share status in business chat";
        v6 = (uint8_t *)&v13;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (-[IMChat isStewieChat](self, "isStewieChat"))
  {
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v12 = 0;
        v5 = "Not able to share status in stewie chat";
        v6 = (uint8_t *)&v12;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (-[IMChat chatStyle](self, "chatStyle") == 45)
  {
    -[IMChat recipient](self, "recipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "matchesLoginHandleForAnyAccount");

    if (v8)
    {
      v3 = IMOSLoggingEnabled();
      if (v3)
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v10 = 0;
          v5 = "Not able to share status with myself";
          v6 = (uint8_t *)&v10;
          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    v3 = IMOSLoggingEnabled();
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v5 = "Not able to share status in non 1-1 chat";
        v6 = buf;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  return v3;
}

- (void)_handleAddressBookChangeForRecipientUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  if (-[IMChat isBusinessChat](self, "isBusinessChat")
    && (-[IMChat recipient](self, "recipient"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "ID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v4, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    -[IMChat recipient](self, "recipient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat _setDisplayName:](self, "_setDisplayName:", v9);

  }
  else if (!v4)
  {
    -[IMChat invalidateSpamIndicatorCachedValues](self, "invalidateSpamIndicatorCachedValues");
    if (-[IMChat isFiltered](self, "isFiltered") && -[IMChat hasKnownParticipants](self, "hasKnownParticipants"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "A contact has been added to the chat: Updating isFiltered to NO", v11, 2u);
        }

      }
      -[IMChat updateIsFiltered:](self, "updateIsFiltered:", 0);
    }
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) AddressBook changed"), &unk_1E47212B8);
  }

}

- (BOOL)_sanityCheckAccounts
{
  void *v3;
  IMChat *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  IMChat *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  IMChat *v26;
  __int16 v27;
  IMChat *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[IMChat account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObjectIdenticalTo:", v3);

  if ((v7 & 1) == 0)
  {
    v8 = -[IMChat chatStyle](v4, "chatStyle") == 45;
    objc_msgSend(v3, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bestAccountForService:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v11)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v11;
            _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "This is a 1-1 chat, the account attached to it is gone, we're re-targeting to this account: %@", buf, 0xCu);
          }

        }
        -[IMChat _setAccount:locally:](v4, "_setAccount:locally:", v11, 1);
      }
      else
      {
        -[IMChat recipient](v4, "recipient");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_chatSiblings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
        {
          objc_msgSend(v14, "_bestChatSibling");
          v21 = (IMChat *)objc_claimAutoreleasedReturnValue();
          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "accounts");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChat account](v21, "account");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "containsObjectIdenticalTo:", v17);

          if (v18)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v24 = v14;
                v25 = 2112;
                v26 = v21;
                v27 = 2112;
                v28 = v4;
                _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "This is a 1-1 chat, the account attached to it is gone, we're re-targeting from: %@ to: %@ (Chat: %@)", buf, 0x20u);
              }

            }
            -[IMChat setRecipient:](v4, "setRecipient:", v21);
          }

        }
      }
    }
    else if (v11 && v3 != v11)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v11;
          v25 = 2112;
          v26 = v4;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "This is a group chat, found a new account to attach to: %@  (Chat: %@)", buf, 0x16u);
        }

      }
      -[IMChat _setAccount:](v4, "_setAccount:", v11);
    }

  }
  return v7 ^ 1;
}

- (void)_accountControllerUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  IMChat *v7;
  int v8;
  IMChat *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "object");
      v7 = (IMChat *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "_accountControllerUpdated: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  -[IMChat _sanityCheckAccounts](self, "_sanityCheckAccounts");

}

- (void)_daemonAlive:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  IMChat *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMChat _sanityCheckAccounts](self, "_sanityCheckAccounts");

}

- (void)_daemonDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  IMChat *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  unint64_t v9;
  int64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v30 = (void *)MEMORY[0x1E0CB3940];
  -[IMChat chatIdentifier](self, "chatIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[IMChat guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat persistentID](self, "persistentID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[IMChat account](self, "account");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "uniqueID");
  v6 = objc_claimAutoreleasedReturnValue();
  v28 = -[IMChat chatStyle](self, "chatStyle");
  v27 = -[IMChat joinState](self, "joinState");
  -[IMChat participants](self, "participants");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v6;
  v35 = (void *)v3;
  v34 = (void *)v5;
  if (v31)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[IMChat participants](self, "participants");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = CFSTR("nil");
  }
  -[IMChat roomName](self, "roomName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat displayName](self, "displayName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMChat isUnregistered](self, "isUnregistered"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v24 = v8;
  -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat groupID](self, "groupID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[IMChat unreadMessageCount](self, "unreadMessageCount");
  v9 = -[IMChat messageFailureCount](self, "messageFailureCount");
  v10 = -[IMChat isFiltered](self, "isFiltered");
  if (-[IMChat hasHadSuccessfulQuery](self, "hasHadSuccessfulQuery"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[IMChat bizIntent](self, "bizIntent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat personCentricID](self, "personCentricID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat mergedPinningIdentifiers](self, "mergedPinningIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMChat isRecovered](self, "isRecovered"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (-[IMChat isDeletingIncomingMessages](self, "isDeletingIncomingMessages"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<IMChat %p> [Identifier: %@   GUID: %@ Persistent ID: %@   Account: %@   Style: %c   State: %d  Participants: %@  Room Name: %@  Display Name: %@  Unregistered: %@  Last Addressed Handle: %@ Last Addressed SIMID: %@ Group ID: %@  Unread Count: %u  Failure Count: %u, isFiltered: %d, hasHadSuccessfulQuery: %@, bizIntent: %@ personCentricID: %@ mergedPinningIdentifiers: %@, isRecovered: %@  isDeletingIncomingMessages: %@]"), self, v35, v4, v34, v32, v28, v27, v29, v26, v25, v24, v23, v22, v21, v20, v9,
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {

  }
  return (NSString *)v17;
}

- (BOOL)hasStoredMessageWithGUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMChat chatItems](self, "chatItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_item");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "type"))
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v9, "message");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToIgnoringCase:", v4))
        {
          v12 = objc_msgSend(v10, "messageID");

          if (v12 > 0)
          {

            LOBYTE(v6) = 1;
            goto LABEL_15;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
LABEL_15:

  return v6;
}

- (void)setSendProgressDelegate:(id)a3
{
  id v4;
  IMSendProgress *sendProgress;
  id v6;
  IMSendProgress *v7;
  IMSendProgress *v8;
  IMSendProgress *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  IMSendProgress *v13;
  IMSendProgress *v14;
  int v15;
  void *v16;
  __int16 v17;
  IMSendProgress *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sendProgress = self->_sendProgress;
  if (v4)
  {
    -[IMSendProgress context](sendProgress, "context");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
      -[IMSendProgress setDelegate:](self->_sendProgress, "setDelegate:", 0);
      -[IMSendProgress setContext:](self->_sendProgress, "setContext:", 0);
      -[IMSendProgress invalidate](self->_sendProgress, "invalidate");
      v7 = -[IMSendProgress initWithDelegate:context:]([IMSendProgress alloc], "initWithDelegate:context:", self, v4);
      v8 = self->_sendProgress;
      self->_sendProgress = v7;

      v9 = self->_sendProgress;
      -[IMItemsController _items](self, "_items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSendProgress updateForItems:forced:](v9, "updateForItems:forced:", v10, 1);

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self->_sendProgress;
        v15 = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Set send progress delegate for chat %@. Send progress: %@", (uint8_t *)&v15, 0x16u);

      }
    }
  }
  else
  {
    -[IMSendProgress setDelegate:](sendProgress, "setDelegate:", 0);
    -[IMSendProgress setContext:](self->_sendProgress, "setContext:", 0);
    -[IMSendProgress invalidate](self->_sendProgress, "invalidate");
    v14 = self->_sendProgress;
    self->_sendProgress = 0;

  }
}

- (id)sendProgressDelegate
{
  return -[IMSendProgress context](self->_sendProgress, "context");
}

- (void)sendProgress:(id)a3 progressDidChange:(float)a4 sendingMessages:(id)a5 sendCount:(unint64_t)a6 totalCount:(unint64_t)a7 finished:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  double v15;
  id v16;

  v8 = a8;
  v14 = a5;
  objc_msgSend(a3, "context");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a4;
  objc_msgSend(v16, "chat:progressDidChange:sendingMessages:sendCount:totalCount:finished:", self, v14, a6, a7, v8, v15);

}

- (void)downloadPurgedAttachments
{
  id v3;

  -[IMChat chatRegistry](self, "chatRegistry");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_chat_downloadPurgedAttachmentsForChat:", self);

}

- (void)loadInlineRepliesForThreadIdentifier:(id)a3 threadOriginator:(id)a4 messageGuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMInlineReplyController *v11;
  IMInlineReplyController *inlineReplyController;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IMInlineReplyController initWithChat:threadIdentifier:threadOriginator:]([IMInlineReplyController alloc], "initWithChat:threadIdentifier:threadOriginator:", self, v8, v9);
  inlineReplyController = self->_inlineReplyController;
  self->_inlineReplyController = v11;

  -[IMItemsController setCapacity:](self->_inlineReplyController, "setCapacity:", 50);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136316162;
      v17 = "-[IMChat loadInlineRepliesForThreadIdentifier:threadOriginator:messageGuid:]";
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "%s chatGUID: %@, threadIdentifier: %@, messageGUID: %@, threadOriginator: %@", (uint8_t *)&v16, 0x34u);

    }
  }
  v15 = -[IMChat loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:](self, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v10, 25, 25, 1, v8);

}

- (void)dismissInlineReplies
{
  IMInlineReplyController *inlineReplyController;

  inlineReplyController = self->_inlineReplyController;
  self->_inlineReplyController = 0;

}

- (BOOL)canSend
{
  void *v3;
  char v4;
  int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  char v9;
  uint8_t v11[16];

  if (-[IMChat isStewieEmergencyChat](self, "isStewieEmergencyChat")
    && (+[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isStewieEmergencyActive"),
        v3,
        (v4 & 1) == 0))
  {
    v5 = IMOSLoggingEnabled();
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v7 = "canSend = NO: chat is emergency but emergency is not active";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  else if (-[IMChat isStewieSharingChat](self, "isStewieSharingChat"))
  {
    v5 = IMOSLoggingEnabled();
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v7 = "canSend = NO: chat is stewie sharing";
LABEL_31:
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, v7, v11, 2u);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
  }
  else if (-[IMChat isStewieRoadsideChat](self, "isStewieRoadsideChat")
         && (+[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v9 = objc_msgSend(v8, "isStewieRoadsideActive"),
             v8,
             (v9 & 1) == 0))
  {
    v5 = IMOSLoggingEnabled();
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v7 = "canSend = NO: chat is roadside and roadside is not active";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  else if (-[IMChat allowedByScreenTime](self, "allowedByScreenTime"))
  {
    if (-[IMChat isOscarChat](self, "isOscarChat"))
    {
      v5 = IMOSLoggingEnabled();
      if (v5)
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          v7 = "canSend = NO: chat is oscar";
          goto LABEL_31;
        }
LABEL_32:

        LOBYTE(v5) = 0;
      }
    }
    else if (-[IMChat hasLeftGroup](self, "hasLeftGroup"))
    {
      v5 = IMOSLoggingEnabled();
      if (v5)
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          v7 = "canSend = NO: chat has left group";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    else if (-[IMChat isReadOnly](self, "isReadOnly"))
    {
      v5 = IMOSLoggingEnabled();
      if (v5)
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          v7 = "canSend = NO: chat is read only";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    else
    {
      if (-[IMChat isBusinessChat](self, "isBusinessChat")
        && -[IMChat isMakoChat](self, "isMakoChat")
        && !-[IMChat _isSendToMakoAllowed](self, "_isSendToMakoAllowed"))
      {
        v5 = IMOSLoggingEnabled();
        if (!v5)
          return v5;
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        *(_WORD *)v11 = 0;
        v7 = "canSend = NO: chat is business && mako and sending to mako is not allowed";
        goto LABEL_31;
      }
      if (-[IMChat isBusinessChat](self, "isBusinessChat")
        && (objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat") & 1) == 0)
      {
        v5 = IMOSLoggingEnabled();
        if (!v5)
          return v5;
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        *(_WORD *)v11 = 0;
        v7 = "canSend = NO: chat is business but device does not support business chats";
        goto LABEL_31;
      }
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    v5 = IMOSLoggingEnabled();
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v7 = "canSend = NO: chat is blocked by screen time";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  return v5;
}

- (BOOL)_isSendToMakoAllowed
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("m-reply-enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9[0] = 67109120;
        v9[1] = v5;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "_isSendToMakoAllowed: Server bag value found: return: %{BOOL}d", (uint8_t *)v9, 8u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "_isSendToMakoAllowed: No server bag value found: defaulting to NO", (uint8_t *)v9, 2u);
      }

    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)canSendInlineReply
{
  _BOOL4 v3;

  v3 = -[IMChat canSend](self, "canSend");
  if (v3)
    LOBYTE(v3) = -[IMChat supportsCapabilities:](self, "supportsCapabilities:", 4);
  return v3;
}

- (BOOL)isReadOnly
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
  {
    +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMessagingActiveOverSatellite");

    if (v6)
    {
      if (!-[IMChat isStewieChat](self, "isStewieChat"))
      {
        if (-[IMChat isGroupChat](self, "isGroupChat"))
          return 1;
        -[IMChat account](self, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "service");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMService iMessageLiteService](IMServiceImpl, "iMessageLiteService");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 == (void *)v10)
        {

          goto LABEL_4;
        }
        v11 = (void *)v10;
        -[IMChat account](self, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "service");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMService satelliteSMSService](IMServiceImpl, "satelliteSMSService");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 != v14)
          return 1;
      }
    }
  }
LABEL_4:
  if (-[IMChat joinState](self, "joinState") == 4 && !-[IMChat isGroupChat](self, "isGroupChat"))
    return !-[IMChat isBusinessChat](self, "isBusinessChat");
  else
    return 0;
}

- (BOOL)hasLeftGroup
{
  _BOOL4 v3;

  v3 = -[IMChat isGroupChat](self, "isGroupChat");
  if (v3)
  {
    v3 = -[IMChat canLeaveChat](self, "canLeaveChat");
    if (v3)
      LOBYTE(v3) = -[IMChat joinState](self, "joinState") != 3 && -[IMChat joinState](self, "joinState") != 2;
  }
  return v3;
}

- (void)_updateRepliesIfNecessaryWithItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  IMChat *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "threadOriginator");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    v11 = v10;

    objc_msgSend(v11, "replyCountsByPart");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[IMItemsController _items](self, "_items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_1A20D07CC;
      v17[3] = &unk_1E4721330;
      v18 = v13;
      v19 = v4;
      v20 = v11;
      v21 = v14;
      v22 = self;
      v15 = v14;
      v16 = v13;
      -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Update items with thread originator (reply counts)"), v17);

    }
  }

}

- (void)_updateRepliesIfNecessaryWithRemovedItems:(id)a3 threadIdentifiersOfRemovedParts:(id)a4
{
  id v5;
  id v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  __CFDictionary *v28;
  id v29;
  id v30;
  id v32;
  id obj;
  id v34;
  CFMutableDictionaryRef Mutable;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  id v40;
  CFMutableDictionaryRef v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v37)
  {
    v6 = 0;
    v34 = 0;
    Mutable = 0;
    v36 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "replyCountsByPart");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            if (!v6)
              v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v9, "guid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v11);

            objc_msgSend(v9, "guid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFDictionary removeObjectForKey:](Mutable, "removeObjectForKey:", v12);

          }
          objc_msgSend(v9, "threadOriginator");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            if (!Mutable)
              Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            if (!v34)
              v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v9, "guid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v14);

            objc_msgSend(v9, "threadOriginator");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "guid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "threadIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v6, "containsObject:", v16) & 1) == 0
              && (objc_msgSend(v32, "containsObject:", v17) & 1) == 0)
            {
              v43 = 0;
              IMMessageThreadIdentifierGetComponents();
              v18 = 0;
              if (v18)
              {
                v19 = v18;
                -[__CFDictionary objectForKey:](Mutable, "objectForKey:", v16);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v20)
                {
                  objc_msgSend(v15, "replyCountsByPart");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = (void *)objc_msgSend(v21, "mutableCopy");

                  if (v20)
                    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v20, v16);
                }
                objc_msgSend(v20, "objectForKey:", v19);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "unsignedIntegerValue");

                if (v23)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23 - 1);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setObject:forKey:", v24, v19);

                }
              }
              else if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v9, "guid");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v49 = v26;
                  v50 = 2112;
                  v51 = v17;
                  _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "When attempting to remove message %@, no part identifier was found for thread identifier %@", buf, 0x16u);

                }
              }
            }

          }
        }
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v37);
  }
  else
  {
    v6 = 0;
    v34 = 0;
    Mutable = 0;
  }

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1A20D0F3C;
  v38[3] = &unk_1E4721330;
  v38[4] = self;
  v39 = v34;
  v40 = v6;
  v41 = Mutable;
  v42 = v32;
  v27 = v32;
  v28 = Mutable;
  v29 = v6;
  v30 = v34;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Decrement reply counts"), v38);

}

- (id)muteUntilDate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unmuteDateForChat:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setMuteUntilDate:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D39970];
  v5 = a3;
  objc_msgSend(v4, "sharedList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "muteChat:untilDate:", self, v5);

}

- (IMDaemonProtocol)daemonController
{
  return (IMDaemonProtocol *)+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
}

- (id)_lastKTVerifierResultForParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_stripFZIDPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ktVerifierResultForHandleID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[IMChat _keyTransparencyVerifier](self, "_keyTransparencyVerifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_stripFZIDPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMChatCanonicalIDSIDsForAddress();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v13;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Could not find a kt verifier result for handle: %@  initializing to Pending", (uint8_t *)&v24, 0xCu);
      }

    }
    v15 = (void *)MEMORY[0x1E0DC0958];
    objc_msgSend(v10, "applicationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addApplicationPrefixForIdentifier:uri:", v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0DC0950]);
    objc_msgSend(v10, "applicationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v18, "initPendingForUri:application:", v17, v19);

    +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_stripFZIDPrefix");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setKTVerifierResult:forHandleID:", v9, v22);

  }
  return v9;
}

- (id)_ktQueue
{
  if (qword_1EE65EB28 != -1)
    dispatch_once(&qword_1EE65EB28, &unk_1E4721350);
  return (id)qword_1EE65EB20;
}

- (void)markKTFailureSeen
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isKeyTransparencyEnabled");

  if (v4)
  {
    -[IMChat _keyTransparencyVerifier](self, "_keyTransparencyVerifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat participants](self, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          -[IMChat _lastKTVerifierResultForParticipant:](self, "_lastKTVerifierResultForParticipant:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    -[IMChat _ktQueue](self, "_ktQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A20D1890;
    block[3] = &unk_1E471F668;
    v20 = v5;
    v21 = v8;
    v22 = v9;
    v16 = v9;
    v17 = v8;
    v18 = v5;
    dispatch_async(v15, block);

  }
}

- (void)ignoreKTFailure
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
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
  NSObject *v31;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeyTransparencyEnabled");

  if (v3)
  {
    -[IMChat _keyTransparencyVerifier](self, "_keyTransparencyVerifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[IMChat participants](self, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[IMChat participants](self, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v46;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(v6);
          -[IMChat _lastKTVerifierResultForParticipant:](self, "_lastKTVerifierResultForParticipant:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v38, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v7);
    }

    v44 = 0;
    objc_msgSend(v37, "ignoreFailureForResults:error:", v38, &v44);
    v33 = v44;
    if (v33)
    {
      v11 = (void *)MEMORY[0x1E0C99DE8];
      -[IMChat participants](self, "participants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      -[IMChat participants](self, "participants");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      if (v13)
      {
        v35 = *(_QWORD *)v41;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v41 != v35)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
            +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "ID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "_stripFZIDPrefix");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "idsIDInfoResultForHandleID:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "uri");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x1E0DC0958];
            objc_msgSend(v37, "applicationIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addApplicationPrefixForIdentifier:uri:", v22, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "ID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "_stripFZIDPrefix");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "ktVerifierResultForHandleID:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v15, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringWithFormat:", CFSTR("(name:%@, uri:%@, uiStatus:%lu)"), v29, v23, objc_msgSend(v27, "uiStatus"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "addObject:", v30);
            ++v14;
          }
          while (v13 != v14);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
        }
        while (v13);
      }

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v36, "componentsJoinedByString:", CFSTR("; "));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v50 = v32;
          v51 = 2112;
          v52 = v33;
          _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "IMChat_KT There was an error ignoring the KT failure for participants [%@] with error: %@", buf, 0x16u);

        }
      }

    }
    -[IMChat fetchKTStatus](self, "fetchKTStatus");

  }
}

- (unint64_t)conversationKTUIStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[IMChat participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMChat participants](self, "participants", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[IMChat _lastKTVerifierResultForParticipant:](self, "_lastKTVerifierResultForParticipant:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[IMChat _keyTransparencyVerifier](self, "_keyTransparencyVerifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "getDisplayStatusForResults:isSelfOptedIn:", v5, IMIsEnrolledInContactKeyVerification());

  return v13;
}

- (id)getParticipantsWithKTUIStatus:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IMChat participants](self, "participants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_stripFZIDPrefix");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ktVerifierResultForHandleID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "uiStatus") == a3)
          objc_msgSend(v15, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v15;
}

- (unint64_t)getKTDisplayStatusAndRelatedPeerHandles:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyTransparencyEnabled");

  if (!v6)
    return 0;
  v27 = -[IMChat conversationKTUIStatus](self, "conversationKTUIStatus");
  -[IMChat getParticipantsWithKTUIStatus:](self, "getParticipantsWithKTUIStatus:");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = IMKeyTransparencyStatusFromKTUIStatus(v27, -[IMChat isLastIncomingFinishedMessageNotiMessage](self, "isLastIncomingFinishedMessageNotiMessage") ^ 1);
  -[IMChat setLastKTStatus:](self, "setLastKTStatus:");
  if (a3 && v28)
    *a3 = objc_retainAutorelease(v28);
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = v28;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
          +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_stripFZIDPrefix");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "idsIDInfoResultForHandleID:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "uri");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "uri");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v18);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v9);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v35 = v20;
        v36 = 2112;
        v37 = v21;
        v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Received KT display status %@/IM status %@ for %@", buf, 0x20u);

      }
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Received KT display status %@/IM status %@", buf, 0x16u);

    }
  }

  return v29;
}

- (unint64_t)keyTransparencyStatusForAffectedHandles:(id *)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_getKTDisplayStatusAndRelatedPeerHandles_);
}

- (void)fetchKTStatus
{
  NSObject *v3;
  uint8_t v4[16];

  if ((IMIsEnrolledInContactKeyVerification() & 1) != 0)
  {
    -[IMChat refreshServiceForSending](self, "refreshServiceForSending");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Self is not opted in, returning early before requesting status.", v4, 2u);
      }

    }
    self->_ktStatus = 0;
    self->_lastKTStatus = 0;
  }
}

- (id)_keyTransparencyVerifier
{
  void *v2;
  void *v3;

  +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_lastKnownHybridState
{
  void *v2;
  char v3;

  -[IMChat valueForChatProperty:](self, "valueForChatProperty:", *MEMORY[0x1E0D377E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_updateLastKnownHybridState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (-[IMChat _lastKnownHybridState](self, "_lastKnownHybridState") != a3)
  {
    +[IMDaemonController sharedController](IMDaemonController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteDaemon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat guid](self, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat:updateLastKnownHybridState:", v7, v3);

  }
  return v3;
}

- (BOOL)_serviceSupportsCapability:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;

  v4 = a3;
  -[IMChat account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasSuppressionForCapability:", v4);

  if ((v6 & 1) == 0)
  {
    -[IMChat account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "service");
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend((id)v8, "supportsCapability:", v4);
    goto LABEL_12;
  }
  -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
  v7 = objc_claimAutoreleasedReturnValue();
  -[IMChat lastAddressedSIMID](self, "lastAddressedSIMID");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!(v7 | v8))
  {
    -[IMChat account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ctSubscriptionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__im_subscriptionContextForForSimID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ctSubscriptionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "__im_subscriptionContextForForSimID:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "phoneNumber");
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = v15;
LABEL_7:

  }
  objc_msgSend((id)v7, "_stripFZIDPrefix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "_appearsToBePhoneNumber"))
    IMNormalizePhoneNumber();
  else
    IMCanonicalizeFormattedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat account](self, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v19, "supportsCapability:forAlias:simID:", v4, v16, v8);

LABEL_12:
  return v17;
}

- (BOOL)supportsSendingTypingIndicators
{
  return MEMORY[0x1E0DE7D20](self, sel__serviceSupportsCapability_);
}

- (BOOL)supportsSendingReadReceipts
{
  return MEMORY[0x1E0DE7D20](self, sel__serviceSupportsCapability_);
}

- (BOOL)supportsFilteringExtensions
{
  return MEMORY[0x1E0DE7D20](self, sel__serviceSupportsCapability_);
}

- (BOOL)accountMatchesLastFinishedMessageItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[IMChat lastFinishedMessageItem](self, "lastFinishedMessageItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  return v8;
}

- (NSArray)frequentReplies
{
  return self->_frequentReplies;
}

- (void)setFrequentReplies:(id)a3
{
  objc_storeStrong((id *)&self->_frequentReplies, a3);
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (void)_setGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_guids, a3);
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (IMMessage)invitationForPendingParticipants
{
  return self->_invitationForPendingParticipants;
}

- (void)setInvitationForPendingParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_invitationForPendingParticipants, a3);
}

- (IMInlineReplyController)inlineReplyController
{
  return self->_inlineReplyController;
}

- (NSSet)mergedPinningIdentifiers
{
  return self->_mergedPinningIdentifiers;
}

- (void)setReplySuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_replySuggestions, a3);
}

- (NSData)engramID
{
  return self->_engramID;
}

- (BOOL)hasCancellableScheduledMessage
{
  return self->_hasCancellableScheduledMessage;
}

- (void)setHasCancellableScheduledMessage:(BOOL)a3
{
  self->_hasCancellableScheduledMessage = a3;
}

- (BOOL)hasSurfRequest
{
  return self->_hasSurfRequest;
}

- (void)setHasSurfRequest:(BOOL)a3
{
  self->_hasSurfRequest = a3;
}

- (unint64_t)ktStatus
{
  return self->_ktStatus;
}

- (unint64_t)pendingIncomingSatelliteMessageCount
{
  return self->_pendingIncomingSatelliteMessageCount;
}

- (void)setPendingIncomingSatelliteMessageCount:(unint64_t)a3
{
  self->_pendingIncomingSatelliteMessageCount = a3;
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_totalSatelliteMessageCount = a3;
}

- (BOOL)isDownloadingPendingSatelliteMessages
{
  return self->_downloadingPendingSatelliteMessages;
}

- (void)setRoomNameWithoutSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_roomNameWithoutSuffix, a3);
}

- (NSString)localUserIsComposing
{
  return self->_localUserIsComposing;
}

- (void)setOscarChat:(BOOL)a3
{
  self->_oscarChat = a3;
}

- (void)setLastMessageTimeStampOnLoad:(int64_t)a3
{
  self->_lastMessageTimeStampOnLoad = a3;
}

- (void)setSmsCategory:(int64_t)a3
{
  self->_smsCategory = a3;
}

- (BOOL)isRecovered
{
  return self->_recovered;
}

- (BOOL)isDeletingIncomingMessages
{
  return self->_deletingIncomingMessages;
}

- (BOOL)hasHadSuccessfulQuery
{
  return self->_hasHadSuccessfulQuery;
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)typingGUID
{
  return self->_typingGUID;
}

- (void)setTypingGUID:(id)a3
{
  objc_storeStrong((id *)&self->_typingGUID, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSMutableDictionary)participantStates
{
  return self->_participantStates;
}

- (void)setParticipantStates:(id)a3
{
  objc_storeStrong((id *)&self->_participantStates, a3);
}

- (NSMutableArray)messagesPendingJoin
{
  return self->_messagesPendingJoin;
}

- (void)setMessagesPendingJoin:(id)a3
{
  objc_storeStrong((id *)&self->_messagesPendingJoin, a3);
}

- (NSMutableDictionary)chatProperties
{
  return self->_chatProperties;
}

- (void)setChatProperties:(id)a3
{
  objc_storeStrong((id *)&self->_chatProperties, a3);
}

- (NSMutableDictionary)participantProperties
{
  return self->_participantProperties;
}

- (void)setParticipantProperties:(id)a3
{
  objc_storeStrong((id *)&self->_participantProperties, a3);
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (void)setCountOfAttachmentsNotCachedLocally:(id)a3
{
  objc_storeStrong((id *)&self->_countOfAttachmentsNotCachedLocally, a3);
}

- (NSNumber)countOfMessagesMarkedAsSpam
{
  return self->_countOfMessagesMarkedAsSpam;
}

- (void)setCountOfMessagesMarkedAsSpam:(id)a3
{
  objc_storeStrong((id *)&self->_countOfMessagesMarkedAsSpam, a3);
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
  objc_storeStrong((id *)&self->_timingCollection, a3);
}

- (void)setChatItemRules:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemRules, a3);
}

- (IMSendProgress)sendProgress
{
  return self->_sendProgress;
}

- (void)setSendProgress:(id)a3
{
  objc_storeStrong((id *)&self->_sendProgress, a3);
}

- (unint64_t)dbFailedCount
{
  return self->_dbFailedCount;
}

- (void)setDbFailedCount:(unint64_t)a3
{
  self->_dbFailedCount = a3;
}

- (unint64_t)dbUnreadCount
{
  return self->_dbUnreadCount;
}

- (void)setDbUnreadCount:(unint64_t)a3
{
  self->_dbUnreadCount = a3;
}

- (BOOL)hasBeenConfigured
{
  return self->_hasBeenConfigured;
}

- (void)setHasBeenConfigured:(BOOL)a3
{
  self->_hasBeenConfigured = a3;
}

- (BOOL)isFirstMessageInvitation
{
  return self->_isFirstMessageInvitation;
}

- (void)setIsFirstMessageInvitation:(BOOL)a3
{
  self->_isFirstMessageInvitation = a3;
}

- (BOOL)wasInvitationHandled
{
  return self->_wasInvitationHandled;
}

- (void)setWasInvitationHandled:(BOOL)a3
{
  self->_wasInvitationHandled = a3;
}

- (BOOL)didSendAFinishedMessage
{
  return self->_didSendAFinishedMessage;
}

- (void)setDidSendAFinishedMessage:(BOOL)a3
{
  self->_didSendAFinishedMessage = a3;
}

- (BOOL)isUpdatingChatItems
{
  return self->_isUpdatingChatItems;
}

- (void)setIsUpdatingChatItems:(BOOL)a3
{
  self->_isUpdatingChatItems = a3;
}

- (NSString)currentUnreadHistoryQuery
{
  return self->_currentUnreadHistoryQuery;
}

- (void)setCurrentUnreadHistoryQuery:(id)a3
{
  objc_storeStrong((id *)&self->_currentUnreadHistoryQuery, a3);
}

- (BOOL)hasEarlierMessagesToLoad
{
  return self->_hasEarlierMessagesToLoad;
}

- (void)setHasEarlierMessagesToLoad:(BOOL)a3
{
  self->_hasEarlierMessagesToLoad = a3;
}

- (BOOL)hasMoreRecentMessagesToLoad
{
  return self->_hasMoreRecentMessagesToLoad;
}

- (void)setHasMoreRecentMessagesToLoad:(BOOL)a3
{
  self->_hasMoreRecentMessagesToLoad = a3;
}

- (BOOL)isCurrentlyDownloadingPurgedAssets
{
  return self->_isCurrentlyDownloadingPurgedAssets;
}

- (void)setIsCurrentlyDownloadingPurgedAssets:(BOOL)a3
{
  self->_isCurrentlyDownloadingPurgedAssets = a3;
}

- (NSString)groupChatIdentifierUppercase
{
  return self->_groupChatIdentifierUppercase;
}

- (int64_t)hasKnownParticipantsCacheStatus
{
  return self->_hasKnownParticipantsCacheStatus;
}

- (void)setHasKnownParticipantsCacheStatus:(int64_t)a3
{
  self->_hasKnownParticipantsCacheStatus = a3;
}

- (BOOL)isUnregistered
{
  return self->_unregistered;
}

- (void)setUnregistered:(BOOL)a3
{
  self->_unregistered = a3;
}

- (NSNumber)cachedStewieSharingChat
{
  return self->_cachedStewieSharingChat;
}

- (void)setCachedStewieSharingChat:(id)a3
{
  objc_storeStrong((id *)&self->_cachedStewieSharingChat, a3);
}

- (IMHandle)cachedEUHandle
{
  return self->_cachedEUHandle;
}

- (void)setCachedEUHandle:(id)a3
{
  objc_storeStrong((id *)&self->_cachedEUHandle, a3);
}

- (unint64_t)lastKTStatus
{
  return self->_lastKTStatus;
}

- (void)setLastKTStatus:(unint64_t)a3
{
  self->_lastKTStatus = a3;
}

- (int64_t)wasDetectedAsSMSSpamCacheStatus
{
  return self->_wasDetectedAsSMSSpamCacheStatus;
}

- (void)setWasDetectedAsSMSSpamCacheStatus:(int64_t)a3
{
  self->_wasDetectedAsSMSSpamCacheStatus = a3;
}

- (BOOL)hasQueriedForSiblingChats
{
  return self->_hasQueriedForSiblingChats;
}

- (void)setHasQueriedForSiblingChats:(BOOL)a3
{
  self->_hasQueriedForSiblingChats = a3;
}

- (char)downgradeState
{
  return self->_downgradeState;
}

- (void)setDowngradeState:(char)a3
{
  self->_downgradeState = a3;
}

- (int64_t)hybridGroupState
{
  return self->_hybridGroupState;
}

- (void)setHybridGroupState:(int64_t)a3
{
  self->_hybridGroupState = a3;
}

- (void)setIgnoreDowngradeStatusUpdates:(BOOL)a3
{
  self->_ignoreDowngradeStatusUpdates = a3;
}

- (BOOL)serviceSwitchRequested
{
  return self->_serviceSwitchRequested;
}

- (void)setServiceSwitchRequested:(BOOL)a3
{
  self->_serviceSwitchRequested = a3;
}

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setForceMMS:(BOOL)a3
{
  self->_forceMMS = a3;
}

- (NSString)lastUndeliveredMessageGUIDForForcedQuery
{
  return self->_lastUndeliveredMessageGUIDForForcedQuery;
}

- (void)setLastUndeliveredMessageGUIDForForcedQuery:(id)a3
{
  objc_storeStrong((id *)&self->_lastUndeliveredMessageGUIDForForcedQuery, a3);
}

- (double)latestTypingIndicatorTimeInterval
{
  return self->_latestTypingIndicatorTimeInterval;
}

- (void)setLatestTypingIndicatorTimeInterval:(double)a3
{
  self->_latestTypingIndicatorTimeInterval = a3;
}

- (IMOrderingTools)orderingTools
{
  return self->_orderingTools;
}

- (void)setOrderingTools:(id)a3
{
  objc_storeStrong((id *)&self->_orderingTools, a3);
}

- (NSString)currentLocationGUID
{
  return self->_currentLocationGUID;
}

- (void)setCurrentLocationGUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocationGUID, a3);
}

- (NSMutableArray)showingEditHistoryForChatItemGUIDs
{
  return self->_showingEditHistoryForChatItemGUIDs;
}

- (void)setShowingEditHistoryForChatItemGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_showingEditHistoryForChatItemGUIDs, a3);
}

- (void)setCachedShouldShowReportSpam:(int64_t)a3
{
  self->_cachedShouldShowReportSpam = a3;
}

- (void)setCachedShouldShowSpam:(int64_t)a3
{
  self->_cachedShouldShowSpam = a3;
}

- (IMReasonTrackingUpdater)chatItemsUpdater
{
  return self->_chatItemsUpdater;
}

- (void)setChatItemsUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemsUpdater, a3);
}

- (BOOL)isSubscriptionSwitchParticipantAddTypeFound
{
  return self->_isSubscriptionSwitchParticipantAddTypeFound;
}

- (void)setIsSubscriptionSwitchParticipantAddTypeFound:(BOOL)a3
{
  self->_isSubscriptionSwitchParticipantAddTypeFound = a3;
}

- (IMParticipantChangeChatItem)subscriptionSwitchParticipantAddChatItem
{
  return self->_subscriptionSwitchParticipantAddChatItem;
}

- (void)setSubscriptionSwitchParticipantAddChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionSwitchParticipantAddChatItem, a3);
}

- (void)setRecoverableMessagesCount:(unint64_t)a3
{
  self->_recoverableMessagesCount = a3;
}

- (unint64_t)unreadRecoverableMessagesCount
{
  return self->_unreadRecoverableMessagesCount;
}

- (void)setUnreadRecoverableMessagesCount:(unint64_t)a3
{
  self->_unreadRecoverableMessagesCount = a3;
}

- (NSDate)earliestRecoverableMessageDeletionDate
{
  return self->_earliestRecoverableMessageDeletionDate;
}

- (void)setEarliestRecoverableMessageDeletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestRecoverableMessageDeletionDate, a3);
}

- (NSDate)latestRecoverableMessageDeletionDate
{
  return self->_latestRecoverableMessageDeletionDate;
}

- (void)setLatestRecoverableMessageDeletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestRecoverableMessageDeletionDate, a3);
}

- (BOOL)lastUsedSatelliteStatus
{
  return self->_lastUsedSatelliteStatus;
}

- (void)setLastUsedSatelliteStatus:(BOOL)a3
{
  self->_lastUsedSatelliteStatus = a3;
}

- (NSDate)lastSatelliteFetchDate
{
  return self->_lastSatelliteFetchDate;
}

- (void)setLastSatelliteFetchDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSatelliteFetchDate, a3);
}

- (BOOL)lastUsedShowTextRoadsideProviderStatus
{
  return self->_lastUsedShowTextRoadsideProviderStatus;
}

- (void)setLastUsedShowTextRoadsideProviderStatus:(BOOL)a3
{
  self->_lastUsedShowTextRoadsideProviderStatus = a3;
}

- (BOOL)lastUsedShowTextEmergencyServicesStatus
{
  return self->_lastUsedShowTextEmergencyServicesStatus;
}

- (void)setLastUsedShowTextEmergencyServicesStatus:(BOOL)a3
{
  self->_lastUsedShowTextEmergencyServicesStatus = a3;
}

- (NSDate)earliestCachedMessageDate
{
  return self->_earliestCachedMessageDate;
}

- (void)setEarliestCachedMessageDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestCachedMessageDate, a3);
}

- (BOOL)hasRefreshedServiceForSending
{
  return self->_hasRefreshedServiceForSending;
}

- (void)setHasRefreshedServiceForSending:(BOOL)a3
{
  self->_hasRefreshedServiceForSending = a3;
}

- (NSString)lastAddressedSIMID
{
  return self->_lastAddressedSIMID;
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void)setOriginalGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_originalGroupID, a3);
}

- (NSDate)lastCompletedServiceReachabilityRequestStartTime
{
  return self->_lastCompletedServiceReachabilityRequestStartTime;
}

- (void)setLastCompletedServiceReachabilityRequestStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastCompletedServiceReachabilityRequestStartTime, a3);
}

- (NSString)suggestedRepliesData
{
  return self->_suggestedRepliesData;
}

- (void)setSuggestedRepliesData:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedRepliesData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRepliesData, 0);
  objc_storeStrong((id *)&self->_lastCompletedServiceReachabilityRequestStartTime, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_storeStrong((id *)&self->_lastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_earliestCachedMessageDate, 0);
  objc_storeStrong((id *)&self->_lastSatelliteFetchDate, 0);
  objc_storeStrong((id *)&self->_latestRecoverableMessageDeletionDate, 0);
  objc_storeStrong((id *)&self->_earliestRecoverableMessageDeletionDate, 0);
  objc_storeStrong((id *)&self->_subscriptionSwitchParticipantAddChatItem, 0);
  objc_storeStrong((id *)&self->_chatItemsUpdater, 0);
  objc_storeStrong((id *)&self->_showingEditHistoryForChatItemGUIDs, 0);
  objc_storeStrong((id *)&self->_currentLocationGUID, 0);
  objc_storeStrong((id *)&self->_orderingTools, 0);
  objc_storeStrong((id *)&self->_lastUndeliveredMessageGUIDForForcedQuery, 0);
  objc_storeStrong((id *)&self->_downgradeStateUpdater, 0);
  objc_storeStrong((id *)&self->_cachedEUHandle, 0);
  objc_storeStrong((id *)&self->_cachedStewieSharingChat, 0);
  objc_storeStrong((id *)&self->_groupChatIdentifierUppercase, 0);
  objc_storeStrong((id *)&self->_currentUnreadHistoryQuery, 0);
  objc_storeStrong((id *)&self->_sendProgress, 0);
  objc_storeStrong((id *)&self->_chatItemRules, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_countOfMessagesMarkedAsSpam, 0);
  objc_storeStrong((id *)&self->_countOfAttachmentsNotCachedLocally, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_participantProperties, 0);
  objc_storeStrong((id *)&self->_chatProperties, 0);
  objc_storeStrong((id *)&self->_messagesPendingJoin, 0);
  objc_storeStrong((id *)&self->_participantStates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_typingGUID, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_localUserIsComposing, 0);
  objc_storeStrong((id *)&self->_roomNameWithoutSuffix, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_personCentricID, 0);
  objc_storeStrong((id *)&self->_replySuggestions, 0);
  objc_storeStrong((id *)&self->_mergedPinningIdentifiers, 0);
  objc_storeStrong((id *)&self->_inlineReplyController, 0);
  objc_storeStrong((id *)&self->_invitationForPendingParticipants, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_guids, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_lastAddressedHandleID, 0);
  objc_storeStrong((id *)&self->_frequentReplies, 0);
  objc_storeStrong((id *)&self->_momentSharePresentationCache, 0);
  objc_storeStrong((id *)&self->_momentShareCache, 0);
}

- (id)_privateInitWithAccount:(id)a3 style:(unsigned __int8)a4 roomName:(id)a5 messages:(id)a6 participants:(id)a7 isFiltered:(int64_t)a8 hasHadSuccessfulQuery:(BOOL)a9 isRecovered:(BOOL)a10 isDeletingIncomingMessages:(BOOL)a11
{
  uint64_t v14;
  IMChat *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v24;

  v14 = a4;
  v16 = self;
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = a7;
  v19 = a5;
  v20 = a3;
  objc_msgSend(v17, "stringGUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v24) = a11;
  LOWORD(v24) = __PAIR16__(a10, a9);
  v22 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](v16, "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", v21, v20, v14, v19, 0, 0, 0, 0, v18, a8, v24);

  return v22;
}

- (BOOL)_processSupportsHistory
{
  void *v2;
  unsigned int v3;

  -[IMChat daemonController](self, "daemonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processCapabilities");

  return ((v3 & 0x4000004) != 0) & (v3 >> 13);
}

- (unint64_t)numberOfMessagesToKeepLoaded
{
  return MEMORY[0x1E0DE7D20](self, sel_capacity);
}

- (BOOL)hasMoreMessagesToLoad
{
  return -[IMItemsController isMoreToLoad](self, "isMoreToLoad") || self->_hasEarlierMessagesToLoad;
}

- (id)loadMessagesUpToGUID:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[IMChat _processSupportsHistory](self, "_processSupportsHistory"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChat loadMessagesUpToGUID:date:limit:loadImmediately:](self, "loadMessagesUpToGUID:date:limit:loadImmediately:", v6, v7, a4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Load messages up to GUID %@ for %@ rejected, client does not have history capability", (uint8_t *)&v12, 0x16u);

      }
    }
    v8 = 0;
  }

  return v8;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[IMChat _processSupportsHistory](self, "_processSupportsHistory"))
  {
    -[IMChat loadMessagesBeforeDate:limit:loadImmediately:](self, "loadMessagesBeforeDate:limit:loadImmediately:", v6, a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Load messages before date for %@ rejected, client does not have history capability", (uint8_t *)&v11, 0xCu);

      }
    }
    v7 = 0;
  }

  return v7;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return -[IMChat _fetchMessagesUpToGUID:limit:synchronous:completion:](self, "_fetchMessagesUpToGUID:limit:synchronous:completion:", 0, a4, a5, &unk_1E4721390);
}

- (void)fetchMessagesUpToLimit:(unint64_t)a3 completion:(id)a4
{
  id v4;

  v4 = -[IMChat _fetchMessagesUpToGUID:limit:synchronous:completion:](self, "_fetchMessagesUpToGUID:limit:synchronous:completion:", 0, a3, 0, a4);
}

- (id)_fetchMessagesUpToLimit:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v5 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[IMChat _processSupportsHistory](self, "_processSupportsHistory"))
  {
    -[IMChat _fetchMessagesUpToGUID:limit:synchronous:completion:](self, "_fetchMessagesUpToGUID:limit:synchronous:completion:", 0, a3, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Load messages before date for %@ rejected, client does not have history capability", (uint8_t *)&v13, 0xCu);

      }
    }
    v9 = 0;
  }

  return v9;
}

- (id)loadMessagesUpToGUID:(id)a3 date:(id)a4 limit:(unint64_t)a5 loadImmediately:(BOOL)a6
{
  return -[IMChat _fetchMessagesUpToGUID:limit:synchronous:completion:](self, "_fetchMessagesUpToGUID:limit:synchronous:completion:", a3, a5, a6, &unk_1E47213B0);
}

- (void)fetchMessagesUpToGUID:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v5;

  v5 = -[IMChat _fetchMessagesUpToGUID:limit:synchronous:completion:](self, "_fetchMessagesUpToGUID:limit:synchronous:completion:", a3, a4, 0, a5);
}

- (id)_fetchMessagesUpToGUID:(id)a3 limit:(unint64_t)a4 synchronous:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (-[IMChat _processSupportsHistory](self, "_processSupportsHistory"))
  {
    kdebug_trace();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1A20D4198;
    v16[3] = &unk_1E47213D8;
    v16[4] = self;
    v19 = a4;
    v17 = v10;
    v20 = v7;
    v18 = v11;
    -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("HistoryLoading"), v7, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v10;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Load messages up to GUID %@ for %@ rejected, client does not have history capability", buf, 0x16u);

      }
    }
    v12 = 0;
  }

  return v12;
}

- (id)loadMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 loadImmediately:(BOOL)a6 threadIdentifier:(id)a7
{
  return -[IMChat _fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:synchronous:completion:](self, "_fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:synchronous:completion:", a3, a4, a5, a7, a6, &unk_1E47213F8);
}

- (void)fetchMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 threadIdentifier:(id)a6 completion:(id)a7
{
  id v7;

  v7 = -[IMChat _fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:synchronous:completion:](self, "_fetchMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:threadIdentifier:synchronous:completion:", a3, a4, a5, a6, 0, a7);
}

- (id)_fetchMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 threadIdentifier:(id)a6 synchronous:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  IMChat *v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v9 = a7;
  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a8;
  if (!-[IMChat _processSupportsHistory](self, "_processSupportsHistory"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v22;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Load messages for %@ rejected, client does not have history capability", buf, 0xCu);

      }
    }
    goto LABEL_18;
  }
  if (!objc_msgSend(v14, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Trying to loadMessagesBeforeAndAfterGUID with a null messageGUID. Please call loadMessagesUpToGUID if a messageGUID is not specified, Returning early", buf, 2u);
      }

    }
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  v17 = CFSTR("PagedInlineReplyHistoryLoading");
  if (!v15)
    v17 = CFSTR("PagedHistoryLoading");
  v18 = v17;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v14;
      v35 = 2048;
      v36 = a4;
      v37 = 2048;
      v38 = a5;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Begin loadMessagesBeforeAndAfterGUID: %@ numberOfMessagesBeforeGUID: %lu numberOfMessagesAfterGUID: %lu", buf, 0x20u);
    }

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1A20D4550;
  v25[3] = &unk_1E4721420;
  v30 = a4;
  v31 = a5;
  v26 = v14;
  v27 = self;
  v28 = v15;
  v32 = v9;
  v29 = v16;
  -[IMChat _performQueryWithKey:loadImmediately:block:completion:](self, "_performQueryWithKey:loadImmediately:block:completion:", v18, v9, v25, &unk_1E4721460);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v20;
}

- (void)fetchMessageHistoryForDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  IMChat *v21;
  id v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMChat guid](self, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Queueing fetchMessageHistoryForDateInterval: %@ chatGUIDs: %@", buf, 0x16u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1A20D49A0;
  v18[3] = &unk_1E47214B0;
  v19 = v6;
  v20 = v8;
  v21 = self;
  v23 = 0;
  v22 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = sub_1A20D4C74;
  v14[3] = &unk_1E47214D8;
  v15 = v19;
  v16 = v20;
  v17 = v22;
  v11 = v22;
  v12 = v20;
  v13 = v19;
  -[IMChat _performQueryWithKey:loadImmediately:block:completion:](self, "_performQueryWithKey:loadImmediately:block:completion:", CFSTR("MessageHistorySummaryLoading"), 0, v18, v14);

}

- (void)fetchOldestMessageDateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  IMChat *v15;
  id v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMChat guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Queueing fetchOldestMessageDate chatGUID: %@", buf, 0xCu);
    }

  }
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1A20D4F8C;
  v13[3] = &unk_1E4721528;
  v14 = v5;
  v15 = self;
  v17 = 0;
  v16 = v4;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = sub_1A20D5240;
  v10[3] = &unk_1E4721550;
  v11 = v14;
  v12 = v16;
  v8 = v16;
  v9 = v14;
  -[IMChat _performQueryWithKey:loadImmediately:block:completion:](self, "_performQueryWithKey:loadImmediately:block:completion:", CFSTR("OldestMessageDateLoading"), 0, v13, v10);

}

- (id)loadFrequentRepliesLimit:(unint64_t)a3 loadImmediately:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[6];
  BOOL v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[IMChat _processSupportsHistory](self, "_processSupportsHistory"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A20D54D0;
    v11[3] = &unk_1E4721578;
    v11[4] = self;
    v11[5] = a3;
    v12 = v4;
    -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("FrequentRepliesLoading"), v4, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Load frequent replies for %@ rejected, client does not have history capability", buf, 0xCu);

      }
    }
    v7 = 0;
  }
  return v7;
}

- (id)loadUnreadMessagesWithLimit:(unint64_t)a3 fallbackToMessagesUpToGUID:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[IMChat _processSupportsHistory](self, "_processSupportsHistory"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A20D56AC;
    v11[3] = &unk_1E47215A0;
    v11[4] = self;
    v13 = a3;
    v12 = v6;
    -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("UnreadLoading"), 1, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMChat guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Load unread messages for %@ rejected, client does not have history capability", buf, 0xCu);

      }
    }
    v7 = 0;
  }

  return v7;
}

- (void)_setAttachments:(id)a3
{
  NSArray *v4;
  NSArray *attachments;

  if (self->_attachments != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    attachments = self->_attachments;
    self->_attachments = v4;

  }
}

- (void)_setCountOfMessagesMarkedAsSpam:(id)a3
{
  NSNumber *v4;
  NSNumber *countOfMessagesMarkedAsSpam;

  if (self->_countOfMessagesMarkedAsSpam != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    countOfMessagesMarkedAsSpam = self->_countOfMessagesMarkedAsSpam;
    self->_countOfMessagesMarkedAsSpam = v4;

  }
}

- (void)_setCountOfAttachmentsNotCachedLocally:(id)a3
{
  id v4;
  BOOL v5;
  NSNumber *v6;
  NSNumber *countOfAttachmentsNotCachedLocally;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[NSNumber isEqualToNumber:](self->_countOfAttachmentsNotCachedLocally, "isEqualToNumber:", v4);
    v4 = v8;
    if (!v5)
    {
      v6 = (NSNumber *)objc_msgSend(v8, "copy");
      countOfAttachmentsNotCachedLocally = self->_countOfAttachmentsNotCachedLocally;
      self->_countOfAttachmentsNotCachedLocally = v6;

      v4 = v8;
    }
  }

}

- (void)_setIsDownloadingPurgedAssets:(BOOL)a3
{
  self->_isCurrentlyDownloadingPurgedAssets = a3;
}

- (void)loadAttachments:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];

  v7 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A20D58DC;
  v8[3] = &unk_1E4720F70;
  v8[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A20D593C;
  v6[3] = &unk_1E4721550;
  v6[4] = self;
  v4 = v7;
  v5 = -[IMChat _performQueryWithKey:loadImmediately:block:completion:](self, "_performQueryWithKey:loadImmediately:block:completion:", CFSTR("LoadAttachmentsAsync"), 0, v8, v6);

}

- (BOOL)isCurrentlyDownloadingPurgedAttachments
{
  id v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A20D5A78;
  v5[3] = &unk_1E4720F70;
  v5[4] = self;
  v3 = -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("IsCurrentlyDownloadingPurgedAttachments"), 1, v5);
  return self->_isCurrentlyDownloadingPurgedAssets;
}

- (void)fetchIsCurrentlyDownloadingPurgedAttachments:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];

  v7 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A20D5B88;
  v8[3] = &unk_1E4720F70;
  v8[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A20D5BE8;
  v6[3] = &unk_1E47215C8;
  v6[4] = self;
  v4 = v7;
  v5 = -[IMChat _performQueryWithKey:loadImmediately:block:completion:](self, "_performQueryWithKey:loadImmediately:block:completion:", CFSTR("IsCurrentlyDownloadingPurgedAttachments"), 0, v8, v6);

}

- (void)deleteTransfers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMChat chatItems](self, "chatItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat _deleteTransfersWithGUIDs:fromChatItems:](self, "_deleteTransfersWithGUIDs:fromChatItems:", v4, v5);

}

- (void)deleteChatItemsWithTransferGUIDs:(id)a3 fromMessageItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "_refreshContextWithAccountHandles");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat chatItemsForItems:](self, "chatItemsForItems:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat _deleteTransfersWithGUIDs:fromChatItems:](self, "_deleteTransfersWithGUIDs:fromChatItems:", v7, v9);
}

- (void)_deleteTransfersWithGUIDs:(id)a3 fromChatItems:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  void *v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v5 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v27;
      v49 = 2112;
      v50 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Delete transfer guids: %@ from chatItems: %@", buf, 0x16u);
    }

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v27);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v32);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v9, "aggregateAttachmentParts");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v45 = v9;
            v11 = (void *)MEMORY[0x1E0C99D20];
            v12 = v9;
            objc_msgSend(v11, "arrayWithObjects:count:", &v45, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = sub_1A20D61B8;
          v37[3] = &unk_1E47215F0;
          v38 = v7;
          v14 = v13;
          v39 = v14;
          objc_msgSend(v10, "enumerateObjectsUsingBlock:", v37);
          v15 = objc_msgSend(v10, "count");
          if (v15 == objc_msgSend(v14, "count"))
            objc_msgSend(v8, "addObject:", v9);
          else
            objc_msgSend(v8, "addObjectsFromArray:", v14);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "visibleAssociatedMessageChatItems");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "count"))
          {
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            v16 = v31;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v34;
              do
              {
                v19 = 0;
                do
                {
                  if (*(_QWORD *)v34 != v18)
                    objc_enumerationMutation(v16);
                  v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v21 = v20;
                    objc_msgSend(v21, "transferGUID");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v7, "containsObject:", v22);

                    if (v23)
                    {
                      objc_msgSend(v21, "transferGUID");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "removeObject:", v24);

                      objc_msgSend(v8, "addObject:", v21);
                    }

                  }
                  ++v19;
                }
                while (v17 != v19);
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
              }
              while (v17);
            }

          }
        }
        ++v32;
      }
      while (v32 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v30);
  }

  -[IMChat daemonController](self, "daemonController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fileTransfersRecoverablyDeleted:", v7);

  -[IMChat deleteChatItems:fromChatItems:](self, "deleteChatItems:fromChatItems:", v8, obj);
}

- (void)watermarkInForScrutinyMode
{
  unint64_t v3;
  void *v4;
  id v5;

  if ((sub_1A20F18A8() & 1) == 0)
  {
    v3 = -[IMChat scrutinyModeAttemptCount](self, "scrutinyModeAttemptCount");
    -[IMChat _renderingDataDictionary](self, "_renderingDataDictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 + 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("acnt"));

    -[IMChat _setRenderingDataDictionary:](self, "_setRenderingDataDictionary:", v5);
  }
}

- (unint64_t)scrutinyModeAttemptCount
{
  void *Mutable;
  void *v3;
  unint64_t v4;

  -[IMChat _renderingDataDictionary](self, "_renderingDataDictionary");
  Mutable = (void *)objc_claimAutoreleasedReturnValue();
  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(Mutable, "objectForKey:", CFSTR("acnt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)_serverBagPreventsScrutinyMode
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("disableScrutinyMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = CFSTR("YES");
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Server has disabled scrutiny mode %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4;
}

- (BOOL)isInScrutinyMode
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[IMChat _serverBagPreventsScrutinyMode](self, "_serverBagPreventsScrutinyMode") || (sub_1A20F18A8() & 1) != 0)
    return 0;
  v4 = -[IMChat scrutinyModeAttemptCount](self, "scrutinyModeAttemptCount");
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v4 >= 4)
      -[IMChat clearScrutinyMode](self, "clearScrutinyMode");
    return 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[IMChat chatIdentifier](self, "chatIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = CFSTR("YES");
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "isInScrutinyModeForAttemptCount chat %@ result %@", (uint8_t *)&v7, 0x16u);

    }
  }
  return 1;
}

- (void)watermarkOutForScrutinyMode
{
  id v3;

  if ((sub_1A20F18A8() & 1) == 0)
  {
    -[IMChat _renderingDataDictionary](self, "_renderingDataDictionary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", &unk_1E475ECA0, CFSTR("acnt"));
    -[IMChat _setRenderingDataDictionary:](self, "_setRenderingDataDictionary:", v3);

  }
}

+ (void)storeGUIDInAttemptingListInScrutinyMode:(id)a3
{
  IMSetDomainValueForKey();
}

+ (void)removeGUIDInAttemptingListInScrutinyMode:(id)a3
{
  IMSetDomainValueForKey();
}

- (void)clearScrutinyMode
{
  id v3;

  -[IMChat _setRenderingDataDictionary:](self, "_setRenderingDataDictionary:", 0);
  -[IMChat chatScrutinyController](self, "chatScrutinyController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranscriptRenderingMetadata:forChatIdentifier:", 0, 0);

}

- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5
{
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Chat Items need update"), &unk_1E471B880, a5);
}

- (NSArray)chatItems
{
  IMChatItemRules *chatItemRules;
  void *v4;
  IMChatItemRules *v5;
  IMChatItemRules *v6;
  void *v7;
  IMChatItemRules *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  chatItemRules = self->_chatItemRules;
  if (!chatItemRules)
  {
    objc_msgSend(MEMORY[0x1E0D36AE8], "IMCoreSetupTimingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTimingForKey:", CFSTR("IMCoreSetup: Generate chat items"));
    v5 = (IMChatItemRules *)objc_msgSend(objc_alloc(+[IMChat chatItemRulesClass](IMChat, "chatItemRulesClass")), "_initWithChat:", self);
    v6 = self->_chatItemRules;
    self->_chatItemRules = v5;

    -[IMItemsController _items](self, "_items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_chatItemRules;
    -[IMChatItemRules _chatItems](v8, "_chatItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _IMChatItemsReplaceWithChatItemsForItems(v9, v8, v7);
    -[IMChatItemRules _didProcessChatItems:](v8, "_didProcessChatItems:", v9);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315394;
        v14 = "-[IMChat(IMChatItem) chatItems]";
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "%s Configuring chatItemRules and chatItems, count: %@", (uint8_t *)&v13, 0x16u);

      }
    }
    objc_msgSend(v4, "stopTimingForKey:", CFSTR("IMCoreSetup: Generate chat items"));

    chatItemRules = self->_chatItemRules;
  }
  -[IMChatItemRules _chatItems](chatItemRules, "_chatItems");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)cleanupChatItems
{
  IMChatItemRules *chatItemRules;

  chatItemRules = self->_chatItemRules;
  self->_chatItemRules = 0;

}

- (BOOL)wantsSenderBlackholeWarning
{
  unint64_t senderBlackholeWarningStatus;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (self)
  {
    senderBlackholeWarningStatus = self->_senderBlackholeWarningStatus;
    if (senderBlackholeWarningStatus)
      return senderBlackholeWarningStatus == 2;
  }
  if (-[IMChat receivedResponseForChat](self, "receivedResponseForChat"))
  {
    senderBlackholeWarningStatus = 1;
  }
  else
  {
    -[IMChat lastAddressedHandleID](self, "lastAddressedHandleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4 || !objc_msgSend(v4, "length"))
    {
      -[IMChat account](self, "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "strippedLogin");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    -[IMChat recipient](self, "recipient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = objc_msgSend(MEMORY[0x1E0D39AF8], "shouldShowSMSWarningForSender:forRecipient:withConversationHistory:", v5, v9, 0);
    senderBlackholeWarningStatus = 1;
    if ((_DWORD)v8)
      senderBlackholeWarningStatus = 2;
  }
  if (self)
  {
    self->_senderBlackholeWarningStatus = senderBlackholeWarningStatus;
    return senderBlackholeWarningStatus == 2;
  }
  return 0;
}

- (void)beginHoldingChatItemsUpdatesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[IMChat guid](self, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Chat %@ will hold chat item updates for reason: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[IMReasonTrackingUpdater beginHoldingUpdatesForReason:](self->_chatItemsUpdater, "beginHoldingUpdatesForReason:", v4);

}

- (void)endHoldingChatItemsUpdatesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  IMReasonTrackingUpdater *chatItemsUpdater;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  IMReasonTrackingUpdater *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[IMChat guid](self, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2114;
    v14 = (uint64_t)v4;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Chat %@ will end holding chat item updates for reason: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[IMReasonTrackingUpdater endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:](self->_chatItemsUpdater, "endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", v4, 1);
  v7 = -[IMReasonTrackingUpdater activeUpdaterHoldsCount](self->_chatItemsUpdater, "activeUpdaterHoldsCount");
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[IMChat guid](self, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    chatItemsUpdater = self->_chatItemsUpdater;
    v11 = 138543874;
    v12 = v9;
    v13 = 2050;
    v14 = v7;
    v15 = 2112;
    v16 = chatItemsUpdater;
    _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "--> Chat %{public}@ has %{public}ld remaining holds: %@", (uint8_t *)&v11, 0x20u);

  }
}

- (BOOL)isHoldingChatItemsUpdatesForReason:(id)a3
{
  return MEMORY[0x1E0DE7D20](self->_chatItemsUpdater, sel_isHoldingUpdatesForReason_);
}

- (void)endHoldingChatItemsUpdatesForAllReasons
{
  NSObject *v3;

  if (-[IMReasonTrackingUpdater isHoldingUpdates](self->_chatItemsUpdater, "isHoldingUpdates"))
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1A2197A08(self, v3);

    -[IMReasonTrackingUpdater endHoldingUpdatesForAllReasonsWithPotentialUpdateDeferred:](self->_chatItemsUpdater, "endHoldingUpdatesForAllReasonsWithPotentialUpdateDeferred:", 1);
  }
}

- (void)updateChatItemsSynchronouslyIfAsyncUpdateIsPending
{
  MEMORY[0x1E0DE7D20](self->_chatItemsUpdater, sel_updateImmediatelyIfNeeded);
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__updateChatItemsWithReason_block_shouldPost_);
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4 shouldPost:(BOOL)a5
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  IMChat *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  IMChat *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  IMChat *v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  IMChat *v45;
  void *v46;
  char v47;
  NSObject *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  IMChat *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  IMChat *v73;
  _BOOL4 v74;
  unint64_t v75;
  IMChat *v76;
  os_signpost_id_t spid;
  NSObject *v78;
  id v79;
  IMChat *v80;
  void (**v81)(void);
  IMChat *v82;
  IMChatItemRules *v83;
  void *v84;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  uint8_t v94[128];
  uint8_t buf[4];
  IMChat *v96;
  __int16 v97;
  id v98;
  uint64_t v99;

  v74 = a5;
  v99 = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v81 = (void (**)(void))a4;
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v6);

  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  spid = v9;
  v75 = v9 - 1;
  if (v9 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v13 = v11;
  }
  else
  {
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "updateChatItemsWithReason_all", ", buf, 2u);
    }

    v12 = v11;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "updateChatItemsWithReason_beforePosting", ", buf, 2u);
    }
  }
  v78 = v11;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[IMChat guid](self, "guid");
      v15 = (IMChat *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v96 = v15;
      v97 = 2112;
      v98 = v79;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Update chat items (chatGUID: %@), reason: %@", buf, 0x16u);

    }
  }
  +[IMChat stateCaptureRecents](IMChat, "stateCaptureRecents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "promoteRecentObject:", self);

  -[IMChat _validateChatRegistrationWithRegistry](self, "_validateChatRegistrationWithRegistry");
  v83 = self->_chatItemRules;
  if (self->_isUpdatingChatItems)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Update already in progress, executing update block", buf, 2u);
      }

    }
    v81[2]();
    goto LABEL_110;
  }
  self->_isUpdatingChatItems = 1;
  v81[2]();
  -[IMChat inlineReplyController](self, "inlineReplyController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateChatItemsIfNeeded");

  -[IMReasonTrackingUpdater cancelAllPendingDeferredUpdates](self->_chatItemsUpdater, "cancelAllPendingDeferredUpdates");
  self->_isUpdatingChatItems = 0;
  if (v83)
  {
    -[IMItemsController _items](self, "_items");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v72, "count"));
        v20 = (IMChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v96 = v20;
        _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "\tIMItem count = %@", buf, 0xCu);

      }
    }
    -[IMChatItemRules _chatItems](v83, "_chatItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    _IMChatItemsReplaceWithChatItemsForItems(v21, v83, v72);
    -[IMChatItemRules _didProcessChatItems:](v83, "_didProcessChatItems:", v21);
    if (v22)
    {
      v23 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v84 = v23;

    if (v21)
    {
      v26 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;

    objc_msgSend(v27, "differenceFromArray:", v84);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0;
    v93 = 0;
    IMIndexesFromOrderedCollectionDifference(v71, &v93, &v92);
    v76 = (IMChat *)v93;
    v73 = (IMChat *)v92;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[IMChat count](v76, "count"))
    {
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = sub_1A20D7E60;
      v90[3] = &unk_1E4721618;
      v91 = v70;
      objc_msgSend(v27, "enumerateObjectsAtIndexes:options:usingBlock:", v76, 0, v90);

    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v80 = (IMChat *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v82 = (IMChat *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v84, "count"));
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v27, "count"));
    objc_msgSend(v28, "removeIndexes:", v73);
    objc_msgSend(v29, "removeIndexes:", v76);
    v30 = objc_msgSend(v28, "firstIndex");
    v31 = objc_msgSend(v29, "firstIndex");
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = v31;
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        do
        {
          objc_msgSend(v84, "objectAtIndex:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndex:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33 != v34)
          {
            -[IMChat addIndex:](v82, "addIndex:", v32);
            objc_msgSend(v33, "_timeAdded");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "_setTimeAdded:", v35);

          }
          if (-[IMChatItemRules _shouldReloadChatItem:oldChatItem:](self->_chatItemRules, "_shouldReloadChatItem:oldChatItem:", v34, v33))-[IMChat addIndex:](v80, "addIndex:", v32);
          v30 = objc_msgSend(v28, "indexGreaterThanIndex:", v30);
          v32 = objc_msgSend(v29, "indexGreaterThanIndex:", v32);

        }
        while (v30 != 0x7FFFFFFFFFFFFFFFLL && v32 != 0x7FFFFFFFFFFFFFFFLL);
      }
    }

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v36 = v27;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    if (v37)
    {
      v38 = 0;
      v39 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v87 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "_timeStale");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v41)
          {
            objc_msgSend(v41, "earlierDate:", v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43 == v42;

            if (v44)
            {
              v45 = v42;

              v38 = v45;
            }
          }

        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      }
      while (v37);

      if (v38)
      {
        -[IMChatItemRules _nextStaleTime](v83, "_nextStaleTime");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[IMChat isEqualToDate:](v38, "isEqualToDate:", v46);

        if ((v47 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v96 = v38;
              _os_log_impl(&dword_1A1FF4000, v48, OS_LOG_TYPE_INFO, "\tSchedule _replaceStaleChatItems for nextStaleTime:%@", buf, 0xCu);
            }

          }
          -[IMChatItemRules _setNextStaleTime:](v83, "_setNextStaleTime:", v38);
          -[IMChat timeIntervalSinceReferenceDate](v38, "timeIntervalSinceReferenceDate");
          v50 = v49;
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v52 = v50 - v51;
          v53 = 0.0;
          if (v52 > 0.0)
          {
            -[IMChat timeIntervalSinceReferenceDate](v38, "timeIntervalSinceReferenceDate");
            v55 = v54;
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v53 = v55 - v56;
          }
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__replaceStaleChatItems, 0);
          -[IMChat performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__replaceStaleChatItems, 0, v53);
        }
      }
    }
    else
    {

      v38 = 0;
    }
    if (-[IMChat count](v73, "count")
      || -[IMChat count](v76, "count")
      || -[IMChat count](v80, "count")
      || -[IMChat count](v82, "count"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          -[IMChat guid](self, "guid");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v96 = self;
          v97 = 2112;
          v98 = v58;
          _os_log_impl(&dword_1A1FF4000, v57, OS_LOG_TYPE_INFO, "\tchat: %@, guid: %@", buf, 0x16u);

        }
      }
      if (-[IMChat count](v76, "count") && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v76;
          _os_log_impl(&dword_1A1FF4000, v59, OS_LOG_TYPE_INFO, "\tinserted: %@", buf, 0xCu);
        }

      }
      if (-[IMChat count](v73, "count") && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v73;
          _os_log_impl(&dword_1A1FF4000, v60, OS_LOG_TYPE_INFO, "\tremoved: %@", buf, 0xCu);
        }

      }
      if (-[IMChat count](v80, "count") && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v80;
          _os_log_impl(&dword_1A1FF4000, v61, OS_LOG_TYPE_INFO, "\treload: %@", buf, 0xCu);
        }

      }
      if (-[IMChat count](v82, "count") && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v82;
          _os_log_impl(&dword_1A1FF4000, v62, OS_LOG_TYPE_INFO, "\tregenerate: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v84, "count"));
          v64 = (IMChat *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v96 = v64;
          v97 = 2112;
          v98 = v65;
          _os_log_impl(&dword_1A1FF4000, v63, OS_LOG_TYPE_INFO, "\toldChatItems: %@, newChatItems: %@", buf, 0x16u);

        }
      }
      v66 = v78;
      v67 = v66;
      if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v67, OS_SIGNPOST_INTERVAL_END, spid, "updateChatItemsWithReason_beforePosting", ", buf, 2u);
      }

      if (v74)
        -[IMChat _postIMChatItemsDidChangeNotificationWithInserted:removed:reload:regenerate:oldChatItems:newChatItems:](self, "_postIMChatItemsDidChangeNotificationWithInserted:removed:reload:regenerate:oldChatItems:newChatItems:", v76, v73, v80, v82, v84, v36);
      v68 = v67;
      v69 = v68;
      if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v69, OS_SIGNPOST_INTERVAL_END, spid, "updateChatItemsWithReason_all", ", buf, 2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_109;
      OSLogHandleForIMFoundationCategory();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v69, OS_LOG_TYPE_INFO, "\tDon't post update, no significant updates to chatItems.", buf, 2u);
      }
    }

LABEL_109:
    goto LABEL_110;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "ChatItem Rules undefined", buf, 2u);
    }

  }
  if (v74)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "Posting nil update for compatiblity.", buf, 2u);
      }

    }
    -[IMChat _postIMChatItemsDidChangeNotificationWithInserted:removed:reload:regenerate:oldChatItems:newChatItems:](self, "_postIMChatItemsDidChangeNotificationWithInserted:removed:reload:regenerate:oldChatItems:newChatItems:", 0, 0, 0, 0, 0, 0);
  }
LABEL_110:

}

- (void)_replaceStaleChatItems
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "(IMChat) _replaceStaleChatItems", buf, 2u);
    }

  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[IMChat chatItems](self, "chatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "_timeStale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v13 = v12;
          objc_msgSend(v10, "timeIntervalSinceReferenceDate");
          v15 = v13 < v14;

          if (!v15)
          {
            objc_msgSend(v9, "_item");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v5 == v16)
            {
              v17 = v5;
            }
            else
            {
              v17 = v16;

              v5 = (void *)objc_msgSend(v17, "_copy");
              objc_msgSend(v22, "addObject:", v5);
            }

            v5 = v17;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v22;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v18);
        -[IMChat _handleItem:](self, "_handleItem:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v19);
  }

  -[IMChatItemRules _setNextStaleTime:](self->_chatItemRules, "_setNextStaleTime:", 0);
}

- (id)_getDeleteChatItemMap:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  id obj;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D36A70]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    *(_QWORD *)&v5 = 138412290;
    v19 = v5;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v7, "canDelete", v19))
        {
          objc_msgSend(v7, "_item");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "guid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "pushObject:forKey:", v7, v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "visibleAssociatedMessageChatItems");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "count"))
            {
              v26 = 0u;
              v27 = 0u;
              v24 = 0u;
              v25 = 0u;
              v10 = v21;
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
              if (v11)
              {
                v12 = *(_QWORD *)v25;
                do
                {
                  for (j = 0; j != v11; ++j)
                  {
                    if (*(_QWORD *)v25 != v12)
                      objc_enumerationMutation(v10);
                    v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                    if (objc_msgSend(v14, "canDelete"))
                    {
                      objc_msgSend(v14, "_item");
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v15, "guid");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v4, "pushObject:forKey:", v14, v16);
                    }
                  }
                  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
                }
                while (v11);
              }

            }
          }

        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v33 = v7;
            _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Request to delete chatItem %@ which can't be deleted", buf, 0xCu);
          }

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v23);
  }

  return v4;
}

- (id)_getMessageChatItemMap:(id)a3 withDeleteMap:(id)a4 andAllChatItems:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id obj;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0D36A70]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v29)
  {
    v9 = *(_QWORD *)v35;
    v26 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v11, "canDelete", v26))
        {
          objc_msgSend(v11, "_parentItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "peekObjectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v8, "pushObject:forKey:", v11, v13);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "visibleAssociatedMessageChatItems");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v28 = v15;
            v16 = v15;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v31 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                  if (objc_msgSend(v21, "canDelete"))
                  {
                    objc_msgSend(v21, "_parentItem");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "guid");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v6, "peekObjectForKey:", v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v24)
                      objc_msgSend(v8, "pushObject:forKey:", v21, v23);

                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v18);
            }

            v9 = v26;
            v15 = v28;
          }

        }
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v29);
  }

  return v8;
}

- (void)deleteChatItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMChat chatItems](self, "chatItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat deleteChatItems:fromChatItems:](self, "deleteChatItems:fromChatItems:", v4, v5);

}

- (void)deleteChatItems:(id)a3 fromChatItems:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v15 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Processing %lu chat items for deletion", buf, 0xCu);
    }

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A20D88A0;
  v11[3] = &unk_1E471F668;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Delete chat items"), v11);

}

- (void)deleteIMMessageItems:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Delete message items: %@", buf, 0xCu);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A20D9554;
  v7[3] = &unk_1E471E7C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Delete message items"), v7);

}

- (void)markChatItemAsSaved:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  IMChat *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "expireState") <= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Mark chat item as saved: %@", buf, 0xCu);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_chat:sendSavedReceiptForMessage:", self, v5);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1A20D990C;
    v8[3] = &unk_1E471E7C8;
    v9 = v5;
    v10 = self;
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Mark as saved"), v8);

  }
}

- (void)markChatItemAsNotifyRecipient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  IMChat *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Mark chat item as notify recipient: %@", buf, 0xCu);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_chat:sendNotifyRecipientCommandForMessage:", self, v5);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1A20D9AD4;
    v8[3] = &unk_1E471E7C8;
    v9 = v5;
    v10 = self;
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Mark as notify recipient"), v8);

  }
}

- (void)setSelectedIndexOnCarouselChatItem:(id)a3 selectedIndex:(int64_t)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  IMChat *v10;
  int64_t v11;

  objc_msgSend(a3, "_item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A20D9BB4;
  v8[3] = &unk_1E4721688;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Set selected rich card index"), v8);

}

- (void)markChatItemAsPlayed:(id)a3
{
  id v4;

  objc_msgSend(a3, "_item");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat _markItemAsPlayed:](self, "_markItemAsPlayed:", v4);

}

- (void)_markItemAsPlayed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  IMChat *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "isPlayed") & 1) == 0
    && (objc_msgSend(v4, "isFromMe") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Mark chat item as played: %@", buf, 0xCu);
      }

    }
    -[IMChat chatRegistry](self, "chatRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_chat:sendPlayedReceiptForMessage:", self, v4);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1A20D9DF4;
    v7[3] = &unk_1E471E7C8;
    v8 = v4;
    v9 = self;
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Mark as played"), v7);

  }
}

- (void)markChatItemAsPlayedExpressiveSend:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  IMChat *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "timeExpressiveSendPlayed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v4;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Mark chat item as having played expressive send: %@", buf, 0xCu);
        }

      }
      -[IMChat chatRegistry](self, "chatRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_chat:setPlayedExpressiveSendForMessage:", self, v5);

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = sub_1A20DA028;
      v9[3] = &unk_1E471E7C8;
      v10 = v5;
      v11 = self;
      -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Mark as played expressive send"), v9);

    }
  }

}

- (NSArray)replySuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IMChat lastFinishedMessage](self, "lastFinishedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFromMe") && !objc_msgSend(v3, "isAssociatedMessage"))
  {
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[IMChat lastMessage](self, "lastMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isFromMe") && !objc_msgSend(v3, "isAssociatedMessage"))
    {
      v12 = (NSArray *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[IMChat chatItems](self, "chatItems", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messages");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reverseObjectEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v11, "isAssociatedMessageItem") & 1) == 0)
            {
              objc_msgSend(v11, "message");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_15;
            }
          }
          v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_15:

      if ((objc_msgSend(v8, "isFromMe") & 1) != 0)
        v12 = (NSArray *)MEMORY[0x1E0C9AA60];
      else
        v12 = self->_replySuggestions;

    }
  }

  return v12;
}

- (BOOL)hasCommSafetySensitiveMessage
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[IMItemsController _items](self, "_items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v3 = *(_QWORD *)v24;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v3)
          objc_enumerationMutation(v2);
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v5, "fileTransferGUIDs", v17);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
              +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "transferForGUID:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "commSafetySensitive");

              if ((unint64_t)(v14 - 3) > 0xFFFFFFFFFFFFFFFDLL)
              {

                v15 = 1;
                goto LABEL_19;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v8)
              continue;
            break;
          }
        }

        v3 = v17;
      }
      v15 = 0;
      v18 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (BOOL)isCommSafetySensitiveMessageRecent
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[IMItemsController _items](self, "_items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v4 = *(_QWORD *)v26;
    v18 = *(_QWORD *)v26;
    v19 = 0;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v4)
        objc_enumerationMutation(v3);
      v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "isFromMe"))
        {
          if ((unint64_t)++v19 > 2)
            break;
        }
      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v6, "fileTransferGUIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "transferForGUID:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "commSafetySensitive");

            if ((unint64_t)(v15 - 3) > 0xFFFFFFFFFFFFFFFDLL)
            {

              v16 = 1;
              goto LABEL_22;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v9)
            continue;
          break;
        }
      }

      ++v5;
      v4 = v18;
      if (v5 == v20)
      {
        v16 = 0;
        v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v20)
          goto LABEL_3;
        goto LABEL_22;
      }
    }
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (BOOL)allParticipantsBlocked
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D396F0], "sharedBlockList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMChat participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v17;
    v8 = 1;
    *(_QWORD *)&v6 = 138412546;
    v15 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "ID", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "addressIsBlocked:", v10);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v13 = CFSTR("NO");
            if (v11)
              v13 = CFSTR("YES");
            v21 = v10;
            v22 = 2112;
            v23 = v13;
            _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Participant %@ is blocked %@", buf, 0x16u);
          }

        }
        v8 &= v11;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)updateCommSafety:(int64_t)a3 forChatItem:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChat updateCommSafety:forChatItems:parentChatItem:](self, "updateCommSafety:forChatItems:parentChatItem:", a3, v8, 0, v9, v10);
}

- (void)updateCommSafety:(int64_t)a3 forChatItems:(id)a4
{
  -[IMChat updateCommSafety:forChatItems:parentChatItem:](self, "updateCommSafety:forChatItems:parentChatItem:", a3, a4, 0);
}

- (void)updateCommSafety:(int64_t)a3 forChatItems:(id)a4 parentChatItem:(id)a5
{
  id v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  IMChat *v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  IMChat *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v22 = self;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v23 = a5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsCommunicationSafety", v22))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v41 = v9;
              v42 = 2112;
              v43 = v11;
              _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Mark chat item %@ for CommSafety: %@", buf, 0x16u);

            }
          }
          objc_msgSend(v9, "setNeedsReloadForTransferStatusChangeWithType:", 1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v9;
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(v12, "acknowledgments");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v32 != v15)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "commSafetyTransferGUID");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setCommSafetySensitiveForTransfer:value:", v17, a3);

                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v14);
            }
          }
          else
          {
            +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "commSafetyTransferGUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setCommSafetySensitiveForTransfer:value:", v13, a3);
          }

        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v26);
  }

  v19 = v23;
  if (v23)
  {
    objc_msgSend(v23, "setNeedsReloadForTransferStatusChangeWithType:", 1);
    v19 = v23;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1A20DACE4;
  v27[3] = &unk_1E471F668;
  v28 = obj;
  v29 = v22;
  v30 = v19;
  v20 = v19;
  v21 = obj;
  -[IMChat _updateChatItemsWithReason:block:](v22, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Update communication safety flag"), v27);

}

- (id)_renderingDataDictionary
{
  void *v3;
  void *v4;
  void *v5;
  CFMutableDictionaryRef Mutable;

  -[IMChat chatScrutinyController](self, "chatScrutinyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat chatIdentifier](self, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptRenderingMetadataForChatIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (CFMutableDictionaryRef)objc_msgSend(v5, "mutableCopy");

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  return Mutable;
}

- (void)_setRenderingDataDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IMChat chatScrutinyController](self, "chatScrutinyController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChat chatIdentifier](self, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranscriptRenderingMetadata:forChatIdentifier:", v4, v5);

}

- (void)stickerRepositionedForAssociatedChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "setNeedsReloadForTransferStatusChangeWithType:", 2);
  objc_msgSend(v4, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v5, "_copyWithFlags:", objc_msgSend(v6, "flags"));
  v7 = -[IMChatItem _initWithItem:]([IMChatItem alloc], "_initWithItem:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setNeedsReloadForTransferStatusChangeWithType:", 0);
  -[IMChat _handleItem:](self, "_handleItem:", v8);

}

- (id)chatItemsForItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        _IMAppendChatItemsForItem(v5, self->_chatItemRules, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(v5, "copy", (_QWORD)v13);
  return v11;
}

- (id)allMessagesToReportAsSpam
{
  void *v3;
  void *v4;

  -[IMChat chatItems](self, "chatItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat messagesToReportAsSpamFromChatItems:](self, "messagesToReportAsSpamFromChatItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)messagesToReportAsSpamFromChatItems:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "__imItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "fileTransferGUIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (!v12)
            objc_msgSend(v4, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (void)_configureLocationShareItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  -[IMChat account](self, "account");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imHandleWithID:alreadyCanonical:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "handleIsSharingLocationWithMe:", v6);

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "handleIsFollowingMyLocation:", v6);

  objc_msgSend(v4, "setExpired:", v8 ^ 1u);
  objc_msgSend(v4, "setActionable:", v10 ^ 1u);

}

- (void)_updateLocationShareItemsForSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMItemsController _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v6, "imHandleWithID:alreadyCanonical:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v8, "handleIsSharingLocationWithMe:", v7);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v14, "type") == 4)
        {
          v15 = v14;
          objc_msgSend(v15, "sender");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "imHandleWithID:alreadyCanonical:", v16, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v7, "isEqual:", v17) && v26 == objc_msgSend(v15, "expired"))
            objc_msgSend(v25, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v25;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copy");
        objc_msgSend(v23, "setExpired:", v26 ^ 1u);
        -[IMChat _handleItem:](self, "_handleItem:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

}

- (NSSet)fmfHandles
{
  void *v3;
  void *v4;
  void *v5;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findMyHandlesForChat:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__im_fmfHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSSet)findMyHandles
{
  void *v3;
  void *v4;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findMyHandlesForChat:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)markAllLocationShareItemsAsUnactionable
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1A20DB7FC;
  v2[3] = &unk_1E471E348;
  v2[4] = self;
  -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("(IMChat) Mark as unactionable"), v2);
}

- (NSSet)allSiblingFMFHandles
{
  void *v3;
  void *v4;
  void *v5;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allSiblingFindMyHandlesForChat:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__im_fmfHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSSet)allSiblingFindMyHandles
{
  void *v3;
  void *v4;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allSiblingFindMyHandlesForChat:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)hasRecipientsFollowingLocation
{
  void *v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "chatHasParticipantsFollowingMyLocation:", self);

  return (char)self;
}

- (BOOL)allRecipientsFollowingLocation
{
  void *v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "allChatParticipantsFollowingMyLocation:", self);

  return (char)self;
}

- (BOOL)hasRecipientsSharingLocation
{
  void *v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "chatHasParticipantsSharingLocationWithMe:", self);

  return (char)self;
}

- (BOOL)hasSiblingRecipientsSharingLocation
{
  void *v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "chatHasSiblingParticipantsSharingLocationWithMe:", self);

  return (char)self;
}

- (BOOL)allRecipientsSharingLocation
{
  void *v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "allChatParticipantsSharingLocationWithMe:", self);

  return (char)self;
}

- (void)shareLocationWithDuration:(int64_t)a3
{
  id v5;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startSharingWithChat:withDuration:", self, a3);

}

- (void)stopSharingLocation
{
  id v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopSharingWithChat:", self);

}

- (void)startTrackingParticipantLocations
{
  id v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTrackingLocationForChat:", self);

}

- (void)stopTrackingParticipantLocations
{
  id v3;

  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopTrackingLocationForChat:", self);

}

- (id)testChatItems
{
  return (id)MEMORY[0x1E0DE7D20](self->_chatItemRules, sel_testChatItems);
}

- (void)_automation_markAsRead:(BOOL)a3 messageGUID:(id)a4 forChatGUID:(id)a5 fromMe:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a4;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A20DBE14;
  v15[3] = &unk_1E47216B0;
  v18 = a3;
  v16 = v10;
  v17 = v11;
  v19 = a6;
  v12 = v11;
  v13 = v10;
  v14 = -[IMChat _performQueryWithKey:loadImmediately:block:](self, "_performQueryWithKey:loadImmediately:block:", CFSTR("AutomationMarkAsRead"), 1, v15);

}

- (BOOL)repliedToChat
{
  void *v2;
  BOOL v3;

  -[IMChat lastSentMessage](self, "lastSentMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)receivedResponseForChat
{
  void *v2;
  BOOL v3;

  -[IMChat lastIncomingFinishedMessage](self, "lastIncomingFinishedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)stateCaptureRecents
{
  if (qword_1ECF12388 != -1)
    dispatch_once(&qword_1ECF12388, &unk_1E47216D0);
  return (id)qword_1ECF12380;
}

- (id)stateDictionaryForDiagnosticsRequest
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  IMChat *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  _QWORD v47[4];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[IMItemsController _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[IMItemsController _items](self, "_items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x64)
  {
    v9 = (void *)objc_msgSend(v6, "initWithCapacity:", 100);
  }
  else
  {
    -[IMItemsController _items](self, "_items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v8, "count"));

  }
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMChat chatItems](self, "chatItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1A20DC360;
  v42[3] = &unk_1E47216F8;
  v12 = v5;
  v43 = v12;
  v36 = v10;
  v44 = v36;
  v34 = v9;
  v45 = v34;
  objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, v42);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = self;
  -[IMItemsController _items](self, "_items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v18, "guid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "containsObject:", v19) & 1) == 0
          && (objc_msgSend(v18, "isAssociatedMessageItem") & 1) == 0)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@"), v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v24);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v18;
          if (objc_msgSend(v25, "isTypingMessage"))
          {
            v26 = (void *)MEMORY[0x1E0CB3940];
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "guid");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("i:%@: %@"), v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v30);

          }
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v15);
  }

  v46[0] = CFSTR("debugDescription");
  -[IMChat debugDescription](v35, "debugDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v31;
  v47[1] = v34;
  v46[1] = CFSTR("bottomChatItemGUIDs");
  v46[2] = CFSTR("unrepresentedItems");
  v46[3] = CFSTR("typingIndicators");
  v47[2] = v37;
  v47[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)invalidateSpamIndicatorCachedValues
{
  -[IMChat setCachedShouldShowReportSpam:](self, "setCachedShouldShowReportSpam:", 0);
  -[IMChat setCachedShouldShowSpam:](self, "setCachedShouldShowSpam:", 0);
}

- (id)contacts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChat account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMChat participants](self, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "imHandleWithID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "cnContactWithKeys:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v3, "addObject:", v13);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (NSString)downgradeStateForDebugMenu
{
  return (NSString *)sub_1A20295FC(-[IMChat downgradeState](self, "downgradeState"));
}

- (BOOL)allowedToShowConversation
{
  void *v3;
  char v4;

  if (!+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))return 1;
  +[IMDowntimeController sharedInstance](IMDowntimeController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowedToShowConversationForChat:sync:", self, 0);

  return v4;
}

- (BOOL)allowedToShowConversationSync
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  if (!+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))return 1;
  +[IMDowntimeController sharedInstance](IMDowntimeController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationContextForChat:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "allowedByScreenTime");
  else
    v6 = objc_msgSend(v3, "allowedToShowConversationForChat:sync:", self, 1);
  v7 = v6;

  return v7;
}

- (id)conversationContext
{
  void *v3;
  void *v4;

  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))
  {
    +[IMDowntimeController sharedInstance](IMDowntimeController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "conversationContextForChat:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)hashOfParticipantIDs
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled")&& (-[IMChat participants](self, "participants"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "count"), v3, v4))
  {
    -[IMChat participantHandleIDs](self, "participantHandleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IMHashOfHashesForStringArray(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)pronunciationHint
{
  return 0;
}

- (NSArray)alternativeSpeakableMatches
{
  return 0;
}

- (void)updateReplySuggestions
{
  void *v3;
  char v4;

  -[IMChat chatItemsUpdater](self, "chatItemsUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHoldingUpdates");

  if ((v4 & 1) == 0)
    -[IMChat _updateChatItemsWithReason:block:](self, "_updateChatItemsWithReason:block:", CFSTR("Update Smart Replies"), &unk_1E471DB18);
}

- (id)recentIncomingMessagesWithTextContentForReplySuggestions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D399D8];
  -[IMItemsController _items](self, "_items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentIncomingMessagesWithTextContentForReplySuggestions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)recentOugoingMessagesWithTextContentForReplySuggestions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D399D8];
  -[IMItemsController _items](self, "_items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentOugoingMessagesWithTextContentForReplySuggestions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isRecipientAbleToDowngradeToSMS
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (!v4 || -[IMChat chatStyle](self, "chatStyle") != 45)
    return 0;
  -[IMChat recipient](self, "recipient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D39880];
  v39[0] = v7;
  v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_currentCachedRemoteDevicesForDestinations:service:listenerID:", v10, CFSTR("com.apple.madrid"), CFSTR("IMChat+LiteService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v27)
    {
      v13 = *(_QWORD *)v34;
      v14 = *MEMORY[0x1E0D34B70];
      v25 = *(_QWORD *)v34;
      v26 = v5;
      v28 = v12;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v30 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "capabilities", v25);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "valueForCapability:", v14);

                if (v23)
                {

                  v9 = 1;
                  v5 = v26;
                  v12 = v28;
                  goto LABEL_22;
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v19)
                continue;
              break;
            }
          }

          v12 = v28;
          v13 = v25;
        }
        v9 = 0;
        v5 = v26;
        v27 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v27);
    }
    else
    {
      v9 = 0;
    }
LABEL_22:

  }
  return v9 != 0;
}

- (void)_refreshServiceForSendingWithDaemon
{
  IMChat *v2;

  v2 = self;
  sub_1A21877F8();

}

- (BOOL)isChatBot
{
  IMChat *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A218D090();

  return v3 & 1;
}

- (id)persistentMenu
{
  IMChat *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v2 = self;
  v3 = -[IMChat allChatProperties](v2, sel_allChatProperties);
  if (v3 && (v4 = v3, v5 = sub_1A219974C(), v4, v6 = sub_1A218EAB0(v5), swift_bridgeObjectRelease(), v6))
  {
    v7 = objc_allocWithZone(MEMORY[0x1E0D399B0]);
    v8 = sub_1A2199740();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v7, sel_initWithDictionary_, v8);

    v2 = (IMChat *)v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end

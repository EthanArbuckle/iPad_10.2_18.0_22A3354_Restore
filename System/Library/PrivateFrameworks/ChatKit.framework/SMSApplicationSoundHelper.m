@implementation SMSApplicationSoundHelper

- (void)stopPlayingAlert
{
  TLAlert *alert;

  -[TLAlert stop](self->_alert, "stop");
  alert = self->_alert;
  self->_alert = 0;

}

- (BOOL)playTapbackReceivedSoundForMessageInCurrentTranscript:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  uint8_t buf[2];

  v4 = a3;
  if (!-[SMSApplicationSoundHelper _shouldPlayTextTone](self, "_shouldPlayTextTone"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v10 = 0;
        v7 = "User has disabled text tones, via sound preferences";
        v8 = (uint8_t *)&v10;
LABEL_10:
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
      }
LABEL_11:

    }
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  if (!-[SMSApplicationSoundHelper _isPlaySoundEnabled](self, "_isPlaySoundEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v7 = "User has disabled text tones, via messages settings";
        v8 = buf;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "associatedMessageType");
  v5 = IMMessageSoundPlayReceivedAckSound();
LABEL_13:

  return v5;
}

- (BOOL)_shouldPlayTextTone
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  char v7;
  uint8_t v9[16];

  objc_msgSend((id)MEMORY[0x193FF3C18](CFSTR("TLToneManager"), CFSTR("ToneLibrary")), "sharedToneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentToneIdentifierForAlertType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    getTLToneIdentifierNone();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    if (v5 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "User has selected text tone of None in sound settings, not playing sound", v9, 2u);
      }

    }
    v7 = v5 ^ 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)allowedByScreenTimeToPlayReceiveSoundForChat:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "allowedToShowConversationSync");
  else
    return 1;
}

- (void)playIncomingMessageSoundAndHapticForMessage:(id)a3 messageIsForCurrentTranscript:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a4;
  v6 = a3;
  if (-[SMSApplicationSoundHelper _isPlaySoundEnabled](self, "_isPlaySoundEnabled"))
  {
    -[SMSApplicationSoundHelper _playIncomingMessageSoundAndHapticForMessage:messageIsForCurrentTranscript:](self, "_playIncomingMessageSoundAndHapticForMessage:messageIsForCurrentTranscript:", v6, v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "User has disabled text tones, via messages settings", v8, 2u);
    }

  }
}

- (void)_playIncomingMessageSoundAndHapticForMessage:(id)a3 messageIsForCurrentTranscript:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CKEntity *v7;
  void *v8;
  CKEntity *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  TLAlert *v20;
  TLAlert *alert;
  TLAlert *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [CKEntity alloc];
  objc_msgSend(v6, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CKEntity initWithIMHandle:](v7, "initWithIMHandle:", v8);

  -[CKEntity textToneIdentifier](v9, "textToneIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity textVibrationIdentifier](v9, "textVibrationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    getTLToneIdentifierNone();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v12))
    {
      getTLToneIdentifierNone();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    getTLVibrationIdentifierNone();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v15))
    {
      getTLVibrationIdentifierNone();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

    v14 = 3;
    v11 = (void *)v16;
  }
  else
  {
    v14 = 2;
    v13 = v10;
  }
  if (getTLAlertClass())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = CFSTR("text message");
        if (v4)
          v18 = CFSTR("message in conversation");
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "In app play tone and vibration of type: %@", buf, 0xCu);
      }

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF738]), "initWithType:", v14);
    objc_msgSend(v19, "setToneIdentifier:", v13);
    objc_msgSend(v19, "setVibrationIdentifier:", v11);
    objc_msgSend(getTLAlertClass(), "alertWithConfiguration:", v19);
    v20 = (TLAlert *)objc_claimAutoreleasedReturnValue();
    alert = self->_alert;
    self->_alert = v20;

    v22 = self->_alert;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __104__SMSApplicationSoundHelper__playIncomingMessageSoundAndHapticForMessage_messageIsForCurrentTranscript___block_invoke;
    v23[3] = &unk_1E274A150;
    v23[4] = self;
    v24 = v6;
    -[TLAlert playWithCompletionHandler:](v22, "playWithCompletionHandler:", v23);

  }
}

void __104__SMSApplicationSoundHelper__playIncomingMessageSoundAndHapticForMessage_messageIsForCurrentTranscript___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

  if (a2 == 5)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(48);
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "guid");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(v5, "userInfo");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = &stru_1E276D870;
        }
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Error playing alert for guid [%@]: [%@]", buf, 0x16u);
        if (v5)

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      objc_msgSend(*(id *)(a1 + 40), "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v5, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _CKLogExternal();

      }
      else
      {
        _CKLogExternal();
      }

    }
  }

}

- (BOOL)_isPlaySoundEnabled
{
  return *MEMORY[0x1E0D37348];
}

- (BOOL)bulletinSuppressed
{
  return self->_bulletinSuppressed;
}

- (void)setBulletinSuppressed:(BOOL)a3
{
  self->_bulletinSuppressed = a3;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
}

@end

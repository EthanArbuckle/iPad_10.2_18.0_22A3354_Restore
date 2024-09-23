@implementation IMDSoundUtilities

+ (void)playMessageSentSoundIfNeeded:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_opt_class(), "_soundTypeForMessage:", a3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(a3, "guid");
    if (IMOSLoggingEnabled(v6))
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("Acknowledgment");
        if (v5 == 1)
          v8 = CFSTR("SMS");
        v9 = 138412546;
        v10 = v8;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Play message sent sound type: %@, for message: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    objc_msgSend((id)objc_opt_class(), "_playSoundType:", v5);
  }
}

+ (int64_t)_soundTypeForMessage:(id)a3
{
  uint64_t v4;
  int64_t result;
  int64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "guid");
  result = objc_msgSend((id)objc_opt_class(), "_smsSoundsToPlay");
  if (result)
  {
    v6 = result;
    if (objc_msgSend((id)objc_opt_class(), "_isUserScheduledMessage:", a3))
    {
      v7 = objc_msgSend(a3, "dateEdited");
      v8 = IMOSLoggingEnabled(v7);
      if (v7)
      {
        if (!v8)
          return 0;
        v9 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          return 0;
        v16 = 138412290;
        v17 = v4;
        v10 = "Suppressing play sound for edited scheduled message[%@]";
        goto LABEL_28;
      }
      if (v8)
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v4;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Using IMDSoundTypeSentScheduledMessage for message[%@]", (uint8_t *)&v16, 0xCu);
        }
      }
      v6 = 3;
    }
    if (objc_msgSend((id)objc_opt_class(), "_isSMSMessage:", a3))
    {
      v12 = objc_msgSend((id)objc_opt_class(), "_wasDowngraded:", a3);
      if ((_DWORD)v12)
      {
        if (!IMOSLoggingEnabled(v12))
          return 0;
        v9 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          return 0;
        v16 = 138412290;
        v17 = v4;
        v10 = "Suppressing play sound for downgraded message[%@]";
        goto LABEL_28;
      }
    }
    v13 = objc_msgSend((id)objc_opt_class(), "_isSuppressedForGUID:", v4);
    if ((_DWORD)v13)
    {
      if (IMOSLoggingEnabled(v13))
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v4;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Suppressing play sound because it was already played [%@]", (uint8_t *)&v16, 0xCu);
        }
      }
      objc_msgSend((id)objc_opt_class(), "_stopSuppressingForGUID:", v4);
      return 0;
    }
    if (objc_msgSend((id)objc_opt_class(), "_isAssociatedMessage:", a3))
    {
      if (!objc_msgSend((id)objc_opt_class(), "_isAcknowledgmentMessage:", a3))
        return 0;
      v6 = 2;
    }
    v15 = objc_msgSend((id)objc_opt_class(), "_isAutoPlay:", a3);
    if ((_DWORD)v15)
    {
      if (!IMOSLoggingEnabled(v15))
        return 0;
      v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        return 0;
      v16 = 138412290;
      v17 = v4;
      v10 = "Suppressing play sound for auto-reply message [%@]";
LABEL_28:
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 0xCu);
      return 0;
    }
    if (objc_msgSend(a3, "isBeingRetried"))
      return 0;
    else
      return v6;
  }
  return result;
}

+ (int64_t)_smsSoundsToPlay
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager"), "currentToneIdentifierForAlertType:", 2);
  return objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DBF788]) ^ 1;
}

+ (void)_playSoundType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  switch(a3)
  {
    case 3:
      v4 = objc_opt_class();
      MEMORY[0x1E0DE7D20](v4, sel__playSentScheduledMessageSound);
      break;
    case 2:
      v5 = objc_opt_class();
      MEMORY[0x1E0DE7D20](v5, sel__playAcknowledgmentSentSound);
      break;
    case 1:
      v3 = objc_opt_class();
      MEMORY[0x1E0DE7D20](v3, sel__playSMSSound);
      break;
  }
}

+ (unsigned)_installSystemSound:(id)a3
{
  const __CFURL *v4;
  uint64_t v5;
  int v6;
  unsigned int result;
  NSObject *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  int inPropertyData;
  SystemSoundID outSystemSoundID;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFURL *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", a3, 0);
  outSystemSoundID = 0;
  v5 = AudioServicesCreateSystemSoundID(v4, &outSystemSoundID);
  v6 = v5;
  if ((_DWORD)v5)
  {
    result = IMOSLoggingEnabled(v5);
    if (result)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_DWORD *)buf = 138412546;
        v15 = a3;
        v16 = 1024;
        v17 = v6;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Unable to find a sound action ID for %@  errorResult: %d", buf, 0x12u);
        return 0;
      }
    }
  }
  else
  {
    inPropertyData = 0;
    v9 = AudioServicesSetProperty(0x69737569u, 4u, &outSystemSoundID, 4u, &inPropertyData);
    v10 = v9;
    if ((_DWORD)v9)
    {
      if (IMOSLoggingEnabled(v9))
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v15) = v10;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Unable to set property on sound ID   errorResult: %d", buf, 8u);
        }
      }
      result = outSystemSoundID;
      if (outSystemSoundID)
      {
        AudioServicesDisposeSystemSoundID(outSystemSoundID);
        return 0;
      }
    }
    else
    {
      return outSystemSoundID;
    }
  }
  return result;
}

+ (void)_playAcknowledgmentSentSound
{
  AudioServicesPlaySystemSound(0x574u);
}

+ (void)_playSMSSound
{
  AudioServicesPlaySystemSound(0x3ECu);
}

+ (void)_playSentScheduledMessageSound
{
  if (qword_1EFC63C60 != -1)
    dispatch_once(&qword_1EFC63C60, &unk_1E9228970);
  if (dword_1EFC63C68)
    AudioServicesPlaySystemSound(dword_1EFC63C68);
}

+ (BOOL)_isSMSMessage:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "service");
  return objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D38F58]);
}

+ (BOOL)_isUserScheduledMessage:(id)a3
{
  return objc_msgSend(a3, "scheduleType") == 2;
}

+ (BOOL)_wasDowngraded:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "flags") >> 19) & 1;
}

+ (BOOL)_isSuppressedForGUID:(id)a3
{
  void *v4;

  if (a3 && (v4 = (void *)IMGetCachedDomainValueForKey()) != 0)
    return objc_msgSend(v4, "containsObject:", a3);
  else
    return 0;
}

+ (void)_stopSuppressingForGUID:(id)a3
{
  IMSetDomainValueForKey();
}

+ (BOOL)_isAssociatedMessage:(id)a3
{
  return objc_msgSend(a3, "associatedMessageGUID") != 0;
}

+ (BOOL)_isAcknowledgmentMessage:(id)a3
{
  return (objc_msgSend(a3, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8) == 2000;
}

+ (BOOL)_isAutoPlay:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "flags") >> 6) & 1;
}

@end

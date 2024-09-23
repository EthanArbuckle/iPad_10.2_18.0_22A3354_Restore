@implementation IMTipKitEventReporter

+ (id)sharedInstance
{
  if (qword_1ECFC70D8 != -1)
    dispatch_once(&qword_1ECFC70D8, &unk_1E3FB3988);
  return (id)qword_1ECFC6D08;
}

- (void)sendFilterUnknownSenderStateChangedEvent
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
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Filter Unknown Senders state changed", v4, 2u);
    }

  }
  -[IMTipKitEventReporter sendBiomeSignal:](self, "sendBiomeSignal:", CFSTR("com.apple.MobileSMS.filter-unknown-sender-state-changed"));
}

- (void)sendJunkInboxOpenedEvent
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
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Junk inbox opened", v4, 2u);
    }

  }
  -[IMTipKitEventReporter sendBiomeSignal:](self, "sendBiomeSignal:", CFSTR("com.apple.MobileSMS.junk-inbox-opened"));
}

- (void)sendReceivedJunkEventIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("com.apple.MobileSMS.user-previously-received-junk-message"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("com.apple.MobileSMS.user-previously-received-junk-message-fus"));

  v7 = IMGetDomainBoolForKey();
  if ((v4 & 1) != 0 || (v7 & 1) != 0)
  {
    if (((v6 | v7 ^ 1) & 1) != 0)
      return;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Received junk message. Filter unknown senders ON", v12, 2u);
      }

    }
    v9 = CFSTR("com.apple.MobileSMS.user-previously-received-junk-message-fus");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Received junk message. Filter unknown senders OFF", buf, 2u);
      }

    }
    v9 = CFSTR("com.apple.MobileSMS.user-previously-received-junk-message");
  }
  -[IMTipKitEventReporter sendBiomeSignal:](self, "sendBiomeSignal:", v9);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBool:forKey:", 1, v9);

}

- (void)sendTapbackSendEvent
{
  -[IMTipKitEventReporter sendBiomeSignal:](self, "sendBiomeSignal:", CFSTR("com.apple.MobileSMS.send-tapback"));
  MEMORY[0x1E0DE7D20](self, sel_sendCoreAnalyticsSilverEvent_);
}

- (void)sendSavePhotoEvent
{
  -[IMTipKitEventReporter sendBiomeSignal:](self, "sendBiomeSignal:", CFSTR("com.apple.MobileSMS.save-photo"));
}

- (void)sendReceivedPhotoEvent
{
  -[IMTipKitEventReporter sendBiomeSignal:](self, "sendBiomeSignal:", CFSTR("com.apple.MobileSMS.receive-photo"));
}

- (void)sendSentMessageEvent
{
  id v2;

  +[TipsNextEventReporter shared](TipsNextEventReporter, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "donateSentMessageEvent");

}

- (void)sendBiomeSignal:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = (void *)objc_msgSend(a3, "copy");
  IMBiomeQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E2D32D4;
  block[3] = &unk_1E3FB6B98;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void)sendCoreAnalyticsSilverEvent:(id)a3
{
  AnalyticsSendEventLazy();
}

- (void)sendINSendMessageIntentEvent
{
  id v2;

  +[TipsNextEventReporter shared](TipsNextEventReporter, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "donateSentINSendMessageIntentEvent");

}

@end

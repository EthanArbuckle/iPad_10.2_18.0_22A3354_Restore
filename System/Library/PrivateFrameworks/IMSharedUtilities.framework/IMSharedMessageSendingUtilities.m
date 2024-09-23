@implementation IMSharedMessageSendingUtilities

- (IMSharedMessageSendingUtilities)init
{
  IMSharedMessageSendingUtilities *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMSharedMessageSendingUtilities;
  v2 = -[IMSharedMessageSendingUtilities init](&v4, sel_init);
  if (v2)
    v2->_serviceAvailabilityMonitor = (IMServiceAvailabilityMonitoring *)objc_alloc_init(IMServiceAvailabilityMonitor);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSharedMessageSendingUtilities;
  -[IMSharedMessageSendingUtilities dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  if (qword_1ECFC7638 != -1)
    dispatch_once(&qword_1ECFC7638, &unk_1E3FB3808);
  return (id)qword_1ECFC7598;
}

- (BOOL)_hasSMSCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)_canSendText
{
  return -[IMSharedMessageSendingUtilities _hasSMSCapability](self, "_hasSMSCapability")
      || -[IMSharedMessageSendingUtilities isiMessageEnabled](self, "isiMessageEnabled")
      || -[IMSharedMessageSendingUtilities isRCSEnabled](self, "isRCSEnabled");
}

- (void)_updateServiceAvailability
{
  int64_t v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = -[IMSharedMessageSendingUtilities serviceAvailability](self, "serviceAvailability");
  v4 = -[IMSharedMessageSendingUtilities _canSendText](self, "_canSendText");
  if (-[IMSharedMessageSendingUtilities serviceAvailability](self, "serviceAvailability") != v4)
  {
    -[IMSharedMessageSendingUtilities setServiceAvailability:](self, "setServiceAvailability:", v4);
    if (v3 != -1)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("__kMFMessageComposeViewControllerTextMessageAvailabilityKey"), 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("__kMFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification"), 0, v5);

    }
  }
}

- (id)_managedConfigAppAllowlist
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  return (id)MEMORY[0x1E0DE7D20](v2, sel_effectiveWhitelistedAppBundleIDs);
}

- (BOOL)canSendText
{
  id v3;
  int v4;

  v3 = -[IMSharedMessageSendingUtilities _managedConfigAppAllowlist](self, "_managedConfigAppAllowlist");
  if (!v3 || (v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.MobileSMS"))) != 0)
  {
    -[IMSharedMessageSendingUtilities _updateServiceAvailability](self, "_updateServiceAvailability");
    LOBYTE(v4) = -[IMSharedMessageSendingUtilities serviceAvailability](self, "serviceAvailability") > 0;
  }
  return v4;
}

- (id)_allSubscriptions
{
  IMCTSubscriptionUtilities *v2;

  v2 = +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  return (id)MEMORY[0x1E0DE7D20](v2, sel_ctServiceSubscriptions);
}

- (BOOL)_hasSubscriptionPassingTest:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = -[IMSharedMessageSendingUtilities _allSubscriptions](self, "_allSubscriptions", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if (((*((uint64_t (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            return v6;
          }
          ++v9;
        }
        while (v7 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v7 = v6;
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v6) = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(-[IMSharedMessageSendingUtilities _allSubscriptions](self, "_allSubscriptions"), "firstObject"));
  }
  return v6;
}

- (BOOL)isMMSEnabled
{
  return -[IMServiceAvailabilityMonitoring isMMSEnabled](-[IMSharedMessageSendingUtilities serviceAvailabilityMonitor](self, "serviceAvailabilityMonitor"), "isMMSEnabled");
}

- (BOOL)isiMessageEnabled
{
  return -[IMServiceAvailabilityMonitoring isiMessageEnabled](-[IMSharedMessageSendingUtilities serviceAvailabilityMonitor](self, "serviceAvailabilityMonitor"), "isiMessageEnabled");
}

- (BOOL)isRCSEnabled
{
  return -[IMServiceAvailabilityMonitoring isRCSEnabled](-[IMSharedMessageSendingUtilities serviceAvailabilityMonitor](self, "serviceAvailabilityMonitor"), "isRCSEnabled");
}

- (BOOL)isRBMEnabled
{
  int v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = -[IMSharedMessageSendingUtilities isRBMSupported](self, "isRBMSupported");
  if (v3)
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain"), "objectForKey:", CFSTR("RCSForBusinessEnabled"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Reading isRBMEnabled from Carrier Bundle", v7, 2u);
        }
      }
      LOBYTE(v3) = -[IMSharedMessageSendingUtilities _hasSubscriptionPassingTest:](self, "_hasSubscriptionPassingTest:", &unk_1E3FB40A8);
    }
  }
  return v3;
}

- (BOOL)isRBMSupported
{
  return -[IMSharedMessageSendingUtilities _hasSubscriptionPassingTest:](self, "_hasSubscriptionPassingTest:", &unk_1E3FB74B0);
}

- (BOOL)isMessagingEnabled
{
  return -[IMSharedMessageSendingUtilities isMMSEnabled](self, "isMMSEnabled")
      || -[IMSharedMessageSendingUtilities isiMessageEnabled](self, "isiMessageEnabled")
      || -[IMSharedMessageSendingUtilities isRCSEnabled](self, "isRCSEnabled");
}

- (BOOL)isRichMessagingEnabled
{
  return -[IMSharedMessageSendingUtilities isiMessageEnabled](self, "isiMessageEnabled")
      || -[IMSharedMessageSendingUtilities isRCSEnabled](self, "isRCSEnabled");
}

- (BOOL)isSupportedAttachmentUTI:(id)a3
{
  int v6;
  int v7;
  int v8;
  BOOL v9;

  if (-[IMSharedMessageSendingUtilities isiMessageEnabled](self, "isiMessageEnabled")
    || -[IMSharedMessageSendingUtilities isRCSEnabled](self, "isRCSEnabled"))
  {
    return 1;
  }
  if (-[IMSharedMessageSendingUtilities isMMSEnabled](self, "isMMSEnabled"))
  {
    v6 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5AC8]);
    v7 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5AD8]) | v6;
    v8 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5CB0]);
    v9 = (v7 | v8 | UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5B90])) == 0;
  }
  else
  {
    v9 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5C88]) == 0;
  }
  return !v9;
}

- (BOOL)_isiMessageSupported
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0D20C30], "sharedInstance");
  return MEMORY[0x1E0DE7D20](v2, sel_iMessageSupported);
}

- (int64_t)_maxMMSAttachmentCount
{
  return +[IMCTSMSUtilities IMMMSMaximumSlideCountForPhoneNumber:simID:](IMCTSMSUtilities, "IMMMSMaximumSlideCountForPhoneNumber:simID:", 0, 0);
}

- (int64_t)_maxMMSMessageByteCount
{
  return +[IMCTSMSUtilities IMMMSMaximumSlideCountForPhoneNumber:simID:](IMCTSMSUtilities, "IMMMSMaximumSlideCountForPhoneNumber:simID:", 0, 0);
}

- (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5
{
  BOOL v9;
  BOOL v10;
  _BOOL4 v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  int64_t v15;
  float v16;
  float v17;

  if (!-[IMSharedMessageSendingUtilities isMessagingEnabled](self, "isMessagingEnabled"))
    return 0;
  v9 = -[IMSharedMessageSendingUtilities _isiMessageSupported](self, "_isiMessageSupported");
  v10 = -[IMSharedMessageSendingUtilities isiMessageEnabled](self, "isiMessageEnabled");
  v11 = -[IMSharedMessageSendingUtilities isMMSEnabled](self, "isMMSEnabled");
  v12 = -[IMSharedMessageSendingUtilities isRCSEnabled](self, "isRCSEnabled");
  v13 = v9 && v10;
  v14 = 1;
  if (!v13 && !v12 && v11)
  {
    v15 = -[IMSharedMessageSendingUtilities _maxMMSAttachmentCount](self, "_maxMMSAttachmentCount");
    v14 = v15 == 0;
    if (v15)
    {
      if (v15 >= a4 + a3 + a5 && (a4 < 1 || a5 <= 0))
      {
        v16 = (double)-[IMSharedMessageSendingUtilities _maxMMSMessageByteCount](self, "_maxMMSMessageByteCount")
            * 0.95
            / 102400.0;
        v17 = floorf(v16);
        if (v17 < 1.0)
          v17 = 1.0;
        if ((int)v17 >= a3)
          return 1;
      }
    }
  }
  return v14;
}

- (int64_t)serviceAvailability
{
  return self->_serviceAvailability;
}

- (void)setServiceAvailability:(int64_t)a3
{
  self->_serviceAvailability = a3;
}

- (IMServiceAvailabilityMonitoring)serviceAvailabilityMonitor
{
  return self->_serviceAvailabilityMonitor;
}

- (void)setServiceAvailabilityMonitor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

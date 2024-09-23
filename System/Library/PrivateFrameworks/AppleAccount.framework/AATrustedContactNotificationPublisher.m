@implementation AATrustedContactNotificationPublisher

+ (void)postRecoveryContactChangedNotification
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EACA000, v2, OS_LOG_TYPE_DEFAULT, "Posting AARecoveryContactChangedNotification", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.appleaccount.recovery-contact-changed-notification"), 0, 0, 1);

}

+ (void)postInheritanceContactChangedNotification
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EACA000, v2, OS_LOG_TYPE_DEFAULT, "Posting AAInheritanceContactChangedNotification", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.appleaccount.inheritance-contact-changed-notification"), 0, 0, 1);

}

@end

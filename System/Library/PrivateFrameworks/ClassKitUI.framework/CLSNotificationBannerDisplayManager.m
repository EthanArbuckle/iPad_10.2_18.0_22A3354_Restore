@implementation CLSNotificationBannerDisplayManager

+ (id)shared
{
  if (qword_25547D388 != -1)
    dispatch_once(&qword_25547D388, &unk_24E3572F0);
  return (id)qword_25547D380;
}

- (void)showBannerWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EC01AB8;
  block[3] = &unk_24E357318;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)showPrivacyModalViewWithInfo:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend_instantiateViewControllerWithInputItems_identifier_connectionHandler_(CLSRemoteViewController, a2, 0, CFSTR("com.apple.ClassKitUI.PrivacyDisclosure"), &unk_24E357358);
}

- (NSDate)lastBannerTime
{
  return self->_lastBannerTime;
}

- (void)setLastBannerTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastBannerTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBannerTime, 0);
}

@end

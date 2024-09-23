@implementation iOSSetupWiFiViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupWiFiViewController viewWillAppear:]", 30, "WiFi ViewWillAppear\n");
  v12.receiver = self;
  v12.super_class = (Class)iOSSetupWiFiViewController;
  -[SVSBaseViewController viewWillAppear:](&v12, "viewWillAppear:", v3);
  v5 = sub_1001171A8(CFSTR("Localizable"), CFSTR("WIFI_TURN_ON_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("WiFiAppIcon.png")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "scale");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_applicationIconImageForFormat:precomposed:scale:", 2, 1));
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setImage:", v9);

  v10 = sub_1001171A8(CFSTR("Localizable"), CFSTR("WIFI_TURN_ON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v11);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupWiFiViewController viewDidDisappear:]", 30, "WiFi ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)iOSSetupWiFiViewController;
  -[iOSSetupWiFiViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleContinueButton:(id)a3
{
  id v4;
  uint64_t v5;
  const void *v6;
  id v7;
  _QWORD v8[5];

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupWiFiViewController handleContinueButton:]", 30, "WiFi Continue button\n");
  if (objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "isEnabled"))
  {
    objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setEnabled:", 0);
    if (dword_1001A82C8 <= 30
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupWiFiViewController handleContinueButton:]", 30, "WiFi powering on\n");
    }
    v5 = WiFiManagerClientCreate(0, 0);
    if (v5)
    {
      v6 = (const void *)v5;
      WiFiManagerClientSetPower(v5, 1);
      CFRelease(v6);
    }
    if (dword_1001A82C8 <= 30
      && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    {
      LogPrintF(&dword_1001A82C8, "-[iOSSetupWiFiViewController handleContinueButton:]", 30, "WiFi start reachability\n");
    }
    v7 = objc_alloc_init((Class)CUReachabilityMonitor);
    objc_msgSend(v7, "setTimeout:", 60.0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E8B38;
    v8[3] = &unk_10017E070;
    v8[4] = v7;
    objc_msgSend(v7, "setCompletionHandler:", v8);
    objc_msgSend(v7, "activate");
    objc_msgSend(self->super.super._mainController, "showStartUI");

  }
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupWiFiViewController handleDismissButton:]", 30, "WiFi Dismiss button\n");
  -[iOSSetupBaseViewController dismissWithType:](self, "dismissWithType:", 5);

}

- (UILabel)titleLabel
{
  return *(UILabel **)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), a3);
}

- (UIImageView)imageView
{
  return *(UIImageView **)((char *)&self->_titleLabel + 1);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), a3);
}

- (UILabel)infoLabel
{
  return *(UILabel **)((char *)&self->_imageView + 1);
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_imageView + 1), a3);
}

- (UIButton)continueButton
{
  return *(UIButton **)((char *)&self->_infoLabel + 1);
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end

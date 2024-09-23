@implementation AFUICarPlayUtilities

+ (BOOL)shouldStartNewRequest:(id)a3 duringCurrentRequest:(id)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(a1, "isRequestForAnnounceNotification:", a4);
  LOBYTE(a1) = objc_msgSend(a1, "isRequestForMessageReadBannerTap:", v6);

  return a4 & a1 ^ 1;
}

+ (BOOL)shouldPresentForNewRequest:(id)a3 duringCurrentRequest:(id)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(a1, "isRequestForAnnounceNotification:", a4);
  LOBYTE(a1) = objc_msgSend(a1, "isRequestForAnnounceNotification:", v6);

  return a4 & (a1 ^ 1);
}

+ (BOOL)isRequestForMessageReadBannerTap:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "uiPresentationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay"))
    && objc_msgSend(v3, "requestSource") == 13
    && objc_msgSend(v3, "directActionEvent") == 4;

  return v5;
}

+ (BOOL)isRequestForAnnounceNotification:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "uiPresentationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay.UIFree"))
    && objc_msgSend(v3, "requestSource") == 37
    && objc_msgSend(v3, "directActionEvent") == 0;

  return v5;
}

@end

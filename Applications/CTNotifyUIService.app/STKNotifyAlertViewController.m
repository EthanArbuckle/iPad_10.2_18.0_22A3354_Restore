@implementation STKNotifyAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(STKNotifySessionAction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (id)alertText
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STKNotifyAlertViewController;
  v3 = -[STKTextAlertViewController alertText](&v22, "alertText");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionData"));
    v7 = objc_msgSend(v6, "notifyType");

    switch((unint64_t)v7)
    {
      case 2uLL:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v9 = v8;
        v10 = CFSTR("SIMTK_SS_MESSAGE_SENT");
        break;
      case 3uLL:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v9 = v8;
        v10 = CFSTR("SIMTK_USSD_MESSAGE_SENT");
        break;
      case 4uLL:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v9 = v8;
        v10 = CFSTR("SIMTK_DTMF_MESSAGE_SENT");
        break;
      case 5uLL:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v9 = v8;
        v10 = CFSTR("SIMTK_PLAY_TONE");
        break;
      default:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v9 = v8;
        v10 = CFSTR("SIMTK_SMS_MESSAGE_SENT");
        break;
    }
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "simLabel"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionData"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "simLabel"));
    v17 = (void *)v16;
    v18 = &stru_100014540;
    if (v4)
      v18 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) %@"), v16, v18));

  }
  else
  {
    v20 = &stru_100014540;
    if (v4)
      v20 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v20));
  }

  return v19;
}

@end

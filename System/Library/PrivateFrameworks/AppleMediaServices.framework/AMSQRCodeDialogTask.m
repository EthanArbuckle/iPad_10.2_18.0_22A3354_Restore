@implementation AMSQRCodeDialogTask

- (__CFDictionary)_createNoteDictionaryWithKeys:(ButtonKey *)a3 buttonActions:(id)a4 outOptions:(unint64_t *)a5
{
  __CFDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)AMSQRCodeDialogTask;
  v6 = -[AMSSystemAlertDialogTask _createNoteDictionaryWithKeys:buttonActions:outOptions:](&v32, sel__createNoteDictionaryWithKeys_buttonActions_outOptions_, a3, a4, a5);
  -[AMSSystemAlertDialogTask request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AMSDialogRequestUserInfoKeyServerPayload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationTemplateType"), CFSTR("PBCFUserNotificationTwoWaySignInTemplate"));
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PINCodeTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;

    if (v11)
    {
      v31 = v11;
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationPINCodeTitle"), v11);
      goto LABEL_6;
    }
  }
  else
  {

  }
  v31 = 0;
LABEL_6:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PINCodeUrlSubtitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;

    if (v13)
    {
      v29 = v13;
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationPINCodeURLSubtitle"), v13);
      goto LABEL_11;
    }
  }
  else
  {

  }
  v29 = 0;
LABEL_11:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PINCodeUrl"), v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;

    if (v15)
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationPINCodeURL"), v15);
  }
  else
  {

    v15 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PINCodeSubtitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;

    if (v17)
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationPINCodeSubtitle"), v17);
  }
  else
  {

    v17 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PINCode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;

    if (v19)
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationPINCode"), v19);
  }
  else
  {

    v19 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Divider"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;

    if (v21)
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationDividerText"), v21);
  }
  else
  {

    v21 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("QRCodeTitle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;

    if (v23)
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationQRCodeTitle"), v23);
  }
  else
  {

    v23 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("QRCodeSubtitle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v24;

    if (v25)
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationQRCodeSubtitle"), v25);
  }
  else
  {

    v25 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("QRCodeUrl"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v26;

    if (v27)
      CFDictionarySetValue(v6, CFSTR("PBCFUserNotificationQRCodeURL"), v27);
  }
  else
  {

    v27 = 0;
  }

  return v6;
}

@end

@implementation ICSEmergencyCallbackModeAlert

- (ICSEmergencyCallbackModeAlert)initWithDialRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ICSEmergencyCallbackModeAlert *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *dialRequestAccountDescription;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *emergencyAccountDescription;
  id v28;
  id alertCompletion;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ICSEmergencyCallbackModeAlert;
  v8 = -[ICSEmergencyCallbackModeAlert init](&v31, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localSenderIdentityAccountUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "prioritizedSenderIdentities"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountUUID"));
    v14 = objc_msgSend(v13, "isEqual:", v9);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedName"));
      v17 = (NSString *)objc_msgSend(v16, "copy");
      dialRequestAccountDescription = v8->_dialRequestAccountDescription;
      v8->_dialRequestAccountDescription = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedName"));
      v22 = (NSString *)objc_msgSend(v21, "copy");
      v23 = v8->_dialRequestAccountDescription;
      v8->_dialRequestAccountDescription = v22;

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    }
    v24 = v19;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedName"));
    v26 = (NSString *)objc_msgSend(v25, "copy");
    emergencyAccountDescription = v8->_emergencyAccountDescription;
    v8->_emergencyAccountDescription = v26;

    v28 = objc_retainBlock(v7);
    alertCompletion = v8->_alertCompletion;
    v8->_alertCompletion = v28;

  }
  return v8;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALLBACK_MODE_ALERT_CONTROLLER_TITLE"), &stru_10028DC20, CFSTR("InCallService")));

  return v3;
}

- (id)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALLBACK_MODE_ALERT_CONTROLLER_MESSAGE_%@_%@"), &stru_10028DC20, CFSTR("InCallService")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEmergencyCallbackModeAlert dialRequestAccountDescription](self, "dialRequestAccountDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEmergencyCallbackModeAlert emergencyAccountDescription](self, "emergencyAccountDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5, v6));

  return v7;
}

- (id)defaultButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALLBACK_MODE_ALERT_ACTION_TITLE_CALL"), &stru_10028DC20, CFSTR("InCallService")));

  return v3;
}

- (id)alternateButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALLBACK_MODE_ALERT_ACTION_TITLE_CANCEL"), &stru_10028DC20, CFSTR("InCallService")));

  return v3;
}

- (void)defaultResponse
{
  void (**v2)(id, _QWORD);

  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(-[ICSEmergencyCallbackModeAlert alertCompletion](self, "alertCompletion"));
  v2[2](v2, 0);

}

- (void)alternateResponse
{
  void (**v2)(id, uint64_t);

  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(-[ICSEmergencyCallbackModeAlert alertCompletion](self, "alertCompletion"));
  v2[2](v2, 1);

}

- (NSString)dialRequestAccountDescription
{
  return self->_dialRequestAccountDescription;
}

- (NSString)emergencyAccountDescription
{
  return self->_emergencyAccountDescription;
}

- (id)alertCompletion
{
  return self->_alertCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alertCompletion, 0);
  objc_storeStrong((id *)&self->_emergencyAccountDescription, 0);
  objc_storeStrong((id *)&self->_dialRequestAccountDescription, 0);
}

@end

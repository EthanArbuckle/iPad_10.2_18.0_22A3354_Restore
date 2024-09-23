@implementation PHAirplaneEmergencyCallAlert

- (PHAirplaneEmergencyCallAlert)initWithDialAction:(id)a3
{
  id v4;
  PHAirplaneEmergencyCallAlert *v5;
  PHAirplaneEmergencyCallAlert *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHAirplaneEmergencyCallAlert;
  v5 = -[PHAirplaneEmergencyCallAlert init](&v8, "init");
  v6 = v5;
  if (v5)
    -[PHAirplaneEmergencyCallAlert setDialAction:](v5, "setDialAction:", v4);

  return v6;
}

- (id)title
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = TUStringKeyForNetwork(CFSTR("EMERGENCY_CALL_AIRPLANE_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_10028DC20, CFSTR("EmergencyCallStrings")));

  return v5;
}

- (id)message
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = TUStringKeyForNetwork(CFSTR("EMERGENCY_CALL_AIRPLANE_ALERT_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_10028DC20, CFSTR("EmergencyCallStrings")));

  return v5;
}

- (id)alternateButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL_AIRPLANE_ALERT_DISABLE"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));

  return v3;
}

- (id)otherButtonTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = TUStringKeyForNetwork(CFSTR("EMERGENCY_CALL_AIRPLANE_ALERT_USE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_10028DC20, CFSTR("EmergencyCallStrings")));

  return v5;
}

- (id)defaultButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL_AIRPLANE_ALERT_CANCEL"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));

  return v3;
}

- (void)alternateResponse
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = objc_alloc_init((Class)RadiosPreferences);
  objc_msgSend(v5, "setAirplaneMode:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAirplaneEmergencyCallAlert dialAction](self, "dialAction"));

  if (v3)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHAirplaneEmergencyCallAlert dialAction](self, "dialAction"));
    v4[2](v4, 0);

  }
}

- (void)defaultResponse
{
  void *v3;
  void (**v4)(id, _QWORD);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAirplaneEmergencyCallAlert dialAction](self, "dialAction"));

  if (v3)
  {
    v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(-[PHAirplaneEmergencyCallAlert dialAction](self, "dialAction"));
    v4[2](v4, 0);

  }
}

- (void)otherResponse
{
  void *v3;
  void (**v4)(id, uint64_t);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAirplaneEmergencyCallAlert dialAction](self, "dialAction"));

  if (v3)
  {
    v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(-[PHAirplaneEmergencyCallAlert dialAction](self, "dialAction"));
    v4[2](v4, 1);

  }
}

- (id)dialAction
{
  return self->_dialAction;
}

- (void)setDialAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dialAction, 0);
}

@end

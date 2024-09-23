@implementation AMSUIAirplaneModeInquiry

- (AMSUIAirplaneModeInquiry)init
{
  AMSUIAirplaneModeInquiry *v2;
  RadiosPreferences *v3;
  RadiosPreferences *radiosPreferences;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIAirplaneModeInquiry;
  v2 = -[AMSUIAirplaneModeInquiry init](&v6, sel_init);
  if (v2)
  {
    v3 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04788]);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v3;

    -[RadiosPreferences setDelegate:](v2->_radiosPreferences, "setDelegate:", v2);
  }
  return v2;
}

+ (NSURL)settingsURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x24BE75460], "preferencesURL");
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[AMSUIAirplaneModeInquiry radiosPreferences](self, "radiosPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "airplaneMode");

  return v3;
}

- (void)airplaneModeChanged
{
  id v3;

  -[AMSUIAirplaneModeInquiry delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "airplaneModeInquiryDidObserveChange:", self);

}

- (AMSUIAirplaneModeInquiryDelegate)delegate
{
  return (AMSUIAirplaneModeInquiryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

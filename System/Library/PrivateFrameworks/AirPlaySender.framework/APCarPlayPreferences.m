@implementation APCarPlayPreferences

- (APCarPlayPreferences)init
{
  APCarPlayPreferences *v2;
  CRCarPlayPreferences *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APCarPlayPreferences;
  v2 = -[APCarPlayPreferences init](&v5, sel_init);
  if (v2)
  {
    v3 = (CRCarPlayPreferences *)objc_alloc_init(getCRCarPlayPreferencesClass());
    v2->_preferences = v3;
    -[CRCarPlayPreferences setPreferencesDelegate:](v3, "setPreferencesDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_preferences = 0;
  v3.receiver = self;
  v3.super_class = (Class)APCarPlayPreferences;
  -[APCarPlayPreferences dealloc](&v3, sel_dealloc);
}

- (BOOL)isCarPlayEnabled
{
  return -[CRCarPlayPreferences isCarPlayAllowed](self->_preferences, "isCarPlayAllowed");
}

- (void)handleCarPlayAllowedDidChange
{
  uint64_t v3;

  v3 = -[CRCarPlayPreferences isCarPlayAllowed](self->_preferences, "isCarPlayAllowed");
  if (gLogCategory_APCarPlayPreferences <= 50
    && (gLogCategory_APCarPlayPreferences != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APCarPlayPreferencesDelegate setCarPlayEnabled:](self->_delegate, "setCarPlayEnabled:", v3);
}

- (APCarPlayPreferencesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (APCarPlayPreferencesDelegate *)a3;
}

@end

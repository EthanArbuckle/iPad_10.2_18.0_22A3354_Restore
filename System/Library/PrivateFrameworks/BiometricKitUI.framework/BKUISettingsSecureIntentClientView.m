@implementation BKUISettingsSecureIntentClientView

- (BKMesaSecureIntentProvider)secureIntentProvider
{
  return (BKMesaSecureIntentProvider *)objc_loadWeakRetained((id *)&self->_secureIntentProvider);
}

- (void)setSecureIntentProvider:(id)a3
{
  objc_storeWeak((id *)&self->_secureIntentProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_secureIntentProvider);
}

@end

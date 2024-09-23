@implementation HDFeatureNeverDisabledOrExpiredProvider

- (id)rescindedStatusOnActivePairedDeviceForCountryCode:(id)a3 error:(id *)a4
{
  return &unk_1E6DFA868;
}

- (id)rescindedStatusForCountryCode:(id)a3 device:(id)a4 error:(id *)a5
{
  return &unk_1E6DFA868;
}

- (HDFeatureDisableAndExpiryProvidingDelegate)delegate
{
  return (HDFeatureDisableAndExpiryProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

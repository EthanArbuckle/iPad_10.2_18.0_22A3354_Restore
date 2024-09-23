@implementation HDSecondaryDevicePairingRequest

- (void)dealloc
{
  objc_super v3;

  -[HKDaemonTransaction invalidate](self->_transaction, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDSecondaryDevicePairingRequest;
  -[HDSecondaryDevicePairingRequest dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardianAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end

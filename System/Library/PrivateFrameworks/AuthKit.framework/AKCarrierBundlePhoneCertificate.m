@implementation AKCarrierBundlePhoneCertificate

- (NSString)phoneCertificate
{
  return self->_phoneCertificate;
}

- (void)setPhoneCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_phoneCertificate, a3);
}

- (int64_t)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(int64_t)a3
{
  self->_slotID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneCertificate, 0);
}

@end

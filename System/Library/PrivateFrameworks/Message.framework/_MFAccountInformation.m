@implementation _MFAccountInformation

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (DeliveryAccount)deliveryAccount
{
  return self->_deliveryAccount;
}

- (void)setDeliveryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryAccount, a3);
}

- (NSDictionary)localizedNotes
{
  return self->_localizedNotes;
}

- (void)setLocalizedNotes:(id)a3
{
  objc_storeStrong((id *)&self->_localizedNotes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNotes, 0);
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

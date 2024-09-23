@implementation _CNAUICRRecentContactCNContext

- (CNContact)existingContact
{
  return self->_existingContact;
}

- (void)setExistingContact:(id)a3
{
  objc_storeStrong((id *)&self->_existingContact, a3);
}

- (CNContact)interimContact
{
  return self->_interimContact;
}

- (void)setInterimContact:(id)a3
{
  objc_storeStrong((id *)&self->_interimContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interimContact, 0);
  objc_storeStrong((id *)&self->_existingContact, 0);
}

@end

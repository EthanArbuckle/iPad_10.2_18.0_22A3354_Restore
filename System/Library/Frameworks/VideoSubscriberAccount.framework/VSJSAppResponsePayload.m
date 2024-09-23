@implementation VSJSAppResponsePayload

- (void)setUserAccounts:(id)a3
{
  NSArray *v4;
  NSArray *userAccounts;

  if (a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    userAccounts = self->_userAccounts;
    self->_userAccounts = v4;
  }
  else
  {
    userAccounts = self->_userAccounts;
    self->_userAccounts = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccounts, 0);
}

@end

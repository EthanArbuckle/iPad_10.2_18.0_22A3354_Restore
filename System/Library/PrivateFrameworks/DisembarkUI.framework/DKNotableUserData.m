@implementation DKNotableUserData

- (int64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(int64_t)a3
{
  self->_dataSize = a3;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (BOOL)findMyEnabled
{
  return self->_findMyEnabled;
}

- (void)setFindMyEnabled:(BOOL)a3
{
  self->_findMyEnabled = a3;
}

- (DKNotableUserDataWallet)walletData
{
  return self->_walletData;
}

- (void)setWalletData:(id)a3
{
  objc_storeStrong((id *)&self->_walletData, a3);
}

- (NSArray)cellularPlans
{
  return self->_cellularPlans;
}

- (void)setCellularPlans:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPlans, 0);
  objc_storeStrong((id *)&self->_walletData, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end

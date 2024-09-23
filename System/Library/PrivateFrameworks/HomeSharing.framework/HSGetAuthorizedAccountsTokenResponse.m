@implementation HSGetAuthorizedAccountsTokenResponse

- (NSData)tokenData
{
  return self->tokenData;
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tokenData, 0);
}

@end

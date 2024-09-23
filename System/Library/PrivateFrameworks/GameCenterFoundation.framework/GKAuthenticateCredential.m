@implementation GKAuthenticateCredential

- (GKAuthenticateCredential)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAuthenticateCredential;
  return -[GKAuthenticateCredential init](&v3, sel_init);
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_257 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_257, &__block_literal_global_258_0);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_256;
}

void __51__GKAuthenticateCredential_secureCodedPropertyKeys__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("authenticationToken"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("accountName"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("playerID"));
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_256;
  secureCodedPropertyKeys_sSecureCodedKeys_256 = (uint64_t)v0;

}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationToken, a3);
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_accountName, a3);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
}

@end

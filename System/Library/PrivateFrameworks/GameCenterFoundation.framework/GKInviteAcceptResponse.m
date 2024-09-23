@implementation GKInviteAcceptResponse

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_367 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_367, &__block_literal_global_368);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_366;
}

void __49__GKInviteAcceptResponse_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("responsePlist");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v3[1] = CFSTR("sessionID");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("matchID");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("selfPseudonym");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("transportVersionToUse");
  v4[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_366;
  secureCodedPropertyKeys_sSecureCodedKeys_366 = v1;

}

- (NSDictionary)responsePlist
{
  return self->_responsePlist;
}

- (void)setResponsePlist:(id)a3
{
  objc_storeStrong((id *)&self->_responsePlist, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
  objc_storeStrong((id *)&self->_matchID, a3);
}

- (NSString)selfPseudonym
{
  return self->_selfPseudonym;
}

- (void)setSelfPseudonym:(id)a3
{
  objc_storeStrong((id *)&self->_selfPseudonym, a3);
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
  objc_storeStrong((id *)&self->_transportVersionToUse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_selfPseudonym, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_responsePlist, 0);
}

@end

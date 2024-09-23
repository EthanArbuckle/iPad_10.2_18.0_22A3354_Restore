@implementation GKMatchResponse

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_379 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_379, &__block_literal_global_380);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_378;
}

void __42__GKMatchResponse_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[9];
  _QWORD v6[10];

  v6[9] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("rid");
  v6[0] = objc_opt_class();
  v5[1] = CFSTR("matchID");
  v6[1] = objc_opt_class();
  v5[2] = CFSTR("matches");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v0;
  v5[3] = CFSTR("sessionToken");
  v6[3] = objc_opt_class();
  v5[4] = CFSTR("relayPushes");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = v1;
  v5[5] = CFSTR("cdxTicket");
  v6[5] = objc_opt_class();
  v5[6] = CFSTR("selfPseudonym");
  v6[6] = objc_opt_class();
  v5[7] = CFSTR("serverRequest");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[7] = v2;
  v5[8] = CFSTR("transportVersionToUse");
  v6[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_378;
  secureCodedPropertyKeys_sSecureCodedKeys_378 = v3;

}

- (int)_incrementSequence
{
  return GKAtomicIncrement32Barrier((unsigned int *)&self->_sequence);
}

- (BOOL)isFinished
{
  GKMatchResponse *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_state > 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isCancelled
{
  GKMatchResponse *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_state == 5;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTimeout
{
  GKMatchResponse *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_state == 6;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isNetworkError
{
  GKMatchResponse *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_state == 7;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)transitionToState:(int64_t)a3
{
  GKMatchResponse *v4;
  BOOL v5;

  v4 = self;
  objc_sync_enter(v4);
  switch(a3)
  {
    case 1:
      if (!v4->_state)
        goto LABEL_3;
      goto LABEL_5;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      if (v4->_state >= 4)
        goto LABEL_5;
LABEL_3:
      v4->_state = a3;
      -[GKMatchResponse _incrementSequence](v4, "_incrementSequence");
      v5 = 1;
      break;
    default:
LABEL_5:
      v5 = 0;
      break;
  }
  objc_sync_exit(v4);

  return v5;
}

- (NSString)rid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)matches
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)matchID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMatchID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)sessionToken
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)relayPushes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRelayPushes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSData)cdxTicket
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCdxTicket:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDictionary)serverRequest
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setServerRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (GKMatchRequestInternal)matchRequest
{
  return (GKMatchRequestInternal *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMatchRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (GKDispatchGroup)matchingGroup
{
  return self->_matchingGroup;
}

- (void)setMatchingGroup:(id)a3
{
  self->_matchingGroup = (GKDispatchGroup *)a3;
}

- (int)sequence
{
  return self->_sequence;
}

- (NSString)selfPseudonym
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSelfPseudonym:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)transportVersionToUse
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTransportVersionToUse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_selfPseudonym, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);
  objc_storeStrong((id *)&self->_serverRequest, 0);
  objc_storeStrong((id *)&self->_cdxTicket, 0);
  objc_storeStrong((id *)&self->_relayPushes, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_matches, 0);
  objc_storeStrong((id *)&self->_rid, 0);
}

@end

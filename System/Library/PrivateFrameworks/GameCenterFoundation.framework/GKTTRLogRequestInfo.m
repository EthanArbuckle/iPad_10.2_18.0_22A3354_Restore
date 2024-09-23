@implementation GKTTRLogRequestInfo

- (GKTTRLogRequestInfo)initWithPlayersAndPushTokens:(id)a3 radarID:(id)a4 requesterAlias:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKTTRLogRequestInfo *v11;
  GKTTRLogRequestInfo *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GKTTRLogRequestInfo;
  v11 = -[GKTTRLogRequestInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[GKTTRLogRequestInfo setPlayersAndPushTokens:](v11, "setPlayersAndPushTokens:", v8);
    -[GKTTRLogRequestInfo setRadarID:](v12, "setRadarID:", v9);
    -[GKTTRLogRequestInfo setRequesterAlias:](v12, "setRequesterAlias:", v10);
  }

  return v12;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_282 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_282, &__block_literal_global_283);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_281;
}

void __46__GKTTRLogRequestInfo_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("playersAndPushTokens");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("radarID");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("requesterAlias");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_281;
  secureCodedPropertyKeys_sSecureCodedKeys_281 = v5;

}

- (NSArray)playersAndPushTokens
{
  return self->_playersAndPushTokens;
}

- (void)setPlayersAndPushTokens:(id)a3
{
  objc_storeStrong((id *)&self->_playersAndPushTokens, a3);
}

- (NSString)radarID
{
  return self->_radarID;
}

- (void)setRadarID:(id)a3
{
  objc_storeStrong((id *)&self->_radarID, a3);
}

- (NSString)requesterAlias
{
  return self->_requesterAlias;
}

- (void)setRequesterAlias:(id)a3
{
  objc_storeStrong((id *)&self->_requesterAlias, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterAlias, 0);
  objc_storeStrong((id *)&self->_radarID, 0);
  objc_storeStrong((id *)&self->_playersAndPushTokens, 0);
}

@end

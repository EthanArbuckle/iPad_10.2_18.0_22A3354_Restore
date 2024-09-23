@implementation GKInviteInitiateResponse

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_311 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_311, &__block_literal_global_312);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_310;
}

void __51__GKInviteInitiateResponse_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[11];
  _QWORD v7[12];

  v7[11] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("invitedUserIDs");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = CFSTR("approachUsed");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("cloudKitShareURL");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("sessionToken");
  v7[3] = objc_opt_class();
  v6[4] = CFSTR("playerTokenMap");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v1;
  v6[5] = CFSTR("sessionID");
  v7[5] = objc_opt_class();
  v6[6] = CFSTR("selfPseudonym");
  v7[6] = objc_opt_class();
  v6[7] = CFSTR("selfPushToken");
  v7[7] = objc_opt_class();
  v6[8] = CFSTR("transportVersionToUse");
  v7[8] = objc_opt_class();
  v6[9] = CFSTR("gameParticipantsInfo");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[9] = v2;
  v6[10] = CFSTR("lobbyParticipantsInfo");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[10] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_310;
  secureCodedPropertyKeys_sSecureCodedKeys_310 = v4;

}

- (NSDictionary)invitedUserIDs
{
  return self->_invitedUserIDs;
}

- (void)setInvitedUserIDs:(id)a3
{
  objc_storeStrong((id *)&self->_invitedUserIDs, a3);
}

- (NSNumber)approachUsed
{
  return self->_approachUsed;
}

- (void)setApproachUsed:(id)a3
{
  objc_storeStrong((id *)&self->_approachUsed, a3);
}

- (NSURL)cloudKitShareURL
{
  return self->_cloudKitShareURL;
}

- (void)setCloudKitShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitShareURL, a3);
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (NSDictionary)playerTokenMap
{
  return self->_playerTokenMap;
}

- (void)setPlayerTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_playerTokenMap, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)selfPseudonym
{
  return self->_selfPseudonym;
}

- (void)setSelfPseudonym:(id)a3
{
  objc_storeStrong((id *)&self->_selfPseudonym, a3);
}

- (NSData)selfPushToken
{
  return self->_selfPushToken;
}

- (void)setSelfPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_selfPushToken, a3);
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
  objc_storeStrong((id *)&self->_transportVersionToUse, a3);
}

- (NSArray)gameParticipantsInfo
{
  return self->_gameParticipantsInfo;
}

- (void)setGameParticipantsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_gameParticipantsInfo, a3);
}

- (NSArray)lobbyParticipantsInfo
{
  return self->_lobbyParticipantsInfo;
}

- (void)setLobbyParticipantsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lobbyParticipantsInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lobbyParticipantsInfo, 0);
  objc_storeStrong((id *)&self->_gameParticipantsInfo, 0);
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_selfPushToken, 0);
  objc_storeStrong((id *)&self->_selfPseudonym, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_playerTokenMap, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_cloudKitShareURL, 0);
  objc_storeStrong((id *)&self->_approachUsed, 0);
  objc_storeStrong((id *)&self->_invitedUserIDs, 0);
}

@end

@implementation GKInviteInternal

+ (id)inviteWithBulletin:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  GKInviteInternal *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint8_t v35[16];
  uint8_t buf[16];

  v3 = a3;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "GKMultiplayer Internal: inviteWithBulletin:", buf, 2u);
  }
  v6 = objc_alloc_init(GKInviteInternal);
  objc_msgSend(v3, "sessionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setInviteID:](v6, "setInviteID:", v8);

  objc_msgSend(v3, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setMessage:](v6, "setMessage:", v9);

  objc_msgSend(v3, "originatorPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPlayer:](v6, "setPlayer:", v10);

  objc_msgSend(v3, "sessionToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setSessionToken:](v6, "setSessionToken:", v11);

  objc_msgSend(v3, "inviteVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setVersion:](v6, "setVersion:", objc_msgSend(v12, "unsignedCharValue"));

  objc_msgSend(v3, "originatorPlayerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPeerID:](v6, "setPeerID:", v13);

  objc_msgSend(v3, "peerPushToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPeerPushToken:](v6, "setPeerPushToken:", v14);

  objc_msgSend(v3, "peerNatType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPeerNATType:](v6, "setPeerNATType:", objc_msgSend(v15, "integerValue"));

  objc_msgSend(v3, "peerNatIP");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPeerNATIP:](v6, "setPeerNATIP:", v16);

  objc_msgSend(v3, "peerBlob");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPeerBlob:](v6, "setPeerBlob:", v17);

  -[GKInviteInternal setIsMessageBasedInvite:](v6, "setIsMessageBasedInvite:", objc_msgSend(v3, "isMessageBasedInvite"));
  -[GKInviteInternal setIsNearbyInvite:](v6, "setIsNearbyInvite:", objc_msgSend(v3, "isNearbyInvite"));
  -[GKInviteInternal setIsSharePlayInvite:](v6, "setIsSharePlayInvite:", objc_msgSend(v3, "isSharePlayInvite"));
  objc_msgSend(v3, "declineReason");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setDeclineReason:](v6, "setDeclineReason:", v18);

  objc_msgSend(v3, "transportVersionToUse");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setTransportVersionToUse:](v6, "setTransportVersionToUse:", v19);

  objc_msgSend(v3, "sessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setSessionID:](v6, "setSessionID:", v20);

  objc_msgSend(v3, "peerPseudonym");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPeerPseudonym:](v6, "setPeerPseudonym:", v21);

  if (objc_msgSend(v3, "serverHosted"))
    -[GKInviteInternal setMatchType:](v6, "setMatchType:", 1);
  objc_msgSend(v3, "clientDictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("g"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    v25 = objc_msgSend(v23, "unsignedIntegerValue");
  else
    v25 = 1;
  -[GKInviteInternal setPlayerGroup:](v6, "setPlayerGroup:", v25);
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("gp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    +[GKTransportParticipant participantsFrom:withKey:](GKTransportParticipant, "participantsFrom:withKey:", v22, CFSTR("gp"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKInviteInternal setGameParticipants:](v6, "setGameParticipants:", v27);

  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("lp"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    +[GKTransportParticipant participantsFrom:withKey:](GKTransportParticipant, "participantsFrom:withKey:", v22, CFSTR("lp"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKInviteInternal setLobbyParticipants:](v6, "setLobbyParticipants:", v29);

  }
  objc_msgSend(v22, "objectForKey:", CFSTR("a"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
    -[GKInviteInternal setPlayerAttributes:](v6, "setPlayerAttributes:", objc_msgSend(v30, "unsignedIntValue"));
  if (!os_log_GKGeneral)
    v32 = GKOSLoggers();
  v33 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1BCDE3000, v33, OS_LOG_TYPE_INFO, "inviteWithBulletin: Invite has been set up", v35, 2u);
  }

  return v6;
}

+ (id)inviteFromNearbyPlayer:(id)a3 participantID:(id)a4 deviceID:(id)a5 bundleID:(id)a6 connectionData:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  GKInviteInternal *v16;
  void *v17;
  void *v18;
  void *v19;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(GKInviteInternal);
  -[GKInviteInternal setPlayer:](v16, "setPlayer:", v15);
  -[GKInviteInternal setParticipantID:](v16, "setParticipantID:", v14);

  -[GKInviteInternal setDeviceID:](v16, "setDeviceID:", v13);
  -[GKInviteInternal setBundleID:](v16, "setBundleID:", v12);
  -[GKInviteInternal setPeerBlob:](v16, "setPeerBlob:", v11);

  objc_msgSend(v15, "playerID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKInviteInternal setPeerID:](v16, "setPeerID:", v17);

  -[GKInviteInternal setMatchType:](v16, "setMatchType:", 0);
  objc_msgSend(v15, "playerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKInviteInternal nearbyInviteIDForPlayerID:deviceID:bundleID:](GKInviteInternal, "nearbyInviteIDForPlayerID:deviceID:bundleID:", v18, v13, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKInviteInternal setInviteID:](v16, "setInviteID:", v19);
  return v16;
}

+ (id)nearbyInviteIDForPlayerID:(id)a3 deviceID:(id)a4 bundleID:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), a3, a4, a5);
}

- (GKInviteInternal)init
{
  GKInviteInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKInviteInternal;
  result = -[GKInviteInternal init](&v3, sel_init);
  if (result)
  {
    result->_matchType = 0;
    result->_playerGroup = 1;
    result->_playerAttributes = -1;
  }
  return result;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_200 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_200, &__block_literal_global_201);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_199;
}

void __43__GKInviteInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[27];
  _QWORD v13[28];

  v13[27] = *MEMORY[0x1E0C80C00];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v13[6] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("inviteID"), CFSTR("sessionToken"), CFSTR("player"), CFSTR("participantID"), CFSTR("deviceID"), CFSTR("bundleID"), CFSTR("message"), CFSTR("localizableMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v3;
  v12[8] = CFSTR("matchType");
  v13[8] = objc_opt_class();
  v12[9] = CFSTR("playerGroup");
  v13[9] = objc_opt_class();
  v12[10] = CFSTR("playerAttributes");
  v13[10] = objc_opt_class();
  v12[11] = CFSTR("peerID");
  v13[11] = objc_opt_class();
  v12[12] = CFSTR("peerPushToken");
  v13[12] = objc_opt_class();
  v12[13] = CFSTR("peerNATType");
  v13[13] = objc_opt_class();
  v12[14] = CFSTR("peerNATIP");
  v13[14] = objc_opt_class();
  v12[15] = CFSTR("peerBlob");
  v13[15] = objc_opt_class();
  v12[16] = CFSTR("rid");
  v13[16] = objc_opt_class();
  v12[17] = CFSTR("version");
  v13[17] = objc_opt_class();
  v12[18] = CFSTR("isMessageBasedInvite");
  v13[18] = objc_opt_class();
  v12[19] = CFSTR("isNearbyInvite");
  v13[19] = objc_opt_class();
  v12[20] = CFSTR("isSharePlayInvite");
  v13[20] = objc_opt_class();
  v12[21] = CFSTR("declineReason");
  v13[21] = objc_opt_class();
  v12[22] = CFSTR("transportVersionToUse");
  v13[22] = objc_opt_class();
  v12[23] = CFSTR("sessionID");
  v13[23] = objc_opt_class();
  v12[24] = CFSTR("peerPseudonym");
  v13[24] = objc_opt_class();
  v12[25] = CFSTR("gameParticipants");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[25] = v6;
  v12[26] = CFSTR("lobbyParticipants");
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[26] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 27);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_199;
  secureCodedPropertyKeys_sSecureCodedKeys_199 = v10;

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKInviteInternal inviteID](self, "inviteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKInviteInternal inviteID](self, "inviteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isNearby
{
  return self->_deviceID != 0;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1E75FB320;
}

- (NSString)inviteID
{
  return self->_inviteID;
}

- (void)setInviteID:(id)a3
{
  objc_storeStrong((id *)&self->_inviteID, a3);
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizableMessage, a3);
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(unint64_t)a3
{
  self->_matchType = a3;
}

- (unint64_t)playerGroup
{
  return self->_playerGroup;
}

- (void)setPlayerGroup:(unint64_t)a3
{
  self->_playerGroup = a3;
}

- (unsigned)playerAttributes
{
  return self->_playerAttributes;
}

- (void)setPlayerAttributes:(unsigned int)a3
{
  self->_playerAttributes = a3;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (NSData)peerPushToken
{
  return self->_peerPushToken;
}

- (void)setPeerPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_peerPushToken, a3);
}

- (unint64_t)peerNATType
{
  return self->_peerNATType;
}

- (void)setPeerNATType:(unint64_t)a3
{
  self->_peerNATType = a3;
}

- (NSData)peerNATIP
{
  return self->_peerNATIP;
}

- (void)setPeerNATIP:(id)a3
{
  objc_storeStrong((id *)&self->_peerNATIP, a3);
}

- (NSData)peerBlob
{
  return self->_peerBlob;
}

- (void)setPeerBlob:(id)a3
{
  objc_storeStrong((id *)&self->_peerBlob, a3);
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
  objc_storeStrong((id *)&self->_transportVersionToUse, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)peerPseudonym
{
  return self->_peerPseudonym;
}

- (void)setPeerPseudonym:(id)a3
{
  objc_storeStrong((id *)&self->_peerPseudonym, a3);
}

- (NSString)rid
{
  return self->_rid;
}

- (void)setRid:(id)a3
{
  objc_storeStrong((id *)&self->_rid, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_participantID, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (BOOL)isMessageBasedInvite
{
  return self->_isMessageBasedInvite;
}

- (void)setIsMessageBasedInvite:(BOOL)a3
{
  self->_isMessageBasedInvite = a3;
}

- (BOOL)isNearbyInvite
{
  return self->_isNearbyInvite;
}

- (void)setIsNearbyInvite:(BOOL)a3
{
  self->_isNearbyInvite = a3;
}

- (BOOL)isSharePlayInvite
{
  return self->_isSharePlayInvite;
}

- (void)setIsSharePlayInvite:(BOOL)a3
{
  self->_isSharePlayInvite = a3;
}

- (NSNumber)declineReason
{
  return self->_declineReason;
}

- (void)setDeclineReason:(id)a3
{
  self->_declineReason = (NSNumber *)a3;
}

- (NSSet)gameParticipants
{
  return self->_gameParticipants;
}

- (void)setGameParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_gameParticipants, a3);
}

- (NSSet)lobbyParticipants
{
  return self->_lobbyParticipants;
}

- (void)setLobbyParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_lobbyParticipants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lobbyParticipants, 0);
  objc_storeStrong((id *)&self->_gameParticipants, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_rid, 0);
  objc_storeStrong((id *)&self->_peerPseudonym, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_peerBlob, 0);
  objc_storeStrong((id *)&self->_peerNATIP, 0);
  objc_storeStrong((id *)&self->_peerPushToken, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_inviteID, 0);
}

@end

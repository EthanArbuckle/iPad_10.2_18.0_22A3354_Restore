@implementation GKMatchRequest

- (GKMatchRequest)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GKMatchRequest *v7;

  +[GKInternalRepresentation internalRepresentation](GKMatchRequestInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalPlayerID:", v6);

  v7 = -[GKMatchRequest initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v3);
  return v7;
}

- (GKMatchRequest)initWithInternalRepresentation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKMatchRequest *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  objc_super v11;
  uint8_t buf[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: initWithInternalRepresentation:", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKMatchRequest;
  v7 = -[GKMatchRequest init](&v11, sel_init);
  if (v7)
  {
    if (!v4)
    {
      +[GKInternalRepresentation internalRepresentation](GKMatchRequestInternal, "internalRepresentation");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v7->_internal, v4);
    v8 = dispatch_queue_create("com.apple.GameKit.matchRequest.serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
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
    -[GKMatchRequest internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKMatchRequest internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUInteger v16;
  void *v17;

  v3 = (void *)0x1E0CB3000;
  v17 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[GKMatchRequest minPlayers](self, "minPlayers");
  v6 = -[GKMatchRequest maxPlayers](self, "maxPlayers");
  v7 = -[GKMatchRequest playerGroup](self, "playerGroup");
  -[GKMatchRequest recipients](self, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_gkMapWithBlock:", &__block_literal_global_46);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GKMatchRequest defaultNumberOfPlayers](self, "defaultNumberOfPlayers");
  -[GKMatchRequest inviteMessage](self, "inviteMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[GKMatchRequest inviteMessage](self, "inviteMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("'%@'"), v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p - minPlayers:%u maxPlayers:%u playerGroup:%ld recipients:%@ defaultNumberOfPlayers:%u inviteMessage:%@ playerAttributes:0x%08X>"), v5, self, v16, v6, v7, v9, v10, v13, -[GKMatchRequest playerAttributes](self, "playerAttributes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  return v14;
}

id __29__GKMatchRequest_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conciseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reportableKeyPaths
{
  return &unk_1E75FAED8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[GKMatchRequest internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setInternal:", v7);

  -[GKMatchRequest inviteeResponseHandler](self, "inviteeResponseHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInviteeResponseHandler:", v8);

  -[GKMatchRequest recipientResponseHandler](self, "recipientResponseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipientResponseHandler:", v9);

  return v5;
}

- (BOOL)defaultNumberOfPlayersIsValid
{
  unint64_t v3;
  unint64_t v5;

  if (!-[GKMatchRequest defaultNumberOfPlayers](self, "defaultNumberOfPlayers"))
    return 1;
  v3 = -[GKMatchRequest defaultNumberOfPlayers](self, "defaultNumberOfPlayers");
  if (v3 < -[GKMatchRequest minPlayers](self, "minPlayers"))
    return 0;
  v5 = -[GKMatchRequest defaultNumberOfPlayers](self, "defaultNumberOfPlayers");
  return v5 <= -[GKMatchRequest maxPlayers](self, "maxPlayers");
}

- (id)validateNumbersOfPlayersWithMax:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSUInteger v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKMatchRequest maxPlayers](self, "maxPlayers") > a3)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The maximum number of players must be <= %lu"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userErrorForCode:description:", 17, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = -[GKMatchRequest maxPlayers](self, "maxPlayers");
  if (v9 < -[GKMatchRequest minPlayers](self, "minPlayers"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 17, CFSTR("The maximum number of players can't be less than the minimum number of players."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  if (-[GKMatchRequest minPlayers](self, "minPlayers") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 17, CFSTR("The minimum number of players must be >1"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  if (!-[GKMatchRequest defaultNumberOfPlayersIsValid](self, "defaultNumberOfPlayersIsValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 17, CFSTR("The default number of players is invalid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  -[GKMatchRequest recipients](self, "recipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v15 = -[GKMatchRequest maxPlayers](self, "maxPlayers");

  if (v14 >= v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 17, CFSTR("The number of recipients must be less than the maximum number of players."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

  }
  return v5;
}

- (id)validateForHosted:(BOOL)a3 turnBased:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v4 = a4;
  v5 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[GKMatchRequest playerGroup](self, "playerGroup") != 1
    || -[GKMatchRequest playerAttributes](self, "playerAttributes") != -1;
  -[GKMatchRequest properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = 1;
  }
  else
  {
    -[GKMatchRequest recipientProperties](self, "recipientProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "count") != 0;

  }
  -[GKMatchRequest queueName](self, "queueName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    v13 = 1;
  else
    v13 = v10;

  if (v8 & v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 17, CFSTR("A match request can't have player group/attributes with queue name/properties."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

  }
  -[GKMatchRequest queueName](self, "queueName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
    v16 = 0;
  else
    v16 = v10;

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:description:", 17, CFSTR("A queue name must be specified if properties are configured."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v17);

  }
  +[GKPreferences shared](GKPreferences, "shared");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v4)
  {
    v20 = objc_msgSend(v18, "maxPlayersTurnBased");
  }
  else if (v5)
  {
    v20 = objc_msgSend(v18, "maxPlayersHosted");
  }
  else
  {
    v20 = objc_msgSend(v18, "maxPlayersP2P");
  }
  v21 = v20;

  -[GKMatchRequest validateNumbersOfPlayersWithMax:](self, "validateNumbersOfPlayersWithMax:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v22);

  if (objc_msgSend(v7, "count"))
  {
    if (!os_log_GKGeneral)
      v23 = GKOSLoggers();
    v24 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      v28 = v24;
      objc_msgSend(v27, "numberWithBool:", v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138413570;
      v35 = v29;
      v36 = 2112;
      v37 = v30;
      v38 = 2112;
      v39 = v31;
      v40 = 2112;
      v41 = v32;
      v42 = 2112;
      v43 = v33;
      v44 = 2112;
      v45 = v7;
      _os_log_debug_impl(&dword_1BCDE3000, v28, OS_LOG_TYPE_DEBUG, "Invalid match request. Hosted: %@, turnBased: %@, hasClassicParams: %@, hasRuleProperties: %@, hasRuleParams: %@.\nValidationErrors: %@", (uint8_t *)&v34, 0x3Eu);

    }
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingErrors:", 13, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)validateForHosted:(BOOL)a3
{
  return -[GKMatchRequest validateForHosted:turnBased:](self, "validateForHosted:turnBased:", a3, 0);
}

- (id)validateForTurnBased
{
  return -[GKMatchRequest validateForHosted:turnBased:](self, "validateForHosted:turnBased:", 0, 1);
}

- (void)ensureValidityHosted:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint8_t v13[16];

  v3 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: ensureValidityHosted", v13, 2u);
  }
  +[GKPreferences shared](GKPreferences, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
    v9 = objc_msgSend(v7, "maxPlayersHosted");
  else
    v9 = objc_msgSend(v7, "maxPlayersP2P");
  v10 = v9;
  if (-[GKMatchRequest maxPlayers](self, "maxPlayers") <= v9)
    v10 = -[GKMatchRequest maxPlayers](self, "maxPlayers");
  -[GKMatchRequest setMaxPlayers:](self, "setMaxPlayers:", v10);
  if (-[GKMatchRequest minPlayers](self, "minPlayers"))
    v11 = -[GKMatchRequest minPlayers](self, "minPlayers");
  else
    v11 = 1;
  -[GKMatchRequest setMinPlayers:](self, "setMinPlayers:", v11);
  if (-[GKMatchRequest defaultNumberOfPlayersIsValid](self, "defaultNumberOfPlayersIsValid"))
    v12 = -[GKMatchRequest defaultNumberOfPlayers](self, "defaultNumberOfPlayers");
  else
    v12 = -[GKMatchRequest maxPlayers](self, "maxPlayers");
  -[GKMatchRequest setDefaultNumberOfPlayers:](self, "setDefaultNumberOfPlayers:", v12);

}

- (void)removeLocalPlayerFromPlayersToInvite
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker: removeLocalPlayerFromPlayersToInvite", v16, 2u);
  }
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchRequest internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipientPlayerIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99DE8];
    -[GKMatchRequest internal](self, "internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recipientPlayerIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "removeObject:", v5);
    -[GKMatchRequest internal](self, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRecipientPlayerIDs:", v14);

  }
}

+ (NSUInteger)maxPlayersAllowedForMatchOfType:(GKMatchType)matchType
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  id v8;

  +[GKPreferences shared](GKPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  switch(matchType)
  {
    case GKMatchTypeTurnBased:
      v6 = objc_msgSend(v4, "maxPlayersTurnBased");
      goto LABEL_7;
    case GKMatchTypeHosted:
      v6 = objc_msgSend(v4, "maxPlayersHosted");
      goto LABEL_7;
    case GKMatchTypePeerToPeer:
      v6 = objc_msgSend(v4, "maxPlayersP2P");
LABEL_7:
      v7 = v6;
      goto LABEL_9;
  }
  v7 = 0;
LABEL_9:
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    +[GKMatchRequest maxPlayersAllowedForMatchOfType:].cold.1();

  return v7;
}

- (BOOL)isRecipientCountValid
{
  GKMatchRequest *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  -[GKMatchRequest recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") + 1;
  LOBYTE(v2) = v4 <= -[GKMatchRequest maxPlayers](v2, "maxPlayers");

  return (char)v2;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKMatchRequest;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKMatchRequest;
  -[GKMatchRequest methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKMatchRequest forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKMatchRequest;
  if (-[GKMatchRequest respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKMatchRequest forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL result;
  int v5;

  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  v5 = GKApplicationLinkedOnOrAfter();
  result = 0;
  if (v5)
    return +[GKMatchRequestInternal instancesRespondToSelector:](GKMatchRequestInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)guestPlayers
{
  void *v2;
  void *v3;

  -[GKMatchRequest recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkGuestPlayersFromPlayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)recipients
{
  void *v2;
  void *v3;
  void *v4;

  -[GKMatchRequest internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkPlayersFromInternals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_gkValidatePlayersForReturnFromAPI");
  return (NSArray *)v4;
}

- (void)setRecipients:(NSArray *)recipients
{
  NSArray *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = recipients;
  if (GKApplicationLinkedOnOrAfter())
  {
    v5 = -[NSArray count](v4, "count");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 != v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("All recipients must be unique %@"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ ([recipients count] == [[NSMutableSet setWithArray:recipients] count])\n[%s (%s:%d)]"), v9, "-[GKMatchRequest setRecipients:]", objc_msgSend(v11, "UTF8String"), 294);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
    }
  }
  -[NSArray _gkInternalsFromPlayers](v4, "_gkInternalsFromPlayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchRequest internal](self, "internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRecipients:", v13);

  -[NSArray _gkPlayersIDsFromPlayers](v4, "_gkPlayersIDsFromPlayers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMatchRequest internal](self, "internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRecipientPlayerIDs:", v15);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("request");
  v20[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("GKSetMatchRequestRecipientsNotification"), 0, v18);

}

- (NSString)inviteMessage
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  +[GKPreferences shared](GKPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAllowCustomCommunication");

  if (v4)
  {
    -[GKMatchRequest internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviteMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setInviteMessage:(NSString *)inviteMessage
{
  void *v4;
  int v5;
  void *v6;
  NSString *v7;

  v7 = inviteMessage;
  +[GKPreferences shared](GKPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAllowCustomCommunication");

  if (v5)
  {
    -[GKMatchRequest internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInviteMessage:", v7);

  }
}

- (NSArray)playersToInvite
{
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKMatchRequest playersToInvite].cold.1(v4);
    v8[0] = CFSTR("playerID is no longer available");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GKMatchRequest internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipientPlayerIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v7;
  }
}

- (void)setPlayersToInvite:(NSArray *)playersToInvite
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSArray *v13;

  v13 = playersToInvite;
  if (GKApplicationLinkedOnOrAfter())
  {
    v4 = -[NSArray count](v13, "count");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v4 != v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("All playersToInvite must be unique %@"), v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ ([playersToInvite count] == [[NSMutableSet setWithArray:playersToInvite] count])\n[%s (%s:%d)]"), v8, "-[GKMatchRequest setPlayersToInvite:]", objc_msgSend(v10, "UTF8String"), 340);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
    }
  }
  -[GKMatchRequest internal](self, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRecipientPlayerIDs:", v13);

}

+ (id)sanitizeProperties:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = a3;
  if (!v3)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3) & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v9 = GKOSLoggers();
    v10 = (void *)os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      +[GKMatchRequest sanitizeProperties:].cold.2(v10);
    goto LABEL_13;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      +[GKMatchRequest sanitizeProperties:].cold.1(v6);
    v7 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("gc"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }
LABEL_14:

  return v8;
}

- (void)setProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "sanitizeProperties:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[GKMatchRequest internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperties:", v6);

}

- (NSDictionary)recipientProperties
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[GKMatchRequest serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__GKMatchRequest_recipientProperties__block_invoke;
  v6[3] = &unk_1E75B6448;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (objc_msgSend((id)v8[5], "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __37__GKMatchRequest_recipientProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GKPlayer *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "internal", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipientProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "internal");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recipientProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v13 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v8);
          objc_msgSend(v12, "setObject:forKey:", v11, v13);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)setRecipientProperties:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "setRecipientProperties: %@", buf, 0xCu);
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v13, "isLocalPlayer"))
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("GKLocalPlayer can't have recipient properties"), 0);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v20);
          }
          v14 = (void *)objc_opt_class();
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sanitizeProperties:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "internal");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v16, v17);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }
  -[GKMatchRequest serialQueue](self, "serialQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__GKMatchRequest_setRecipientProperties___block_invoke;
  v21[3] = &unk_1E75B1A28;
  v21[4] = self;
  v22 = v7;
  v19 = v7;
  dispatch_sync(v18, v21);

}

void __41__GKMatchRequest_setRecipientProperties___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecipientProperties:", v4);

  if (v2)
}

- (BOOL)hasFutureRecipientProperties
{
  GKMatchRequest *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[GKMatchRequest serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__GKMatchRequest_hasFutureRecipientProperties__block_invoke;
  v5[3] = &unk_1E75B6448;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __46__GKMatchRequest_hasFutureRecipientProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "internal", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipientProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "internal");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recipientProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("gc"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("<future>"));

        if (v13)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)expectFutureRecipientPropertiesForPlayers:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  GKMatchRequest *v10;

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    -[GKMatchRequest expectFutureRecipientPropertiesForPlayers:].cold.1();
  -[GKMatchRequest serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__GKMatchRequest_expectFutureRecipientPropertiesForPlayers___block_invoke;
  v8[3] = &unk_1E75B1A28;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __60__GKMatchRequest_expectFutureRecipientPropertiesForPlayers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFString *v14;
  const __CFString *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v5);
        v7 = *(void **)(a1 + 40);
        v14 = CFSTR("gc");
        v15 = CFSTR("<future>");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateRecipientProperties:forPlayer:withSanitization:", v8, v6, 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v3);
  }

}

- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!os_log_GKGeneral)
    v8 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    -[GKMatchRequest updateRecipientProperties:forPlayer:].cold.1();
  -[GKMatchRequest serialQueue](self, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__GKMatchRequest_updateRecipientProperties_forPlayer___block_invoke;
  block[3] = &unk_1E75B1A78;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

uint64_t __54__GKMatchRequest_updateRecipientProperties_forPlayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecipientProperties:forPlayer:withSanitization:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4 withSanitization:(BOOL)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  const char *label;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  id v37;

  v37 = a3;
  v8 = a4;
  dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue();
  -[GKMatchRequest serialQueue](self, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = 0x1E0CB3000;
  v12 = 0x1E0C99000;
  if (v9 != v10)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v36 = a5;
    label = dispatch_queue_get_label(v9);
    -[GKMatchRequest serialQueue](self, "serialQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_get_label(v15);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKMatchRequest updateRecipientProperties:forPlayer:withSanitization:]", label, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v18, "-[GKMatchRequest updateRecipientProperties:forPlayer:withSanitization:]", objc_msgSend(v20, "UTF8String"), 446);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    a5 = v36;
    v12 = 0x1E0C99000uLL;

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v21);
    v11 = 0x1E0CB3000uLL;
  }

  if (objc_msgSend(v8, "isLocalPlayer"))
  {
    v22 = *(void **)(v11 + 2368);
    objc_msgSend(v22, "stringWithFormat:", CFSTR("GKLocalPlayer can't have recipient properties"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v11 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastPathComponent");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ (!player.isLocalPlayer)\n[%s (%s:%d)]"), v23, "-[GKMatchRequest updateRecipientProperties:forPlayer:withSanitization:]", objc_msgSend(v25, "UTF8String"), 447);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v12 + 3488), "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v26);
  }
  v27 = (void *)MEMORY[0x1E0C99E08];
  -[GKMatchRequest internal](self, "internal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "recipientProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryWithDictionary:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend((id)objc_opt_class(), "sanitizeProperties:", v37);
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = v37;
  }
  v32 = v31;
  if (objc_msgSend(v31, "count"))
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, v8);
  else
    objc_msgSend(v30, "removeObjectForKey:", v8);
  v33 = objc_msgSend(v30, "count");
  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  -[GKMatchRequest internal](self, "internal");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setRecipientProperties:", v34);

  if (v33)
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKMatchRequest internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKMatchRequest internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (void)loadRecipientsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: loadRecipientsWithCompletionHandler", buf, 2u);
  }
  -[GKMatchRequest recipients](self, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[GKMatchRequest recipients](self, "recipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_gkNonGuestPlayersFromPlayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_gkPlayersIDsFromPlayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GKMatchRequest internal](self, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipientPlayerIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!os_log_GKGeneral)
    v12 = GKOSLoggers();
  v13 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v11;
    _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "Load recipients -- invitees:%@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m", 486, "-[GKMatchRequest loadRecipientsWithCompletionHandler:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v11, "count");
  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke;
    v22[3] = &unk_1E75B1788;
    v23 = v11;
    v24 = v15;
    objc_msgSend(v24, "perform:", v22);

  }
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_1E75B1BF0;
    v21 = v4;
    v20 = v15;
    objc_msgSend(v20, "notifyOnQueue:block:", v18, v19);

  }
}

void __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E75B1C58;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  +[GKPlayer loadPlayersForLegacyIdentifiers:withCompletionHandler:](GKPlayer, "loadPlayersForLegacyIdentifiers:withCompletionHandler:", v4, v6);

}

void __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResult:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  if (objc_msgSend(v8, "count")
    && !+[GKMatchmaker canPlayMultiplayerGameWithPlayers:](GKMatchmaker, "canPlayMultiplayerGameWithPlayers:", v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "setResult:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (BOOL)isIncorrectlyInvitingPlayers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[GKMatchRequest internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipientPlayerIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

    return -[GKMatchRequest isConfiguredForAutomatchOnly](self, "isConfiguredForAutomatchOnly");
  }
  -[GKMatchRequest recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return -[GKMatchRequest isConfiguredForAutomatchOnly](self, "isConfiguredForAutomatchOnly");
  return 0;
}

- (GKMatchRequestInternal)internal
{
  return (GKMatchRequestInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)inviteeResponseHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInviteeResponseHandler:(void *)inviteeResponseHandler
{
  objc_setProperty_atomic_copy(self, a2, inviteeResponseHandler, 16);
}

- (void)recipientResponseHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setRecipientResponseHandler:(void *)recipientResponseHandler
{
  objc_setProperty_atomic_copy(self, a2, recipientResponseHandler, 24);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_recipientResponseHandler, 0);
  objc_storeStrong(&self->_inviteeResponseHandler, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

+ (void)maxPlayersAllowedForMatchOfType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_0();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_0_6(&dword_1BCDE3000, v0, v1, "The maximum players allowed is: %lu for match type: %lu", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)playersToInvite
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = 136446722;
  v2 = "-[GKMatchRequest playersToInvite]";
  v3 = 2114;
  v4 = CFSTR("14.0");
  v5 = 2114;
  v6 = CFSTR("11.0");
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

+ (void)sanitizeProperties:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "<Warning>: The provided match properties contain the 'gc' key, which is reserved and has been removed.", v1, 2u);
}

+ (void)sanitizeProperties:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  +[GKMatchRequestInternal secureCodedPropertyKeys](GKMatchRequestInternal, "secureCodedPropertyKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("properties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_ERROR, "<Warning>: The provided match properties contain unsupported types (supported: %{public}@).", v6, 0xCu);

}

- (void)expectFutureRecipientPropertiesForPlayers:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1BCDE3000, v0, OS_LOG_TYPE_DEBUG, "expectFutureRecipientPropertiesForPlayers: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)updateRecipientProperties:forPlayer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_6(&dword_1BCDE3000, v0, v1, "updateRecipientProperties: %@ for player: %@");
  OUTLINED_FUNCTION_2();
}

@end

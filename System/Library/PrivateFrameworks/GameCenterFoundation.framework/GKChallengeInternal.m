@implementation GKChallengeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_22 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_22, &__block_literal_global_63);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_22;
}

void __46__GKChallengeInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[10];
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("challengeID"), CFSTR("bundleID"), CFSTR("issueDate"), CFSTR("completionDate"), CFSTR("state"), CFSTR("compatibleBundleIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[5] = v3;
  v6[6] = CFSTR("message");
  v7[6] = objc_opt_class();
  v6[7] = CFSTR("game");
  v7[7] = objc_opt_class();
  v6[8] = CFSTR("issuingPlayer");
  v7[8] = objc_opt_class();
  v6[9] = CFSTR("receivingPlayer");
  v7[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 10);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_22;
  secureCodedPropertyKeys_sSecureCodedKeys_22 = v4;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeInternal;
  -[GKInternalRepresentation encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[GKPlayerInternal playerID](self->_issuingPlayer, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GKPlayerInternal playerID](self->_issuingPlayer, "playerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("issuingPlayerID"));

  }
  -[GKPlayerInternal playerID](self->_receivingPlayer, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GKPlayerInternal playerID](self->_receivingPlayer, "playerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("receivingPlayerID"));

  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKChallengeInternal challengeID](self, "challengeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKChallengeInternal challengeID](self, "challengeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "challengeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)internalRepresentation
{
  return 0;
}

- (id)serverRepresentationForReceivingPlayer:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", 0);
  -[GKChallengeInternal bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("bundle-id"));

  objc_msgSend(v5, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("receiving-player-id"));
  objc_msgSend(MEMORY[0x1E0C99D68], "_gkServerTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("issue-timestamp"));

  -[GKChallengeInternal message](self, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GKChallengeInternal message](self, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("message"));

  }
  return v6;
}

- (id)findLocalGameBundleID
{
  void *v3;
  NSOrderedSet *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_compatibleBundleIDs;
  v5 = (id)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v3, "applicationProxyForBundleID:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isInstalled") && (objc_msgSend(v9, "isRestricted") & 1) == 0)
        {
          v5 = v8;

          goto LABEL_12;
        }

      }
      v5 = (id)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v5;
}

- (unint64_t)type
{
  return 0;
}

- (NSString)titleText
{
  id v2;
  void *v3;

  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKError;
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    -[GKChallengeInternal titleText].cold.1(v3);
  return 0;
}

- (NSString)subtitleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[GCFLocalizedStrings SHORT_FROM_SUBTITLE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHORT_FROM_SUBTITLE_FORMAT");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengeInternal issuingPlayer](self, "issuingPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1E75FB2A8;
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
  objc_storeStrong((id *)&self->_challengeID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSDate)issueDate
{
  return self->_issueDate;
}

- (void)setIssueDate:(id)a3
{
  objc_storeStrong((id *)&self->_issueDate, a3);
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_completionDate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSOrderedSet)compatibleBundleIDs
{
  return self->_compatibleBundleIDs;
}

- (void)setCompatibleBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_compatibleBundleIDs, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (GKGameInternal)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (GKPlayerInternal)issuingPlayer
{
  return self->_issuingPlayer;
}

- (void)setIssuingPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_issuingPlayer, a3);
}

- (GKPlayerInternal)receivingPlayer
{
  return self->_receivingPlayer;
}

- (void)setReceivingPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_receivingPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivingPlayer, 0);
  objc_storeStrong((id *)&self->_issuingPlayer, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_compatibleBundleIDs, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_issueDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_challengeID, 0);
}

- (void)titleText
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_ERROR, "%@ needs to implement me!", (uint8_t *)&v4, 0xCu);

}

@end

@implementation GKTTRMultiplayerParticipant

- (GKTTRMultiplayerParticipant)initWithPlayerID:(id)a3 pushToken:(id)a4
{
  id v6;
  id v7;
  GKTTRMultiplayerParticipant *v8;
  GKTTRMultiplayerParticipant *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKTTRMultiplayerParticipant;
  v8 = -[GKTTRMultiplayerParticipant init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GKTTRMultiplayerParticipant setPlayerID:](v8, "setPlayerID:", v6);
    -[GKTTRMultiplayerParticipant setPushToken:](v9, "setPushToken:", v7);
  }

  return v9;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_259 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_259, &__block_literal_global_260);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_258;
}

void __54__GKTTRMultiplayerParticipant_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0, CFSTR("playerID"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("pushToken");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_258;
  secureCodedPropertyKeys_sSecureCodedKeys_258 = v2;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "playerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTTRMultiplayerParticipant playerID](self, "playerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "pushToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTTRMultiplayerParticipant pushToken](self, "pushToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToData:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[GKTTRMultiplayerParticipant playerID](self, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[GKTTRMultiplayerParticipant pushToken](self, "pushToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)serverRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[GKTTRMultiplayerParticipant playerID](self, "playerID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[GKTTRMultiplayerParticipant pushToken](self, "pushToken"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Invalid GKTTRMultiplayerParticipant for: %@. Call Stack: %@"), self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerServiceInterface.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (self.playerID != nil && self.pushToken != nil)\n[%s (%s:%d)]"), v8, "-[GKTTRMultiplayerParticipant serverRepresentation]", objc_msgSend(v10, "UTF8String"), 245);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  v16[0] = CFSTR("id");
  -[GKTTRMultiplayerParticipant playerID](self, "playerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("push-token");
  v17[0] = v12;
  -[GKTTRMultiplayerParticipant pushToken](self, "pushToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

@end

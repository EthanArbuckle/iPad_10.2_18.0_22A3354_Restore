@implementation GKFriendActivityInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_491 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_491, &__block_literal_global_492);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_490;
}

void __51__GKFriendActivityInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("playerID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("context");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("imageURL");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("timestamp");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_490;
  secureCodedPropertyKeys_sSecureCodedKeys_490 = v0;

}

- (GKFriendActivityInternal)initWithServerRepresentation:(id)a3
{
  id v4;
  GKFriendActivityInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKFriendActivityInternal;
  v5 = -[GKFriendActivityInternal init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("player-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFriendActivityInternal setPlayerID:](v5, "setPlayerID:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFriendActivityInternal setContext:](v5, "setContext:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image-url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFriendActivityInternal setImageURL:](v5, "setImageURL:", v8);

    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_gkDateFromServerTimestamp:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFriendActivityInternal setTimestamp:](v5, "setTimestamp:", v11);

  }
  return v5;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

@end

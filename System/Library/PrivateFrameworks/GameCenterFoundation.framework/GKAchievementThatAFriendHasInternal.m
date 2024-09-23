@implementation GKAchievementThatAFriendHasInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_25 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_25, &__block_literal_global_26_0);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_24;
}

void __62__GKAchievementThatAFriendHasInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("friendPlayer");
  v2[1] = CFSTR("timestamp");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_24;
  secureCodedPropertyKeys_sSecureCodedKeys_24 = v0;

}

- (GKPlayerInternal)friendPlayer
{
  return self->friendPlayer;
}

- (void)setFriendPlayer:(id)a3
{
  objc_storeStrong((id *)&self->friendPlayer, a3);
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timestamp, 0);
  objc_storeStrong((id *)&self->friendPlayer, 0);
}

@end

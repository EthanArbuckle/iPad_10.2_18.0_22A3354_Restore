@implementation GKLeaderboardChallengeActiveInternal

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__GKLeaderboardChallengeActiveInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_306 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_306, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_305;
}

void __63__GKLeaderboardChallengeActiveInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___GKLeaderboardChallengeActiveInternal;
  objc_msgSendSuper2(&v7, sel_secureCodedPropertyKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = CFSTR("localizedText");
  v9[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_305;
  secureCodedPropertyKeys_sSecureCodedKeys_305 = v5;

}

+ (id)initWithServerFragment:(id)a3
{
  id v3;
  GKLeaderboardChallengeActiveInternal *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeActiveInternal);
  -[GKLeaderboardChallengeDetailsInternal updateWithServerFragment:](v4, "updateWithServerFragment:", v3);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("card-text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardChallengeActiveInternal setLocalizedText:](v4, "setLocalizedText:", v5);
  return v4;
}

- (NSString)localizedText
{
  return self->_localizedText;
}

- (void)setLocalizedText:(id)a3
{
  objc_storeStrong((id *)&self->_localizedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedText, 0);
}

@end

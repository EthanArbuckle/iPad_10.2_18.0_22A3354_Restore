@implementation GKBaseLeaderboardChallengeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_87 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_87, &__block_literal_global_88);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_86;
}

void __61__GKBaseLeaderboardChallengeInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("challengeID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("bundleID");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("startDate");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("endDate");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_86;
  secureCodedPropertyKeys_sSecureCodedKeys_86 = v0;

}

- (void)updateWithServerResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("challenge-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseLeaderboardChallengeInternal setChallengeID:](self, "setChallengeID:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseLeaderboardChallengeInternal setBundleID:](self, "setBundleID:", v6);

  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start-timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_gkDateFromServerTimestamp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseLeaderboardChallengeInternal setStartDate:](self, "setStartDate:", v9);

  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end-timestamp"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_gkDateFromServerTimestamp:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKBaseLeaderboardChallengeInternal setEndDate:](self, "setEndDate:", v11);

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

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_challengeID, 0);
}

@end

@implementation FCSportsData

- (FCSportsData)initWithDictionary:(id)a3
{
  id v4;
  FCSportsData *v5;
  FCSportsData *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCSportsData;
  v5 = -[FCSportsData init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[FCSportsData _inflateSportsDataFromJSONDictionary:](v5, "_inflateSportsDataFromJSONDictionary:", v4);

  return v6;
}

- (void)_inflateSportsDataFromJSONDictionary:(id)a3
{
  NSString *v4;
  NSString *UMCCanonicalID;
  NSString *v6;
  NSString *sportsPrimaryName;
  NSString *v8;
  NSString *sportsNameAbbreviation;
  NSString *v10;
  NSString *sportsSecondaryName;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *sportsSecondaryShortName;
  NSString *v16;
  NSString *sportsFullName;
  NSString *v18;
  NSString *topLevelSportTagIdentifier;
  NSArray *v20;
  NSArray *topLevelGroupsTagIdentifiers;
  void *v22;
  NSString *v23;
  NSString *sportsLocation;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *sportsTypeDisplayName;
  NSString *v29;
  NSString *sportsTypePluralizedDisplayName;
  void *v31;
  void *v32;
  NSDate *v33;
  NSDate *sportsEventStartTime;
  id v35;

  v35 = a3;
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("umcCanonicalId"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  UMCCanonicalID = self->_UMCCanonicalID;
  self->_UMCCanonicalID = v4;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("primaryName"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsPrimaryName = self->_sportsPrimaryName;
  self->_sportsPrimaryName = v6;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("nameAbbreviation"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsNameAbbreviation = self->_sportsNameAbbreviation;
  self->_sportsNameAbbreviation = v8;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("secondaryName"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsSecondaryName = self->_sportsSecondaryName;
  self->_sportsSecondaryName = v10;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("shortSecondaryName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("secondaryShortName"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  sportsSecondaryShortName = self->_sportsSecondaryShortName;
  self->_sportsSecondaryShortName = v14;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("fullName"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsFullName = self->_sportsFullName;
  self->_sportsFullName = v16;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("topLevelSportTagId"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  topLevelSportTagIdentifier = self->_topLevelSportTagIdentifier;
  self->_topLevelSportTagIdentifier = v18;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("topLevelGroupsTagIds"));
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  topLevelGroupsTagIdentifiers = self->_topLevelGroupsTagIdentifiers;
  self->_topLevelGroupsTagIdentifiers = v20;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("nickname"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("nickName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_sportsNickname, v22);
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("location"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsLocation = self->_sportsLocation;
  self->_sportsLocation = v23;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("hideLocationInMasthead"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hideLocationInMasthead = objc_msgSend(v25, "BOOLValue");
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sportsType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sportsType = FCSportsTypeFromString((uint64_t)v26);
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sportsTypeDisplayName"));
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsTypeDisplayName = self->_sportsTypeDisplayName;
  self->_sportsTypeDisplayName = v27;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sportsTypePluralizedDisplayName"));
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsTypePluralizedDisplayName = self->_sportsTypePluralizedDisplayName;
  self->_sportsTypePluralizedDisplayName = v29;

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("leagueType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sportsLeagueType = FCSportsLeagueTypeFromString((uint64_t)v31);
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("startTime"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateFromStringWithISO8601Format:", v32);
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    sportsEventStartTime = self->_sportsEventStartTime;
    self->_sportsEventStartTime = v33;
  }
  else
  {
    sportsEventStartTime = self->_sportsEventStartTime;
    self->_sportsEventStartTime = 0;
  }

}

- (NSString)UMCCanonicalID
{
  return self->_UMCCanonicalID;
}

- (void)setUMCCanonicalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sportsPrimaryName
{
  return self->_sportsPrimaryName;
}

- (void)setSportsPrimaryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sportsNameAbbreviation
{
  return self->_sportsNameAbbreviation;
}

- (void)setSportsNameAbbreviation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sportsSecondaryName
{
  return self->_sportsSecondaryName;
}

- (void)setSportsSecondaryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sportsSecondaryShortName
{
  return self->_sportsSecondaryShortName;
}

- (void)setSportsSecondaryShortName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sportsFullName
{
  return self->_sportsFullName;
}

- (void)setSportsFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)topLevelSportTagIdentifier
{
  return self->_topLevelSportTagIdentifier;
}

- (void)setTopLevelSportTagIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)topLevelGroupsTagIdentifiers
{
  return self->_topLevelGroupsTagIdentifiers;
}

- (void)setTopLevelGroupsTagIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelGroupsTagIdentifiers, a3);
}

- (NSString)sportsNickname
{
  return self->_sportsNickname;
}

- (void)setSportsNickname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)sportsLocation
{
  return self->_sportsLocation;
}

- (void)setSportsLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)hideLocationInMasthead
{
  return self->_hideLocationInMasthead;
}

- (void)setHideLocationInMasthead:(BOOL)a3
{
  self->_hideLocationInMasthead = a3;
}

- (unint64_t)sportsType
{
  return self->_sportsType;
}

- (void)setSportsType:(unint64_t)a3
{
  self->_sportsType = a3;
}

- (NSString)sportsTypeDisplayName
{
  return self->_sportsTypeDisplayName;
}

- (void)setSportsTypeDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)sportsTypePluralizedDisplayName
{
  return self->_sportsTypePluralizedDisplayName;
}

- (void)setSportsTypePluralizedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)sportsLeagueType
{
  return self->_sportsLeagueType;
}

- (void)setSportsLeagueType:(unint64_t)a3
{
  self->_sportsLeagueType = a3;
}

- (NSDate)sportsEventStartTime
{
  return self->_sportsEventStartTime;
}

- (void)setSportsEventStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsEventStartTime, 0);
  objc_storeStrong((id *)&self->_sportsTypePluralizedDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsTypeDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsLocation, 0);
  objc_storeStrong((id *)&self->_sportsNickname, 0);
  objc_storeStrong((id *)&self->_topLevelGroupsTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_topLevelSportTagIdentifier, 0);
  objc_storeStrong((id *)&self->_sportsFullName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryShortName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryName, 0);
  objc_storeStrong((id *)&self->_sportsNameAbbreviation, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryName, 0);
  objc_storeStrong((id *)&self->_UMCCanonicalID, 0);
}

@end

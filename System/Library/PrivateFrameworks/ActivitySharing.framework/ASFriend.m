@implementation ASFriend

- (void)setSnapshots:(id)a3
{
  NSNumber *currentCacheIndex;
  id v6;

  objc_storeStrong((id *)&self->_snapshots, a3);
  v6 = a3;
  currentCacheIndex = self->_currentCacheIndex;
  self->_currentCacheIndex = 0;

}

- (BOOL)isActivityDataCurrentlyVisibleToMe
{
  void *v2;
  char v3;

  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActivityDataVisible");

  return v3;
}

- (BOOL)isFriendshipCurrentlyActive
{
  void *v3;
  void *v4;
  char v5;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFriendshipActive"))
    v5 = objc_msgSend(v4, "isFriendshipActive");
  else
    v5 = 0;

  return v5;
}

- (_HKFitnessFriendActivitySnapshot)currentSnapshotWithGoalsCarriedForward
{
  void *v3;
  void *v4;

  -[ASFriend currentSnapshot](self, "currentSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ASFriend currentCacheIndex](self, "currentCacheIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASFriend _emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:](self, "_emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:", objc_msgSend(v4, "integerValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (_HKFitnessFriendActivitySnapshot *)v3;
}

- (_HKFitnessFriendActivitySnapshot)currentSnapshot
{
  void *v3;
  void *v4;

  -[ASFriend currentCacheIndex](self, "currentCacheIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_snapshots, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_HKFitnessFriendActivitySnapshot *)v4;
}

- (NSNumber)currentCacheIndex
{
  NSNumber *currentCacheIndex;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  currentCacheIndex = self->_currentCacheIndex;
  if (!currentCacheIndex)
  {
    -[ASFriend currentDateComponents](self, "currentDateComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", _HKCacheIndexFromDateComponents());
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentCacheIndex;
    self->_currentCacheIndex = v5;

    currentCacheIndex = self->_currentCacheIndex;
  }
  return currentCacheIndex;
}

- (NSDateComponents)currentDateComponents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ASFriend timeZone](self, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (currentDateComponents_onceToken != -1)
    dispatch_once(&currentDateComponents_onceToken, &__block_literal_global_221);
  objc_msgSend((id)currentDateComponents___friendTimeZoneCalendar, "setTimeZone:", v2);
  v3 = (void *)currentDateComponents___friendTimeZoneCalendar;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 30, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v5;
}

- (NSTimeZone)timeZone
{
  void *v2;
  void *v3;

  -[ASFriend mostRecentSnapshot](self, "mostRecentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSTimeZone *)v3;
}

- (_HKFitnessFriendActivitySnapshot)mostRecentSnapshot
{
  void *v2;
  void *v3;

  -[NSDictionary allValues](self->_snapshots, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HKMostRecentActivitySnapshotInSnapshots();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_HKFitnessFriendActivitySnapshot *)v3;
}

- (ASFriend)initWithActivitySnapshots:(id)a3 friendAchievements:(id)a4 friendWorkouts:(id)a5 contact:(id)a6 competitions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ASFriend *v17;
  ASFriend *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ASFriend;
  v17 = -[ASFriend init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_snapshots, a3);
    objc_storeStrong((id *)&v18->_friendAchievements, a4);
    objc_storeStrong((id *)&v18->_friendWorkouts, a5);
    objc_storeStrong((id *)&v18->_contact, a6);
    objc_storeStrong((id *)&v18->_competitions, a7);
  }

  return v18;
}

- (NSString)displayName
{
  void *v3;
  void *v4;

  if (-[ASFriend isMe](self, "isMe"))
  {
    ActivitySharingBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ME"), &stru_24D059A78, CFSTR("Localizable"));
  }
  else
  {
    -[ASFriend contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isMe
{
  void *v2;
  BOOL v3;

  -[ASFriend contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (ASContact)contact
{
  return self->_contact;
}

- (NSDictionary)snapshots
{
  return self->_snapshots;
}

void __33__ASFriend_currentDateComponents__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentDateComponents___friendTimeZoneCalendar;
  currentDateComponents___friendTimeZoneCalendar = v0;

}

- (id)codableFriendIncludingCloudKitFields:(BOOL)a3
{
  _BOOL8 v3;
  ASCodableFriend *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  ASFriend *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v3 = a3;
  v49 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(ASCodableFriend);
  -[ASFriend contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "codableContactIncludingCloudKitFields:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableFriend setContact:](v5, "setContact:", v7);

  -[ASFriend snapshots](self, "snapshots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_map:", &__block_literal_global_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[ASCodableFriend setSnapshots:](v5, "setSnapshots:", v11);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[ASFriend friendWorkouts](self, "friendWorkouts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v44;
    v17 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v18 = 0;
      v19 = v17;
      do
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        ASCodableWorkoutsFromWorkouts(*(void **)(*((_QWORD *)&v43 + 1) + 8 * v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        ++v18;
        v19 = v17;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v15);
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDBD1A8];
  }

  v22 = (void *)objc_msgSend(v17, "mutableCopy");
  -[ASCodableFriend setWorkouts:](v5, "setWorkouts:", v22);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v38 = self;
  -[ASFriend friendAchievements](self, "friendAchievements");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    v28 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v29 = 0;
      v30 = v28;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        ASCodableAchievementsFromAchievements(*(void **)(*((_QWORD *)&v39 + 1) + 8 * v29));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "allObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        ++v29;
        v30 = v28;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v26);
  }
  else
  {
    v28 = (void *)MEMORY[0x24BDBD1A8];
  }

  v33 = (void *)objc_msgSend(v28, "mutableCopy");
  -[ASCodableFriend setAchievements:](v5, "setAchievements:", v33);

  -[ASFriend competitions](v38, "competitions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "hk_map:", &__block_literal_global_188);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");
  -[ASCodableFriend setCompetitions:](v5, "setCompetitions:", v36);

  return v5;
}

uint64_t __64__ASFriend_DomainCodable__codableFriendIncludingCloudKitFields___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableSnapshot");
}

uint64_t __64__ASFriend_DomainCodable__codableFriendIncludingCloudKitFields___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableCompetition");
}

+ (ASFriend)friendWithCodableFriend:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  void *v25;
  ASFriend *v26;
  _QWORD v28[4];
  id v29;

  v3 = a3;
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASContact contactWithCodableContact:](ASContact, "contactWithCodableContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "snapshots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __51__ASFriend_DomainCodable__friendWithCodableFriend___block_invoke;
  v28[3] = &unk_24D0573C8;
  v29 = v5;
  v7 = v5;
  objc_msgSend(v6, "hk_map:", v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ASSnapshotDictionaryByIndex((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "workouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ASWorkoutsFromCodableWorkouts(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ASWorkoutDictionaryByIndex((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "achievements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ASAchievementsFromCodableAchievements(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ASAchievementDictionaryByIndex((uint64_t)v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "competitions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "hk_map:", &__block_literal_global_193);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[ASFriend initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:]([ASFriend alloc], "initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:", v9, v23, v16, v7, v25);
  return v26;
}

id __51__ASFriend_DomainCodable__friendWithCodableFriend___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD41F0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fitnessFriendActivitySnapshotWithCodableSnapshot:friendUUID:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

ASCompetition *__51__ASFriend_DomainCodable__friendWithCodableFriend___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[ASCompetition competitionWithCodableCompetition:](ASCompetition, "competitionWithCodableCompetition:", a2);
}

- (NSUUID)UUID
{
  return -[ASContact UUID](self->_contact, "UUID");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ASContact relationship](self->_contact, "relationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact remoteRelationship](self->_contact, "remoteRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[ASContact displayName](self->_contact, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASFriend UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("ASFriend %@ (%@), local relationship: %@, remote relationship: %@, competitions: %@"), v6, v7, v3, v4, self->_competitions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fullDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("==================================================================\n"));
  -[ASFriend displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASFriend fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASFriend UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASFriend timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ [%@] (%@) %@\n"), v4, v5, v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("==================================================================\n\n"));
  -[ASContact fullDescription](self->_contact, "fullDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v8);

  -[ASContact relationshipStorage](self->_contact, "relationshipStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("Competitions: %@\n"), self->_competitions);
  objc_msgSend(v3, "appendFormat:", CFSTR("Snapshots: %@\n"), self->_snapshots);
  objc_msgSend(v3, "appendFormat:", CFSTR("Achievements: %@\n"), self->_friendAchievements);
  objc_msgSend(v3, "appendFormat:", CFSTR("Workouts: %@\n"), self->_friendWorkouts);
  objc_msgSend(v3, "appendFormat:", CFSTR("My Data Visible: %d\n"), -[ASFriend canSeeMyActivityData](self, "canSeeMyActivityData"));
  objc_msgSend(v3, "appendFormat:", CFSTR("My Data Explicitly Hidden: %d\n"), -[ASFriend isMyActivityDataCurrentlyHidden](self, "isMyActivityDataCurrentlyHidden"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Friend Data Visible: %d\n"), -[ASFriend isActivityDataCurrentlyVisibleToMe](self, "isActivityDataCurrentlyVisibleToMe"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Friend Explicitly Hiding: %d\n"), -[ASFriend isCurrentlyHidingActivityDataFromMe](self, "isCurrentlyHidingActivityDataFromMe"));
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = (void *)-[NSDictionary copyWithZone:](self->_snapshots, "copyWithZone:", a3);
  v7 = (void *)-[NSDictionary copyWithZone:](self->_friendAchievements, "copyWithZone:", a3);
  v8 = (void *)-[NSDictionary copyWithZone:](self->_friendWorkouts, "copyWithZone:", a3);
  v9 = -[ASContact copyWithZone:](self->_contact, "copyWithZone:", a3);
  v10 = (void *)-[NSArray copyWithZone:](self->_competitions, "copyWithZone:", a3);
  v11 = (void *)objc_msgSend(v5, "initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:", v6, v7, v8, v9, v10);

  return v11;
}

- (BOOL)canSeeMyActivityData
{
  void *v2;
  char v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActivityDataVisible");

  return v3;
}

- (BOOL)isMyActivityDataCurrentlyHidden
{
  void *v2;
  char v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidingActivityData");

  return v3;
}

- (BOOL)isCurrentlyHidingActivityDataFromMe
{
  void *v2;
  char v3;

  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidingActivityData");

  return v3;
}

- (BOOL)isActivityDataVisibleToMeForDate:(id)a3
{
  ASContact *contact;
  id v4;
  void *v5;
  void *v6;

  contact = self->_contact;
  v4 = a3;
  -[ASContact primaryRemoteRelationship](contact, "primaryRemoteRelationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationshipSnapshotForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isActivityDataVisible");
  return (char)v5;
}

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuteEnabled");

  return v3;
}

- (BOOL)isAwaitingInviteResponseFromMe
{
  char v3;
  void *v4;
  int v5;
  char v6;
  char v7;
  void *v8;
  void *v9;

  v3 = ASSecureCloudEnabled();
  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAwaitingInviteResponse");
  v6 = v3 ^ 1;
  v7 = (v3 ^ 1) & v5;
  if ((v6 & 1) == 0 && v5)
  {
    if (objc_msgSend(v4, "cloudType") == 1)
    {
      -[ASContact pendingRelationshipShareItem](self->_contact, "pendingRelationshipShareItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[ASContact pendingLegacyShareLocations](self->_contact, "pendingLegacyShareLocations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }
  }

  return v7;
}

- (BOOL)sentInviteRequestToMe
{
  char v3;
  void *v4;
  int v5;
  char v6;
  char v7;
  void *v8;
  void *v9;

  v3 = ASSecureCloudEnabled();
  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasIncomingInviteRequest");
  v6 = v3 ^ 1;
  v7 = (v3 ^ 1) & v5;
  if ((v6 & 1) == 0 && v5)
  {
    if (objc_msgSend(v4, "cloudType") == 1)
    {
      -[ASContact pendingRelationshipShareItem](self->_contact, "pendingRelationshipShareItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[ASContact pendingLegacyShareLocations](self->_contact, "pendingLegacyShareLocations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }
  }

  return v7;
}

- (BOOL)hasInviteRequestFromMe
{
  void *v2;
  char v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasOutgoingInviteRequest");

  return v3;
}

- (BOOL)inviteRequestToMeWasAccepted
{
  void *v3;
  void *v4;
  int v5;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIncomingInviteRequest"))
  {
    -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAwaitingInviteResponse") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSDate)dateForLatestOutgoingInviteRequest
{
  void *v2;
  void *v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateForLatestOutgoingInviteRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)dateForLatestDataHiddenFromMe
{
  void *v2;
  void *v3;

  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateForLatestDataHidden");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)dateForLatestDataHidden
{
  void *v2;
  void *v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateForLatestDataHidden");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)dateActivityDataInitiallyBecameVisibleToMe
{
  void *v2;
  void *v3;

  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateActivityDataInitiallyBecameVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isHidingActivityDataFromMeForDate:(id)a3
{
  ASContact *contact;
  id v4;
  void *v5;
  void *v6;

  contact = self->_contact;
  v4 = a3;
  -[ASContact primaryRemoteRelationship](contact, "primaryRemoteRelationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationshipSnapshotForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isHidingActivityData");
  return (char)v5;
}

- (NSDate)dateForLatestRelationshipStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate *v8;

  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateForLatestRelationshipStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateForLatestRelationshipStart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hk_isAfterDate:", v6))
    v7 = v4;
  else
    v7 = v6;
  v8 = v7;

  return v8;
}

- (NSDate)dateForLatestOutgoingCompetitionRequest
{
  void *v2;
  void *v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateForLatestOutgoingCompetitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)dateForLatestIncomingCompetitionRequest
{
  void *v2;
  void *v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateForLatestIncomingCompetitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isAwaitingCompetitionResponseFromMe
{
  char v3;
  void *v4;
  void *v5;
  char HasExpired;

  if (-[ASFriend isCompetitionActive](self, "isCompetitionActive"))
    return 0;
  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasIncomingCompetitionRequest"))
  {
    -[ASFriend dateForLatestIncomingCompetitionRequest](self, "dateForLatestIncomingCompetitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HasExpired = ASCompetitionRequestHasExpired(v5);

    v3 = HasExpired ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)hasCompetitionRequestFromMe
{
  void *v2;
  char v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasOutgoingCompetitionRequest");

  return v3;
}

- (BOOL)hasPendingCompetitionRequestFromMe
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char HasExpired;

  if (!-[ASFriend isCompetitionActive](self, "isCompetitionActive"))
  {
    v3 = -[ASFriend hasCompetitionRequestFromMe](self, "hasCompetitionRequestFromMe");
    if (!v3)
      return v3;
    if (!-[ASFriend ignoredCompetitionRequestFromMe](self, "ignoredCompetitionRequestFromMe"))
      goto LABEL_6;
    -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateForLatestIgnoredCompetitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASFriend dateForLatestOutgoingCompetitionRequest](self, "dateForLatestOutgoingCompetitionRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hk_isAfterDate:", v6);

    if ((v7 & 1) == 0)
    {
LABEL_6:
      -[ASFriend dateForLatestOutgoingCompetitionRequest](self, "dateForLatestOutgoingCompetitionRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HasExpired = ASCompetitionRequestHasExpired(v8);

      LOBYTE(v3) = HasExpired ^ 1;
      return v3;
    }
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)ignoredCompetitionRequestFromMe
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIgnoredCompetitionRequest"))
  {
    -[ASFriend dateForLatestOutgoingCompetitionRequest](self, "dateForLatestOutgoingCompetitionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateForLatestIgnoredCompetitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hk_isAfterDate:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isCompetitionActive
{
  void *v3;
  void *v4;
  BOOL v5;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v3, "isCompetitionActive") & 1) != 0
    || objc_msgSend(v3, "hasCompletedCompetition") && (objc_msgSend(v4, "isCompetitionActive") & 1) != 0;

  return v5;
}

- (NSArray)completedCompetitions
{
  NSArray *competitions;
  NSArray *v4;
  BOOL v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  competitions = self->_competitions;
  if (!competitions)
    competitions = (NSArray *)MEMORY[0x24BDBD1A8];
  v4 = competitions;
  if (-[NSArray count](v4, "count"))
  {
    v5 = -[ASFriend isCompetitionActive](self, "isCompetitionActive");
    v6 = -[ASFriend hasCompletedCompetition](self, "hasCompletedCompetition");
    if (v5 || !v6)
    {
      -[NSArray subarrayWithRange:](v4, "subarrayWithRange:", 0, -[NSArray count](v4, "count") - 1);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (NSArray *)v7;
    }
  }
  -[NSArray hk_filter:](v4, "hk_filter:", &__block_literal_global_14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ASCompetitionsSortedByEndDate(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

BOOL __33__ASFriend_completedCompetitions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stage") == 2;
}

- (ASCompetition)mostRecentlyCompletedCompetition
{
  void *v2;
  void *v3;

  -[ASFriend completedCompetitions](self, "completedCompetitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCompetition *)v3;
}

- (ASCompetition)currentOrMostRecentCompetition
{
  if (-[ASFriend isCompetitionActive](self, "isCompetitionActive"))
    -[ASFriend currentCompetition](self, "currentCompetition");
  else
    -[ASFriend mostRecentlyCompletedCompetition](self, "mostRecentlyCompletedCompetition");
  return (ASCompetition *)(id)objc_claimAutoreleasedReturnValue();
}

- (ASCompetition)currentCompetition
{
  void *v3;

  if (-[ASFriend isCompetitionActive](self, "isCompetitionActive"))
  {
    -[NSArray lastObject](self->_competitions, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (ASCompetition *)v3;
}

- (ASCompetition)competitionPendingAcceptance
{
  void *v3;

  if (-[ASFriend hasPendingCompetitionRequestFromMe](self, "hasPendingCompetitionRequestFromMe")
    || -[ASFriend isAwaitingCompetitionResponseFromMe](self, "isAwaitingCompetitionResponseFromMe"))
  {
    -[NSArray lastObject](self->_competitions, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (ASCompetition *)v3;
}

- (BOOL)hasCompletedCompetition
{
  void *v2;
  char v3;

  -[ASContact primaryRelationship](self->_contact, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCompletedCompetition");

  return v3;
}

- (BOOL)hasCompletedFirstDayOfCurrentCompetition
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  v3 = -[ASFriend isCompetitionActive](self, "isCompetitionActive");
  if (v3)
  {
    -[ASFriend currentCompetition](self, "currentCompetition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "stage");

    if (v5 == 1)
    {
      -[ASFriend currentCompetition](self, "currentCompetition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isFirstDayOfCompetition");

      LOBYTE(v3) = v7 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isEligibleToReceiveCompetitionRequest
{
  if (-[ASFriend isCompetitionActive](self, "isCompetitionActive")
    || -[ASFriend isAwaitingCompetitionResponseFromMe](self, "isAwaitingCompetitionResponseFromMe"))
  {
    return 0;
  }
  else
  {
    return !-[ASFriend hasPendingCompetitionRequestFromMe](self, "hasPendingCompetitionRequestFromMe");
  }
}

- (BOOL)hasCompetitionHistory
{
  void *v2;
  BOOL v3;

  -[ASFriend completedCompetitions](self, "completedCompetitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (unint64_t)numberOfCompetitionWinsAgainstMe
{
  void *v2;
  unint64_t v3;

  -[ASFriend completedCompetitions](self, "completedCompetitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ASCompetitionWinCountForParticipant(v2, 1);

  return v3;
}

- (unint64_t)numberOfCompetitionWinsByMe
{
  void *v2;
  unint64_t v3;

  -[ASFriend completedCompetitions](self, "completedCompetitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ASCompetitionWinCountForParticipant(v2, 0);

  return v3;
}

- (NSDate)earliestCompetitionVictoryOrPotentialVictoryDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASFriend isCompetitionActive](self, "isCompetitionActive"))
  {
    -[ASFriend currentCompetition](self, "currentCompetition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ASFriend competitionPendingAcceptance](self, "competitionPendingAcceptance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_6;
    -[ASFriend competitionPendingAcceptance](self, "competitionPendingAcceptance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "endDate");
  v7 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v7;
LABEL_6:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ASFriend completedCompetitions](self, "completedCompetitions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "isParticipantWinning:", 0))
        {
          objc_msgSend(v13, "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "hk_isBeforeDate:", v3);

          if (v15)
          {
            objc_msgSend(v13, "endDate");
            v16 = objc_claimAutoreleasedReturnValue();

            v3 = (void *)v16;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return (NSDate *)v3;
}

- (id)_emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ASFriend mostRecentSnapshot](self, "mostRecentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    _HKStartDateForSnapshotIndex();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKEndDateForSnapshotIndex();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD41F0];
    objc_msgSend(v4, "sourceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_fitnessFriendActivitySnapshotWithSnapshotIndex:startDate:endDate:sourceUUID:", a3, v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "mmg");
    objc_msgSend(v9, "setMmg:");
    objc_msgSend(v4, "energyBurnedGoal");
    objc_msgSend(v9, "setEnergyBurnedGoal:");
    objc_msgSend(v4, "briskMinutesGoal");
    objc_msgSend(v9, "setBriskMinutesGoal:");
    objc_msgSend(v4, "activeHoursGoal");
    objc_msgSend(v9, "setActiveHoursGoal:");
    objc_msgSend(v9, "setAmm:", objc_msgSend(v4, "amm"));
    objc_msgSend(v9, "setHasCarriedForwardGoals:", 1);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)snapshotWithGoalsCarriedForwardForSnapshotIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASFriend snapshots](self, "snapshots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[ASFriend _emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:](self, "_emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:", objc_msgSend(v4, "integerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)estimatedIsStandaloneForSnapshotIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_snapshots, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "activitySummary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isStandalonePhoneSummary");
  }
  else
  {
    -[NSDictionary allKeys](self->_snapshots, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_217);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v10;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v30;
      while (2)
      {
        v15 = 0;
        v16 = v13;
        do
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v7);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
          v18 = objc_msgSend(v17, "longLongValue");
          v19 = objc_msgSend(v4, "longLongValue");
          v13 = v17;
          if (v18 >= v19)
          {

            if (v16 && v13)
            {
              v23 = objc_msgSend(v4, "longLongValue");
              v24 = v23 - objc_msgSend((id)v16, "longLongValue");
              if (v24 >= objc_msgSend((id)v13, "longLongValue") - v23)
                v22 = v13;
              else
                v22 = v16;
              v20 = (void *)v13;
              v6 = 0;
            }
            else
            {
              if (v16)
                v22 = v16;
              else
                v22 = v13;
              v6 = 0;
              if (!(v16 | v13))
                goto LABEL_27;
              v20 = (void *)v13;
            }
            goto LABEL_25;
          }

          ++v15;
          v16 = v13;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v12)
          continue;
        break;
      }

      v20 = 0;
      v21 = 0;
      v22 = v13;
      v16 = v13;
      v6 = 0;
      if (!v13)
        goto LABEL_29;
LABEL_25:
      -[NSDictionary objectForKeyedSubscript:](self->_snapshots, "objectForKeyedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = v25;
        objc_msgSend(v25, "activitySummary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v27, "_isStandalonePhoneSummary");

        goto LABEL_30;
      }
      v21 = v16;
    }
    else
    {

LABEL_27:
      v20 = 0;
      v21 = 0;
    }
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v26, "isStandalonePhoneFitnessMode");
    v16 = v21;
LABEL_30:

  }
  return v8;
}

uint64_t __50__ASFriend_estimatedIsStandaloneForSnapshotIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "longLongValue");
  if (v6 >= objc_msgSend(v5, "longLongValue"))
  {
    v8 = objc_msgSend(v4, "longLongValue");
    v7 = v8 > objc_msgSend(v5, "longLongValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (BOOL)supportsCompetitions
{
  void *v2;
  char v3;

  -[ASContact primaryRemoteRelationship](self->_contact, "primaryRemoteRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCompetitions");

  return v3;
}

- (BOOL)needsDowngradeRequestAcknowledgment
{
  void *v3;
  void *v4;
  char v5;

  if (-[ASContact cloudType](self->_contact, "cloudType") != 1)
    return 0;
  -[ASContact relationshipStorage](self->_contact, "relationshipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legacyRemoteRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "secureCloudDowngradeNeedsAcknowledgement");

  return v5;
}

- (NSString)fullName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[ASFriend isMe](self, "isMe"))
  {
    ActivitySharingBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ME"), &stru_24D059A78, CFSTR("Localizable"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ASFriend contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASFriend contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v6)
      objc_msgSend(v7, "fullName");
    else
      objc_msgSend(v7, "displayName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v4;

  return (NSString *)v8;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSArray)competitions
{
  return self->_competitions;
}

- (void)setCompetitions:(id)a3
{
  objc_storeStrong((id *)&self->_competitions, a3);
}

- (NSDictionary)friendAchievements
{
  return self->_friendAchievements;
}

- (void)setFriendAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_friendAchievements, a3);
}

- (NSDictionary)friendWorkouts
{
  return self->_friendWorkouts;
}

- (void)setFriendWorkouts:(id)a3
{
  objc_storeStrong((id *)&self->_friendWorkouts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendWorkouts, 0);
  objc_storeStrong((id *)&self->_friendAchievements, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_competitions, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_currentCacheIndex, 0);
}

@end

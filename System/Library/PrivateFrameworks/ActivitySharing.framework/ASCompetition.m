@implementation ASCompetition

- (id)codableCompetition
{
  ASCodableCloudKitCompetition *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ASCodableCloudKitCompetition);
  -[ASCompetition UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dataForUUIDBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitCompetition setUuid:](v3, "setUuid:", v5);

  -[ASCodableCloudKitCompetition setCurrentCacheIndex:](v3, "setCurrentCacheIndex:", -[ASCompetition currentCacheIndex](self, "currentCacheIndex"));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[ASCompetition scores](self, "scores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        -[ASCodableCloudKitCompetition addScores:](v3, "addScores:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v10++), "integerValue"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v8);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ASCompetition opponentScores](self, "opponentScores");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        -[ASCodableCloudKitCompetition addOpponentScores:](v3, "addOpponentScores:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v15++), "integerValue"));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v13);
  }

  -[ASCompetition startDateComponents](self, "startDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "as_codableDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitCompetition setStartDateComponents:](v3, "setStartDateComponents:", v17);

  -[ASCompetition durationDateComponents](self, "durationDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "as_codableDateComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitCompetition setDurationDateComponents:](v3, "setDurationDateComponents:", v19);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[ASCompetition preferredVictoryBadgeStyles](self, "preferredVictoryBadgeStyles", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        -[ASCodableCloudKitCompetition addPreferredVictoryBadgeStyles:](v3, "addPreferredVictoryBadgeStyles:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v24++), "unsignedIntValue"));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v22);
  }

  -[ASCodableCloudKitCompetition setMaximumNumberOfPointsPerDay:](v3, "setMaximumNumberOfPointsPerDay:", -[ASCompetition maximumNumberOfPointsPerDay](self, "maximumNumberOfPointsPerDay"));
  return v3;
}

+ (id)competitionWithCodableCompetition:(id)a3
{
  id v3;
  ASCompetition *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  v4 = objc_alloc_init(ASCompetition);
  v5 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_UUIDWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition setUUID:](v4, "setUUID:", v7);

  -[ASCompetition setCurrentCacheIndex:](v4, "setCurrentCacheIndex:", objc_msgSend(v3, "currentCacheIndex"));
  -[ASCompetition setLastPushedCacheIndex:](v4, "setLastPushedCacheIndex:", objc_msgSend(v3, "currentCacheIndex"));
  if (objc_msgSend(v3, "scoresCount"))
  {
    v8 = 0;
    do
    {
      -[ASCompetition scores](v4, "scores");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "scoresAtIndex:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayByAddingObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetition setScores:](v4, "setScores:", v11);

      ++v8;
    }
    while (v8 < objc_msgSend(v3, "scoresCount"));
  }
  if (objc_msgSend(v3, "opponentScoresCount"))
  {
    v12 = 0;
    do
    {
      -[ASCompetition opponentScores](v4, "opponentScores");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "opponentScoresAtIndex:", v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetition setOpponentScores:](v4, "setOpponentScores:", v15);

      ++v12;
    }
    while (v12 < objc_msgSend(v3, "opponentScoresCount"));
  }
  v16 = (void *)MEMORY[0x24BDBCE68];
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "as_dateComponentsWithCodable:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition setStartDateComponents:](v4, "setStartDateComponents:", v18);

  v19 = (void *)MEMORY[0x24BDBCE68];
  objc_msgSend(v3, "durationDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "as_dateComponentsWithCodable:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition setDurationDateComponents:](v4, "setDurationDateComponents:", v21);

  if (objc_msgSend(v3, "preferredVictoryBadgeStylesCount"))
  {
    v22 = 0;
    do
    {
      -[ASCompetition preferredVictoryBadgeStyles](v4, "preferredVictoryBadgeStyles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "preferredVictoryBadgeStylesAtIndex:", v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObject:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCompetition setPreferredVictoryBadgeStyles:](v4, "setPreferredVictoryBadgeStyles:", v25);

      ++v22;
    }
    while (v22 < objc_msgSend(v3, "preferredVictoryBadgeStylesCount"));
  }
  -[ASCompetition setMaximumNumberOfPointsPerDay:](v4, "setMaximumNumberOfPointsPerDay:", objc_msgSend(v3, "maximumNumberOfPointsPerDay"));

  return v4;
}

- (ASCompetition)init
{
  ASCompetition *v2;
  ASCompetition *v3;
  NSArray *scores;
  NSArray *v5;
  NSArray *opponentScores;
  NSArray *preferredVictoryBadgeStyles;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASCompetition;
  v2 = -[ASCompetition init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    scores = v2->_scores;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_scores = (NSArray *)MEMORY[0x24BDBD1A8];

    opponentScores = v3->_opponentScores;
    v3->_opponentScores = v5;

    preferredVictoryBadgeStyles = v3->_preferredVictoryBadgeStyles;
    v3->_preferredVictoryBadgeStyles = v5;

  }
  return v3;
}

- (id)description
{
  NSInteger v3;
  NSInteger v4;
  int64_t currentCacheIndex;
  int64_t lastPushedCacheIndex;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t maximumNumberOfPointsPerDay;
  void *v12;
  void *v13;
  NSInteger v15;
  NSInteger v16;
  NSUUID *UUID;
  void *v18;

  UUID = self->_UUID;
  v18 = (void *)MEMORY[0x24BDD17C8];
  v16 = -[NSDateComponents month](self->_startDateComponents, "month");
  v15 = -[NSDateComponents day](self->_startDateComponents, "day");
  v3 = -[NSDateComponents year](self->_startDateComponents, "year");
  v4 = -[NSDateComponents day](self->_durationDateComponents, "day");
  currentCacheIndex = self->_currentCacheIndex;
  lastPushedCacheIndex = self->_lastPushedCacheIndex;
  ASFormattedSequence(self->_scores);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASCompetition myTotalScore](self, "myTotalScore");
  ASFormattedSequence(self->_opponentScores);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASCompetition opponentTotalScore](self, "opponentTotalScore");
  maximumNumberOfPointsPerDay = self->_maximumNumberOfPointsPerDay;
  ASFormattedVictoryBadgeStyles(self->_preferredVictoryBadgeStyles);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Competition uuid=%@ start=%ld/%ld/%ld duration=%ld days currentCacheIndex=%ld lastPushedCacheIndex=%ld scores=%@(=%ld) opponentScores=%@(=%ld)  maximumNumberOfPointsPerDay=%lu points preferredVictoryBadgeStyles=%@"), UUID, v16, v15, v3, v4, currentCacheIndex, lastPushedCacheIndex, v7, v8, v9, v10, maximumNumberOfPointsPerDay, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  ASCompetition *v4;
  BOOL v5;

  v4 = (ASCompetition *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ASCompetition isEqualToCompetition:](self, "isEqualToCompetition:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setUUID:", self->_UUID);
  objc_msgSend(v5, "setCurrentCacheIndex:", self->_currentCacheIndex);
  objc_msgSend(v5, "setLastPushedCacheIndex:", self->_lastPushedCacheIndex);
  v6 = (void *)-[NSArray copyWithZone:](self->_scores, "copyWithZone:", a3);
  objc_msgSend(v5, "setScores:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_opponentScores, "copyWithZone:", a3);
  objc_msgSend(v5, "setOpponentScores:", v7);

  v8 = (void *)-[NSDateComponents copyWithZone:](self->_startDateComponents, "copyWithZone:", a3);
  objc_msgSend(v5, "setStartDateComponents:", v8);

  v9 = (void *)-[NSDateComponents copyWithZone:](self->_durationDateComponents, "copyWithZone:", a3);
  objc_msgSend(v5, "setDurationDateComponents:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_preferredVictoryBadgeStyles, "copyWithZone:", a3);
  objc_msgSend(v5, "setPreferredVictoryBadgeStyles:", v10);

  objc_msgSend(v5, "setMaximumNumberOfPointsPerDay:", self->_maximumNumberOfPointsPerDay);
  return v5;
}

- (BOOL)isDailyScoreCapped
{
  return self->_maximumNumberOfPointsPerDay != 0;
}

- (unsigned)victoryBadgeStyle
{
  void *v2;
  unsigned int v3;

  -[NSArray firstObject](self->_preferredVictoryBadgeStyles, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (NSDate)startDate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", self->_startDateComponents);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  void *v3;
  NSDateComponents *durationDateComponents;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  durationDateComponents = self->_durationDateComponents;
  -[ASCompetition startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", durationDateComponents, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (NSDate)lastDayOfCompetition
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -1, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (BOOL)isFirstDayOfCompetition
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition currentDate](self, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isDate:inSameDayAsDate:", v4, v5);

  return v6;
}

- (BOOL)isLastDayOfCompetition
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition lastDayOfCompetition](self, "lastDayOfCompetition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition currentDate](self, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isDate:inSameDayAsDate:", v4, v5);

  return v6;
}

- (int64_t)endDateCacheIndex
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD44A8];
  -[ASCompetition endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _HKCacheIndexFromDateComponents();
  return v7;
}

- (unint64_t)numberOfDaysRemaining
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetition endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:toDate:options:", 16, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "day");
  if (v7 < 0)
    v8 = -1;
  else
    v8 = v7;
  v9 = v8 + 1;

  return v9;
}

- (int64_t)stage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;

  -[ASCompetition currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  -[ASCompetition startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  if (v5 < v8)
    return 0;
  -[ASCompetition endDate](self, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  if (v5 <= v12)
    return 1;
  else
    return 2;
}

- (unint64_t)myTotalScore
{
  void *v2;
  unint64_t v3;

  -[ASCompetition _scoresForParticipant:](self, "_scoresForParticipant:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ASCompetitionCalculateTotalScore(v2);

  return v3;
}

- (unint64_t)myDailyAverageScore
{
  void *v2;
  unint64_t v3;

  -[ASCompetition _scoresForParticipant:](self, "_scoresForParticipant:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ASCompetitionCalculateDailyAverageScore(v2);

  return v3;
}

- (unint64_t)opponentTotalScore
{
  void *v2;
  unint64_t v3;

  -[ASCompetition _scoresForParticipant:](self, "_scoresForParticipant:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ASCompetitionCalculateTotalScore(v2);

  return v3;
}

- (unint64_t)opponentDailyAverageScore
{
  void *v2;
  unint64_t v3;

  -[ASCompetition _scoresForParticipant:](self, "_scoresForParticipant:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ASCompetitionCalculateDailyAverageScore(v2);

  return v3;
}

- (BOOL)isScoreTied
{
  unint64_t v3;

  v3 = -[ASCompetition myTotalScore](self, "myTotalScore");
  return v3 == -[ASCompetition opponentTotalScore](self, "opponentTotalScore");
}

- (unint64_t)dailyScoreForParticipant:(int64_t)a3 onDate:(id)a4
{
  ASCacheIndexForLocalDate(a4);
  return ASCompetitionDailyScoreForParticipantWithCacheIndex(self, a3);
}

- (id)daysWonByParticipant:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  if (a3)
  {
    -[ASCompetition opponentScores](self, "opponentScores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetition scores](self, "scores");
  }
  else
  {
    -[ASCompetition scores](self, "scores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetition opponentScores](self, "opponentScores");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  v7 = objc_msgSend(v5, "count");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8 < 1)
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v9 = 0;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      if (v12 > v14)
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCompetition startDate](self, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 16, v9, v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "arrayByAddingObject:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v18;
      }
      ++v9;
    }
    while (v8 != v9);
  }
  v19 = v10;

  return v19;
}

- (BOOL)isParticipantWinning:(int64_t)a3
{
  unint64_t v4;
  unint64_t v5;

  if (a3)
  {
    v4 = -[ASCompetition opponentTotalScore](self, "opponentTotalScore");
    v5 = -[ASCompetition myTotalScore](self, "myTotalScore");
  }
  else
  {
    v4 = -[ASCompetition myTotalScore](self, "myTotalScore");
    v5 = -[ASCompetition opponentTotalScore](self, "opponentTotalScore");
  }
  return v4 >= v5;
}

- (BOOL)hasCalculatedFinalScore
{
  int64_t currentCacheIndex;

  currentCacheIndex = self->_currentCacheIndex;
  return currentCacheIndex >= -[ASCompetition endDateCacheIndex](self, "endDateCacheIndex");
}

- (BOOL)hasPushedFinalScore
{
  int64_t lastPushedCacheIndex;

  lastPushedCacheIndex = self->_lastPushedCacheIndex;
  return lastPushedCacheIndex >= -[ASCompetition endDateCacheIndex](self, "endDateCacheIndex");
}

- (BOOL)isEqualToCompetition:(id)a3
{
  id v4;
  int64_t currentCacheIndex;
  int64_t lastPushedCacheIndex;
  NSArray *scores;
  void *v8;
  NSArray *opponentScores;
  void *v10;
  NSDateComponents *durationDateComponents;
  void *v12;
  NSUUID *UUID;
  void *v14;
  NSDateComponents *startDateComponents;
  void *v16;
  NSArray *preferredVictoryBadgeStyles;
  void *v18;
  unint64_t maximumNumberOfPointsPerDay;
  BOOL v20;

  v4 = a3;
  currentCacheIndex = self->_currentCacheIndex;
  if (currentCacheIndex == objc_msgSend(v4, "currentCacheIndex")
    && (lastPushedCacheIndex = self->_lastPushedCacheIndex,
        lastPushedCacheIndex == objc_msgSend(v4, "lastPushedCacheIndex")))
  {
    scores = self->_scores;
    objc_msgSend(v4, "scores");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (ASObjectsAreEqual(scores, v8))
    {
      opponentScores = self->_opponentScores;
      objc_msgSend(v4, "opponentScores");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (ASObjectsAreEqual(opponentScores, v10))
      {
        durationDateComponents = self->_durationDateComponents;
        objc_msgSend(v4, "durationDateComponents");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (ASObjectsAreEqual(durationDateComponents, v12))
        {
          UUID = self->_UUID;
          objc_msgSend(v4, "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (ASObjectsAreEqual(UUID, v14))
          {
            startDateComponents = self->_startDateComponents;
            objc_msgSend(v4, "startDateComponents");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (ASObjectsAreEqual(startDateComponents, v16))
            {
              preferredVictoryBadgeStyles = self->_preferredVictoryBadgeStyles;
              objc_msgSend(v4, "preferredVictoryBadgeStyles");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (ASObjectsAreEqual(preferredVictoryBadgeStyles, v18))
              {
                maximumNumberOfPointsPerDay = self->_maximumNumberOfPointsPerDay;
                v20 = maximumNumberOfPointsPerDay == objc_msgSend(v4, "maximumNumberOfPointsPerDay");
              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)currentDate
{
  void *v3;
  void *v4;

  -[ASCompetition currentDateOverride](self, "currentDateOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[ASCompetition currentDateOverride](self, "currentDateOverride");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_scoresForParticipant:(int64_t)a3
{
  uint64_t v3;

  v3 = 40;
  if (!a3)
    v3 = 32;
  return *(id *)((char *)&self->super.isa + v3);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (int64_t)currentCacheIndex
{
  return self->_currentCacheIndex;
}

- (void)setCurrentCacheIndex:(int64_t)a3
{
  self->_currentCacheIndex = a3;
}

- (int64_t)lastPushedCacheIndex
{
  return self->_lastPushedCacheIndex;
}

- (void)setLastPushedCacheIndex:(int64_t)a3
{
  self->_lastPushedCacheIndex = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (NSArray)opponentScores
{
  return self->_opponentScores;
}

- (void)setOpponentScores:(id)a3
{
  objc_storeStrong((id *)&self->_opponentScores, a3);
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_startDateComponents, a3);
}

- (NSDateComponents)durationDateComponents
{
  return self->_durationDateComponents;
}

- (void)setDurationDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_durationDateComponents, a3);
}

- (NSArray)preferredVictoryBadgeStyles
{
  return self->_preferredVictoryBadgeStyles;
}

- (void)setPreferredVictoryBadgeStyles:(id)a3
{
  objc_storeStrong((id *)&self->_preferredVictoryBadgeStyles, a3);
}

- (unint64_t)maximumNumberOfPointsPerDay
{
  return self->_maximumNumberOfPointsPerDay;
}

- (void)setMaximumNumberOfPointsPerDay:(unint64_t)a3
{
  self->_maximumNumberOfPointsPerDay = a3;
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_preferredVictoryBadgeStyles, 0);
  objc_storeStrong((id *)&self->_durationDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_opponentScores, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)codableDatabaseCompetitionsFromCompetitions:(id)a3 withFriendWithUUID:(id)a4 withType:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ASCodableDatabaseCompetition *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v13 = 0;
      v14 = v12;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v16 = objc_alloc_init(ASCodableDatabaseCompetition);
        objc_msgSend(v8, "hk_dataForUUIDBytes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCodableDatabaseCompetition setFriendUUID:](v16, "setFriendUUID:", v17);

        -[ASCodableDatabaseCompetition setType:](v16, "setType:", a5);
        objc_msgSend(v15, "codableCompetition");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCodableDatabaseCompetition setCompetition:](v16, "setCompetition:", v18);

        objc_msgSend(v14, "arrayByAddingObject:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v12;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

@end

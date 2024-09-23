@implementation ASCodableBulletin

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (BOOL)hasFriendListData
{
  return self->_friendListData != 0;
}

- (BOOL)hasAchievementData
{
  return self->_achievementData != 0;
}

- (BOOL)hasWorkoutData
{
  return self->_workoutData != 0;
}

- (BOOL)hasSnapshotData
{
  return self->_snapshotData != 0;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCompetitionStage:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_competitionStage = a3;
}

- (void)setHasCompetitionStage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompetitionStage
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ASCodableBulletin;
  -[ASCodableBulletin description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableBulletin dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *friendUUID;
  NSData *friendListData;
  NSData *achievementData;
  NSData *workoutData;
  NSData *snapshotData;
  char has;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  friendUUID = self->_friendUUID;
  if (friendUUID)
    objc_msgSend(v3, "setObject:forKey:", friendUUID, CFSTR("friendUUID"));
  friendListData = self->_friendListData;
  if (friendListData)
    objc_msgSend(v3, "setObject:forKey:", friendListData, CFSTR("friendListData"));
  achievementData = self->_achievementData;
  if (achievementData)
    objc_msgSend(v3, "setObject:forKey:", achievementData, CFSTR("achievementData"));
  workoutData = self->_workoutData;
  if (workoutData)
    objc_msgSend(v3, "setObject:forKey:", workoutData, CFSTR("workoutData"));
  snapshotData = self->_snapshotData;
  if (snapshotData)
    objc_msgSend(v3, "setObject:forKey:", snapshotData, CFSTR("snapshotData"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_competitionStage);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("competitionStage"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableBulletinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_friendUUID)
    PBDataWriterWriteStringField();
  if (self->_friendListData)
    PBDataWriterWriteDataField();
  if (self->_achievementData)
    PBDataWriterWriteDataField();
  if (self->_workoutData)
    PBDataWriterWriteDataField();
  if (self->_snapshotData)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  char has;
  _QWORD *v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[3] = self->_type;
    *((_BYTE *)v5 + 80) |= 4u;
  }
  if (self->_title)
    objc_msgSend(v5, "setTitle:");
  if (self->_friendUUID)
    objc_msgSend(v5, "setFriendUUID:");
  if (self->_friendListData)
    objc_msgSend(v5, "setFriendListData:");
  if (self->_achievementData)
    objc_msgSend(v5, "setAchievementData:");
  if (self->_workoutData)
    objc_msgSend(v5, "setWorkoutData:");
  if (self->_snapshotData)
    objc_msgSend(v5, "setSnapshotData:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v5 + 80) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[1] = self->_competitionStage;
    *((_BYTE *)v5 + 80) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v7;

  v9 = -[NSString copyWithZone:](self->_friendUUID, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  v11 = -[NSData copyWithZone:](self->_friendListData, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v11;

  v13 = -[NSData copyWithZone:](self->_achievementData, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v13;

  v15 = -[NSData copyWithZone:](self->_workoutData, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v15;

  v17 = -[NSData copyWithZone:](self->_snapshotData, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v17;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_timestamp;
    *(_BYTE *)(v6 + 80) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_competitionStage;
    *(_BYTE *)(v6 + 80) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *friendUUID;
  NSData *friendListData;
  NSData *achievementData;
  NSData *workoutData;
  NSData *snapshotData;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_type != *((_QWORD *)v4 + 3))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
LABEL_28:
    v11 = 0;
    goto LABEL_29;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_28;
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](friendUUID, "isEqual:"))
      goto LABEL_28;
  }
  friendListData = self->_friendListData;
  if ((unint64_t)friendListData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](friendListData, "isEqual:"))
      goto LABEL_28;
  }
  achievementData = self->_achievementData;
  if ((unint64_t)achievementData | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](achievementData, "isEqual:"))
      goto LABEL_28;
  }
  workoutData = self->_workoutData;
  if ((unint64_t)workoutData | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](workoutData, "isEqual:"))
      goto LABEL_28;
  }
  snapshotData = self->_snapshotData;
  if ((unint64_t)snapshotData | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](snapshotData, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_28;
  }
  v11 = (*((_BYTE *)v4 + 80) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_competitionStage != *((_QWORD *)v4 + 1))
      goto LABEL_28;
    v11 = 1;
  }
LABEL_29:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char has;
  unint64_t v11;
  double timestamp;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[NSString hash](self->_friendUUID, "hash");
  v6 = -[NSData hash](self->_friendListData, "hash");
  v7 = -[NSData hash](self->_achievementData, "hash");
  v8 = -[NSData hash](self->_workoutData, "hash");
  v9 = -[NSData hash](self->_snapshotData, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    timestamp = self->_timestamp;
    v13 = -timestamp;
    if (timestamp >= 0.0)
      v13 = self->_timestamp;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 1) != 0)
    v16 = 2654435761 * self->_competitionStage;
  else
    v16 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    self->_type = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[ASCodableBulletin setTitle:](self, "setTitle:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[ASCodableBulletin setFriendUUID:](self, "setFriendUUID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ASCodableBulletin setFriendListData:](self, "setFriendListData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ASCodableBulletin setAchievementData:](self, "setAchievementData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[ASCodableBulletin setWorkoutData:](self, "setWorkoutData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[ASCodableBulletin setSnapshotData:](self, "setSnapshotData:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 80);
  }
  if ((v5 & 1) != 0)
  {
    self->_competitionStage = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (NSData)friendListData
{
  return self->_friendListData;
}

- (void)setFriendListData:(id)a3
{
  objc_storeStrong((id *)&self->_friendListData, a3);
}

- (NSData)achievementData
{
  return self->_achievementData;
}

- (void)setAchievementData:(id)a3
{
  objc_storeStrong((id *)&self->_achievementData, a3);
}

- (NSData)workoutData
{
  return self->_workoutData;
}

- (void)setWorkoutData:(id)a3
{
  objc_storeStrong((id *)&self->_workoutData, a3);
}

- (NSData)snapshotData
{
  return self->_snapshotData;
}

- (void)setSnapshotData:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotData, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)competitionStage
{
  return self->_competitionStage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_snapshotData, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
  objc_storeStrong((id *)&self->_friendListData, 0);
  objc_storeStrong((id *)&self->_achievementData, 0);
}

@end

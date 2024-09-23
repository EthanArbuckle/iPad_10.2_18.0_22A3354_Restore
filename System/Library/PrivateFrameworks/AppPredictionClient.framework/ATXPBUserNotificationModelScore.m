@implementation ATXPBUserNotificationModelScore

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUserNotificationModelScore *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[ATXPBUserNotificationModelScore init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelId"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotificationModelScore setModelId:](v5, "setModelId:", v7);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotificationModelScore setModelVersion:](v5, "setModelVersion:", objc_msgSend(v8, "unsignedIntValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("score"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[ATXPBUserNotificationModelScore setScore:](v5, "setScore:");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scoreTimestamp"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      -[ATXPBUserNotificationModelScore setScoreTimestamp:](v5, "setScoreTimestamp:");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scoreUUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotificationModelScore setScoreUUID:](v5, "setScoreUUID:", v11);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scoreInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[ATXJSONHelper unwrapData:](ATXJSONHelper, "unwrapData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUserNotificationModelScore setScoreInfo:](v5, "setScoreInfo:", v13);

    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("modelId");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_modelId);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("modelVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_modelVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("scoreTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scoreTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("scoreUUID");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_scoreUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v10;
  v14[5] = CFSTR("scoreInfo");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_scoreInfo);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)hasModelId
{
  return self->_modelId != 0;
}

- (void)setModelVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModelVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setScoreTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_scoreTimestamp = a3;
}

- (void)setHasScoreTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScoreTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasScoreUUID
{
  return self->_scoreUUID != 0;
}

- (BOOL)hasScoreInfo
{
  return self->_scoreInfo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationModelScore;
  -[ATXPBUserNotificationModelScore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUserNotificationModelScore dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *modelId;
  char has;
  void *v7;
  NSString *scoreUUID;
  NSData *scoreInfo;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  modelId = self->_modelId;
  if (modelId)
    objc_msgSend(v3, "setObject:forKey:", modelId, CFSTR("modelId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_modelVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("modelVersion"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("score"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scoreTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("scoreTimestamp"));

  }
LABEL_7:
  scoreUUID = self->_scoreUUID;
  if (scoreUUID)
    objc_msgSend(v4, "setObject:forKey:", scoreUUID, CFSTR("scoreUUID"));
  scoreInfo = self->_scoreInfo;
  if (scoreInfo)
    objc_msgSend(v4, "setObject:forKey:", scoreInfo, CFSTR("scoreInfo"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationModelScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_modelId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:
  if (self->_scoreUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_scoreInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_modelId)
  {
    objc_msgSend(v4, "setModelId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_modelVersion;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_score;
  *((_BYTE *)v4 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_scoreTimestamp;
    *((_BYTE *)v4 + 56) |= 4u;
  }
LABEL_7:
  if (self->_scoreUUID)
  {
    objc_msgSend(v6, "setScoreUUID:");
    v4 = v6;
  }
  if (self->_scoreInfo)
  {
    objc_msgSend(v6, "setScoreInfo:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_modelId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 16) = self->_score;
    *(_BYTE *)(v5 + 56) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 8) = self->_modelVersion;
  *(_BYTE *)(v5 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 24) = self->_scoreTimestamp;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_scoreUUID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSData copyWithZone:](self->_scoreInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *modelId;
  NSString *scoreUUID;
  NSData *scoreInfo;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  modelId = self->_modelId;
  if ((unint64_t)modelId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](modelId, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_modelVersion != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_score != *((double *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_scoreTimestamp != *((double *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  scoreUUID = self->_scoreUUID;
  if ((unint64_t)scoreUUID | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](scoreUUID, "isEqual:"))
    goto LABEL_23;
  scoreInfo = self->_scoreInfo;
  if ((unint64_t)scoreInfo | *((_QWORD *)v4 + 5))
    v8 = -[NSData isEqual:](scoreInfo, "isEqual:");
  else
    v8 = 1;
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double score;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double scoreTimestamp;
  double v13;
  long double v14;
  double v15;
  NSUInteger v16;

  v3 = -[NSString hash](self->_modelId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761u * self->_modelVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  score = self->_score;
  v7 = -score;
  if (score >= 0.0)
    v7 = self->_score;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    scoreTimestamp = self->_scoreTimestamp;
    v13 = -scoreTimestamp;
    if (scoreTimestamp >= 0.0)
      v13 = self->_scoreTimestamp;
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
  v16 = v5 ^ v3 ^ v10 ^ v11 ^ -[NSString hash](self->_scoreUUID, "hash");
  return v16 ^ -[NSData hash](self->_scoreInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXPBUserNotificationModelScore setModelId:](self, "setModelId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_modelVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_score = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_6:
    self->_scoreTimestamp = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 6))
  {
    -[ATXPBUserNotificationModelScore setScoreUUID:](self, "setScoreUUID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXPBUserNotificationModelScore setScoreInfo:](self, "setScoreInfo:");
    v4 = v6;
  }

}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (unint64_t)modelVersion
{
  return self->_modelVersion;
}

- (double)score
{
  return self->_score;
}

- (double)scoreTimestamp
{
  return self->_scoreTimestamp;
}

- (NSString)scoreUUID
{
  return self->_scoreUUID;
}

- (void)setScoreUUID:(id)a3
{
  objc_storeStrong((id *)&self->_scoreUUID, a3);
}

- (NSData)scoreInfo
{
  return self->_scoreInfo;
}

- (void)setScoreInfo:(id)a3
{
  objc_storeStrong((id *)&self->_scoreInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreUUID, 0);
  objc_storeStrong((id *)&self->_scoreInfo, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
}

@end

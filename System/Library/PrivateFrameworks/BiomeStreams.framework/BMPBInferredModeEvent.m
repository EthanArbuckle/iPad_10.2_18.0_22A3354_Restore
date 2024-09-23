@implementation BMPBInferredModeEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasModeIdentifier
{
  return self->_modeIdentifier != 0;
}

- (int)origin
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_origin;
  else
    return -1;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOrigin
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)originAsString:(int)a3
{
  if ((a3 + 1) < 0x12)
    return off_1E2647970[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CoreMotion")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CarPlay")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DNDWD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CoreRoutine")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sleep")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLaunch")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchWorkout")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WFHClassifier")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Calendar")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnchorModel")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLaunchModel")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ScreenShare")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ScreenRecording")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GameControllerConnected")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BacklightData")))
  {
    v4 = 16;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)hasOriginBundleId
{
  return self->_originBundleId != 0;
}

- (void)setIsAutomationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isAutomationEnabled = a3;
}

- (void)setHasIsAutomationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsAutomationEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsStart:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsStart
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasOriginAnchorType
{
  return self->_originAnchorType != 0;
}

- (void)setUiLocation:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_uiLocation = a3;
}

- (void)setHasUiLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUiLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setConfidenceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidenceScore = a3;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearSerializedTriggers
{
  -[NSMutableArray removeAllObjects](self->_serializedTriggers, "removeAllObjects");
}

- (void)addSerializedTriggers:(id)a3
{
  id v4;
  NSMutableArray *serializedTriggers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  serializedTriggers = self->_serializedTriggers;
  v8 = v4;
  if (!serializedTriggers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_serializedTriggers;
    self->_serializedTriggers = v6;

    v4 = v8;
    serializedTriggers = self->_serializedTriggers;
  }
  -[NSMutableArray addObject:](serializedTriggers, "addObject:", v4);

}

- (unint64_t)serializedTriggersCount
{
  return -[NSMutableArray count](self->_serializedTriggers, "count");
}

- (id)serializedTriggersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_serializedTriggers, "objectAtIndex:", a3);
}

+ (Class)serializedTriggersType
{
  return (Class)objc_opt_class();
}

- (int)modeType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_modeType;
  else
    return 0;
}

- (void)setModeType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_modeType = a3;
}

- (void)setHasModeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModeType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)modeTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_1E2647A00[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Working")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Exercising")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Driving")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bedtime")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Gaming")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reading")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Traveling")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Learning")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Streaming")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ScreenSharing")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClassicDND")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ScreenRecording")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AirPlayMirroring")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Mindfulness")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setShouldSuggestTriggers:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_shouldSuggestTriggers = a3;
}

- (void)setHasShouldSuggestTriggers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasShouldSuggestTriggers
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasUserModeName
{
  return self->_userModeName != 0;
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
  v8.super_class = (Class)BMPBInferredModeEvent;
  -[BMPBInferredModeEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBInferredModeEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *modeIdentifier;
  unsigned int v6;
  __CFString *v7;
  NSString *originBundleId;
  char has;
  void *v10;
  void *v11;
  NSString *uuid;
  NSString *originAnchorType;
  char v14;
  void *v15;
  void *v16;
  NSMutableArray *serializedTriggers;
  char v18;
  uint64_t modeType;
  __CFString *v20;
  void *v21;
  NSString *userModeName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimestamp"));

  }
  modeIdentifier = self->_modeIdentifier;
  if (modeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", modeIdentifier, CFSTR("modeIdentifier"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6 = self->_origin + 1;
    if (v6 >= 0x12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_origin);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2647970[v6];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("origin"));

  }
  originBundleId = self->_originBundleId;
  if (originBundleId)
    objc_msgSend(v3, "setObject:forKey:", originBundleId, CFSTR("originBundleId"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAutomationEnabled);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isAutomationEnabled"));

    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isStart"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  originAnchorType = self->_originAnchorType;
  if (originAnchorType)
    objc_msgSend(v3, "setObject:forKey:", originAnchorType, CFSTR("originAnchorType"));
  v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_uiLocation);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("uiLocation"));

    v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidenceScore);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("confidenceScore"));

  }
  serializedTriggers = self->_serializedTriggers;
  if (serializedTriggers)
    objc_msgSend(v3, "setObject:forKey:", serializedTriggers, CFSTR("serializedTriggers"));
  v18 = (char)self->_has;
  if ((v18 & 8) != 0)
  {
    modeType = self->_modeType;
    if (modeType >= 0x11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E2647A00[modeType];
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("modeType"));

    v18 = (char)self->_has;
  }
  if (v18 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSuggestTriggers);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("shouldSuggestTriggers"));

  }
  userModeName = self->_userModeName;
  if (userModeName)
    objc_msgSend(v3, "setObject:forKey:", userModeName, CFSTR("userModeName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBInferredModeEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_modeIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_originBundleId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_originAnchorType)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
    PBDataWriterWriteDoubleField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_serializedTriggers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteDataField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = (char)self->_has;
  }
  if (v12 < 0)
    PBDataWriterWriteBOOLField();
  if (self->_userModeName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v12;
  _QWORD *v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 92) |= 1u;
  }
  v13 = v4;
  if (self->_modeIdentifier)
  {
    objc_msgSend(v4, "setModeIdentifier:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_origin;
    *((_BYTE *)v4 + 92) |= 0x10u;
  }
  if (self->_originBundleId)
  {
    objc_msgSend(v13, "setOriginBundleId:");
    v4 = v13;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 88) = self->_isAutomationEnabled;
    *((_BYTE *)v4 + 92) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_BYTE *)v4 + 89) = self->_isStart;
    *((_BYTE *)v4 + 92) |= 0x40u;
  }
  if (self->_uuid)
  {
    objc_msgSend(v13, "setUuid:");
    v4 = v13;
  }
  if (self->_originAnchorType)
  {
    objc_msgSend(v13, "setOriginAnchorType:");
    v4 = v13;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    v4[3] = self->_uiLocation;
    *((_BYTE *)v4 + 92) |= 4u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_confidenceScore;
    *((_BYTE *)v4 + 92) |= 2u;
  }
  if (-[BMPBInferredModeEvent serializedTriggersCount](self, "serializedTriggersCount"))
  {
    objc_msgSend(v13, "clearSerializedTriggers");
    v7 = -[BMPBInferredModeEvent serializedTriggersCount](self, "serializedTriggersCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[BMPBInferredModeEvent serializedTriggersAtIndex:](self, "serializedTriggersAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSerializedTriggers:", v10);

      }
    }
  }
  v11 = (char)self->_has;
  v12 = v13;
  if ((v11 & 8) != 0)
  {
    *((_DWORD *)v13 + 10) = self->_modeType;
    *((_BYTE *)v13 + 92) |= 8u;
    v11 = (char)self->_has;
  }
  if (v11 < 0)
  {
    *((_BYTE *)v13 + 90) = self->_shouldSuggestTriggers;
    *((_BYTE *)v13 + 92) |= 0x80u;
  }
  if (self->_userModeName)
  {
    objc_msgSend(v13, "setUserModeName:");
    v12 = v13;
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
  char has;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_modeIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_origin;
    *(_BYTE *)(v6 + 92) |= 0x10u;
  }
  v9 = -[NSString copyWithZone:](self->_originBundleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v9;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 88) = self->_isAutomationEnabled;
    *(_BYTE *)(v6 + 92) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 89) = self->_isStart;
    *(_BYTE *)(v6 + 92) |= 0x40u;
  }
  v12 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v12;

  v14 = -[NSString copyWithZone:](self->_originAnchorType, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_uiLocation;
    *(_BYTE *)(v6 + 92) |= 4u;
    v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_confidenceScore;
    *(_BYTE *)(v6 + 92) |= 2u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_serializedTriggers;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v6, "addSerializedTriggers:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  v23 = (char)self->_has;
  if ((v23 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_modeType;
    *(_BYTE *)(v6 + 92) |= 8u;
    v23 = (char)self->_has;
  }
  if (v23 < 0)
  {
    *(_BYTE *)(v6 + 90) = self->_shouldSuggestTriggers;
    *(_BYTE *)(v6 + 92) |= 0x80u;
  }
  v24 = -[NSString copyWithZone:](self->_userModeName, "copyWithZone:", a3, (_QWORD)v27);
  v25 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v24;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *modeIdentifier;
  NSString *originBundleId;
  NSString *uuid;
  NSString *originAnchorType;
  char v10;
  NSMutableArray *serializedTriggers;
  NSString *userModeName;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_61;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_61;
  }
  modeIdentifier = self->_modeIdentifier;
  if ((unint64_t)modeIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](modeIdentifier, "isEqual:"))
      goto LABEL_61;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x10) == 0 || self->_origin != *((_DWORD *)v4 + 11))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  originBundleId = self->_originBundleId;
  if ((unint64_t)originBundleId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](originBundleId, "isEqual:"))
      goto LABEL_61;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x20) == 0)
      goto LABEL_61;
    if (self->_isAutomationEnabled)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x40) == 0)
      goto LABEL_61;
    if (self->_isStart)
    {
      if (!*((_BYTE *)v4 + 89))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 89))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 0x40) != 0)
  {
    goto LABEL_61;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 10) && !-[NSString isEqual:](uuid, "isEqual:"))
    goto LABEL_61;
  originAnchorType = self->_originAnchorType;
  if ((unint64_t)originAnchorType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](originAnchorType, "isEqual:"))
      goto LABEL_61;
  }
  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_uiLocation != *((_QWORD *)v4 + 3))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_confidenceScore != *((double *)v4 + 2))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_61;
  }
  serializedTriggers = self->_serializedTriggers;
  if ((unint64_t)serializedTriggers | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](serializedTriggers, "isEqual:"))
      goto LABEL_61;
    v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0 || self->_modeType != *((_DWORD *)v4 + 10))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((v10 & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x80) == 0)
      goto LABEL_58;
LABEL_61:
    v13 = 0;
    goto LABEL_62;
  }
  if ((*((_BYTE *)v4 + 92) & 0x80) == 0)
    goto LABEL_61;
  if (self->_shouldSuggestTriggers)
  {
    if (!*((_BYTE *)v4 + 90))
      goto LABEL_61;
  }
  else if (*((_BYTE *)v4 + 90))
  {
    goto LABEL_61;
  }
LABEL_58:
  userModeName = self->_userModeName;
  if ((unint64_t)userModeName | *((_QWORD *)v4 + 9))
    v13 = -[NSString isEqual:](userModeName, "isEqual:");
  else
    v13 = 1;
LABEL_62:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;
  double confidenceScore;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v22;
  uint64_t v23;
  NSUInteger v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v5 = self->_absoluteTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v24 = -[NSString hash](self->_modeIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v23 = 2654435761 * self->_origin;
  else
    v23 = 0;
  v22 = -[NSString hash](self->_originBundleId, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v8 = 2654435761 * self->_isAutomationEnabled;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_14;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_14:
      v9 = 2654435761 * self->_isStart;
      goto LABEL_17;
    }
  }
  v9 = 0;
LABEL_17:
  v10 = -[NSString hash](self->_uuid, "hash");
  v11 = -[NSString hash](self->_originAnchorType, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v12 = 2654435761u * self->_uiLocation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_19;
LABEL_24:
    v17 = 0;
    goto LABEL_27;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_24;
LABEL_19:
  confidenceScore = self->_confidenceScore;
  v14 = -confidenceScore;
  if (confidenceScore >= 0.0)
    v14 = self->_confidenceScore;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_27:
  v18 = -[NSMutableArray hash](self->_serializedTriggers, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v19 = 2654435761 * self->_modeType;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_29;
LABEL_31:
    v20 = 0;
    return v24 ^ v3 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NSString hash](self->_userModeName, "hash");
  }
  v19 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_31;
LABEL_29:
  v20 = 2654435761 * self->_shouldSuggestTriggers;
  return v24 ^ v3 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NSString hash](self->_userModeName, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_absoluteTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[BMPBInferredModeEvent setModeIdentifier:](self, "setModeIdentifier:");
  if ((*((_BYTE *)v5 + 92) & 0x10) != 0)
  {
    self->_origin = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 7))
    -[BMPBInferredModeEvent setOriginBundleId:](self, "setOriginBundleId:");
  v6 = *((_BYTE *)v5 + 92);
  if ((v6 & 0x20) != 0)
  {
    self->_isAutomationEnabled = *((_BYTE *)v5 + 88);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v5 + 92);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_isStart = *((_BYTE *)v5 + 89);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v5 + 10))
    -[BMPBInferredModeEvent setUuid:](self, "setUuid:");
  if (*((_QWORD *)v5 + 6))
    -[BMPBInferredModeEvent setOriginAnchorType:](self, "setOriginAnchorType:");
  v7 = *((_BYTE *)v5 + 92);
  if ((v7 & 4) != 0)
  {
    self->_uiLocation = (unint64_t)v5[3];
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v5 + 92);
  }
  if ((v7 & 2) != 0)
  {
    self->_confidenceScore = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *((id *)v5 + 8);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[BMPBInferredModeEvent addSerializedTriggers:](self, "addSerializedTriggers:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v13 = *((_BYTE *)v5 + 92);
  if ((v13 & 8) != 0)
  {
    self->_modeType = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 8u;
    v13 = *((_BYTE *)v5 + 92);
  }
  if (v13 < 0)
  {
    self->_shouldSuggestTriggers = *((_BYTE *)v5 + 90);
    *(_BYTE *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v5 + 9))
    -[BMPBInferredModeEvent setUserModeName:](self, "setUserModeName:");

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modeIdentifier, a3);
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (void)setOriginBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_originBundleId, a3);
}

- (BOOL)isAutomationEnabled
{
  return self->_isAutomationEnabled;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (void)setOriginAnchorType:(id)a3
{
  objc_storeStrong((id *)&self->_originAnchorType, a3);
}

- (unint64_t)uiLocation
{
  return self->_uiLocation;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (NSMutableArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (void)setSerializedTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_serializedTriggers, a3);
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void)setUserModeName:(id)a3
{
  objc_storeStrong((id *)&self->_userModeName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end

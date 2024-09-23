@implementation ATXPBModeConfigurationUIFlowLoggingEvent

- (void)setSecondsSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secondsSinceReferenceDate = a3;
}

- (void)setHasSecondsSinceReferenceDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsSinceReferenceDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDndModeUUID
{
  return self->_dndModeUUID != 0;
}

- (int)modeConfigurationUI
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_modeConfigurationUI;
  else
    return 0;
}

- (void)setModeConfigurationUI:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_modeConfigurationUI = a3;
}

- (void)setHasModeConfigurationUI:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModeConfigurationUI
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)modeConfigurationUIAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4D58B10[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeConfigurationUI:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Setup")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Settings")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OnBoarding")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)modeConfigurationEntityType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_modeConfigurationEntityType;
  else
    return 0;
}

- (void)setModeConfigurationEntityType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modeConfigurationEntityType = a3;
}

- (void)setHasModeConfigurationEntityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModeConfigurationEntityType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)modeConfigurationEntityTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E4D58B30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeConfigurationEntityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Apps")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Contacts")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearPreviousEntityIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_previousEntityIdentifiers, "removeAllObjects");
}

- (void)addPreviousEntityIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *previousEntityIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  v8 = v4;
  if (!previousEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_previousEntityIdentifiers;
    self->_previousEntityIdentifiers = v6;

    v4 = v8;
    previousEntityIdentifiers = self->_previousEntityIdentifiers;
  }
  -[NSMutableArray addObject:](previousEntityIdentifiers, "addObject:", v4);

}

- (unint64_t)previousEntityIdentifiersCount
{
  return -[NSMutableArray count](self->_previousEntityIdentifiers, "count");
}

- (id)previousEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_previousEntityIdentifiers, "objectAtIndex:", a3);
}

+ (Class)previousEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearSuggestedEntityIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_suggestedEntityIdentifiers, "removeAllObjects");
}

- (void)addSuggestedEntityIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *suggestedEntityIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  v8 = v4;
  if (!suggestedEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_suggestedEntityIdentifiers;
    self->_suggestedEntityIdentifiers = v6;

    v4 = v8;
    suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  }
  -[NSMutableArray addObject:](suggestedEntityIdentifiers, "addObject:", v4);

}

- (unint64_t)suggestedEntityIdentifiersCount
{
  return -[NSMutableArray count](self->_suggestedEntityIdentifiers, "count");
}

- (id)suggestedEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestedEntityIdentifiers, "objectAtIndex:", a3);
}

+ (Class)suggestedEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentEntityIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_currentEntityIdentifiers, "removeAllObjects");
}

- (void)addCurrentEntityIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *currentEntityIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  v8 = v4;
  if (!currentEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_currentEntityIdentifiers;
    self->_currentEntityIdentifiers = v6;

    v4 = v8;
    currentEntityIdentifiers = self->_currentEntityIdentifiers;
  }
  -[NSMutableArray addObject:](currentEntityIdentifiers, "addObject:", v4);

}

- (unint64_t)currentEntityIdentifiersCount
{
  return -[NSMutableArray count](self->_currentEntityIdentifiers, "count");
}

- (id)currentEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentEntityIdentifiers, "objectAtIndex:", a3);
}

+ (Class)currentEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

- (int)modeConfigurationType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_modeConfigurationType;
  else
    return 0;
}

- (void)setModeConfigurationType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_modeConfigurationType = a3;
}

- (void)setHasModeConfigurationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModeConfigurationType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)modeConfigurationTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E4D58B48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeConfigurationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Allow")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Deny")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearCandidateEntityIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_candidateEntityIdentifiers, "removeAllObjects");
}

- (void)addCandidateEntityIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *candidateEntityIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  v8 = v4;
  if (!candidateEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_candidateEntityIdentifiers;
    self->_candidateEntityIdentifiers = v6;

    v4 = v8;
    candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  }
  -[NSMutableArray addObject:](candidateEntityIdentifiers, "addObject:", v4);

}

- (unint64_t)candidateEntityIdentifiersCount
{
  return -[NSMutableArray count](self->_candidateEntityIdentifiers, "count");
}

- (id)candidateEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_candidateEntityIdentifiers, "objectAtIndex:", a3);
}

+ (Class)candidateEntityIdentifiersType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)ATXPBModeConfigurationUIFlowLoggingEvent;
  -[ATXPBModeConfigurationUIFlowLoggingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBModeConfigurationUIFlowLoggingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *dndModeUUID;
  char has;
  uint64_t modeConfigurationUI;
  __CFString *v8;
  uint64_t modeConfigurationEntityType;
  __CFString *v10;
  NSMutableArray *previousEntityIdentifiers;
  NSMutableArray *suggestedEntityIdentifiers;
  NSMutableArray *currentEntityIdentifiers;
  uint64_t modeConfigurationType;
  __CFString *v15;
  NSMutableArray *candidateEntityIdentifiers;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsSinceReferenceDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("secondsSinceReferenceDate"));

  }
  dndModeUUID = self->_dndModeUUID;
  if (dndModeUUID)
    objc_msgSend(v3, "setObject:forKey:", dndModeUUID, CFSTR("dndModeUUID"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    modeConfigurationUI = self->_modeConfigurationUI;
    if (modeConfigurationUI >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationUI);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4D58B10[modeConfigurationUI];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("modeConfigurationUI"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    modeConfigurationEntityType = self->_modeConfigurationEntityType;
    if (modeConfigurationEntityType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationEntityType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E4D58B30[modeConfigurationEntityType];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("modeConfigurationEntityType"));

  }
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  if (previousEntityIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", previousEntityIdentifiers, CFSTR("previousEntityIdentifiers"));
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  if (suggestedEntityIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", suggestedEntityIdentifiers, CFSTR("suggestedEntityIdentifiers"));
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  if (currentEntityIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", currentEntityIdentifiers, CFSTR("currentEntityIdentifiers"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    modeConfigurationType = self->_modeConfigurationType;
    if (modeConfigurationType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E4D58B48[modeConfigurationType];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("modeConfigurationType"));

  }
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  if (candidateEntityIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", candidateEntityIdentifiers, CFSTR("candidateEntityIdentifiers"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBModeConfigurationUIFlowLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_dndModeUUID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = self->_previousEntityIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_suggestedEntityIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = self->_currentEntityIdentifiers;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self->_candidateEntityIdentifiers;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  _QWORD *v22;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_secondsSinceReferenceDate;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  v22 = v4;
  if (self->_dndModeUUID)
  {
    objc_msgSend(v4, "setDndModeUUID:");
    v4 = v22;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_modeConfigurationUI;
    *((_BYTE *)v4 + 72) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_modeConfigurationEntityType;
    *((_BYTE *)v4 + 72) |= 2u;
  }
  if (-[ATXPBModeConfigurationUIFlowLoggingEvent previousEntityIdentifiersCount](self, "previousEntityIdentifiersCount"))
  {
    objc_msgSend(v22, "clearPreviousEntityIdentifiers");
    v6 = -[ATXPBModeConfigurationUIFlowLoggingEvent previousEntityIdentifiersCount](self, "previousEntityIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ATXPBModeConfigurationUIFlowLoggingEvent previousEntityIdentifiersAtIndex:](self, "previousEntityIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addPreviousEntityIdentifiers:", v9);

      }
    }
  }
  if (-[ATXPBModeConfigurationUIFlowLoggingEvent suggestedEntityIdentifiersCount](self, "suggestedEntityIdentifiersCount"))
  {
    objc_msgSend(v22, "clearSuggestedEntityIdentifiers");
    v10 = -[ATXPBModeConfigurationUIFlowLoggingEvent suggestedEntityIdentifiersCount](self, "suggestedEntityIdentifiersCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[ATXPBModeConfigurationUIFlowLoggingEvent suggestedEntityIdentifiersAtIndex:](self, "suggestedEntityIdentifiersAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSuggestedEntityIdentifiers:", v13);

      }
    }
  }
  if (-[ATXPBModeConfigurationUIFlowLoggingEvent currentEntityIdentifiersCount](self, "currentEntityIdentifiersCount"))
  {
    objc_msgSend(v22, "clearCurrentEntityIdentifiers");
    v14 = -[ATXPBModeConfigurationUIFlowLoggingEvent currentEntityIdentifiersCount](self, "currentEntityIdentifiersCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[ATXPBModeConfigurationUIFlowLoggingEvent currentEntityIdentifiersAtIndex:](self, "currentEntityIdentifiersAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addCurrentEntityIdentifiers:", v17);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v22 + 11) = self->_modeConfigurationType;
    *((_BYTE *)v22 + 72) |= 4u;
  }
  if (-[ATXPBModeConfigurationUIFlowLoggingEvent candidateEntityIdentifiersCount](self, "candidateEntityIdentifiersCount"))
  {
    objc_msgSend(v22, "clearCandidateEntityIdentifiers");
    v18 = -[ATXPBModeConfigurationUIFlowLoggingEvent candidateEntityIdentifiersCount](self, "candidateEntityIdentifiersCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[ATXPBModeConfigurationUIFlowLoggingEvent candidateEntityIdentifiersAtIndex:](self, "candidateEntityIdentifiersAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addCandidateEntityIdentifiers:", v21);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_secondsSinceReferenceDate;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_dndModeUUID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_modeConfigurationUI;
    *(_BYTE *)(v6 + 72) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_modeConfigurationEntityType;
    *(_BYTE *)(v6 + 72) |= 2u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_previousEntityIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPreviousEntityIdentifiers:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v12);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = self->_suggestedEntityIdentifiers;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSuggestedEntityIdentifiers:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v18);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = self->_currentEntityIdentifiers;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCurrentEntityIdentifiers:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v24);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_modeConfigurationType;
    *(_BYTE *)(v6 + 72) |= 4u;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_candidateEntityIdentifiers;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend((id)v6, "addCandidateEntityIdentifiers:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v30);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *dndModeUUID;
  NSMutableArray *previousEntityIdentifiers;
  NSMutableArray *suggestedEntityIdentifiers;
  NSMutableArray *currentEntityIdentifiers;
  NSMutableArray *candidateEntityIdentifiers;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_secondsSinceReferenceDate != *((double *)v4 + 1))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_33;
  }
  dndModeUUID = self->_dndModeUUID;
  if ((unint64_t)dndModeUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](dndModeUUID, "isEqual:"))
    {
LABEL_33:
      v11 = 0;
      goto LABEL_34;
    }
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_modeConfigurationUI != *((_DWORD *)v4 + 12))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_modeConfigurationEntityType != *((_DWORD *)v4 + 10))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_33;
  }
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  if ((unint64_t)previousEntityIdentifiers | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](previousEntityIdentifiers, "isEqual:"))
  {
    goto LABEL_33;
  }
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  if ((unint64_t)suggestedEntityIdentifiers | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](suggestedEntityIdentifiers, "isEqual:"))
      goto LABEL_33;
  }
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  if ((unint64_t)currentEntityIdentifiers | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](currentEntityIdentifiers, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_modeConfigurationType != *((_DWORD *)v4 + 11))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_33;
  }
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  if ((unint64_t)candidateEntityIdentifiers | *((_QWORD *)v4 + 2))
    v11 = -[NSMutableArray isEqual:](candidateEntityIdentifiers, "isEqual:");
  else
    v11 = 1;
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  double secondsSinceReferenceDate;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    secondsSinceReferenceDate = self->_secondsSinceReferenceDate;
    v5 = -secondsSinceReferenceDate;
    if (secondsSinceReferenceDate >= 0.0)
      v5 = self->_secondsSinceReferenceDate;
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
  v8 = -[NSString hash](self->_dndModeUUID, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v9 = 2654435761 * self->_modeConfigurationUI;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_11:
      v10 = 2654435761 * self->_modeConfigurationEntityType;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:
  v11 = -[NSMutableArray hash](self->_previousEntityIdentifiers, "hash");
  v12 = -[NSMutableArray hash](self->_suggestedEntityIdentifiers, "hash");
  v13 = -[NSMutableArray hash](self->_currentEntityIdentifiers, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v14 = 2654435761 * self->_modeConfigurationType;
  else
    v14 = 0;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[NSMutableArray hash](self->_candidateEntityIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  if (((_BYTE)v4[9] & 1) != 0)
  {
    self->_secondsSinceReferenceDate = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[ATXPBModeConfigurationUIFlowLoggingEvent setDndModeUUID:](self, "setDndModeUUID:");
  v6 = *((_BYTE *)v5 + 72);
  if ((v6 & 8) != 0)
  {
    self->_modeConfigurationUI = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v5 + 72);
  }
  if ((v6 & 2) != 0)
  {
    self->_modeConfigurationEntityType = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = *((id *)v5 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        -[ATXPBModeConfigurationUIFlowLoggingEvent addPreviousEntityIdentifiers:](self, "addPreviousEntityIdentifiers:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v9);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = *((id *)v5 + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        -[ATXPBModeConfigurationUIFlowLoggingEvent addSuggestedEntityIdentifiers:](self, "addSuggestedEntityIdentifiers:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *((id *)v5 + 3);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[ATXPBModeConfigurationUIFlowLoggingEvent addCurrentEntityIdentifiers:](self, "addCurrentEntityIdentifiers:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v19);
  }

  if (((_BYTE)v5[9] & 4) != 0)
  {
    self->_modeConfigurationType = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_has |= 4u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v5 + 2);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[ATXPBModeConfigurationUIFlowLoggingEvent addCandidateEntityIdentifiers:](self, "addCandidateEntityIdentifiers:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (double)secondsSinceReferenceDate
{
  return self->_secondsSinceReferenceDate;
}

- (NSString)dndModeUUID
{
  return self->_dndModeUUID;
}

- (void)setDndModeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_dndModeUUID, a3);
}

- (NSMutableArray)previousEntityIdentifiers
{
  return self->_previousEntityIdentifiers;
}

- (void)setPreviousEntityIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_previousEntityIdentifiers, a3);
}

- (NSMutableArray)suggestedEntityIdentifiers
{
  return self->_suggestedEntityIdentifiers;
}

- (void)setSuggestedEntityIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEntityIdentifiers, a3);
}

- (NSMutableArray)currentEntityIdentifiers
{
  return self->_currentEntityIdentifiers;
}

- (void)setCurrentEntityIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_currentEntityIdentifiers, a3);
}

- (NSMutableArray)candidateEntityIdentifiers
{
  return self->_candidateEntityIdentifiers;
}

- (void)setCandidateEntityIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_candidateEntityIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_dndModeUUID, 0);
  objc_storeStrong((id *)&self->_currentEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_candidateEntityIdentifiers, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBModeConfigurationUIFlowLoggingEvent *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = -[ATXPBModeConfigurationUIFlowLoggingEvent init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dndModeUUID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBModeConfigurationUIFlowLoggingEvent setDndModeUUID:](v5, "setDndModeUUID:", v7);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modeConfigurationUI"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Setup")) & 1) != 0)
      {
        v9 = 0;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Settings")) & 1) != 0)
      {
        v9 = 1;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OnBoarding")) & 1) != 0)
      {
        v9 = 2;
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Total")))
      {
        v9 = 3;
      }
      else
      {
        v9 = 0;
      }

      -[ATXPBModeConfigurationUIFlowLoggingEvent setModeConfigurationUI:](v5, "setModeConfigurationUI:", v9);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modeConfigurationEntityType"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Apps")) & 1) != 0)
      {
        v11 = 0;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Contacts")) & 1) != 0)
      {
        v11 = 1;
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Total")))
      {
        v11 = 2;
      }
      else
      {
        v11 = 0;
      }

      -[ATXPBModeConfigurationUIFlowLoggingEvent setModeConfigurationEntityType:](v5, "setModeConfigurationEntityType:", v11);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modeConfigurationType"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Allow")) & 1) != 0)
      {
        v13 = 0;
      }
      else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Deny")) & 1) != 0)
      {
        v13 = 1;
      }
      else if (objc_msgSend(v12, "isEqualToString:", CFSTR("Total")))
      {
        v13 = 2;
      }
      else
      {
        v13 = 0;
      }

      -[ATXPBModeConfigurationUIFlowLoggingEvent setModeConfigurationType:](v5, "setModeConfigurationType:", v13);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestedEntityIdentifiers"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBModeConfigurationUIFlowLoggingEvent setSuggestedEntityIdentifiers:](v5, "setSuggestedEntityIdentifiers:", v14);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("candidateEntityIdentifiers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBModeConfigurationUIFlowLoggingEvent setCandidateEntityIdentifiers:](v5, "setCandidateEntityIdentifiers:", v15);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("previousEntityIdentifiers"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBModeConfigurationUIFlowLoggingEvent setPreviousEntityIdentifiers:](v5, "setPreviousEntityIdentifiers:", v16);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currentEntityIdentifiers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBModeConfigurationUIFlowLoggingEvent setCurrentEntityIdentifiers:](v5, "setCurrentEntityIdentifiers:", v17);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      -[ATXPBModeConfigurationUIFlowLoggingEvent setSecondsSinceReferenceDate:](v5, "setSecondsSinceReferenceDate:");

    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  uint64_t modeConfigurationUI;
  __CFString *v4;
  uint64_t modeConfigurationEntityType;
  __CFString *v6;
  void *v7;
  uint64_t modeConfigurationType;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  _QWORD v23[9];
  _QWORD v24[11];

  v24[9] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("dndModeUUID");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_dndModeUUID);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("modeConfigurationUI");
  modeConfigurationUI = self->_modeConfigurationUI;
  if (modeConfigurationUI >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationUI);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4D5AC08[modeConfigurationUI];
  }
  v21 = v4;
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  v23[2] = CFSTR("entityType");
  modeConfigurationEntityType = self->_modeConfigurationEntityType;
  if (modeConfigurationEntityType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationEntityType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E4D5AC28[modeConfigurationEntityType];
  }
  v19 = v6;
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v7;
  v23[3] = CFSTR("modeConfigurationType");
  modeConfigurationType = self->_modeConfigurationType;
  if (modeConfigurationType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E4D5AC40[modeConfigurationType];
  }
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v10;
  v23[4] = CFSTR("suggestedEntityIdentifiers");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_suggestedEntityIdentifiers);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v11;
  v23[5] = CFSTR("candidateEntityIdentifiers");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_candidateEntityIdentifiers);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v12;
  v23[6] = CFSTR("previousEntityIdentifiers");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_previousEntityIdentifiers);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v13;
  v23[7] = CFSTR("currentEntityIdentifiers");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_currentEntityIdentifiers);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v14;
  v23[8] = CFSTR("eventDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_secondsSinceReferenceDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end

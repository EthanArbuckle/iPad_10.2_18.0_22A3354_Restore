@implementation SGMIMetricsRegexSignatureStats

- (BOOL)hasTrialMetadata
{
  return self->_trialMetadata != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)clearStats
{
  -[NSMutableArray removeAllObjects](self->_stats, "removeAllObjects");
}

- (void)addStats:(id)a3
{
  id v4;
  NSMutableArray *stats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stats = self->_stats;
  v8 = v4;
  if (!stats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stats;
    self->_stats = v6;

    v4 = v8;
    stats = self->_stats;
  }
  -[NSMutableArray addObject:](stats, "addObject:", v4);

}

- (unint64_t)statsCount
{
  return -[NSMutableArray count](self->_stats, "count");
}

- (id)statsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_stats, "objectAtIndex:", a3);
}

- (void)setTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20 = a3;
}

- (void)setHasTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20 = a3;
}

- (void)setHasTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20 = a3;
}

- (void)setHasTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (void)setHasNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (void)setHasNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (void)setHasNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (void)setHasNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)SGMIMetricsRegexSignatureStats;
  -[SGMIMetricsRegexSignatureStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsRegexSignatureStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SGMIMetricsTrialMetadata *trialMetadata;
  void *v5;
  NSString *locale;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char has;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  trialMetadata = self->_trialMetadata;
  if (trialMetadata)
  {
    -[SGMIMetricsTrialMetadata dictionaryRepresentation](trialMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("trialMetadata"));

  }
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  if (-[NSMutableArray count](self->_stats, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_stats, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = self->_stats;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("stats"));
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_16:
      if ((has & 0x20) == 0)
        goto LABEL_17;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20, (_QWORD)v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 4) == 0)
      goto LABEL_18;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20, (_QWORD)v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 1) == 0)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20, (_QWORD)v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_19:
    if ((has & 8) == 0)
      goto LABEL_20;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20, (_QWORD)v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_21;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20, (_QWORD)v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_28;
LABEL_20:
  if ((has & 2) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20, (_QWORD)v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsRegexSignatureStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_trialMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_locale)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_stats;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_14:
      if ((has & 0x20) == 0)
        goto LABEL_15;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 4) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      goto LABEL_17;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 8) == 0)
      goto LABEL_18;
LABEL_26:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_26;
LABEL_18:
  if ((has & 2) != 0)
LABEL_19:
    PBDataWriterWriteUint32Field();
LABEL_20:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  id v9;

  v9 = a3;
  if (self->_trialMetadata)
    objc_msgSend(v9, "setTrialMetadata:");
  if (self->_locale)
    objc_msgSend(v9, "setLocale:");
  if (-[SGMIMetricsRegexSignatureStats statsCount](self, "statsCount"))
  {
    objc_msgSend(v9, "clearStats");
    v4 = -[SGMIMetricsRegexSignatureStats statsCount](self, "statsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SGMIMetricsRegexSignatureStats statsAtIndex:](self, "statsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addStats:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
    *((_BYTE *)v9 + 64) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v9 + 12) = self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
  *((_BYTE *)v9 + 64) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v9 + 11) = self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
  *((_BYTE *)v9 + 64) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v9 + 6) = self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *((_BYTE *)v9 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_15;
LABEL_23:
    *((_DWORD *)v9 + 7) = self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
    *((_BYTE *)v9 + 64) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_22:
  *((_DWORD *)v9 + 4) = self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *((_BYTE *)v9 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_15:
  if ((has & 2) != 0)
  {
LABEL_16:
    *((_DWORD *)v9 + 5) = self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
    *((_BYTE *)v9 + 64) |= 2u;
  }
LABEL_17:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char has;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SGMIMetricsTrialMetadata copyWithZone:](self->_trialMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_stats;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addStats:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
    *(_BYTE *)(v5 + 64) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 48) = self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
  *(_BYTE *)(v5 + 64) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 44) = self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
  *(_BYTE *)(v5 + 64) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 24) = self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *(_BYTE *)(v5 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
LABEL_22:
    *(_DWORD *)(v5 + 28) = self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
    *(_BYTE *)(v5 + 64) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_15;
  }
LABEL_21:
  *(_DWORD *)(v5 + 16) = self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *(_BYTE *)(v5 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_22;
LABEL_14:
  if ((has & 2) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 20) = self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SGMIMetricsTrialMetadata *trialMetadata;
  NSString *locale;
  NSMutableArray *stats;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  trialMetadata = self->_trialMetadata;
  if ((unint64_t)trialMetadata | *((_QWORD *)v4 + 7))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](trialMetadata, "isEqual:"))
      goto LABEL_42;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_42;
  }
  stats = self->_stats;
  if ((unint64_t)stats | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](stats, "isEqual:"))
      goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0
      || self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 10))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
LABEL_42:
    v8 = 0;
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x40) == 0
      || self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 12))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0
      || self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 11))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0
      || self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 6))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0
      || self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 4))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0
      || self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 7))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_42;
  }
  v8 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0
      || self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 5))
    {
      goto LABEL_42;
    }
    v8 = 1;
  }
LABEL_43:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[SGMIMetricsTrialMetadata hash](self->_trialMetadata, "hash");
  v4 = -[NSString hash](self->_locale, "hash");
  v5 = -[NSMutableArray hash](self->_stats, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6 = 2654435761 * self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v8 = 2654435761 * self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v9 = 2654435761 * self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    v10 = 2654435761 * self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_15:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_13:
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v11 = 2654435761 * self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_8:
  v12 = 2654435761 * self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SGMIMetricsTrialMetadata *trialMetadata;
  uint64_t v6;
  id v7;
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
  trialMetadata = self->_trialMetadata;
  v6 = *((_QWORD *)v4 + 7);
  if (trialMetadata)
  {
    if (v6)
      -[SGMIMetricsTrialMetadata mergeFrom:](trialMetadata, "mergeFrom:");
  }
  else if (v6)
  {
    -[SGMIMetricsRegexSignatureStats setTrialMetadata:](self, "setTrialMetadata:");
  }
  if (*((_QWORD *)v4 + 1))
    -[SGMIMetricsRegexSignatureStats setLocale:](self, "setLocale:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        -[SGMIMetricsRegexSignatureStats addStats:](self, "addStats:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v4 + 64);
  if ((v12 & 0x10) != 0)
  {
    self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v12 = *((_BYTE *)v4 + 64);
    if ((v12 & 0x40) == 0)
    {
LABEL_17:
      if ((v12 & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x40) == 0)
  {
    goto LABEL_17;
  }
  self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 0x40u;
  v12 = *((_BYTE *)v4 + 64);
  if ((v12 & 0x20) == 0)
  {
LABEL_18:
    if ((v12 & 4) == 0)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:
  self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 0x20u;
  v12 = *((_BYTE *)v4 + 64);
  if ((v12 & 4) == 0)
  {
LABEL_19:
    if ((v12 & 1) == 0)
      goto LABEL_20;
    goto LABEL_28;
  }
LABEL_27:
  self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v12 = *((_BYTE *)v4 + 64);
  if ((v12 & 1) == 0)
  {
LABEL_20:
    if ((v12 & 8) == 0)
      goto LABEL_21;
LABEL_29:
    self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 64) & 2) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_28:
  self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  v12 = *((_BYTE *)v4 + 64);
  if ((v12 & 8) != 0)
    goto LABEL_29;
LABEL_21:
  if ((v12 & 2) != 0)
  {
LABEL_22:
    self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_23:

}

- (SGMIMetricsTrialMetadata)trialMetadata
{
  return self->_trialMetadata;
}

- (void)setTrialMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_trialMetadata, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSMutableArray)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_storeStrong((id *)&self->_stats, a3);
}

- (unsigned)totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20
{
  return self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
}

- (unsigned)totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20
{
  return self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
}

- (unsigned)totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20
{
  return self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
}

- (unsigned)numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (unsigned)numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (unsigned)numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (unsigned)numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMetadata, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (Class)statsType
{
  return (Class)objc_opt_class();
}

@end

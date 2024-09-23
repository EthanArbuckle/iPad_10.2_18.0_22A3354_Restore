@implementation SGMIMetricsMailIntelligenceForMessage

- (void)setHoursSinceReference:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hoursSinceReference = a3;
}

- (void)setHasHoursSinceReference:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHoursSinceReference
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasLang
{
  return self->_lang != 0;
}

- (void)setTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds = a3;
}

- (void)setHasTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimeDifferenceFromReceptionToSaliencyInferenceInSeconds
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSenderConnectionScore:(float)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_senderConnectionScore = a3;
}

- (void)setHasSenderConnectionScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSenderConnectionScore
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearMailAttachmentHistograms
{
  -[NSMutableArray removeAllObjects](self->_mailAttachmentHistograms, "removeAllObjects");
}

- (void)addMailAttachmentHistogram:(id)a3
{
  id v4;
  NSMutableArray *mailAttachmentHistograms;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mailAttachmentHistograms = self->_mailAttachmentHistograms;
  v8 = v4;
  if (!mailAttachmentHistograms)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_mailAttachmentHistograms;
    self->_mailAttachmentHistograms = v6;

    v4 = v8;
    mailAttachmentHistograms = self->_mailAttachmentHistograms;
  }
  -[NSMutableArray addObject:](mailAttachmentHistograms, "addObject:", v4);

}

- (unint64_t)mailAttachmentHistogramsCount
{
  return -[NSMutableArray count](self->_mailAttachmentHistograms, "count");
}

- (id)mailAttachmentHistogramAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mailAttachmentHistograms, "objectAtIndex:", a3);
}

- (void)setNbCharactersInMailSubject:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nbCharactersInMailSubject = a3;
}

- (void)setHasNbCharactersInMailSubject:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNbCharactersInMailSubject
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNbTokensInMailSubject:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nbTokensInMailSubject = a3;
}

- (void)setHasNbTokensInMailSubject:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNbTokensInMailSubject
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPreviousInteractionOnConversationInMinutes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_previousInteractionOnConversationInMinutes = a3;
}

- (void)setHasPreviousInteractionOnConversationInMinutes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPreviousInteractionOnConversationInMinutes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPreviousInteractionFromUserOnConversationInMinutes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_previousInteractionFromUserOnConversationInMinutes = a3;
}

- (void)setHasPreviousInteractionFromUserOnConversationInMinutes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreviousInteractionFromUserOnConversationInMinutes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasActive
{
  return self->_active != 0;
}

- (BOOL)hasBackground
{
  return self->_background != 0;
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
  v8.super_class = (Class)SGMIMetricsMailIntelligenceForMessage;
  -[SGMIMetricsMailIntelligenceForMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsMailIntelligenceForMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *locale;
  NSString *lang;
  char has;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  void *v19;
  SGMIMetricsInferenceAndGroundTruth *active;
  void *v21;
  SGMIMetricsInferenceAndGroundTruth *background;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hoursSinceReference);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("hoursSinceReference"));

  }
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  lang = self->_lang;
  if (lang)
    objc_msgSend(v3, "setObject:forKey:", lang, CFSTR("lang"));
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timeDifferenceFromReceptionToSaliencyInferenceInSeconds"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(float *)&v4 = self->_senderConnectionScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("senderConnectionScore"));

  }
  if (-[NSMutableArray count](self->_mailAttachmentHistograms, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_mailAttachmentHistograms, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = self->_mailAttachmentHistograms;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v28);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mailAttachmentHistogram"));
  }
  v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nbCharactersInMailSubject);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("nbCharactersInMailSubject"));

    v18 = (char)self->_has;
    if ((v18 & 4) == 0)
    {
LABEL_22:
      if ((v18 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nbTokensInMailSubject, (_QWORD)v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("nbTokensInMailSubject"));

  v18 = (char)self->_has;
  if ((v18 & 0x10) == 0)
  {
LABEL_23:
    if ((v18 & 8) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_previousInteractionOnConversationInMinutes, (_QWORD)v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("previousInteractionOnConversationInMinutes"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_previousInteractionFromUserOnConversationInMinutes, (_QWORD)v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("previousInteractionFromUserOnConversationInMinutes"));

  }
LABEL_25:
  active = self->_active;
  if (active)
  {
    -[SGMIMetricsInferenceAndGroundTruth dictionaryRepresentation](active, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("active"));

  }
  background = self->_background;
  if (background)
  {
    -[SGMIMetricsInferenceAndGroundTruth dictionaryRepresentation](background, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("background"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsMailIntelligenceForMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_locale)
    PBDataWriterWriteStringField();
  if (self->_lang)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
    PBDataWriterWriteFloatField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_mailAttachmentHistograms;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = (char)self->_has;
    if ((v11 & 4) == 0)
    {
LABEL_20:
      if ((v11 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteUint32Field();
  v11 = (char)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_21:
    if ((v11 & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_22:
    PBDataWriterWriteUint32Field();
LABEL_23:
  if (self->_active)
    PBDataWriterWriteSubmessage();
  if (self->_background)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  void *v11;
  _DWORD *v12;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_hoursSinceReference;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  v12 = v4;
  if (self->_locale)
  {
    objc_msgSend(v4, "setLocale:");
    v4 = v12;
  }
  if (self->_lang)
  {
    objc_msgSend(v12, "setLang:");
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[19] = self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
    *((_BYTE *)v4 + 80) |= 0x40u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v4[18] = LODWORD(self->_senderConnectionScore);
    *((_BYTE *)v4 + 80) |= 0x20u;
  }
  if (-[SGMIMetricsMailIntelligenceForMessage mailAttachmentHistogramsCount](self, "mailAttachmentHistogramsCount"))
  {
    objc_msgSend(v12, "clearMailAttachmentHistograms");
    v6 = -[SGMIMetricsMailIntelligenceForMessage mailAttachmentHistogramsCount](self, "mailAttachmentHistogramsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SGMIMetricsMailIntelligenceForMessage mailAttachmentHistogramAtIndex:](self, "mailAttachmentHistogramAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addMailAttachmentHistogram:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  v11 = v12;
  if ((v10 & 2) != 0)
  {
    v12[14] = self->_nbCharactersInMailSubject;
    *((_BYTE *)v12 + 80) |= 2u;
    v10 = (char)self->_has;
    if ((v10 & 4) == 0)
    {
LABEL_17:
      if ((v10 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  v12[15] = self->_nbTokensInMailSubject;
  *((_BYTE *)v12 + 80) |= 4u;
  v10 = (char)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_18:
    if ((v10 & 8) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_27:
  v12[17] = self->_previousInteractionOnConversationInMinutes;
  *((_BYTE *)v12 + 80) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_19:
    v12[16] = self->_previousInteractionFromUserOnConversationInMinutes;
    *((_BYTE *)v12 + 80) |= 8u;
  }
LABEL_20:
  if (self->_active)
  {
    objc_msgSend(v12, "setActive:");
    v11 = v12;
  }
  if (self->_background)
  {
    objc_msgSend(v12, "setBackground:");
    v11 = v12;
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_hoursSinceReference;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  v9 = -[NSString copyWithZone:](self->_lang, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
    *(_BYTE *)(v6 + 80) |= 0x40u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(float *)(v6 + 72) = self->_senderConnectionScore;
    *(_BYTE *)(v6 + 80) |= 0x20u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = self->_mailAttachmentHistograms;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v6, "addMailAttachmentHistogram:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_nbCharactersInMailSubject;
    *(_BYTE *)(v6 + 80) |= 2u;
    v18 = (char)self->_has;
    if ((v18 & 4) == 0)
    {
LABEL_16:
      if ((v18 & 0x10) == 0)
        goto LABEL_17;
LABEL_22:
      *(_DWORD *)(v6 + 68) = self->_previousInteractionOnConversationInMinutes;
      *(_BYTE *)(v6 + 80) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v6 + 60) = self->_nbTokensInMailSubject;
  *(_BYTE *)(v6 + 80) |= 4u;
  v18 = (char)self->_has;
  if ((v18 & 0x10) != 0)
    goto LABEL_22;
LABEL_17:
  if ((v18 & 8) != 0)
  {
LABEL_18:
    *(_DWORD *)(v6 + 64) = self->_previousInteractionFromUserOnConversationInMinutes;
    *(_BYTE *)(v6 + 80) |= 8u;
  }
LABEL_19:
  v19 = -[SGMIMetricsInferenceAndGroundTruth copyWithZone:](self->_active, "copyWithZone:", a3, (_QWORD)v24);
  v20 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v19;

  v21 = -[SGMIMetricsInferenceAndGroundTruth copyWithZone:](self->_background, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *locale;
  NSString *lang;
  char has;
  char v8;
  NSMutableArray *mailAttachmentHistograms;
  SGMIMetricsInferenceAndGroundTruth *active;
  SGMIMetricsInferenceAndGroundTruth *background;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_hoursSinceReference != *((_DWORD *)v4 + 6))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_48;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](locale, "isEqual:"))
    goto LABEL_48;
  lang = self->_lang;
  if ((unint64_t)lang | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](lang, "isEqual:"))
      goto LABEL_48;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 80);
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x40) == 0
      || self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds != *((_DWORD *)v4 + 19))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 0x40) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x20) == 0 || self->_senderConnectionScore != *((float *)v4 + 18))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  mailAttachmentHistograms = self->_mailAttachmentHistograms;
  if ((unint64_t)mailAttachmentHistograms | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](mailAttachmentHistograms, "isEqual:"))
    {
LABEL_48:
      v12 = 0;
      goto LABEL_49;
    }
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 80);
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_nbCharactersInMailSubject != *((_DWORD *)v4 + 14))
      goto LABEL_48;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_nbTokensInMailSubject != *((_DWORD *)v4 + 15))
      goto LABEL_48;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_previousInteractionOnConversationInMinutes != *((_DWORD *)v4 + 17))
      goto LABEL_48;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_previousInteractionFromUserOnConversationInMinutes != *((_DWORD *)v4 + 16))
      goto LABEL_48;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_48;
  }
  active = self->_active;
  if ((unint64_t)active | *((_QWORD *)v4 + 1)
    && !-[SGMIMetricsInferenceAndGroundTruth isEqual:](active, "isEqual:"))
  {
    goto LABEL_48;
  }
  background = self->_background;
  if ((unint64_t)background | *((_QWORD *)v4 + 2))
    v12 = -[SGMIMetricsInferenceAndGroundTruth isEqual:](background, "isEqual:");
  else
    v12 = 1;
LABEL_49:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  float senderConnectionScore;
  float v8;
  float v9;
  float v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  unint64_t v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_hoursSinceReference;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_locale, "hash");
  v5 = -[NSString hash](self->_lang, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v6 = 2654435761 * self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
LABEL_11:
    v11 = 0;
    goto LABEL_14;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_11;
LABEL_6:
  senderConnectionScore = self->_senderConnectionScore;
  v8 = -senderConnectionScore;
  if (senderConnectionScore >= 0.0)
    v8 = self->_senderConnectionScore;
  v9 = floorf(v8 + 0.5);
  v10 = (float)(v8 - v9) * 1.8447e19;
  v11 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabsf(v10);
  }
LABEL_14:
  v12 = -[NSMutableArray hash](self->_mailAttachmentHistograms, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v13 = 2654435761 * self->_nbCharactersInMailSubject;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_16:
      v14 = 2654435761 * self->_nbTokensInMailSubject;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_17;
LABEL_21:
      v15 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_18;
LABEL_22:
      v16 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_16;
  }
  v14 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_21;
LABEL_17:
  v15 = 2654435761 * self->_previousInteractionOnConversationInMinutes;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_22;
LABEL_18:
  v16 = 2654435761 * self->_previousInteractionFromUserOnConversationInMinutes;
LABEL_23:
  v17 = v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12 ^ v13;
  v18 = v14 ^ v15 ^ v16 ^ -[SGMIMetricsInferenceAndGroundTruth hash](self->_active, "hash");
  return v17 ^ v18 ^ -[SGMIMetricsInferenceAndGroundTruth hash](self->_background, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  SGMIMetricsInferenceAndGroundTruth *active;
  uint64_t v14;
  SGMIMetricsInferenceAndGroundTruth *background;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[20] & 1) != 0)
  {
    self->_hoursSinceReference = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[SGMIMetricsMailIntelligenceForMessage setLocale:](self, "setLocale:");
  if (*((_QWORD *)v5 + 4))
    -[SGMIMetricsMailIntelligenceForMessage setLang:](self, "setLang:");
  v6 = *((_BYTE *)v5 + 80);
  if ((v6 & 0x40) != 0)
  {
    self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds = *((_DWORD *)v5 + 19);
    *(_BYTE *)&self->_has |= 0x40u;
    v6 = *((_BYTE *)v5 + 80);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_senderConnectionScore = *((float *)v5 + 18);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *((id *)v5 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        -[SGMIMetricsMailIntelligenceForMessage addMailAttachmentHistogram:](self, "addMailAttachmentHistogram:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v5 + 80);
  if ((v12 & 2) != 0)
  {
    self->_nbCharactersInMailSubject = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 2u;
    v12 = *((_BYTE *)v5 + 80);
    if ((v12 & 4) == 0)
    {
LABEL_20:
      if ((v12 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v5 + 80) & 4) == 0)
  {
    goto LABEL_20;
  }
  self->_nbTokensInMailSubject = *((_DWORD *)v5 + 15);
  *(_BYTE *)&self->_has |= 4u;
  v12 = *((_BYTE *)v5 + 80);
  if ((v12 & 0x10) == 0)
  {
LABEL_21:
    if ((v12 & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_28:
  self->_previousInteractionOnConversationInMinutes = *((_DWORD *)v5 + 17);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v5 + 80) & 8) != 0)
  {
LABEL_22:
    self->_previousInteractionFromUserOnConversationInMinutes = *((_DWORD *)v5 + 16);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_23:
  active = self->_active;
  v14 = *((_QWORD *)v5 + 1);
  if (active)
  {
    if (v14)
      -[SGMIMetricsInferenceAndGroundTruth mergeFrom:](active, "mergeFrom:");
  }
  else if (v14)
  {
    -[SGMIMetricsMailIntelligenceForMessage setActive:](self, "setActive:");
  }
  background = self->_background;
  v16 = *((_QWORD *)v5 + 2);
  if (background)
  {
    if (v16)
      -[SGMIMetricsInferenceAndGroundTruth mergeFrom:](background, "mergeFrom:");
  }
  else if (v16)
  {
    -[SGMIMetricsMailIntelligenceForMessage setBackground:](self, "setBackground:");
  }

}

- (unsigned)hoursSinceReference
{
  return self->_hoursSinceReference;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)lang
{
  return self->_lang;
}

- (void)setLang:(id)a3
{
  objc_storeStrong((id *)&self->_lang, a3);
}

- (unsigned)timeDifferenceFromReceptionToSaliencyInferenceInSeconds
{
  return self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
}

- (float)senderConnectionScore
{
  return self->_senderConnectionScore;
}

- (NSMutableArray)mailAttachmentHistograms
{
  return self->_mailAttachmentHistograms;
}

- (void)setMailAttachmentHistograms:(id)a3
{
  objc_storeStrong((id *)&self->_mailAttachmentHistograms, a3);
}

- (unsigned)nbCharactersInMailSubject
{
  return self->_nbCharactersInMailSubject;
}

- (unsigned)nbTokensInMailSubject
{
  return self->_nbTokensInMailSubject;
}

- (unsigned)previousInteractionOnConversationInMinutes
{
  return self->_previousInteractionOnConversationInMinutes;
}

- (unsigned)previousInteractionFromUserOnConversationInMinutes
{
  return self->_previousInteractionFromUserOnConversationInMinutes;
}

- (SGMIMetricsInferenceAndGroundTruth)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
  objc_storeStrong((id *)&self->_active, a3);
}

- (SGMIMetricsInferenceAndGroundTruth)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->_background, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAttachmentHistograms, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_active, 0);
}

+ (Class)mailAttachmentHistogramType
{
  return (Class)objc_opt_class();
}

@end

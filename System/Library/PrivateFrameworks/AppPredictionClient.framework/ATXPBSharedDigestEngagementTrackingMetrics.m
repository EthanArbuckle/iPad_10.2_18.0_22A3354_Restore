@implementation ATXPBSharedDigestEngagementTrackingMetrics

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBSharedDigestEngagementTrackingMetrics *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[ATXPBSharedDigestEngagementTrackingMetrics init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numEngagementsInUpcoming"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumEngagementsInUpcoming:](v5, "setNumEngagementsInUpcoming:", objc_msgSend(v7, "unsignedIntegerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numEngagementsInScheduled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumEngagementsInScheduled:](v5, "setNumEngagementsInScheduled:", objc_msgSend(v8, "unsignedIntegerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numEngagementsAfterExpiration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumEngagementsAfterExpiration:](v5, "setNumEngagementsAfterExpiration:", objc_msgSend(v9, "unsignedIntegerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numExpansions"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumExpansions:](v5, "setNumExpansions:", objc_msgSend(v10, "unsignedIntegerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sectionIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBSharedDigestEngagementTrackingMetrics setSectionIdentifier:](v5, "setSectionIdentifier:", v12);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sectionPosition"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBSharedDigestEngagementTrackingMetrics setSectionPosition:](v5, "setSectionPosition:", objc_msgSend(v13, "unsignedIntegerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sectionSize"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[ATXPBSharedDigestEngagementTrackingMetrics setSectionSize:](v5, "setSectionSize:", objc_msgSend(v14, "unsignedIntegerValue"));
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[7];
  _QWORD v20[9];

  v20[7] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("numEngagementsInUpcoming");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  v19[1] = CFSTR("numEngagementsInScheduled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics numEngagementsInScheduled](self, "numEngagementsInScheduled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  v19[2] = CFSTR("numEngagementsAfterExpiration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPBSharedDigestEngagementTrackingMetrics hasNumEngagementsAfterExpiration](self, "hasNumEngagementsAfterExpiration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v3;
  v19[3] = CFSTR("numExpansions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics numExpansions](self, "numExpansions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v5;
  v19[4] = CFSTR("sectionIdentifier");
  -[ATXPBSharedDigestEngagementTrackingMetrics sectionIdentifier](self, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v7;
  v19[5] = CFSTR("sectionPosition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics sectionPosition](self, "sectionPosition"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v9;
  v19[6] = CFSTR("sectionSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics sectionSize](self, "sectionSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numEngagementsInUpcoming = a3;
}

- (void)setHasNumEngagementsInUpcoming:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumEngagementsInUpcoming
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumEngagementsInScheduled:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numEngagementsInScheduled = a3;
}

- (void)setHasNumEngagementsInScheduled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumEngagementsInScheduled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumEngagementsAfterExpiration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numEngagementsAfterExpiration = a3;
}

- (void)setHasNumEngagementsAfterExpiration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumEngagementsAfterExpiration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumExpansions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numExpansions = a3;
}

- (void)setHasNumExpansions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumExpansions
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasSectionIdentifier
{
  return self->_sectionIdentifier != 0;
}

- (void)setSectionPosition:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_sectionPosition = a3;
}

- (void)setHasSectionPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSectionPosition
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSectionSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_sectionSize = a3;
}

- (void)setHasSectionSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSectionSize
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNumDigestExpansions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numDigestExpansions = a3;
}

- (void)setHasNumDigestExpansions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumDigestExpansions
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSharedDigestEngagementTrackingMetrics;
  -[ATXPBSharedDigestEngagementTrackingMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSharedDigestEngagementTrackingMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *sectionIdentifier;
  char v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numEngagementsInUpcoming);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numEngagementsInUpcoming"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numEngagementsInScheduled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("numEngagementsInScheduled"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numEngagementsAfterExpiration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("numEngagementsAfterExpiration"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numExpansions);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("numExpansions"));

  }
LABEL_6:
  sectionIdentifier = self->_sectionIdentifier;
  if (sectionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sectionIdentifier, CFSTR("sectionIdentifier"));
  v7 = (char)self->_has;
  if ((v7 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_10;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sectionSize);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("sectionSize"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sectionPosition);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sectionPosition"));

  v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v7 & 1) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numDigestExpansions);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("numDigestExpansions"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_sectionIdentifier)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (char)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
LABEL_18:
      PBDataWriterWriteUint64Field();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  v5 = (char)self->_has;
  if ((v5 & 2) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v5 & 1) != 0)
LABEL_11:
    PBDataWriterWriteUint64Field();
LABEL_12:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_numEngagementsInUpcoming;
    *((_BYTE *)v4 + 72) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_numEngagementsInScheduled;
  *((_BYTE *)v4 + 72) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4[5] = self->_numExpansions;
    *((_BYTE *)v4 + 72) |= 0x10u;
  }
LABEL_5:
  if (self->_sectionIdentifier)
  {
    v7 = v4;
    objc_msgSend(v4, "setSectionIdentifier:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[6] = self->_sectionPosition;
    *((_BYTE *)v4 + 72) |= 0x20u;
    v6 = (char)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
LABEL_18:
      v4[2] = self->_numEngagementsAfterExpiration;
      *((_BYTE *)v4 + 72) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  v4[7] = self->_sectionSize;
  *((_BYTE *)v4 + 72) |= 0x40u;
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v6 & 1) != 0)
  {
LABEL_11:
    v4[1] = self->_numDigestExpansions;
    *((_BYTE *)v4 + 72) |= 1u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_numEngagementsInUpcoming;
    *(_BYTE *)(v5 + 72) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 24) = self->_numEngagementsInScheduled;
  *(_BYTE *)(v5 + 72) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 40) = self->_numExpansions;
    *(_BYTE *)(v5 + 72) |= 0x10u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_sectionIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v8;

  v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_sectionPosition;
    *(_BYTE *)(v6 + 72) |= 0x20u;
    v10 = (char)self->_has;
    if ((v10 & 0x40) == 0)
    {
LABEL_7:
      if ((v10 & 2) == 0)
        goto LABEL_8;
LABEL_16:
      *(_QWORD *)(v6 + 16) = self->_numEngagementsAfterExpiration;
      *(_BYTE *)(v6 + 72) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v6;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v6 + 56) = self->_sectionSize;
  *(_BYTE *)(v6 + 72) |= 0x40u;
  v10 = (char)self->_has;
  if ((v10 & 2) != 0)
    goto LABEL_16;
LABEL_8:
  if ((v10 & 1) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 8) = self->_numDigestExpansions;
    *(_BYTE *)(v6 + 72) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *sectionIdentifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_numEngagementsInUpcoming != *((_QWORD *)v4 + 4))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_numEngagementsInScheduled != *((_QWORD *)v4 + 3))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0 || self->_numExpansions != *((_QWORD *)v4 + 5))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  sectionIdentifier = self->_sectionIdentifier;
  if ((unint64_t)sectionIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](sectionIdentifier, "isEqual:"))
    {
LABEL_39:
      v7 = 0;
      goto LABEL_40;
    }
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x20) == 0 || self->_sectionPosition != *((_QWORD *)v4 + 6))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x40) == 0 || self->_sectionSize != *((_QWORD *)v4 + 7))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x40) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_numEngagementsAfterExpiration != *((_QWORD *)v4 + 2))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_39;
  }
  v7 = (*((_BYTE *)v4 + 72) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_numDigestExpansions != *((_QWORD *)v4 + 1))
      goto LABEL_39;
    v7 = 1;
  }
LABEL_40:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_numEngagementsInUpcoming;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_numEngagementsInScheduled;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_numExpansions;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_sectionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v7 = 2654435761u * self->_sectionPosition;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_10:
      v8 = 2654435761u * self->_sectionSize;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_11;
LABEL_15:
      v9 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_12;
LABEL_16:
      v10 = 0;
      return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v6;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_10;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_11:
  v9 = 2654435761u * self->_numEngagementsAfterExpiration;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_16;
LABEL_12:
  v10 = 2654435761u * self->_numDigestExpansions;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_numEngagementsInUpcoming = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numEngagementsInScheduled = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
LABEL_4:
    self->_numExpansions = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 8))
  {
    v7 = v4;
    -[ATXPBSharedDigestEngagementTrackingMetrics setSectionIdentifier:](self, "setSectionIdentifier:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 0x20) != 0)
  {
    self->_sectionPosition = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 72);
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
LABEL_18:
      self->_numEngagementsAfterExpiration = *((_QWORD *)v4 + 2);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 72) & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_sectionSize = *((_QWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x40u;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 2) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v6 & 1) != 0)
  {
LABEL_11:
    self->_numDigestExpansions = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_12:

}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (unint64_t)numEngagementsInScheduled
{
  return self->_numEngagementsInScheduled;
}

- (unint64_t)numEngagementsAfterExpiration
{
  return self->_numEngagementsAfterExpiration;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifier, a3);
}

- (unint64_t)sectionPosition
{
  return self->_sectionPosition;
}

- (unint64_t)sectionSize
{
  return self->_sectionSize;
}

- (unint64_t)numDigestExpansions
{
  return self->_numDigestExpansions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end

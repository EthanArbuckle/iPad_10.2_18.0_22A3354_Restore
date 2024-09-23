@implementation ATXMPBInstalledAppClipSessionEngagementTracker

- (int)engagementType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_engagementType;
  else
    return 0;
}

- (void)setEngagementType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82E4D40[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Shown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Engaged")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Rejected")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)setNumSuggestionsShown:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numSuggestionsShown = a3;
}

- (void)setHasNumSuggestionsShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSuggestionsShown
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
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
  v8.super_class = (Class)ATXMPBInstalledAppClipSessionEngagementTracker;
  -[ATXMPBInstalledAppClipSessionEngagementTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBInstalledAppClipSessionEngagementTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t engagementType;
  __CFString *v5;
  NSString *consumerSubType;
  void *v7;
  NSString *abGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    engagementType = self->_engagementType;
    if (engagementType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82E4D40[engagementType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("engagementType"));

  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numSuggestionsShown);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("numSuggestionsShown"));

  }
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v3, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBInstalledAppClipSessionEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_engagementType;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_consumerSubType)
  {
    objc_msgSend(v4, "setConsumerSubType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[7] = self->_numSuggestionsShown;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    v4 = v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_engagementType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_numSuggestionsShown;
    *(_BYTE *)(v6 + 32) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *consumerSubType;
  NSString *abGroup;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 6))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_17;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
    {
LABEL_17:
      v8 = 0;
      goto LABEL_18;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_numSuggestionsShown != *((_DWORD *)v4 + 7))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_17;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](abGroup, "isEqual:");
  else
    v8 = 1;
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_engagementType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_consumerSubType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_numSuggestionsShown;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_abGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[8] & 1) != 0)
  {
    self->_engagementType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBInstalledAppClipSessionEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v5;
  }
  if ((v4[8] & 2) != 0)
  {
    self->_numSuggestionsShown = v4[7];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBInstalledAppClipSessionEngagementTracker setAbGroup:](self, "setAbGroup:");
    v4 = v5;
  }

}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (unsigned)numSuggestionsShown
{
  return self->_numSuggestionsShown;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end

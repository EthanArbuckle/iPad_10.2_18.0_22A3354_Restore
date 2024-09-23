@implementation ATXMagicalMomentsPBMMEngagedTracker

- (int)anchor
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_anchor;
  else
    return 0;
}

- (void)setAnchor:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_anchor = a3;
}

- (void)setHasAnchor:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnchor
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)anchorAsString:(int)a3
{
  if (a3 < 0x13)
    return off_1E82E6A38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAnchor:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_BLUETOOTH_CONNECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_BLUETOOTH_DISCONNECTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_IDLE_TIME_BEGIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_IDLE_TIME_END")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_CARPLAY_CONNECTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_CARPLAY_DISCONNECTED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_LOI_ENTRANCE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_LOI_EXIT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WORKOUT_START")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WORKOUT_END")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_HEADING_HOME")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_HEADING_TO_WORK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_FIRST_CALENDAR_EVENT_OF_DAY")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_LAST_CALENDAR_EVENT_OF_DAY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_UPCOMING_SEMANTIC_EVENT")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WIRED_AUDIO_DEVICE_CONNECTED")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WIRED_AUDIO_DEVICE_DISCONNECTED")) & 1) != 0)
  {
    v4 = 17;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_CHARGER_CONNECTED")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
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
  v8.super_class = (Class)ATXMagicalMomentsPBMMEngagedTracker;
  -[ATXMagicalMomentsPBMMEngagedTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMagicalMomentsPBMMEngagedTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t anchor;
  __CFString *v5;
  NSString *bundleId;
  NSString *abGroup;
  NSString *consumerSubType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    anchor = self->_anchor;
    if (anchor >= 0x13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_anchor);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82E6A38[anchor];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("anchor"));

  }
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v3, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMagicalMomentsPBMMEngagedTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_consumerSubType)
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
    v4[4] = self->_anchor;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_anchor;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  NSString *abGroup;
  NSString *consumerSubType;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_anchor != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](bundleId, "isEqual:"))
    goto LABEL_13;
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_13;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](consumerSubType, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_anchor;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bundleId, "hash") ^ v3;
  v5 = -[NSString hash](self->_abGroup, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_consumerSubType, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_anchor = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMagicalMomentsPBMMEngagedTracker setBundleId:](self, "setBundleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMagicalMomentsPBMMEngagedTracker setAbGroup:](self, "setAbGroup:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMagicalMomentsPBMMEngagedTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v5;
  }

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end

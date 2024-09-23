@implementation BMPBIntentEvent

- (void)setSourceId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceId, a3);
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (void)setInteractionDirection:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_interactionDirection = a3;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (void)setIntentVerb:(id)a3
{
  objc_storeStrong((id *)&self->_intentVerb, a3);
}

- (void)setIntentType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_intentType = a3;
}

- (void)setIntentHandlingStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_intentHandlingStatus = a3;
}

- (void)setIntentClass:(id)a3
{
  objc_storeStrong((id *)&self->_intentClass, a3);
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (void)setDonatedBySiri:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_donatedBySiri = a3;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_intentVerb, 0);
  objc_storeStrong((id *)&self->_intentClass, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_sourceId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_intentClass)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_intentVerb)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_interaction)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_itemID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_groupIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBIntentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSData)interaction
{
  return self->_interaction;
}

- (int)interactionDirection
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_interactionDirection;
  else
    return 0;
}

- (NSString)intentVerb
{
  return self->_intentVerb;
}

- (int)intentType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_intentType;
  else
    return 0;
}

- (int)intentHandlingStatus
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_intentHandlingStatus;
  else
    return 0;
}

- (NSString)intentClass
{
  return self->_intentClass;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)donatedBySiri
{
  return self->_donatedBySiri;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasSourceId
{
  return self->_sourceId != 0;
}

- (BOOL)hasIntentClass
{
  return self->_intentClass != 0;
}

- (BOOL)hasIntentVerb
{
  return self->_intentVerb != 0;
}

- (void)setHasIntentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntentType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)intentTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E26487D0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIntentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("System")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Generic")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasIntentHandlingStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntentHandlingStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)intentHandlingStatusAsString:(int)a3
{
  if (a3 < 7)
    return *(&off_1E26487F0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIntentHandlingStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unspecified")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Ready")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InProgress")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Failure")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeferredToApplication")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UserConfirmationRequired")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasInteraction
{
  return self->_interaction != 0;
}

- (BOOL)hasItemID
{
  return self->_itemID != 0;
}

- (void)setHasDonatedBySiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDonatedBySiri
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasInteractionDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInteractionDirection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)interactionDirectionAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E2648828 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInteractionDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Incoming")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Outgoing")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Bidirectional")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
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
  v8.super_class = (Class)BMPBIntentEvent;
  -[BMPBIntentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBIntentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleID;
  NSString *sourceId;
  NSString *intentClass;
  NSString *intentVerb;
  char has;
  uint64_t intentType;
  void *v11;
  uint64_t intentHandlingStatus;
  void *v13;
  NSData *interaction;
  NSString *itemID;
  char v16;
  void *v17;
  uint64_t interactionDirection;
  void *v19;
  NSString *groupIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimestamp"));

  }
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  sourceId = self->_sourceId;
  if (sourceId)
    objc_msgSend(v3, "setObject:forKey:", sourceId, CFSTR("sourceId"));
  intentClass = self->_intentClass;
  if (intentClass)
    objc_msgSend(v3, "setObject:forKey:", intentClass, CFSTR("intentClass"));
  intentVerb = self->_intentVerb;
  if (intentVerb)
    objc_msgSend(v3, "setObject:forKey:", intentVerb, CFSTR("intentVerb"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    intentType = self->_intentType;
    if (intentType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_intentType);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E26487D0 + intentType);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("intentType"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    intentHandlingStatus = self->_intentHandlingStatus;
    if (intentHandlingStatus >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_intentHandlingStatus);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *(&off_1E26487F0 + intentHandlingStatus);
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("intentHandlingStatus"));

  }
  interaction = self->_interaction;
  if (interaction)
    objc_msgSend(v3, "setObject:forKey:", interaction, CFSTR("interaction"));
  itemID = self->_itemID;
  if (itemID)
    objc_msgSend(v3, "setObject:forKey:", itemID, CFSTR("itemID"));
  v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_donatedBySiri);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("donatedBySiri"));

    v16 = (char)self->_has;
  }
  if ((v16 & 8) != 0)
  {
    interactionDirection = self->_interactionDirection;
    if (interactionDirection >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interactionDirection);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = *(&off_1E2648828 + interactionDirection);
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("interactionDirection"));

  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier)
    objc_msgSend(v3, "setObject:forKey:", groupIdentifier, CFSTR("groupIdentifier"));
  return v3;
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 92) |= 1u;
  }
  v7 = v4;
  if (self->_bundleID)
  {
    objc_msgSend(v4, "setBundleID:");
    v4 = v7;
  }
  if (self->_sourceId)
  {
    objc_msgSend(v7, "setSourceId:");
    v4 = v7;
  }
  if (self->_intentClass)
  {
    objc_msgSend(v7, "setIntentClass:");
    v4 = v7;
  }
  if (self->_intentVerb)
  {
    objc_msgSend(v7, "setIntentVerb:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_intentType;
    *((_BYTE *)v4 + 92) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_intentHandlingStatus;
    *((_BYTE *)v4 + 92) |= 2u;
  }
  if (self->_interaction)
  {
    objc_msgSend(v7, "setInteraction:");
    v4 = v7;
  }
  if (self->_itemID)
  {
    objc_msgSend(v7, "setItemID:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_BYTE *)v4 + 88) = self->_donatedBySiri;
    *((_BYTE *)v4 + 92) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_interactionDirection;
    *((_BYTE *)v4 + 92) |= 8u;
  }
  if (self->_groupIdentifier)
  {
    objc_msgSend(v7, "setGroupIdentifier:");
    v4 = v7;
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
  char has;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_sourceId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v9;

  v11 = -[NSString copyWithZone:](self->_intentClass, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_intentVerb, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v13;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_intentType;
    *(_BYTE *)(v6 + 92) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_intentHandlingStatus;
    *(_BYTE *)(v6 + 92) |= 2u;
  }
  v16 = -[NSData copyWithZone:](self->_interaction, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_itemID, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v18;

  v20 = (char)self->_has;
  if ((v20 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 88) = self->_donatedBySiri;
    *(_BYTE *)(v6 + 92) |= 0x10u;
    v20 = (char)self->_has;
  }
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_interactionDirection;
    *(_BYTE *)(v6 + 92) |= 8u;
  }
  v21 = -[NSString copyWithZone:](self->_groupIdentifier, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleID;
  NSString *sourceId;
  NSString *intentClass;
  NSString *intentVerb;
  NSData *interaction;
  NSString *itemID;
  NSString *groupIdentifier;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_44;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](bundleID, "isEqual:"))
    goto LABEL_44;
  sourceId = self->_sourceId;
  if ((unint64_t)sourceId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](sourceId, "isEqual:"))
      goto LABEL_44;
  }
  intentClass = self->_intentClass;
  if ((unint64_t)intentClass | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](intentClass, "isEqual:"))
      goto LABEL_44;
  }
  intentVerb = self->_intentVerb;
  if ((unint64_t)intentVerb | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](intentVerb, "isEqual:"))
      goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_intentType != *((_DWORD *)v4 + 11))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_intentHandlingStatus != *((_DWORD *)v4 + 10))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_44;
  }
  interaction = self->_interaction;
  if ((unint64_t)interaction | *((_QWORD *)v4 + 7) && !-[NSData isEqual:](interaction, "isEqual:"))
    goto LABEL_44;
  itemID = self->_itemID;
  if ((unint64_t)itemID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](itemID, "isEqual:"))
      goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
    {
      if (self->_donatedBySiri)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_44;
        goto LABEL_37;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_37;
    }
LABEL_44:
    v12 = 0;
    goto LABEL_45;
  }
  if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
    goto LABEL_44;
LABEL_37:
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0 || self->_interactionDirection != *((_DWORD *)v4 + 16))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
    goto LABEL_44;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((_QWORD *)v4 + 3))
    v12 = -[NSString isEqual:](groupIdentifier, "isEqual:");
  else
    v12 = 1;
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v18;

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
  v18 = -[NSString hash](self->_bundleID, "hash");
  v8 = -[NSString hash](self->_sourceId, "hash");
  v9 = -[NSString hash](self->_intentClass, "hash");
  v10 = -[NSString hash](self->_intentVerb, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v11 = 2654435761 * self->_intentType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
  }
  else
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_11:
      v12 = 2654435761 * self->_intentHandlingStatus;
      goto LABEL_14;
    }
  }
  v12 = 0;
LABEL_14:
  v13 = -[NSData hash](self->_interaction, "hash");
  v14 = -[NSString hash](self->_itemID, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v15 = 2654435761 * self->_donatedBySiri;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_16;
LABEL_18:
    v16 = 0;
    return v18 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSString hash](self->_groupIdentifier, "hash");
  }
  v15 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_18;
LABEL_16:
  v16 = 2654435761 * self->_interactionDirection;
  return v18 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSString hash](self->_groupIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBIntentEvent setBundleID:](self, "setBundleID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[BMPBIntentEvent setSourceId:](self, "setSourceId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBIntentEvent setIntentClass:](self, "setIntentClass:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBIntentEvent setIntentVerb:](self, "setIntentVerb:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 92);
  if ((v5 & 4) != 0)
  {
    self->_intentType = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 92);
  }
  if ((v5 & 2) != 0)
  {
    self->_intentHandlingStatus = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBIntentEvent setInteraction:](self, "setInteraction:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[BMPBIntentEvent setItemID:](self, "setItemID:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 92);
  if ((v6 & 0x10) != 0)
  {
    self->_donatedBySiri = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 92);
  }
  if ((v6 & 8) != 0)
  {
    self->_interactionDirection = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBIntentEvent setGroupIdentifier:](self, "setGroupIdentifier:");
    v4 = v7;
  }

}

@end

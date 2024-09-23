@implementation MSPTransitStorageArtwork

- (MSPTransitStorageArtwork)initWithArtwork:(id)a3
{
  id v4;
  MSPTransitStorageArtwork *v5;
  void *v6;
  MSPTransitStorageShield *v7;
  void *v8;
  MSPTransitStorageShield *v9;
  void *v10;
  MSPTransitStorageIcon *v11;
  void *v12;
  MSPTransitStorageIcon *v13;
  void *v14;
  MSPTransitStorageShield *v15;
  void *v16;
  MSPTransitStorageShield *v17;
  void *v18;
  MSPTransitStorageArtwork *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSPTransitStorageArtwork;
  v5 = -[MSPTransitStorageArtwork init](&v21, sel_init);
  if (v5)
  {
    -[MSPTransitStorageArtwork setArtworkSourceType:](v5, "setArtworkSourceType:", objc_msgSend(v4, "artworkSourceType"));
    -[MSPTransitStorageArtwork setArtworkUseType:](v5, "setArtworkUseType:", objc_msgSend(v4, "artworkUseType"));
    objc_msgSend(v4, "shieldDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [MSPTransitStorageShield alloc];
      objc_msgSend(v4, "shieldDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MSPTransitStorageShield initWithShield:](v7, "initWithShield:", v8);
      -[MSPTransitStorageArtwork setShield:](v5, "setShield:", v9);

    }
    objc_msgSend(v4, "iconDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [MSPTransitStorageIcon alloc];
      objc_msgSend(v4, "iconDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[MSPTransitStorageIcon initWithIcon:](v11, "initWithIcon:", v12);
      -[MSPTransitStorageArtwork setIcon:](v5, "setIcon:", v13);

    }
    objc_msgSend(v4, "iconFallbackShieldDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [MSPTransitStorageShield alloc];
      objc_msgSend(v4, "iconFallbackShieldDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MSPTransitStorageShield initWithShield:](v15, "initWithShield:", v16);
      -[MSPTransitStorageArtwork setIconFallbackShield:](v5, "setIconFallbackShield:", v17);

    }
    -[MSPTransitStorageArtwork setHasRoutingIncidentBadge:](v5, "setHasRoutingIncidentBadge:", objc_msgSend(v4, "hasRoutingIncidentBadge"));
    objc_msgSend(v4, "accessibilityText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageArtwork setAccessibilityText:](v5, "setAccessibilityText:", v18);

    v19 = v5;
  }

  return v5;
}

- (GEOTransitTextDataSource)textDataSource
{
  return 0;
}

- (void)setArtworkSourceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_artworkSourceType = a3;
}

- (void)setHasArtworkSourceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArtworkSourceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)artworkSourceTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E6652380[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArtworkSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkSourceTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkSourceTypeShield")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkSourceTypeIcon")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkSourceTypeText")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setArtworkUseType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_artworkUseType = a3;
}

- (void)setHasArtworkUseType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasArtworkUseType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)artworkUseTypeAsString:(int)a3
{
  if (a3 < 0xD)
    return off_1E66523A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArtworkUseType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeLine")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeBrand")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeMode")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeSystem")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeTrip")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeAccessPoint")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeStation")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeTripRoutePlanning")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeManeuver")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeHall")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeStationLine")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitArtworkUseTypeVehiclePosition")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasShield
{
  return self->_shield != 0;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (BOOL)hasIconFallbackShield
{
  return self->_iconFallbackShield != 0;
}

- (void)setHasRoutingIncidentBadge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasRoutingIncidentBadge = a3;
}

- (void)setHasHasRoutingIncidentBadge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasRoutingIncidentBadge
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAccessibilityText
{
  return self->_accessibilityText != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageArtwork;
  -[MSPTransitStorageArtwork description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageArtwork dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t artworkSourceType;
  __CFString *v6;
  uint64_t artworkUseType;
  __CFString *v8;
  MSPTransitStorageShield *shield;
  void *v10;
  MSPTransitStorageIcon *icon;
  void *v12;
  MSPTransitStorageShield *iconFallbackShield;
  void *v14;
  void *v15;
  NSString *accessibilityText;
  PBUnknownFields *unknownFields;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    artworkSourceType = self->_artworkSourceType;
    if (artworkSourceType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), self->_artworkSourceType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E6652380[artworkSourceType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("artwork_source_type"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    artworkUseType = self->_artworkUseType;
    if (artworkUseType >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), self->_artworkUseType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E66523A0[artworkUseType];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("artwork_use_type"));

  }
  shield = self->_shield;
  if (shield)
  {
    -[MSPTransitStorageShield dictionaryRepresentation](shield, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("shield"));

  }
  icon = self->_icon;
  if (icon)
  {
    -[MSPTransitStorageIcon dictionaryRepresentation](icon, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("icon"));

  }
  iconFallbackShield = self->_iconFallbackShield;
  if (iconFallbackShield)
  {
    -[MSPTransitStorageShield dictionaryRepresentation](iconFallbackShield, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("icon_fallback_shield"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasRoutingIncidentBadge);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("has_routing_incident_badge"));

  }
  accessibilityText = self->_accessibilityText;
  if (accessibilityText)
    objc_msgSend(v3, "setObject:forKey:", accessibilityText, CFSTR("accessibility_text"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageArtworkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_shield)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_icon)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_iconFallbackShield)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_accessibilityText)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[6] = self->_artworkSourceType;
    *((_BYTE *)v4 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[7] = self->_artworkUseType;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  v6 = v4;
  if (self->_shield)
  {
    objc_msgSend(v4, "setShield:");
    v4 = v6;
  }
  if (self->_icon)
  {
    objc_msgSend(v6, "setIcon:");
    v4 = v6;
  }
  if (self->_iconFallbackShield)
  {
    objc_msgSend(v6, "setIconFallbackShield:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_hasRoutingIncidentBadge;
    *((_BYTE *)v4 + 60) |= 4u;
  }
  if (self->_accessibilityText)
  {
    objc_msgSend(v6, "setAccessibilityText:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_artworkSourceType;
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_artworkUseType;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v8 = -[MSPTransitStorageShield copyWithZone:](self->_shield, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v8;

  v10 = -[MSPTransitStorageIcon copyWithZone:](self->_icon, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  v12 = -[MSPTransitStorageShield copyWithZone:](self->_iconFallbackShield, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 56) = self->_hasRoutingIncidentBadge;
    *(_BYTE *)(v6 + 60) |= 4u;
  }
  v14 = -[NSString copyWithZone:](self->_accessibilityText, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v14;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MSPTransitStorageShield *shield;
  MSPTransitStorageIcon *icon;
  MSPTransitStorageShield *iconFallbackShield;
  char v8;
  NSString *accessibilityText;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_artworkSourceType != *((_DWORD *)v4 + 6))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_artworkUseType != *((_DWORD *)v4 + 7))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_22;
  }
  shield = self->_shield;
  if ((unint64_t)shield | *((_QWORD *)v4 + 6) && !-[MSPTransitStorageShield isEqual:](shield, "isEqual:"))
    goto LABEL_22;
  icon = self->_icon;
  if ((unint64_t)icon | *((_QWORD *)v4 + 4))
  {
    if (!-[MSPTransitStorageIcon isEqual:](icon, "isEqual:"))
      goto LABEL_22;
  }
  iconFallbackShield = self->_iconFallbackShield;
  if ((unint64_t)iconFallbackShield | *((_QWORD *)v4 + 5))
  {
    if (!-[MSPTransitStorageShield isEqual:](iconFallbackShield, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0)
      goto LABEL_28;
LABEL_22:
    v8 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 60) & 4) == 0)
    goto LABEL_22;
  if (!self->_hasRoutingIncidentBadge)
  {
    if (!*((_BYTE *)v4 + 56))
      goto LABEL_28;
    goto LABEL_22;
  }
  if (!*((_BYTE *)v4 + 56))
    goto LABEL_22;
LABEL_28:
  accessibilityText = self->_accessibilityText;
  if ((unint64_t)accessibilityText | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](accessibilityText, "isEqual:");
  else
    v8 = 1;
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_artworkSourceType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_artworkUseType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[MSPTransitStorageShield hash](self->_shield, "hash");
  v6 = -[MSPTransitStorageIcon hash](self->_icon, "hash");
  v7 = -[MSPTransitStorageShield hash](self->_iconFallbackShield, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_hasRoutingIncidentBadge;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_accessibilityText, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;
  char v6;
  MSPTransitStorageShield *shield;
  uint64_t v8;
  MSPTransitStorageIcon *icon;
  uint64_t v10;
  MSPTransitStorageShield *iconFallbackShield;
  uint64_t v12;
  int *v13;

  v4 = (int *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 1) != 0)
  {
    self->_artworkSourceType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_artworkUseType = v4[7];
    *(_BYTE *)&self->_has |= 2u;
  }
  shield = self->_shield;
  v8 = *((_QWORD *)v5 + 6);
  v13 = v5;
  if (shield)
  {
    if (!v8)
      goto LABEL_11;
    -[MSPTransitStorageShield mergeFrom:](shield, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    -[MSPTransitStorageArtwork setShield:](self, "setShield:");
  }
  v5 = v13;
LABEL_11:
  icon = self->_icon;
  v10 = *((_QWORD *)v5 + 4);
  if (icon)
  {
    if (!v10)
      goto LABEL_17;
    -[MSPTransitStorageIcon mergeFrom:](icon, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_17;
    -[MSPTransitStorageArtwork setIcon:](self, "setIcon:");
  }
  v5 = v13;
LABEL_17:
  iconFallbackShield = self->_iconFallbackShield;
  v12 = *((_QWORD *)v5 + 5);
  if (iconFallbackShield)
  {
    if (!v12)
      goto LABEL_23;
    -[MSPTransitStorageShield mergeFrom:](iconFallbackShield, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_23;
    -[MSPTransitStorageArtwork setIconFallbackShield:](self, "setIconFallbackShield:");
  }
  v5 = v13;
LABEL_23:
  if ((v5[15] & 4) != 0)
  {
    self->_hasRoutingIncidentBadge = *((_BYTE *)v5 + 56);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[MSPTransitStorageArtwork setAccessibilityText:](self, "setAccessibilityText:");
    v5 = v13;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (int)artworkSourceType
{
  return self->_artworkSourceType;
}

- (int)artworkUseType
{
  return self->_artworkUseType;
}

- (MSPTransitStorageShield)shield
{
  return self->_shield;
}

- (void)setShield:(id)a3
{
  objc_storeStrong((id *)&self->_shield, a3);
}

- (MSPTransitStorageIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (MSPTransitStorageShield)iconFallbackShield
{
  return self->_iconFallbackShield;
}

- (void)setIconFallbackShield:(id)a3
{
  objc_storeStrong((id *)&self->_iconFallbackShield, a3);
}

- (BOOL)hasRoutingIncidentBadge
{
  return self->_hasRoutingIncidentBadge;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_iconFallbackShield, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end

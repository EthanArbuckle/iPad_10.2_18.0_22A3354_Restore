@implementation GEOLogMsgStateARPPhotoSubmission

- (BOOL)hasOriginTarget
{
  return self->_originTarget != 0;
}

- (NSString)originTarget
{
  return self->_originTarget;
}

- (void)setOriginTarget:(id)a3
{
  objc_storeStrong((id *)&self->_originTarget, a3);
}

- (BOOL)isFromRecommendationCard
{
  return self->_isFromRecommendationCard;
}

- (void)setIsFromRecommendationCard:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isFromRecommendationCard = a3;
}

- (void)setHasIsFromRecommendationCard:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsFromRecommendationCard
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)isFromMapsSuggesions
{
  return self->_isFromMapsSuggesions;
}

- (void)setIsFromMapsSuggesions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_isFromMapsSuggesions = a3;
}

- (void)setHasIsFromMapsSuggesions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsFromMapsSuggesions
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)isPlacecardInlineSubmission
{
  return self->_isPlacecardInlineSubmission;
}

- (void)setIsPlacecardInlineSubmission:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_isPlacecardInlineSubmission = a3;
}

- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsPlacecardInlineSubmission
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (void)setNumberOfPhotos:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_numberOfPhotos = a3;
}

- (void)setHasNumberOfPhotos:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNumberOfPhotos
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)numberOfAprSuggestedPhotos
{
  return self->_numberOfAprSuggestedPhotos;
}

- (void)setNumberOfAprSuggestedPhotos:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_numberOfAprSuggestedPhotos = a3;
}

- (void)setHasNumberOfAprSuggestedPhotos:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNumberOfAprSuggestedPhotos
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOLogMsgStateARPPhotoSubmission;
  -[GEOLogMsgStateARPPhotoSubmission description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateARPPhotoSubmission dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateARPPhotoSubmission _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "originTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("originTarget");
    else
      v6 = CFSTR("origin_target");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 28);
  if ((v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isFromRecommendationCard");
    else
      v9 = CFSTR("is_from_recommendation_card");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 28);
  }
  if ((v7 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isFromMapsSuggesions");
    else
      v11 = CFSTR("is_from_maps_suggesions");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v7 = *(_BYTE *)(a1 + 28);
    if ((v7 & 0x10) == 0)
    {
LABEL_14:
      if ((v7 & 2) == 0)
        goto LABEL_15;
      goto LABEL_25;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 26));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("isPlacecardInlineSubmission");
  else
    v13 = CFSTR("is_placecard_inline_submission");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v7 = *(_BYTE *)(a1 + 28);
  if ((v7 & 2) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0)
      return v4;
    goto LABEL_29;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("numberOfPhotos");
  else
    v15 = CFSTR("number_of_photos");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("numberOfAprSuggestedPhotos");
    else
      v17 = CFSTR("number_of_apr_suggested_photos");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateARPPhotoSubmission _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateARPPhotoSubmission)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateARPPhotoSubmission *)-[GEOLogMsgStateARPPhotoSubmission _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("originTarget");
      else
        v6 = CFSTR("origin_target");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setOriginTarget:", v8);

      }
      if (a3)
        v9 = CFSTR("isFromRecommendationCard");
      else
        v9 = CFSTR("is_from_recommendation_card");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsFromRecommendationCard:", objc_msgSend(v10, "BOOLValue"));

      if (a3)
        v11 = CFSTR("isFromMapsSuggesions");
      else
        v11 = CFSTR("is_from_maps_suggesions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsFromMapsSuggesions:", objc_msgSend(v12, "BOOLValue"));

      if (a3)
        v13 = CFSTR("isPlacecardInlineSubmission");
      else
        v13 = CFSTR("is_placecard_inline_submission");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsPlacecardInlineSubmission:", objc_msgSend(v14, "BOOLValue"));

      if (a3)
        v15 = CFSTR("numberOfPhotos");
      else
        v15 = CFSTR("number_of_photos");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfPhotos:", objc_msgSend(v16, "unsignedIntValue"));

      if (a3)
        v17 = CFSTR("numberOfAprSuggestedPhotos");
      else
        v17 = CFSTR("number_of_apr_suggested_photos");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfAprSuggestedPhotos:", objc_msgSend(v18, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateARPPhotoSubmission)initWithJSON:(id)a3
{
  return (GEOLogMsgStateARPPhotoSubmission *)-[GEOLogMsgStateARPPhotoSubmission _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateARPPhotoSubmissionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateARPPhotoSubmissionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_originTarget)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
LABEL_13:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_9:

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOLogMsgStateARPPhotoSubmission readAll:](self, "readAll:", 0);
  if (self->_originTarget)
    objc_msgSend(v5, "setOriginTarget:");
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_BYTE *)v5 + 25) = self->_isFromRecommendationCard;
    *((_BYTE *)v5 + 28) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v5 + 24) = self->_isFromMapsSuggesions;
  *((_BYTE *)v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
LABEL_13:
    *((_DWORD *)v5 + 5) = self->_numberOfPhotos;
    *((_BYTE *)v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  *((_BYTE *)v5 + 26) = self->_isPlacecardInlineSubmission;
  *((_BYTE *)v5 + 28) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 4) = self->_numberOfAprSuggestedPhotos;
    *((_BYTE *)v5 + 28) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_originTarget, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 25) = self->_isFromRecommendationCard;
    *(_BYTE *)(v5 + 28) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 24) = self->_isFromMapsSuggesions;
  *(_BYTE *)(v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v5 + 20) = self->_numberOfPhotos;
    *(_BYTE *)(v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_6;
  }
LABEL_10:
  *(_BYTE *)(v5 + 26) = self->_isPlacecardInlineSubmission;
  *(_BYTE *)(v5 + 28) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_numberOfAprSuggestedPhotos;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *originTarget;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[GEOLogMsgStateARPPhotoSubmission readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  originTarget = self->_originTarget;
  if ((unint64_t)originTarget | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](originTarget, "isEqual:"))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0)
      goto LABEL_37;
    if (self->_isFromRecommendationCard)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_37;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_37;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_37;
    if (self->_isFromMapsSuggesions)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_37;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_37;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
    {
      if (self->_isPlacecardInlineSubmission)
      {
        if (!*((_BYTE *)v4 + 26))
          goto LABEL_37;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_28;
    }
LABEL_37:
    v6 = 0;
    goto LABEL_38;
  }
  if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
    goto LABEL_37;
LABEL_28:
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_numberOfPhotos != *((_DWORD *)v4 + 5))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_37;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_numberOfAprSuggestedPhotos != *((_DWORD *)v4 + 4))
      goto LABEL_37;
    v6 = 1;
  }
LABEL_38:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOLogMsgStateARPPhotoSubmission readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_originTarget, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v4 = 2654435761 * self->_isFromRecommendationCard;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isFromMapsSuggesions;
      if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_isPlacecardInlineSubmission;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_numberOfPhotos;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761 * self->_numberOfAprSuggestedPhotos;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 1))
    -[GEOLogMsgStateARPPhotoSubmission setOriginTarget:](self, "setOriginTarget:");
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 8) != 0)
  {
    self->_isFromRecommendationCard = *((_BYTE *)v5 + 25);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 28);
    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v5 + 28) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_isFromMapsSuggesions = *((_BYTE *)v5 + 24);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0)
      goto LABEL_7;
LABEL_13:
    self->_numberOfPhotos = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 28) & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  self->_isPlacecardInlineSubmission = *((_BYTE *)v5 + 26);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 2) != 0)
    goto LABEL_13;
LABEL_7:
  if ((v4 & 1) != 0)
  {
LABEL_8:
    self->_numberOfAprSuggestedPhotos = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originTarget, 0);
}

@end

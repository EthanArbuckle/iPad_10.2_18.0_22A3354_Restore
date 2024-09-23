@implementation GEOLogMsgStateARPRatingPhotoSubmission

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
  *(_BYTE *)&self->_flags |= 2u;
  self->_isFromRecommendationCard = a3;
}

- (void)setHasIsFromRecommendationCard:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsFromRecommendationCard
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)isFromMapsSuggesions
{
  return self->_isFromMapsSuggesions;
}

- (void)setIsFromMapsSuggesions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_isFromMapsSuggesions = a3;
}

- (void)setHasIsFromMapsSuggesions:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsFromMapsSuggesions
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isPlacecardInlineSubmission
{
  return self->_isPlacecardInlineSubmission;
}

- (void)setIsPlacecardInlineSubmission:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_isPlacecardInlineSubmission = a3;
}

- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsPlacecardInlineSubmission
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateARPRatingPhotoSubmission;
  -[GEOLogMsgStateARPRatingPhotoSubmission description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateARPRatingPhotoSubmission dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateARPRatingPhotoSubmission _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  unsigned __int8 v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "originTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("originTarget");
    else
      v6 = CFSTR("origin_target");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = a1[20];
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[17]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isFromRecommendationCard");
    else
      v9 = CFSTR("is_from_recommendation_card");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = a1[20];
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        return v4;
      goto LABEL_19;
    }
  }
  else if ((a1[20] & 1) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[16]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("isFromMapsSuggesions");
  else
    v11 = CFSTR("is_from_maps_suggesions");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  if ((a1[20] & 4) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[18]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("isPlacecardInlineSubmission");
    else
      v13 = CFSTR("is_placecard_inline_submission");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateARPRatingPhotoSubmission _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateARPRatingPhotoSubmission)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateARPRatingPhotoSubmission *)-[GEOLogMsgStateARPRatingPhotoSubmission _initWithDictionary:isJSON:](self, a3, 0);
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

    }
  }

  return a1;
}

- (GEOLogMsgStateARPRatingPhotoSubmission)initWithJSON:(id)a3
{
  return (GEOLogMsgStateARPRatingPhotoSubmission *)-[GEOLogMsgStateARPRatingPhotoSubmission _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateARPRatingPhotoSubmissionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateARPRatingPhotoSubmissionReadAllFrom((uint64_t)self, a3);
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
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgStateARPRatingPhotoSubmission readAll:](self, "readAll:", 0);
  if (self->_originTarget)
    objc_msgSend(v5, "setOriginTarget:");
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_9:
    v5[16] = self->_isFromMapsSuggesions;
    v5[20] |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v5[17] = self->_isFromRecommendationCard;
  v5[20] |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    v5[18] = self->_isPlacecardInlineSubmission;
    v5[20] |= 4u;
  }
LABEL_7:

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
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 16) = self->_isFromMapsSuggesions;
    *(_BYTE *)(v5 + 20) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_BYTE *)(v5 + 17) = self->_isFromRecommendationCard;
  *(_BYTE *)(v5 + 20) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 18) = self->_isPlacecardInlineSubmission;
    *(_BYTE *)(v5 + 20) |= 4u;
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
    goto LABEL_22;
  -[GEOLogMsgStateARPRatingPhotoSubmission readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  originTarget = self->_originTarget;
  if ((unint64_t)originTarget | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](originTarget, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_22;
    if (self->_isFromRecommendationCard)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
      goto LABEL_22;
    if (self->_isFromMapsSuggesions)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_22;
  }
  v6 = (*((_BYTE *)v4 + 20) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) != 0)
    {
      if (self->_isPlacecardInlineSubmission)
      {
        if (!*((_BYTE *)v4 + 18))
          goto LABEL_22;
      }
      else if (*((_BYTE *)v4 + 18))
      {
        goto LABEL_22;
      }
      v6 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v6 = 0;
  }
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLogMsgStateARPRatingPhotoSubmission readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_originTarget, "hash");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_isFromRecommendationCard;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_isFromMapsSuggesions;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_isPlacecardInlineSubmission;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 1))
    -[GEOLogMsgStateARPRatingPhotoSubmission setOriginTarget:](self, "setOriginTarget:");
  v4 = v5[20];
  if ((v4 & 2) == 0)
  {
    if (!v5[20])
      goto LABEL_5;
LABEL_9:
    self->_isFromMapsSuggesions = v5[16];
    *(_BYTE *)&self->_flags |= 1u;
    if ((v5[20] & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_isFromRecommendationCard = v5[17];
  *(_BYTE *)&self->_flags |= 2u;
  v4 = v5[20];
  if (v4)
    goto LABEL_9;
LABEL_5:
  if ((v4 & 4) != 0)
  {
LABEL_6:
    self->_isPlacecardInlineSubmission = v5[18];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originTarget, 0);
}

@end

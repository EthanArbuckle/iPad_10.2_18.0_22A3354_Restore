@implementation BMPBAskToBuyEvent

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)setEventTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventTime = a3;
}

- (void)setHasEventTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUserID
{
  return self->_userID != 0;
}

- (BOOL)hasActionUserID
{
  return self->_actionUserID != 0;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 4)
    return off_1E26482A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pending")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("declined")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("approved")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasItemTitle
{
  return self->_itemTitle != 0;
}

- (BOOL)hasItemDescription
{
  return self->_itemDescription != 0;
}

- (BOOL)hasItemLocalizedPrice
{
  return self->_itemLocalizedPrice != 0;
}

- (BOOL)hasThumbnailPath
{
  return self->_thumbnailPath != 0;
}

- (BOOL)hasAgeRating
{
  return self->_ageRating != 0;
}

- (void)setStarRating:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_starRating = a3;
}

- (void)setHasStarRating:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStarRating
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isActionUserDevice = a3;
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsActionUserDevice
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasStoreLink
{
  return self->_storeLink != 0;
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
  v8.super_class = (Class)BMPBAskToBuyEvent;
  -[BMPBAskToBuyEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBAskToBuyEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *requestID;
  void *v7;
  NSString *userID;
  NSString *actionUserID;
  uint64_t status;
  __CFString *v11;
  NSString *itemTitle;
  NSString *itemDescription;
  NSString *itemLocalizedPrice;
  NSString *thumbnailPath;
  NSString *ageRating;
  void *v17;
  NSString *productType;
  void *v19;
  NSString *storeLink;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v3, "setObject:forKey:", requestID, CFSTR("requestID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("eventTime"));

  }
  userID = self->_userID;
  if (userID)
    objc_msgSend(v5, "setObject:forKey:", userID, CFSTR("userID"));
  actionUserID = self->_actionUserID;
  if (actionUserID)
    objc_msgSend(v5, "setObject:forKey:", actionUserID, CFSTR("actionUserID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    status = self->_status;
    if (status >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E26482A8[status];
    }
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("status"));

  }
  itemTitle = self->_itemTitle;
  if (itemTitle)
    objc_msgSend(v5, "setObject:forKey:", itemTitle, CFSTR("itemTitle"));
  itemDescription = self->_itemDescription;
  if (itemDescription)
    objc_msgSend(v5, "setObject:forKey:", itemDescription, CFSTR("itemDescription"));
  itemLocalizedPrice = self->_itemLocalizedPrice;
  if (itemLocalizedPrice)
    objc_msgSend(v5, "setObject:forKey:", itemLocalizedPrice, CFSTR("itemLocalizedPrice"));
  thumbnailPath = self->_thumbnailPath;
  if (thumbnailPath)
    objc_msgSend(v5, "setObject:forKey:", thumbnailPath, CFSTR("thumbnailPath"));
  ageRating = self->_ageRating;
  if (ageRating)
    objc_msgSend(v5, "setObject:forKey:", ageRating, CFSTR("ageRating"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)&v4 = self->_starRating;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("starRating"));

  }
  productType = self->_productType;
  if (productType)
    objc_msgSend(v5, "setObject:forKey:", productType, CFSTR("productType"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActionUserDevice);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("isActionUserDevice"));

  }
  storeLink = self->_storeLink;
  if (storeLink)
    objc_msgSend(v5, "setObject:forKey:", storeLink, CFSTR("storeLink"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAskToBuyEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_userID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionUserID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_itemTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_itemDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_itemLocalizedPrice)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_thumbnailPath)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_ageRating)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_storeLink)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_eventTime;
    *((_BYTE *)v4 + 108) |= 1u;
  }
  if (self->_userID)
  {
    objc_msgSend(v5, "setUserID:");
    v4 = v5;
  }
  if (self->_actionUserID)
  {
    objc_msgSend(v5, "setActionUserID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_status;
    *((_BYTE *)v4 + 108) |= 4u;
  }
  if (self->_itemTitle)
  {
    objc_msgSend(v5, "setItemTitle:");
    v4 = v5;
  }
  if (self->_itemDescription)
  {
    objc_msgSend(v5, "setItemDescription:");
    v4 = v5;
  }
  if (self->_itemLocalizedPrice)
  {
    objc_msgSend(v5, "setItemLocalizedPrice:");
    v4 = v5;
  }
  if (self->_thumbnailPath)
  {
    objc_msgSend(v5, "setThumbnailPath:");
    v4 = v5;
  }
  if (self->_ageRating)
  {
    objc_msgSend(v5, "setAgeRating:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = LODWORD(self->_starRating);
    *((_BYTE *)v4 + 108) |= 2u;
  }
  if (self->_productType)
  {
    objc_msgSend(v5, "setProductType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 104) = self->_isActionUserDevice;
    *((_BYTE *)v4 + 108) |= 8u;
  }
  if (self->_storeLink)
  {
    objc_msgSend(v5, "setStoreLink:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_eventTime;
    *(_BYTE *)(v5 + 108) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_userID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v8;

  v10 = -[NSString copyWithZone:](self->_actionUserID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_status;
    *(_BYTE *)(v5 + 108) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_itemTitle, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_itemDescription, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSString copyWithZone:](self->_itemLocalizedPrice, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v18 = -[NSString copyWithZone:](self->_thumbnailPath, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  v20 = -[NSString copyWithZone:](self->_ageRating, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)(v5 + 72) = self->_starRating;
    *(_BYTE *)(v5 + 108) |= 2u;
  }
  v22 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v22;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 104) = self->_isActionUserDevice;
    *(_BYTE *)(v5 + 108) |= 8u;
  }
  v24 = -[NSString copyWithZone:](self->_storeLink, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestID;
  NSString *userID;
  NSString *actionUserID;
  NSString *itemTitle;
  NSString *itemDescription;
  NSString *itemLocalizedPrice;
  NSString *thumbnailPath;
  NSString *ageRating;
  char has;
  NSString *productType;
  char v15;
  NSString *storeLink;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_eventTime != *((double *)v4 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_40;
  }
  userID = self->_userID;
  if ((unint64_t)userID | *((_QWORD *)v4 + 12) && !-[NSString isEqual:](userID, "isEqual:"))
    goto LABEL_40;
  actionUserID = self->_actionUserID;
  if ((unint64_t)actionUserID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionUserID, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) == 0 || self->_status != *((_DWORD *)v4 + 19))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    goto LABEL_40;
  }
  itemTitle = self->_itemTitle;
  if ((unint64_t)itemTitle | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](itemTitle, "isEqual:"))
    goto LABEL_40;
  itemDescription = self->_itemDescription;
  if ((unint64_t)itemDescription | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](itemDescription, "isEqual:"))
      goto LABEL_40;
  }
  itemLocalizedPrice = self->_itemLocalizedPrice;
  if ((unint64_t)itemLocalizedPrice | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](itemLocalizedPrice, "isEqual:"))
      goto LABEL_40;
  }
  thumbnailPath = self->_thumbnailPath;
  if ((unint64_t)thumbnailPath | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](thumbnailPath, "isEqual:"))
      goto LABEL_40;
  }
  ageRating = self->_ageRating;
  if ((unint64_t)ageRating | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](ageRating, "isEqual:"))
      goto LABEL_40;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_starRating != *((float *)v4 + 18))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_40;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_40;
    has = (char)self->_has;
  }
  if ((has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 108) & 8) == 0)
      goto LABEL_46;
LABEL_40:
    v15 = 0;
    goto LABEL_41;
  }
  if ((*((_BYTE *)v4 + 108) & 8) == 0)
    goto LABEL_40;
  if (!self->_isActionUserDevice)
  {
    if (!*((_BYTE *)v4 + 104))
      goto LABEL_46;
    goto LABEL_40;
  }
  if (!*((_BYTE *)v4 + 104))
    goto LABEL_40;
LABEL_46:
  storeLink = self->_storeLink;
  if ((unint64_t)storeLink | *((_QWORD *)v4 + 10))
    v15 = -[NSString isEqual:](storeLink, "isEqual:");
  else
    v15 = 1;
LABEL_41:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  double eventTime;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  float starRating;
  float v16;
  float v17;
  float v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;

  v25 = -[NSString hash](self->_requestID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventTime = self->_eventTime;
    v5 = -eventTime;
    if (eventTime >= 0.0)
      v5 = self->_eventTime;
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
  v24 = -[NSString hash](self->_userID, "hash");
  v23 = -[NSString hash](self->_actionUserID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = -[NSString hash](self->_itemTitle, "hash", 2654435761 * self->_status);
  else
    v8 = -[NSString hash](self->_itemTitle, "hash", 0);
  v9 = v8;
  v10 = -[NSString hash](self->_itemDescription, "hash");
  v11 = -[NSString hash](self->_itemLocalizedPrice, "hash");
  v12 = -[NSString hash](self->_thumbnailPath, "hash");
  v13 = -[NSString hash](self->_ageRating, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    starRating = self->_starRating;
    v16 = -starRating;
    if (starRating >= 0.0)
      v16 = self->_starRating;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v19 = -[NSString hash](self->_productType, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v20 = 2654435761 * self->_isActionUserDevice;
  else
    v20 = 0;
  return v3 ^ v25 ^ v24 ^ v23 ^ v22 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v19 ^ v20 ^ -[NSString hash](self->_storeLink, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[BMPBAskToBuyEvent setRequestID:](self, "setRequestID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    self->_eventTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[BMPBAskToBuyEvent setUserID:](self, "setUserID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBAskToBuyEvent setActionUserID:](self, "setActionUserID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    self->_status = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBAskToBuyEvent setItemTitle:](self, "setItemTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBAskToBuyEvent setItemDescription:](self, "setItemDescription:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBAskToBuyEvent setItemLocalizedPrice:](self, "setItemLocalizedPrice:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[BMPBAskToBuyEvent setThumbnailPath:](self, "setThumbnailPath:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBAskToBuyEvent setAgeRating:](self, "setAgeRating:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    self->_starRating = *((float *)v4 + 18);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBAskToBuyEvent setProductType:](self, "setProductType:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    self->_isActionUserDevice = *((_BYTE *)v4 + 104);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[BMPBAskToBuyEvent setStoreLink:](self, "setStoreLink:");
    v4 = v5;
  }

}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (double)eventTime
{
  return self->_eventTime;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (NSString)actionUserID
{
  return self->_actionUserID;
}

- (void)setActionUserID:(id)a3
{
  objc_storeStrong((id *)&self->_actionUserID, a3);
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_itemTitle, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (NSString)itemLocalizedPrice
{
  return self->_itemLocalizedPrice;
}

- (void)setItemLocalizedPrice:(id)a3
{
  objc_storeStrong((id *)&self->_itemLocalizedPrice, a3);
}

- (NSString)thumbnailPath
{
  return self->_thumbnailPath;
}

- (void)setThumbnailPath:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailPath, a3);
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (void)setAgeRating:(id)a3
{
  objc_storeStrong((id *)&self->_ageRating, a3);
}

- (float)starRating
{
  return self->_starRating;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (NSString)storeLink
{
  return self->_storeLink;
}

- (void)setStoreLink:(id)a3
{
  objc_storeStrong((id *)&self->_storeLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_thumbnailPath, 0);
  objc_storeStrong((id *)&self->_storeLink, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_itemLocalizedPrice, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_actionUserID, 0);
}

@end

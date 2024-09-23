@implementation NTPBSearchViewExposure

- (int)areaPresentationReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_areaPresentationReason;
  else
    return 0;
}

- (void)setAreaPresentationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_areaPresentationReason = a3;
}

- (void)setHasAreaPresentationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAreaPresentationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)areaPresentationReasonAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4E630[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAreaPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FOR_YOU_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FAVORITES_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_FAVORITES_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_EXPLORE_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_EDITORS_PICKS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_RECOMMENDED_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_EXPLORE_BROWSE_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_CHANNELS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_TOPICS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_CHANNELS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_TOPICS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SEARCH_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_SEARCH_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SEARCH_RESULTS_LIST_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SAVED_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SAVED_HISTORY_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_DISCOVER_MORE_BUTTON_TAP_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_DISCOVER_MORE_BACK_TAP_AREA_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_ARTICLE_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_TOC_AREA_VIEW_PRESENTATION_REASON")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (BOOL)hasCampaignType
{
  return self->_campaignType != 0;
}

- (BOOL)hasCreativeId
{
  return self->_creativeId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBSearchViewExposure;
  -[NTPBSearchViewExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBSearchViewExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t areaPresentationReason;
  __CFString *v5;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    areaPresentationReason = self->_areaPresentationReason;
    if (areaPresentationReason >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_areaPresentationReason);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD4E630[areaPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("area_presentation_reason"));

  }
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSearchViewExposureReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_campaignId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_campaignType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_creativeId)
  {
    PBDataWriterWriteStringField();
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
    *(_DWORD *)(v5 + 8) = self->_areaPresentationReason;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_areaPresentationReason != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_13;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_13;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](creativeId, "isEqual:");
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
    v3 = 2654435761 * self->_areaPresentationReason;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_campaignId, "hash") ^ v3;
  v5 = -[NSString hash](self->_campaignType, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_creativeId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_areaPresentationReason = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBSearchViewExposure setCampaignId:](self, "setCampaignId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBSearchViewExposure setCampaignType:](self, "setCampaignType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBSearchViewExposure setCreativeId:](self, "setCreativeId:");
    v4 = v5;
  }

}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_campaignId, a3);
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
  objc_storeStrong((id *)&self->_campaignType, a3);
}

- (NSString)creativeId
{
  return self->_creativeId;
}

- (void)setCreativeId:(id)a3
{
  objc_storeStrong((id *)&self->_creativeId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end

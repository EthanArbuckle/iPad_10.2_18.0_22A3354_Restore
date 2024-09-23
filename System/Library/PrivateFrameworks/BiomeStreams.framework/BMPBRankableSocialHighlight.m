@implementation BMPBRankableSocialHighlight

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0;
}

- (int)highlightType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_highlightType;
  else
    return 0;
}

- (void)setHighlightType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_highlightType = a3;
}

- (void)setHasHighlightType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHighlightType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)highlightTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E26478E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHighlightType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Starred")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSyndicationSecondsSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_syndicationSecondsSinceReferenceDate = a3;
}

- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSyndicationSecondsSinceReferenceDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (void)clearApplicationIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_applicationIdentifiers, "removeAllObjects");
}

- (void)addApplicationIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *applicationIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  applicationIdentifiers = self->_applicationIdentifiers;
  v8 = v4;
  if (!applicationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_applicationIdentifiers;
    self->_applicationIdentifiers = v6;

    v4 = v8;
    applicationIdentifiers = self->_applicationIdentifiers;
  }
  -[NSMutableArray addObject:](applicationIdentifiers, "addObject:", v4);

}

- (unint64_t)applicationIdentifiersCount
{
  return -[NSMutableArray count](self->_applicationIdentifiers, "count");
}

- (id)applicationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_applicationIdentifiers, "objectAtIndex:", a3);
}

+ (Class)applicationIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasResourceUrl
{
  return self->_resourceUrl != 0;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (BOOL)hasDomainIdentifier
{
  return self->_domainIdentifier != 0;
}

- (BOOL)hasBatchIdentifier
{
  return self->_batchIdentifier != 0;
}

- (void)clearCalculatedFeatures
{
  -[NSMutableArray removeAllObjects](self->_calculatedFeatures, "removeAllObjects");
}

- (void)addCalculatedFeatures:(id)a3
{
  id v4;
  NSMutableArray *calculatedFeatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  calculatedFeatures = self->_calculatedFeatures;
  v8 = v4;
  if (!calculatedFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_calculatedFeatures;
    self->_calculatedFeatures = v6;

    v4 = v8;
    calculatedFeatures = self->_calculatedFeatures;
  }
  -[NSMutableArray addObject:](calculatedFeatures, "addObject:", v4);

}

- (unint64_t)calculatedFeaturesCount
{
  return -[NSMutableArray count](self->_calculatedFeatures, "count");
}

- (id)calculatedFeaturesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_calculatedFeatures, "objectAtIndex:", a3);
}

+ (Class)calculatedFeaturesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (void)setContentCreationSecondsSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentCreationSecondsSinceReferenceDate = a3;
}

- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentCreationSecondsSinceReferenceDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasGroupPhotoPathDigest
{
  return self->_groupPhotoPathDigest != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setIsPrimary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isPrimary = a3;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsPrimary
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasAttributionIdentifier
{
  return self->_attributionIdentifier != 0;
}

- (void)setRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRank
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsConversationAutoDonating:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isConversationAutoDonating = a3;
}

- (void)setHasIsConversationAutoDonating:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsConversationAutoDonating
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasOriginatingDeviceId
{
  return self->_originatingDeviceId != 0;
}

- (void)setRankingSecondsSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rankingSecondsSinceReferenceDate = a3;
}

- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRankingSecondsSinceReferenceDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasResolvedUrl
{
  return self->_resolvedUrl != 0;
}

- (BOOL)hasClientVariant
{
  return self->_clientVariant != 0;
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
  v8.super_class = (Class)BMPBRankableSocialHighlight;
  -[BMPBRankableSocialHighlight description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBRankableSocialHighlight dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *highlightIdentifier;
  char has;
  uint64_t highlightType;
  __CFString *v8;
  void *v9;
  NSString *sourceBundleId;
  NSMutableArray *applicationIdentifiers;
  NSString *resourceUrl;
  BMPBSocialHighlightContact *sender;
  void *v14;
  NSString *domainIdentifier;
  NSString *batchIdentifier;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSString *clientIdentifier;
  void *v25;
  NSString *groupPhotoPathDigest;
  NSString *displayName;
  void *v28;
  NSString *attributionIdentifier;
  char v30;
  void *v31;
  NSString *originatingDeviceId;
  void *v33;
  NSString *resolvedUrl;
  NSString *clientVariant;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier)
    objc_msgSend(v3, "setObject:forKey:", highlightIdentifier, CFSTR("highlightIdentifier"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    highlightType = self->_highlightType;
    if (highlightType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_highlightType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E26478E8[highlightType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("highlightType"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_syndicationSecondsSinceReferenceDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("syndicationSecondsSinceReferenceDate"));

  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId)
    objc_msgSend(v4, "setObject:forKey:", sourceBundleId, CFSTR("sourceBundleId"));
  applicationIdentifiers = self->_applicationIdentifiers;
  if (applicationIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", applicationIdentifiers, CFSTR("applicationIdentifiers"));
  resourceUrl = self->_resourceUrl;
  if (resourceUrl)
    objc_msgSend(v4, "setObject:forKey:", resourceUrl, CFSTR("resourceUrl"));
  sender = self->_sender;
  if (sender)
  {
    -[BMPBSocialHighlightContact dictionaryRepresentation](sender, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("sender"));

  }
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier)
    objc_msgSend(v4, "setObject:forKey:", domainIdentifier, CFSTR("domainIdentifier"));
  batchIdentifier = self->_batchIdentifier;
  if (batchIdentifier)
    objc_msgSend(v4, "setObject:forKey:", batchIdentifier, CFSTR("batchIdentifier"));
  if (-[NSMutableArray count](self->_calculatedFeatures, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_calculatedFeatures, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v18 = self->_calculatedFeatures;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("calculatedFeatures"));
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v4, "setObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contentCreationSecondsSinceReferenceDate);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("contentCreationSecondsSinceReferenceDate"));

  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if (groupPhotoPathDigest)
    objc_msgSend(v4, "setObject:forKey:", groupPhotoPathDigest, CFSTR("groupPhotoPathDigest"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPrimary);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("isPrimary"));

  }
  attributionIdentifier = self->_attributionIdentifier;
  if (attributionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", attributionIdentifier, CFSTR("attributionIdentifier"));
  v30 = (char)self->_has;
  if ((v30 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rank);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("rank"));

    v30 = (char)self->_has;
    if ((v30 & 4) == 0)
    {
LABEL_45:
      if ((v30 & 0x40) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("score"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isConversationAutoDonating);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("isConversationAutoDonating"));

  }
LABEL_47:
  originatingDeviceId = self->_originatingDeviceId;
  if (originatingDeviceId)
    objc_msgSend(v4, "setObject:forKey:", originatingDeviceId, CFSTR("originatingDeviceId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rankingSecondsSinceReferenceDate);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("rankingSecondsSinceReferenceDate"));

  }
  resolvedUrl = self->_resolvedUrl;
  if (resolvedUrl)
    objc_msgSend(v4, "setObject:forKey:", resolvedUrl, CFSTR("resolvedUrl"));
  clientVariant = self->_clientVariant;
  if (clientVariant)
    objc_msgSend(v4, "setObject:forKey:", clientVariant, CFSTR("clientVariant"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBRankableSocialHighlightReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_highlightIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_sourceBundleId)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_applicationIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  if (self->_resourceUrl)
    PBDataWriterWriteStringField();
  if (self->_sender)
    PBDataWriterWriteSubmessage();
  if (self->_domainIdentifier)
    PBDataWriterWriteStringField();
  if (self->_batchIdentifier)
    PBDataWriterWriteStringField();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_calculatedFeatures;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_groupPhotoPathDigest)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_attributionIdentifier)
    PBDataWriterWriteStringField();
  v16 = (char)self->_has;
  if ((v16 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v16 = (char)self->_has;
    if ((v16 & 4) == 0)
    {
LABEL_45:
      if ((v16 & 0x40) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_46:
    PBDataWriterWriteBOOLField();
LABEL_47:
  if (self->_originatingDeviceId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_resolvedUrl)
    PBDataWriterWriteStringField();
  if (self->_clientVariant)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  _BYTE *v14;
  char v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (self->_highlightIdentifier)
  {
    objc_msgSend(v4, "setHighlightIdentifier:");
    v4 = v16;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_highlightType;
    *((_BYTE *)v4 + 180) |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_syndicationSecondsSinceReferenceDate;
    *((_BYTE *)v4 + 180) |= 8u;
  }
  if (self->_sourceBundleId)
    objc_msgSend(v16, "setSourceBundleId:");
  if (-[BMPBRankableSocialHighlight applicationIdentifiersCount](self, "applicationIdentifiersCount"))
  {
    objc_msgSend(v16, "clearApplicationIdentifiers");
    v6 = -[BMPBRankableSocialHighlight applicationIdentifiersCount](self, "applicationIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[BMPBRankableSocialHighlight applicationIdentifiersAtIndex:](self, "applicationIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addApplicationIdentifiers:", v9);

      }
    }
  }
  if (self->_resourceUrl)
    objc_msgSend(v16, "setResourceUrl:");
  if (self->_sender)
    objc_msgSend(v16, "setSender:");
  if (self->_domainIdentifier)
    objc_msgSend(v16, "setDomainIdentifier:");
  if (self->_batchIdentifier)
    objc_msgSend(v16, "setBatchIdentifier:");
  if (-[BMPBRankableSocialHighlight calculatedFeaturesCount](self, "calculatedFeaturesCount"))
  {
    objc_msgSend(v16, "clearCalculatedFeatures");
    v10 = -[BMPBRankableSocialHighlight calculatedFeaturesCount](self, "calculatedFeaturesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[BMPBRankableSocialHighlight calculatedFeaturesAtIndex:](self, "calculatedFeaturesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addCalculatedFeatures:", v13);

      }
    }
  }
  if (self->_clientIdentifier)
    objc_msgSend(v16, "setClientIdentifier:");
  v14 = v16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v16 + 1) = *(_QWORD *)&self->_contentCreationSecondsSinceReferenceDate;
    *((_BYTE *)v16 + 180) |= 1u;
  }
  if (self->_groupPhotoPathDigest)
  {
    objc_msgSend(v16, "setGroupPhotoPathDigest:");
    v14 = v16;
  }
  if (self->_displayName)
  {
    objc_msgSend(v16, "setDisplayName:");
    v14 = v16;
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v14[177] = self->_isPrimary;
    v14[180] |= 0x80u;
  }
  if (self->_attributionIdentifier)
  {
    objc_msgSend(v16, "setAttributionIdentifier:");
    v14 = v16;
  }
  v15 = (char)self->_has;
  if ((v15 & 0x20) != 0)
  {
    *((_DWORD *)v14 + 34) = self->_rank;
    v14[180] |= 0x20u;
    v15 = (char)self->_has;
    if ((v15 & 4) == 0)
    {
LABEL_39:
      if ((v15 & 0x40) == 0)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_39;
  }
  *((_QWORD *)v14 + 3) = *(_QWORD *)&self->_score;
  v14[180] |= 4u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_40:
    v14[176] = self->_isConversationAutoDonating;
    v14[180] |= 0x40u;
  }
LABEL_41:
  if (self->_originatingDeviceId)
  {
    objc_msgSend(v16, "setOriginatingDeviceId:");
    v14 = v16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v14 + 2) = *(_QWORD *)&self->_rankingSecondsSinceReferenceDate;
    v14[180] |= 2u;
  }
  if (self->_resolvedUrl)
  {
    objc_msgSend(v16, "setResolvedUrl:");
    v14 = v16;
  }
  if (self->_clientVariant)
  {
    objc_msgSend(v16, "setClientVariant:");
    v14 = v16;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_highlightIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_highlightType;
    *(_BYTE *)(v5 + 180) |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_syndicationSecondsSinceReferenceDate;
    *(_BYTE *)(v5 + 180) |= 8u;
  }
  v9 = -[NSString copyWithZone:](self->_sourceBundleId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v9;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v11 = self->_applicationIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addApplicationIdentifiers:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v13);
  }

  v17 = -[NSString copyWithZone:](self->_resourceUrl, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v17;

  v19 = -[BMPBSocialHighlightContact copyWithZone:](self->_sender, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v19;

  v21 = -[NSString copyWithZone:](self->_domainIdentifier, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v21;

  v23 = -[NSString copyWithZone:](self->_batchIdentifier, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v23;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = self->_calculatedFeatures;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v48 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v47);
        objc_msgSend((id)v5, "addCalculatedFeatures:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v27);
  }

  v31 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v31;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_contentCreationSecondsSinceReferenceDate;
    *(_BYTE *)(v5 + 180) |= 1u;
  }
  v33 = -[NSString copyWithZone:](self->_groupPhotoPathDigest, "copyWithZone:", a3, (_QWORD)v47);
  v34 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v33;

  v35 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v35;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 177) = self->_isPrimary;
    *(_BYTE *)(v5 + 180) |= 0x80u;
  }
  v37 = -[NSString copyWithZone:](self->_attributionIdentifier, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v37;

  v39 = (char)self->_has;
  if ((v39 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_rank;
    *(_BYTE *)(v5 + 180) |= 0x20u;
    v39 = (char)self->_has;
    if ((v39 & 4) == 0)
    {
LABEL_25:
      if ((v39 & 0x40) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  *(double *)(v5 + 24) = self->_score;
  *(_BYTE *)(v5 + 180) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_26:
    *(_BYTE *)(v5 + 176) = self->_isConversationAutoDonating;
    *(_BYTE *)(v5 + 180) |= 0x40u;
  }
LABEL_27:
  v40 = -[NSString copyWithZone:](self->_originatingDeviceId, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v40;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_rankingSecondsSinceReferenceDate;
    *(_BYTE *)(v5 + 180) |= 2u;
  }
  v42 = -[NSString copyWithZone:](self->_resolvedUrl, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v42;

  v44 = -[NSString copyWithZone:](self->_clientVariant, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v44;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *highlightIdentifier;
  NSString *sourceBundleId;
  NSMutableArray *applicationIdentifiers;
  NSString *resourceUrl;
  BMPBSocialHighlightContact *sender;
  NSString *domainIdentifier;
  NSString *batchIdentifier;
  NSMutableArray *calculatedFeatures;
  NSString *clientIdentifier;
  NSString *groupPhotoPathDigest;
  NSString *displayName;
  $AAE2D17D8970CA381A5BFA23BDD4BC33 has;
  int v17;
  NSString *attributionIdentifier;
  NSString *originatingDeviceId;
  NSString *resolvedUrl;
  NSString *clientVariant;
  char v22;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  highlightIdentifier = self->_highlightIdentifier;
  if ((unint64_t)highlightIdentifier | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](highlightIdentifier, "isEqual:"))
      goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[180] & 0x10) == 0 || self->_highlightType != *((_DWORD *)v4 + 30))
      goto LABEL_81;
  }
  else if ((v4[180] & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[180] & 8) == 0 || self->_syndicationSecondsSinceReferenceDate != *((double *)v4 + 4))
      goto LABEL_81;
  }
  else if ((v4[180] & 8) != 0)
  {
    goto LABEL_81;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_81;
  }
  applicationIdentifiers = self->_applicationIdentifiers;
  if ((unint64_t)applicationIdentifiers | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](applicationIdentifiers, "isEqual:"))
      goto LABEL_81;
  }
  resourceUrl = self->_resourceUrl;
  if ((unint64_t)resourceUrl | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](resourceUrl, "isEqual:"))
      goto LABEL_81;
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((_QWORD *)v4 + 20))
  {
    if (!-[BMPBSocialHighlightContact isEqual:](sender, "isEqual:"))
      goto LABEL_81;
  }
  domainIdentifier = self->_domainIdentifier;
  if ((unint64_t)domainIdentifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](domainIdentifier, "isEqual:"))
      goto LABEL_81;
  }
  batchIdentifier = self->_batchIdentifier;
  if ((unint64_t)batchIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](batchIdentifier, "isEqual:"))
      goto LABEL_81;
  }
  calculatedFeatures = self->_calculatedFeatures;
  if ((unint64_t)calculatedFeatures | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](calculatedFeatures, "isEqual:"))
      goto LABEL_81;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:"))
      goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[180] & 1) == 0 || self->_contentCreationSecondsSinceReferenceDate != *((double *)v4 + 1))
      goto LABEL_81;
  }
  else if ((v4[180] & 1) != 0)
  {
    goto LABEL_81;
  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if ((unint64_t)groupPhotoPathDigest | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](groupPhotoPathDigest, "isEqual:"))
  {
    goto LABEL_81;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_81;
  }
  has = self->_has;
  v17 = v4[180];
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v17 & 0x80000000) == 0)
      goto LABEL_81;
    if (self->_isPrimary)
    {
      if (!v4[177])
        goto LABEL_81;
    }
    else if (v4[177])
    {
      goto LABEL_81;
    }
  }
  else if (v17 < 0)
  {
    goto LABEL_81;
  }
  attributionIdentifier = self->_attributionIdentifier;
  if ((unint64_t)attributionIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](attributionIdentifier, "isEqual:"))
      goto LABEL_81;
    *(_BYTE *)&has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v4[180] & 0x20) == 0 || self->_rank != *((_DWORD *)v4 + 34))
      goto LABEL_81;
  }
  else if ((v4[180] & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v4[180] & 4) == 0 || self->_score != *((double *)v4 + 3))
      goto LABEL_81;
  }
  else if ((v4[180] & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v4[180] & 0x40) == 0)
      goto LABEL_81;
    if (self->_isConversationAutoDonating)
    {
      if (!v4[176])
        goto LABEL_81;
    }
    else if (v4[176])
    {
      goto LABEL_81;
    }
  }
  else if ((v4[180] & 0x40) != 0)
  {
    goto LABEL_81;
  }
  originatingDeviceId = self->_originatingDeviceId;
  if (!((unint64_t)originatingDeviceId | *((_QWORD *)v4 + 16)))
    goto LABEL_72;
  if (!-[NSString isEqual:](originatingDeviceId, "isEqual:"))
  {
LABEL_81:
    v22 = 0;
    goto LABEL_82;
  }
  *(_BYTE *)&has = self->_has;
LABEL_72:
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v4[180] & 2) == 0 || self->_rankingSecondsSinceReferenceDate != *((double *)v4 + 2))
      goto LABEL_81;
  }
  else if ((v4[180] & 2) != 0)
  {
    goto LABEL_81;
  }
  resolvedUrl = self->_resolvedUrl;
  if ((unint64_t)resolvedUrl | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](resolvedUrl, "isEqual:"))
  {
    goto LABEL_81;
  }
  clientVariant = self->_clientVariant;
  if ((unint64_t)clientVariant | *((_QWORD *)v4 + 10))
    v22 = -[NSString isEqual:](clientVariant, "isEqual:");
  else
    v22 = 1;
LABEL_82:

  return v22;
}

- (unint64_t)hash
{
  double syndicationSecondsSinceReferenceDate;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double contentCreationSecondsSinceReferenceDate;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  NSUInteger v17;
  char has;
  uint64_t v19;
  double score;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  unint64_t v27;
  double rankingSecondsSinceReferenceDate;
  double v29;
  long double v30;
  double v31;
  NSUInteger v32;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
  NSUInteger v38;
  NSUInteger v39;
  unint64_t v40;
  NSUInteger v41;
  uint64_t v42;
  NSUInteger v43;
  unint64_t v44;
  uint64_t v45;
  NSUInteger v46;

  v46 = -[NSString hash](self->_highlightIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v45 = 2654435761 * self->_highlightType;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_11:
    v44 = 0;
    goto LABEL_12;
  }
  v45 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_3:
  syndicationSecondsSinceReferenceDate = self->_syndicationSecondsSinceReferenceDate;
  v4 = -syndicationSecondsSinceReferenceDate;
  if (syndicationSecondsSinceReferenceDate >= 0.0)
    v4 = self->_syndicationSecondsSinceReferenceDate;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0)
    v10 = v9;
  v44 = v10;
LABEL_12:
  v43 = -[NSString hash](self->_sourceBundleId, "hash");
  v42 = -[NSMutableArray hash](self->_applicationIdentifiers, "hash");
  v41 = -[NSString hash](self->_resourceUrl, "hash");
  v40 = -[BMPBSocialHighlightContact hash](self->_sender, "hash");
  v39 = -[NSString hash](self->_domainIdentifier, "hash");
  v38 = -[NSString hash](self->_batchIdentifier, "hash");
  v37 = -[NSMutableArray hash](self->_calculatedFeatures, "hash");
  v36 = -[NSString hash](self->_clientIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    contentCreationSecondsSinceReferenceDate = self->_contentCreationSecondsSinceReferenceDate;
    v13 = -contentCreationSecondsSinceReferenceDate;
    if (contentCreationSecondsSinceReferenceDate >= 0.0)
      v13 = self->_contentCreationSecondsSinceReferenceDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  v35 = -[NSString hash](self->_groupPhotoPathDigest, "hash");
  v34 = -[NSString hash](self->_displayName, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v16 = 2654435761 * self->_isPrimary;
  else
    v16 = 0;
  v17 = -[NSString hash](self->_attributionIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v19 = 2654435761 * self->_rank;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_25;
LABEL_30:
    v24 = 0;
    goto LABEL_33;
  }
  v19 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_30;
LABEL_25:
  score = self->_score;
  v21 = -score;
  if (score >= 0.0)
    v21 = self->_score;
  v22 = floor(v21 + 0.5);
  v23 = (v21 - v22) * 1.84467441e19;
  v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_33:
  if ((has & 0x40) != 0)
    v25 = 2654435761 * self->_isConversationAutoDonating;
  else
    v25 = 0;
  v26 = -[NSString hash](self->_originatingDeviceId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    rankingSecondsSinceReferenceDate = self->_rankingSecondsSinceReferenceDate;
    v29 = -rankingSecondsSinceReferenceDate;
    if (rankingSecondsSinceReferenceDate >= 0.0)
      v29 = self->_rankingSecondsSinceReferenceDate;
    v30 = floor(v29 + 0.5);
    v31 = (v29 - v30) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0)
        v27 += (unint64_t)v31;
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    v27 = 0;
  }
  v32 = v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ -[NSString hash](self->_resolvedUrl, "hash");
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v11 ^ v35 ^ v34 ^ v16 ^ v17 ^ v32 ^ -[NSString hash](self->_clientVariant, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BMPBSocialHighlightContact *sender;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 14))
    -[BMPBRankableSocialHighlight setHighlightIdentifier:](self, "setHighlightIdentifier:");
  v5 = v4[180];
  if ((v5 & 0x10) != 0)
  {
    self->_highlightType = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = v4[180];
  }
  if ((v5 & 8) != 0)
  {
    self->_syndicationSecondsSinceReferenceDate = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 21))
    -[BMPBRankableSocialHighlight setSourceBundleId:](self, "setSourceBundleId:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = *((id *)v4 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        -[BMPBRankableSocialHighlight addApplicationIdentifiers:](self, "addApplicationIdentifiers:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 19))
    -[BMPBRankableSocialHighlight setResourceUrl:](self, "setResourceUrl:");
  sender = self->_sender;
  v12 = *((_QWORD *)v4 + 20);
  if (sender)
  {
    if (v12)
      -[BMPBSocialHighlightContact mergeFrom:](sender, "mergeFrom:");
  }
  else if (v12)
  {
    -[BMPBRankableSocialHighlight setSender:](self, "setSender:");
  }
  if (*((_QWORD *)v4 + 12))
    -[BMPBRankableSocialHighlight setDomainIdentifier:](self, "setDomainIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[BMPBRankableSocialHighlight setBatchIdentifier:](self, "setBatchIdentifier:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = *((id *)v4 + 8);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[BMPBRankableSocialHighlight addCalculatedFeatures:](self, "addCalculatedFeatures:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 9))
    -[BMPBRankableSocialHighlight setClientIdentifier:](self, "setClientIdentifier:");
  if ((v4[180] & 1) != 0)
  {
    self->_contentCreationSecondsSinceReferenceDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 13))
    -[BMPBRankableSocialHighlight setGroupPhotoPathDigest:](self, "setGroupPhotoPathDigest:");
  if (*((_QWORD *)v4 + 11))
    -[BMPBRankableSocialHighlight setDisplayName:](self, "setDisplayName:");
  if (v4[180] < 0)
  {
    self->_isPrimary = v4[177];
    *(_BYTE *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 6))
    -[BMPBRankableSocialHighlight setAttributionIdentifier:](self, "setAttributionIdentifier:");
  v18 = v4[180];
  if ((v18 & 0x20) != 0)
  {
    self->_rank = *((_DWORD *)v4 + 34);
    *(_BYTE *)&self->_has |= 0x20u;
    v18 = v4[180];
    if ((v18 & 4) == 0)
    {
LABEL_48:
      if ((v18 & 0x40) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if ((v4[180] & 4) == 0)
  {
    goto LABEL_48;
  }
  self->_score = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((v4[180] & 0x40) != 0)
  {
LABEL_49:
    self->_isConversationAutoDonating = v4[176];
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_50:
  if (*((_QWORD *)v4 + 16))
    -[BMPBRankableSocialHighlight setOriginatingDeviceId:](self, "setOriginatingDeviceId:");
  if ((v4[180] & 2) != 0)
  {
    self->_rankingSecondsSinceReferenceDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 18))
    -[BMPBRankableSocialHighlight setResolvedUrl:](self, "setResolvedUrl:");
  if (*((_QWORD *)v4 + 10))
    -[BMPBRankableSocialHighlight setClientVariant:](self, "setClientVariant:");

}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)setHighlightIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_highlightIdentifier, a3);
}

- (double)syndicationSecondsSinceReferenceDate
{
  return self->_syndicationSecondsSinceReferenceDate;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleId, a3);
}

- (NSMutableArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setApplicationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifiers, a3);
}

- (NSString)resourceUrl
{
  return self->_resourceUrl;
}

- (void)setResourceUrl:(id)a3
{
  objc_storeStrong((id *)&self->_resourceUrl, a3);
}

- (BMPBSocialHighlightContact)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_domainIdentifier, a3);
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (void)setBatchIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_batchIdentifier, a3);
}

- (NSMutableArray)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (void)setCalculatedFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_calculatedFeatures, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (double)contentCreationSecondsSinceReferenceDate
{
  return self->_contentCreationSecondsSinceReferenceDate;
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (void)setGroupPhotoPathDigest:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (void)setAttributionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_attributionIdentifier, a3);
}

- (unsigned)rank
{
  return self->_rank;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (void)setOriginatingDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_originatingDeviceId, a3);
}

- (double)rankingSecondsSinceReferenceDate
{
  return self->_rankingSecondsSinceReferenceDate;
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (void)setResolvedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedUrl, a3);
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void)setClientVariant:(id)a3
{
  objc_storeStrong((id *)&self->_clientVariant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceUrl, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
}

@end

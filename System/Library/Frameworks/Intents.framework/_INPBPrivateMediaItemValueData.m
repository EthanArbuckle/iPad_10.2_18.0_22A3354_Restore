@implementation _INPBPrivateMediaItemValueData

- (void)setAmpConfidenceLevel:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_ampConfidenceLevel = a3;
  }
}

- (BOOL)hasAmpConfidenceLevel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAmpConfidenceLevel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)ampConfidenceLevelAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 19)
  {
    if (a3 == 20)
      return CFSTR("MEDIUM");
    if (a3 == 30)
      return CFSTR("HIGH");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("UNKNOWN_CONFIDENCE_LEVEL");
  if (a3 != 10)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("LOW");
  return v3;
}

- (int)StringAsAmpConfidenceLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONFIDENCE_LEVEL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIUM")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH")))
  {
    v4 = 30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAmpConfidenceScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ampConfidenceScore = a3;
}

- (BOOL)hasAmpConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAmpConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setAssetInfo:(id)a3
{
  NSString *v4;
  NSString *assetInfo;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  assetInfo = self->_assetInfo;
  self->_assetInfo = v4;

}

- (BOOL)hasAssetInfo
{
  return self->_assetInfo != 0;
}

- (void)setBundleId:(id)a3
{
  NSString *v4;
  NSString *bundleId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleId = self->_bundleId;
  self->_bundleId = v4;

}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setInternalSignals:(id)a3
{
  NSArray *v4;
  NSArray *internalSignals;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  internalSignals = self->_internalSignals;
  self->_internalSignals = v4;

}

- (void)clearInternalSignals
{
  -[NSArray removeAllObjects](self->_internalSignals, "removeAllObjects");
}

- (void)addInternalSignal:(id)a3
{
  id v4;
  NSArray *internalSignals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  internalSignals = self->_internalSignals;
  v8 = v4;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_internalSignals;
    self->_internalSignals = v6;

    v4 = v8;
    internalSignals = self->_internalSignals;
  }
  -[NSArray addObject:](internalSignals, "addObject:", v4);

}

- (unint64_t)internalSignalsCount
{
  return -[NSArray count](self->_internalSignals, "count");
}

- (id)internalSignalAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_internalSignals, "objectAtIndexedSubscript:", a3);
}

- (void)setIsAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAvailable = a3;
}

- (BOOL)hasIsAvailable
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsAvailable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setIsHardBan:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isHardBan = a3;
}

- (BOOL)hasIsHardBan
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsHardBan:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setMediaSubItems:(id)a3
{
  NSArray *v4;
  NSArray *mediaSubItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  mediaSubItems = self->_mediaSubItems;
  self->_mediaSubItems = v4;

}

- (void)clearMediaSubItems
{
  -[NSArray removeAllObjects](self->_mediaSubItems, "removeAllObjects");
}

- (void)addMediaSubItems:(id)a3
{
  id v4;
  NSArray *mediaSubItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  mediaSubItems = self->_mediaSubItems;
  v8 = v4;
  if (!mediaSubItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mediaSubItems;
    self->_mediaSubItems = v6;

    v4 = v8;
    mediaSubItems = self->_mediaSubItems;
  }
  -[NSArray addObject:](mediaSubItems, "addObject:", v4);

}

- (unint64_t)mediaSubItemsCount
{
  return -[NSArray count](self->_mediaSubItems, "count");
}

- (id)mediaSubItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_mediaSubItems, "objectAtIndexedSubscript:", a3);
}

- (void)setPegasusMetaData:(id)a3
{
  NSData *v4;
  NSData *pegasusMetaData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  pegasusMetaData = self->_pegasusMetaData;
  self->_pegasusMetaData = v4;

}

- (BOOL)hasPegasusMetaData
{
  return self->_pegasusMetaData != 0;
}

- (void)setProvider:(id)a3
{
  NSString *v4;
  NSString *provider;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  provider = self->_provider;
  self->_provider = v4;

}

- (BOOL)hasProvider
{
  return self->_provider != 0;
}

- (void)setProviderAppName:(id)a3
{
  NSString *v4;
  NSString *providerAppName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  providerAppName = self->_providerAppName;
  self->_providerAppName = v4;

}

- (BOOL)hasProviderAppName
{
  return self->_providerAppName != 0;
}

- (void)setPunchoutURI:(id)a3
{
  NSString *v4;
  NSString *punchoutURI;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutURI = self->_punchoutURI;
  self->_punchoutURI = v4;

}

- (BOOL)hasPunchoutURI
{
  return self->_punchoutURI != 0;
}

- (void)setRecommendationId:(id)a3
{
  NSString *v4;
  NSString *recommendationId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  recommendationId = self->_recommendationId;
  self->_recommendationId = v4;

}

- (BOOL)hasRecommendationId
{
  return self->_recommendationId != 0;
}

- (void)setRequiresSubscription:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_requiresSubscription = a3;
}

- (BOOL)hasRequiresSubscription
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasRequiresSubscription:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)setSharedUserIdFromPlayableMusicAccount:(id)a3
{
  NSString *v4;
  NSString *sharedUserIdFromPlayableMusicAccount;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sharedUserIdFromPlayableMusicAccount = self->_sharedUserIdFromPlayableMusicAccount;
  self->_sharedUserIdFromPlayableMusicAccount = v4;

}

- (BOOL)hasSharedUserIdFromPlayableMusicAccount
{
  return self->_sharedUserIdFromPlayableMusicAccount != 0;
}

- (void)setUniversalResourceLink:(id)a3
{
  NSString *v4;
  NSString *universalResourceLink;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  universalResourceLink = self->_universalResourceLink;
  self->_universalResourceLink = v4;

}

- (BOOL)hasUniversalResourceLink
{
  return self->_universalResourceLink != 0;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _INPBPrivateMediaItemValueDataReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceLevel](self, "hasAmpConfidenceLevel"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceScore](self, "hasAmpConfidenceScore"))
    PBDataWriterWriteFloatField();
  -[_INPBPrivateMediaItemValueData assetInfo](self, "assetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBPrivateMediaItemValueData bundleId](self, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = self->_internalSignals;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  if (-[_INPBPrivateMediaItemValueData hasIsAvailable](self, "hasIsAvailable"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBPrivateMediaItemValueData hasIsHardBan](self, "hasIsHardBan"))
    PBDataWriterWriteBOOLField();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = self->_mediaSubItems;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v14);
  }

  -[_INPBPrivateMediaItemValueData pegasusMetaData](self, "pegasusMetaData", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteDataField();
  -[_INPBPrivateMediaItemValueData provider](self, "provider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  -[_INPBPrivateMediaItemValueData providerAppName](self, "providerAppName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[_INPBPrivateMediaItemValueData punchoutURI](self, "punchoutURI");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();
  -[_INPBPrivateMediaItemValueData recommendationId](self, "recommendationId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    PBDataWriterWriteStringField();
  if (-[_INPBPrivateMediaItemValueData hasRequiresSubscription](self, "hasRequiresSubscription"))
    PBDataWriterWriteBOOLField();
  -[_INPBPrivateMediaItemValueData sharedUserIdFromPlayableMusicAccount](self, "sharedUserIdFromPlayableMusicAccount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    PBDataWriterWriteStringField();
  -[_INPBPrivateMediaItemValueData universalResourceLink](self, "universalResourceLink");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    PBDataWriterWriteStringField();

}

- (_INPBPrivateMediaItemValueData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPrivateMediaItemValueData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPrivateMediaItemValueData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPrivateMediaItemValueData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPrivateMediaItemValueData initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPrivateMediaItemValueData data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPrivateMediaItemValueData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = -[_INPBPrivateMediaItemValueData init](+[_INPBPrivateMediaItemValueData allocWithZone:](_INPBPrivateMediaItemValueData, "allocWithZone:"), "init");
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceLevel](self, "hasAmpConfidenceLevel"))
    -[_INPBPrivateMediaItemValueData setAmpConfidenceLevel:](v5, "setAmpConfidenceLevel:", -[_INPBPrivateMediaItemValueData ampConfidenceLevel](self, "ampConfidenceLevel"));
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceScore](self, "hasAmpConfidenceScore"))
  {
    -[_INPBPrivateMediaItemValueData ampConfidenceScore](self, "ampConfidenceScore");
    -[_INPBPrivateMediaItemValueData setAmpConfidenceScore:](v5, "setAmpConfidenceScore:");
  }
  v6 = (void *)-[NSString copyWithZone:](self->_assetInfo, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setAssetInfo:](v5, "setAssetInfo:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setBundleId:](v5, "setBundleId:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_internalSignals, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setInternalSignals:](v5, "setInternalSignals:", v8);

  if (-[_INPBPrivateMediaItemValueData hasIsAvailable](self, "hasIsAvailable"))
    -[_INPBPrivateMediaItemValueData setIsAvailable:](v5, "setIsAvailable:", -[_INPBPrivateMediaItemValueData isAvailable](self, "isAvailable"));
  if (-[_INPBPrivateMediaItemValueData hasIsHardBan](self, "hasIsHardBan"))
    -[_INPBPrivateMediaItemValueData setIsHardBan:](v5, "setIsHardBan:", -[_INPBPrivateMediaItemValueData isHardBan](self, "isHardBan"));
  v9 = (void *)-[NSArray copyWithZone:](self->_mediaSubItems, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setMediaSubItems:](v5, "setMediaSubItems:", v9);

  v10 = (void *)-[NSData copyWithZone:](self->_pegasusMetaData, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setPegasusMetaData:](v5, "setPegasusMetaData:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_provider, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setProvider:](v5, "setProvider:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_providerAppName, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setProviderAppName:](v5, "setProviderAppName:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_punchoutURI, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setPunchoutURI:](v5, "setPunchoutURI:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_recommendationId, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setRecommendationId:](v5, "setRecommendationId:", v14);

  if (-[_INPBPrivateMediaItemValueData hasRequiresSubscription](self, "hasRequiresSubscription"))
    -[_INPBPrivateMediaItemValueData setRequiresSubscription:](v5, "setRequiresSubscription:", -[_INPBPrivateMediaItemValueData requiresSubscription](self, "requiresSubscription"));
  v15 = (void *)-[NSString copyWithZone:](self->_sharedUserIdFromPlayableMusicAccount, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setSharedUserIdFromPlayableMusicAccount:](v5, "setSharedUserIdFromPlayableMusicAccount:", v15);

  v16 = (void *)-[NSString copyWithZone:](self->_universalResourceLink, "copyWithZone:", a3);
  -[_INPBPrivateMediaItemValueData setUniversalResourceLink:](v5, "setUniversalResourceLink:", v16);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int ampConfidenceLevel;
  int v7;
  float ampConfidenceScore;
  float v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int isAvailable;
  int v29;
  int isHardBan;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  int v61;
  int requiresSubscription;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  BOOL v73;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_77;
  v5 = -[_INPBPrivateMediaItemValueData hasAmpConfidenceLevel](self, "hasAmpConfidenceLevel");
  if (v5 != objc_msgSend(v4, "hasAmpConfidenceLevel"))
    goto LABEL_77;
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceLevel](self, "hasAmpConfidenceLevel"))
  {
    if (objc_msgSend(v4, "hasAmpConfidenceLevel"))
    {
      ampConfidenceLevel = self->_ampConfidenceLevel;
      if (ampConfidenceLevel != objc_msgSend(v4, "ampConfidenceLevel"))
        goto LABEL_77;
    }
  }
  v7 = -[_INPBPrivateMediaItemValueData hasAmpConfidenceScore](self, "hasAmpConfidenceScore");
  if (v7 != objc_msgSend(v4, "hasAmpConfidenceScore"))
    goto LABEL_77;
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceScore](self, "hasAmpConfidenceScore"))
  {
    if (objc_msgSend(v4, "hasAmpConfidenceScore"))
    {
      ampConfidenceScore = self->_ampConfidenceScore;
      objc_msgSend(v4, "ampConfidenceScore");
      if (ampConfidenceScore != v9)
        goto LABEL_77;
    }
  }
  -[_INPBPrivateMediaItemValueData assetInfo](self, "assetInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData assetInfo](self, "assetInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPrivateMediaItemValueData assetInfo](self, "assetInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData bundleId](self, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData bundleId](self, "bundleId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPrivateMediaItemValueData bundleId](self, "bundleId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData internalSignals](self, "internalSignals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSignals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData internalSignals](self, "internalSignals");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBPrivateMediaItemValueData internalSignals](self, "internalSignals");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSignals");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_77;
  }
  else
  {

  }
  v27 = -[_INPBPrivateMediaItemValueData hasIsAvailable](self, "hasIsAvailable");
  if (v27 != objc_msgSend(v4, "hasIsAvailable"))
    goto LABEL_77;
  if (-[_INPBPrivateMediaItemValueData hasIsAvailable](self, "hasIsAvailable"))
  {
    if (objc_msgSend(v4, "hasIsAvailable"))
    {
      isAvailable = self->_isAvailable;
      if (isAvailable != objc_msgSend(v4, "isAvailable"))
        goto LABEL_77;
    }
  }
  v29 = -[_INPBPrivateMediaItemValueData hasIsHardBan](self, "hasIsHardBan");
  if (v29 != objc_msgSend(v4, "hasIsHardBan"))
    goto LABEL_77;
  if (-[_INPBPrivateMediaItemValueData hasIsHardBan](self, "hasIsHardBan"))
  {
    if (objc_msgSend(v4, "hasIsHardBan"))
    {
      isHardBan = self->_isHardBan;
      if (isHardBan != objc_msgSend(v4, "isHardBan"))
        goto LABEL_77;
    }
  }
  -[_INPBPrivateMediaItemValueData mediaSubItems](self, "mediaSubItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSubItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData mediaSubItems](self, "mediaSubItems");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBPrivateMediaItemValueData mediaSubItems](self, "mediaSubItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSubItems");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData pegasusMetaData](self, "pegasusMetaData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusMetaData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData pegasusMetaData](self, "pegasusMetaData");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_INPBPrivateMediaItemValueData pegasusMetaData](self, "pegasusMetaData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusMetaData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData provider](self, "provider");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_INPBPrivateMediaItemValueData provider](self, "provider");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData providerAppName](self, "providerAppName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerAppName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData providerAppName](self, "providerAppName");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_INPBPrivateMediaItemValueData providerAppName](self, "providerAppName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerAppName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData punchoutURI](self, "punchoutURI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutURI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData punchoutURI](self, "punchoutURI");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_INPBPrivateMediaItemValueData punchoutURI](self, "punchoutURI");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutURI");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData recommendationId](self, "recommendationId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recommendationId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData recommendationId](self, "recommendationId");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[_INPBPrivateMediaItemValueData recommendationId](self, "recommendationId");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recommendationId");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_77;
  }
  else
  {

  }
  v61 = -[_INPBPrivateMediaItemValueData hasRequiresSubscription](self, "hasRequiresSubscription");
  if (v61 != objc_msgSend(v4, "hasRequiresSubscription"))
    goto LABEL_77;
  if (-[_INPBPrivateMediaItemValueData hasRequiresSubscription](self, "hasRequiresSubscription"))
  {
    if (objc_msgSend(v4, "hasRequiresSubscription"))
    {
      requiresSubscription = self->_requiresSubscription;
      if (requiresSubscription != objc_msgSend(v4, "requiresSubscription"))
        goto LABEL_77;
    }
  }
  -[_INPBPrivateMediaItemValueData sharedUserIdFromPlayableMusicAccount](self, "sharedUserIdFromPlayableMusicAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedUserIdFromPlayableMusicAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_76;
  -[_INPBPrivateMediaItemValueData sharedUserIdFromPlayableMusicAccount](self, "sharedUserIdFromPlayableMusicAccount");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[_INPBPrivateMediaItemValueData sharedUserIdFromPlayableMusicAccount](self, "sharedUserIdFromPlayableMusicAccount");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedUserIdFromPlayableMusicAccount");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_77;
  }
  else
  {

  }
  -[_INPBPrivateMediaItemValueData universalResourceLink](self, "universalResourceLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalResourceLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) != (v11 != 0))
  {
    -[_INPBPrivateMediaItemValueData universalResourceLink](self, "universalResourceLink");
    v68 = objc_claimAutoreleasedReturnValue();
    if (!v68)
    {

LABEL_80:
      v73 = 1;
      goto LABEL_78;
    }
    v69 = (void *)v68;
    -[_INPBPrivateMediaItemValueData universalResourceLink](self, "universalResourceLink");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "universalResourceLink");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if ((v72 & 1) != 0)
      goto LABEL_80;
  }
  else
  {
LABEL_76:

  }
LABEL_77:
  v73 = 0;
LABEL_78:

  return v73;
}

- (unint64_t)hash
{
  float ampConfidenceScore;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  unint64_t v26;
  uint64_t v27;

  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceLevel](self, "hasAmpConfidenceLevel"))
    v27 = 2654435761 * self->_ampConfidenceLevel;
  else
    v27 = 0;
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceScore](self, "hasAmpConfidenceScore"))
  {
    ampConfidenceScore = self->_ampConfidenceScore;
    v4 = ampConfidenceScore;
    if (ampConfidenceScore < 0.0)
      v4 = -ampConfidenceScore;
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
    v26 = v10;
  }
  else
  {
    v26 = 0;
  }
  v25 = -[NSString hash](self->_assetInfo, "hash");
  v24 = -[NSString hash](self->_bundleId, "hash");
  v23 = -[NSArray hash](self->_internalSignals, "hash");
  if (-[_INPBPrivateMediaItemValueData hasIsAvailable](self, "hasIsAvailable"))
    v11 = 2654435761 * self->_isAvailable;
  else
    v11 = 0;
  if (-[_INPBPrivateMediaItemValueData hasIsHardBan](self, "hasIsHardBan"))
    v12 = 2654435761 * self->_isHardBan;
  else
    v12 = 0;
  v13 = -[NSArray hash](self->_mediaSubItems, "hash");
  v14 = -[NSData hash](self->_pegasusMetaData, "hash");
  v15 = -[NSString hash](self->_provider, "hash");
  v16 = -[NSString hash](self->_providerAppName, "hash");
  v17 = -[NSString hash](self->_punchoutURI, "hash");
  v18 = -[NSString hash](self->_recommendationId, "hash");
  if (-[_INPBPrivateMediaItemValueData hasRequiresSubscription](self, "hasRequiresSubscription"))
    v19 = 2654435761 * self->_requiresSubscription;
  else
    v19 = 0;
  v20 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  v21 = v19 ^ -[NSString hash](self->_sharedUserIdFromPlayableMusicAccount, "hash");
  return v20 ^ v21 ^ -[NSString hash](self->_universalResourceLink, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceLevel](self, "hasAmpConfidenceLevel"))
  {
    v4 = -[_INPBPrivateMediaItemValueData ampConfidenceLevel](self, "ampConfidenceLevel");
    if ((int)v4 > 19)
    {
      if ((_DWORD)v4 == 20)
      {
        v5 = CFSTR("MEDIUM");
        goto LABEL_12;
      }
      if ((_DWORD)v4 == 30)
      {
        v5 = CFSTR("HIGH");
        goto LABEL_12;
      }
    }
    else
    {
      if (!(_DWORD)v4)
      {
        v5 = CFSTR("UNKNOWN_CONFIDENCE_LEVEL");
        goto LABEL_12;
      }
      if ((_DWORD)v4 == 10)
      {
        v5 = CFSTR("LOW");
LABEL_12:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ampConfidenceLevel"));

        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  if (-[_INPBPrivateMediaItemValueData hasAmpConfidenceScore](self, "hasAmpConfidenceScore"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBPrivateMediaItemValueData ampConfidenceScore](self, "ampConfidenceScore");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ampConfidenceScore"));

  }
  if (self->_assetInfo)
  {
    -[_INPBPrivateMediaItemValueData assetInfo](self, "assetInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetInfo"));

  }
  if (self->_bundleId)
  {
    -[_INPBPrivateMediaItemValueData bundleId](self, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("bundleId"));

  }
  if (self->_internalSignals)
  {
    -[_INPBPrivateMediaItemValueData internalSignals](self, "internalSignals");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("internalSignal"));

  }
  if (-[_INPBPrivateMediaItemValueData hasIsAvailable](self, "hasIsAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivateMediaItemValueData isAvailable](self, "isAvailable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isAvailable"));

  }
  if (-[_INPBPrivateMediaItemValueData hasIsHardBan](self, "hasIsHardBan"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivateMediaItemValueData isHardBan](self, "isHardBan"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isHardBan"));

  }
  if (-[NSArray count](self->_mediaSubItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v17 = self->_mediaSubItems;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v21), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("mediaSubItems"));
  }
  if (self->_pegasusMetaData)
  {
    -[_INPBPrivateMediaItemValueData pegasusMetaData](self, "pegasusMetaData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("pegasusMetaData"));

  }
  if (self->_provider)
  {
    -[_INPBPrivateMediaItemValueData provider](self, "provider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("provider"));

  }
  if (self->_providerAppName)
  {
    -[_INPBPrivateMediaItemValueData providerAppName](self, "providerAppName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("providerAppName"));

  }
  if (self->_punchoutURI)
  {
    -[_INPBPrivateMediaItemValueData punchoutURI](self, "punchoutURI");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("punchoutURI"));

  }
  if (self->_recommendationId)
  {
    -[_INPBPrivateMediaItemValueData recommendationId](self, "recommendationId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("recommendationId"));

  }
  if (-[_INPBPrivateMediaItemValueData hasRequiresSubscription](self, "hasRequiresSubscription"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivateMediaItemValueData requiresSubscription](self, "requiresSubscription"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("requiresSubscription"));

  }
  if (self->_sharedUserIdFromPlayableMusicAccount)
  {
    -[_INPBPrivateMediaItemValueData sharedUserIdFromPlayableMusicAccount](self, "sharedUserIdFromPlayableMusicAccount");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("sharedUserIdFromPlayableMusicAccount"));

  }
  if (self->_universalResourceLink)
  {
    -[_INPBPrivateMediaItemValueData universalResourceLink](self, "universalResourceLink");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("universalResourceLink"));

  }
  return v3;
}

- (int)ampConfidenceLevel
{
  return self->_ampConfidenceLevel;
}

- (float)ampConfidenceScore
{
  return self->_ampConfidenceScore;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (BOOL)isHardBan
{
  return self->_isHardBan;
}

- (NSArray)mediaSubItems
{
  return self->_mediaSubItems;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)providerAppName
{
  return self->_providerAppName;
}

- (NSString)punchoutURI
{
  return self->_punchoutURI;
}

- (NSString)recommendationId
{
  return self->_recommendationId;
}

- (BOOL)requiresSubscription
{
  return self->_requiresSubscription;
}

- (NSString)sharedUserIdFromPlayableMusicAccount
{
  return self->_sharedUserIdFromPlayableMusicAccount;
}

- (NSString)universalResourceLink
{
  return self->_universalResourceLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalResourceLink, 0);
  objc_storeStrong((id *)&self->_sharedUserIdFromPlayableMusicAccount, 0);
  objc_storeStrong((id *)&self->_recommendationId, 0);
  objc_storeStrong((id *)&self->_punchoutURI, 0);
  objc_storeStrong((id *)&self->_providerAppName, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_mediaSubItems, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
}

+ (Class)mediaSubItemsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation NTPBAnfComponentExposure

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasAnfComponentType
{
  return self->_anfComponentType != 0;
}

- (BOOL)hasAnfComponentId
{
  return self->_anfComponentId != 0;
}

- (BOOL)hasAnfComponentRole
{
  return self->_anfComponentRole != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasArticleVersion
{
  return self->_articleVersion != 0;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (void)clearFractionalCohortMemberships
{
  -[NSMutableArray removeAllObjects](self->_fractionalCohortMemberships, "removeAllObjects");
}

- (void)addFractionalCohortMembership:(id)a3
{
  id v4;
  NSMutableArray *fractionalCohortMemberships;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  v8 = v4;
  if (!fractionalCohortMemberships)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_fractionalCohortMemberships;
    self->_fractionalCohortMemberships = v6;

    v4 = v8;
    fractionalCohortMemberships = self->_fractionalCohortMemberships;
  }
  -[NSMutableArray addObject:](fractionalCohortMemberships, "addObject:", v4);

}

- (unint64_t)fractionalCohortMembershipsCount
{
  return -[NSMutableArray count](self->_fractionalCohortMemberships, "count");
}

- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fractionalCohortMemberships, "objectAtIndex:", a3);
}

+ (Class)fractionalCohortMembershipType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NTPBAnfComponentExposure;
  -[NTPBAnfComponentExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAnfComponentExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *anfComponentType;
  NSString *anfComponentId;
  NSString *anfComponentRole;
  NSString *metadata;
  NSString *articleVersion;
  char has;
  void *v13;
  void *v14;
  NTPBIssueData *issueData;
  void *v16;
  NTPBIssueExposureData *issueExposureData;
  void *v18;
  NTPBIssueViewData *issueViewData;
  void *v20;
  NSData *articleViewingSessionId;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  anfComponentType = self->_anfComponentType;
  if (anfComponentType)
    objc_msgSend(v4, "setObject:forKey:", anfComponentType, CFSTR("anf_component_type"));
  anfComponentId = self->_anfComponentId;
  if (anfComponentId)
    objc_msgSend(v4, "setObject:forKey:", anfComponentId, CFSTR("anf_component_id"));
  anfComponentRole = self->_anfComponentRole;
  if (anfComponentRole)
    objc_msgSend(v4, "setObject:forKey:", anfComponentRole, CFSTR("anf_component_role"));
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v4, "setObject:forKey:", metadata, CFSTR("metadata"));
  articleVersion = self->_articleVersion;
  if (articleVersion)
    objc_msgSend(v4, "setObject:forKey:", articleVersion, CFSTR("article_version"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("publisher_article_version_int64"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("backend_article_version_int64"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("issue_view_data"));

  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v4, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = self->_fractionalCohortMemberships;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v30);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("fractional_cohort_membership"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAnfComponentExposureReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_anfComponentType)
    PBDataWriterWriteStringField();
  if (self->_anfComponentId)
    PBDataWriterWriteStringField();
  if (self->_anfComponentRole)
    PBDataWriterWriteStringField();
  if (self->_metadata)
    PBDataWriterWriteStringField();
  if (self->_articleVersion)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewData)
    PBDataWriterWriteSubmessage();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_fractionalCohortMemberships;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
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
  char has;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v8;

  v10 = -[NSString copyWithZone:](self->_anfComponentType, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_anfComponentId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_anfComponentRole, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  v18 = -[NSString copyWithZone:](self->_articleVersion, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_publisherArticleVersionInt64;
    *(_BYTE *)(v5 + 120) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_backendArticleVersionInt64;
    *(_BYTE *)(v5 + 120) |= 1u;
  }
  v21 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v21;

  v23 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v23;

  v25 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;

  v27 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v27;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = self->_fractionalCohortMemberships;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v5, "addFractionalCohortMembership:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v31);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *anfComponentType;
  NSString *anfComponentId;
  NSString *anfComponentRole;
  NSString *metadata;
  NSString *articleVersion;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBIssueViewData *issueViewData;
  NSData *articleViewingSessionId;
  NSMutableArray *fractionalCohortMemberships;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_36;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_36;
  }
  anfComponentType = self->_anfComponentType;
  if ((unint64_t)anfComponentType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](anfComponentType, "isEqual:"))
      goto LABEL_36;
  }
  anfComponentId = self->_anfComponentId;
  if ((unint64_t)anfComponentId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](anfComponentId, "isEqual:"))
      goto LABEL_36;
  }
  anfComponentRole = self->_anfComponentRole;
  if ((unint64_t)anfComponentRole | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](anfComponentRole, "isEqual:"))
      goto LABEL_36;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:"))
      goto LABEL_36;
  }
  articleVersion = self->_articleVersion;
  if ((unint64_t)articleVersion | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](articleVersion, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
LABEL_36:
    v17 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    goto LABEL_36;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 10) && !-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    goto LABEL_36;
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 11))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_36;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 12))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_36;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_36;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 9))
    v17 = -[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:");
  else
    v17 = 1;
LABEL_37:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v3 = -[NSString hash](self->_articleId, "hash");
  v4 = -[NSString hash](self->_sourceChannelId, "hash");
  v5 = -[NSString hash](self->_anfComponentType, "hash");
  v6 = -[NSString hash](self->_anfComponentId, "hash");
  v7 = -[NSString hash](self->_anfComponentRole, "hash");
  v8 = -[NSString hash](self->_metadata, "hash");
  v9 = -[NSString hash](self->_articleVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = 2654435761 * self->_publisherArticleVersionInt64;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v11 = 2654435761 * self->_backendArticleVersionInt64;
LABEL_6:
  v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v13 = v10 ^ v11 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v14 = v13 ^ -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  v15 = v12 ^ v14 ^ -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  v16 = -[NSData hash](self->_articleViewingSessionId, "hash");
  return v15 ^ v16 ^ -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  NTPBIssueData *issueData;
  uint64_t v7;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v9;
  NTPBIssueViewData *issueViewData;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[NTPBAnfComponentExposure setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v4 + 14))
    -[NTPBAnfComponentExposure setSourceChannelId:](self, "setSourceChannelId:");
  if (*((_QWORD *)v4 + 5))
    -[NTPBAnfComponentExposure setAnfComponentType:](self, "setAnfComponentType:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBAnfComponentExposure setAnfComponentId:](self, "setAnfComponentId:");
  if (*((_QWORD *)v4 + 4))
    -[NTPBAnfComponentExposure setAnfComponentRole:](self, "setAnfComponentRole:");
  if (*((_QWORD *)v4 + 13))
    -[NTPBAnfComponentExposure setMetadata:](self, "setMetadata:");
  if (*((_QWORD *)v4 + 7))
    -[NTPBAnfComponentExposure setArticleVersion:](self, "setArticleVersion:");
  v5 = *((_BYTE *)v4 + 120);
  if ((v5 & 2) != 0)
  {
    self->_publisherArticleVersionInt64 = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 120);
  }
  if ((v5 & 1) != 0)
  {
    self->_backendArticleVersionInt64 = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  issueData = self->_issueData;
  v7 = *((_QWORD *)v4 + 10);
  if (issueData)
  {
    if (v7)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v7)
  {
    -[NTPBAnfComponentExposure setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v9 = *((_QWORD *)v4 + 11);
  if (issueExposureData)
  {
    if (v9)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v9)
  {
    -[NTPBAnfComponentExposure setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  v11 = *((_QWORD *)v4 + 12);
  if (issueViewData)
  {
    if (v11)
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v11)
  {
    -[NTPBAnfComponentExposure setIssueViewData:](self, "setIssueViewData:");
  }
  if (*((_QWORD *)v4 + 8))
    -[NTPBAnfComponentExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 9);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NTPBAnfComponentExposure addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)anfComponentType
{
  return self->_anfComponentType;
}

- (void)setAnfComponentType:(id)a3
{
  objc_storeStrong((id *)&self->_anfComponentType, a3);
}

- (NSString)anfComponentId
{
  return self->_anfComponentId;
}

- (void)setAnfComponentId:(id)a3
{
  objc_storeStrong((id *)&self->_anfComponentId, a3);
}

- (NSString)anfComponentRole
{
  return self->_anfComponentRole;
}

- (void)setAnfComponentRole:(id)a3
{
  objc_storeStrong((id *)&self->_anfComponentRole, a3);
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSString)articleVersion
{
  return self->_articleVersion;
}

- (void)setArticleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_articleVersion, a3);
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (NTPBIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
  objc_storeStrong((id *)&self->_issueExposureData, a3);
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewData, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleVersion, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_anfComponentType, 0);
  objc_storeStrong((id *)&self->_anfComponentRole, 0);
  objc_storeStrong((id *)&self->_anfComponentId, 0);
}

@end

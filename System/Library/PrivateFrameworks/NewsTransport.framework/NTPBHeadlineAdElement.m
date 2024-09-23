@implementation NTPBHeadlineAdElement

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasArticleRating
{
  return self->_articleRating != 0;
}

- (void)clearArticleIAdCategories
{
  -[NSMutableArray removeAllObjects](self->_articleIAdCategories, "removeAllObjects");
}

- (void)addArticleIAdCategories:(id)a3
{
  id v4;
  NSMutableArray *articleIAdCategories;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  articleIAdCategories = self->_articleIAdCategories;
  v8 = v4;
  if (!articleIAdCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_articleIAdCategories;
    self->_articleIAdCategories = v6;

    v4 = v8;
    articleIAdCategories = self->_articleIAdCategories;
  }
  -[NSMutableArray addObject:](articleIAdCategories, "addObject:", v4);

}

- (unint64_t)articleIAdCategoriesCount
{
  return -[NSMutableArray count](self->_articleIAdCategories, "count");
}

- (id)articleIAdCategoriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleIAdCategories, "objectAtIndex:", a3);
}

+ (Class)articleIAdCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)setPaidArticle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_paidArticle = a3;
}

- (void)setHasPaidArticle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPaidArticle
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSponsoredArticle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sponsoredArticle = a3;
}

- (void)setHasSponsoredArticle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSponsoredArticle
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDraftArticle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_draftArticle = a3;
}

- (void)setHasDraftArticle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDraftArticle
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearArticleIAdSectionIDs
{
  -[NSMutableArray removeAllObjects](self->_articleIAdSectionIDs, "removeAllObjects");
}

- (void)addArticleIAdSectionIDs:(id)a3
{
  id v4;
  NSMutableArray *articleIAdSectionIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  articleIAdSectionIDs = self->_articleIAdSectionIDs;
  v8 = v4;
  if (!articleIAdSectionIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_articleIAdSectionIDs;
    self->_articleIAdSectionIDs = v6;

    v4 = v8;
    articleIAdSectionIDs = self->_articleIAdSectionIDs;
  }
  -[NSMutableArray addObject:](articleIAdSectionIDs, "addObject:", v4);

}

- (unint64_t)articleIAdSectionIDsCount
{
  return -[NSMutableArray count](self->_articleIAdSectionIDs, "count");
}

- (id)articleIAdSectionIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleIAdSectionIDs, "objectAtIndex:", a3);
}

+ (Class)articleIAdSectionIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearChannelIAdKeywords
{
  -[NSMutableArray removeAllObjects](self->_channelIAdKeywords, "removeAllObjects");
}

- (void)addChannelIAdKeywords:(id)a3
{
  id v4;
  NSMutableArray *channelIAdKeywords;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  channelIAdKeywords = self->_channelIAdKeywords;
  v8 = v4;
  if (!channelIAdKeywords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_channelIAdKeywords;
    self->_channelIAdKeywords = v6;

    v4 = v8;
    channelIAdKeywords = self->_channelIAdKeywords;
  }
  -[NSMutableArray addObject:](channelIAdKeywords, "addObject:", v4);

}

- (unint64_t)channelIAdKeywordsCount
{
  return -[NSMutableArray count](self->_channelIAdKeywords, "count");
}

- (id)channelIAdKeywordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelIAdKeywords, "objectAtIndex:", a3);
}

+ (Class)channelIAdKeywordsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelID
{
  return self->_channelID != 0;
}

- (BOOL)hasChannelRating
{
  return self->_channelRating != 0;
}

- (void)clearChannelIAdCategories
{
  -[NSMutableArray removeAllObjects](self->_channelIAdCategories, "removeAllObjects");
}

- (void)addChannelIAdCategories:(id)a3
{
  id v4;
  NSMutableArray *channelIAdCategories;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  channelIAdCategories = self->_channelIAdCategories;
  v8 = v4;
  if (!channelIAdCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_channelIAdCategories;
    self->_channelIAdCategories = v6;

    v4 = v8;
    channelIAdCategories = self->_channelIAdCategories;
  }
  -[NSMutableArray addObject:](channelIAdCategories, "addObject:", v4);

}

- (unint64_t)channelIAdCategoriesCount
{
  return -[NSMutableArray count](self->_channelIAdCategories, "count");
}

- (id)channelIAdCategoriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelIAdCategories, "objectAtIndex:", a3);
}

+ (Class)channelIAdCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)setChannelContentProviderID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelContentProviderID = a3;
}

- (void)setHasChannelContentProviderID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelContentProviderID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearArticleIAdKeywords
{
  -[NSMutableArray removeAllObjects](self->_articleIAdKeywords, "removeAllObjects");
}

- (void)addArticleIAdKeywords:(id)a3
{
  id v4;
  NSMutableArray *articleIAdKeywords;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  articleIAdKeywords = self->_articleIAdKeywords;
  v8 = v4;
  if (!articleIAdKeywords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_articleIAdKeywords;
    self->_articleIAdKeywords = v6;

    v4 = v8;
    articleIAdKeywords = self->_articleIAdKeywords;
  }
  -[NSMutableArray addObject:](articleIAdKeywords, "addObject:", v4);

}

- (unint64_t)articleIAdKeywordsCount
{
  return -[NSMutableArray count](self->_articleIAdKeywords, "count");
}

- (id)articleIAdKeywordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleIAdKeywords, "objectAtIndex:", a3);
}

+ (Class)articleIAdKeywordsType
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
  v8.super_class = (Class)NTPBHeadlineAdElement;
  -[NTPBHeadlineAdElement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBHeadlineAdElement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleID;
  NSString *articleRating;
  NSMutableArray *articleIAdCategories;
  char has;
  void *v9;
  NSMutableArray *articleIAdSectionIDs;
  NSMutableArray *channelIAdKeywords;
  NSString *channelID;
  NSString *channelRating;
  NSMutableArray *channelIAdCategories;
  void *v15;
  NSMutableArray *articleIAdKeywords;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleID = self->_articleID;
  if (articleID)
    objc_msgSend(v3, "setObject:forKey:", articleID, CFSTR("article_ID"));
  articleRating = self->_articleRating;
  if (articleRating)
    objc_msgSend(v4, "setObject:forKey:", articleRating, CFSTR("article_rating"));
  articleIAdCategories = self->_articleIAdCategories;
  if (articleIAdCategories)
    objc_msgSend(v4, "setObject:forKey:", articleIAdCategories, CFSTR("article_iAd_categories"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_paidArticle);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("paid_article"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sponsoredArticle);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("sponsored_article"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_draftArticle);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("draft_article"));

  }
LABEL_11:
  articleIAdSectionIDs = self->_articleIAdSectionIDs;
  if (articleIAdSectionIDs)
    objc_msgSend(v4, "setObject:forKey:", articleIAdSectionIDs, CFSTR("article_iAd_section_IDs"));
  channelIAdKeywords = self->_channelIAdKeywords;
  if (channelIAdKeywords)
    objc_msgSend(v4, "setObject:forKey:", channelIAdKeywords, CFSTR("channel_iAd_keywords"));
  channelID = self->_channelID;
  if (channelID)
    objc_msgSend(v4, "setObject:forKey:", channelID, CFSTR("channel_ID"));
  channelRating = self->_channelRating;
  if (channelRating)
    objc_msgSend(v4, "setObject:forKey:", channelRating, CFSTR("channel_rating"));
  channelIAdCategories = self->_channelIAdCategories;
  if (channelIAdCategories)
    objc_msgSend(v4, "setObject:forKey:", channelIAdCategories, CFSTR("channel_iAd_categories"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_channelContentProviderID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("channel_content_provider_ID"));

  }
  articleIAdKeywords = self->_articleIAdKeywords;
  if (articleIAdKeywords)
    objc_msgSend(v4, "setObject:forKey:", articleIAdKeywords, CFSTR("article_iAd_keywords"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBHeadlineAdElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_articleID)
    PBDataWriterWriteStringField();
  if (self->_articleRating)
    PBDataWriterWriteStringField();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = self->_articleIAdCategories;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 2) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_15:
    PBDataWriterWriteBOOLField();
LABEL_16:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = self->_articleIAdSectionIDs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v13);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = self->_channelIAdKeywords;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v18);
  }

  if (self->_channelID)
    PBDataWriterWriteStringField();
  if (self->_channelRating)
    PBDataWriterWriteStringField();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = self->_channelIAdCategories;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v23);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = self->_articleIAdKeywords;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteStringField();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
    }
    while (v28);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char has;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_articleRating, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v10 = self->_articleIAdCategories;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArticleIAdCategories:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 89) = self->_paidArticle;
    *(_BYTE *)(v5 + 92) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 90) = self->_sponsoredArticle;
  *(_BYTE *)(v5 + 92) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_11:
    *(_BYTE *)(v5 + 88) = self->_draftArticle;
    *(_BYTE *)(v5 + 92) |= 2u;
  }
LABEL_12:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v17 = self->_articleIAdSectionIDs;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArticleIAdSectionIDs:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    }
    while (v19);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v23 = self->_channelIAdKeywords;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v55 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChannelIAdKeywords:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    }
    while (v25);
  }

  v29 = -[NSString copyWithZone:](self->_channelID, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v29;

  v31 = -[NSString copyWithZone:](self->_channelRating, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v31;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v33 = self->_channelIAdCategories;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChannelIAdCategories:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    }
    while (v35);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_channelContentProviderID;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v39 = self->_articleIAdKeywords;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v47;
    do
    {
      for (n = 0; n != v41; ++n)
      {
        if (*(_QWORD *)v47 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend((id)v5, "addArticleIAdKeywords:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
    }
    while (v41);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleID;
  NSString *articleRating;
  NSMutableArray *articleIAdCategories;
  NSMutableArray *articleIAdSectionIDs;
  NSMutableArray *channelIAdKeywords;
  NSString *channelID;
  NSString *channelRating;
  NSMutableArray *channelIAdCategories;
  NSMutableArray *articleIAdKeywords;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  articleID = self->_articleID;
  if ((unint64_t)articleID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](articleID, "isEqual:"))
      goto LABEL_49;
  }
  articleRating = self->_articleRating;
  if ((unint64_t)articleRating | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleRating, "isEqual:"))
      goto LABEL_49;
  }
  articleIAdCategories = self->_articleIAdCategories;
  if ((unint64_t)articleIAdCategories | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](articleIAdCategories, "isEqual:"))
      goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0)
      goto LABEL_49;
    if (self->_paidArticle)
    {
      if (!*((_BYTE *)v4 + 89))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 89))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0)
      goto LABEL_49;
    if (self->_sponsoredArticle)
    {
      if (!*((_BYTE *)v4 + 90))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 90))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) != 0)
    {
      if (self->_draftArticle)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_49;
        goto LABEL_32;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_32;
    }
LABEL_49:
    v14 = 0;
    goto LABEL_50;
  }
  if ((*((_BYTE *)v4 + 92) & 2) != 0)
    goto LABEL_49;
LABEL_32:
  articleIAdSectionIDs = self->_articleIAdSectionIDs;
  if ((unint64_t)articleIAdSectionIDs | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](articleIAdSectionIDs, "isEqual:"))
  {
    goto LABEL_49;
  }
  channelIAdKeywords = self->_channelIAdKeywords;
  if ((unint64_t)channelIAdKeywords | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](channelIAdKeywords, "isEqual:"))
      goto LABEL_49;
  }
  channelID = self->_channelID;
  if ((unint64_t)channelID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](channelID, "isEqual:"))
      goto LABEL_49;
  }
  channelRating = self->_channelRating;
  if ((unint64_t)channelRating | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](channelRating, "isEqual:"))
      goto LABEL_49;
  }
  channelIAdCategories = self->_channelIAdCategories;
  if ((unint64_t)channelIAdCategories | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](channelIAdCategories, "isEqual:"))
      goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_channelContentProviderID != *((_QWORD *)v4 + 1))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_49;
  }
  articleIAdKeywords = self->_articleIAdKeywords;
  if ((unint64_t)articleIAdKeywords | *((_QWORD *)v4 + 3))
    v14 = -[NSMutableArray isEqual:](articleIAdKeywords, "isEqual:");
  else
    v14 = 1;
LABEL_50:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;

  v15 = -[NSString hash](self->_articleID, "hash");
  v14 = -[NSString hash](self->_articleRating, "hash");
  v13 = -[NSMutableArray hash](self->_articleIAdCategories, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_paidArticle;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_sponsoredArticle;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_draftArticle;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSMutableArray hash](self->_articleIAdSectionIDs, "hash");
  v7 = -[NSMutableArray hash](self->_channelIAdKeywords, "hash");
  v8 = -[NSString hash](self->_channelID, "hash");
  v9 = -[NSString hash](self->_channelRating, "hash");
  v10 = -[NSMutableArray hash](self->_channelIAdCategories, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_channelContentProviderID;
  else
    v11 = 0;
  return v14 ^ v15 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_articleIAdKeywords, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[NTPBHeadlineAdElement setArticleID:](self, "setArticleID:");
  if (*((_QWORD *)v4 + 6))
    -[NTPBHeadlineAdElement setArticleRating:](self, "setArticleRating:");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        -[NTPBHeadlineAdElement addArticleIAdCategories:](self, "addArticleIAdCategories:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 92);
  if ((v10 & 4) != 0)
  {
    self->_paidArticle = *((_BYTE *)v4 + 89);
    *(_BYTE *)&self->_has |= 4u;
    v10 = *((_BYTE *)v4 + 92);
    if ((v10 & 8) == 0)
    {
LABEL_14:
      if ((v10 & 2) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_sponsoredArticle = *((_BYTE *)v4 + 90);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
LABEL_15:
    self->_draftArticle = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_16:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = *((id *)v4 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        -[NTPBHeadlineAdElement addArticleIAdSectionIDs:](self, "addArticleIAdSectionIDs:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v13);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = *((id *)v4 + 8);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        -[NTPBHeadlineAdElement addChannelIAdKeywords:](self, "addChannelIAdKeywords:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v4 + 9))
    -[NTPBHeadlineAdElement setChannelID:](self, "setChannelID:");
  if (*((_QWORD *)v4 + 10))
    -[NTPBHeadlineAdElement setChannelRating:](self, "setChannelRating:");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = *((id *)v4 + 7);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        -[NTPBHeadlineAdElement addChannelIAdCategories:](self, "addChannelIAdCategories:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v23);
  }

  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_channelContentProviderID = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = *((id *)v4 + 3);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        -[NTPBHeadlineAdElement addArticleIAdKeywords:](self, "addArticleIAdKeywords:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * n), (_QWORD)v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
    }
    while (v28);
  }

}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_storeStrong((id *)&self->_articleID, a3);
}

- (NSString)articleRating
{
  return self->_articleRating;
}

- (void)setArticleRating:(id)a3
{
  objc_storeStrong((id *)&self->_articleRating, a3);
}

- (NSMutableArray)articleIAdCategories
{
  return self->_articleIAdCategories;
}

- (void)setArticleIAdCategories:(id)a3
{
  objc_storeStrong((id *)&self->_articleIAdCategories, a3);
}

- (BOOL)paidArticle
{
  return self->_paidArticle;
}

- (BOOL)sponsoredArticle
{
  return self->_sponsoredArticle;
}

- (BOOL)draftArticle
{
  return self->_draftArticle;
}

- (NSMutableArray)articleIAdSectionIDs
{
  return self->_articleIAdSectionIDs;
}

- (void)setArticleIAdSectionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_articleIAdSectionIDs, a3);
}

- (NSMutableArray)channelIAdKeywords
{
  return self->_channelIAdKeywords;
}

- (void)setChannelIAdKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_channelIAdKeywords, a3);
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_storeStrong((id *)&self->_channelID, a3);
}

- (NSString)channelRating
{
  return self->_channelRating;
}

- (void)setChannelRating:(id)a3
{
  objc_storeStrong((id *)&self->_channelRating, a3);
}

- (NSMutableArray)channelIAdCategories
{
  return self->_channelIAdCategories;
}

- (void)setChannelIAdCategories:(id)a3
{
  objc_storeStrong((id *)&self->_channelIAdCategories, a3);
}

- (int64_t)channelContentProviderID
{
  return self->_channelContentProviderID;
}

- (NSMutableArray)articleIAdKeywords
{
  return self->_articleIAdKeywords;
}

- (void)setArticleIAdKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_articleIAdKeywords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelRating, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_channelIAdKeywords, 0);
  objc_storeStrong((id *)&self->_channelIAdCategories, 0);
  objc_storeStrong((id *)&self->_articleRating, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_articleIAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_articleIAdKeywords, 0);
  objc_storeStrong((id *)&self->_articleIAdCategories, 0);
}

@end

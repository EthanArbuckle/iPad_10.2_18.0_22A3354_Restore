@implementation NTPBIssueRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBIssueRecord setBase:](self, "setBase:", 0);
  -[NTPBIssueRecord setAllArticleIDs:](self, "setAllArticleIDs:", 0);
  -[NTPBIssueRecord setAllowedStorefrontIDs:](self, "setAllowedStorefrontIDs:", 0);
  -[NTPBIssueRecord setBlockedStorefrontIDs:](self, "setBlockedStorefrontIDs:", 0);
  -[NTPBIssueRecord setChannelTagID:](self, "setChannelTagID:", 0);
  -[NTPBIssueRecord setCoverArticleID:](self, "setCoverArticleID:", 0);
  -[NTPBIssueRecord setCoverImageURL:](self, "setCoverImageURL:", 0);
  -[NTPBIssueRecord setCoverPrimaryColor:](self, "setCoverPrimaryColor:", 0);
  -[NTPBIssueRecord setEdition:](self, "setEdition:", 0);
  -[NTPBIssueRecord setIssueDescription:](self, "setIssueDescription:", 0);
  -[NTPBIssueRecord setLayeredCover:](self, "setLayeredCover:", 0);
  -[NTPBIssueRecord setLayeredCoverPrimaryColor:](self, "setLayeredCoverPrimaryColor:", 0);
  -[NTPBIssueRecord setMetadataURL:](self, "setMetadataURL:", 0);
  -[NTPBIssueRecord setNotificationDescription:](self, "setNotificationDescription:", 0);
  -[NTPBIssueRecord setPublishDate:](self, "setPublishDate:", 0);
  -[NTPBIssueRecord setScores:](self, "setScores:", 0);
  -[NTPBIssueRecord setTitle:](self, "setTitle:", 0);
  -[NTPBIssueRecord setTopicTagIDs:](self, "setTopicTagIDs:", 0);
  -[NTPBIssueRecord setPdfResourceArchiveURL:](self, "setPdfResourceArchiveURL:", 0);
  -[NTPBIssueRecord setBundleFeaturedArticleIDs:](self, "setBundleFeaturedArticleIDs:", 0);
  -[NTPBIssueRecord setConversionStats:](self, "setConversionStats:", 0);
  -[NTPBIssueRecord setCoverBackgroundColor:](self, "setCoverBackgroundColor:", 0);
  -[NTPBIssueRecord setCoverTextColor:](self, "setCoverTextColor:", 0);
  -[NTPBIssueRecord setCoverAccentColor:](self, "setCoverAccentColor:", 0);
  -[NTPBIssueRecord setSortDate:](self, "setSortDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueRecord;
  -[NTPBIssueRecord dealloc](&v3, sel_dealloc);
}

- (void)setTopicTagIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setSortDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setScores:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (void)setPublishDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (void)setPdfResourceArchiveURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (void)setNotificationDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (void)setMetadataURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (void)setLayeredCoverPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (void)setLayeredCover:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void)setIssueDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (void)setEdition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setCoverTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (void)setCoverPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setCoverImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (void)setCoverBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setCoverArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)setCoverAccentColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setConversionStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setChannelTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setBundleFeaturedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)setBlockedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setAllowedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setAllArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (double)coverAspectRatio
{
  return self->_coverAspectRatio;
}

- (NSString)channelTagID
{
  return self->_channelTagID;
}

- (NSMutableArray)topicTagIDs
{
  return self->_topicTagIDs;
}

- (NSString)title
{
  return self->_title;
}

- (NTPBDate)sortDate
{
  return self->_sortDate;
}

- (NTPBDate)publishDate
{
  return self->_publishDate;
}

- (NSString)notificationDescription
{
  return self->_notificationDescription;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)metadataURL
{
  return self->_metadataURL;
}

- (NSString)layeredCover
{
  return self->_layeredCover;
}

- (NSString)layeredCoverPrimaryColor
{
  return self->_layeredCoverPrimaryColor;
}

- (double)layeredCoverAspectRatio
{
  return self->_layeredCoverAspectRatio;
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (NSString)edition
{
  return self->_edition;
}

- (NSString)coverTextColor
{
  return self->_coverTextColor;
}

- (NSString)coverPrimaryColor
{
  return self->_coverPrimaryColor;
}

- (NSString)coverImageURL
{
  return self->_coverImageURL;
}

- (NSString)coverBackgroundColor
{
  return self->_coverBackgroundColor;
}

- (NSString)coverArticleID
{
  return self->_coverArticleID;
}

- (NSString)coverAccentColor
{
  return self->_coverAccentColor;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSMutableArray)allArticleIDs
{
  return self->_allArticleIDs;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *allArticleIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  char has;
  NSMutableArray *topicTagIDs;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  char v31;
  NSMutableArray *bundleFeaturedArticleIDs;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 56) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  allArticleIDs = self->_allArticleIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allArticleIDs, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(allArticleIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllArticleIDs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allArticleIDs, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v8);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(allowedStorefrontIDs);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllowedStorefrontIDs:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v14);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v48 != v21)
          objc_enumerationMutation(blockedStorefrontIDs);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBlockedStorefrontIDs:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v20);
  }

  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_channelTagID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 104) = -[NSString copyWithZone:](self->_coverArticleID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_coverAspectRatio;
    *(_BYTE *)(v5 + 248) |= 1u;
  }

  *(_QWORD *)(v5 + 120) = -[NSString copyWithZone:](self->_coverImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 128) = -[NSString copyWithZone:](self->_coverPrimaryColor, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 144) = -[NSString copyWithZone:](self->_edition, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_halfLifeMilliseconds;
    *(_BYTE *)(v5 + 248) |= 2u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_26:
      if ((has & 0x40) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_26;
  }
  *(_BYTE *)(v5 + 244) = self->_isDraft;
  *(_BYTE *)(v5 + 248) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    *(_BYTE *)(v5 + 245) = self->_isPaid;
    *(_BYTE *)(v5 + 248) |= 0x40u;
  }
LABEL_28:

  *(_QWORD *)(v5 + 152) = -[NSString copyWithZone:](self->_issueDescription, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 160) = -[NSString copyWithZone:](self->_layeredCover, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_layeredCoverAspectRatio;
    *(_BYTE *)(v5 + 248) |= 4u;
  }

  *(_QWORD *)(v5 + 168) = -[NSString copyWithZone:](self->_layeredCoverPrimaryColor, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 176) = -[NSString copyWithZone:](self->_metadataURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 184) = -[NSString copyWithZone:](self->_notificationDescription, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 200) = -[NTPBDate copyWithZone:](self->_publishDate, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 208) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores copyWithZone:](self->_scores, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 224) = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  topicTagIDs = self->_topicTagIDs;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicTagIDs, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(topicTagIDs);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTopicTagIDs:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicTagIDs, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v27);
  }
  v31 = (char)self->_has;
  if ((v31 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 240) = self->_type;
    *(_BYTE *)(v5 + 248) |= 0x10u;
    v31 = (char)self->_has;
  }
  if ((v31 & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_minimumNewsVersion;
    *(_BYTE *)(v5 + 248) |= 8u;
  }

  *(_QWORD *)(v5 + 192) = -[NSString copyWithZone:](self->_pdfResourceArchiveURL, "copyWithZone:", a3);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleFeaturedArticleIDs, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(bundleFeaturedArticleIDs);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBundleFeaturedArticleIDs:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleFeaturedArticleIDs, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v34);
  }

  *(_QWORD *)(v5 + 88) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats copyWithZone:](self->_conversionStats, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 112) = -[NSString copyWithZone:](self->_coverBackgroundColor, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 136) = -[NSString copyWithZone:](self->_coverTextColor, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = -[NSString copyWithZone:](self->_coverAccentColor, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 216) = -[NTPBDate copyWithZone:](self->_sortDate, "copyWithZone:", a3);
  return (id)v5;
}

- (void)addAllArticleIDs:(id)a3
{
  NSMutableArray *allArticleIDs;

  allArticleIDs = self->_allArticleIDs;
  if (!allArticleIDs)
  {
    allArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_allArticleIDs = allArticleIDs;
  }
  -[NSMutableArray addObject:](allArticleIDs, "addObject:", a3);
}

- (void)addTopicTagIDs:(id)a3
{
  NSMutableArray *topicTagIDs;

  topicTagIDs = self->_topicTagIDs;
  if (!topicTagIDs)
  {
    topicTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_topicTagIDs = topicTagIDs;
  }
  -[NSMutableArray addObject:](topicTagIDs, "addObject:", a3);
}

- (void)addAllowedStorefrontIDs:(id)a3
{
  NSMutableArray *allowedStorefrontIDs;

  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (!allowedStorefrontIDs)
  {
    allowedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_allowedStorefrontIDs = allowedStorefrontIDs;
  }
  -[NSMutableArray addObject:](allowedStorefrontIDs, "addObject:", a3);
}

- (BOOL)hasMetadataURL
{
  return self->_metadataURL != 0;
}

- (BOOL)hasCoverImageURL
{
  return self->_coverImageURL != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minimumNewsVersion = a3;
}

- (void)setLayeredCoverAspectRatio:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_layeredCoverAspectRatio = a3;
}

- (void)setIsPaid:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isPaid = a3;
}

- (void)setIsDraft:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isDraft = a3;
}

- (void)setHalfLifeMilliseconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_halfLifeMilliseconds = a3;
}

- (void)setCoverAspectRatio:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coverAspectRatio = a3;
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearAllArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_allArticleIDs, "removeAllObjects");
}

- (unint64_t)allArticleIDsCount
{
  return -[NSMutableArray count](self->_allArticleIDs, "count");
}

- (id)allArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allArticleIDs, "objectAtIndex:", a3);
}

+ (Class)allArticleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_allowedStorefrontIDs, "removeAllObjects");
}

- (unint64_t)allowedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_allowedStorefrontIDs, "count");
}

- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allowedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)allowedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearBlockedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_blockedStorefrontIDs, "removeAllObjects");
}

- (void)addBlockedStorefrontIDs:(id)a3
{
  NSMutableArray *blockedStorefrontIDs;

  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (!blockedStorefrontIDs)
  {
    blockedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_blockedStorefrontIDs = blockedStorefrontIDs;
  }
  -[NSMutableArray addObject:](blockedStorefrontIDs, "addObject:", a3);
}

- (unint64_t)blockedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_blockedStorefrontIDs, "count");
}

- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blockedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)blockedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelTagID
{
  return self->_channelTagID != 0;
}

- (BOOL)hasCoverArticleID
{
  return self->_coverArticleID != 0;
}

- (void)setHasCoverAspectRatio:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoverAspectRatio
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCoverPrimaryColor
{
  return self->_coverPrimaryColor != 0;
}

- (BOOL)hasEdition
{
  return self->_edition != 0;
}

- (void)setHasHalfLifeMilliseconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHalfLifeMilliseconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsDraft:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsDraft
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsPaid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsPaid
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasIssueDescription
{
  return self->_issueDescription != 0;
}

- (BOOL)hasLayeredCover
{
  return self->_layeredCover != 0;
}

- (void)setHasLayeredCoverAspectRatio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLayeredCoverAspectRatio
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasLayeredCoverPrimaryColor
{
  return self->_layeredCoverPrimaryColor != 0;
}

- (BOOL)hasNotificationDescription
{
  return self->_notificationDescription != 0;
}

- (BOOL)hasPublishDate
{
  return self->_publishDate != 0;
}

- (BOOL)hasScores
{
  return self->_scores != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)clearTopicTagIDs
{
  -[NSMutableArray removeAllObjects](self->_topicTagIDs, "removeAllObjects");
}

- (unint64_t)topicTagIDsCount
{
  return -[NSMutableArray count](self->_topicTagIDs, "count");
}

- (id)topicTagIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicTagIDs, "objectAtIndex:", a3);
}

+ (Class)topicTagIDsType
{
  return (Class)objc_opt_class();
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasPdfResourceArchiveURL
{
  return self->_pdfResourceArchiveURL != 0;
}

- (void)clearBundleFeaturedArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_bundleFeaturedArticleIDs, "removeAllObjects");
}

- (void)addBundleFeaturedArticleIDs:(id)a3
{
  NSMutableArray *bundleFeaturedArticleIDs;

  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  if (!bundleFeaturedArticleIDs)
  {
    bundleFeaturedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_bundleFeaturedArticleIDs = bundleFeaturedArticleIDs;
  }
  -[NSMutableArray addObject:](bundleFeaturedArticleIDs, "addObject:", a3);
}

- (unint64_t)bundleFeaturedArticleIDsCount
{
  return -[NSMutableArray count](self->_bundleFeaturedArticleIDs, "count");
}

- (id)bundleFeaturedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bundleFeaturedArticleIDs, "objectAtIndex:", a3);
}

+ (Class)bundleFeaturedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasConversionStats
{
  return self->_conversionStats != 0;
}

- (BOOL)hasCoverBackgroundColor
{
  return self->_coverBackgroundColor != 0;
}

- (BOOL)hasCoverTextColor
{
  return self->_coverTextColor != 0;
}

- (BOOL)hasCoverAccentColor
{
  return self->_coverAccentColor != 0;
}

- (BOOL)hasSortDate
{
  return self->_sortDate != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBIssueRecord description](&v3, sel_description), -[NTPBIssueRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSMutableArray *allArticleIDs;
  NSMutableArray *allowedStorefrontIDs;
  NSMutableArray *blockedStorefrontIDs;
  NSString *channelTagID;
  NSString *coverArticleID;
  NSString *coverImageURL;
  NSString *coverPrimaryColor;
  NSString *edition;
  char has;
  NSString *issueDescription;
  NSString *layeredCover;
  NSString *layeredCoverPrimaryColor;
  NSString *metadataURL;
  NSString *notificationDescription;
  NTPBDate *publishDate;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *scores;
  NSString *title;
  NSMutableArray *topicTagIDs;
  char v23;
  NSString *pdfResourceArchiveURL;
  NSMutableArray *bundleFeaturedArticleIDs;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *conversionStats;
  NSString *coverBackgroundColor;
  NSString *coverTextColor;
  NSString *coverAccentColor;
  NTPBDate *sortDate;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  allArticleIDs = self->_allArticleIDs;
  if (allArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", allArticleIDs, CFSTR("all_article_IDs"));
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", allowedStorefrontIDs, CFSTR("allowed_storefront_IDs"));
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", blockedStorefrontIDs, CFSTR("blocked_storefront_IDs"));
  channelTagID = self->_channelTagID;
  if (channelTagID)
    objc_msgSend(v3, "setObject:forKey:", channelTagID, CFSTR("channel_tag_ID"));
  coverArticleID = self->_coverArticleID;
  if (coverArticleID)
    objc_msgSend(v3, "setObject:forKey:", coverArticleID, CFSTR("cover_article_ID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_coverAspectRatio), CFSTR("cover_aspect_ratio"));
  coverImageURL = self->_coverImageURL;
  if (coverImageURL)
    objc_msgSend(v3, "setObject:forKey:", coverImageURL, CFSTR("cover_image_URL"));
  coverPrimaryColor = self->_coverPrimaryColor;
  if (coverPrimaryColor)
    objc_msgSend(v3, "setObject:forKey:", coverPrimaryColor, CFSTR("cover_primary_color"));
  edition = self->_edition;
  if (edition)
    objc_msgSend(v3, "setObject:forKey:", edition, CFSTR("edition"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_halfLifeMilliseconds), CFSTR("half_life_milliseconds"));
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_23:
      if ((has & 0x40) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDraft), CFSTR("is_draft"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_24:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaid), CFSTR("is_paid"));
LABEL_25:
  issueDescription = self->_issueDescription;
  if (issueDescription)
    objc_msgSend(v3, "setObject:forKey:", issueDescription, CFSTR("issue_description"));
  layeredCover = self->_layeredCover;
  if (layeredCover)
    objc_msgSend(v3, "setObject:forKey:", layeredCover, CFSTR("layered_cover"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_layeredCoverAspectRatio), CFSTR("layered_cover_aspect_ratio"));
  layeredCoverPrimaryColor = self->_layeredCoverPrimaryColor;
  if (layeredCoverPrimaryColor)
    objc_msgSend(v3, "setObject:forKey:", layeredCoverPrimaryColor, CFSTR("layered_cover_primary_color"));
  metadataURL = self->_metadataURL;
  if (metadataURL)
    objc_msgSend(v3, "setObject:forKey:", metadataURL, CFSTR("metadata_URL"));
  notificationDescription = self->_notificationDescription;
  if (notificationDescription)
    objc_msgSend(v3, "setObject:forKey:", notificationDescription, CFSTR("notification_description"));
  publishDate = self->_publishDate;
  if (publishDate)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publishDate, "dictionaryRepresentation"), CFSTR("publish_date"));
  scores = self->_scores;
  if (scores)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores dictionaryRepresentation](scores, "dictionaryRepresentation"), CFSTR("scores"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  topicTagIDs = self->_topicTagIDs;
  if (topicTagIDs)
    objc_msgSend(v3, "setObject:forKey:", topicTagIDs, CFSTR("topic_tag_IDs"));
  v23 = (char)self->_has;
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_type), CFSTR("type"));
    v23 = (char)self->_has;
  }
  if ((v23 & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumNewsVersion), CFSTR("minimum_news_version"));
  pdfResourceArchiveURL = self->_pdfResourceArchiveURL;
  if (pdfResourceArchiveURL)
    objc_msgSend(v3, "setObject:forKey:", pdfResourceArchiveURL, CFSTR("pdf_resource_archive_URL"));
  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  if (bundleFeaturedArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", bundleFeaturedArticleIDs, CFSTR("bundle_featured_article_IDs"));
  conversionStats = self->_conversionStats;
  if (conversionStats)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats dictionaryRepresentation](conversionStats, "dictionaryRepresentation"), CFSTR("conversion_stats"));
  coverBackgroundColor = self->_coverBackgroundColor;
  if (coverBackgroundColor)
    objc_msgSend(v3, "setObject:forKey:", coverBackgroundColor, CFSTR("cover_background_color"));
  coverTextColor = self->_coverTextColor;
  if (coverTextColor)
    objc_msgSend(v3, "setObject:forKey:", coverTextColor, CFSTR("cover_text_color"));
  coverAccentColor = self->_coverAccentColor;
  if (coverAccentColor)
    objc_msgSend(v3, "setObject:forKey:", coverAccentColor, CFSTR("cover_accent_color"));
  sortDate = self->_sortDate;
  if (sortDate)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](sortDate, "dictionaryRepresentation"), CFSTR("sort_date"));
  return v3;
}

- (void)writeTo:(id)a3
{
  NSMutableArray *allArticleIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  char has;
  NSMutableArray *topicTagIDs;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  char v25;
  NSMutableArray *bundleFeaturedArticleIDs;
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
  if (self->_base)
    PBDataWriterWriteSubmessage();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  allArticleIDs = self->_allArticleIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allArticleIDs, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(allArticleIDs);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allArticleIDs, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v6);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(allowedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v11);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(blockedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v16);
  }
  if (self->_channelTagID)
    PBDataWriterWriteStringField();
  if (self->_coverArticleID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_coverImageURL)
    PBDataWriterWriteStringField();
  if (self->_coverPrimaryColor)
    PBDataWriterWriteStringField();
  if (self->_edition)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_38:
      if ((has & 0x40) == 0)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_38;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_39:
    PBDataWriterWriteBOOLField();
LABEL_40:
  if (self->_issueDescription)
    PBDataWriterWriteStringField();
  if (self->_layeredCover)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_layeredCoverPrimaryColor)
    PBDataWriterWriteStringField();
  if (self->_metadataURL)
    PBDataWriterWriteStringField();
  if (self->_notificationDescription)
    PBDataWriterWriteStringField();
  if (self->_publishDate)
    PBDataWriterWriteSubmessage();
  if (self->_scores)
    PBDataWriterWriteSubmessage();
  if (self->_title)
    PBDataWriterWriteStringField();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  topicTagIDs = self->_topicTagIDs;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicTagIDs, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(topicTagIDs);
        PBDataWriterWriteStringField();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicTagIDs, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    }
    while (v22);
  }
  v25 = (char)self->_has;
  if ((v25 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v25 = (char)self->_has;
  }
  if ((v25 & 8) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_pdfResourceArchiveURL)
    PBDataWriterWriteStringField();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleFeaturedArticleIDs, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(bundleFeaturedArticleIDs);
        PBDataWriterWriteStringField();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleFeaturedArticleIDs, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
    }
    while (v28);
  }
  if (self->_conversionStats)
    PBDataWriterWriteSubmessage();
  if (self->_coverBackgroundColor)
    PBDataWriterWriteStringField();
  if (self->_coverTextColor)
    PBDataWriterWriteStringField();
  if (self->_coverAccentColor)
    PBDataWriterWriteStringField();
  if (self->_sortDate)
    PBDataWriterWriteSubmessage();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSMutableArray *allArticleIDs;
  NSMutableArray *allowedStorefrontIDs;
  NSMutableArray *blockedStorefrontIDs;
  NSString *channelTagID;
  NSString *coverArticleID;
  NSString *coverImageURL;
  NSString *coverPrimaryColor;
  NSString *edition;
  NSString *issueDescription;
  NSString *layeredCover;
  NSString *layeredCoverPrimaryColor;
  NSString *metadataURL;
  NSString *notificationDescription;
  NTPBDate *publishDate;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *scores;
  NSString *title;
  NSMutableArray *topicTagIDs;
  NSString *pdfResourceArchiveURL;
  NSMutableArray *bundleFeaturedArticleIDs;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *conversionStats;
  NSString *coverBackgroundColor;
  NSString *coverTextColor;
  NSString *coverAccentColor;
  NTPBDate *sortDate;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 7)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      allArticleIDs = self->_allArticleIDs;
      if (!((unint64_t)allArticleIDs | *((_QWORD *)a3 + 5))
        || (v5 = -[NSMutableArray isEqual:](allArticleIDs, "isEqual:")) != 0)
      {
        allowedStorefrontIDs = self->_allowedStorefrontIDs;
        if (!((unint64_t)allowedStorefrontIDs | *((_QWORD *)a3 + 6))
          || (v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:")) != 0)
        {
          blockedStorefrontIDs = self->_blockedStorefrontIDs;
          if (!((unint64_t)blockedStorefrontIDs | *((_QWORD *)a3 + 8))
            || (v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
          {
            channelTagID = self->_channelTagID;
            if (!((unint64_t)channelTagID | *((_QWORD *)a3 + 10))
              || (v5 = -[NSString isEqual:](channelTagID, "isEqual:")) != 0)
            {
              coverArticleID = self->_coverArticleID;
              if (!((unint64_t)coverArticleID | *((_QWORD *)a3 + 13))
                || (v5 = -[NSString isEqual:](coverArticleID, "isEqual:")) != 0)
              {
                if ((*(_BYTE *)&self->_has & 1) != 0)
                {
                  if ((*((_BYTE *)a3 + 248) & 1) == 0 || self->_coverAspectRatio != *((double *)a3 + 1))
                    goto LABEL_42;
                }
                else if ((*((_BYTE *)a3 + 248) & 1) != 0)
                {
                  goto LABEL_42;
                }
                coverImageURL = self->_coverImageURL;
                if (!((unint64_t)coverImageURL | *((_QWORD *)a3 + 15))
                  || (v5 = -[NSString isEqual:](coverImageURL, "isEqual:")) != 0)
                {
                  coverPrimaryColor = self->_coverPrimaryColor;
                  if (!((unint64_t)coverPrimaryColor | *((_QWORD *)a3 + 16))
                    || (v5 = -[NSString isEqual:](coverPrimaryColor, "isEqual:")) != 0)
                  {
                    edition = self->_edition;
                    if (!((unint64_t)edition | *((_QWORD *)a3 + 18))
                      || (v5 = -[NSString isEqual:](edition, "isEqual:")) != 0)
                    {
                      if ((*(_BYTE *)&self->_has & 2) != 0)
                      {
                        if ((*((_BYTE *)a3 + 248) & 2) == 0 || self->_halfLifeMilliseconds != *((_QWORD *)a3 + 2))
                          goto LABEL_42;
                      }
                      else if ((*((_BYTE *)a3 + 248) & 2) != 0)
                      {
                        goto LABEL_42;
                      }
                      if ((*(_BYTE *)&self->_has & 0x20) != 0)
                      {
                        if ((*((_BYTE *)a3 + 248) & 0x20) == 0)
                          goto LABEL_42;
                        if (self->_isDraft)
                        {
                          if (!*((_BYTE *)a3 + 244))
                            goto LABEL_42;
                        }
                        else if (*((_BYTE *)a3 + 244))
                        {
                          goto LABEL_42;
                        }
                      }
                      else if ((*((_BYTE *)a3 + 248) & 0x20) != 0)
                      {
                        goto LABEL_42;
                      }
                      if ((*(_BYTE *)&self->_has & 0x40) != 0)
                      {
                        if ((*((_BYTE *)a3 + 248) & 0x40) == 0)
                          goto LABEL_42;
                        if (self->_isPaid)
                        {
                          if (!*((_BYTE *)a3 + 245))
                            goto LABEL_42;
                        }
                        else if (*((_BYTE *)a3 + 245))
                        {
                          goto LABEL_42;
                        }
                      }
                      else if ((*((_BYTE *)a3 + 248) & 0x40) != 0)
                      {
                        goto LABEL_42;
                      }
                      issueDescription = self->_issueDescription;
                      if ((unint64_t)issueDescription | *((_QWORD *)a3 + 19))
                      {
                        v5 = -[NSString isEqual:](issueDescription, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      layeredCover = self->_layeredCover;
                      if ((unint64_t)layeredCover | *((_QWORD *)a3 + 20))
                      {
                        v5 = -[NSString isEqual:](layeredCover, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      if ((*(_BYTE *)&self->_has & 4) != 0)
                      {
                        if ((*((_BYTE *)a3 + 248) & 4) == 0 || self->_layeredCoverAspectRatio != *((double *)a3 + 3))
                          goto LABEL_42;
                      }
                      else if ((*((_BYTE *)a3 + 248) & 4) != 0)
                      {
                        goto LABEL_42;
                      }
                      layeredCoverPrimaryColor = self->_layeredCoverPrimaryColor;
                      if ((unint64_t)layeredCoverPrimaryColor | *((_QWORD *)a3 + 21))
                      {
                        v5 = -[NSString isEqual:](layeredCoverPrimaryColor, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      metadataURL = self->_metadataURL;
                      if ((unint64_t)metadataURL | *((_QWORD *)a3 + 22))
                      {
                        v5 = -[NSString isEqual:](metadataURL, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      notificationDescription = self->_notificationDescription;
                      if ((unint64_t)notificationDescription | *((_QWORD *)a3 + 23))
                      {
                        v5 = -[NSString isEqual:](notificationDescription, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      publishDate = self->_publishDate;
                      if ((unint64_t)publishDate | *((_QWORD *)a3 + 25))
                      {
                        v5 = -[NTPBDate isEqual:](publishDate, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      scores = self->_scores;
                      if ((unint64_t)scores | *((_QWORD *)a3 + 26))
                      {
                        v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores isEqual:](scores, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      title = self->_title;
                      if ((unint64_t)title | *((_QWORD *)a3 + 28))
                      {
                        v5 = -[NSString isEqual:](title, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      topicTagIDs = self->_topicTagIDs;
                      if ((unint64_t)topicTagIDs | *((_QWORD *)a3 + 29))
                      {
                        v5 = -[NSMutableArray isEqual:](topicTagIDs, "isEqual:");
                        if (!v5)
                          return v5;
                      }
                      if ((*(_BYTE *)&self->_has & 0x10) != 0)
                      {
                        if ((*((_BYTE *)a3 + 248) & 0x10) == 0 || self->_type != *((_DWORD *)a3 + 60))
                          goto LABEL_42;
                      }
                      else if ((*((_BYTE *)a3 + 248) & 0x10) != 0)
                      {
                        goto LABEL_42;
                      }
                      if ((*(_BYTE *)&self->_has & 8) != 0)
                      {
                        if ((*((_BYTE *)a3 + 248) & 8) == 0 || self->_minimumNewsVersion != *((_QWORD *)a3 + 4))
                          goto LABEL_42;
                        goto LABEL_81;
                      }
                      if ((*((_BYTE *)a3 + 248) & 8) == 0)
                      {
LABEL_81:
                        pdfResourceArchiveURL = self->_pdfResourceArchiveURL;
                        if (!((unint64_t)pdfResourceArchiveURL | *((_QWORD *)a3 + 24))
                          || (v5 = -[NSString isEqual:](pdfResourceArchiveURL, "isEqual:")) != 0)
                        {
                          bundleFeaturedArticleIDs = self->_bundleFeaturedArticleIDs;
                          if (!((unint64_t)bundleFeaturedArticleIDs | *((_QWORD *)a3 + 9))
                            || (v5 = -[NSMutableArray isEqual:](bundleFeaturedArticleIDs, "isEqual:")) != 0)
                          {
                            conversionStats = self->_conversionStats;
                            if (!((unint64_t)conversionStats | *((_QWORD *)a3 + 11))
                              || (v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats isEqual:](conversionStats, "isEqual:")) != 0)
                            {
                              coverBackgroundColor = self->_coverBackgroundColor;
                              if (!((unint64_t)coverBackgroundColor | *((_QWORD *)a3 + 14))
                                || (v5 = -[NSString isEqual:](coverBackgroundColor, "isEqual:")) != 0)
                              {
                                coverTextColor = self->_coverTextColor;
                                if (!((unint64_t)coverTextColor | *((_QWORD *)a3 + 17))
                                  || (v5 = -[NSString isEqual:](coverTextColor, "isEqual:")) != 0)
                                {
                                  coverAccentColor = self->_coverAccentColor;
                                  if (!((unint64_t)coverAccentColor | *((_QWORD *)a3 + 12))
                                    || (v5 = -[NSString isEqual:](coverAccentColor, "isEqual:")) != 0)
                                  {
                                    sortDate = self->_sortDate;
                                    if ((unint64_t)sortDate | *((_QWORD *)a3 + 27))
                                      LOBYTE(v5) = -[NTPBDate isEqual:](sortDate, "isEqual:");
                                    else
                                      LOBYTE(v5) = 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                        return v5;
                      }
LABEL_42:
                      LOBYTE(v5) = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  double coverAspectRatio;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double layeredCoverAspectRatio;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  unint64_t v23;
  unint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v37;
  NSUInteger v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  unint64_t v45;
  NSUInteger v46;
  NSUInteger v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;

  v51 = -[NTPBRecordBase hash](self->_base, "hash");
  v50 = -[NSMutableArray hash](self->_allArticleIDs, "hash");
  v49 = -[NSMutableArray hash](self->_allowedStorefrontIDs, "hash");
  v48 = -[NSMutableArray hash](self->_blockedStorefrontIDs, "hash");
  v47 = -[NSString hash](self->_channelTagID, "hash");
  v46 = -[NSString hash](self->_coverArticleID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    coverAspectRatio = self->_coverAspectRatio;
    v4 = -coverAspectRatio;
    if (coverAspectRatio >= 0.0)
      v4 = self->_coverAspectRatio;
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
    v45 = v10;
  }
  else
  {
    v45 = 0;
  }
  v44 = -[NSString hash](self->_coverImageURL, "hash");
  v43 = -[NSString hash](self->_coverPrimaryColor, "hash");
  v42 = -[NSString hash](self->_edition, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v41 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_15:
    v40 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_16;
  }
  v41 = 2654435761u * self->_halfLifeMilliseconds;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_12:
  v40 = 2654435761 * self->_isDraft;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v39 = 2654435761 * self->_isPaid;
    goto LABEL_17;
  }
LABEL_16:
  v39 = 0;
LABEL_17:
  v38 = -[NSString hash](self->_issueDescription, "hash");
  v37 = -[NSString hash](self->_layeredCover, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    layeredCoverAspectRatio = self->_layeredCoverAspectRatio;
    v13 = -layeredCoverAspectRatio;
    if (layeredCoverAspectRatio >= 0.0)
      v13 = self->_layeredCoverAspectRatio;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v16 = fmod(v14, 1.84467441e19);
    v17 = 2654435761u * (unint64_t)v16;
    v18 = v17 + (unint64_t)v15;
    if (v15 <= 0.0)
      v18 = 2654435761u * (unint64_t)v16;
    v19 = v17 - (unint64_t)fabs(v15);
    if (v15 < 0.0)
      v11 = v19;
    else
      v11 = v18;
  }
  else
  {
    v11 = 0;
  }
  v20 = -[NSString hash](self->_layeredCoverPrimaryColor, "hash");
  v21 = -[NSString hash](self->_metadataURL, "hash");
  v22 = -[NSString hash](self->_notificationDescription, "hash");
  v23 = -[NTPBDate hash](self->_publishDate, "hash");
  v24 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores hash](self->_scores, "hash");
  v25 = -[NSString hash](self->_title, "hash");
  v26 = -[NSMutableArray hash](self->_topicTagIDs, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v27 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_28;
LABEL_30:
    v28 = 0;
    goto LABEL_31;
  }
  v27 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_30;
LABEL_28:
  v28 = 2654435761 * self->_minimumNewsVersion;
LABEL_31:
  v29 = v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  v30 = v27 ^ v28 ^ -[NSString hash](self->_pdfResourceArchiveURL, "hash");
  v31 = v30 ^ -[NSMutableArray hash](self->_bundleFeaturedArticleIDs, "hash");
  v32 = v31 ^ -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats hash](self->_conversionStats, "hash");
  v33 = v32 ^ -[NSString hash](self->_coverBackgroundColor, "hash");
  v34 = v33 ^ -[NSString hash](self->_coverTextColor, "hash");
  v35 = v29 ^ v34 ^ -[NSString hash](self->_coverAccentColor, "hash");
  return v35 ^ -[NTPBDate hash](self->_sortDate, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  char v22;
  NTPBDate *publishDate;
  uint64_t v24;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores *scores;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  char v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats *conversionStats;
  uint64_t v39;
  NTPBDate *sortDate;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 7);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBIssueRecord setBase:](self, "setBase:");
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v59 != v10)
          objc_enumerationMutation(v7);
        -[NTPBIssueRecord addAllArticleIDs:](self, "addAllArticleIDs:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v9);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 6);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(v12);
        -[NTPBIssueRecord addAllowedStorefrontIDs:](self, "addAllowedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v14);
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = (void *)*((_QWORD *)a3 + 8);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v51 != v20)
          objc_enumerationMutation(v17);
        -[NTPBIssueRecord addBlockedStorefrontIDs:](self, "addBlockedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v19);
  }
  if (*((_QWORD *)a3 + 10))
    -[NTPBIssueRecord setChannelTagID:](self, "setChannelTagID:");
  if (*((_QWORD *)a3 + 13))
    -[NTPBIssueRecord setCoverArticleID:](self, "setCoverArticleID:");
  if ((*((_BYTE *)a3 + 248) & 1) != 0)
  {
    self->_coverAspectRatio = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 15))
    -[NTPBIssueRecord setCoverImageURL:](self, "setCoverImageURL:");
  if (*((_QWORD *)a3 + 16))
    -[NTPBIssueRecord setCoverPrimaryColor:](self, "setCoverPrimaryColor:");
  if (*((_QWORD *)a3 + 18))
    -[NTPBIssueRecord setEdition:](self, "setEdition:");
  v22 = *((_BYTE *)a3 + 248);
  if ((v22 & 2) != 0)
  {
    self->_halfLifeMilliseconds = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v22 = *((_BYTE *)a3 + 248);
    if ((v22 & 0x20) == 0)
    {
LABEL_41:
      if ((v22 & 0x40) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)a3 + 248) & 0x20) == 0)
  {
    goto LABEL_41;
  }
  self->_isDraft = *((_BYTE *)a3 + 244);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 248) & 0x40) != 0)
  {
LABEL_42:
    self->_isPaid = *((_BYTE *)a3 + 245);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_43:
  if (*((_QWORD *)a3 + 19))
    -[NTPBIssueRecord setIssueDescription:](self, "setIssueDescription:");
  if (*((_QWORD *)a3 + 20))
    -[NTPBIssueRecord setLayeredCover:](self, "setLayeredCover:");
  if ((*((_BYTE *)a3 + 248) & 4) != 0)
  {
    self->_layeredCoverAspectRatio = *((double *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 21))
    -[NTPBIssueRecord setLayeredCoverPrimaryColor:](self, "setLayeredCoverPrimaryColor:");
  if (*((_QWORD *)a3 + 22))
    -[NTPBIssueRecord setMetadataURL:](self, "setMetadataURL:");
  if (*((_QWORD *)a3 + 23))
    -[NTPBIssueRecord setNotificationDescription:](self, "setNotificationDescription:");
  publishDate = self->_publishDate;
  v24 = *((_QWORD *)a3 + 25);
  if (publishDate)
  {
    if (v24)
      -[NTPBDate mergeFrom:](publishDate, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBIssueRecord setPublishDate:](self, "setPublishDate:");
  }
  scores = self->_scores;
  v26 = *((_QWORD *)a3 + 26);
  if (scores)
  {
    if (v26)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores mergeFrom:](scores, "mergeFrom:");
  }
  else if (v26)
  {
    -[NTPBIssueRecord setScores:](self, "setScores:");
  }
  if (*((_QWORD *)a3 + 28))
    -[NTPBIssueRecord setTitle:](self, "setTitle:");
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v27 = (void *)*((_QWORD *)a3 + 29);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v47 != v30)
          objc_enumerationMutation(v27);
        -[NTPBIssueRecord addTopicTagIDs:](self, "addTopicTagIDs:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    }
    while (v29);
  }
  v32 = *((_BYTE *)a3 + 248);
  if ((v32 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)a3 + 60);
    *(_BYTE *)&self->_has |= 0x10u;
    v32 = *((_BYTE *)a3 + 248);
  }
  if ((v32 & 8) != 0)
  {
    self->_minimumNewsVersion = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 24))
    -[NTPBIssueRecord setPdfResourceArchiveURL:](self, "setPdfResourceArchiveURL:");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = (void *)*((_QWORD *)a3 + 9);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v43;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(v33);
        -[NTPBIssueRecord addBundleFeaturedArticleIDs:](self, "addBundleFeaturedArticleIDs:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * n));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
    }
    while (v35);
  }
  conversionStats = self->_conversionStats;
  v39 = *((_QWORD *)a3 + 11);
  if (conversionStats)
  {
    if (v39)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats mergeFrom:](conversionStats, "mergeFrom:");
  }
  else if (v39)
  {
    -[NTPBIssueRecord setConversionStats:](self, "setConversionStats:");
  }
  if (*((_QWORD *)a3 + 14))
    -[NTPBIssueRecord setCoverBackgroundColor:](self, "setCoverBackgroundColor:");
  if (*((_QWORD *)a3 + 17))
    -[NTPBIssueRecord setCoverTextColor:](self, "setCoverTextColor:");
  if (*((_QWORD *)a3 + 12))
    -[NTPBIssueRecord setCoverAccentColor:](self, "setCoverAccentColor:");
  sortDate = self->_sortDate;
  v41 = *((_QWORD *)a3 + 27);
  if (sortDate)
  {
    if (v41)
      -[NTPBDate mergeFrom:](sortDate, "mergeFrom:");
  }
  else if (v41)
  {
    -[NTPBIssueRecord setSortDate:](self, "setSortDate:");
  }
}

- (unint64_t)halfLifeMilliseconds
{
  return self->_halfLifeMilliseconds;
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores)scores
{
  return self->_scores;
}

- (NSString)pdfResourceArchiveURL
{
  return self->_pdfResourceArchiveURL;
}

- (NSMutableArray)bundleFeaturedArticleIDs
{
  return self->_bundleFeaturedArticleIDs;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats)conversionStats
{
  return self->_conversionStats;
}

@end

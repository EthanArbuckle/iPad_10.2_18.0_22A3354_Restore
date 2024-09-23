@implementation BCSBusinessLinkMessage

- (BOOL)hasLink
{
  return self->_link != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasHeroImage
{
  return self->_heroImage != 0;
}

- (BOOL)hasIconImage
{
  return self->_iconImage != 0;
}

- (BOOL)hasRedirectUrl
{
  return self->_redirectUrl != 0;
}

- (void)clearBusinessLinkContents
{
  -[NSMutableArray removeAllObjects](self->_businessLinkContents, "removeAllObjects");
}

- (void)addBusinessLinkContents:(id)a3
{
  id v4;
  NSMutableArray *businessLinkContents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  businessLinkContents = self->_businessLinkContents;
  v8 = v4;
  if (!businessLinkContents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_businessLinkContents;
    self->_businessLinkContents = v6;

    v4 = v8;
    businessLinkContents = self->_businessLinkContents;
  }
  -[NSMutableArray addObject:](businessLinkContents, "addObject:", v4);

}

- (unint64_t)businessLinkContentsCount
{
  return -[NSMutableArray count](self->_businessLinkContents, "count");
}

- (id)businessLinkContentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_businessLinkContents, "objectAtIndex:", a3);
}

+ (Class)businessLinkContentsType
{
  return (Class)objc_opt_class();
}

- (int)action
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_action;
  else
    return 1;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)actionAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_24C39CFE0[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIEW")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLAY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setIsPoweredBy:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isPoweredBy = a3;
}

- (void)setHasIsPoweredBy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPoweredBy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMuid
{
  return self->_muid != 0;
}

- (void)clearCategoryStyleAttributes
{
  -[NSMutableArray removeAllObjects](self->_categoryStyleAttributes, "removeAllObjects");
}

- (void)addCategoryStyleAttributes:(id)a3
{
  id v4;
  NSMutableArray *categoryStyleAttributes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  categoryStyleAttributes = self->_categoryStyleAttributes;
  v8 = v4;
  if (!categoryStyleAttributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_categoryStyleAttributes;
    self->_categoryStyleAttributes = v6;

    v4 = v8;
    categoryStyleAttributes = self->_categoryStyleAttributes;
  }
  -[NSMutableArray addObject:](categoryStyleAttributes, "addObject:", v4);

}

- (unint64_t)categoryStyleAttributesCount
{
  return -[NSMutableArray count](self->_categoryStyleAttributes, "count");
}

- (id)categoryStyleAttributesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_categoryStyleAttributes, "objectAtIndex:", a3);
}

+ (Class)categoryStyleAttributesType
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
  v8.super_class = (Class)BCSBusinessLinkMessage;
  -[BCSBusinessLinkMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessLinkMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *link;
  NSString *bundleId;
  NSString *heroImage;
  NSString *iconImage;
  NSString *redirectUrl;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char has;
  unsigned int v18;
  __CFString *v19;
  void *v20;
  NSString *muid;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  link = self->_link;
  if (link)
    objc_msgSend(v3, "setObject:forKey:", link, CFSTR("link"));
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v4, "setObject:forKey:", bundleId, CFSTR("bundle_id"));
  heroImage = self->_heroImage;
  if (heroImage)
    objc_msgSend(v4, "setObject:forKey:", heroImage, CFSTR("hero_image"));
  iconImage = self->_iconImage;
  if (iconImage)
    objc_msgSend(v4, "setObject:forKey:", iconImage, CFSTR("icon_image"));
  redirectUrl = self->_redirectUrl;
  if (redirectUrl)
    objc_msgSend(v4, "setObject:forKey:", redirectUrl, CFSTR("redirect_url"));
  if (-[NSMutableArray count](self->_businessLinkContents, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_businessLinkContents, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = self->_businessLinkContents;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("business_link_contents"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v18 = self->_action - 1;
    if (v18 >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_action);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_24C39CFE0[v18];
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("action"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPoweredBy);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("is_powered_by"));

  }
  muid = self->_muid;
  if (muid)
    objc_msgSend(v4, "setObject:forKey:", muid, CFSTR("muid"));
  if (-[NSMutableArray count](self->_categoryStyleAttributes, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_categoryStyleAttributes, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = self->_categoryStyleAttributes;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("category_style_attributes"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSBusinessLinkMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_link)
    PBDataWriterWriteStringField();
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  if (self->_heroImage)
    PBDataWriterWriteStringField();
  if (self->_iconImage)
    PBDataWriterWriteStringField();
  if (self->_redirectUrl)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_businessLinkContents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_muid)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_categoryStyleAttributes;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v13 = a3;
  if (self->_link)
    objc_msgSend(v13, "setLink:");
  if (self->_bundleId)
    objc_msgSend(v13, "setBundleId:");
  if (self->_heroImage)
    objc_msgSend(v13, "setHeroImage:");
  if (self->_iconImage)
    objc_msgSend(v13, "setIconImage:");
  if (self->_redirectUrl)
    objc_msgSend(v13, "setRedirectUrl:");
  if (-[BCSBusinessLinkMessage businessLinkContentsCount](self, "businessLinkContentsCount"))
  {
    objc_msgSend(v13, "clearBusinessLinkContents");
    v4 = -[BCSBusinessLinkMessage businessLinkContentsCount](self, "businessLinkContentsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BCSBusinessLinkMessage businessLinkContentsAtIndex:](self, "businessLinkContentsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addBusinessLinkContents:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v13 + 2) = self->_action;
    *((_BYTE *)v13 + 84) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v13 + 80) = self->_isPoweredBy;
    *((_BYTE *)v13 + 84) |= 2u;
  }
  if (self->_muid)
    objc_msgSend(v13, "setMuid:");
  if (-[BCSBusinessLinkMessage categoryStyleAttributesCount](self, "categoryStyleAttributesCount"))
  {
    objc_msgSend(v13, "clearCategoryStyleAttributes");
    v9 = -[BCSBusinessLinkMessage categoryStyleAttributesCount](self, "categoryStyleAttributesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[BCSBusinessLinkMessage categoryStyleAttributesAtIndex:](self, "categoryStyleAttributesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addCategoryStyleAttributes:", v12);

      }
    }
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char has;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_link, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_heroImage, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_iconImage, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_redirectUrl, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = self->_businessLinkContents;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBusinessLinkContents:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v18);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_action;
    *(_BYTE *)(v5 + 84) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_isPoweredBy;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
  v23 = -[NSString copyWithZone:](self->_muid, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v23;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self->_categoryStyleAttributes;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addCategoryStyleAttributes:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v27);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *link;
  NSString *bundleId;
  NSString *heroImage;
  NSString *iconImage;
  NSString *redirectUrl;
  NSMutableArray *businessLinkContents;
  NSString *muid;
  NSMutableArray *categoryStyleAttributes;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  link = self->_link;
  if ((unint64_t)link | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](link, "isEqual:"))
      goto LABEL_31;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_31;
  }
  heroImage = self->_heroImage;
  if ((unint64_t)heroImage | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](heroImage, "isEqual:"))
      goto LABEL_31;
  }
  iconImage = self->_iconImage;
  if ((unint64_t)iconImage | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](iconImage, "isEqual:"))
      goto LABEL_31;
  }
  redirectUrl = self->_redirectUrl;
  if ((unint64_t)redirectUrl | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](redirectUrl, "isEqual:"))
      goto LABEL_31;
  }
  businessLinkContents = self->_businessLinkContents;
  if ((unint64_t)businessLinkContents | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](businessLinkContents, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_action != *((_DWORD *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) != 0)
    {
      if (self->_isPoweredBy)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_31;
        goto LABEL_27;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_27;
    }
LABEL_31:
    v13 = 0;
    goto LABEL_32;
  }
  if ((*((_BYTE *)v4 + 84) & 2) != 0)
    goto LABEL_31;
LABEL_27:
  muid = self->_muid;
  if ((unint64_t)muid | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](muid, "isEqual:"))
    goto LABEL_31;
  categoryStyleAttributes = self->_categoryStyleAttributes;
  if ((unint64_t)categoryStyleAttributes | *((_QWORD *)v4 + 4))
    v13 = -[NSMutableArray isEqual:](categoryStyleAttributes, "isEqual:");
  else
    v13 = 1;
LABEL_32:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_link, "hash");
  v4 = -[NSString hash](self->_bundleId, "hash");
  v5 = -[NSString hash](self->_heroImage, "hash");
  v6 = -[NSString hash](self->_iconImage, "hash");
  v7 = -[NSString hash](self->_redirectUrl, "hash");
  v8 = -[NSMutableArray hash](self->_businessLinkContents, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = 2654435761 * self->_action;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v10 = 2654435761 * self->_isPoweredBy;
LABEL_6:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v12 = v10 ^ -[NSString hash](self->_muid, "hash");
  return v11 ^ v12 ^ -[NSMutableArray hash](self->_categoryStyleAttributes, "hash");
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[BCSBusinessLinkMessage setLink:](self, "setLink:");
  if (*((_QWORD *)v4 + 2))
    -[BCSBusinessLinkMessage setBundleId:](self, "setBundleId:");
  if (*((_QWORD *)v4 + 5))
    -[BCSBusinessLinkMessage setHeroImage:](self, "setHeroImage:");
  if (*((_QWORD *)v4 + 6))
    -[BCSBusinessLinkMessage setIconImage:](self, "setIconImage:");
  if (*((_QWORD *)v4 + 9))
    -[BCSBusinessLinkMessage setRedirectUrl:](self, "setRedirectUrl:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[BCSBusinessLinkMessage addBusinessLinkContents:](self, "addBusinessLinkContents:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 84);
  if ((v10 & 1) != 0)
  {
    self->_action = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v10 = *((_BYTE *)v4 + 84);
  }
  if ((v10 & 2) != 0)
  {
    self->_isPoweredBy = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 8))
    -[BCSBusinessLinkMessage setMuid:](self, "setMuid:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v4 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[BCSBusinessLinkMessage addCategoryStyleAttributes:](self, "addCategoryStyleAttributes:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (NSString)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)heroImage
{
  return self->_heroImage;
}

- (void)setHeroImage:(id)a3
{
  objc_storeStrong((id *)&self->_heroImage, a3);
}

- (NSString)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (NSString)redirectUrl
{
  return self->_redirectUrl;
}

- (void)setRedirectUrl:(id)a3
{
  objc_storeStrong((id *)&self->_redirectUrl, a3);
}

- (NSMutableArray)businessLinkContents
{
  return self->_businessLinkContents;
}

- (void)setBusinessLinkContents:(id)a3
{
  objc_storeStrong((id *)&self->_businessLinkContents, a3);
}

- (BOOL)isPoweredBy
{
  return self->_isPoweredBy;
}

- (NSString)muid
{
  return self->_muid;
}

- (void)setMuid:(id)a3
{
  objc_storeStrong((id *)&self->_muid, a3);
}

- (NSMutableArray)categoryStyleAttributes
{
  return self->_categoryStyleAttributes;
}

- (void)setCategoryStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_categoryStyleAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectUrl, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_categoryStyleAttributes, 0);
  objc_storeStrong((id *)&self->_businessLinkContents, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end

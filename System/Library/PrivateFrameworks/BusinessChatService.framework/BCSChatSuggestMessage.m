@implementation BCSChatSuggestMessage

- (void)setPhoneHash:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_phoneHash = a3;
}

- (void)setHasPhoneHash:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneHash
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBizId
{
  return self->_bizId != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)clearChatOpenHours
{
  -[NSMutableArray removeAllObjects](self->_chatOpenHours, "removeAllObjects");
}

- (void)addChatOpenHours:(id)a3
{
  id v4;
  NSMutableArray *chatOpenHours;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  chatOpenHours = self->_chatOpenHours;
  v8 = v4;
  if (!chatOpenHours)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_chatOpenHours;
    self->_chatOpenHours = v6;

    v4 = v8;
    chatOpenHours = self->_chatOpenHours;
  }
  -[NSMutableArray addObject:](chatOpenHours, "addObject:", v4);

}

- (unint64_t)chatOpenHoursCount
{
  return -[NSMutableArray count](self->_chatOpenHours, "count");
}

- (id)chatOpenHoursAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_chatOpenHours, "objectAtIndex:", a3);
}

+ (Class)chatOpenHoursType
{
  return (Class)objc_opt_class();
}

- (void)clearPhoneOpenHours
{
  -[NSMutableArray removeAllObjects](self->_phoneOpenHours, "removeAllObjects");
}

- (void)addPhoneOpenHours:(id)a3
{
  id v4;
  NSMutableArray *phoneOpenHours;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  phoneOpenHours = self->_phoneOpenHours;
  v8 = v4;
  if (!phoneOpenHours)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_phoneOpenHours;
    self->_phoneOpenHours = v6;

    v4 = v8;
    phoneOpenHours = self->_phoneOpenHours;
  }
  -[NSMutableArray addObject:](phoneOpenHours, "addObject:", v4);

}

- (unint64_t)phoneOpenHoursCount
{
  return -[NSMutableArray count](self->_phoneOpenHours, "count");
}

- (id)phoneOpenHoursAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_phoneOpenHours, "objectAtIndex:", a3);
}

+ (Class)phoneOpenHoursType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTimeZone
{
  return self->_timeZone != 0;
}

- (BOOL)hasSquareLogoUrl
{
  return self->_squareLogoUrl != 0;
}

- (BOOL)hasWideLogoUrl
{
  return self->_wideLogoUrl != 0;
}

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
}

- (BOOL)hasTintColor
{
  return self->_tintColor != 0;
}

- (void)setIsVerified:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isVerified = a3;
}

- (void)setHasIsVerified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVerified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearCallToActions
{
  -[NSMutableArray removeAllObjects](self->_callToActions, "removeAllObjects");
}

- (void)addCallToActions:(id)a3
{
  id v4;
  NSMutableArray *callToActions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  callToActions = self->_callToActions;
  v8 = v4;
  if (!callToActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_callToActions;
    self->_callToActions = v6;

    v4 = v8;
    callToActions = self->_callToActions;
  }
  -[NSMutableArray addObject:](callToActions, "addObject:", v4);

}

- (unint64_t)callToActionsCount
{
  return -[NSMutableArray count](self->_callToActions, "count");
}

- (id)callToActionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_callToActions, "objectAtIndex:", a3);
}

+ (Class)callToActionsType
{
  return (Class)objc_opt_class();
}

- (void)clearVisibilities
{
  -[NSMutableArray removeAllObjects](self->_visibilities, "removeAllObjects");
}

- (void)addVisibilities:(id)a3
{
  id v4;
  NSMutableArray *visibilities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  visibilities = self->_visibilities;
  v8 = v4;
  if (!visibilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_visibilities;
    self->_visibilities = v6;

    v4 = v8;
    visibilities = self->_visibilities;
  }
  -[NSMutableArray addObject:](visibilities, "addObject:", v4);

}

- (unint64_t)visibilitiesCount
{
  return -[NSMutableArray count](self->_visibilities, "count");
}

- (id)visibilitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visibilities, "objectAtIndex:", a3);
}

+ (Class)visibilitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIntentId
{
  return self->_intentId != 0;
}

- (BOOL)hasGroup
{
  return self->_group != 0;
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
  v8.super_class = (Class)BCSChatSuggestMessage;
  -[BCSChatSuggestMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSChatSuggestMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bizId;
  NSString *name;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSString *timeZone;
  NSString *squareLogoUrl;
  NSString *wideLogoUrl;
  NSString *backgroundColor;
  NSString *tintColor;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  NSString *intentId;
  NSString *group;
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
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_phoneHash);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("phone_hash"));

  }
  bizId = self->_bizId;
  if (bizId)
    objc_msgSend(v3, "setObject:forKey:", bizId, CFSTR("biz_id"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if (-[NSMutableArray count](self->_chatOpenHours, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_chatOpenHours, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v8 = self->_chatOpenHours;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v57 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("chat_open_hours"));
  }
  if (-[NSMutableArray count](self->_phoneOpenHours, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_phoneOpenHours, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v15 = self->_phoneOpenHours;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("phone_open_hours"));
  }
  timeZone = self->_timeZone;
  if (timeZone)
    objc_msgSend(v3, "setObject:forKey:", timeZone, CFSTR("time_zone"));
  squareLogoUrl = self->_squareLogoUrl;
  if (squareLogoUrl)
    objc_msgSend(v3, "setObject:forKey:", squareLogoUrl, CFSTR("square_logo_url"));
  wideLogoUrl = self->_wideLogoUrl;
  if (wideLogoUrl)
    objc_msgSend(v3, "setObject:forKey:", wideLogoUrl, CFSTR("wide_logo_url"));
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
    objc_msgSend(v3, "setObject:forKey:", backgroundColor, CFSTR("background_color"));
  tintColor = self->_tintColor;
  if (tintColor)
    objc_msgSend(v3, "setObject:forKey:", tintColor, CFSTR("tint_color"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVerified);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("is_verified"));

  }
  if (-[NSMutableArray count](self->_callToActions, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_callToActions, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v28 = self->_callToActions;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("call_to_actions"));
  }
  if (-[NSMutableArray count](self->_visibilities, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_visibilities, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = self->_visibilities;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v45;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v45 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v44);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      }
      while (v37);
    }

    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("visibilities"));
  }
  intentId = self->_intentId;
  if (intentId)
    objc_msgSend(v3, "setObject:forKey:", intentId, CFSTR("intent_id"));
  group = self->_group;
  if (group)
    objc_msgSend(v3, "setObject:forKey:", group, CFSTR("group"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BCSChatSuggestMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_bizId)
    PBDataWriterWriteStringField();
  if (self->_name)
    PBDataWriterWriteStringField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_chatOpenHours;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_phoneOpenHours;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  if (self->_timeZone)
    PBDataWriterWriteStringField();
  if (self->_squareLogoUrl)
    PBDataWriterWriteStringField();
  if (self->_wideLogoUrl)
    PBDataWriterWriteStringField();
  if (self->_backgroundColor)
    PBDataWriterWriteStringField();
  if (self->_tintColor)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_callToActions;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_visibilities;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

  if (self->_intentId)
    PBDataWriterWriteStringField();
  if (self->_group)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  void *v21;
  _BYTE *v22;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_phoneHash;
    *((_BYTE *)v4 + 124) |= 1u;
  }
  v22 = v4;
  if (self->_bizId)
    objc_msgSend(v4, "setBizId:");
  if (self->_name)
    objc_msgSend(v22, "setName:");
  if (-[BCSChatSuggestMessage chatOpenHoursCount](self, "chatOpenHoursCount"))
  {
    objc_msgSend(v22, "clearChatOpenHours");
    v5 = -[BCSChatSuggestMessage chatOpenHoursCount](self, "chatOpenHoursCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BCSChatSuggestMessage chatOpenHoursAtIndex:](self, "chatOpenHoursAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addChatOpenHours:", v8);

      }
    }
  }
  if (-[BCSChatSuggestMessage phoneOpenHoursCount](self, "phoneOpenHoursCount"))
  {
    objc_msgSend(v22, "clearPhoneOpenHours");
    v9 = -[BCSChatSuggestMessage phoneOpenHoursCount](self, "phoneOpenHoursCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[BCSChatSuggestMessage phoneOpenHoursAtIndex:](self, "phoneOpenHoursAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addPhoneOpenHours:", v12);

      }
    }
  }
  if (self->_timeZone)
    objc_msgSend(v22, "setTimeZone:");
  if (self->_squareLogoUrl)
    objc_msgSend(v22, "setSquareLogoUrl:");
  if (self->_wideLogoUrl)
    objc_msgSend(v22, "setWideLogoUrl:");
  if (self->_backgroundColor)
    objc_msgSend(v22, "setBackgroundColor:");
  if (self->_tintColor)
    objc_msgSend(v22, "setTintColor:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v22[120] = self->_isVerified;
    v22[124] |= 2u;
  }
  if (-[BCSChatSuggestMessage callToActionsCount](self, "callToActionsCount"))
  {
    objc_msgSend(v22, "clearCallToActions");
    v13 = -[BCSChatSuggestMessage callToActionsCount](self, "callToActionsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[BCSChatSuggestMessage callToActionsAtIndex:](self, "callToActionsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addCallToActions:", v16);

      }
    }
  }
  if (-[BCSChatSuggestMessage visibilitiesCount](self, "visibilitiesCount"))
  {
    objc_msgSend(v22, "clearVisibilities");
    v17 = -[BCSChatSuggestMessage visibilitiesCount](self, "visibilitiesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[BCSChatSuggestMessage visibilitiesAtIndex:](self, "visibilitiesAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addVisibilities:", v20);

      }
    }
  }
  if (self->_intentId)
    objc_msgSend(v22, "setIntentId:");
  v21 = v22;
  if (self->_group)
  {
    objc_msgSend(v22, "setGroup:");
    v21 = v22;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
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
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_phoneHash;
    *(_BYTE *)(v5 + 124) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_bizId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v9;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v11 = self->_chatOpenHours;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v63 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addChatOpenHours:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v13);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v17 = self->_phoneOpenHours;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
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
        objc_msgSend((id)v6, "addPhoneOpenHours:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v19);
  }

  v23 = -[NSString copyWithZone:](self->_timeZone, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v23;

  v25 = -[NSString copyWithZone:](self->_squareLogoUrl, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v25;

  v27 = -[NSString copyWithZone:](self->_wideLogoUrl, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v27;

  v29 = -[NSString copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v29;

  v31 = -[NSString copyWithZone:](self->_tintColor, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v31;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 120) = self->_isVerified;
    *(_BYTE *)(v6 + 124) |= 2u;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v33 = self->_callToActions;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v55 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCallToActions:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v35);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v39 = self->_visibilities;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v51;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v50);
        objc_msgSend((id)v6, "addVisibilities:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v41);
  }

  v45 = -[NSString copyWithZone:](self->_intentId, "copyWithZone:", a3);
  v46 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v45;

  v47 = -[NSString copyWithZone:](self->_group, "copyWithZone:", a3);
  v48 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v47;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bizId;
  NSString *name;
  NSMutableArray *chatOpenHours;
  NSMutableArray *phoneOpenHours;
  NSString *timeZone;
  NSString *squareLogoUrl;
  NSString *wideLogoUrl;
  NSString *backgroundColor;
  NSString *tintColor;
  NSMutableArray *callToActions;
  NSMutableArray *visibilities;
  NSString *intentId;
  NSString *group;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 1) == 0 || self->_phoneHash != *((_QWORD *)v4 + 1))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 124) & 1) != 0)
  {
    goto LABEL_41;
  }
  bizId = self->_bizId;
  if ((unint64_t)bizId | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](bizId, "isEqual:"))
    goto LABEL_41;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_41;
  }
  chatOpenHours = self->_chatOpenHours;
  if ((unint64_t)chatOpenHours | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](chatOpenHours, "isEqual:"))
      goto LABEL_41;
  }
  phoneOpenHours = self->_phoneOpenHours;
  if ((unint64_t)phoneOpenHours | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](phoneOpenHours, "isEqual:"))
      goto LABEL_41;
  }
  timeZone = self->_timeZone;
  if ((unint64_t)timeZone | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](timeZone, "isEqual:"))
      goto LABEL_41;
  }
  squareLogoUrl = self->_squareLogoUrl;
  if ((unint64_t)squareLogoUrl | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](squareLogoUrl, "isEqual:"))
      goto LABEL_41;
  }
  wideLogoUrl = self->_wideLogoUrl;
  if ((unint64_t)wideLogoUrl | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](wideLogoUrl, "isEqual:"))
      goto LABEL_41;
  }
  backgroundColor = self->_backgroundColor;
  if ((unint64_t)backgroundColor | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](backgroundColor, "isEqual:"))
      goto LABEL_41;
  }
  tintColor = self->_tintColor;
  if ((unint64_t)tintColor | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](tintColor, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((_BYTE *)v4 + 120))
          goto LABEL_41;
        goto LABEL_33;
      }
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_33;
    }
LABEL_41:
    v18 = 0;
    goto LABEL_42;
  }
  if ((*((_BYTE *)v4 + 124) & 2) != 0)
    goto LABEL_41;
LABEL_33:
  callToActions = self->_callToActions;
  if ((unint64_t)callToActions | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](callToActions, "isEqual:"))
  {
    goto LABEL_41;
  }
  visibilities = self->_visibilities;
  if ((unint64_t)visibilities | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](visibilities, "isEqual:"))
      goto LABEL_41;
  }
  intentId = self->_intentId;
  if ((unint64_t)intentId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](intentId, "isEqual:"))
      goto LABEL_41;
  }
  group = self->_group;
  if ((unint64_t)group | *((_QWORD *)v4 + 6))
    v18 = -[NSString isEqual:](group, "isEqual:");
  else
    v18 = 1;
LABEL_42:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v17;
  uint64_t v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v18 = 2654435761 * self->_phoneHash;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_bizId, "hash");
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSMutableArray hash](self->_chatOpenHours, "hash");
  v5 = -[NSMutableArray hash](self->_phoneOpenHours, "hash");
  v6 = -[NSString hash](self->_timeZone, "hash");
  v7 = -[NSString hash](self->_squareLogoUrl, "hash");
  v8 = -[NSString hash](self->_wideLogoUrl, "hash");
  v9 = -[NSString hash](self->_backgroundColor, "hash");
  v10 = -[NSString hash](self->_tintColor, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_isVerified;
  else
    v11 = 0;
  v12 = v17 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v13 = -[NSMutableArray hash](self->_callToActions, "hash");
  v14 = v13 ^ -[NSMutableArray hash](self->_visibilities, "hash");
  v15 = v14 ^ -[NSString hash](self->_intentId, "hash");
  return v12 ^ v15 ^ -[NSString hash](self->_group, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
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
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 124) & 1) != 0)
  {
    self->_phoneHash = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[3])
    -[BCSChatSuggestMessage setBizId:](self, "setBizId:");
  if (*((_QWORD *)v5 + 8))
    -[BCSChatSuggestMessage setName:](self, "setName:");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = *((id *)v5 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        -[BCSChatSuggestMessage addChatOpenHours:](self, "addChatOpenHours:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = *((id *)v5 + 9);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        -[BCSChatSuggestMessage addPhoneOpenHours:](self, "addPhoneOpenHours:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v5 + 11))
    -[BCSChatSuggestMessage setTimeZone:](self, "setTimeZone:");
  if (*((_QWORD *)v5 + 10))
    -[BCSChatSuggestMessage setSquareLogoUrl:](self, "setSquareLogoUrl:");
  if (*((_QWORD *)v5 + 14))
    -[BCSChatSuggestMessage setWideLogoUrl:](self, "setWideLogoUrl:");
  if (*((_QWORD *)v5 + 2))
    -[BCSChatSuggestMessage setBackgroundColor:](self, "setBackgroundColor:");
  if (*((_QWORD *)v5 + 12))
    -[BCSChatSuggestMessage setTintColor:](self, "setTintColor:");
  if ((*((_BYTE *)v5 + 124) & 2) != 0)
  {
    self->_isVerified = *((_BYTE *)v5 + 120);
    *(_BYTE *)&self->_has |= 2u;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = *((id *)v5 + 4);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        -[BCSChatSuggestMessage addCallToActions:](self, "addCallToActions:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = *((id *)v5 + 13);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[BCSChatSuggestMessage addVisibilities:](self, "addVisibilities:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * m), (_QWORD)v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

  if (*((_QWORD *)v5 + 7))
    -[BCSChatSuggestMessage setIntentId:](self, "setIntentId:");
  if (*((_QWORD *)v5 + 6))
    -[BCSChatSuggestMessage setGroup:](self, "setGroup:");

}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSString)bizId
{
  return self->_bizId;
}

- (void)setBizId:(id)a3
{
  objc_storeStrong((id *)&self->_bizId, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableArray)chatOpenHours
{
  return self->_chatOpenHours;
}

- (void)setChatOpenHours:(id)a3
{
  objc_storeStrong((id *)&self->_chatOpenHours, a3);
}

- (NSMutableArray)phoneOpenHours
{
  return self->_phoneOpenHours;
}

- (void)setPhoneOpenHours:(id)a3
{
  objc_storeStrong((id *)&self->_phoneOpenHours, a3);
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSString)squareLogoUrl
{
  return self->_squareLogoUrl;
}

- (void)setSquareLogoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_squareLogoUrl, a3);
}

- (NSString)wideLogoUrl
{
  return self->_wideLogoUrl;
}

- (void)setWideLogoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_wideLogoUrl, a3);
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NSString)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (NSMutableArray)callToActions
{
  return self->_callToActions;
}

- (void)setCallToActions:(id)a3
{
  objc_storeStrong((id *)&self->_callToActions, a3);
}

- (NSMutableArray)visibilities
{
  return self->_visibilities;
}

- (void)setVisibilities:(id)a3
{
  objc_storeStrong((id *)&self->_visibilities, a3);
}

- (NSString)intentId
{
  return self->_intentId;
}

- (void)setIntentId:(id)a3
{
  objc_storeStrong((id *)&self->_intentId, a3);
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wideLogoUrl, 0);
  objc_storeStrong((id *)&self->_visibilities, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_squareLogoUrl, 0);
  objc_storeStrong((id *)&self->_phoneOpenHours, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_chatOpenHours, 0);
  objc_storeStrong((id *)&self->_callToActions, 0);
  objc_storeStrong((id *)&self->_bizId, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end

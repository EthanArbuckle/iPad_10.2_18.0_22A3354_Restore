@implementation NSSLocalesInfoRespMsg

- (void)clearSystemLanguages
{
  -[NSMutableArray removeAllObjects](self->_systemLanguages, "removeAllObjects");
}

- (void)addSystemLanguages:(id)a3
{
  id v4;
  NSMutableArray *systemLanguages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  systemLanguages = self->_systemLanguages;
  v8 = v4;
  if (!systemLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_systemLanguages;
    self->_systemLanguages = v6;

    v4 = v8;
    systemLanguages = self->_systemLanguages;
  }
  -[NSMutableArray addObject:](systemLanguages, "addObject:", v4);

}

- (unint64_t)systemLanguagesCount
{
  return -[NSMutableArray count](self->_systemLanguages, "count");
}

- (id)systemLanguagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_systemLanguages, "objectAtIndex:", a3);
}

+ (Class)systemLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)clearLocaleIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_localeIdentifiers, "removeAllObjects");
}

- (void)addLocaleIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *localeIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  localeIdentifiers = self->_localeIdentifiers;
  v8 = v4;
  if (!localeIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_localeIdentifiers;
    self->_localeIdentifiers = v6;

    v4 = v8;
    localeIdentifiers = self->_localeIdentifiers;
  }
  -[NSMutableArray addObject:](localeIdentifiers, "addObject:", v4);

}

- (unint64_t)localeIdentifiersCount
{
  return -[NSMutableArray count](self->_localeIdentifiers, "count");
}

- (id)localeIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_localeIdentifiers, "objectAtIndex:", a3);
}

+ (Class)localeIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (void)clearSupportedCalendars
{
  -[NSMutableArray removeAllObjects](self->_supportedCalendars, "removeAllObjects");
}

- (void)addSupportedCalendars:(id)a3
{
  id v4;
  NSMutableArray *supportedCalendars;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  supportedCalendars = self->_supportedCalendars;
  v8 = v4;
  if (!supportedCalendars)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_supportedCalendars;
    self->_supportedCalendars = v6;

    v4 = v8;
    supportedCalendars = self->_supportedCalendars;
  }
  -[NSMutableArray addObject:](supportedCalendars, "addObject:", v4);

}

- (unint64_t)supportedCalendarsCount
{
  return -[NSMutableArray count](self->_supportedCalendars, "count");
}

- (id)supportedCalendarsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedCalendars, "objectAtIndex:", a3);
}

+ (Class)supportedCalendarsType
{
  return (Class)objc_opt_class();
}

- (void)clearDefaultCalendars
{
  -[NSMutableArray removeAllObjects](self->_defaultCalendars, "removeAllObjects");
}

- (void)addDefaultCalendars:(id)a3
{
  id v4;
  NSMutableArray *defaultCalendars;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  defaultCalendars = self->_defaultCalendars;
  v8 = v4;
  if (!defaultCalendars)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_defaultCalendars;
    self->_defaultCalendars = v6;

    v4 = v8;
    defaultCalendars = self->_defaultCalendars;
  }
  -[NSMutableArray addObject:](defaultCalendars, "addObject:", v4);

}

- (unint64_t)defaultCalendarsCount
{
  return -[NSMutableArray count](self->_defaultCalendars, "count");
}

- (id)defaultCalendarsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_defaultCalendars, "objectAtIndex:", a3);
}

+ (Class)defaultCalendarsType
{
  return (Class)objc_opt_class();
}

- (void)clearNumberingSystems
{
  -[NSMutableArray removeAllObjects](self->_numberingSystems, "removeAllObjects");
}

- (void)addNumberingSystems:(id)a3
{
  id v4;
  NSMutableArray *numberingSystems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  numberingSystems = self->_numberingSystems;
  v8 = v4;
  if (!numberingSystems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_numberingSystems;
    self->_numberingSystems = v6;

    v4 = v8;
    numberingSystems = self->_numberingSystems;
  }
  -[NSMutableArray addObject:](numberingSystems, "addObject:", v4);

}

- (unint64_t)numberingSystemsCount
{
  return -[NSMutableArray count](self->_numberingSystems, "count");
}

- (id)numberingSystemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_numberingSystems, "objectAtIndex:", a3);
}

+ (Class)numberingSystemsType
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
  v8.super_class = (Class)NSSLocalesInfoRespMsg;
  -[NSSLocalesInfoRespMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSLocalesInfoRespMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *systemLanguages;
  NSMutableArray *localeIdentifiers;
  NSString *buildVersion;
  NSMutableArray *supportedCalendars;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
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

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  systemLanguages = self->_systemLanguages;
  if (systemLanguages)
    objc_msgSend(v3, "setObject:forKey:", systemLanguages, CFSTR("systemLanguages"));
  localeIdentifiers = self->_localeIdentifiers;
  if (localeIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", localeIdentifiers, CFSTR("localeIdentifiers"));
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v4, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  supportedCalendars = self->_supportedCalendars;
  if (supportedCalendars)
    objc_msgSend(v4, "setObject:forKey:", supportedCalendars, CFSTR("supportedCalendars"));
  if (-[NSMutableArray count](self->_defaultCalendars, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_defaultCalendars, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = self->_defaultCalendars;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("defaultCalendars"));
  }
  if (-[NSMutableArray count](self->_numberingSystems, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_numberingSystems, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = self->_numberingSystems;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("numberingSystems"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLocalesInfoRespMsgReadFrom(self, (uint64_t)a3);
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
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->_systemLanguages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_localeIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  if (self->_buildVersion)
    PBDataWriterWriteStringField();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_supportedCalendars;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_defaultCalendars;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_numberingSystems;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  id v24;

  v24 = a3;
  if (-[NSSLocalesInfoRespMsg systemLanguagesCount](self, "systemLanguagesCount"))
  {
    objc_msgSend(v24, "clearSystemLanguages");
    v4 = -[NSSLocalesInfoRespMsg systemLanguagesCount](self, "systemLanguagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSSLocalesInfoRespMsg systemLanguagesAtIndex:](self, "systemLanguagesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSystemLanguages:", v7);

      }
    }
  }
  if (-[NSSLocalesInfoRespMsg localeIdentifiersCount](self, "localeIdentifiersCount"))
  {
    objc_msgSend(v24, "clearLocaleIdentifiers");
    v8 = -[NSSLocalesInfoRespMsg localeIdentifiersCount](self, "localeIdentifiersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NSSLocalesInfoRespMsg localeIdentifiersAtIndex:](self, "localeIdentifiersAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addLocaleIdentifiers:", v11);

      }
    }
  }
  if (self->_buildVersion)
    objc_msgSend(v24, "setBuildVersion:");
  if (-[NSSLocalesInfoRespMsg supportedCalendarsCount](self, "supportedCalendarsCount"))
  {
    objc_msgSend(v24, "clearSupportedCalendars");
    v12 = -[NSSLocalesInfoRespMsg supportedCalendarsCount](self, "supportedCalendarsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NSSLocalesInfoRespMsg supportedCalendarsAtIndex:](self, "supportedCalendarsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSupportedCalendars:", v15);

      }
    }
  }
  if (-[NSSLocalesInfoRespMsg defaultCalendarsCount](self, "defaultCalendarsCount"))
  {
    objc_msgSend(v24, "clearDefaultCalendars");
    v16 = -[NSSLocalesInfoRespMsg defaultCalendarsCount](self, "defaultCalendarsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[NSSLocalesInfoRespMsg defaultCalendarsAtIndex:](self, "defaultCalendarsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addDefaultCalendars:", v19);

      }
    }
  }
  if (-[NSSLocalesInfoRespMsg numberingSystemsCount](self, "numberingSystemsCount"))
  {
    objc_msgSend(v24, "clearNumberingSystems");
    v20 = -[NSSLocalesInfoRespMsg numberingSystemsCount](self, "numberingSystemsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[NSSLocalesInfoRespMsg numberingSystemsAtIndex:](self, "numberingSystemsAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addNumberingSystems:", v23);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
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
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v6 = self->_systemLanguages;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v56;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addSystemLanguages:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v8);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v12 = self->_localeIdentifiers;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v52;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addLocaleIdentifiers:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  v19 = (void *)v5[1];
  v5[1] = v18;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = self->_supportedCalendars;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v48;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend(v5, "addSupportedCalendars:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v22);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = self->_defaultCalendars;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v44;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v30), "copyWithZone:", a3);
        objc_msgSend(v5, "addDefaultCalendars:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v28);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = self->_numberingSystems;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v40;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v36), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend(v5, "addNumberingSystems:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v34);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *systemLanguages;
  NSMutableArray *localeIdentifiers;
  NSString *buildVersion;
  NSMutableArray *supportedCalendars;
  NSMutableArray *defaultCalendars;
  NSMutableArray *numberingSystems;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((systemLanguages = self->_systemLanguages, !((unint64_t)systemLanguages | v4[6]))
     || -[NSMutableArray isEqual:](systemLanguages, "isEqual:"))
    && ((localeIdentifiers = self->_localeIdentifiers, !((unint64_t)localeIdentifiers | v4[3]))
     || -[NSMutableArray isEqual:](localeIdentifiers, "isEqual:"))
    && ((buildVersion = self->_buildVersion, !((unint64_t)buildVersion | v4[1]))
     || -[NSString isEqual:](buildVersion, "isEqual:"))
    && ((supportedCalendars = self->_supportedCalendars, !((unint64_t)supportedCalendars | v4[5]))
     || -[NSMutableArray isEqual:](supportedCalendars, "isEqual:"))
    && ((defaultCalendars = self->_defaultCalendars, !((unint64_t)defaultCalendars | v4[2]))
     || -[NSMutableArray isEqual:](defaultCalendars, "isEqual:")))
  {
    numberingSystems = self->_numberingSystems;
    if ((unint64_t)numberingSystems | v4[4])
      v11 = -[NSMutableArray isEqual:](numberingSystems, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSMutableArray hash](self->_systemLanguages, "hash");
  v4 = -[NSMutableArray hash](self->_localeIdentifiers, "hash") ^ v3;
  v5 = -[NSString hash](self->_buildVersion, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_supportedCalendars, "hash");
  v7 = -[NSMutableArray hash](self->_defaultCalendars, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_numberingSystems, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = v4[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        -[NSSLocalesInfoRespMsg addSystemLanguages:](self, "addSystemLanguages:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v4[3];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        -[NSSLocalesInfoRespMsg addLocaleIdentifiers:](self, "addLocaleIdentifiers:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  if (v4[1])
    -[NSSLocalesInfoRespMsg setBuildVersion:](self, "setBuildVersion:");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v4[5];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        -[NSSLocalesInfoRespMsg addSupportedCalendars:](self, "addSupportedCalendars:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v4[2];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        -[NSSLocalesInfoRespMsg addDefaultCalendars:](self, "addDefaultCalendars:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v4[4];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[NSSLocalesInfoRespMsg addNumberingSystems:](self, "addNumberingSystems:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * n), (_QWORD)v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

}

- (NSMutableArray)systemLanguages
{
  return self->_systemLanguages;
}

- (void)setSystemLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_systemLanguages, a3);
}

- (NSMutableArray)localeIdentifiers
{
  return self->_localeIdentifiers;
}

- (void)setLocaleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifiers, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSMutableArray)supportedCalendars
{
  return self->_supportedCalendars;
}

- (void)setSupportedCalendars:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCalendars, a3);
}

- (NSMutableArray)defaultCalendars
{
  return self->_defaultCalendars;
}

- (void)setDefaultCalendars:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCalendars, a3);
}

- (NSMutableArray)numberingSystems
{
  return self->_numberingSystems;
}

- (void)setNumberingSystems:(id)a3
{
  objc_storeStrong((id *)&self->_numberingSystems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguages, 0);
  objc_storeStrong((id *)&self->_supportedCalendars, 0);
  objc_storeStrong((id *)&self->_numberingSystems, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultCalendars, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end

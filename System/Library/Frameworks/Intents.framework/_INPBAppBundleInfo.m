@implementation _INPBAppBundleInfo

- (void)setAppId:(id)a3
{
  objc_storeStrong((id *)&self->_appId, a3);
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)setBuildId:(id)a3
{
  objc_storeStrong((id *)&self->_buildId, a3);
}

- (BOOL)hasBuildId
{
  return self->_buildId != 0;
}

- (void)setIntentSupports:(id)a3
{
  NSArray *v4;
  NSArray *intentSupports;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentSupports = self->_intentSupports;
  self->_intentSupports = v4;

}

- (void)clearIntentSupports
{
  -[NSArray removeAllObjects](self->_intentSupports, "removeAllObjects");
}

- (void)addIntentSupport:(id)a3
{
  id v4;
  NSArray *intentSupports;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentSupports = self->_intentSupports;
  v8 = v4;
  if (!intentSupports)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentSupports;
    self->_intentSupports = v6;

    v4 = v8;
    intentSupports = self->_intentSupports;
  }
  -[NSArray addObject:](intentSupports, "addObject:", v4);

}

- (unint64_t)intentSupportsCount
{
  return -[NSArray count](self->_intentSupports, "count");
}

- (id)intentSupportAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentSupports, "objectAtIndexedSubscript:", a3);
}

- (void)setLocalizedProjects:(id)a3
{
  NSArray *v4;
  NSArray *localizedProjects;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  localizedProjects = self->_localizedProjects;
  self->_localizedProjects = v4;

}

- (void)clearLocalizedProjects
{
  -[NSArray removeAllObjects](self->_localizedProjects, "removeAllObjects");
}

- (void)addLocalizedProjects:(id)a3
{
  id v4;
  NSArray *localizedProjects;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  localizedProjects = self->_localizedProjects;
  v8 = v4;
  if (!localizedProjects)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_localizedProjects;
    self->_localizedProjects = v6;

    v4 = v8;
    localizedProjects = self->_localizedProjects;
  }
  -[NSArray addObject:](localizedProjects, "addObject:", v4);

}

- (unint64_t)localizedProjectsCount
{
  return -[NSArray count](self->_localizedProjects, "count");
}

- (id)localizedProjectsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_localizedProjects, "objectAtIndexedSubscript:", a3);
}

- (void)setSupportedPlatforms:(id)a3
{
  NSArray *v4;
  NSArray *supportedPlatforms;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  supportedPlatforms = self->_supportedPlatforms;
  self->_supportedPlatforms = v4;

}

- (void)clearSupportedPlatforms
{
  -[NSArray removeAllObjects](self->_supportedPlatforms, "removeAllObjects");
}

- (void)addSupportedPlatforms:(id)a3
{
  id v4;
  NSArray *supportedPlatforms;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  supportedPlatforms = self->_supportedPlatforms;
  v8 = v4;
  if (!supportedPlatforms)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_supportedPlatforms;
    self->_supportedPlatforms = v6;

    v4 = v8;
    supportedPlatforms = self->_supportedPlatforms;
  }
  -[NSArray addObject:](supportedPlatforms, "addObject:", v4);

}

- (unint64_t)supportedPlatformsCount
{
  return -[NSArray count](self->_supportedPlatforms, "count");
}

- (id)supportedPlatformsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_supportedPlatforms, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppBundleInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
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
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBAppBundleInfo appId](self, "appId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBAppBundleInfo appId](self, "appId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAppBundleInfo buildId](self, "buildId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBAppBundleInfo buildId](self, "buildId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = self->_intentSupports;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_localizedProjects;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v16);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = self->_supportedPlatforms;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v21);
  }

}

- (_INPBAppBundleInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAppBundleInfo *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAppBundleInfo *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAppBundleInfo *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAppBundleInfo initWithData:](self, "initWithData:", v6);

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
  -[_INPBAppBundleInfo data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAppBundleInfo *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[_INPBAppBundleInfo init](+[_INPBAppBundleInfo allocWithZone:](_INPBAppBundleInfo, "allocWithZone:"), "init");
  v6 = -[_INPBAppId copyWithZone:](self->_appId, "copyWithZone:", a3);
  -[_INPBAppBundleInfo setAppId:](v5, "setAppId:", v6);

  v7 = -[_INPBBuildId copyWithZone:](self->_buildId, "copyWithZone:", a3);
  -[_INPBAppBundleInfo setBuildId:](v5, "setBuildId:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_intentSupports, "copyWithZone:", a3);
  -[_INPBAppBundleInfo setIntentSupports:](v5, "setIntentSupports:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_localizedProjects, "copyWithZone:", a3);
  -[_INPBAppBundleInfo setLocalizedProjects:](v5, "setLocalizedProjects:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_supportedPlatforms, "copyWithZone:", a3);
  -[_INPBAppBundleInfo setSupportedPlatforms:](v5, "setSupportedPlatforms:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBAppBundleInfo appId](self, "appId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAppBundleInfo appId](self, "appId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAppBundleInfo appId](self, "appId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAppBundleInfo buildId](self, "buildId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAppBundleInfo buildId](self, "buildId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAppBundleInfo buildId](self, "buildId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAppBundleInfo intentSupports](self, "intentSupports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentSupports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAppBundleInfo intentSupports](self, "intentSupports");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBAppBundleInfo intentSupports](self, "intentSupports");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentSupports");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAppBundleInfo localizedProjects](self, "localizedProjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedProjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBAppBundleInfo localizedProjects](self, "localizedProjects");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBAppBundleInfo localizedProjects](self, "localizedProjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedProjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBAppBundleInfo supportedPlatforms](self, "supportedPlatforms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedPlatforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAppBundleInfo supportedPlatforms](self, "supportedPlatforms");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBAppBundleInfo supportedPlatforms](self, "supportedPlatforms");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supportedPlatforms");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[_INPBAppId hash](self->_appId, "hash");
  v4 = -[_INPBBuildId hash](self->_buildId, "hash") ^ v3;
  v5 = -[NSArray hash](self->_intentSupports, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_localizedProjects, "hash");
  return v6 ^ -[NSArray hash](self->_supportedPlatforms, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
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
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBAppBundleInfo appId](self, "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("app_id"));

  -[_INPBAppBundleInfo buildId](self, "buildId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("build_id"));

  if (-[NSArray count](self->_intentSupports, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v9 = self->_intentSupports;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v13), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("intent_support"));
  }
  if (-[NSArray count](self->_localizedProjects, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = self->_localizedProjects;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v20), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("localized_projects"));
  }
  if (-[NSArray count](self->_supportedPlatforms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = self->_supportedPlatforms;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "dictionaryRepresentation", (_QWORD)v30);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("supported_platforms"));
  }
  return v3;
}

- (_INPBAppId)appId
{
  return self->_appId;
}

- (_INPBBuildId)buildId
{
  return self->_buildId;
}

- (NSArray)intentSupports
{
  return self->_intentSupports;
}

- (NSArray)localizedProjects
{
  return self->_localizedProjects;
}

- (NSArray)supportedPlatforms
{
  return self->_supportedPlatforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPlatforms, 0);
  objc_storeStrong((id *)&self->_localizedProjects, 0);
  objc_storeStrong((id *)&self->_intentSupports, 0);
  objc_storeStrong((id *)&self->_buildId, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

+ (Class)intentSupportType
{
  return (Class)objc_opt_class();
}

+ (Class)localizedProjectsType
{
  return (Class)objc_opt_class();
}

+ (Class)supportedPlatformsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

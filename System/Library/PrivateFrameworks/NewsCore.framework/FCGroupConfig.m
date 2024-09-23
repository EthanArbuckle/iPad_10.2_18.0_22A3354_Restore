@implementation FCGroupConfig

- (FCGroupConfig)initWithDictionary:(id)a3
{
  id v4;
  FCGroupConfig *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *dictionary;
  void *v18;
  void *v19;
  uint64_t v20;
  FCColor *groupTitleColor;
  void *v22;
  void *v23;
  uint64_t v24;
  FCColor *groupDarkStyleTitleColor;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  FCGroupFont *v37;
  void *v38;
  void *v39;
  FCGroupFont *v40;
  NSArray *groupFonts;
  void *v43;
  void *v44;
  void *v45;
  FCGroupConfig *v46;
  id v47;
  id obj;
  NSArray *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)FCGroupConfig;
  v5 = -[FCGroupConfig init](&v54, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scheduledContent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scheduledLocalDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 1;
    v47 = v4;
    v43 = (void *)v8;
    v44 = v7;
    if (!v9)
    {
      v10 = v8;
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatterWithFormat:forReuse:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateFromString:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "fc_isLaterThan:", v12);

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v7, v6);
          v15 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v15;
        }
      }

    }
    v45 = v6;
    v16 = objc_msgSend(v6, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v16;

    -[FCGroupConfig dictionary](v5, "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("groupTitleColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    groupTitleColor = v5->_groupTitleColor;
    v5->_groupTitleColor = (FCColor *)v20;

    -[FCGroupConfig dictionary](v5, "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("groupAlternateTitleColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    groupDarkStyleTitleColor = v5->_groupDarkStyleTitleColor;
    v5->_groupDarkStyleTitleColor = (FCColor *)v24;

    -[FCGroupConfig dictionary](v5, "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("cutoffTimeSecs"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cutoffTimeSecs = objc_msgSend(v27, "unsignedIntegerValue");

    -[FCGroupConfig dictionary](v5, "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("cutoffCount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cutoffCount = objc_msgSend(v29, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v46 = v5;
    -[FCGroupConfig dictionary](v5, "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("groupFonts"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v31;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v51;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v51 != v34)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v35);
          v37 = [FCGroupFont alloc];
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("name"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("url"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[FCGroupFont initWithName:urlString:](v37, "initWithName:urlString:", v38, v39);

          if (v40)
            -[NSArray addObject:](v49, "addObject:", v40);

          ++v35;
        }
        while (v33 != v35);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v33);
    }

    v5 = v46;
    groupFonts = v46->_groupFonts;
    v46->_groupFonts = v49;

    v4 = v47;
  }

  return v5;
}

- (NSString)articleListID
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("articleListID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)groupName
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)groupSubtitle
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupSubtitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)groupTitleFontName
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupTitleFontName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)groupTitleFontSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  -[FCGroupConfig dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupTitleFontSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1.79769313e308;
  -[FCGroupConfig dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupTitleFontSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (double)groupTitleOffsetY
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupTitleOffsetY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)groupTitleOffsetYiPad
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupTitleOffsetYiPad"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)groupTitleOffsetHeight
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupTitleOffsetHeight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)groupTitleOffsetHeightiPad
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupTitleOffsetHeightiPad"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)groupTitleFontSizeiPad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  -[FCGroupConfig dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupTitleFontSizeiPad"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1.79769313e308;
  -[FCGroupConfig dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupTitleFontSizeiPad"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (double)groupTitleFontTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  -[FCGroupConfig dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupTitleFontTracking"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1.79769313e308;
  -[FCGroupConfig dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupTitleFontTracking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (double)groupTitleFontTrackingiPad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  -[FCGroupConfig dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupTitleFontTrackingiPad"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1.79769313e308;
  -[FCGroupConfig dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupTitleFontTrackingiPad"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (NSString)groupActionTitle
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupActionTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)groupActionURLString
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupActionUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sectionID
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sectionID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)channelID
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("channelID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)feedID
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("feedID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCColor)groupTitleColor
{
  return self->_groupTitleColor;
}

- (void)setGroupTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_groupTitleColor, a3);
}

- (FCColor)groupDarkStyleTitleColor
{
  return self->_groupDarkStyleTitleColor;
}

- (void)setGroupDarkStyleTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_groupDarkStyleTitleColor, a3);
}

- (NSArray)groupFonts
{
  return self->_groupFonts;
}

- (void)setGroupFonts:(id)a3
{
  objc_storeStrong((id *)&self->_groupFonts, a3);
}

- (unint64_t)cutoffTimeSecs
{
  return self->_cutoffTimeSecs;
}

- (void)setCutoffTimeSecs:(unint64_t)a3
{
  self->_cutoffTimeSecs = a3;
}

- (unint64_t)cutoffCount
{
  return self->_cutoffCount;
}

- (void)setCutoffCount:(unint64_t)a3
{
  self->_cutoffCount = a3;
}

- (FCColorGradient)groupBackgroundColorGradient
{
  return self->_groupBackgroundColorGradient;
}

- (void)setGroupBackgroundColorGradient:(id)a3
{
  objc_storeStrong((id *)&self->_groupBackgroundColorGradient, a3);
}

- (FCColorGradient)groupDarkStyleBackgroundColorGradient
{
  return self->_groupDarkStyleBackgroundColorGradient;
}

- (void)setGroupDarkStyleBackgroundColorGradient:(id)a3
{
  objc_storeStrong((id *)&self->_groupDarkStyleBackgroundColorGradient, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (NSDictionary)articleMetadataByArticleID
{
  return self->_articleMetadataByArticleID;
}

- (void)setArticleMetadataByArticleID:(id)a3
{
  objc_storeStrong((id *)&self->_articleMetadataByArticleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleMetadataByArticleID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleBackgroundColorGradient, 0);
  objc_storeStrong((id *)&self->_groupBackgroundColorGradient, 0);
  objc_storeStrong((id *)&self->_groupFonts, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleTitleColor, 0);
  objc_storeStrong((id *)&self->_groupTitleColor, 0);
}

@end

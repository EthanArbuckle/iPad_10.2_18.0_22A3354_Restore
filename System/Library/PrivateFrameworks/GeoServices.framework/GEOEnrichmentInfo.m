@implementation GEOEnrichmentInfo

- (GEOEnrichmentInfo)initWithEnrichmentInfo:(id)a3
{
  id *v5;
  GEOEnrichmentInfo *v6;
  GEOEnrichmentInfo *v7;
  uint64_t v8;
  NSString *sourceName;
  uint64_t v10;
  NSString *sourceId;
  uint64_t v12;
  NSString *showcaseId;
  void *v14;
  uint64_t v15;
  NSString *showcaseSharingTitle;
  void *v17;
  uint64_t v18;
  NSString *showcaseSharingSubtitle;
  void *v20;
  uint64_t v21;
  NSString *showcaseSharingImageUrl;
  objc_super v24;

  v5 = (id *)a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOEnrichmentInfo;
  v6 = -[GEOEnrichmentInfo init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_enrichmentInfo, a3);
    -[GEOPDEnrichmentInfo sourceName](v5);
    v8 = objc_claimAutoreleasedReturnValue();
    sourceName = v7->_sourceName;
    v7->_sourceName = (NSString *)v8;

    -[GEOPDEnrichmentInfo sourceId](v5);
    v10 = objc_claimAutoreleasedReturnValue();
    sourceId = v7->_sourceId;
    v7->_sourceId = (NSString *)v10;

    -[GEOPDEnrichmentInfo showcaseId](v5);
    v12 = objc_claimAutoreleasedReturnValue();
    showcaseId = v7->_showcaseId;
    v7->_showcaseId = (NSString *)v12;

    -[GEOPDEnrichmentInfo poiNames](v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v14, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    showcaseSharingTitle = v7->_showcaseSharingTitle;
    v7->_showcaseSharingTitle = (NSString *)v15;

    -[GEOPDEnrichmentInfo showcaseTitles](v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v17, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    showcaseSharingSubtitle = v7->_showcaseSharingSubtitle;
    v7->_showcaseSharingSubtitle = (NSString *)v18;

    -[GEOPDEnrichmentInfo showcaseImageUrls](v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = objc_claimAutoreleasedReturnValue();
    showcaseSharingImageUrl = v7->_showcaseSharingImageUrl;
    v7->_showcaseSharingImageUrl = (NSString *)v21;

  }
  return v7;
}

- (id)pdEnrichmentInfo
{
  return self->_enrichmentInfo;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Showcase ID: %@, Source Name: %@, Source ID: %@, Title: %@, Subtitle: %@, ImageURL:%@"), self->_showcaseId, self->_sourceName, self->_sourceId, self->_showcaseSharingTitle, self->_showcaseSharingSubtitle, self->_showcaseSharingImageUrl);
}

- (BOOL)isEqual:(id)a3
{
  GEOEnrichmentInfo *v4;
  GEOEnrichmentInfo *v5;
  GEOEnrichmentInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (GEOEnrichmentInfo *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[GEOEnrichmentInfo showcaseId](self, "showcaseId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOEnrichmentInfo showcaseId](v6, "showcaseId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[GEOEnrichmentInfo sourceId](self, "sourceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOEnrichmentInfo sourceId](v6, "sourceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[GEOEnrichmentInfo sourceName](self, "sourceName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOEnrichmentInfo sourceName](v6, "sourceName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOPDEnrichmentInfo copyWithZone:](self->_enrichmentInfo, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_sourceName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_sourceId, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_showcaseId, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_showcaseSharingTitle, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSString copyWithZone:](self->_showcaseSharingSubtitle, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSString copyWithZone:](self->_showcaseSharingImageUrl, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (NSString)showcaseId
{
  return self->_showcaseId;
}

- (NSString)showcaseSharingTitle
{
  return self->_showcaseSharingTitle;
}

- (NSString)showcaseSharingSubtitle
{
  return self->_showcaseSharingSubtitle;
}

- (NSString)showcaseSharingImageUrl
{
  return self->_showcaseSharingImageUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showcaseSharingImageUrl, 0);
  objc_storeStrong((id *)&self->_showcaseSharingSubtitle, 0);
  objc_storeStrong((id *)&self->_showcaseSharingTitle, 0);
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
}

@end

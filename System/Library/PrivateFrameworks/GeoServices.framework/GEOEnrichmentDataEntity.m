@implementation GEOEnrichmentDataEntity

- (GEOEnrichmentDataEntity)initWithEnrichmentDataEntity:(id)a3
{
  id *v5;
  GEOEnrichmentDataEntity *v6;
  GEOEnrichmentInfo *v7;
  void *v8;
  uint64_t v9;
  GEOEnrichmentInfo *enrichmentInfo;
  uint64_t v11;
  NSString *enrichmentHtml;
  uint64_t v13;
  NSData *enrichmentMetadata;
  void *v15;
  uint64_t v16;
  NSArray *appAdamIds;
  objc_super v19;

  v5 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOEnrichmentDataEntity;
  v6 = -[GEOEnrichmentDataEntity init](&v19, sel_init);
  if (v6)
  {
    v7 = [GEOEnrichmentInfo alloc];
    -[GEOPDEnrichmentDataEntity enrichmentInfo](v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GEOEnrichmentInfo initWithEnrichmentInfo:](v7, "initWithEnrichmentInfo:", v8);
    enrichmentInfo = v6->_enrichmentInfo;
    v6->_enrichmentInfo = (GEOEnrichmentInfo *)v9;

    -[GEOPDEnrichmentDataEntity html](v5);
    v11 = objc_claimAutoreleasedReturnValue();
    enrichmentHtml = v6->_enrichmentHtml;
    v6->_enrichmentHtml = (NSString *)v11;

    -[GEOPDEnrichmentDataEntity enrichmentMetadata](v5);
    v13 = objc_claimAutoreleasedReturnValue();
    enrichmentMetadata = v6->_enrichmentMetadata;
    v6->_enrichmentMetadata = (NSData *)v13;

    objc_storeStrong((id *)&v6->_enrichmentDataEntity, a3);
    -[GEOPDEnrichmentDataEntity adamIds](v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    appAdamIds = v6->_appAdamIds;
    v6->_appAdamIds = (NSArray *)v16;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  GEOEnrichmentDataEntity *v4;
  GEOEnrichmentDataEntity *v5;
  BOOL v6;

  v4 = (GEOEnrichmentDataEntity *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[GEOPDEnrichmentDataEntity isEqual:](self->_enrichmentDataEntity, "isEqual:", v5->_enrichmentDataEntity);

  return v6;
}

- (unint64_t)hash
{
  return -[GEOPDEnrichmentDataEntity hash](self->_enrichmentDataEntity, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOEnrichmentInfo showcaseId](self->_enrichmentInfo, "showcaseId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray description](self->_appAdamIds, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Showcase Id: %@, App Adam IDs: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return self->_enrichmentInfo;
}

- (NSString)enrichmentHtml
{
  return self->_enrichmentHtml;
}

- (NSData)enrichmentMetadata
{
  return self->_enrichmentMetadata;
}

- (NSArray)appAdamIds
{
  return self->_appAdamIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAdamIds, 0);
  objc_storeStrong((id *)&self->_enrichmentMetadata, 0);
  objc_storeStrong((id *)&self->_enrichmentHtml, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_enrichmentDataEntity, 0);
}

@end

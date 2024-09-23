@implementation HDCachedQueryMetadata

- (HDCachedQueryMetadata)initWithCachingIdentifier:(id)a3 sourceEntityPersistentID:(int64_t)a4 buildVersion:(id)a5 anchorDate:(id)a6 intervalComponents:(id)a7
{
  return -[HDCachedQueryMetadata initWithCachingIdentifier:sourceEntityPersistentID:maxAnchor:queryStartIndex:queryEndIndex:generationNumber:buildVersion:anchorDate:intervalComponents:](self, "initWithCachingIdentifier:sourceEntityPersistentID:maxAnchor:queryStartIndex:queryEndIndex:generationNumber:buildVersion:anchorDate:intervalComponents:", a3, a4, 0, 0, 0, 0, a5, a6, a7);
}

- (HDCachedQueryMetadata)initWithCachingIdentifier:(id)a3 sourceEntityPersistentID:(int64_t)a4 maxAnchor:(int64_t)a5 queryStartIndex:(id)a6 queryEndIndex:(id)a7 generationNumber:(int64_t)a8 buildVersion:(id)a9 anchorDate:(id)a10 intervalComponents:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  HDCachedQueryMetadata *v21;
  uint64_t v22;
  NSString *cachingIdentifier;
  uint64_t v24;
  NSString *buildVersion;
  uint64_t v26;
  NSDate *anchorDate;
  uint64_t v28;
  NSDateComponents *intervalComponents;
  void *v31;
  id v33;
  id v34;
  objc_super v35;

  v17 = a3;
  v34 = a6;
  v33 = a7;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCachedQueryMetadataEntity.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cachingIdentifier != nil"));

  }
  v35.receiver = self;
  v35.super_class = (Class)HDCachedQueryMetadata;
  v21 = -[HDCachedQueryMetadata init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v17, "copy");
    cachingIdentifier = v21->_cachingIdentifier;
    v21->_cachingIdentifier = (NSString *)v22;

    v21->_sourceEntityPersistentID = a4;
    v21->_maxAnchor = a5;
    objc_storeStrong((id *)&v21->_queryStartIndex, a6);
    objc_storeStrong((id *)&v21->_queryEndIndex, a7);
    v21->_generationNumber = a8;
    v24 = objc_msgSend(v18, "copy");
    buildVersion = v21->_buildVersion;
    v21->_buildVersion = (NSString *)v24;

    v26 = objc_msgSend(v19, "copy");
    anchorDate = v21->_anchorDate;
    v21->_anchorDate = (NSDate *)v26;

    v28 = objc_msgSend(v20, "copy");
    intervalComponents = v21->_intervalComponents;
    v21->_intervalComponents = (NSDateComponents *)v28;

  }
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  HDCachedQueryMetadata *v4;
  HDCachedQueryMetadata *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;

  v4 = (HDCachedQueryMetadata *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HDCachedQueryMetadata cachingIdentifier](self, "cachingIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCachedQueryMetadata cachingIdentifier](v5, "cachingIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HDCachedQueryMetadata cachingIdentifier](v5, "cachingIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_37;
        v10 = (void *)v9;
        -[HDCachedQueryMetadata cachingIdentifier](self, "cachingIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCachedQueryMetadata cachingIdentifier](v5, "cachingIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_38;
      }
      v15 = -[HDCachedQueryMetadata sourceEntityPersistentID](self, "sourceEntityPersistentID");
      if (v15 != -[HDCachedQueryMetadata sourceEntityPersistentID](v5, "sourceEntityPersistentID"))
        goto LABEL_38;
      v16 = -[HDCachedQueryMetadata maxAnchor](self, "maxAnchor");
      if (v16 != -[HDCachedQueryMetadata maxAnchor](v5, "maxAnchor"))
        goto LABEL_38;
      -[HDCachedQueryMetadata queryStartIndex](self, "queryStartIndex");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCachedQueryMetadata queryStartIndex](v5, "queryStartIndex");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v17)
      {

      }
      else
      {
        v8 = (void *)v17;
        -[HDCachedQueryMetadata queryStartIndex](v5, "queryStartIndex");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_37;
        v19 = (void *)v18;
        -[HDCachedQueryMetadata queryStartIndex](self, "queryStartIndex");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCachedQueryMetadata queryStartIndex](v5, "queryStartIndex");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqual:", v21);

        if (!v22)
          goto LABEL_38;
      }
      -[HDCachedQueryMetadata queryEndIndex](self, "queryEndIndex");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCachedQueryMetadata queryEndIndex](v5, "queryEndIndex");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v23)
      {

      }
      else
      {
        v8 = (void *)v23;
        -[HDCachedQueryMetadata queryEndIndex](v5, "queryEndIndex");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_37;
        v25 = (void *)v24;
        -[HDCachedQueryMetadata queryEndIndex](self, "queryEndIndex");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCachedQueryMetadata queryEndIndex](v5, "queryEndIndex");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqual:", v27);

        if (!v28)
          goto LABEL_38;
      }
      v29 = -[HDCachedQueryMetadata generationNumber](self, "generationNumber");
      if (v29 != -[HDCachedQueryMetadata generationNumber](v5, "generationNumber"))
        goto LABEL_38;
      -[HDCachedQueryMetadata buildVersion](self, "buildVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCachedQueryMetadata buildVersion](v5, "buildVersion");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v30)
      {

      }
      else
      {
        v8 = (void *)v30;
        -[HDCachedQueryMetadata buildVersion](v5, "buildVersion");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31)
          goto LABEL_37;
        v32 = (void *)v31;
        -[HDCachedQueryMetadata buildVersion](self, "buildVersion");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCachedQueryMetadata buildVersion](v5, "buildVersion");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "isEqualToString:", v34);

        if (!v35)
          goto LABEL_38;
      }
      -[HDCachedQueryMetadata anchorDate](self, "anchorDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCachedQueryMetadata anchorDate](v5, "anchorDate");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v36)
      {

      }
      else
      {
        v8 = (void *)v36;
        -[HDCachedQueryMetadata anchorDate](v5, "anchorDate");
        v37 = objc_claimAutoreleasedReturnValue();
        if (!v37)
          goto LABEL_37;
        v38 = (void *)v37;
        -[HDCachedQueryMetadata anchorDate](self, "anchorDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCachedQueryMetadata anchorDate](v5, "anchorDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "isEqualToDate:", v40);

        if (!v41)
          goto LABEL_38;
      }
      -[HDCachedQueryMetadata intervalComponents](self, "intervalComponents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCachedQueryMetadata intervalComponents](v5, "intervalComponents");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v42)
      {

LABEL_42:
        v14 = 1;
        goto LABEL_39;
      }
      v8 = (void *)v42;
      -[HDCachedQueryMetadata intervalComponents](v5, "intervalComponents");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v44 = (void *)v43;
        -[HDCachedQueryMetadata intervalComponents](self, "intervalComponents");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCachedQueryMetadata intervalComponents](v5, "intervalComponents");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "isEqual:", v46);

        if ((v47 & 1) != 0)
          goto LABEL_42;
LABEL_38:
        v14 = 0;
LABEL_39:

        goto LABEL_40;
      }
LABEL_37:

      goto LABEL_38;
    }
    v14 = 0;
  }
LABEL_40:

  return v14;
}

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (int64_t)sourceEntityPersistentID
{
  return self->_sourceEntityPersistentID;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (int64_t)maxAnchor
{
  return self->_maxAnchor;
}

- (NSNumber)queryStartIndex
{
  return self->_queryStartIndex;
}

- (NSNumber)queryEndIndex
{
  return self->_queryEndIndex;
}

- (int64_t)generationNumber
{
  return self->_generationNumber;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_queryEndIndex, 0);
  objc_storeStrong((id *)&self->_queryStartIndex, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
}

@end

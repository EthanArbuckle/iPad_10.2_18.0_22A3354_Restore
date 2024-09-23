@implementation CCDatabaseJoinedProvenance

+ (id)joinedProvenanceFromDatabaseValueRow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CCDatabaseJoinedProvenance *v7;
  NSObject *v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "recordFromDatabaseValueRow:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "dataValueAtColumnIndex:", objc_msgSend(v3, "count") - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dataValueAtColumnIndex:", objc_msgSend(v3, "count") - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CCDatabaseJoinedProvenance initWithProvenance:contentData:metaContentData:]([CCDatabaseJoinedProvenance alloc], "initWithProvenance:contentData:metaContentData:", v4, v5, v6);

    }
    else
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[CCDatabaseJoinedProvenance joinedProvenanceFromDatabaseValueRow:].cold.1();

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CCDatabaseJoinedProvenance)initWithProvenance:(id)a3 contentData:(id)a4 metaContentData:(id)a5
{
  id v9;
  id v10;
  id v11;
  CCDatabaseJoinedProvenance *v12;
  CCDatabaseJoinedProvenance *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CCDatabaseJoinedProvenance;
  v12 = -[CCDatabaseJoinedProvenance init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_provenance, a3);
    objc_storeStrong((id *)&v13->_contentData, a4);
    objc_storeStrong((id *)&v13->_metaContentData, a5);
  }

  return v13;
}

- (CCProvenanceRecord)provenance
{
  return self->_provenance;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (NSData)metaContentData
{
  return self->_metaContentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContentData, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->_provenance, 0);
}

+ (void)joinedProvenanceFromDatabaseValueRow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "joinedProvenanceFromDatabaseValueRow could not initialize provenance record from row: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

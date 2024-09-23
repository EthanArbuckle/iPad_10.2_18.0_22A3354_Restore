@implementation HKObject(HDCodingSupport)

- (HDCodableHealthObject)codableRepresentationForSync
{
  HDCodableHealthObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v2 = objc_alloc_init(HDCodableHealthObject);
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableHealthObject setUuid:](v2, "setUuid:", v4);

  objc_msgSend(a1, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_codableMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableHealthObject setMetadataDictionary:](v2, "setMetadataDictionary:", v6);

  objc_msgSend(a1, "_sourceBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableHealthObject setSourceBundleIdentifier:](v2, "setSourceBundleIdentifier:", v7);

  objc_msgSend(a1, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[HDCodableHealthObject setExternalSyncObjectCode:](v2, "setExternalSyncObjectCode:", objc_msgSend(a1, "_externalSyncObjectCode"));
  objc_msgSend(a1, "_creationTimestamp");
  if (v10 != 2.22507386e-308)
    -[HDCodableHealthObject setCreationDate:](v2, "setCreationDate:");
  return v2;
}

- (uint64_t)addCodableRepresentationToCollection:()HDCodingSupport
{
  return 0;
}

@end

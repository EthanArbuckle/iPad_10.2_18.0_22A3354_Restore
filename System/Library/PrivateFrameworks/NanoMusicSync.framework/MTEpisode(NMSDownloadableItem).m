@implementation MTEpisode(NMSDownloadableItem)

- (NMSDownloadableItem)downloadInfo
{
  void *v2;
  void *v3;
  uint64_t v4;
  NMSDownloadableItem *v5;
  NMSDownloadableItem *v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__MTEpisode_NMSDownloadableItem__downloadInfo__block_invoke;
  v8[3] = &unk_24D6480A0;
  v8[4] = a1;
  v8[5] = &v23;
  v8[6] = &v17;
  v8[7] = &v13;
  v8[8] = &v9;
  objc_msgSend(v2, "performBlockAndWait:", v8);

  objc_msgSend((id)objc_opt_class(), "_sizeEstimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sizeForFeedURL:duration:feedProvidedSize:", v18[5], v10[3], v14[3]);

  v5 = [NMSDownloadableItem alloc];
  v6 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v5, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", 0, v24[5], v4, 1, 0);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v6;
}

+ (id)propertiesToFetchDownloadInfo
{
  uint64_t v0;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE738D8];
  v2[0] = *MEMORY[0x24BE739C0];
  v2[1] = v0;
  v2[2] = *MEMORY[0x24BE738F0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)relationshipKeyPathsForPrefetchingDownloadInfo
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE73AE0];
  v5[0] = *MEMORY[0x24BE73980];
  v5[1] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_sizeEstimation
{
  if (_sizeEstimation_onceToken != -1)
    dispatch_once(&_sizeEstimation_onceToken, &__block_literal_global_11);
  return (id)_sizeEstimation_sizeEstimation;
}

@end

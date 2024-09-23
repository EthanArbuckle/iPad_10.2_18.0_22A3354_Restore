@implementation NMSAudiobooksMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSMediaItemGroup type](self, "type") == a3)
  {
    -[NMSMediaItemGroup referenceObj](self, "referenceObj");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDDC758]);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__NMSAudiobooksMediaItemGroup_identifiersForContainerType___block_invoke;
    v12[3] = &unk_24D6471F0;
    v13 = v6;
    v8 = v6;
    v9 = (void *)objc_msgSend(v7, "initWithBlock:", v12);
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

void __59__NMSAudiobooksMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "audiobookIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStoreAdamID:", objc_msgSend(v4, "longLongValue"));

}

- (id)itemList
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  NSObject *v28;
  NMSPartialDownloadableItem *v29;
  void *v30;
  NMSPartialDownloadableItem *v31;
  NMSPartialDownloadableItem *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[NMSMediaItemGroup referenceObj](self, "referenceObj");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audiobookMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NMLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NMSAudiobooksMediaItemGroup itemList].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_8;
  }
  if (-[NMSMediaItemGroup downloadedItemsOnly](self, "downloadedItemsOnly"))
  {
    +[NMSAudiobookCacheItemMetadata metaDataForMediaItem:](NMSAudiobookCacheItemMetadata, "metaDataForMediaItem:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      NMLogForCategory(5);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[NMSAudiobooksMediaItemGroup itemList].cold.2(v5);
LABEL_8:
      v12 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_22;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BDDBB30]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BDDBC58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BDDBB28]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 && objc_msgSend(v19, "unsignedIntegerValue"))
    v21 = objc_msgSend(v20, "unsignedIntegerValue");
  else
    v21 = 64000;
  if (-[NMSMediaItemGroup downloadedItemsOnly](self, "downloadedItemsOnly"))
  {
    -[NSObject cachedStartTime](v5, "cachedStartTime");
    v23 = v22;
    -[NSObject cachedDuration](v5, "cachedDuration");
    v25 = v23 + v24;
  }
  else
  {
    v23 = fmax(v15 + -300.0, 0.0);
    v26 = objc_msgSend(v3, "downloadLimit");
    if (v18 >= v15 + (double)v26)
      v25 = v15 + (double)v26;
    else
      v25 = v18;
  }
  v27 = (v25 - v23) * (double)v21 * 0.125;
  NMLogForCategory(5);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414594;
    v35 = v4;
    v36 = 2048;
    v37 = v15;
    v38 = 2048;
    v39 = v18;
    v40 = 2112;
    v41 = v20;
    v42 = 2048;
    v43 = v21;
    v44 = 2048;
    v45 = v23;
    v46 = 2048;
    v47 = v25;
    v48 = 2048;
    v49 = v25;
    v50 = 2048;
    v51 = (v25 - v23) * (double)v21 * 0.125;
    v52 = 2048;
    v53 = v51;
    _os_log_debug_impl(&dword_216E27000, v28, OS_LOG_TYPE_DEBUG, "[Audiobook Quota Evaluation] Item: %@, Bookmark Time: %f, Book Duration: %f, MediaLibrary BitRate: %@, Final BitRate: %lu, Start Time: %f, Minimum End Time: %f, Expected End Time: %f, Minimum Size: %f, Expected Size: %f", buf, 0x66u);
  }

  v29 = [NMSPartialDownloadableItem alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "persistentID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[NMSPartialDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:minimumSize:offset:](v29, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:minimumSize:offset:", v30, 0, (unint64_t)v27, 2, -[NMSMediaItemGroup manuallyAdded](self, "manuallyAdded"), (unint64_t)v27, (unint64_t)v23);
  v33 = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v12;
}

- (void)itemList
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_216E27000, log, OS_LOG_TYPE_DEBUG, "[Audiobook Quota Evaluation] downloadedItemsOnly is true but audiobook is not downloaded", v1, 2u);
}

@end

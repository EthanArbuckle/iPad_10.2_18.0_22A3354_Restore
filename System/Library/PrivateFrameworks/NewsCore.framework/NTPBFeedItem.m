@implementation NTPBFeedItem

void __53__NTPBFeedItem_FCFeedItem__baseKeysForFeedItemRecord__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("tagID");
  v5[1] = CFSTR("articleID");
  v5[2] = CFSTR("order");
  v5[3] = CFSTR("userFeedback");
  v5[4] = CFSTR("publishDateMillis");
  v5[5] = CFSTR("tagHalfLifeMillis");
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", v5, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __52__NTPBFeedItem_FCFeedItem__baseKeysForArticleRecord__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[27];

  v5[26] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("allowedStorefrontIDs");
  v5[1] = CFSTR("behaviorFlags");
  v5[2] = CFSTR("blockedStorefrontIDs");
  v5[3] = CFSTR("bodyTextLength");
  v5[4] = CFSTR("clusterID");
  v5[5] = CFSTR("contentType");
  v5[6] = CFSTR("halfLifeMillis");
  v5[7] = CFSTR("isBundlePaid");
  v5[8] = CFSTR("isFeature");
  v5[9] = CFSTR("isIssueOnly");
  v5[10] = CFSTR("isPaid");
  v5[11] = CFSTR("isSponsored");
  v5[12] = CFSTR("language");
  v5[13] = CFSTR("minNewsVersion");
  v5[14] = CFSTR("narrativeTrackFullURL");
  v5[15] = CFSTR("parentIssueID");
  v5[16] = CFSTR("primaryAudience");
  v5[17] = CFSTR("publishDate");
  v5[18] = CFSTR("publisherArticleVersion");
  v5[19] = CFSTR("role");
  v5[20] = CFSTR("scoresTopicTagIDs");
  v5[21] = CFSTR("sourceChannelTagID");
  v5[22] = CFSTR("thumbnailMetadata");
  v5[23] = CFSTR("thumbnailPerceptualHash");
  v5[24] = CFSTR("videoURL");
  v5[25] = CFSTR("expirationData");
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", v5, 26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __76__NTPBFeedItem_FCFeedItem__keysForFeedItemAndArticleRecordWithRecordSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0D626D0];
  v4 = a2;
  objc_msgSend(v3, "baseKeysForFeedItemRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(MEMORY[0x1E0D626D0], "baseKeysForArticleRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "engagementRecordKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  objc_msgSend(*(id *)(a1 + 32), "conversionRecordKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend(*(id *)(a1 + 32), "topicFlagsRecordKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v9);

  objc_msgSend(*(id *)(a1 + 32), "articleTagMetadataRecordKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  objc_msgSend(*(id *)(a1 + 32), "embeddingRecordKeys");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v11);

}

void __53__NTPBFeedItem_FCFeedItem__baseKeysForFeedItemRecord__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", &__block_literal_global_5_3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_186;
  _MergedGlobals_186 = v0;

}

void __52__NTPBFeedItem_FCFeedItem__baseKeysForArticleRecord__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", &__block_literal_global_8_1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8508;
  qword_1ED0F8508 = v0;

}

void __65__NTPBFeedItem_FCFeedItem__keysForArticleRecordWithRecordSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D626D0];
  v4 = a2;
  objc_msgSend(v3, "baseKeysForArticleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 32), "engagementRecordKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "conversionRecordKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  objc_msgSend(*(id *)(a1 + 32), "topicFlagsRecordKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend(*(id *)(a1 + 32), "articleTagMetadataRecordKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v9);

  objc_msgSend(*(id *)(a1 + 32), "embeddingRecordKeys");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

}

uint64_t __75__NTPBFeedItem_FCFeedItem__feedItemFromCKRecord_storefrontID_recordSource___block_invoke(uint64_t a1)
{
  void *v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FeedItem must always have a valid articleID, record: %@"), *(_QWORD *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    v5 = "+[NTPBFeedItem(FCFeedItem) feedItemFromCKRecord:storefrontID:recordSource:]_block_invoke";
    v6 = 2080;
    v7 = "FCFeedItem.m";
    v8 = 1024;
    v9 = 141;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return 0;
}

void __59__NTPBFeedItem_FCFeedItem__enumerateTopicCohortsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "tagID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cohorts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __67__NTPBFeedItem_FCFeedItem__enumerateTopicConversionStatsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "tagID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversionStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

@end

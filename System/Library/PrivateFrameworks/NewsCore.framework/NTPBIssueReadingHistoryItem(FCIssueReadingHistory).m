@implementation NTPBIssueReadingHistoryItem(FCIssueReadingHistory)

+ (uint64_t)keyValuePairType
{
  return 14;
}

+ (id)issueReadingHistoryItemWithCKRecord:()FCIssueReadingHistory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "record != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "+[NTPBIssueReadingHistoryItem(FCIssueReadingHistory) issueReadingHistoryItemWithCKRecord:]";
    v19 = 2080;
    v20 = "NTPBIssueReadingHistoryItem+FCIssueReadingHistory.m";
    v21 = 1024;
    v22 = 18;
    v23 = 2114;
    v24 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("issueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIssueID:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastVisited"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastVisitedDate:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastBadged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastBadgedDate:", v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastEngaged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastEngagedDate:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastSeen"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastSeenDate:", v11);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastRemovedFromMyMagazines"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastRemovedFromMyMagazinesDate:", v12);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastVisitedArticleID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastVisitedArticleID:", v13);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastVisitedPageID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastVisitedPageID:", v14);

  return v4;
}

- (void)setLastVisitedDate:()FCIssueReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLastVisitedPBDate:", v4);

}

- (id)lastVisitedDate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "lastVisitedPBDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastBadgedDate:()FCIssueReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLastBadgedPBDate:", v4);

}

- (id)lastBadgedDate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "lastBadgedPBDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastEngagedDate:()FCIssueReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLastEngagedPBDate:", v4);

}

- (id)lastEngagedDate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "lastEngagedPBDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastSeenDate:()FCIssueReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLastSeenPBDate:", v4);

}

- (id)lastSeenDate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "lastSeenPBDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastRemovedFromMyMagazinesDate:()FCIssueReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLastRemovedFromMyMagazinesPBDate:", v4);

}

- (id)lastRemovedFromMyMagazinesDate
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "lastRemovedFromMyMagazinesPBDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)asCKRecord
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (qword_1ED0F8730 != -1)
    dispatch_once(&qword_1ED0F8730, &__block_literal_global_153);
  v2 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRecordName:zoneID:", v3, _MergedGlobals_202);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("IssueReadingHistoryItem"), v4);
  objc_msgSend(a1, "issueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("issueID"));

  objc_msgSend(a1, "lastVisitedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("lastVisited"));

  objc_msgSend(a1, "lastBadgedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("lastBadged"));

  objc_msgSend(a1, "lastEngagedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("lastEngaged"));

  objc_msgSend(a1, "lastSeenDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("lastSeen"));

  objc_msgSend(a1, "lastRemovedFromMyMagazinesDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("lastRemovedFromMyMagazines"));

  objc_msgSend(a1, "lastVisitedArticleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("lastVisitedArticleID"));

  objc_msgSend(a1, "lastVisitedPageID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("lastVisitedPageID"));

  return v5;
}

+ (uint64_t)readValueFromKeyValuePair:()FCIssueReadingHistory
{
  return objc_msgSend(a3, "issueReadingHistoryItem");
}

- (void)writeToKeyValuePair:()FCIssueReadingHistory
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(v4, "setIssueReadingHistoryItem:", a1);

}

@end

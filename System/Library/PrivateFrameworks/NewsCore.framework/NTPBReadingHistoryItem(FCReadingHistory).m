@implementation NTPBReadingHistoryItem(FCReadingHistory)

+ (uint64_t)keyValuePairType
{
  return 6;
}

- (id)identifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "articleID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCHistoryItemIDFromArticleID((uint64_t)v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)lastVisitedAt
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "lastVisitedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastVisitedAt:()FCReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLastVisitedDate:", v4);

}

- (id)lastListenedAt
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "lastListened");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastListenedAt:()FCReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLastListened:", v4);

}

- (id)listeningProgressSavedAt
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "listeningProgressSavedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setListeningProgressSavedAt:()FCReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setListeningProgressSavedDate:", v4);

}

- (id)readingPositionSavedAt
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "readingPositionSavedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setReadingPositionSavedAt:()FCReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setReadingPositionSavedDate:", v4);

}

- (id)firstSeenAt
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "firstSeenDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFirstSeenAt:()FCReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFirstSeenDate:", v4);

}

- (id)firstSeenAtOfMaxVersionSeen
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "firstSeenDateOfMaxVersionSeen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateWithPBDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFirstSeenAtOfMaxVersionSeen:()FCReadingHistory
{
  id v4;

  objc_msgSend(a3, "pbDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFirstSeenDateOfMaxVersionSeen:", v4);

}

- (uint64_t)hasArticleBeenRead
{
  return objc_msgSend(a1, "flags") & 1;
}

- (uint64_t)setHasArticleBeenRead:()FCReadingHistory
{
  return objc_msgSend(a1, "setFlags:", objc_msgSend(a1, "flags") & 0xFFFFFFFE | a3);
}

- (uint64_t)hasArticleBeenSeen
{
  return (objc_msgSend(a1, "flags") >> 1) & 1;
}

- (uint64_t)setHasArticleBeenSeen:()FCReadingHistory
{
  uint64_t v5;
  int v6;

  v5 = objc_msgSend(a1, "flags") & 0xFFFFFFFDLL;
  if (a3)
    v6 = 2;
  else
    v6 = 0;
  return objc_msgSend(a1, "setFlags:", v5 | v6);
}

- (uint64_t)hasArticleBeenMarkedOffensive
{
  return (objc_msgSend(a1, "flags") >> 2) & 1;
}

- (uint64_t)setHasArticleBeenMarkedOffensive:()FCReadingHistory
{
  uint64_t v5;
  int v6;

  v5 = objc_msgSend(a1, "flags") & 0xFFFFFFFBLL;
  if (a3)
    v6 = 4;
  else
    v6 = 0;
  return objc_msgSend(a1, "setFlags:", v5 | v6);
}

- (uint64_t)hasArticleBeenConsumed
{
  return (objc_msgSend(a1, "flags") >> 5) & 1;
}

- (uint64_t)setHasArticleBeenConsumed:()FCReadingHistory
{
  uint64_t v5;
  int v6;

  v5 = objc_msgSend(a1, "flags") & 0xFFFFFFDFLL;
  if (a3)
    v6 = 32;
  else
    v6 = 0;
  return objc_msgSend(a1, "setFlags:", v5 | v6);
}

- (uint64_t)hasArticleCompletedListening
{
  return (objc_msgSend(a1, "flags") >> 6) & 1;
}

- (uint64_t)setHasArticleCompletedListening:()FCReadingHistory
{
  uint64_t v5;
  int v6;

  v5 = objc_msgSend(a1, "flags") & 0xFFFFFFBFLL;
  if (a3)
    v6 = 64;
  else
    v6 = 0;
  return objc_msgSend(a1, "setFlags:", v5 | v6);
}

- (uint64_t)hasArticleCompletedReading
{
  return (objc_msgSend(a1, "flags") >> 8) & 1;
}

- (uint64_t)setHasArticleCompletedReading:()FCReadingHistory
{
  uint64_t v5;
  int v6;

  v5 = objc_msgSend(a1, "flags") & 0xFFFFFEFFLL;
  if (a3)
    v6 = 256;
  else
    v6 = 0;
  return objc_msgSend(a1, "setFlags:", v5 | v6);
}

- (uint64_t)hasArticleBeenRemovedFromAudio
{
  return (objc_msgSend(a1, "flags") >> 9) & 1;
}

- (uint64_t)setHasArticleBeenRemovedFromAudio:()FCReadingHistory
{
  uint64_t v5;
  int v6;

  v5 = objc_msgSend(a1, "flags") & 0xFFFFFDFFLL;
  if (a3)
    v6 = 512;
  else
    v6 = 0;
  return objc_msgSend(a1, "setFlags:", v5 | v6);
}

- (uint64_t)articleLikingStatus
{
  if ((objc_msgSend(a1, "flags") & 8) != 0)
    return 1;
  else
    return (objc_msgSend(a1, "flags") >> 3) & 2;
}

- (uint64_t)setArticleLikingStatus:()FCReadingHistory
{
  uint64_t v4;

  if (a3 == 2)
  {
    v4 = objc_msgSend(a1, "flags") & 0xFFFFFFE7 | 0x10;
  }
  else if (a3 == 1)
  {
    v4 = objc_msgSend(a1, "flags") & 0xFFFFFFE7 | 8;
  }
  else
  {
    v4 = objc_msgSend(a1, "flags") & 0xFFFFFFE7;
  }
  return objc_msgSend(a1, "setFlags:", v4);
}

- (uint64_t)isPruningDisabled
{
  return (objc_msgSend(a1, "flags") >> 7) & 1;
}

- (uint64_t)setPruningDisabled:()FCReadingHistory
{
  uint64_t v5;
  int v6;

  v5 = objc_msgSend(a1, "flags") & 0xFFFFFF7FLL;
  if (a3)
    v6 = 128;
  else
    v6 = 0;
  return objc_msgSend(a1, "setFlags:", v5 | v6);
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;

  if (qword_1EE657B98 != -1)
    dispatch_once(&qword_1EE657B98, &__block_literal_global_291);
  v2 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRecordName:zoneID:", v3, _MergedGlobals_14);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("ReadingHistoryItem"), v4);
  objc_msgSend(a1, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("articleID"));

  objc_msgSend(a1, "sourceChannelTagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("sourceChannelTagID"));

  objc_msgSend(a1, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("deviceID"));

  objc_msgSend(a1, "lastVisitedAt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("lastVisited"));

  objc_msgSend(a1, "lastListenedAt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("lastListened"));

  objc_msgSend(a1, "listeningProgressSavedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("listeningProgressLastSaved"));

  objc_msgSend(a1, "readingPositionSavedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("readingPositionLastSaved"));

  objc_msgSend(a1, "readingPosition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("readingPosition"));

  if (objc_msgSend(a1, "hasArticleBeenRead"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "hasArticleBeenRead"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("articleRead"));

  }
  if (objc_msgSend(a1, "hasArticleBeenSeen"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "hasArticleBeenSeen"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("articleSeen"));

  }
  if (objc_msgSend(a1, "hasArticleCompletedListening"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "hasArticleCompletedListening"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("completedListening"));

  }
  if (objc_msgSend(a1, "hasArticleCompletedReading"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "hasArticleCompletedReading"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("completedReading"));

  }
  if (objc_msgSend(a1, "hasArticleBeenConsumed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "hasArticleBeenConsumed"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("articleConsumed"));

  }
  if (objc_msgSend(a1, "articleLikingStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "articleLikingStatus") == 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("liked"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "articleLikingStatus") == 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("disliked"));

  }
  if (objc_msgSend(a1, "hasArticleBeenMarkedOffensive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "hasArticleBeenMarkedOffensive"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("offensive"));

  }
  if (objc_msgSend(a1, "listenedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1, "listenedCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("listenedCount"));

  }
  objc_msgSend(a1, "listeningProgress");
  if (v23 > 0.0)
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "listeningProgress");
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("listeningProgress"));

  }
  if (objc_msgSend(a1, "readCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1, "readCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("readCount"));

  }
  if (objc_msgSend(a1, "isPruningDisabled"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("pruningDisabled"));

  return v5;
}

+ (uint64_t)readValueFromKeyValuePair:()FCReadingHistory
{
  return objc_msgSend(a3, "readingHistoryItem");
}

- (void)writeToKeyValuePair:()FCReadingHistory
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(v4, "setReadingHistoryItem:", a1);

}

@end

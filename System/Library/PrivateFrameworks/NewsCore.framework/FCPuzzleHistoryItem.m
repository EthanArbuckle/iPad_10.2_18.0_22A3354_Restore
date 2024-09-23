@implementation FCPuzzleHistoryItem

- (FCPuzzleHistoryItem)initWithEntryID:(id)a3 puzzleID:(id)a4 puzzleTypeID:(id)a5 progressData:(id)a6 progressLevel:(int64_t)a7 score:(id)a8 rankID:(id)a9 usedReveal:(id)a10 playDuration:(int64_t)a11 lastPlayedDate:(id)a12 completedDate:(id)a13 firstCompletedDate:(id)a14 firstPlayDuration:(id)a15 bestScore:(id)a16 difficulty:(id)a17 publishDate:(id)a18 behaviorFlags:(id)a19
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  FCPuzzleHistoryItem *v30;
  FCPuzzleHistoryItem *v31;
  uint64_t v32;
  NSString *identifier;
  uint64_t v34;
  NSString *puzzleID;
  uint64_t v36;
  NSString *puzzleTypeID;
  uint64_t v38;
  NSString *rankID;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  id obja;
  id v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v23 = a4;
  v24 = a5;
  obj = a6;
  v57 = a6;
  v47 = a8;
  v56 = a8;
  v25 = a9;
  v51 = a10;
  v55 = a12;
  v54 = a13;
  v53 = a14;
  v52 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v50 = a19;
  if (!v48 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzle history item must have an identifier"), obj);
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal"
          ":playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDa"
          "te:behaviorFlags:]";
    v61 = 2080;
    v62 = "FCPuzzleHistoryItem.m";
    v63 = 1024;
    v64 = 31;
    v65 = 2114;
    v66 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v23)
      goto LABEL_6;
  }
  else if (v23)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzle history item must have a puzzle ID"));
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal"
          ":playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDa"
          "te:behaviorFlags:]";
    v61 = 2080;
    v62 = "FCPuzzleHistoryItem.m";
    v63 = 1024;
    v64 = 32;
    v65 = 2114;
    v66 = v42;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v29 = v24;
  if (!v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzle history item must have a puzzleType ID"));
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal"
          ":playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDa"
          "te:behaviorFlags:]";
    v61 = 2080;
    v62 = "FCPuzzleHistoryItem.m";
    v63 = 1024;
    v64 = 33;
    v65 = 2114;
    v66 = v43;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v58.receiver = self;
  v58.super_class = (Class)FCPuzzleHistoryItem;
  v30 = -[FCPuzzleHistoryItem init](&v58, sel_init, obj);
  v31 = v30;
  if (v30)
  {
    if (v48 && v23)
    {
      v32 = objc_msgSend(v48, "copy");
      identifier = v31->_identifier;
      v31->_identifier = (NSString *)v32;

      v34 = objc_msgSend(v23, "copy");
      puzzleID = v31->_puzzleID;
      v31->_puzzleID = (NSString *)v34;

      v36 = objc_msgSend(v29, "copy");
      puzzleTypeID = v31->_puzzleTypeID;
      v31->_puzzleTypeID = (NSString *)v36;

      objc_storeStrong((id *)&v31->_progressData, obja);
      v31->_progressLevel = a7;
      objc_storeStrong((id *)&v31->_score, v47);
      v38 = objc_msgSend(v25, "copy");
      rankID = v31->_rankID;
      v31->_rankID = (NSString *)v38;

      objc_storeStrong((id *)&v31->_usedReveal, a10);
      v31->_playDuration = a11;
      objc_storeStrong((id *)&v31->_lastPlayedDate, a12);
      objc_storeStrong((id *)&v31->_completedDate, a13);
      objc_storeStrong((id *)&v31->_firstCompletedDate, a14);
      objc_storeStrong((id *)&v31->_firstPlayDuration, a15);
      objc_storeStrong((id *)&v31->_bestScore, a16);
      objc_storeStrong((id *)&v31->_difficulty, a17);
      objc_storeStrong((id *)&v31->_publishDate, a18);
      objc_storeStrong((id *)&v31->_behaviorFlags, a19);
    }
    else
    {

      v31 = 0;
    }
  }

  return v31;
}

- (CKRecord)asCKRecord
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (qword_1ED0F84E0 != -1)
    dispatch_once(&qword_1ED0F84E0, &__block_literal_global_111);
  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCPuzzleHistoryItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, _MergedGlobals_184);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("PuzzleHistoryItem"), v5);
  -[FCPuzzleHistoryItem puzzleID](self, "puzzleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("puzzleID"));

  -[FCPuzzleHistoryItem puzzleTypeID](self, "puzzleTypeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("puzzleTypeID"));

  -[FCPuzzleHistoryItem progressData](self, "progressData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("progressData"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FCPuzzleHistoryItem progressLevel](self, "progressLevel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("progressLevel"));

  -[FCPuzzleHistoryItem score](self, "score");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("score"));

  -[FCPuzzleHistoryItem rankID](self, "rankID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("rankID"));

  -[FCPuzzleHistoryItem usedReveal](self, "usedReveal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("usedReveal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FCPuzzleHistoryItem playDuration](self, "playDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("playDuration"));

  -[FCPuzzleHistoryItem lastPlayedDate](self, "lastPlayedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("lastPlayedDate"));

  -[FCPuzzleHistoryItem completedDate](self, "completedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("completedDate"));

  -[FCPuzzleHistoryItem firstCompletedDate](self, "firstCompletedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("firstCompletedDate"));

  -[FCPuzzleHistoryItem firstPlayDuration](self, "firstPlayDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("firstPlayDuration"));

  -[FCPuzzleHistoryItem bestScore](self, "bestScore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("bestScore"));

  -[FCPuzzleHistoryItem difficulty](self, "difficulty");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("difficulty"));

  -[FCPuzzleHistoryItem publishDate](self, "publishDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("publishDate"));

  -[FCPuzzleHistoryItem behaviorFlags](self, "behaviorFlags");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("behaviorFlags"));

  return (CKRecord *)v6;
}

void __33__FCPuzzleHistoryItem_asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("PuzzleHistory"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_184;
  _MergedGlobals_184 = v1;

}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;

  -[FCPuzzleHistoryItem progressData](self, "progressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("(some)");
  if (!v3)
    v4 = CFSTR("(null)");
  v20 = v4;

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[FCPuzzleHistoryItem puzzleID](self, "puzzleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem puzzleTypeID](self, "puzzleTypeID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FCPuzzleHistoryItem progressLevel](self, "progressLevel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem score](self, "score");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem rankID](self, "rankID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem usedReveal](self, "usedReveal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FCPuzzleHistoryItem playDuration](self, "playDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem lastPlayedDate](self, "lastPlayedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem completedDate](self, "completedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem firstCompletedDate](self, "firstCompletedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem firstPlayDuration](self, "firstPlayDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem bestScore](self, "bestScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem difficulty](self, "difficulty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem publishDate](self, "publishDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistoryItem behaviorFlags](self, "behaviorFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("{puzzleID=%@, puzzleTypeID=%@, progressData=%@, progressLevel=%@, score=%@, rankID=%@, usedReveal=%@, playDuration=%@, lastPlayedDate=%@, completedDate=%@, firstCompletedDate=%@, firstPlayDuration=%@, bestScore=%@, difficulty=%@, publishDate=%@, behaviorFlags=%@}"), v17, v16, v20, v23, v15, v22, v21, v14, v5, v13, v6, v12, v7, v8, v9, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)puzzleID
{
  return self->_puzzleID;
}

- (NSString)puzzleTypeID
{
  return self->_puzzleTypeID;
}

- (NSData)progressData
{
  return self->_progressData;
}

- (int64_t)progressLevel
{
  return self->_progressLevel;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSString)rankID
{
  return self->_rankID;
}

- (NSNumber)usedReveal
{
  return self->_usedReveal;
}

- (int64_t)playDuration
{
  return self->_playDuration;
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (NSDate)completedDate
{
  return self->_completedDate;
}

- (NSDate)firstCompletedDate
{
  return self->_firstCompletedDate;
}

- (NSNumber)firstPlayDuration
{
  return self->_firstPlayDuration;
}

- (NSNumber)bestScore
{
  return self->_bestScore;
}

- (NSNumber)difficulty
{
  return self->_difficulty;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSNumber)behaviorFlags
{
  return self->_behaviorFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorFlags, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_difficulty, 0);
  objc_storeStrong((id *)&self->_bestScore, 0);
  objc_storeStrong((id *)&self->_firstPlayDuration, 0);
  objc_storeStrong((id *)&self->_firstCompletedDate, 0);
  objc_storeStrong((id *)&self->_completedDate, 0);
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
  objc_storeStrong((id *)&self->_usedReveal, 0);
  objc_storeStrong((id *)&self->_rankID, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_progressData, 0);
  objc_storeStrong((id *)&self->_puzzleTypeID, 0);
  objc_storeStrong((id *)&self->_puzzleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)dictionaryRepresentation
{
  void *v2;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  int v36;
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "puzzleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzleHistoryItem must have a puzzleID"));
    v36 = 136315906;
    v37 = "-[FCPuzzleHistoryItem(PuzzleHistory) dictionaryRepresentation]";
    v38 = 2080;
    v39 = "FCPuzzleHistory.m";
    v40 = 1024;
    v41 = 968;
    v42 = 2114;
    v43 = v35;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v36, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "progressLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("progressLevel"));

  objc_msgSend(a1, "score");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "score");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("score"));

  }
  objc_msgSend(a1, "rankID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "rankID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rankID"));

  }
  objc_msgSend(a1, "usedReveal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "usedReveal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("usedReveal"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "playDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("playDuration"));

  objc_msgSend(a1, "puzzleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "puzzleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("puzzleID"));

  }
  objc_msgSend(a1, "puzzleTypeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(a1, "puzzleTypeID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("puzzleTypeID"));

  }
  objc_msgSend(a1, "progressData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(a1, "progressData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("progressData"));

  }
  objc_msgSend(a1, "lastPlayedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(a1, "lastPlayedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("lastPlayedDate"));

  }
  objc_msgSend(a1, "completedDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(a1, "completedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("completedDate"));

  }
  objc_msgSend(a1, "firstCompletedDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(a1, "firstCompletedDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("firstCompletedDate"));

  }
  objc_msgSend(a1, "firstPlayDuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(a1, "firstPlayDuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("firstPlayDuration"));

  }
  objc_msgSend(a1, "bestScore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(a1, "bestScore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("bestScore"));

  }
  objc_msgSend(a1, "difficulty");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(a1, "difficulty");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("difficulty"));

  }
  objc_msgSend(a1, "publishDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(a1, "publishDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("publishDate"));

  }
  objc_msgSend(a1, "behaviorFlags");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(a1, "behaviorFlags");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("behaviorFlags"));

  }
  return v3;
}

- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;

  if (!a1)
    return 0;
  v4 = a3;
  v24 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("puzzleID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progressData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progressLevel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (int)objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rankID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usedReveal"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (int)objc_msgSend(v6, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastPlayedDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstCompletedDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPlayDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bestScore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("difficulty"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publishDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("behaviorFlags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(a1, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v24, v25, v23, v22, v21, v20, v27, v18, v19, v17, v16, v15, v14, v7, v8, v9,
                  v10);

  v12 = v11;
  return v12;
}

@end

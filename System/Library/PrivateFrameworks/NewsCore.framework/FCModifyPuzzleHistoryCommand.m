@implementation FCModifyPuzzleHistoryCommand

- (FCModifyPuzzleHistoryCommand)initWithPuzzleHistoryItems:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  FCModifyPuzzleHistoryCommand *v7;

  v4 = a4;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_106);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, v4);

  return v7;
}

uint64_t __65__FCModifyPuzzleHistoryCommand_initWithPuzzleHistoryItems_merge___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
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
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastPlayedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastPlayedDate"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);
  v10 = v9 == 1;
  if (v9 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("puzzleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("puzzleID"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("puzzleTypeID"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("behaviorFlags"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("behaviorFlags"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("progressData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("progressData"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("progressLevel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("progressLevel"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("score"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rankID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("rankID"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("usedReveal"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("usedReveal"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playDuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("playDuration"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastPlayedDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("lastPlayedDate"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completedDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("completedDate"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstCompletedDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstCompletedDate"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v42 = (void *)v8;
  v43 = v7;
  v41 = v22;
  if (v22 && (!v23 || objc_msgSend(v22, "compare:", v23) == -1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("firstCompletedDate"));
    v25 = 0;
    v10 = 1;
  }
  else
  {
    v25 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPlayDuration"));
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPlayDuration"));
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
    v27 = v25;
  else
    v27 = 0;
  if (v26 && (v27 & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("firstPlayDuration"), v38);
    v10 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bestScore"), v38);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bestScore"));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v40 = (void *)v26;
  if (v28 && (!v29 || objc_msgSend(v28, "compare:", v29) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("bestScore"));
    v10 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("difficulty"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("difficulty"));
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v31 && !v32)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("difficulty"));
    v10 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("publishDate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("publishDate"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v34 && !v35)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("publishDate"));
    v10 = 1;
  }

  return v10;
}

@end

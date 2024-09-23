@implementation FCModifyHistoryCommand

- (FCModifyHistoryCommand)initWithHistoryItems:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  FCModifyHistoryCommand *v9;
  objc_super v11;
  _QWORD aBlock[4];
  id v13;

  v4 = a4;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCModifyHistoryCommand_initWithHistoryItems_merge___block_invoke;
  aBlock[3] = &unk_1E4643BA0;
  v13 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v11.receiver = self;
  v11.super_class = (Class)FCModifyHistoryCommand;
  v9 = -[FCModifyRecordsCommand initWithLocalRecordsGenerator:merge:](&v11, sel_initWithLocalRecordsGenerator_merge_, v8, v4);

  return v9;
}

id __53__FCModifyHistoryCommand_initWithHistoryItems_merge___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  _FCPruneHistoryForUpload(*(void **)(a1 + 32), &__block_literal_global_105, &__block_literal_global_9_0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_69);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __53__FCModifyHistoryCommand_initWithHistoryItems_merge___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (id)recordZoneName
{
  return CFSTR("ReadingHistory");
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
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
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastVisited"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastVisited"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v7;
  v8 = objc_msgSend(v7, "compare:", v65);
  v9 = v8 == 1;
  if (v8 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastVisited"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("lastVisited"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastListened"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastListened"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v11;
  if (objc_msgSend(v11, "compare:", v63) == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastListened"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("lastListened"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("readingPositionLastSaved"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("readingPositionLastSaved"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "compare:", v14) == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("readingPositionLastSaved"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("readingPositionLastSaved"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("readingPosition"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("readingPosition"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("listeningProgressLastSaved"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("listeningProgressLastSaved"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "compare:", v18) == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("listeningProgressLastSaved"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("listeningProgressLastSaved"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("listeningProgress"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("listeningProgress"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleRead"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("articleRead")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleRead"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("articleRead"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleSeen"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v25 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("articleSeen")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleSeen"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("articleSeen"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completedListening"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLValue");

  if (v28 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("completedListening")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completedListening"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("completedListening"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completedReading"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "BOOLValue");

  if (v31 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("completedReading")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completedReading"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("completedReading"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleConsumed"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "BOOLValue");

  if (v34 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("articleConsumed")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleConsumed"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("articleConsumed"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceChannelTagID"));
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceChannelTagID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceChannelTagID"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("sourceChannelTagID"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("deviceID"));

      }
    }
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offensive"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "BOOLValue");

  if (v42 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("offensive")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offensive"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("offensive"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("liked"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "BOOLValue");

  if (v45 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("liked")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("liked"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("liked"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("disliked"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "BOOLValue");

  if (v48 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("disliked")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("disliked"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("disliked"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("listenedCount"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "intValue");

  if (v51 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("listenedCount")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("listenedCount"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("listenedCount"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("readCount"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "intValue");

  if (v54 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("readCount")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("readCount"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("readCount"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("removedFromAudio"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "BOOLValue");

  if (v57 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("removedFromAudio")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("removedFromAudio"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("removedFromAudio"));

    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pruningDisabled"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "BOOLValue");

  if (v60 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, CFSTR("pruningDisabled")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pruningDisabled"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v61, CFSTR("pruningDisabled"));

    v9 = 1;
  }

  return v9;
}

- (NSArray)historyItems
{
  return self->_historyItems;
}

- (NSArray)recordItems
{
  return self->_recordItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordItems, 0);
  objc_storeStrong((id *)&self->_historyItems, 0);
}

@end

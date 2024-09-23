@implementation FBKFeedbackFollowup

+ (id)entityName
{
  return CFSTR("FeedbackFollowup");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];

  v48[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_complete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[FBKFeedbackFollowup setServerSideIsComplete:](self, "setServerSideIsComplete:", v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answers_complete"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = v6;
  if (v7 && (v6 & 1) == 0)
    v8 = objc_msgSend(v7, "BOOLValue");
  v43 = v8;
  v46 = v7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("display_text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feedback_followup_responses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v11;
  if (v11)
  {
    -[FBKFeedbackFollowup managedObjectContext](self, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFeedbackFollowupResponse, "importFromJSONArray:intoContext:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("type"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v14;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", CFSTR("role"), 1, &__block_literal_global_38);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v15;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("createdAt"), 1, sel_compare_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingDescriptors:", v17);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file_matchers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[FBKFeedbackFollowup managedObjectContext](self, "managedObjectContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFileMatcher, "importFromJSONArray:intoContext:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "valueForKeyPath:", CFSTR("id"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFeedbackFollowup setFileMatcherIds:](self, "setFileMatcherIds:", v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ff_type"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = +[FBKFeedbackFollowup followupTypeFromString:](FBKFeedbackFollowup, "followupTypeFromString:", v24);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("created_at"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  FBKDateFromServerString(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file_promises"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FBKFeedbackFollowup managedObjectContext](self, "managedObjectContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFilePromise, "importFromJSONArray:intoContext:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFeedbackFollowup setFilePromises:](self, "setFilePromises:", v31);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("participant"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FBKFeedbackFollowup managedObjectContext](self, "managedObjectContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKParticipant, "importFromJSONObject:intoContext:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFeedbackFollowup setOriginator:](self, "setOriginator:", v35);

    }
  }
  -[FBKFeedbackFollowup setType:](self, "setType:", v25);
  -[FBKFeedbackFollowup setComplete:](self, "setComplete:", v43);
  -[FBKFeedbackFollowup setDisplayText:](self, "setDisplayText:", v47);
  if (v25 == 7)
  {
    -[FBKFeedbackFollowup displayText](self, "displayText");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36
      || (v37 = (void *)v36,
          -[FBKFeedbackFollowup displayText](self, "displayText"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v39 = objc_msgSend(v38, "length"),
          v38,
          v37,
          !v39))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("EL_FFU_PROMPT"), CFSTR("Fill out this response to complete the Enhanced Logging session on this Feedback."), 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFeedbackFollowup setDisplayText:](self, "setDisplayText:", v41);

    }
  }
  -[FBKFeedbackFollowup setFeedbackFollowupResponses:](self, "setFeedbackFollowupResponses:", v44);
  -[FBKFeedbackFollowup setFileMatchers:](self, "setFileMatchers:", v21);
  -[FBKFeedbackFollowup setCreatedAt:](self, "setCreatedAt:", v27);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowup setUpdatedAt:](self, "setUpdatedAt:", v42);

}

uint64_t __51__FBKFeedbackFollowup_setPropertiesFromJSONObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = +[FBKFeedbackFollowupResponse sortValueOfFollowupResponseRole:](FBKFeedbackFollowupResponse, "sortValueOfFollowupResponseRole:", a2);
  v6 = +[FBKFeedbackFollowupResponse sortValueOfFollowupResponseRole:](FBKFeedbackFollowupResponse, "sortValueOfFollowupResponseRole:", v4);

  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (id)_textResponsesPredicate
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1758];
  v6[0] = CFSTR(":request_info");
  v6[1] = CFSTR(":additional_info");
  v6[2] = CFSTR(":comments");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("role IN[n] (%@) AND text.length > 0"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)textResponsesCount
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[FBKFeedbackFollowup feedbackFollowupResponses](self, "feedbackFollowupResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowup _textResponsesPredicate](self, "_textResponsesPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)textResponsesSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[FBKFeedbackFollowup _textResponsesPredicate](self, "_textResponsesPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowup feedbackFollowupResponses](self, "feedbackFollowupResponses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "text", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_24E15EAF8;
  }

  return v13;
}

- (id)validationResponse
{
  void *v2;
  void *v3;

  -[FBKFeedbackFollowup feedbackFollowupResponses](self, "feedbackFollowupResponses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_findWithBlock:", &__block_literal_global_73_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __41__FBKFeedbackFollowup_validationResponse__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR(":is_validated"));

  return v3;
}

- (id)targetPlatform
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FBKFeedbackFollowup fileMatchers](self, "fileMatchers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_75_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)*MEMORY[0x24BE2CA18];
  if (v4)
    v5 = v4;
  v6 = v5;

  return v6;
}

uint64_t __37__FBKFeedbackFollowup_targetPlatform__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "platform");
}

- (BOOL)isUploadingFiles
{
  void *v2;
  BOOL v3;

  -[FBKFeedbackFollowup uploadTask](self, "uploadTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)visibleSortedFilePromises
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowup visibleFilePromises](self, "visibleFilePromises");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasVisibleFilesIncludingFileResponses
{
  void *v2;
  BOOL v3;

  -[FBKFeedbackFollowup visibleFilePromises](self, "visibleFilePromises");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasVisibleFiles
{
  void *v2;
  BOOL v3;

  -[FBKFeedbackFollowup visibleFilePromises](self, "visibleFilePromises");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)visibleFilePromises
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKFeedbackFollowup filePromises](self, "filePromises");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FBKDownloadableFilePromisesSelectVisible(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleResponses
{
  void *v2;
  void *v3;

  -[FBKFeedbackFollowup feedbackFollowupResponses](self, "feedbackFollowupResponses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_selectItemsPassingTest:", &__block_literal_global_78_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __39__FBKFeedbackFollowup_visibleResponses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

+ (unint64_t)followupTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (followupTypeFromString__onceToken != -1)
    dispatch_once(&followupTypeFromString__onceToken, &__block_literal_global_80_0);
  objc_msgSend((id)followupTypeFromString__mapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = -1;

  return v6;
}

void __46__FBKFeedbackFollowup_followupTypeFromString___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("unsolicited");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v10[1] = CFSTR("ping");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  v10[2] = CFSTR("required_files");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v10[3] = CFSTR("info");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = CFSTR("validate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  v10[5] = CFSTR("enhanced_logging");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  v10[6] = CFSTR("FYI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  v10[7] = CFSTR("aside");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)followupTypeFromString__mapping;
  followupTypeFromString__mapping = v8;

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKManagedFeedbackObject ID](self, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p ID:%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)respondedToAt
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBKFeedbackFollowup feedbackFollowupResponses](self, "feedbackFollowupResponses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "createdAt");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "createdAt");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)bugSessionsFromOriginalFeedback
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FBKFeedbackFollowup feedback](self, "feedback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uploadTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bugSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)type
{
  void *v3;
  unint64_t v4;

  -[FBKFeedbackFollowup willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("type"));
  -[FBKFeedbackFollowup primitiveType](self, "primitiveType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[FBKFeedbackFollowup didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("type"));
  return v4;
}

- (void)setType:(unint64_t)a3
{
  void *v5;

  -[FBKFeedbackFollowup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("type"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowup setPrimitiveType:](self, "setPrimitiveType:", v5);

  -[FBKFeedbackFollowup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("type"));
}

- (BOOL)isComplete
{
  void *v3;
  char v4;

  -[FBKFeedbackFollowup willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("complete"));
  -[FBKFeedbackFollowup primitiveComplete](self, "primitiveComplete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[FBKFeedbackFollowup didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("complete"));
  return v4;
}

- (void)setComplete:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[FBKFeedbackFollowup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("complete"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowup setPrimitiveComplete:](self, "setPrimitiveComplete:", v5);

  -[FBKFeedbackFollowup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("complete"));
}

- (NSArray)feedbackFollowupResponses
{
  void *v3;
  void *v4;

  -[FBKFeedbackFollowup willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("feedbackFollowupResponses"));
  -[FBKFeedbackFollowup primitiveFeedbackFollowupResponses](self, "primitiveFeedbackFollowupResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFeedbackFollowup didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("feedbackFollowupResponses"));
  return (NSArray *)v4;
}

- (void)setFeedbackFollowupResponses:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FBKFeedbackFollowup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("feedbackFollowupResponses"));
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFeedbackFollowup setPrimitiveFeedbackFollowupResponses:](self, "setPrimitiveFeedbackFollowupResponses:", v5);
  -[FBKFeedbackFollowup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("feedbackFollowupResponses"));
}

- (BOOL)isVisible
{
  void *v4;
  void *v5;
  BOOL v6;

  if (-[FBKFeedbackFollowup type](self, "type") == 1)
    return 0;
  if (!-[FBKFeedbackFollowup type](self, "type"))
  {
    -[FBKFeedbackFollowup uploadTask](self, "uploadTask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[FBKFeedbackFollowup feedbackFollowupResponses](self, "feedbackFollowupResponses");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        v6 = -[FBKFeedbackFollowup isComplete](self, "isComplete");

        if (v6)
          return 1;
      }
      else
      {

      }
      return 0;
    }
  }
  return 1;
}

- (BOOL)canRespond
{
  void *v2;
  void *v3;
  char v4;

  -[FBKFeedbackFollowup feedback](self, "feedback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canRespondToFollowup");

  return v4;
}

- (NSString)positiveChoice
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;

  if (-[FBKFeedbackFollowup type](self, "type") == 7)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ENHANCED_LOGGING_POSITIVE_CHOICE");
    v6 = CFSTR("Yes");
  }
  else
  {
    if (-[FBKFeedbackFollowup type](self, "type") != 4)
    {
      v7 = &stru_24E15EAF8;
      return (NSString *)v7;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("VALIDATION_POSITIVE_CHOICE");
    v6 = CFSTR("Yes, it‘s resolved");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, 0);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)negativeChoice
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;

  if (-[FBKFeedbackFollowup type](self, "type") == 7)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ENHANCED_LOGGING_NEGATIVE_CHOICE");
    v6 = CFSTR("No");
  }
  else
  {
    if (-[FBKFeedbackFollowup type](self, "type") != 4)
    {
      v7 = &stru_24E15EAF8;
      return (NSString *)v7;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("VALIDATION_NEGATIVE_CHOICE");
    v6 = CFSTR("No, it‘s not resolved");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, 0);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)noChoiceText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VALIDATION_NO_CHOICE"), CFSTR("Choose…"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)choiceText
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;

  if (-[FBKFeedbackFollowup type](self, "type") == 7)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ENHANCED_LOGGING_FFU_QUESTION");
    v6 = CFSTR("Did issue happen again?");
  }
  else
  {
    if (-[FBKFeedbackFollowup type](self, "type") != 4)
    {
      v7 = &stru_24E15EAF8;
      return (NSString *)v7;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("VALIDATION_FFU_QUESTION");
    v6 = CFSTR("Has this issue been resolved?");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, 0);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)filerFormType
{
  return 1;
}

- (NSString)platform
{
  return 0;
}

- (id)allFileMatchers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[FBKFeedbackFollowup fileMatchers](self, "fileMatchers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackFollowup feedback](self, "feedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formPlatform");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[FBKLog ffu](FBKLog, "ffu");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "could not get ffu platform from FR", buf, 2u);
    }

    v6 = (id)*MEMORY[0x24BE2CA18];
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v13, "hasPlatform", (_QWORD)v17) & 1) == 0)
          objc_msgSend(v13, "setPlatform:", v6);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

  if (v8)
    v14 = v8;
  else
    v14 = (id)objc_opt_new();
  v15 = v14;

  return v15;
}

- (BOOL)needsRefresh
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[FBKFeedbackFollowup isComplete](self, "isComplete"))
    return 0;
  -[FBKFeedbackFollowup filePromises](self, "filePromises");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FBKFeedbackFollowup filePromises](self, "filePromises");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)filerFormID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[FBKManagedFeedbackObject ID](self, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return v5;
}

- (BOOL)collectsFiles
{
  void *v2;
  BOOL v3;

  -[FBKFeedbackFollowup fileMatchers](self, "fileMatchers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)matcherPredicates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FBKMatcherPredicate *v10;
  void *v11;
  FBKMatcherPredicate *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[FBKFeedbackFollowup fileMatchers](self, "fileMatchers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [FBKMatcherPredicate alloc];
        -[FBKFeedbackFollowup stubFilePredicate](self, "stubFilePredicate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[FBKMatcherPredicate initWithFileMatcher:filePredicate:](v10, "initWithFileMatcher:filePredicate:", v9, v11);

        objc_msgSend(v3, "addObject:", v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (FBKFilePredicate)stubFilePredicate
{
  FBKFilePredicate *stubFilePredicate;
  FBKFilePredicate *v4;
  FBKFilePredicate *v5;
  unint64_t v6;

  stubFilePredicate = self->_stubFilePredicate;
  if (!stubFilePredicate)
  {
    +[FBKFileMatcherHelper stubFilePredicateWithRequiresRemote:](FBKFileMatcherHelper, "stubFilePredicateWithRequiresRemote:", 0);
    v4 = (FBKFilePredicate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stubFilePredicate;
    self->_stubFilePredicate = v4;

    v6 = -[FBKFeedbackFollowup type](self, "type");
    stubFilePredicate = self->_stubFilePredicate;
    if (v6 != 7)
    {
      -[FBKFilePredicate setAlwaysRequired:](stubFilePredicate, "setAlwaysRequired:", 1);
      stubFilePredicate = self->_stubFilePredicate;
    }
  }
  return stubFilePredicate;
}

- (BOOL)isInformationalFollowup
{
  return -[FBKFeedbackFollowup type](self, "type") == 5 || -[FBKFeedbackFollowup type](self, "type") == 6;
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKFeedbackFollowup;
  -[FBKFeedbackFollowup prepareForDeletion](&v6, sel_prepareForDeletion);
  -[FBKFeedbackFollowup filerFormID](self, "filerFormID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[FBKFileManager draftDirectoryForFilerForm:](FBKFileManager, "draftDirectoryForFilerForm:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

  }
}

- (BOOL)requiresComments
{
  unint64_t v2;

  v2 = -[FBKFeedbackFollowup type](self, "type");
  return (v2 > 7) | (0x6Bu >> v2) & 1;
}

- (BOOL)requiresValidationResponse
{
  unint64_t v2;

  v2 = -[FBKFeedbackFollowup type](self, "type");
  return v2 + 1 > 7 || (v2 + 1) == 5;
}

- (void)setStubFilePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_stubFilePredicate, a3);
}

- (void)setFilerFormType:(int64_t)a3
{
  self->_filerFormType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stubFilePredicate, 0);
}

@end

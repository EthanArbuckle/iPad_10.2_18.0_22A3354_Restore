@implementation FBKFormResponseStub

+ (id)entityName
{
  return CFSTR("FormResponseStub");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  FBKQuestionGroupStub *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  FBKFormResponseStub *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("form_id"), &v37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v37;

  if (v5)
    -[FBKFormResponseStub setFormID:](self, "setFormID:", v6);
  v36 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("submitted_at"), &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36;

  if (v7)
  {
    FBKDateFromServerString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFormResponseStub setSubmittedAt:](self, "setSubmittedAt:", v9);

  }
  v35 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("question_groups"), &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;

  if (v10)
  {
    v27 = v8;
    v28 = v6;
    v29 = self;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v17);
          v19 = -[FBKQuestionGroupStub initWithJSONObject:]([FBKQuestionGroupStub alloc], "initWithJSONObject:", v18);
          if (v19)
          {
            objc_msgSend(v12, "addObject:", v19);
          }
          else
          {
            +[FBKLog model](FBKLog, "model");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v39 = v18;
              _os_log_error_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_ERROR, "Failed to add question group stub. %{public}@", buf, 0xCu);
            }

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v15);
    }

    self = v29;
    -[FBKFormResponseStub setQuestionGroupStubs:](v29, "setQuestionGroupStubs:", v12);

    v8 = v27;
    v6 = v28;
    v11 = v26;
  }
  v30 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("file_promises"), &v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v30;

  if (v21)
  {
    -[FBKFormResponseStub managedObjectContext](self, "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFilePromiseStub, "importFromJSONArray:intoContext:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFormResponseStub setFilePromiseStubs:](self, "setFilePromiseStubs:", v24);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponseStub setUpdatedAt:](self, "setUpdatedAt:", v25);

}

- (id)visibleFilePromises
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKFormResponseStub filePromiseStubs](self, "filePromiseStubs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FBKDownloadableFilePromisesSelectVisible(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (FBKFeedback)feedback
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  -[FBKFormResponseStub contentItem](self, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[FBKLog model](FBKLog, "model");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FBKFormResponseStub feedback].cold.1(v4);

  }
  -[FBKFormResponseStub contentItem](self, "contentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKFeedback *)v6;
}

- (BOOL)isSubmitted
{
  void *v3;
  BOOL v4;
  void *v5;

  -[FBKFormResponseStub contentItem](self, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "itemType") == 4)
  {
    v4 = 1;
  }
  else
  {
    -[FBKFormResponseStub contentItem](self, "contentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "itemType") == 5;

  }
  return v4;
}

- (NSNumber)followupCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FBKFormResponseStub feedback](self, "feedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[FBKFormResponseStub feedback](self, "feedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedbackFollowupIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &unk_24E18CC08;
  }

  return (NSNumber *)v7;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("FormResponseStub"));
}

- (void)feedback
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "FormResponseStub cannot fetch feedback, content item is nil", v1, 2u);
}

@end

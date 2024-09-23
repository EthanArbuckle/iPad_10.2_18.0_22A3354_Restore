@implementation FBKFeedbackStatus

+ (id)entityName
{
  return CFSTR("FeedbackStatus");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FBKFeedbackStatus *v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v18 = self;
    v19 = v4;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("key"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v9);

        objc_msgSend(v6, "addObject:", v9);
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);

    self = v18;
    v4 = v19;
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  -[FBKFeedbackStatus setOrderedKeys:](self, "setOrderedKeys:", v15);

  v16 = (void *)objc_msgSend(v5, "copy");
  -[FBKFeedbackStatus setStatusPairs:](self, "setStatusPairs:", v16);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedbackStatus setUpdatedAt:](self, "setUpdatedAt:", v17);

}

- (FBKQuestionGroupStub)questionGroupStubRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  FBKQuestionAnswerPair *v8;
  uint64_t v9;
  uint64_t v10;
  FBKQuestionAnswerPair *v11;
  uint64_t v12;
  FBKQuestionAnswerPair *v13;
  void *v14;
  void *v15;
  FBKQuestionGroupStub *v16;
  void *v17;
  void *v18;
  FBKQuestionGroupStub *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[FBKFeedbackStatus orderedKeys](self, "orderedKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[FBKFeedbackStatus orderedKeys](self, "orderedKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v13 = [FBKQuestionAnswerPair alloc];
        -[FBKFeedbackStatus statusPairs](self, "statusPairs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[FBKQuestionAnswerPair initWithQuestionText:andAnswerText:](v13, "initWithQuestionText:andAnswerText:", v12, v15);

        objc_msgSend(v5, "addObject:", v8);
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);

  }
  v16 = [FBKQuestionGroupStub alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("STATUS_SECTION_TITLE"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FBKQuestionGroupStub initWithTitle:questions:](v16, "initWithTitle:questions:", v18, v5);

  return v19;
}

- (BOOL)isEmpty
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;

  if (FBKIsInternalInstall(self, a2))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("HideFeedbackStatus"));

    if ((v4 & 1) != 0)
      return 1;
  }
  -[FBKFeedbackStatus orderedKeys](self, "orderedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "count") == 0;

  return v5;
}

- (NSAttributedString)attributedStringRepresentation
{
  void *v3;
  int v4;
  NSObject *v5;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[8];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  if (FBKIsInternalInstall(self, a2)
    && (objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("HideFeedbackStatus")),
        v3,
        v4))
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "DEV: hidding status", buf, 2u);
    }

    return (NSAttributedString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", &stru_24E15EAF8, 0);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1688]);
    v8 = 0x24BDD1000uLL;
    if (!-[FBKFeedbackStatus isEmpty](self, "isEmpty"))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BEBE1D0];
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BEBB360];
      v44[0] = *MEMORY[0x24BEBB368];
      v14 = v44[0];
      v44[1] = v15;
      v37 = (void *)v11;
      v38 = (void *)v9;
      v45[0] = v9;
      v45[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v14;
      v42[1] = v15;
      v35 = (void *)v13;
      v36 = (void *)v12;
      v43[0] = v12;
      v43[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFeedbackStatus orderedKeys](self, "orderedKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v18 = 0;
        do
        {
          -[FBKFeedbackStatus orderedKeys](self, "orderedKeys");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[FBKFeedbackStatus statusPairs](self, "statusPairs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v8;
          v24 = objc_alloc(*(Class *)(v8 + 1112));
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:"), v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v25, v40);

          objc_msgSend(v7, "appendAttributedString:", v26);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKFeedbackStatus orderedKeys](self, "orderedKeys");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count") - 1;

          if (v29 > v18)
          {
            objc_msgSend(v27, "stringByAppendingString:", CFSTR("\n"));
            v30 = objc_claimAutoreleasedReturnValue();

            v27 = (void *)v30;
          }
          v8 = v23;
          v31 = (void *)objc_msgSend(objc_alloc(*(Class *)(v23 + 1112)), "initWithString:attributes:", v27, v39);
          objc_msgSend(v7, "appendAttributedString:", v31);

          ++v18;
          -[FBKFeedbackStatus orderedKeys](self, "orderedKeys");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "count");

        }
        while (v33 > v18);
      }

    }
    v34 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 1112)), "initWithAttributedString:", v7);

    return (NSAttributedString *)v34;
  }
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("FeedbackStatus"));
}

@end

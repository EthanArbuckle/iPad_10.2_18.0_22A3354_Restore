@implementation FBKQuestionGroup

+ (id)entityName
{
  return CFSTR("QuestionGroup");
}

+ (id)uniquingKey
{
  return CFSTR("id");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
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
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKStringIfNSNull(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionGroup setTitle:](self, "setTitle:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sort_order"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionGroup setSortOrder:](self, "setSortOrder:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("questions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKManagedLocalIDObject transformJSONArrayIntoLocalIDJSON:uniquingPrefix:](FBKQuestion, "transformJSONArrayIntoLocalIDJSON:uniquingPrefix:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKQuestionGroup managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKQuestion, "importFromJSONArray:intoContext:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortOrder"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionGroup setQuestions:](self, "setQuestions:", v16);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionGroup;
  -[FBKQuestionGroup description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionGroup title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestionGroup questions](self, "questions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ title=%@; %lu questions"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)questions
{
  void *v3;
  void *v4;
  void *v5;

  -[FBKQuestionGroup willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("questions"));
  -[FBKQuestionGroup primitiveQuestions](self, "primitiveQuestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ded_rejectItemsPassingTest:", &__block_literal_global_15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKQuestionGroup didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("questions"));
  return (NSArray *)v5;
}

BOOL __29__FBKQuestionGroup_questions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "answerType") == -1;
}

- (void)setQuestions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FBKQuestionGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("questions"));
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKQuestionGroup setPrimitiveQuestions:](self, "setPrimitiveQuestions:", v5);
  -[FBKQuestionGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("questions"));
}

- (id)questionWithRole:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBKQuestionGroup questions](self, "questions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "role");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isFileCollectionGroup
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[FBKQuestionGroup questions](self, "questions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "answerType") == 5)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

@end

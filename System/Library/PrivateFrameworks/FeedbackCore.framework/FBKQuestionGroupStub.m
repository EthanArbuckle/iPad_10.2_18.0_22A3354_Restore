@implementation FBKQuestionGroupStub

- (FBKQuestionGroupStub)initWithJSONObject:(id)a3
{
  id v4;
  FBKQuestionGroupStub *v5;
  FBKQuestionGroupStub *v6;
  FBKQuestionGroupStub *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionGroupStub;
  v5 = -[FBKQuestionGroupStub init](&v9, sel_init);
  v6 = v5;
  if (v5 && !-[FBKQuestionGroupStub setPropertiesFromJSONObject:](v5, "setPropertiesFromJSONObject:", v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (FBKQuestionGroupStub)initWithTitle:(id)a3 questions:(id)a4
{
  id v7;
  id v8;
  FBKQuestionGroupStub *v9;
  FBKQuestionGroupStub *v10;
  uint64_t v11;
  NSArray *questionAnswerPairs;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FBKQuestionGroupStub;
  v9 = -[FBKQuestionGroupStub init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    v11 = objc_msgSend(v8, "copy");
    questionAnswerPairs = v10->_questionAnswerPairs;
    v10->_questionAnswerPairs = (NSArray *)v11;

  }
  return v10;
}

- (BOOL)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FBKQuestionAnswerPair *v15;
  NSObject *v16;
  NSArray *questionAnswerPairs;
  BOOL v18;
  FBKQuestionGroupStub *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("title"), &v27);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  v7 = v27;

  if (v5
    && (objc_storeStrong((id *)&self->_title, v6),
        v26 = 0,
        FBKQuestionAnswerPairAssignObjectForKey(v4, (uint64_t)CFSTR("questions"), &v26),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = v26,
        v8,
        v8))
  {
    v20 = self;
    v21 = v7;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v5;
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v5);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
          v15 = -[FBKQuestionAnswerPair initWithJSONObject:]([FBKQuestionAnswerPair alloc], "initWithJSONObject:", v14);
          if (v15)
          {
            -[NSArray addObject:](v9, "addObject:", v15);
          }
          else
          {
            +[FBKLog model](FBKLog, "model");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v29 = v14;
              _os_log_error_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_ERROR, "Failed to add question-answer pair from %{public}@", buf, 0xCu);
            }

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v11);
    }

    questionAnswerPairs = v20->_questionAnswerPairs;
    v20->_questionAnswerPairs = v9;

    v18 = 1;
    v7 = v21;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (FBKQuestionGroupStub)initWithCoder:(id)a3
{
  id v4;
  FBKQuestionGroupStub *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSArray *questionAnswerPairs;
  NSObject *v15;
  FBKQuestionGroupStub *v16;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FBKQuestionGroupStub;
  v5 = -[FBKQuestionGroupStub init](&v19, sel_init);
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v11, CFSTR("questions"), &v18);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v18;
  questionAnswerPairs = v5->_questionAnswerPairs;
  v5->_questionAnswerPairs = (NSArray *)v12;

  if (!v13)
  {

LABEL_7:
    v16 = v5;
    goto LABEL_8;
  }
  +[FBKLog model](FBKLog, "model");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[FBKQuestionGroupStub initWithCoder:].cold.1(v13, v15);

  v16 = 0;
LABEL_8:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKQuestionGroupStub title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[FBKQuestionGroupStub questionAnswerPairs](self, "questionAnswerPairs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("questions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  char v20;
  void *v21;
  void *v22;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[FBKQuestionGroupStub questionAnswerPairs](self, "questionAnswerPairs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(v5, "questionAnswerPairs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 == v9)
    {
      -[FBKQuestionGroupStub questionAnswerPairs](self, "questionAnswerPairs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "count");

      if (v11)
      {
        v12 = 0;
        v11 = 0;
        v13 = 0;
        while (1)
        {
          v14 = v13;
          v15 = v11;
          -[FBKQuestionGroupStub questionAnswerPairs](self, "questionAnswerPairs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "questionAnswerPairs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v13, "isEqual:", v11) & 1) == 0)
            break;
          ++v12;
          -[FBKQuestionGroupStub questionAnswerPairs](self, "questionAnswerPairs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v12 >= v19)
            goto LABEL_12;
        }
        v20 = 0;
      }
      else
      {
        v13 = 0;
LABEL_12:
        -[FBKQuestionGroupStub title](self, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "isEqualToString:", v22);

      }
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)questionAnswerPairs
{
  return self->_questionAnswerPairs;
}

- (void)setQuestionAnswerPairs:(id)a3
{
  objc_storeStrong((id *)&self->_questionAnswerPairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_questionAnswerPairs, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Error decoding question answer pair object. %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

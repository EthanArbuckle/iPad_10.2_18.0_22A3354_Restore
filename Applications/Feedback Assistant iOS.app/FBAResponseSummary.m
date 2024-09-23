@implementation FBAResponseSummary

- (FBAResponseSummary)init
{
  uint64_t v2;
  FBAResponseSummary *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAResponseSummary;
  v3 = -[FBAResponseSummary init](&v6, "init");
  if (v3)
  {
    v4 = (void *)objc_opt_new(NSMutableArray, v2);
    -[FBAResponseSummary setSimpleGroups:](v3, "setSimpleGroups:", v4);

  }
  return v3;
}

- (void)updateWithFormResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  FBAResponseSummary *v27;
  void *v28;
  unsigned int v29;
  SimpleQuestionGroup *v30;
  id v31;
  SimpleQuestionGroup *v32;
  void *v33;
  id obj;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _BYTE v53[128];
  _BYTE v54[128];

  v36 = a3;
  -[FBAResponseSummary setFormResponse:](self, "setFormResponse:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary simpleGroups](self, "simpleGroups"));
  objc_msgSend(v4, "removeAllObjects");

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary formResponse](self, "formResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bugForm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "questionGroups"));

  obj = v7;
  v37 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v48;
    v9 = FBKQuestionRoleOptOutReason;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v48 != v35)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v10);
        v40 = (void *)objc_opt_new(NSMutableArray, v8);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "questions"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        v38 = v11;
        v39 = v10;
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v44;
          v41 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v44 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "role"));
              v19 = objc_msgSend(v18, "isEqualToString:", v9);

              if ((v19 & 1) == 0)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary formResponse](self, "formResponse"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ID"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "answerForQuestionID:", v21));

                if (v22)
                {
                  v23 = objc_msgSend(v22, "resolved");
                  if (v23)
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
                    v42 = v24;
                    if (!objc_msgSend(v24, "length"))
                      goto LABEL_20;
                  }
                  v25 = v9;
                  v26 = v12;
                  v27 = self;
                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary formResponse](self, "formResponse"));
                  v29 = objc_msgSend(v28, "isAnswerExpectedForQuestion:", v17);

                  if (v23)
                  {

                    if ((v29 & 1) == 0)
                      goto LABEL_17;
LABEL_19:
                    v51[0] = CFSTR("q");
                    v51[1] = CFSTR("a");
                    v52[0] = v17;
                    v52[1] = v22;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
                    objc_msgSend(v40, "addObject:", v24);
                    self = v27;
                    v12 = v26;
                    v9 = v25;
                    v15 = v41;
LABEL_20:

                  }
                  else
                  {
                    if (v29)
                      goto LABEL_19;
LABEL_17:
                    self = v27;
                    v12 = v26;
                    v9 = v25;
                    v15 = v41;
                  }
                }

                continue;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
          }
          while (v14);
        }

        v30 = [SimpleQuestionGroup alloc];
        v31 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v40, 1);
        v32 = -[SimpleQuestionGroup initWithQuestionGroup:questionAnswerPairs:](v30, "initWithQuestionGroup:questionAnswerPairs:", v38, v31);

        -[SimpleQuestionGroup setFormResponse:](v32, "setFormResponse:", v36);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary simpleGroups](self, "simpleGroups"));
        objc_msgSend(v33, "addObject:", v32);

        v10 = v39 + 1;
      }
      while ((id)(v39 + 1) != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v37);
  }

}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary simpleGroups](self, "simpleGroups"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = &stru_1000EA660;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "description"));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\r%@"), v9, v10));

        v8 = (char *)v8 + 1;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1000EA660;
  }

  v11 = objc_opt_class(self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary formResponse](self, "formResponse"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\r%@\r%@"), v11, v12, v7));

  return v13;
}

- (id)simpleGroupInSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary simpleGroups](self, "simpleGroups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (int64_t)sectionCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBAResponseSummary simpleGroups](self, "simpleGroups"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (FBKFormResponse)formResponse
{
  return self->_formResponse;
}

- (void)setFormResponse:(id)a3
{
  objc_storeStrong((id *)&self->_formResponse, a3);
}

- (NSMutableArray)simpleGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSimpleGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleGroups, 0);
  objc_storeStrong((id *)&self->_formResponse, 0);
}

@end

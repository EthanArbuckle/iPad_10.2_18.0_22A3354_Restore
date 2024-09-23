@implementation FBKFormResponse

+ (id)entityName
{
  return CFSTR("FormResponse");
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
  uint64_t v12;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKFormResponse setRemote:](self, "setRemote:", 1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("created_at"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    FBKDateFromServerString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFormResponse setCreatedAt:](self, "setCreatedAt:", v7);

  }
  else
  {
    -[FBKFormResponse setCreatedAt:](self, "setCreatedAt:", 0);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updated_at"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    FBKDateFromServerString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("for_build"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
    -[FBKFormResponse setBuildString:](self, "setBuildString:", v12);
  v75 = (void *)v12;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("form_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse setFormID:](self, "setFormID:", v14);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = v10;
  if (!v15)
  {
    -[FBKFormResponse updatedAt](self, "updatedAt");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32 && v10)
    {
      -[FBKFormResponse answers](self, "answers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        -[FBKFormResponse updatedAt](self, "updatedAt");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v10, "compare:", v36);
        v38 = -[FBKFormResponse isStub](self, "isStub");
        if (v37 == 1)
          v39 = 1;
        else
          v39 = v38;
        -[FBKFormResponse setIsStub:](self, "setIsStub:", v39);

        goto LABEL_29;
      }
    }
    else
    {

    }
    -[FBKFormResponse setIsStub:](self, "setIsStub:", 1);
    goto LABEL_29;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("form_id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("form_id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKFormResponse managedObjectContext](self, "managedObjectContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "feedbackObjectWithEntityName:remoteID:creatingIfNeeded:", CFSTR("BugForm"), v19, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answers"), v9, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse managedObjectContext](self, "managedObjectContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKAnswer, "importFromJSONArray:intoContext:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse setAnswers:](self, "setAnswers:", v23);

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[FBKFormResponse answers](self, "answers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v78 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v29, "questionID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "questionForQuestionID:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setQuestion:", v31);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    }
    while (v26);
  }

  -[FBKFormResponse setIsStub:](self, "setIsStub:", 0);
  v9 = v69;
  v6 = v70;
  v10 = v71;
LABEL_29:
  -[FBKFormResponse setUpdatedAt:](self, "setUpdatedAt:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("short_description"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("short_description"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41 == v42)
    {
      v43 = &stru_24E15EAF8;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("short_description"));
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[FBKFormResponse setExtractedProblemDescription:](self, "setExtractedProblemDescription:", v43);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v44);
  v45 = objc_claimAutoreleasedReturnValue();

  if (v45)
    -[FBKFormResponse setExtractedTitle:](self, "setExtractedTitle:", v45);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feedback_ident"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v46);
  v47 = objc_claimAutoreleasedReturnValue();

  if (v47)
    -[FBKFormResponse setFeedbackID:](self, "setFeedbackID:", v47);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answers_complete"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = v49;
  if (v49 && objc_msgSend(v49, "BOOLValue"))
    -[FBKFormResponse setCompleted:](self, "setCompleted:", 1);
  v74 = (void *)v45;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("area_type"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    FBKNilIfNSNull(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFormResponse setExtractedIssueType:](self, "setExtractedIssueType:", v52);

  }
  v72 = v51;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followup_count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53 != v54)
    {
      -[FBKFormResponse extractedFollowupCount](self, "extractedFollowupCount");
      v55 = objc_claimAutoreleasedReturnValue();
      if (!v55
        || (v56 = (void *)v55,
            -[FBKFormResponse extractedFollowupCount](self, "extractedFollowupCount"),
            v57 = (void *)objc_claimAutoreleasedReturnValue(),
            v58 = objc_msgSend(v57, "compare:", v53),
            v57,
            v56,
            v58))
      {
        -[FBKFormResponse setIsStub:](self, "setIsStub:", 1);
      }
      -[FBKFormResponse setExtractedFollowupCount:](self, "setExtractedFollowupCount:", v53);
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("large_file_prefix"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FBKFormResponse setLargeFilePrefix:](self, "setLargeFilePrefix:", v60);
  }
  v73 = (void *)v47;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_complete"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[FBKFormResponse setServerSideIsComplete:](self, "setServerSideIsComplete:", objc_msgSend(v62, "BOOLValue"));
    -[FBKFormResponse setCompleted:](self, "setCompleted:", objc_msgSend(v62, "BOOLValue"));
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file_promises"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FBKFormResponse managedObjectContext](self, "managedObjectContext");
      v65 = v9;
      v66 = v6;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFilePromise, "importFromJSONArray:intoContext:", v64, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFormResponse setFilePromises:](self, "setFilePromises:", v68);

      v6 = v66;
      v9 = v65;
      v10 = v71;
    }
  }

}

- (BOOL)isCompleted
{
  void *v3;
  char v4;

  -[FBKFormResponse willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("completed"));
  -[FBKFormResponse primitiveCompleted](self, "primitiveCompleted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[FBKFormResponse didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("completed"));
  return v4;
}

- (void)setCompleted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[FBKFormResponse willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("completed"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse setPrimitiveCompleted:](self, "setPrimitiveCompleted:", v5);

  -[FBKFormResponse didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("completed"));
}

- (id)answersDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[FBKFormResponse bugForm](self, "bugForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "questionGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v6;
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v7, "questions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
              v14 = objc_alloc(MEMORY[0x24BDBCE30]);
              -[FBKFormResponse answerForQuestion:](self, "answerForQuestion:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "values");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(v14, "initWithArray:copyItems:", v16, 1);

              objc_msgSend(v13, "role");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v17, v18);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v10);
        }

        v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  v19 = (void *)objc_msgSend(v3, "copy");
  return v19;
}

- (id)answerForQuestion:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "answers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__FBKFormResponse_answerForQuestion___block_invoke;
  v7[3] = &unk_24E156A58;
  v7[4] = self;
  objc_msgSend(v4, "ded_findWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __37__FBKFormResponse_answerForQuestion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "formResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)answerForQuestionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("questionID = %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFormResponse answers](self, "answers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredSetUsingPredicate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateExtractedValuesFromAnswers
{
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
  id v14;

  -[FBKFormResponse bugForm](self, "bugForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "questionWithRole:", CFSTR(":title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse valueForQuestionID:](self, "valueForQuestionID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse setExtractedTitle:](self, "setExtractedTitle:", v6);

  -[FBKFormResponse bugForm](self, "bugForm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "questionWithRole:", CFSTR(":description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse valueForQuestionID:](self, "valueForQuestionID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse setExtractedProblemDescription:](self, "setExtractedProblemDescription:", v10);

  -[FBKFormResponse bugForm](self, "bugForm");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "questionWithRole:", CFSTR(":type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse valueForQuestionID:](self, "valueForQuestionID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse setExtractedIssueType:](self, "setExtractedIssueType:", v13);

}

- (id)valueForQuestionID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("questionID = %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse answers](self, "answers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredSetUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)valuesForQuestionID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("questionID = %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFormResponse answers](self, "answers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredSetUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setValue:(id)a3 forQuestionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FBKFormResponse answers](self, "answers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "questionID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v7);

        if (v15)
        {
          objc_msgSend(v13, "setValue:", v6);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

+ (id)keyPathsForValuesAffectingTitleAnswer
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("titleAnswers"));
}

- (FBKAnswer)titleAnswer
{
  void *v2;
  void *v3;

  -[FBKFormResponse titleAnswers](self, "titleAnswers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKAnswer *)v3;
}

+ (id)keyPathsForValuesAffectingTitle
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("titleAnswer.value"), CFSTR("extractedTitle"), 0);
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;

  -[FBKFormResponse willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("title"));
  -[FBKFormResponse titleAnswer](self, "titleAnswer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKFormResponse titleAnswer](self, "titleAnswer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKFormResponse extractedTitle](self, "extractedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FBKFormResponse didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("title"));
  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingProblemDescriptionAnswer
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("problemDescriptionAnswers"));
}

- (FBKAnswer)problemDescriptionAnswer
{
  void *v2;
  void *v3;

  -[FBKFormResponse problemDescriptionAnswers](self, "problemDescriptionAnswers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKAnswer *)v3;
}

+ (id)keyPathsForValuesAffectingProblemDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("problemDescriptionAnswer.value"), CFSTR("extractedProblemDescription"), 0);
}

- (NSString)problemDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[FBKFormResponse willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("problemDescription"));
  -[FBKFormResponse problemDescriptionAnswer](self, "problemDescriptionAnswer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKFormResponse problemDescriptionAnswer](self, "problemDescriptionAnswer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKFormResponse extractedProblemDescription](self, "extractedProblemDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FBKFormResponse didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("problemDescription"));
  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingIssueTypeAnswer
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("issueTypeAnswers"));
}

- (FBKAnswer)issueTypeAnswer
{
  void *v2;
  void *v3;

  -[FBKFormResponse issueTypeAnswers](self, "issueTypeAnswers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKAnswer *)v3;
}

+ (id)keyPathsForValuesAffectingIssueType
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("issueTypeAnswer.value"), CFSTR("extractedIssueType"), 0);
}

- (NSString)issueType
{
  void *v3;
  void *v4;
  void *v5;

  -[FBKFormResponse willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("issueType"));
  -[FBKFormResponse issueTypeAnswer](self, "issueTypeAnswer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKFormResponse issueTypeAnswer](self, "issueTypeAnswer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKFormResponse extractedIssueType](self, "extractedIssueType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FBKFormResponse didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("issueType"));
  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingFollowupCount
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("feedback.feedbackFollowups.@count"), CFSTR("extractedFollowupCount"), 0);
}

- (NSNumber)followupCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FBKFormResponse willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("followupCount"));
  -[FBKFormResponse feedback](self, "feedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedbackFollowups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[FBKFormResponse feedback](self, "feedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feedbackFollowups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKFormResponse extractedFollowupCount](self, "extractedFollowupCount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FBKFormResponse didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("followupCount"));
  return (NSNumber *)v8;
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKFormResponse;
  -[FBKFormResponse prepareForDeletion](&v6, sel_prepareForDeletion);
  -[FBKFormResponse filerFormID](self, "filerFormID");
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

- (int64_t)filerFormType
{
  return 0;
}

- (NSString)platform
{
  void *v2;
  void *v3;

  -[FBKFormResponse bugForm](self, "bugForm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)formPlatform
{
  void *v2;
  void *v3;

  -[FBKFormResponse bugForm](self, "bugForm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)collectsFiles
{
  void *v2;
  char v3;

  -[FBKFormResponse bugForm](self, "bugForm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collectsFiles");

  return v3;
}

- (id)findAnswerForRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[FBKFormResponse bugForm](self, "bugForm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "questionWithRole:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFormResponse answerForQuestion:](self, "answerForQuestion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)evaluateConditional:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 1)
  {
    LOBYTE(v7) = -[FBKFormResponse evaluateConditional:](self, "evaluateConditional:", v6);
    goto LABEL_25;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", -[FBKFormResponse evaluateConditional:](self, "evaluateConditional:", v6));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 & 1) != 0)
      goto LABEL_8;
    -[FBKFormResponse findAnswerForRole:](self, "findAnswerForRole:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;

  v6 = v13;
LABEL_8:
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithBool:", -[FBKFormResponse evaluateConditional:](self, "evaluateConditional:", v18));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR(":==")))
  {
    v20 = objc_msgSend(v6, "isEqualToString:", v19);
  }
  else
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR(":!=")))
    {
      v7 = objc_msgSend(v6, "isEqualToString:", v19) ^ 1;
      goto LABEL_22;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR(":and")))
    {
      if (!objc_msgSend(v6, "BOOLValue"))
      {
        v7 = 0;
        goto LABEL_22;
      }
    }
    else if (!objc_msgSend(v14, "isEqualToString:", CFSTR(":or"))
           || (objc_msgSend(v6, "BOOLValue") & 1) != 0)
    {
      v7 = 1;
      goto LABEL_22;
    }
    v20 = objc_msgSend(v19, "BOOLValue");
  }
  v7 = v20;
LABEL_22:
  if (objc_msgSend(v4, "count") != 3)
  {
    v21 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayWithObject:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 3, objc_msgSend(v4, "count") - 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v7) = -[FBKFormResponse evaluateConditional:](self, "evaluateConditional:", v25);
  }

LABEL_25:
  return v7;
}

- (BOOL)isAnswerExpectedForQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isConditional"))
  {
    objc_msgSend(v4, "conditions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "conditions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[FBKFormResponse evaluateConditional:](self, "evaluateConditional:", v6);
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v4, "conditionQuestionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "conditionQuestionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKFormResponse valueForQuestionID:](self, "valueForQuestionID:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "conditionValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v10)
        v7 = 1;
      else
        v7 = objc_msgSend(v6, "isEqual:", v10);

      goto LABEL_10;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)matcherPredicates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  FBKFormResponse *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  FBKMatcherPredicate *v17;
  uint64_t v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[FBKFormResponse bugForm](self, "bugForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filePredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    v19 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v20 = v7;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        if (objc_msgSend(v10, "satisfiedBy:", self))
        {
          v11 = self;
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v10, "matchers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v23 != v15)
                  objc_enumerationMutation(v12);
                v17 = -[FBKMatcherPredicate initWithFileMatcher:filePredicate:]([FBKMatcherPredicate alloc], "initWithFileMatcher:filePredicate:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v10);
                objc_msgSend(v3, "addObject:", v17);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v14);
          }

          self = v11;
          v8 = v19;
          v7 = v20;
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)fileMatchers
{
  void *v2;
  void *v3;

  -[FBKFormResponse matcherPredicates](self, "matcherPredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __31__FBKFormResponse_fileMatchers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fileMatcher");
}

- (void)setFilerFormType:(int64_t)a3
{
  self->_filerFormType = a3;
}

@end

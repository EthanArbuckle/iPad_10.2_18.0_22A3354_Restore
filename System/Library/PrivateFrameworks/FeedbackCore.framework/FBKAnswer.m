@implementation FBKAnswer

+ (id)entityName
{
  return CFSTR("Answer");
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
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("question_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("values"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("values"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((FBKJSONObjectIsNil(v19) & 1) == 0)
            objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

    v20 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ignore_required"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  -[FBKManagedFeedbackObject setID:](self, "setID:", v7);
  -[FBKAnswer setQuestionID:](self, "setQuestionID:", v10);
  -[FBKAnswer setValues:](self, "setValues:", v20);
  -[FBKAnswer setOptedOut:](self, "setOptedOut:", v22);
  -[FBKAnswer setResolved:](self, "setResolved:", 0);

}

+ (id)_importByQuestionIDFromJSONArray:(id)a3 withFormResponseID:(id)a4 intoContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  FBKArrayToKeyDictionary(v7, CFSTR("question_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__FBKAnswer__importByQuestionIDFromJSONArray_withFormResponseID_intoContext___block_invoke;
  v17[3] = &unk_24E15AD18;
  v11 = v9;
  v18 = v11;
  v12 = v8;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  v14 = v10;
  v21 = v14;
  v22 = &v23;
  objc_msgSend(v11, "performBlockAndWait:", v17);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __77__FBKAnswer__importByQuestionIDFromJSONArray_withFormResponseID_intoContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  +[FBKFormResponse entityName](FBKFormResponse, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedbackObjectWithEntityName:remoteID:creatingIfNeeded:", v3, *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Answer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(*(id *)(a1 + 56), "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v4;
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("questionID in %@ AND formResponse = %@"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v8);

    v9 = *(void **)(a1 + 32);
    v53 = 0;
    v41 = v5;
    objc_msgSend(v9, "executeFetchRequest:error:", v5, &v53);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v53;
    v11 = objc_alloc(MEMORY[0x24BDBCEF0]);
    objc_msgSend(*(id *)(a1 + 56), "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

    v40 = v10;
    if (!v10)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v14 = v43;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v50 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            v20 = *(void **)(a1 + 56);
            objc_msgSend(v19, "questionID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setPropertiesFromJSONObject:", v22);

            v23 = *(void **)(a1 + 56);
            objc_msgSend(v19, "questionID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("id"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setID:", v26);

            objc_msgSend(v19, "questionID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObject:", v27);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v16);
      }

      objc_msgSend(v44, "addObjectsFromArray:", v14);
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v28 = v13;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = *(void **)(a1 + 32);
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("id"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "createFeedbackObjectWithEntityName:remoteID:", CFSTR("Answer"), v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "setPropertiesFromJSONObject:", v33);
          objc_msgSend(v44, "addObject:", v36);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v30);
    }

    v37 = objc_msgSend(v44, "copy");
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v39 = *(void **)(v38 + 40);
    *(_QWORD *)(v38 + 40) = v37;

    v4 = v42;
  }

}

+ (id)emptyLocalAnswerForQuestion:(id)a3 inFormResponse:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__FBKAnswer_emptyLocalAnswerForQuestion_inFormResponse___block_invoke;
  v12[3] = &unk_24E15AD40;
  v15 = &v16;
  v8 = v6;
  v13 = v8;
  v9 = v5;
  v14 = v9;
  objc_msgSend(v7, "performBlockAndWait:", v12);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __56__FBKAnswer_emptyLocalAnswerForQuestion_inFormResponse___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createFeedbackObjectWithEntityName:remoteID:", CFSTR("Answer"), &unk_24E18CD10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 40), "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setQuestionID:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setQuestion:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "addAnswer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setValues:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setOptedOut:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setResolved:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setFormResponse:", *(_QWORD *)(a1 + 32));
}

+ (unint64_t)answerTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (answerTypeFromString__onceToken != -1)
    dispatch_once(&answerTypeFromString__onceToken, &__block_literal_global_44);
  objc_msgSend((id)answerTypeFromString__mapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = -1;

  return v6;
}

void __34__FBKAnswer_answerTypeFromString___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[12];
  _QWORD v15[14];

  v15[12] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("Text Field");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v13;
  v14[1] = CFSTR("Text Area");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  v14[2] = CFSTR("Popup");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v0;
  v14[3] = CFSTR("Radio Button");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v1;
  v14[4] = CFSTR("Check Box");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v2;
  v14[5] = CFSTR("Required File Zone");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v3;
  v14[6] = CFSTR("Information");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v4;
  v14[7] = CFSTR("Slider");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v5;
  v14[8] = CFSTR("Date");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v6;
  v14[9] = CFSTR("Date and Time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v7;
  v14[10] = CFSTR("Time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[10] = v8;
  v14[11] = CFSTR("Modal");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[11] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)answerTypeFromString__mapping;
  answerTypeFromString__mapping = v10;

}

+ (id)keyPathsForValuesAffectingValue
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("values"));
}

- (id)value
{
  void *v3;
  void *v4;
  void *v5;

  -[FBKAnswer willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("value"));
  -[FBKAnswer values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[FBKAnswer values](self, "values");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  -[FBKAnswer didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("value"));
  return v5;
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKAnswer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("value"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v4)
    {
      -[FBKAnswer setValues:](self, "setValues:", MEMORY[0x24BDBD1A8]);
      goto LABEL_6;
    }
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  -[FBKAnswer setValues:](self, "setValues:", v5);

LABEL_6:
  -[FBKAnswer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("value"));

}

- (BOOL)isAnswered
{
  void *v2;
  void *v3;
  BOOL v4;

  -[FBKAnswer values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isOptedOut
{
  void *v3;
  char v4;

  -[FBKAnswer willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("optedOut"));
  -[FBKAnswer primitiveOptedOut](self, "primitiveOptedOut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[FBKAnswer didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("optedOut"));
  return v4;
}

- (void)setOptedOut:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[FBKAnswer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("optedOut"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAnswer setPrimitiveOptedOut:](self, "setPrimitiveOptedOut:", v5);

  -[FBKAnswer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("optedOut"));
}

@end

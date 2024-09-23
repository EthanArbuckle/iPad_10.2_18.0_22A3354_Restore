@implementation FBKQuestion

+ (id)entityName
{
  return CFSTR("Question");
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
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  FBKQuestionChoice *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  FBKQuestion *v54;
  FBKQuestion *v55;
  unsigned int v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  _QWORD v66[5];
  uint8_t v67;
  _BYTE v68[15];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKManagedLocalIDObject setPropertiesForLocalIDKeys:](self, "setPropertiesForLocalIDKeys:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKStringIfNSNull(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answer_widget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[FBKAnswer answerTypeFromString:](FBKAnswer, "answerTypeFromString:", v7);

  if (v8 == 11)
  {
    if (+[FBKSharedConstants isEnhancedLoggingEnabled](FBKSharedConstants, "isEnhancedLoggingEnabled"))
      v8 = 11;
    else
      v8 = -1;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_required"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_visible_in_form"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = FBKTrueIfNSNull(v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user_agent_populate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v13);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("target_user_agent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v14);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeholder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (FBKJSONObjectIsNil(v15))
  {

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeholder"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeholder"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  v61 = 0;
LABEL_10:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("choice_set"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v19;
  if (v19)
  {
    v54 = self;
    v52 = v4;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("server_side_resolver"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    FBKNilIfNSNull(v20);
    v64 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("choice_options"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v70 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            +[FBKQuestionChoice choiceFromArray:](FBKQuestionChoice, "choiceFromArray:", v27);
            v28 = (FBKQuestionChoice *)objc_claimAutoreleasedReturnValue();
            if (!v28)
              goto LABEL_23;
            goto LABEL_20;
          }
          if (v27)
          {
            v28 = -[FBKQuestionChoice initWithTitle:value:]([FBKQuestionChoice alloc], "initWithTitle:value:", v27, v27);
LABEL_20:
            objc_msgSend(v21, "addObject:", v28);
            goto LABEL_23;
          }
          +[FBKLog model](FBKLog, "model");
          v28 = (FBKQuestionChoice *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_ERROR))
            -[FBKQuestion setPropertiesFromJSONObject:].cold.1(&v67, v68, &v28->super);
LABEL_23:

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v24);
    }

    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("client_side_resolver"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (FBKJSONObjectIsNil(v29))
    {

      v30 = 0;
      v4 = v52;
      self = v54;
      v19 = (void *)v64;
    }
    else
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("client_side_resolver"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v31, "length");

      v4 = v52;
      self = v54;
      if (v30)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("client_side_resolver"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)v64;
    }
  }
  else
  {
    v30 = 0;
    v21 = 0;
  }
  -[FBKQuestion setText:](self, "setText:", v6);
  -[FBKQuestion setRole:](self, "setRole:", v12);
  -[FBKQuestion setPlaceholder:](self, "setPlaceholder:", v61);
  v65 = v19;
  -[FBKQuestion setResolver:](self, "setResolver:", v19);
  -[FBKQuestion setAnswerType:](self, "setAnswerType:", v8);
  -[FBKQuestion setRequired:](self, "setRequired:", v56);
  -[FBKQuestion setChoices:](self, "setChoices:", v21);
  -[FBKQuestion setChoiceSetClientSideResolver:](self, "setChoiceSetClientSideResolver:", v30);
  -[FBKQuestion setConditional:](self, "setConditional:", 0);
  -[FBKQuestion setConditions:](self, "setConditions:", 0);
  -[FBKQuestion setTargetUserAgent:](self, "setTargetUserAgent:", v62);
  -[FBKQuestion setUserAgentPopulate:](self, "setUserAgentPopulate:", v63);
  -[FBKQuestion setVisible:](self, "setVisible:", v58);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sort_order"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestion setSortOrder:](self, "setSortOrder:", v33);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditions"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34 != v35)
    {
      v36 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v34, "dataUsingEncoding:", 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "JSONObjectWithData:options:error:", v37, 0, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKQuestion setConditions:](self, "setConditions:", v38);

      -[FBKQuestion conditions](self, "conditions");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
        -[FBKQuestion setConditional:](self, "setConditional:", 1);
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditional_question_id"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40 != v41)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditional_question_value"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      FBKNilIfNSNull(v42);
      v43 = v12;
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKQuestion setConditional:](self, "setConditional:", 1);
      -[FBKQuestion setConditionQuestionID:](self, "setConditionQuestionID:", v40);
      -[FBKQuestion setConditionValue:](self, "setConditionValue:", v44);

      v12 = v43;
    }
  }
  if (+[FBKSharedConstants isEnhancedLoggingEnabled](FBKSharedConstants, "isEnhancedLoggingEnabled"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modal_configurations"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v45, "count"))
        {
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("sortOrder"), 1);
          objc_msgSend(v45, "ded_selectItemsPassingTest:", &__block_literal_global_33);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = MEMORY[0x24BDAC760];
          v66[1] = 3221225472;
          v66[2] = __43__FBKQuestion_setPropertiesFromJSONObject___block_invoke_2;
          v66[3] = &unk_24E159348;
          v66[4] = self;
          objc_msgSend(v57, "ded_mapWithBlock:", v66);
          v55 = self;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v59;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
          v53 = v12;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "sortedArrayUsingDescriptors:", v47);
          v48 = v6;
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          self = v55;
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v49);
          -[FBKQuestion setModalConfigurations:](v55, "setModalConfigurations:", v50);

          v12 = v53;
          v6 = v48;

        }
      }
    }

  }
  if (-[FBKQuestion matchesInlineChoiceTypes](self, "matchesInlineChoiceTypes"))
  {
    -[FBKQuestion choiceSetClientSideResolver](self, "choiceSetClientSideResolver");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKQuestion setCanDisplayChoicesInline:](self, "setCanDisplayChoicesInline:", objc_msgSend(v51, "hasPrefix:", CFSTR("appTitlesBundles")) ^ 1);

  }
  else
  {
    -[FBKQuestion setCanDisplayChoicesInline:](self, "setCanDisplayChoicesInline:", 0);
  }

}

uint64_t __43__FBKQuestion_setPropertiesFromJSONObject___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __43__FBKQuestion_setPropertiesFromJSONObject___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKModalConfiguration, "importFromJSONObject:intoContext:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allChoices
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FBKQuestion choiceSetClientSideResolver](self, "choiceSetClientSideResolver");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[FBKQuestion choiceSetResolver](self, "choiceSetResolver"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[FBKQuestion choiceSetResolver](self, "choiceSetResolver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "choices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKQuestion choices](self, "choices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)FBKQuestion;
  -[FBKQuestion description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestion text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBKQuestion answerType](self, "answerType");
  -[FBKQuestion choices](self, "choices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ text=%@; answerType=%lu; %lu choices"),
    v4,
    v5,
    v6,
    objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)affectsRequirements
{
  void *v3;
  char v4;
  void *v5;

  -[FBKQuestion role](self, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR(":type")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[FBKQuestion role](self, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR(":area"));

  }
  return v4;
}

- (id)titleForValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBKQuestion choices](self, "choices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "title");
          v13 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = v4;
LABEL_11:

  return v13;
}

- (BOOL)isMultiSelect
{
  return -[FBKQuestion answerType](self, "answerType") == 4;
}

- (BOOL)shouldHaveChoices
{
  unint64_t v2;

  v2 = -[FBKQuestion answerType](self, "answerType");
  return (v2 < 8) & (0x9Cu >> v2);
}

- (BOOL)matchesInlineChoiceTypes
{
  return -[FBKQuestion answerType](self, "answerType") - 3 < 2;
}

- (id)choiceForValue:(id)a3
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
  -[FBKQuestion choices](self, "choices", 0);
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
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

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

- (unint64_t)answerType
{
  void *v3;
  unint64_t v4;

  -[FBKQuestion willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("answerType"));
  -[FBKQuestion primitiveAnswerType](self, "primitiveAnswerType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[FBKQuestion didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("answerType"));
  return v4;
}

- (void)setAnswerType:(unint64_t)a3
{
  void *v5;

  -[FBKQuestion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("answerType"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestion setPrimitiveAnswerType:](self, "setPrimitiveAnswerType:", v5);

  -[FBKQuestion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("answerType"));
}

- (BOOL)isRequired
{
  void *v3;
  char v4;

  -[FBKQuestion willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("required"));
  -[FBKQuestion primitiveRequired](self, "primitiveRequired");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[FBKQuestion didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("required"));
  return v4;
}

- (void)setRequired:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[FBKQuestion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("required"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestion setPrimitiveRequired:](self, "setPrimitiveRequired:", v5);

  -[FBKQuestion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("required"));
}

- (BOOL)isConditional
{
  void *v3;
  char v4;

  -[FBKQuestion willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("conditional"));
  -[FBKQuestion primitiveConditional](self, "primitiveConditional");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[FBKQuestion didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("conditional"));
  return v4;
}

- (void)setConditional:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[FBKQuestion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("conditional"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKQuestion setPrimitiveConditional:](self, "setPrimitiveConditional:", v5);

  -[FBKQuestion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("conditional"));
}

- (BOOL)appearsRequiredIfOptional
{
  void *v3;
  void *v4;
  char v5;

  -[FBKQuestion role](self, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FBKQuestion role](self, "role");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("_req"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)displayTextForAnswer:(id)a3
{
  id v4;
  FBKQuestion *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  FBKQuestion *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v4;
    objc_msgSend(v34, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[FBKQuestion choiceSetClientSideResolver](v5, "choiceSetClientSideResolver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("appTitlesBundles"));

      if (v9)
      {
        objc_msgSend(v34, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[FBKAppListResolver displayValueForChoiceValue:](FBKAppListResolver, "displayValueForChoiceValue:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
        goto LABEL_34;
      }
    }
    v32 = v5;
    v33 = v4;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[FBKQuestion allChoices](v5, "allChoices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v18, "value");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "value");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "value");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "isEqualToString:", v29);

            if ((v30 & 1) != 0)
              goto LABEL_31;
          }
          else
          {

          }
        }
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v24);
    }

    objc_msgSend(v34, "value");
    v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
    v11 = v22;
LABEL_32:
    v5 = v32;
    v4 = v33;
    goto LABEL_33;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    v32 = v5;
    v33 = v4;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[FBKQuestion allChoices](v5, "allChoices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      while (2)
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v18, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", v11);

            if ((v21 & 1) != 0)
            {
LABEL_31:
              objc_msgSend(v18, "title");
              v11 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_32;
            }
          }
          else
          {

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v15)
          continue;
        break;
      }
    }

    v22 = v11;
    goto LABEL_30;
  }
LABEL_34:

  return v11;
}

- (BOOL)isAnswerableByAutoFill
{
  return -[FBKQuestion answerType](self, "answerType") != 5
      && -[FBKQuestion answerType](self, "answerType") != 6
      && -[FBKQuestion answerType](self, "answerType") != 11;
}

- (NSString)tat
{
  void *v3;
  NSObject *v4;

  -[FBKQuestion role](self, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[FBKLog model](FBKLog, "model");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[FBKQuestion tat].cold.1((uint64_t)self, v4);

  }
  -[FBKQuestion role](self, "role");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addAnswer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[FBKQuestion answers](self, "answers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v9 = v7;

  objc_msgSend(v9, "setByAddingObject:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKQuestion setAnswers:](self, "setAnswers:", v8);
}

- (NSArray)visibleChoices
{
  void *v2;
  void *v3;

  -[FBKQuestion allChoices](self, "allChoices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_rejectItemsPassingTest:", &__block_literal_global_94);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __29__FBKQuestion_visibleChoices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrompt");
}

- (id)diffableHashWithContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "answerForQuestion:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_24E15EAF8;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[FBKQuestion role](self, "role");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)prepareForDeletion
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)FBKQuestion;
  -[FBKQuestion prepareForDeletion](&v7, sel_prepareForDeletion);
  +[FBKLog model](FBKLog, "model");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[FBKManagedLocalIDObject ID](self, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKQuestion role](self, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_INFO, "FBKQuestion [%{public}@: %{public}@] is being deleted.", buf, 0x16u);

  }
}

- (FBKChoiceSetResolverProtocol)choiceSetResolver
{
  return self->choiceSetResolver;
}

- (void)setChoiceSetResolver:(id)a3
{
  objc_storeStrong((id *)&self->choiceSetResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->choiceSetResolver, 0);
}

- (id)answerToDisplayNameValueTransformer
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FBKQuestionValueToDisplayNameTransformer *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FBKQuestion choices](self, "choices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "setValue:forKey:", v11, v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v11, v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = -[FBKQuestionValueToDisplayNameTransformer initWithDictionary:]([FBKQuestionValueToDisplayNameTransformer alloc], "initWithDictionary:", v3);
  return v13;
}

- (BOOL)configuresEnhancedLogging
{
  FBKQuestion *v2;
  BOOL v3;

  v2 = self;
  v3 = FBKQuestion.configuresEnhancedLogging.getter();

  return v3;
}

- (FBKModalConfiguration)EnhancedLoggingModalConfiguration
{
  FBKQuestion *v2;
  void *v3;

  v2 = self;
  v3 = FBKQuestion.EnhancedLoggingModalConfiguration.getter();

  return (FBKModalConfiguration *)v3;
}

- (void)setPropertiesFromJSONObject:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_5(&dword_21D9A9000, a3, (uint64_t)a3, "FBKQuestion choice is nil, will ignore", a1);
}

- (void)tat
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_FAULT, "Question has no tat: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end

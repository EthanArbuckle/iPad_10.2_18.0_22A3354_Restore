@implementation SGQuickResponsesToRobots

+ (void)warmup
{
  void *v4;
  void *v5;

  +[SGQuickResponsesToRobotsConfig sharedInstance](SGQuickResponsesToRobotsConfig, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesToRobots.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("repliesToRobotsConfig"));

    v4 = 0;
  }

}

+ (id)contactStore
{
  if (contactStore_onceToken != -1)
    dispatch_once(&contactStore_onceToken, &__block_literal_global_1486);
  return (id)contactStore__instance;
}

+ (BOOL)insignificantSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("@"));
    v8 = *MEMORY[0x24BDBA348];
    v9 = *MEMORY[0x24BDBA288];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = (void *)*MEMORY[0x24BDBA348];
    else
      v10 = (void *)*MEMORY[0x24BDBA288];
    v11 = v10;
    if (objc_msgSend(v11, "isEqualToString:", v8))
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v6);
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingPhoneNumber:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
        v30[0] = *MEMORY[0x24BDBA2E0];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "contactStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v17, "unifiedContactsMatchingPredicate:keysToFetch:error:", v14, v16, &v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v25;
        objc_msgSend(v18, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v6;
            v28 = 2112;
            v29 = v19;
            _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGQuickResponsesToRobots: Error fetching contact with %@: %@", buf, 0x16u);
          }
          v15 = 0;
        }
        else
        {
          v15 = v20 == 0;
        }

        goto LABEL_24;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "SGQuickResponsesToRobots: CNPhoneNumber initWithStringValue returned nil";
      v23 = 2;
    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", v9))
      {
        objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
LABEL_23:
        v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      v21 = MEMORY[0x24BDACB70];
      v22 = "Unsupported handleType: %@";
      v23 = 12;
    }
    _os_log_error_impl(&dword_21ABF4000, v21, OS_LOG_TYPE_ERROR, v22, buf, v23);
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGQuickResponsesToRobots: Either 0 or more than 1 recipient found.", buf, 2u);
  }
  v15 = 0;
LABEL_25:

  return v15;
}

+ (float)allCapsRatio:(id)a3
{
  id v3;
  unint64_t v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  float v10;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v5 = 0.0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uppercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (v9)
        v5 = v5 + 1.0;
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }
  else
  {
    v5 = 0.0;
  }
  v10 = v5 / (float)(unint64_t)objc_msgSend(v3, "count");

  return v10;
}

+ (BOOL)presentInContext:(id)a3 context:(id)a4 startIdx:(int64_t)a5 endIdx:(int64_t)a6
{
  id v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  int64_t v16;
  void *v17;
  void *v18;
  int v19;
  int64_t v20;

  v9 = a3;
  v10 = a4;
  v11 = a5 & ~(a5 >> 63);
  if (objc_msgSend(v9, "count") <= (unint64_t)a6)
    a6 = objc_msgSend(v9, "count");
  if (v11 >= a6)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "containsObject:", v13);

    if ((v14 & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      v16 = v11 + 1;
      while (a6 != v16)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v10, "containsObject:", v18);

        ++v16;
        if (v19)
        {
          v20 = v16 - 1;
          goto LABEL_12;
        }
      }
      v20 = a6;
LABEL_12:
      v15 = v20 < a6;
    }
  }

  return v15;
}

+ (id)repliesToRobot:(id)a3 language:(id)a4 recipients:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x220753E80]();
  +[SGQuickResponsesToRobotsConfig sharedInstance](SGQuickResponsesToRobotsConfig, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[SGQuickResponsesToRobots repliesToRobot:language:recipients:config:](SGQuickResponsesToRobots, "repliesToRobot:language:recipients:config:", v7, v8, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGQuickResponsesToRobots: Could not load assets for making replies to robots prediction", v14, 2u);
    }
    v12 = 0;
  }

  objc_autoreleasePoolPop(v10);
  return v12;
}

+ (id)repliesToRobot:(id)a3 language:(id)a4 recipients:(id)a5 config:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  unint64_t v31;
  int v32;
  void *v33;
  int v34;
  char v35;
  void *v36;
  SGQuickResponse *v37;
  void *v38;
  SGQuickResponse *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  const char *v47;
  uint32_t v48;
  id v49;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesToRobots.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("config"));

  }
  if ((objc_msgSend(v14, "enableFeature") & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v46 = MEMORY[0x24BDACB70];
      v47 = "SGQuickResponsesToRobots: Replies to robots feature disabled";
LABEL_45:
      v48 = 2;
LABEL_46:
      _os_log_debug_impl(&dword_21ABF4000, v46, OS_LOG_TYPE_DEBUG, v47, buf, v48);
    }
LABEL_48:
    v49 = 0;
    goto LABEL_49;
  }
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v46 = MEMORY[0x24BDACB70];
      v47 = "SGQuickResponsesToRobots: Not running replies to robots if recipients is nil";
      goto LABEL_45;
    }
    goto LABEL_48;
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("en")) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_48;
    *(_DWORD *)buf = 138412290;
    v61 = v12;
    v46 = MEMORY[0x24BDACB70];
    v47 = "SGQuickResponsesToRobots: Not running replies to robots for language %@";
    v48 = 12;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGStringSplitter splitString:withCharacterSet:](SGStringSplitter, "splitString:withCharacterSet:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGQuickResponsesToRobots: Can't reply to empty message", buf, 2u);
    }
    v49 = 0;
    goto LABEL_60;
  }
  v57 = (void *)objc_opt_new();
  v58 = (void *)objc_opt_new();
  if (!objc_msgSend(v16, "count"))
    goto LABEL_58;
  v59 = a1;
  v53 = v13;
  v54 = v11;
  v56 = v12;
  v17 = 0;
  v18 = 0;
  v19 = v57;
  do
  {
    v20 = (void *)MEMORY[0x220753E80]();
    objc_msgSend(v14, "supportedKeysAndContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_32;
    objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v19, "containsObject:", v24);

    if ((v25 & 1) != 0)
      goto LABEL_32;
    if ((v18 & 1) != 0)
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v14, "triggerWords");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v27, v17 - objc_msgSend(v14, "triggerContext"), v17);

    }
    v18 |= v26;
    if ((objc_msgSend(v14, "relaxContext") & 1) == 0)
    {
      if ((objc_msgSend(v14, "useGeneralContext") & 1) != 0)
      {
        objc_msgSend(v14, "generalContextWords");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v17 + 1;
        v32 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v30, v17 + 1, v17 + 1 + objc_msgSend(v14, "generalContextRight"));

        if (v32)
        {
          objc_msgSend(v14, "relaxContext");
          v19 = v57;
LABEL_31:
          objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v36);

          v37 = [SGQuickResponse alloc];
          objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE2(v52) = 1;
          LOWORD(v52) = 256;
          v39 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:](v37, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v38, v56, -1, -1, -1, -1, -1, v52);
          objc_msgSend(v58, "addObject:", v39);

          goto LABEL_32;
        }
      }
      else
      {
        v31 = v17 + 1;
      }
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v23);
      v29 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v33, v31, v31 + objc_msgSend(v14, "rightContext"));
      if ((v29 & 1) != 0)
      {
        v28 = 0;
LABEL_27:

        v19 = v57;
        goto LABEL_28;
      }
      v34 = objc_msgSend(v14, "useGeneralContext");
      if (v34
        && (objc_msgSend(v14, "generalContextWords"),
            v55 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v55, v17 - objc_msgSend(v14, "generalContextLeft"), v17) & 1) != 0))
      {
        v28 = 1;
      }
      else
      {
        v28 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v33, v17 - objc_msgSend(v14, "leftContext"), v17);
        if (!v34)
          goto LABEL_27;
      }

      goto LABEL_27;
    }
    v28 = 0;
    v29 = 0;
LABEL_28:
    v35 = objc_msgSend(v14, "relaxContext");
    if ((v29 & 1) != 0 || (v35 & 1) != 0 || v28)
      goto LABEL_31;
LABEL_32:

    objc_autoreleasePoolPop(v20);
    ++v17;
  }
  while (objc_msgSend(v16, "count") > v17);
  if ((v18 & 1) != 0)
  {
    v12 = v56;
    if (objc_msgSend(v58, "count"))
    {
      v13 = v53;
      if (objc_msgSend(v14, "insignificantSender")
        && (objc_msgSend(v59, "insignificantSender:", v53) & 1) == 0)
      {
        v11 = v54;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v44 = MEMORY[0x24BDACB70];
          v45 = "SGQuickResponsesToRobots: Not running replies to robots for significant sender";
LABEL_62:
          _os_log_debug_impl(&dword_21ABF4000, v44, OS_LOG_TYPE_DEBUG, v45, buf, 2u);
        }
LABEL_58:
        v49 = 0;
      }
      else
      {
        objc_msgSend(v14, "capsWordsRatioMax");
        v11 = v54;
        if (v40 < 1.0)
        {
          +[SGQuickResponsesToRobots allCapsRatio:](SGQuickResponsesToRobots, "allCapsRatio:", v16);
          v42 = v41;
          objc_msgSend(v14, "capsWordsRatioMax");
          if (v42 > v43)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v44 = MEMORY[0x24BDACB70];
              v45 = "SGQuickResponsesToRobots: Capital words threshold condition not met";
              goto LABEL_62;
            }
            goto LABEL_58;
          }
        }
        v49 = v58;
      }
    }
    else
    {
      v49 = 0;
      v13 = v53;
      v11 = v54;
    }
  }
  else
  {
    v49 = 0;
    v13 = v53;
    v11 = v54;
    v12 = v56;
  }

LABEL_60:
LABEL_49:

  return v49;
}

void __40__SGQuickResponsesToRobots_contactStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)contactStore__instance;
  contactStore__instance = v0;

}

@end

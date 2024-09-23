@implementation SGQuickResponsesReplyModel

- (SGQuickResponsesReplyModel)initWithDictionary:(id)a3 index:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  NSArray *semanticClasses;
  NSArray *v12;
  NSArray *selectedPseudocounts;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  SGQuickResponsesReplyModel *v24;
  objc_super v26;
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  if (v6)
  {

    v26.receiver = self;
    v26.super_class = (Class)SGQuickResponsesReplyModel;
    self = -[SGQuickResponsesReplyModel init](&v26, sel_init);
    if (!self)
      goto LABEL_28;
    objc_msgSend(v7, "arrayAssertedForKey:", CFSTR("RESPONSE_CLASSES"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      self->_semanticClassIndex = a4;
      +[SGQuickResponsesReplyModel semanticClassesForArray:](SGQuickResponsesReplyModel, "semanticClassesForArray:", v8);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = MEMORY[0x24BDACB70];
          v21 = "[SGQuickResponsesReplyModel semanticClassesForArray:array]";
          goto LABEL_24;
        }
LABEL_25:

        goto LABEL_26;
      }
      semanticClasses = self->_semanticClasses;
      self->_semanticClasses = v10;

      objc_msgSend(v7, "arrayAssertedForKey:", CFSTR("REPLY_TEXT_SELECTED_PSEUDOCOUNTS"));
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = MEMORY[0x24BDACB70];
          v21 = "[dictionary arrayAssertedForKey:REPLY_TEXT_SELECTED_PSEUDOCOUNTS]";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      selectedPseudocounts = self->_selectedPseudocounts;
      self->_selectedPseudocounts = v12;

      objc_msgSend(v7, "numberAssertedForKey:", CFSTR("MODEL_SCORE_WEIGHT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = MEMORY[0x24BDACB70];
          v21 = "[dictionary numberAssertedForKey:MODEL_SCORE_WEIGHT]";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v15 = v14;
      objc_msgSend(v14, "doubleValue");
      self->_scoreWeight = v16;

      objc_msgSend(v7, "numberAssertedForKey:", CFSTR("MODEL_CATEGORY"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = MEMORY[0x24BDACB70];
          v21 = "[dictionary numberAssertedForKey:MODEL_CATEGORY]";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v18 = v17;
      self->_category = objc_msgSend(v17, "unsignedIntegerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DYNAMIC_LABEL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      self->_dynamicLabel = objc_msgSend(v19, "BOOLValue");

      if (self->_scoreWeight < 0.0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = MEMORY[0x24BDACB70];
          v21 = "_scoreWeight >= 0";
LABEL_24:
          _os_log_fault_impl(&dword_21ABF4000, v20, OS_LOG_TYPE_FAULT, v21, buf, 2u);
          goto LABEL_25;
        }
        goto LABEL_25;
      }

LABEL_28:
      self = self;
      v24 = self;
      goto LABEL_29;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v22 = MEMORY[0x24BDACB70];
      v23 = "[dictionary arrayAssertedForKey:RESPONSE_CLASSES]";
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v22 = MEMORY[0x24BDACB70];
    v23 = "dictionary";
LABEL_15:
    _os_log_fault_impl(&dword_21ABF4000, v22, OS_LOG_TYPE_FAULT, v23, buf, 2u);
  }
LABEL_26:
  v24 = 0;
LABEL_29:

  return v24;
}

- (unint64_t)semanticClassIndex
{
  return self->_semanticClassIndex;
}

- (NSArray)semanticClasses
{
  return self->_semanticClasses;
}

- (NSArray)selectedPseudocounts
{
  return self->_selectedPseudocounts;
}

- (double)scoreWeight
{
  return self->_scoreWeight;
}

- (unint64_t)category
{
  return self->_category;
}

- (BOOL)dynamicLabel
{
  return self->_dynamicLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPseudocounts, 0);
  objc_storeStrong((id *)&self->_semanticClasses, 0);
}

+ (id)semanticClassesForArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
    v9 = 0x24BDBC000uLL;
    while (2)
    {
      v10 = 0;
      v31 = v7;
      do
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[semanticClass isKindOfClass:NSArray.class]", buf, 2u);
          }
LABEL_33:

          v26 = 0;
          goto LABEL_34;
        }
        v12 = (void *)objc_opt_new();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v39;
          v32 = v4;
          v33 = v13;
          v28 = *(_QWORD *)v39;
          v29 = v8;
          while (2)
          {
            v16 = 0;
            v30 = v14;
            do
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v16);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v18 = (id)objc_msgSend(objc_alloc(*(Class *)(v9 + 3632)), "initWithObjects:", v17, 0);
              else
                v18 = v17;
              v19 = v18;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[replyGroup isKindOfClass:NSArray.class]", buf, 2u);
                }
                v4 = v32;
LABEL_32:

                goto LABEL_33;
              }
              v20 = v12;
              v21 = v5;
              v36 = 0u;
              v37 = 0u;
              v34 = 0u;
              v35 = 0u;
              v19 = v19;
              v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v35;
                while (2)
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v35 != v24)
                      objc_enumerationMutation(v19);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[string isKindOfClass:NSString.class]", buf, 2u);
                      }

                      v5 = v21;
                      v12 = v20;
                      v4 = v32;
                      v13 = v33;
                      goto LABEL_32;
                    }
                  }
                  v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
                  if (v23)
                    continue;
                  break;
                }
              }

              v12 = v20;
              objc_msgSend(v20, "addObject:", v19);

              ++v16;
              v8 = v29;
              v5 = v21;
              v9 = 0x24BDBC000;
              v13 = v33;
              v15 = v28;
            }
            while (v16 != v30);
            v14 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
            v4 = v32;
            if (v14)
              continue;
            break;
          }
        }

        objc_msgSend(v4, "addObject:", v12);
        ++v10;
      }
      while (v10 != v31);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v7)
        continue;
      break;
    }
  }

  v26 = v4;
LABEL_34:

  return v26;
}

@end

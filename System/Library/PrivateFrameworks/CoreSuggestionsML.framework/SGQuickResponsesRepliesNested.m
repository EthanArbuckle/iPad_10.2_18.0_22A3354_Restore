@implementation SGQuickResponsesRepliesNested

- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[NSArray objectAtIndexedSubscript:](self->_semanticClassReplyTextStrings, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)replyTextsForIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_semanticClassReplyTextStrings, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)replyCountForIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_semanticClasses, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)replyTextCount
{
  return -[NSArray count](self->_replyTexts, "count");
}

- (unint64_t)replyClassCount
{
  return -[NSArray count](self->_semanticClasses, "count");
}

- (unint64_t)modelCount
{
  return -[NSArray count](self->_models, "count");
}

- (unint64_t)maxDistinctReplies
{
  return -[NSArray count](self->_styleGroups, "count");
}

- (SGQuickResponsesRepliesNested)initWithArray:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *models;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *semanticClasses;
  NSArray *v14;
  NSArray *styleGroups;
  NSArray *v16;
  NSArray *replyTexts;
  NSArray *v18;
  NSArray *semanticClassReplyTextStrings;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *semanticClassParent;
  NSArray *v24;
  NSArray *styleGroupParent;
  NSArray *v26;
  NSArray *replyTextParent;
  NSArray *v28;
  NSArray *categoryModels;
  void *v30;
  NSArray *v31;
  void *v32;
  NSArray *v33;
  NSArray *categorySemanticClasses;
  void *v35;
  NSArray *v36;
  void *v37;
  NSArray *v38;
  NSArray *categoryStyleGroups;
  void *v40;
  void *v41;
  NSArray *v42;
  NSArray *semanticClassStyleGroups;
  void *v44;
  NSArray *v45;
  void *v46;
  NSArray *v47;
  NSArray *semanticClassReplyTexts;
  void *v49;
  void *v50;
  NSArray *v51;
  NSArray *styleGroupReplyTexts;
  id v53;
  void *v54;
  NSSet *v55;
  NSSet *normalizedReplyTextsSet;
  NSArray *v57;
  NSArray *selectedPseudocounts;
  NSUInteger v59;
  NSArray *v60;
  NSArray *semanticClassSelectedPseudocounts;
  SGQuickResponsesRepliesNested *v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  const char *v68;
  objc_super v70;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v63 = MEMORY[0x24BDACB70];
    v64 = "array";
    goto LABEL_19;
  }

  v70.receiver = self;
  v70.super_class = (Class)SGQuickResponsesRepliesNested;
  self = -[SGQuickResponsesRepliesNested init](&v70, sel_init);
  if (self)
  {
    objc_msgSend((id)objc_opt_class(), "replyModelsForArray:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      models = self->_models;
      self->_models = v6;

      objc_msgSend((id)objc_opt_class(), "nestedArrayFromModels:", self->_models);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend((id)objc_opt_class(), "indexedArraysFromNestedArray:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[self.class indexedArraysFromNestedArray:nestedArray]", buf, 2u);
          }
          goto LABEL_34;
        }
        v11 = v10;
        if ((unint64_t)objc_msgSend(v10, "count") <= 3)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          *(_WORD *)buf = 0;
          v65 = MEMORY[0x24BDACB70];
          v66 = "indexedArrays.count >= 4";
        }
        else
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
          semanticClasses = self->_semanticClasses;
          self->_semanticClasses = v12;

          objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
          v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
          styleGroups = self->_styleGroups;
          self->_styleGroups = v14;

          objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
          v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
          replyTexts = self->_replyTexts;
          self->_replyTexts = v16;

          objc_msgSend((id)objc_opt_class(), "flattenedArraysFromNestedArray:", self->_semanticClasses);
          v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            semanticClassReplyTextStrings = self->_semanticClassReplyTextStrings;
            self->_semanticClassReplyTextStrings = v18;

            objc_msgSend((id)objc_opt_class(), "parentArraysFromNestedArray:models:", v9, self->_models);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = v20;
              if ((unint64_t)objc_msgSend(v20, "count") <= 3)
              {
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                {
LABEL_32:

                  goto LABEL_33;
                }
                *(_WORD *)buf = 0;
                v67 = MEMORY[0x24BDACB70];
                v68 = "parentArrays.count >= 4";
              }
              else
              {
                objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
                v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
                semanticClassParent = self->_semanticClassParent;
                self->_semanticClassParent = v22;

                objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
                v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
                styleGroupParent = self->_styleGroupParent;
                self->_styleGroupParent = v24;

                objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
                v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
                replyTextParent = self->_replyTextParent;
                self->_replyTextParent = v26;

                objc_msgSend((id)objc_opt_class(), "categoryModelsFromModels:", self->_models);
                v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
                categoryModels = self->_categoryModels;
                self->_categoryModels = v28;

                v30 = (void *)objc_opt_class();
                v31 = self->_categoryModels;
                objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "subclassesFromClasses:subclassArray:", v31, v32);
                v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
                categorySemanticClasses = self->_categorySemanticClasses;
                self->_categorySemanticClasses = v33;

                v35 = (void *)objc_opt_class();
                v36 = self->_categorySemanticClasses;
                objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "subclassesFromClasses:subclassArray:", v36, v37);
                v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
                categoryStyleGroups = self->_categoryStyleGroups;
                self->_categoryStyleGroups = v38;

                v40 = (void *)objc_opt_class();
                objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "subclassesFromClasses:subclassArray:", 0, v41);
                v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
                semanticClassStyleGroups = self->_semanticClassStyleGroups;
                self->_semanticClassStyleGroups = v42;

                v44 = (void *)objc_opt_class();
                v45 = self->_semanticClassStyleGroups;
                objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "subclassesFromClasses:subclassArray:", v45, v46);
                v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
                semanticClassReplyTexts = self->_semanticClassReplyTexts;
                self->_semanticClassReplyTexts = v47;

                v49 = (void *)objc_opt_class();
                objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "subclassesFromClasses:subclassArray:", 0, v50);
                v51 = (NSArray *)objc_claimAutoreleasedReturnValue();
                styleGroupReplyTexts = self->_styleGroupReplyTexts;
                self->_styleGroupReplyTexts = v51;

                v53 = objc_alloc(MEMORY[0x24BDBCF20]);
                -[NSArray _pas_mappedArrayWithTransform:](self->_replyTexts, "_pas_mappedArrayWithTransform:", &__block_literal_global);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = (NSSet *)objc_msgSend(v53, "initWithArray:", v54);
                normalizedReplyTextsSet = self->_normalizedReplyTextsSet;
                self->_normalizedReplyTextsSet = v55;

                objc_msgSend((id)objc_opt_class(), "selectedPseudocountsFromModels:", self->_models);
                v57 = (NSArray *)objc_claimAutoreleasedReturnValue();
                selectedPseudocounts = self->_selectedPseudocounts;
                self->_selectedPseudocounts = v57;

                v59 = -[NSArray count](self->_selectedPseudocounts, "count");
                if (v59 == -[NSArray count](self->_replyTexts, "count"))
                {
                  objc_msgSend((id)objc_opt_class(), "nestedArrayFromFlatArray:nestedIndexes:", self->_selectedPseudocounts, self->_semanticClassReplyTexts);
                  v60 = (NSArray *)objc_claimAutoreleasedReturnValue();
                  semanticClassSelectedPseudocounts = self->_semanticClassSelectedPseudocounts;
                  self->_semanticClassSelectedPseudocounts = v60;

                  goto LABEL_12;
                }
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                  goto LABEL_32;
                *(_WORD *)buf = 0;
                v67 = MEMORY[0x24BDACB70];
                v68 = "_selectedPseudocounts.count == _replyTexts.count";
              }
              _os_log_fault_impl(&dword_21ABF4000, v67, OS_LOG_TYPE_FAULT, v68, buf, 2u);
              goto LABEL_32;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              v65 = MEMORY[0x24BDACB70];
              v66 = "[self.class parentArraysFromNestedArray:nestedArray models:_models]";
              goto LABEL_28;
            }
LABEL_33:

LABEL_34:
            goto LABEL_35;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          *(_WORD *)buf = 0;
          v65 = MEMORY[0x24BDACB70];
          v66 = "[self.class flattenedArraysFromNestedArray:_semanticClasses]";
        }
LABEL_28:
        _os_log_fault_impl(&dword_21ABF4000, v65, OS_LOG_TYPE_FAULT, v66, buf, 2u);
        goto LABEL_33;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v63 = MEMORY[0x24BDACB70];
        v64 = "[self.class nestedArrayFromModels:_models]";
        goto LABEL_19;
      }
LABEL_35:
      v62 = 0;
      goto LABEL_36;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    v63 = MEMORY[0x24BDACB70];
    v64 = "[self.class replyModelsForArray:array]";
LABEL_19:
    _os_log_fault_impl(&dword_21ABF4000, v63, OS_LOG_TYPE_FAULT, v64, buf, 2u);
    goto LABEL_35;
  }
LABEL_12:
  self = self;
  v62 = self;
LABEL_36:

  return v62;
}

- (NSArray)models
{
  return self->_models;
}

- (NSArray)semanticClasses
{
  return self->_semanticClasses;
}

- (NSArray)styleGroups
{
  return self->_styleGroups;
}

- (NSArray)replyTexts
{
  return self->_replyTexts;
}

- (NSArray)selectedPseudocounts
{
  return self->_selectedPseudocounts;
}

- (NSArray)semanticClassReplyTextStrings
{
  return self->_semanticClassReplyTextStrings;
}

- (NSArray)semanticClassSelectedPseudocounts
{
  return self->_semanticClassSelectedPseudocounts;
}

- (NSArray)semanticClassParent
{
  return self->_semanticClassParent;
}

- (NSArray)styleGroupParent
{
  return self->_styleGroupParent;
}

- (NSArray)replyTextParent
{
  return self->_replyTextParent;
}

- (NSArray)categoryModels
{
  return self->_categoryModels;
}

- (NSArray)categorySemanticClasses
{
  return self->_categorySemanticClasses;
}

- (NSArray)categoryStyleGroups
{
  return self->_categoryStyleGroups;
}

- (NSArray)semanticClassStyleGroups
{
  return self->_semanticClassStyleGroups;
}

- (NSArray)semanticClassReplyTexts
{
  return self->_semanticClassReplyTexts;
}

- (NSArray)styleGroupReplyTexts
{
  return self->_styleGroupReplyTexts;
}

- (NSSet)normalizedReplyTextsSet
{
  return self->_normalizedReplyTextsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedReplyTextsSet, 0);
  objc_storeStrong((id *)&self->_styleGroupReplyTexts, 0);
  objc_storeStrong((id *)&self->_semanticClassReplyTexts, 0);
  objc_storeStrong((id *)&self->_semanticClassStyleGroups, 0);
  objc_storeStrong((id *)&self->_categoryStyleGroups, 0);
  objc_storeStrong((id *)&self->_categorySemanticClasses, 0);
  objc_storeStrong((id *)&self->_categoryModels, 0);
  objc_storeStrong((id *)&self->_replyTextParent, 0);
  objc_storeStrong((id *)&self->_styleGroupParent, 0);
  objc_storeStrong((id *)&self->_semanticClassParent, 0);
  objc_storeStrong((id *)&self->_semanticClassSelectedPseudocounts, 0);
  objc_storeStrong((id *)&self->_semanticClassReplyTextStrings, 0);
  objc_storeStrong((id *)&self->_selectedPseudocounts, 0);
  objc_storeStrong((id *)&self->_replyTexts, 0);
  objc_storeStrong((id *)&self->_styleGroups, 0);
  objc_storeStrong((id *)&self->_semanticClasses, 0);
  objc_storeStrong((id *)&self->_models, 0);
}

id __47__SGQuickResponsesRepliesNested_initWithArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyTextInternal:](SGQuickResponsesReplies, "normalizeReplyTextInternal:", a2);
}

+ (id)nestedArrayFromModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "semanticClasses", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)indexedArraysFromNestedArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke;
  v12[3] = &unk_24DDC3D30;
  v13 = v4;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke_2;
  v10[3] = &unk_24DDC3D58;
  v6 = v13;
  v11 = v6;
  +[SGNestedArray traversalWithNestedArray:depthCallback:itemCallback:](SGNestedArray, "traversalWithNestedArray:depthCallback:itemCallback:", v3, v12, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

+ (id)flattenedArraysFromNestedArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SGQuickResponsesRepliesNested_flattenedArraysFromNestedArray___block_invoke;
  v7[3] = &unk_24DDC3D58;
  v5 = v4;
  v8 = v5;
  +[SGNestedArray traversalWithNestedArray:depthCallback:itemCallback:](SGNestedArray, "traversalWithNestedArray:depthCallback:itemCallback:", v3, 0, v7);

  return v5;
}

+ (id)nestedArrayFromFlatArray:(id)a3 nestedIndexes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  id v21;
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
  v5 = a3;
  v6 = a4;
  v21 = (id)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v23;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v23 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "unsignedIntegerValue"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v18);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v15);
        }

        objc_msgSend(v21, "addObject:", v12);
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  return v21;
}

+ (id)parentArraysFromNestedArray:(id)a3 models:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke;
  v17[3] = &unk_24DDC3D30;
  v18 = v7;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke_2;
  v14[3] = &unk_24DDC3D80;
  v15 = v5;
  v9 = v18;
  v16 = v9;
  v10 = v5;
  +[SGNestedArray traversalWithNestedArray:depthCallback:itemCallback:](SGNestedArray, "traversalWithNestedArray:depthCallback:itemCallback:", v6, v17, v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

+ (BOOL)isZeroBasedAndContiguous:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v11 = objc_alloc(MEMORY[0x24BDD16E0]);
          v12 = (void *)objc_msgSend(v11, "initWithUnsignedInteger:", objc_msgSend(v10, "category", (_QWORD)v21));
          objc_msgSend(v4, "addObject:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKeyPath:", CFSTR("@min.unsignedIntegerValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKeyPath:", CFSTR("@max.unsignedIntegerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (v15)
      v19 = 0;
    else
      v19 = v18 == objc_msgSend(v4, "count") - 1;

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (id)replyModelsForArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  SGQuickResponsesReplyModel *v12;
  SGQuickResponsesReplyModel *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[array isKindOfClass:NSArray.class]", buf, 2u);
    }
    v15 = 0;
    goto LABEL_24;
  }
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (!v6)
    goto LABEL_11;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v21;
  v19 = v3;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v3 = v19;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
LABEL_19:

          goto LABEL_22;
        }
        *(_WORD *)buf = 0;
        v16 = MEMORY[0x24BDACB70];
        v17 = "[dictionary isKindOfClass:NSDictionary.class]";
LABEL_26:
        _os_log_fault_impl(&dword_21ABF4000, v16, OS_LOG_TYPE_FAULT, v17, buf, 2u);
        goto LABEL_19;
      }
      v12 = -[SGQuickResponsesReplyModel initWithDictionary:index:]([SGQuickResponsesReplyModel alloc], "initWithDictionary:index:", v11, v8);
      if (!v12)
      {
        v3 = v19;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v16 = MEMORY[0x24BDACB70];
        v17 = "replyModel != nil";
        goto LABEL_26;
      }
      v13 = v12;
      objc_msgSend(v4, "addObject:", v12);
      -[SGQuickResponsesReplyModel semanticClasses](v13, "semanticClasses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 += objc_msgSend(v14, "count");

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    v3 = v19;
    if (v7)
      continue;
    break;
  }
LABEL_11:

  if ((objc_msgSend((id)objc_opt_class(), "isZeroBasedAndContiguous:", v4) & 1) != 0)
  {
    v15 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "[self.class isZeroBasedAndContiguous:replyModels]", buf, 2u);
    }
LABEL_22:
    v15 = 0;
  }

LABEL_24:
  return v15;
}

+ (id)categoryModelsFromModels:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@max.category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = (void *)objc_opt_new();
  if (v5 != -1)
  {
    v7 = v5 + 1;
    do
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v6, "addObject:", v8);

      --v7;
    }
    while (v7);
  }
  if (objc_msgSend(v3, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "category");

      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v9);
      objc_msgSend(v12, "addObject:", v13);

      ++v9;
    }
    while (v9 < objc_msgSend(v3, "count"));
  }

  return v6;
}

+ (id)modelSemanticClassesFromModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SGQuickResponsesRepliesNested_modelSemanticClassesFromModels___block_invoke;
  v7[3] = &unk_24DDC3DA8;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

+ (id)subclassesFromClasses:(id)a3 subclassArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  v49 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v47 = *(id *)v63;
    do
    {
      v11 = 0;
      do
      {
        if (*(id *)v63 != v47)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v11);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v7, "addObject:", v13);

        v14 = objc_msgSend(v12, "count");
        v15 = v10;
        for (i = v14; i; --i)
        {
          objc_msgSend(v7, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v15);
          objc_msgSend(v17, "addObject:", v18);

          v7 = v49;
          ++v15;
        }
        v10 += v14;
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v9);
  }

  v19 = v45;
  if (!v45)
  {
    v19 = (void *)objc_opt_new();
    v20 = objc_msgSend(obj, "count");
    if (v20)
    {
      v21 = v20;
      for (j = 0; j != v21; ++j)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", j);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v23, 0);
        objc_msgSend(v19, "addObject:", v24);

      }
    }
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v41 = v19;
  v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v59;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(v41);
        v46 = v25;
        v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v25);
        v27 = (void *)objc_opt_new();
        objc_msgSend(v6, "addObject:", v27);

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v48 = v26;
        v28 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v55;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v55 != v30)
                objc_enumerationMutation(v48);
              v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v31);
              v50 = 0u;
              v51 = 0u;
              v52 = 0u;
              v53 = 0u;
              objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v32, "unsignedIntegerValue"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v51;
                do
                {
                  v37 = 0;
                  do
                  {
                    if (*(_QWORD *)v51 != v36)
                      objc_enumerationMutation(v33);
                    v38 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v37);
                    objc_msgSend(v6, "lastObject");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "addObject:", v38);

                    ++v37;
                  }
                  while (v35 != v37);
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
                }
                while (v35);
              }

              ++v31;
              v7 = v49;
            }
            while (v31 != v29);
            v29 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          }
          while (v29);
        }

        v25 = v46 + 1;
      }
      while (v46 + 1 != v44);
      v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v44);
  }

  return v6;
}

+ (id)selectedPseudocountsFromModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "selectedPseudocounts", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

void __64__SGQuickResponsesRepliesNested_modelSemanticClassesFromModels___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v8, "semanticClassIndex");
  objc_msgSend(v8, "semanticClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 < v6 + v4)
  {
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v4);
      objc_msgSend(v3, "addObject:", v7);

      ++v4;
      --v6;
    }
    while (v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_opt_new();
  objc_msgSend(v1, "addObject:", v2);

}

void __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a4)
  {
    objc_msgSend(a3, "objectAtIndexedSubscript:", a4 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntegerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "category");

  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v7);
  objc_msgSend(v11, "addObject:", v10);

}

void __64__SGQuickResponsesRepliesNested_flattenedArraysFromNestedArray___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a2;
  v10 = a3;
  if (!a4)
  {
    v14 = *(void **)(a1 + 32);
    v12 = (void *)objc_opt_new();
    v11 = v14;
    v13 = v12;
    goto LABEL_5;
  }
  if ((a6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v15;
LABEL_5:
    objc_msgSend(v11, "addObject:", v13);

  }
}

void __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_opt_new();
  objc_msgSend(v1, "addObject:", v2);

}

void __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

@end

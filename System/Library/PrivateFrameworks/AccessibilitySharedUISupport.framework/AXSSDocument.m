@implementation AXSSDocument

+ (id)documentWithText:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  objc_msgSend(a1, "documentWithAttributedText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)documentWithAttributedText:(id)a3
{
  id v3;
  AXSSDocumentNode *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(AXSSDocumentNode);
  -[AXSSDocumentNode setText:](v4, "setText:", v3);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addNode:", v4);

  return v5;
}

- (AXSSDocument)init
{
  AXSSDocument *v2;
  uint64_t v3;
  NSMutableArray *nodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSSDocument;
  v2 = -[AXSSDocument init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    nodes = v2->__nodes;
    v2->__nodes = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSArray)nodes
{
  void *v2;
  void *v3;

  -[AXSSDocument _nodes](self, "_nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addNode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSDocument _nodes](self, "_nodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)generateAllIssues
{
  void *v3;
  void *v4;
  void *v5;

  -[AXSSDocument _generateAllWordIssues](self, "_generateAllWordIssues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSDocument _generateAllDocIssues](self, "_generateAllDocIssues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_generateAllDocIssues
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  +[AXSSDocumentTextRulesetManager sharedManager](AXSSDocumentTextRulesetManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[AXSSDocument nodes](self, "nodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v4), "text");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "length"))
        {
          v22 = v4;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v19, "rulesets");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v29;
            do
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v29 != v8)
                  objc_enumerationMutation(v23);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "rulesForGranularity:", 2);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = 0u;
                v25 = 0u;
                v26 = 0u;
                v27 = 0u;
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                if (v11)
                {
                  v12 = v11;
                  v13 = *(_QWORD *)v25;
                  do
                  {
                    v14 = 0;
                    do
                    {
                      if (*(_QWORD *)v25 != v13)
                        objc_enumerationMutation(v10);
                      objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "issuesInText:", v5);
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v15, "count"))
                        objc_msgSend(v3, "addObjectsFromArray:", v15);

                      ++v14;
                    }
                    while (v12 != v14);
                    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                  }
                  while (v12);
                }

                ++v9;
              }
              while (v9 != v7);
              v7 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            }
            while (v7);
          }

          v4 = v22;
        }

        ++v4;
      }
      while (v4 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v21);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (id)_generateAllWordIssues
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id obj;
  int64x2_t v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  int64x2_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v20 = (id)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[AXSSDocument nodes](self, "nodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v3)
  {
    v19 = *(_QWORD *)v40;
    v18 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
        v6 = (void *)objc_opt_new();
        objc_msgSend(v5, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy_;
        v37 = __Block_byref_object_dispose_;
        v38 = 0;
        v28 = 0;
        v29 = &v28;
        v30 = 0x3010000000;
        v31 = &unk_21C870591;
        v32 = v18;
        v9 = objc_msgSend(v8, "length");
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __38__AXSSDocument__generateAllWordIssues__block_invoke;
        v21[3] = &unk_24E077320;
        v10 = v7;
        v22 = v10;
        v23 = v5;
        v26 = &v33;
        v27 = &v28;
        v11 = v6;
        v24 = v11;
        v12 = v20;
        v25 = v12;
        objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, v21);
        if (v34[5] && (unint64_t)objc_msgSend(v10, "length") >= 3)
        {
          v13 = (void *)objc_opt_new();
          v14 = objc_msgSend(v10, "length");
          _CheckNodeWord(v5, v10, v13, v14, 0, (void *)v34[5], v29[4], v29[5], v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "count"))
            objc_msgSend(v12, "addObjectsFromArray:", v15);

        }
        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v33, 8);

        ++v4;
      }
      while (v3 != v4);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v3);
  }

  return v20;
}

void __38__AXSSDocument__generateAllWordIssues__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CheckNodeWord(*(void **)(a1 + 40), *(void **)(a1 + 32), v7, a3, a4, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(void **)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v11);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

}

- (id)stringByAcceptingFirstSuggestionForIssues:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  id obj;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = (id)objc_opt_new();
  v26 = v4;
  v30 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[AXSSDocument nodes](self, "nodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v32 = v5;
        v6 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v5);
        objc_msgSend(v6, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v7, "mutableCopy");

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = v30;
        v8 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v8)
        {
          v9 = v8;
          v10 = 0;
          v11 = *(_QWORD *)v37;
          do
          {
            v12 = 0;
            v34 = v9;
            do
            {
              if (*(_QWORD *)v37 != v11)
                objc_enumerationMutation(v35);
              v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
              objc_msgSend(v13, "node");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqual:", v6);

              if (v15)
              {
                v16 = objc_msgSend(v13, "range");
                v18 = v17;
                objc_msgSend(v13, "suggestions");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "firstObject");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v21 = v6;
                  v22 = objc_msgSend(v33, "length");
                  objc_msgSend(v33, "replaceCharactersInRange:withAttributedString:", v16 - v10, v18, v20);
                  v23 = objc_msgSend(v33, "length");
                  v24 = v22 + v10;
                  v6 = v21;
                  v9 = v34;
                  v10 = v24 - v23;
                }

              }
              ++v12;
            }
            while (v9 != v12);
            v9 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v9);
        }

        if (objc_msgSend(v33, "length"))
          objc_msgSend(v28, "appendAttributedString:", v33);

        v5 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v31);
  }

  return v28;
}

uint64_t __58__AXSSDocument_stringByAcceptingFirstSuggestionForIssues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "range");
  if (v6 == objc_msgSend(v5, "range"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "range");
    if (v8 < objc_msgSend(v5, "range"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

- (NSMutableArray)_nodes
{
  return self->__nodes;
}

- (void)set_nodes:(id)a3
{
  objc_storeStrong((id *)&self->__nodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__nodes, 0);
}

@end

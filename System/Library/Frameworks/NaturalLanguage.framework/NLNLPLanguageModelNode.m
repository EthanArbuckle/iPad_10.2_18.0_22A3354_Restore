@implementation NLNLPLanguageModelNode

- (NLNLPLanguageModelNode)initWithTokenIDs:(id)a3
{
  id v4;
  NLNLPLanguageModelNode *v5;
  uint64_t v6;
  NSArray *tokenIDs;
  uint64_t v8;
  NSMutableSet *strings;
  uint64_t v10;
  NSMutableDictionary *children;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLNLPLanguageModelNode;
  v5 = -[NLNLPLanguageModelNode init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    strings = v5->_strings;
    v5->_strings = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    children = v5->_children;
    v5->_children = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (BOOL)isLeaf
{
  return -[NSMutableDictionary count](self->_children, "count") == 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)NLNLPLanguageModelNode;
  -[NLNLPLanguageModelNode description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_tokenIDs, "componentsJoinedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableSet count](self->_strings, "count"))
  {
    -[NSMutableSet allObjects](self->_strings, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" <%@>"), v8);

  }
  return v6;
}

- (id)_treeDescriptionWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37A0];
  -[NLNLPLanguageModelNode description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_children;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_children, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByAppendingString:", CFSTR("  "));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_treeDescriptionWithPrefix:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("\n%@"), v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)treeDescription
{
  return -[NLNLPLanguageModelNode _treeDescriptionWithPrefix:](self, "_treeDescriptionWithPrefix:", &stru_1E4A3BA10);
}

- (void)_addString:(id)a3 tokenIDs:(id)a4
{
  id v6;
  void *v7;
  NLNLPLanguageModelNode *v8;
  NLNLPLanguageModelNode *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_children, "objectForKey:", v7);
    v8 = (NLNLPLanguageModelNode *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = [NLNLPLanguageModelNode alloc];
      -[NSArray arrayByAddingObject:](self->_tokenIDs, "arrayByAddingObject:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NLNLPLanguageModelNode initWithTokenIDs:](v9, "initWithTokenIDs:", v10);

      -[NSMutableDictionary setObject:forKey:](self->_children, "setObject:forKey:", v8, v7);
    }
    objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLNLPLanguageModelNode _addString:tokenIDs:](v8, "_addString:tokenIDs:", v12, v11);

  }
  else
  {
    -[NSMutableSet addObject:](self->_strings, "addObject:", v12);
  }

}

- (void)_setProbability:(double)a3 dictionary:(id)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NLProbabilityInfo *v13;
  NLProbabilityInfo *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_strings;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = [NLProbabilityInfo alloc];
        v14 = -[NLProbabilityInfo initWithProbability:flags:](v13, "initWithProbability:flags:", 0, a3, (_QWORD)v15);
        objc_msgSend(v6, "setObject:forKey:", v14, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)_evaluateChildrenWithModelState:(void *)a3 copyRequired:(BOOL)a4 probability:(double)a5 dictionary:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  const __CFArray *v12;
  const __CFArray *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  CFIndex v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFNumber *ValueAtIndex;
  int v27;
  const void *v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  double valuePtr;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v31 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  -[NSMutableDictionary allKeys](self->_children, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v33 = a3;
  v12 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
  if (v12)
  {
    v13 = v12;
    v29 = v10;
    if (v11 == CFArrayGetCount(v12))
    {
      v30 = v11;
      v32 = v9;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = v10;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v14);
            -[NSMutableDictionary objectForKey:](self->_children, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v29);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v17 += objc_msgSend(v20, "isLeaf") ^ 1;

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v16);
      }
      else
      {
        v17 = 0;
      }

      v9 = v32;
      v21 = v30;
      if (v30)
      {
        v22 = 0;
        v23 = 0;
        do
        {
          objc_msgSend(v14, "objectAtIndex:", v22, v29);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_children, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v13, v22);
          valuePtr = 0.0;
          if (CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr))
          {
            objc_msgSend(v25, "_setProbability:dictionary:", v9, valuePtr * a5);
            if ((objc_msgSend(v25, "isLeaf") & 1) == 0)
            {
              v27 = ++v23 < v17 || v31;
              v28 = v33;
              if (v27 == 1)
                v28 = (const void *)CoreLMCreateCopy();
              if (v28)
              {
                v39 = v24;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
                if (CoreLMUpdateWithContext())
                  objc_msgSend(v25, "_evaluateChildrenWithModelState:copyRequired:probability:dictionary:", v28, 0, v32, valuePtr * a5);
                if (v27)
                  CFRelease(v28);
              }
              v9 = v32;
              v21 = v30;
            }
          }

          ++v22;
        }
        while (v21 != v22);
      }
    }
    CFRelease(v13);
    v10 = v29;
  }

}

+ (id)conditionalProbabilitiesForStrings:(id)a3 modelState:(void *)a4 copyRequired:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  NLNLPLanguageModelNode *v10;
  NLNLPLanguageModelNode *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NLProbabilityInfo *v24;
  _BOOL4 v26;
  id v27;
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
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v26 = v5;
    v10 = [NLNLPLanguageModelNode alloc];
    v11 = -[NLNLPLanguageModelNode initWithTokenIDs:](v10, "initWithTokenIDs:", MEMORY[0x1E0C9AA60]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v16);
          v18 = (void *)CoreLMCopyTokenIdsForText();
          -[NLNLPLanguageModelNode _addString:tokenIDs:](v11, "_addString:tokenIDs:", v17, v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v14);
    }

    -[NLNLPLanguageModelNode _setProbability:dictionary:](v11, "_setProbability:dictionary:", v9, 1.0);
    if (!-[NLNLPLanguageModelNode isLeaf](v11, "isLeaf"))
      -[NLNLPLanguageModelNode _evaluateChildrenWithModelState:copyRequired:probability:dictionary:](v11, "_evaluateChildrenWithModelState:copyRequired:probability:dictionary:", a4, v26, v9, 1.0);

    v7 = v27;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23));
        v24 = (NLProbabilityInfo *)objc_claimAutoreleasedReturnValue();
        if (!v24)
          v24 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
        objc_msgSend(v8, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_tokenIDs, 0);
}

@end

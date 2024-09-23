@implementation VNSuggestionsLogger

- (VNSuggestionsLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNSuggestionsLogger;
  return -[VNClusteringLogger initWithOptions:logEnabled:logFileNameBase:](&v5, sel_initWithOptions_logEnabled_logFileNameBase_, a3, a4, CFSTR("VNSuggestionLog"));
}

- (void)logInputFaceIdsWithFlags:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (v13 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Input query - face IDs with flags (clusterIdsWithFlags):\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v15 != v4)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceId: %@"), v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNClusteringLogger padStringWithSpaces:toSize:](VNClusteringLogger, "padStringWithSpaces:toSize:", v7, 20);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendFormat:", CFSTR("%@can be returned: %@\n"), v8, v9);

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v3);
    }

    -[VNSuggestionsLogger logString:](self, "logString:", v12);
  }

}

- (void)logSuggestons:(id)a3 description:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  VNSuggestionsLogger *v18;
  id v19;
  id obj;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  v22 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v18 = self;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Suggested face IDs: %@:\n"), v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ClusterId: %@   "), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNClusteringLogger padStringWithSpaces:toSize:](VNClusteringLogger, "padStringWithSpaces:toSize:", v11, 20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("%@Suggestions: "), v12);
          objc_msgSend(v22, "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v14);
                objc_msgSend(v7, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v15);
          }

          if (objc_msgSend(v14, "count"))
            objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 2, 2);
          objc_msgSend(v7, "appendString:", CFSTR("\n"));

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    -[VNSuggestionsLogger logString:](v18, "logString:", v7);
  }

}

- (void)logAllSuggestons:(id)a3
{
  -[VNSuggestionsLogger logSuggestons:description:](self, "logSuggestons:description:", a3, CFSTR("all sugestions for given input query (suggestionLists)"));
}

- (void)logFilteredByInputQuerySuggestons:(id)a3
{
  -[VNSuggestionsLogger logSuggestons:description:](self, "logSuggestons:description:", a3, CFSTR("filtered suggestions to include only those that are part of input query (suggestedInputsLists)"));
}

- (void)logConnectedGroups:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VNSuggestionsLogger *v15;
  id v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  if (v16 && objc_msgSend(v16, "count"))
  {
    v15 = self;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Connected groups of suggestions face IDs (connectedSuggestedInputs):\n"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v16;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v5)
    {
      LODWORD(v6) = 0;
      v17 = *(_QWORD *)v24;
      do
      {
        v7 = (int)v6;
        v6 = v5 + (int)v6;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(obj);
          objc_msgSend(obj, "objectAtIndexedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Group %d suggestions: "), ++v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNClusteringLogger padStringWithSpaces:toSize:](VNClusteringLogger, "padStringWithSpaces:toSize:", v9, 25);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v10);
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = v8;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v20;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v20 != v13)
                  objc_enumerationMutation(v11);
                objc_msgSend(v4, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14++));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v12);
          }

          if (objc_msgSend(v11, "count"))
            objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 2);
          objc_msgSend(v4, "appendString:", CFSTR("\n"));

        }
        while (v7 != v6);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v5);
    }

    -[VNSuggestionsLogger logString:](v15, "logString:", v4);
  }

}

- (void)logFinalSuggestionsList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Final list of suggestions face IDs (results):\n"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 2, 2);
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
    -[VNSuggestionsLogger logString:](self, "logString:", v6);

  }
}

- (void)logString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v13, "UTF8String");
  VNValidatedLog(1, (uint64_t)CFSTR("%s"), v5, v6, v7, v8, v9, v10, v4);
  if (-[VNClusteringLogger logEnabled](self, "logEnabled"))
  {
    -[VNClusteringLogger logFileURL](self, "logFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNClusteringLogger appendString:toLogFile:](VNClusteringLogger, "appendString:toLogFile:", v13, v12);

  }
}

@end

@implementation _LTDisambiguableSentence

- (_LTDisambiguableSentence)initWithSourceText:(id)a3 targetPhrases:(id)a4 selectedPhraseIndex:(unint64_t)a5
{
  id v8;
  id v9;
  _LTDisambiguableSentence *v10;
  uint64_t v11;
  NSString *sourceText;
  uint64_t v13;
  NSArray *targetPhrases;
  uint64_t v15;
  NSUUID *UUID;
  _LTDisambiguableSentence *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_LTDisambiguableSentence;
  v10 = -[_LTDisambiguableSentence init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    sourceText = v10->_sourceText;
    v10->_sourceText = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    targetPhrases = v10->_targetPhrases;
    v10->_targetPhrases = (NSArray *)v13;

    v10->_selectedPhraseIndex = a5;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v15;

    -[_LTDisambiguableSentence _commonInit](v10, "_commonInit");
    -[_LTDisambiguableSentence _validateAndPopulateEdges](v10, "_validateAndPopulateEdges");
    v17 = v10;
  }

  return v10;
}

- (void)_commonInit
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *history;
  id v6;

  objc_storeWeak((id *)&self->_historyProvider, self);
  v3 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_selectedPhraseIndex);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v6);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  history = self->_history;
  self->_history = v4;

}

- (_LTDisambiguationNode)selectedTargetPhrase
{
  unint64_t selectedPhraseIndex;
  void *v4;

  selectedPhraseIndex = self->_selectedPhraseIndex;
  if (selectedPhraseIndex >= -[NSArray count](self->_targetPhrases, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_targetPhrases, "objectAtIndexedSubscript:", self->_selectedPhraseIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (_LTDisambiguationNode *)v4;
}

- (BOOL)hasDisambiguations
{
  return -[NSArray lt_hasObjectPassingTest:](self->_targetPhrases, "lt_hasObjectPassingTest:", &__block_literal_global_1);
}

- (BOOL)hasDisambiguationsOfType:(unint64_t)a3
{
  NSArray *targetPhrases;
  _QWORD v5[5];

  targetPhrases = self->_targetPhrases;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e31_B16__0___LTDisambiguationNode_8l;
  v5[4] = a3;
  return -[NSArray lt_hasObjectPassingTest:](targetPhrases, "lt_hasObjectPassingTest:", v5);
}

- (NSString)targetText
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[_LTDisambiguableSentence selectedTargetPhrase](self, "selectedTargetPhrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_250695360;
  v5 = v3;

  return v5;
}

- (NSString)romanization
{
  void *v2;
  void *v3;

  -[_LTDisambiguableSentence selectedTargetPhrase](self, "selectedTargetPhrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "romanization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)menuConfigurationsForLinkIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47[2];
  id location;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[_LTDisambiguableSentence selectedTargetPhrase](self, "selectedTargetPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v3;
  if (!v3)
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_31;
  }
  objc_msgSend(v3, "links");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v38;
  v5 = objc_msgSend(v38, "count");
  v6 = (void *)MEMORY[0x24BDBD1A8];
  if (v5 <= a3)
    goto LABEL_29;
  objc_msgSend(v38, "objectAtIndexedSubscript:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v37, "adjacencyList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (!v9)
    goto LABEL_14;
  v10 = *(_QWORD *)v54;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v54 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "type");
      v14 = v7;
      if (v13)
      {
        if (v13 != 1)
          continue;
        v14 = v42;
      }
      objc_msgSend(v14, "addObject:", v12);
    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  }
  while (v9);
LABEL_14:

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(v20, "menuDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22)
          v24 = (void *)v22;
        else
          v24 = v6;
        v25 = v24;

        objc_msgSend(v25, "arrayByAddingObject:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, v21);
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v28 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke;
  v45[3] = &unk_250693478;
  objc_copyWeak(v47, &location);
  v29 = v27;
  v46 = v29;
  v47[1] = (id)a3;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v45);
  v43[0] = v28;
  v43[1] = 3221225472;
  v43[2] = __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke_2;
  v43[3] = &unk_2506934A0;
  v30 = v29;
  v44 = v30;
  objc_msgSend(v16, "_ltCompactMap:", v43);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sortedArrayUsingSelector:", sel_compare_);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sortedArrayUsingSelector:", sel_compare_);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDisambiguableSentence _includedTypesFromDelegate](self, "_includedTypesFromDelegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "containsObject:", &unk_2506A41B0))
    objc_msgSend(v35, "addObjectsFromArray:", v32);
  if (objc_msgSend(v34, "containsObject:", &unk_2506A41C8))
    objc_msgSend(v35, "addObjectsFromArray:", v33);
  v6 = (void *)objc_msgSend(v35, "copy");

  objc_destroyWeak(v47);
  objc_destroyWeak(&location);

  v4 = v38;
LABEL_29:

LABEL_31:
  return v6;
}

- (id)sourceTextSnippetForLinkIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;

  -[_LTDisambiguableSentence selectedTargetPhrase](self, "selectedTargetPhrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "links");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v15 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_LTDisambiguableSentence sourceTextSnippetForLinkIndex:].cold.1();
    goto LABEL_6;
  }
  objc_msgSend(v6, "links");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LTDisambiguableSentence sourceText](self, "sourceText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "sourceRange");
  objc_msgSend(v11, "substringWithRange:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v14;
}

- (id)meaningDescriptionForLinkIndex:(unint64_t)a3 inTargetPhrase:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];

  -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
    return 0;
  -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "links");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 <= a3)
  {
    v19 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_LTDisambiguableSentence meaningDescriptionForLinkIndex:inTargetPhrase:].cold.2();
    v17 = 0;
  }
  else
  {
    objc_msgSend(v10, "links");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "adjacencyList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __74___LTDisambiguableSentence_meaningDescriptionForLinkIndex_inTargetPhrase___block_invoke;
    v21[3] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
    v21[4] = a4;
    objc_msgSend(v15, "lt_firstObjectPassingTest:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "menuDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[_LTDisambiguableSentence meaningDescriptionForLinkIndex:inTargetPhrase:].cold.1();
      v17 = 0;
    }

  }
  return v17;
}

- (void)_insertPrefix:(id)a3
{
  id v4;
  NSString *v5;
  NSString *sourceText;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, self->_sourceText);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    sourceText = self->_sourceText;
    self->_sourceText = v5;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_insertPrefix:", v4);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (NSArray)history
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_history, "copy");
}

- (void)addNodeIndexToHistory:(unint64_t)a3
{
  NSMutableArray *history;
  id v4;

  history = self->_history;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](history, "addObject:", v4);

}

- (void)setHistoryProvider:(id)a3
{
  id v4;
  id WeakRetained;
  _LTDisambiguableSentence *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);

  if (WeakRetained != v4)
  {
    v6 = (_LTDisambiguableSentence *)objc_loadWeakRetained((id *)&self->_historyProvider);
    objc_storeWeak((id *)&self->_historyProvider, v4);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_LTDisambiguableSentence history](v6, "history", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "addNodeIndexToHistory:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "unsignedIntegerValue"));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    if (v6 == self)
      -[NSMutableArray removeAllObjects](self->_history, "removeAllObjects");

  }
}

- (void)setSelectedPhraseIndex:(unint64_t)a3
{
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  id v9;

  if (self->_selectedPhraseIndex != a3 && -[NSArray count](self->_targetPhrases, "count") > a3)
  {
    -[_LTDisambiguableSentence _userSelectionFromIndex:toIndex:](self, "_userSelectionFromIndex:toIndex:", self->_selectedPhraseIndex, a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    self->_selectedPhraseIndex = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);
    objc_msgSend(WeakRetained, "addNodeIndexToHistory:", a3);

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSArray objectAtIndexedSubscript:](self->_targetPhrases, "objectAtIndexedSubscript:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "disambiguableSentence:didSelectNode:atIndex:withSelection:", self, v8, a3, v9);

    }
  }
}

- (BOOL)_restoreChanges:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD aBlock[5];
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "changeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke;
  aBlock[3] = &unk_2506934E8;
  aBlock[4] = self;
  v7 = v5;
  v35 = v7;
  v8 = _Block_copy(aBlock);
  -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke_2;
    v31[3] = &unk_250693538;
    v33 = v8;
    v12 = v10;
    v32 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v31);

    v28 = 0;
    v29[0] = &v28;
    v29[1] = 0x2020000000;
    v30 = 0;
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    v30 = v15;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke_4;
    v23[3] = &unk_250693560;
    v23[4] = &v28;
    v23[5] = &v24;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v23);
    v16 = v25[3];
    v17 = v16 != 0;
    if (v16)
    {
      v18 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = v25[3];
        v20 = *(_QWORD *)(v29[0] + 24);
        *(_DWORD *)buf = 134218240;
        v37 = v19;
        v38 = 2048;
        v39 = v20;
        _os_log_impl(&dword_235438000, v18, OS_LOG_TYPE_INFO, "Highest scoring node was %zu with score %f; making this the selected node in the sentence to restore user selections",
          buf,
          0x16u);
      }
      self->_selectedPhraseIndex = v25[3];
    }
    else
    {
      v21 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[_LTDisambiguableSentence _restoreChanges:].cold.1((uint64_t)v29, v21);
    }
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_userSelectionFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  _LTDisambiguationUserSelection *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _LTDisambiguationUserSelection *v15;
  NSObject *v16;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = 0;
  if (a3 != a4 && v8 > a3 && v8 > a4)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "links");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke;
    v18[3] = &unk_250693588;
    v18[4] = &v23;
    v18[5] = &v19;
    v18[6] = a4;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);

    -[_LTDisambiguableSentence sourceTextSnippetForLinkIndex:](self, "sourceTextSnippetForLinkIndex:", v20[3]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v24[5] && v20[3] != 0x7FFFFFFFFFFFFFFFLL && v13)
    {
      v15 = [_LTDisambiguationUserSelection alloc];
      v9 = -[_LTDisambiguationUserSelection initWithEdge:sourceSnippet:linkIndex:](v15, "initWithEdge:sourceSnippet:linkIndex:", v24[5], v14, v20[3]);
    }
    else
    {
      v16 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v30 = a3;
        v31 = 2048;
        v32 = a4;
        _os_log_impl(&dword_235438000, v16, OS_LOG_TYPE_INFO, "Failed to find source edge when moving from node %zu to %zu; not providing user selection info",
          buf,
          0x16u);
      }
      v9 = 0;
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);

  }
  return v9;
}

- (id)_genderForLinkIndex:(unint64_t)a3 inPhraseIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[NSArray count](self->_targetPhrases, "count") <= a4)
  {
    v10 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_targetPhrases, "objectAtIndexedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "links");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") <= a3)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "gender");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v10;
}

- (unint64_t)_preferredGenderFromEdgesWithDuplicateMeaning:(id)a3 forLinkIndex:(unint64_t)a4 inPhrase:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  uint64_t v36;
  id obj;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[_LTDisambiguableSentence _genderForLinkIndex:inPhraseIndex:](self, "_genderForLinkIndex:inPhraseIndex:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);
    objc_msgSend(WeakRetained, "history");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reverseObjectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v14;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      v18 = MEMORY[0x24BDAC760];
      v35 = v8;
LABEL_5:
      v19 = 0;
      v36 = v16;
      while (1)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(obj);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v19), "unsignedIntegerValue");
        v38[0] = v18;
        v38[1] = 3221225472;
        v38[2] = __96___LTDisambiguableSentence__preferredGenderFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke;
        v38[3] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
        v38[4] = v20;
        objc_msgSend(v8, "lt_firstObjectPassingTest:", v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "targetGender");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
          break;
        if (v20 < -[NSArray count](self->_targetPhrases, "count"))
        {
          v24 = v17;
          -[NSArray objectAtIndexedSubscript:](self->_targetPhrases, "objectAtIndexedSubscript:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "links");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = a4;
          v28 = objc_msgSend(v26, "count");

          v29 = v28 > v27;
          a4 = v27;
          if (v29)
          {
            objc_msgSend(v25, "links");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectAtIndexedSubscript:", v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "gender");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v34 = v32;
              v11 = objc_msgSend(v32, "unsignedIntegerValue");

              v8 = v35;
              goto LABEL_19;
            }

            a4 = v27;
          }

          v17 = v24;
          v8 = v35;
          v16 = v36;
        }

        if (v16 == ++v19)
        {
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v16)
            goto LABEL_5;
          goto LABEL_17;
        }
      }
      v11 = objc_msgSend(v22, "unsignedIntegerValue");
LABEL_19:

      goto LABEL_20;
    }
LABEL_17:

    v11 = 0;
LABEL_20:
    v10 = 0;
  }

  return v11;
}

- (id)_preferredEdgeFromEdgesWithDuplicateMeaning:(id)a3 forLinkIndex:(unint64_t)a4 inPhrase:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];

  v8 = a3;
  v9 = -[_LTDisambiguableSentence _preferredGenderFromEdgesWithDuplicateMeaning:forLinkIndex:inPhrase:](self, "_preferredGenderFromEdgesWithDuplicateMeaning:forLinkIndex:inPhrase:", v8, a4, a5);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94___LTDisambiguableSentence__preferredEdgeFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke;
  v15[3] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
  v15[4] = v9;
  objc_msgSend(v8, "lt_firstObjectPassingTest:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v8, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (id)_generateAttributedStringForLocation:(unint64_t)a3 result:(id)a4 excludedTypes:(id)a5 globalAttributes:(id)a6 attributeProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _LTDisambiguableSentence *v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a3)
    -[_LTDisambiguableSentence targetText](self, "targetText");
  else
    -[_LTDisambiguableSentence sourceText](self, "sourceText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v16);
  v18 = v17;
  if (v14)
    objc_msgSend(v17, "addAttributes:range:", v14, 0, objc_msgSend(v17, "length"));
  -[_LTDisambiguableSentence selectedTargetPhrase](self, "selectedTargetPhrase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[_LTDisambiguableSentence _includedTypesFromExcludedTypes:](self, "_includedTypesFromExcludedTypes:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "links");
    v27 = v13;
    v21 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __121___LTDisambiguableSentence__generateAttributedStringForLocation_result_excludedTypes_globalAttributes_attributeProvider___block_invoke;
    v28[3] = &unk_2506935B0;
    v29 = v20;
    v35 = a3;
    v34 = v15;
    v30 = v21;
    v31 = self;
    v32 = v19;
    v23 = v18;
    v33 = v23;
    v24 = v20;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v28);

    v12 = v21;
    v13 = v27;
    v25 = (void *)objc_msgSend(v23, "copy");

  }
  else
  {
    v25 = (void *)objc_msgSend(v18, "copy");
  }

  return v25;
}

- (id)_includedTypesFromExcludedTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", &unk_2506A4168);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "minusSet:", v3);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)_includedTypesFromDelegate
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "excludedTypesForDisambiguableSentence:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[_LTDisambiguableSentence _includedTypesFromExcludedTypes:](self, "_includedTypesFromExcludedTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_validateAndPopulateEdges
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235438000, log, OS_LOG_TYPE_ERROR, "Failed to validate all links and edges; using a sentence with no disambiguations",
    v1,
    2u);
}

- (void)_removeUnvalidatedAdjacencyLists
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(v7, "links", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_finishValidating");
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (void)_removeRomanization
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_removeRomanization");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_directedEdgeFromUnvalidatedEdge:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  id v46;
  void *v47;
  void *v48;

  v4 = a3;
  -[_LTDisambiguableSentence targetPhrases](self, "targetPhrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "targetPhraseIndex");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v28 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:].cold.4(v6, v28, v29, v30, v31, v32, v33, v34);
    v35 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "targetLinkIndex");
    objc_msgSend(v7, "links");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 >= v10)
    {
      v36 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:].cold.3(v8, v36, v37, v38, v39, v40, v41, v42);
      v35 = 0;
    }
    else
    {
      objc_msgSend(v7, "links");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "sourceRange");
      v15 = v14;
      -[_LTDisambiguableSentence sourceText](self, "sourceText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "lt_validSubrange:", v13, v15) & 1) != 0)
      {
        v17 = objc_msgSend(v12, "targetRange");
        v19 = v18;
        objc_msgSend(v7, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "lt_validSubrange:", v17, v19) & 1) != 0)
        {
          v47 = v20;
          objc_msgSend(v20, "substringWithRange:", v17, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex:", v6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "targetGender");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "defaultGender");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v4, "type");
          v48 = v22;
          if (v25 == 1)
          {
            objc_msgSend(v4, "targetGender");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[_LTDirectedEdge genderEdgeWithTargetPhraseIndex:targetPreview:gender:defaultGender:](_LTDirectedEdge, "genderEdgeWithTargetPhraseIndex:targetPreview:gender:defaultGender:", v6, v21, objc_msgSend(v26, "unsignedIntegerValue"), objc_msgSend(v24, "unsignedIntegerValue"));
            v27 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v25)
            {
              unexpectedDisambiguationTypeException(objc_msgSend(v4, "type"));
              v46 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v46);
            }
            objc_msgSend(v4, "meaningDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[_LTDirectedEdge meaningEdgeWithTargetPhraseIndex:targetPreview:meaningDescription:targetGender:defaultGender:](_LTDirectedEdge, "meaningEdgeWithTargetPhraseIndex:targetPreview:meaningDescription:targetGender:defaultGender:", v6, v21, v26, v23, v24);
            v27 = objc_claimAutoreleasedReturnValue();
          }
          v35 = (void *)v27;

          v20 = v47;
        }
        else
        {
          v44 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:].cold.1(v44, v17, v19);
          v35 = 0;
        }

      }
      else
      {
        v43 = _LTOSLogDisambiguation();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:].cold.2(v43, v13, v15);
        v35 = 0;
      }

    }
  }

  return v35;
}

- (BOOL)_hasOverlapInRangeArray:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_37);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "rangeValue", (_QWORD)v11);
        if (v8 < v5)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
        v5 = v8 + v9;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_historyForEncoding
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);
  objc_msgSend(WeakRetained, "history");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lt_suffixWithMaxLength:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sourceText;
  id v5;
  id v6;

  sourceText = self->_sourceText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceText, CFSTR("sourceText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetPhrases, CFSTR("targetPhrases"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selectedPhraseIndex, CFSTR("selectedPhraseIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  -[_LTDisambiguableSentence _historyForEncoding](self, "_historyForEncoding");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("history"));

}

- (_LTDisambiguableSentence)initWithCoder:(id)a3
{
  id v4;
  _LTDisambiguableSentence *v5;
  uint64_t v6;
  NSString *sourceText;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *targetPhrases;
  uint64_t v13;
  NSUUID *UUID;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *history;
  _LTDisambiguableSentence *v21;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_LTDisambiguableSentence;
  v5 = -[_LTDisambiguableSentence init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceText"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceText = v5->_sourceText;
    v5->_sourceText = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("targetPhrases"));
    v11 = objc_claimAutoreleasedReturnValue();
    targetPhrases = v5->_targetPhrases;
    v5->_targetPhrases = (NSArray *)v11;

    v5->_selectedPhraseIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedPhraseIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v13 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v13;

    -[_LTDisambiguableSentence _commonInit](v5, "_commonInit");
    v15 = (void *)MEMORY[0x24BDBCF20];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("history"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      history = v5->_history;
      v5->_history = (NSMutableArray *)v19;

    }
    v21 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "allocWithZone:"), "initWithArray:copyItems:", self->_targetPhrases, 1);
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v7 = (void *)-[NSString copy](self->_sourceText, "copy");
  v8 = (void *)objc_msgSend(v6, "initWithSourceText:targetPhrases:selectedPhraseIndex:", v7, v5, self->_selectedPhraseIndex);

  return v8;
}

- (NSString)sourceText
{
  return self->_sourceText;
}

- (NSArray)targetPhrases
{
  return self->_targetPhrases;
}

- (unint64_t)selectedPhraseIndex
{
  return self->_selectedPhraseIndex;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (_LTDisambiguableSentenceDelegate)delegate
{
  return (_LTDisambiguableSentenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_LTDisambiguableSentenceHistoryProviding)historyProvider
{
  return (_LTDisambiguableSentenceHistoryProviding *)objc_loadWeakRetained((id *)&self->_historyProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_historyProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_targetPhrases, 0);
  objc_storeStrong((id *)&self->_sourceText, 0);
  objc_storeStrong((id *)&self->_history, 0);
}

- (void)sourceTextSnippetForLinkIndex:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235438000, v0, (uint64_t)v0, "Requested source snippet for out of bounds link index %zu of %zu, not providing a source snippet", v1);
  OUTLINED_FUNCTION_1();
}

- (void)meaningDescriptionForLinkIndex:inTargetPhrase:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_235438000, v0, OS_LOG_TYPE_DEBUG, "There are no meaning edges in phase %zu at link %zu; can't return a meaning description",
    v1,
    0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)meaningDescriptionForLinkIndex:inTargetPhrase:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235438000, v0, (uint64_t)v0, "Requested meaning description for out of bounds link index %zu of %zu, not providing a meaning description", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_restoreChanges:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_235438000, a2, OS_LOG_TYPE_DEBUG, "Highest scoring node was initial node with score %f; no need to change selected node to restore previous user selections",
    (uint8_t *)&v3,
    0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_directedEdgeFromUnvalidatedEdge:(void *)a3 .cold.1(void *a1, NSUInteger a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;
  NSRange v9;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v9.location = a2;
  v9.length = (NSUInteger)a3;
  NSStringFromRange(v9);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_235438000, v5, v6, "Failed to create directed edge; range %{public}@ invalid in target string of length %zu",
    v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)_directedEdgeFromUnvalidatedEdge:(void *)a3 .cold.2(void *a1, NSUInteger a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;
  NSRange v9;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v9.location = a2;
  v9.length = (NSUInteger)a3;
  NSStringFromRange(v9);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_2(&dword_235438000, v5, v6, "Failed to create directed edge; range %{public}@ invalid in source string of length %zu",
    v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)_directedEdgeFromUnvalidatedEdge:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Failed to create directed edge; configuration references link index %zu which doesn't exist on this target node",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

- (void)_directedEdgeFromUnvalidatedEdge:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Failed to create directed edge; an edge references targetNode %zu which doesn't exist",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

@end

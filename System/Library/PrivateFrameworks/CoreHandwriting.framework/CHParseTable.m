@implementation CHParseTable

- (CHParseTable)initWithInputLength:(int64_t)a3 grammarSize:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  int64_t v7;
  uint64_t v8;
  CHParseTable *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *table;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a3;
  v8 = objc_msgSend_init(self, a2, a3, a4, v4, v5);
  v9 = (CHParseTable *)v8;
  if (v8)
  {
    *(_QWORD *)(v8 + 16) = v7;
    *(_QWORD *)(v8 + 24) = a4;
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v15 = objc_msgSend_initWithCapacity_(v10, v11, v7, v12, v13, v14);
    table = v9->_table;
    v9->_table = (NSMutableArray *)v15;

    if (v7 >= 1)
    {
      do
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v9->_table, v23, (uint64_t)v22, v24, v25, v26);

        --v7;
      }
      while (v7);
    }
  }
  return v9;
}

- (void)clear:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend_objectAtIndexedSubscript_(self->_table, a2, a3 - 1, v3, v4, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v11, v6, v7, v8, v9, v10);

}

- (void)addCell:(id)a3
{
  id v4;
  NSMutableArray *table;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v4 = a3;
  table = self->_table;
  v50 = v4;
  v11 = objc_msgSend_length(v4, v6, v7, v8, v9, v10);
  objc_msgSend_objectAtIndexedSubscript_(table, v12, v11 - 1, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_inputRange(v50, v17, v18, v19, v20, v21);
  objc_msgSend_stringForRange_(CHParseTableCell, v23, v22, (uint64_t)v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v27, (uint64_t)v26, v28, v29, v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v37, (uint64_t)v36, (uint64_t)v26, v38, v39);
  }
  objc_msgSend_nonTerminal(v50, v31, v32, v33, v34, v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v40, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v36, v47, (uint64_t)v50, (uint64_t)v46, v48, v49);

}

- (id)cellWithLength:(int64_t)a3 range:(_NSRange)a4 nonTerminal:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend_objectAtIndexedSubscript_(self->_table, v10, a3 - 1, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForRange_(CHParseTableCell, v15, location, length, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v19, (uint64_t)v18, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v23;
  if (v23)
  {
    objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v9, v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)cellsOfLength:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(self->_table, v9, a3 - 1, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i < objc_msgSend_count(v19, v20, v21, v22, v23, v24); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v19, v26, i, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v30, v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObjectsFromArray_(v8, v37, (uint64_t)v36, v38, v39, v40);
  }

  return v8;
}

- (id)cellsByRangeForLength:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend_objectAtIndexedSubscript_(self->_table, v9, a3 - 1, v10, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v36, (uint64_t)v40, 16, v21);
  if (v27)
  {
    v28 = *(_QWORD *)v37;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(v19);
        objc_msgSend_allValues(*(void **)(*((_QWORD *)&v36 + 1) + 8 * v29), v22, v23, v24, v25, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v8, v31, (uint64_t)v30, v32, v33, v34);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v36, (uint64_t)v40, 16, v26);
    }
    while (v27);
  }

  return v8;
}

- (id)startCellsWithLength:(int64_t)a3 inRange:(_NSRange)a4 startSymbol:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  NSUInteger v29;
  NSUInteger v30;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend_cellsOfLength_(self, v10, a3, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BE7B5350;
  v27[3] = &unk_1E77F50C8;
  v15 = v9;
  v28 = v15;
  v29 = location;
  v30 = length;
  objc_msgSend_indexesOfObjectsPassingTest_(v14, v16, (uint64_t)v27, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectsAtIndexes_(v14, v21, (uint64_t)v20, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (int64_t)inputLength
{
  return self->_inputLength;
}

- (void)setInputLength:(int64_t)a3
{
  self->_inputLength = a3;
}

- (int64_t)grammarSize
{
  return self->_grammarSize;
}

- (void)setGrammarSize:(int64_t)a3
{
  self->_grammarSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
}

@end

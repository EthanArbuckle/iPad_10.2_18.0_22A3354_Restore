@implementation DMCFieldCollection

- (DMCFieldCollection)initWithUserInput:(id)a3
{
  id v4;
  DMCFieldCollection *v5;
  uint64_t v6;
  NSMutableArray *payloadFieldArrays;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  DMCPayloadUserInputField *v19;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DMCFieldCollection;
  v5 = -[DMCFieldCollection init](&v31, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    payloadFieldArrays = v5->_payloadFieldArrays;
    v5->_payloadFieldArrays = (NSMutableArray *)v6;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v24 != v17)
                  objc_enumerationMutation(v14);
                v19 = -[DMCPayloadUserInputField initWithFieldDictionary:]([DMCPayloadUserInputField alloc], "initWithFieldDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
                objc_msgSend(v13, "addObject:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            }
            while (v16);
            v10 = 1;
          }

          -[NSMutableArray addObject:](v5->_payloadFieldArrays, "addObject:", v13);
          if ((v10 & 1) == 0)
            ++v5->_currentPayloadIndex;

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v9);
    }

    -[DMCFieldCollection _setCurrentFieldToCurrentIndices](v5, "_setCurrentFieldToCurrentIndices");
  }

  return v5;
}

- (id)userInputResponses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_payloadFieldArrays, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_payloadFieldArrays;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "responseDictionary");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        objc_msgSend(v3, "addObject:", v9);
        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)currentField
{
  return self->_currentField;
}

- (void)_setIsFinalField
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  if (-[DMCFieldCollection currentFieldIsLastInPayload](self, "currentFieldIsLastInPayload"))
  {
    self->_isFinalField = 1;
    v3 = self->_currentPayloadIndex + 1;
    while (v3 < -[NSMutableArray count](self->_payloadFieldArrays, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_payloadFieldArrays, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      ++v3;
      if (v5)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    self->_isFinalField = 0;
  }
}

- (void)_setCurrentFieldToCurrentIndices
{
  DMCPayloadUserInputField *currentField;
  unint64_t currentPayloadIndex;
  void *v5;
  unint64_t currentFieldIndex;
  DMCPayloadUserInputField *v7;
  DMCPayloadUserInputField *v8;

  currentField = self->_currentField;
  self->_currentField = 0;

  currentPayloadIndex = self->_currentPayloadIndex;
  if (currentPayloadIndex < -[NSMutableArray count](self->_payloadFieldArrays, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_payloadFieldArrays, "objectAtIndex:", self->_currentPayloadIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    currentFieldIndex = self->_currentFieldIndex;
    if (currentFieldIndex < objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndex:", self->_currentFieldIndex);
      v7 = (DMCPayloadUserInputField *)objc_claimAutoreleasedReturnValue();
      v8 = self->_currentField;
      self->_currentField = v7;

    }
  }
  -[DMCFieldCollection _setIsFinalField](self, "_setIsFinalField");
}

- (void)moveToNextField
{
  NSMutableArray *payloadFieldArrays;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  if (-[DMCFieldCollection currentFieldIsLastInPayload](self, "currentFieldIsLastInPayload"))
  {
    do
    {
      payloadFieldArrays = self->_payloadFieldArrays;
      v4 = self->_currentPayloadIndex + 1;
      self->_currentPayloadIndex = v4;
      if (v4 >= -[NSMutableArray count](payloadFieldArrays, "count"))
        break;
      -[NSMutableArray objectAtIndex:](self->_payloadFieldArrays, "objectAtIndex:", self->_currentPayloadIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

    }
    while (!v6);
    self->_currentFieldIndex = 0;
  }
  else
  {
    ++self->_currentFieldIndex;
  }
  -[DMCFieldCollection _setCurrentFieldToCurrentIndices](self, "_setCurrentFieldToCurrentIndices");
}

- (void)restartCurrentPayload
{
  self->_currentFieldIndex = 0;
  -[DMCFieldCollection _setCurrentFieldToCurrentIndices](self, "_setCurrentFieldToCurrentIndices");
}

- (BOOL)currentFieldIsLastInPayload
{
  unint64_t currentPayloadIndex;
  int64_t currentFieldIndex;
  void *v5;
  BOOL v6;

  currentPayloadIndex = self->_currentPayloadIndex;
  if (currentPayloadIndex >= -[NSMutableArray count](self->_payloadFieldArrays, "count"))
    return 0;
  currentFieldIndex = self->_currentFieldIndex;
  -[NSMutableArray objectAtIndex:](self->_payloadFieldArrays, "objectAtIndex:", self->_currentPayloadIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = currentFieldIndex == objc_msgSend(v5, "count") - 1;

  return v6;
}

- (BOOL)currentFieldIsFinalField
{
  return self->_isFinalField;
}

- (BOOL)currentFieldIsSinglePasswordField
{
  void *v3;
  BOOL v4;

  if (!-[DMCPayloadUserInputField isPassword](self->_currentField, "isPassword"))
    return 0;
  -[NSMutableArray objectAtIndex:](self->_payloadFieldArrays, "objectAtIndex:", self->_currentPayloadIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 1;

  return v4;
}

- (id)responseDictionariesForCurrentPayload
{
  unint64_t currentPayloadIndex;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  currentPayloadIndex = self->_currentPayloadIndex;
  if (currentPayloadIndex >= -[NSMutableArray count](self->_payloadFieldArrays, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_payloadFieldArrays, "objectAtIndex:", self->_currentPayloadIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "responseDictionary", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  if (v5)
    v12 = v5;
  else
    v12 = (void *)MEMORY[0x24BDBD1A8];
  v13 = v12;

  return v13;
}

- (int64_t)currentPayloadIndex
{
  return self->_currentPayloadIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentField, 0);
  objc_storeStrong((id *)&self->_payloadFieldArrays, 0);
}

@end

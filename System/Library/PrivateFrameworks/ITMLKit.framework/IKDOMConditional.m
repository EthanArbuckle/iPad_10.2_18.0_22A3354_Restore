@implementation IKDOMConditional

- (IKDOMConditional)initWithDOMElement:(id)a3
{
  id v4;
  IKDOMConditional *v5;
  IKDOMConditional *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKDOMConditional;
  v5 = -[IKDOMConditional init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_domElement, v4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

  }
  return v6;
}

- (NSArray)inclusionExpressions
{
  NSArray *inclusionExpressions;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  inclusionExpressions = self->_inclusionExpressions;
  if (!inclusionExpressions)
  {
    -[IKDOMConditional domElement](self, "domElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAttribute:", CFSTR("state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_IKDOMConditionalExpression parseExpressionsFromString:](_IKDOMConditionalExpression, "parseExpressionsFromString:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_inclusionExpressions;
    self->_inclusionExpressions = v6;

    inclusionExpressions = self->_inclusionExpressions;
  }
  return inclusionExpressions;
}

- (NSArray)exclusionExpressions
{
  NSArray *exclusionExpressions;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  exclusionExpressions = self->_exclusionExpressions;
  if (!exclusionExpressions)
  {
    -[IKDOMConditional domElement](self, "domElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAttribute:", CFSTR("notInState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_IKDOMConditionalExpression parseExpressionsFromString:](_IKDOMConditionalExpression, "parseExpressionsFromString:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_exclusionExpressions;
    self->_exclusionExpressions = v6;

    exclusionExpressions = self->_exclusionExpressions;
  }
  return exclusionExpressions;
}

- (NSSet)dependentPathStrings
{
  NSSet *dependentPathStrings;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSSet *v17;
  NSSet *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  dependentPathStrings = self->_dependentPathStrings;
  if (!dependentPathStrings)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[IKDOMConditional inclusionExpressions](self, "inclusionExpressions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9), "dependentPathStrings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[IKDOMConditional exclusionExpressions](self, "exclusionExpressions", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "dependentPathStrings");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }

    v17 = (NSSet *)objc_msgSend(v4, "copy");
    v18 = self->_dependentPathStrings;
    self->_dependentPathStrings = v17;

    dependentPathStrings = self->_dependentPathStrings;
  }
  return dependentPathStrings;
}

- (BOOL)passesForDataItem:(id)a3 default:(BOOL)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__IKDOMConditional_passesForDataItem_default___block_invoke;
  v18[3] = &unk_1E9F4BDF8;
  v19 = v6;
  v7 = v6;
  v8 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1DF092410](v18);
  -[IKDOMConditional inclusionExpressions](self, "inclusionExpressions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[IKDOMConditional exclusionExpressions](self, "exclusionExpressions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
    v13 = 0;
  else
    v13 = a4;
  if (v10)
  {
    -[IKDOMConditional inclusionExpressions](self, "inclusionExpressions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v14);

  }
  if (v12)
    LOBYTE(v15) = 1;
  else
    LOBYTE(v15) = v13;
  if (v12 && (v13 & 1) == 0)
  {
    -[IKDOMConditional exclusionExpressions](self, "exclusionExpressions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v16) ^ 1;

  }
  return v15;
}

uint64_t __46__IKDOMConditional_passesForDataItem_default___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "passesForDataItem:", *(_QWORD *)(a1 + 32), (_QWORD)v10) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)mutateWithDOMElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *inclusionExpressions;
  NSArray *exclusionExpressions;
  NSSet *dependentPathStrings;

  v4 = a3;
  -[IKDOMConditional domElement](self, "domElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMConditional domElement](self, "domElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "replaceChild::", v4, v7);

  objc_storeWeak((id *)&self->_domElement, v4);
  inclusionExpressions = self->_inclusionExpressions;
  self->_inclusionExpressions = 0;

  exclusionExpressions = self->_exclusionExpressions;
  self->_exclusionExpressions = 0;

  dependentPathStrings = self->_dependentPathStrings;
  self->_dependentPathStrings = 0;

}

- (IKDOMElement)domElement
{
  return (IKDOMElement *)objc_loadWeakRetained((id *)&self->_domElement);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_domElement);
  objc_storeStrong((id *)&self->_dependentPathStrings, 0);
  objc_storeStrong((id *)&self->_exclusionExpressions, 0);
  objc_storeStrong((id *)&self->_inclusionExpressions, 0);
}

@end

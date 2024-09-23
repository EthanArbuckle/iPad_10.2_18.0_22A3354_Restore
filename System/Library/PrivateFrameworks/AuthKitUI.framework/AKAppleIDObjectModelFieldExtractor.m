@implementation AKAppleIDObjectModelFieldExtractor

- (AKAppleIDObjectModelFieldExtractor)initWithObjectModel:(id)a3
{
  id v5;
  AKAppleIDObjectModelFieldExtractor *v6;
  AKAppleIDObjectModelFieldExtractor *v7;

  v5 = a3;
  v6 = -[AKAppleIDObjectModelFieldExtractor init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_objectModel, a3);

  return v7;
}

- (id)valueForFieldWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[AKAppleIDObjectModelFieldExtractor _valueForFieldWithID:inObjectModel:](self, "_valueForFieldWithID:inObjectModel:", v4, self->_objectModel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[RUIObjectModel serverInfo](self->_objectModel, "serverInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_valueForFieldWithID:(id)a3 inObjectModel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1BD795000, v8, OS_LOG_TYPE_DEFAULT, "Extracting value for row: %@", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(v7, "displayedPages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hasTableView"))
  {
    -[AKAppleIDObjectModelFieldExtractor _valueForTextFieldFromPage:rowID:](self, "_valueForTextFieldFromPage:rowID:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "passcodeViewOM");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_10;
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDObjectModelFieldExtractor _valueForFieldWithID:inObjectModel:].cold.1(v12, v13);

    objc_msgSend(v12, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v6);

    if (v16)
    {
      objc_msgSend(v12, "passcodeField");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v18, "copy");

    }
    else
    {
LABEL_10:
      v11 = 0;
    }

  }
  return v11;
}

- (id)_valueForTextFieldFromPage:(id)a3 rowID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tableViewOM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v29)
  {
    v9 = 0;
    goto LABEL_25;
  }
  v25 = v7;
  v26 = v5;
  v9 = 0;
  v27 = *(_QWORD *)v36;
  v28 = v8;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v36 != v27)
        objc_enumerationMutation(v8);
      v30 = v10;
      v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v11, "rows", v25, v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v17, "attributes");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("id"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqual:", v6);

            if (v20)
            {
              v21 = v17;

              v9 = v21;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v14);
      }

      v10 = v30 + 1;
      v8 = v28;
    }
    while (v30 + 1 != v29);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  }
  while (v29);

  if (v9)
  {
    objc_msgSend(v9, "control");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v25;
    v5 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    _AKLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[AKAppleIDObjectModelFieldExtractor _valueForTextFieldFromPage:rowID:].cold.1((uint64_t)v6, v23);

LABEL_25:
    v22 = 0;
    goto LABEL_26;
  }
  v22 = 0;
  v7 = v25;
  v5 = v26;
LABEL_27:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectModel, 0);
}

- (void)_valueForFieldWithID:(void *)a1 inObjectModel:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Passcode view with ID %@ found", (uint8_t *)&v5, 0xCu);

}

- (void)_valueForTextFieldFromPage:(uint64_t)a1 rowID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "BuddyML contained row with ID %{public}@ but it did not contain a text field.", (uint8_t *)&v2, 0xCu);
}

@end

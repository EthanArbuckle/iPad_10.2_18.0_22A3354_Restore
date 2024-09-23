@implementation HKJSONVisitor

+ (id)visitorWithJSONObject:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  id v14;
  id *v15;

  v9 = a3;
  v10 = a4;
  v11 = (id *)objc_alloc_init((Class)a1);
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v9) & 1) != 0)
  {
    objc_storeStrong(v11 + 2, a3);
    objc_storeWeak(v11 + 1, v10);
    v11[5] = (id)0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v11[3];
    v11[3] = (id)v12;

    v14 = v11[4];
    v11[4] = (id)MEMORY[0x1E0C9AA60];

    v15 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("JSONObject is not valid JSON"));
    v15 = 0;
  }

  return v15;
}

- (void)traverseJSONObject
{
  -[HKJSONVisitor _traverseJSONObject:](self, "_traverseJSONObject:", self->_JSONObject);
}

- (NSString)lastKeyPathComponent
{
  void *v2;
  void *v3;

  -[NSString componentsSeparatedByString:](self->_currentKeyPath, "componentsSeparatedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)valueForKeyPath:(id)a3
{
  id v4;
  uint64_t v5;
  id JSONObject;
  id v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  JSONObject = self->_JSONObject;
  if (v5)
  {
    objc_msgSend(JSONObject, "valueForKeyPath:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = JSONObject;
  }
  v8 = v7;

  return v8;
}

- (int64_t)_traverseJSONObject:(id)a3
{
  id v5;
  int64_t v6;
  int64_t v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJSONVisitor.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[HKJSONVisitor _visitDictionary:](self, "_visitDictionary:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = -[HKJSONVisitor _visitArray:](self, "_visitArray:", v5);
    else
      v6 = -[HKJSONVisitor _visitPrimitive:](self, "_visitPrimitive:", v5);
  }
  v7 = v6;

  return v7;
}

- (int64_t)_visitDictionary:(id)a3
{
  id v5;
  HKJSONVisitorDelegate **p_delegate;
  id WeakRetained;
  id v8;
  int64_t v9;
  NSString **p_currentKeyPath;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSString *v21;
  NSString *currentKeyPath;
  NSArray *v23;
  NSArray *allKeyPathComponents;
  void *v25;
  int64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJSONVisitor.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionary isKindOfClass:[NSDictionary class]]"));

  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "performSelector:withObject:withObject:", sel_visitor_willVisitDictionary_, self, v5);

    if (!v9)
      goto LABEL_28;
    if (v9 == 2)
    {
      v9 = 1;
      goto LABEL_28;
    }
  }
  else
  {

  }
  p_currentKeyPath = &self->_currentKeyPath;
  v11 = (void *)-[NSString copy](self->_currentKeyPath, "copy");
  v12 = (void *)-[NSArray copy](self->_allKeyPathComponents, "copy");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v5, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x19AEC7968]();
        objc_msgSend(v11, "hk_stringByAppendingKeyPathComponent:", v19);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        currentKeyPath = self->_currentKeyPath;
        self->_currentKeyPath = v21;

        objc_msgSend(v12, "arrayByAddingObject:", v19);
        v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
        allKeyPathComponents = self->_allKeyPathComponents;
        self->_allKeyPathComponents = v23;

        objc_msgSend(v5, "objectForKeyedSubscript:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[HKJSONVisitor _traverseJSONObject:](self, "_traverseJSONObject:", v25);
        if (v26 == 2)
        {

          objc_autoreleasePoolPop(v20);
          p_currentKeyPath = &self->_currentKeyPath;
          p_delegate = &self->_delegate;
          goto LABEL_19;
        }
        if (!v26)
        {

          objc_autoreleasePoolPop(v20);
          v9 = 0;
          goto LABEL_27;
        }

        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      p_currentKeyPath = &self->_currentKeyPath;
      p_delegate = &self->_delegate;
      if (v16)
        continue;
      break;
    }
  }
LABEL_19:

  objc_storeStrong((id *)p_currentKeyPath, v11);
  objc_storeStrong((id *)&self->_allKeyPathComponents, v12);
  v27 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v28 = objc_loadWeakRetained((id *)p_delegate);
    v29 = objc_msgSend(v28, "performSelector:withObject:withObject:", sel_visitor_didVisitDictionary_, self, v5);

    v30 = 1;
    if (v29 == 2)
      v30 = 2;
    if (v29)
      v9 = v30;
    else
      v9 = 0;
  }
  else
  {

    v9 = 1;
  }
LABEL_27:

LABEL_28:
  return v9;
}

- (int64_t)_visitArray:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  int64_t v8;
  NSArray **p_allKeyPathComponents;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *allKeyPathComponents;
  int64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  id v29;
  id *location;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJSONVisitor.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[array isKindOfClass:[NSArray class]]"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(v7, "performSelector:withObject:withObject:", sel_visitor_willVisitArray_, self, v5);

    if (!v8)
      goto LABEL_28;
    if (v8 == 2)
    {
      v8 = 1;
      goto LABEL_28;
    }
  }
  else
  {

  }
  location = (id *)&self->_delegate;
  p_allKeyPathComponents = &self->_allKeyPathComponents;
  obj = (id)-[NSArray copy](self->_allKeyPathComponents, "copy");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v33;
    v29 = v5;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x19AEC7968]();
        self->_currentIndex = v13 + i;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 + i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "arrayByAddingObject:", v19);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        allKeyPathComponents = self->_allKeyPathComponents;
        self->_allKeyPathComponents = v20;

        v22 = -[HKJSONVisitor _traverseJSONObject:](self, "_traverseJSONObject:", v16);
        if (v22 == 2)
        {
          objc_autoreleasePoolPop(v17);
          p_allKeyPathComponents = &self->_allKeyPathComponents;
          v5 = v29;
          goto LABEL_19;
        }
        if (!v22)
        {
          objc_autoreleasePoolPop(v17);

          v8 = 0;
          v5 = v29;
          goto LABEL_27;
        }
        objc_autoreleasePoolPop(v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v13 += i;
      p_allKeyPathComponents = &self->_allKeyPathComponents;
      v5 = v29;
      if (v12)
        continue;
      break;
    }
  }
LABEL_19:

  self->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong((id *)p_allKeyPathComponents, obj);
  v23 = objc_loadWeakRetained(location);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = objc_loadWeakRetained(location);
    v25 = objc_msgSend(v24, "performSelector:withObject:withObject:", sel_visitor_didVisitArray_, self, v10);

    v26 = 1;
    if (v25 == 2)
      v26 = 2;
    if (v25)
      v8 = v26;
    else
      v8 = 0;
  }
  else
  {

    v8 = 1;
  }
LABEL_27:

LABEL_28:
  return v8;
}

- (int64_t)_visitPrimitive:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  int64_t v8;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKJSONVisitor.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSNull class]]"));

      }
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(v7, "performSelector:withObject:withObject:", sel_visitor_visitPrimitive_, self, v5);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSString)currentKeyPath
{
  return self->_currentKeyPath;
}

- (NSArray)allKeyPathComponents
{
  return self->_allKeyPathComponents;
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKeyPathComponents, 0);
  objc_storeStrong((id *)&self->_currentKeyPath, 0);
  objc_storeStrong(&self->_JSONObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

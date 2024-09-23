@implementation BPSHistogram

- (BPSHistogram)init
{
  BPSHistogram *v2;
  uint64_t v3;
  NSMutableDictionary *backingDictionary;
  NSArray *keyType;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSHistogram;
  v2 = -[BPSHistogram init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (NSMutableDictionary *)v3;

    keyType = v2->_keyType;
    v2->_keyType = 0;

  }
  return v2;
}

- (void)_setKeyTypeFromKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *keyType;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BPSHistogram removeAllScores](self, "removeAllScores");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", objc_opt_class(), v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  keyType = self->_keyType;
  self->_keyType = v11;

}

- (BOOL)_correctKeyType:(id)a3
{
  id v4;
  NSArray *keyType;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  keyType = self->_keyType;
  if (keyType && (v6 = -[NSArray count](keyType, "count"), v6 == objc_msgSend(v4, "count")))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__BPSHistogram__correctKeyType___block_invoke;
    v9[3] = &unk_1E554CFC8;
    v9[4] = self;
    v9[5] = &v10;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __32__BPSHistogram__correctKeyType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "isEqual:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a3));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)scoreForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
  v6 = &unk_1E55656D8;
  if (self->_keyType)
  {
    if (-[BPSHistogram _correctKeyType:](self, "_correctKeyType:", v5))
    {
      v7 = self->_backingDictionary;
      if (objc_msgSend(v5, "count") == 1)
      {
        v8 = v7;
LABEL_11:
        objc_msgSend(v5, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (void *)v13;
        else
          v15 = &unk_1E55656D8;
        v6 = v15;

      }
      else
      {
        v10 = 0;
        while (1)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v11);
          v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

          if (!v8)
            break;
          ++v10;
          v7 = v8;
          if (v10 >= objc_msgSend(v5, "count") - 1)
            goto LABEL_11;
        }
        v6 = &unk_1E55656D8;
      }
    }
    else
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BPSHistogram scoreForKey:].cold.1();

      v6 = &unk_1E55656D8;
    }
  }

  return v6;
}

- (void)addScore:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSArray *keyType;
  void *v9;
  NSMutableDictionary *v10;
  NSObject *p_super;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  double v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  keyType = self->_keyType;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 1);
  if (!keyType)
    -[BPSHistogram _setKeyTypeFromKey:](self, "_setKeyTypeFromKey:", v9);
  if (-[BPSHistogram _correctKeyType:](self, "_correctKeyType:", v9))
  {
    v10 = self->_backingDictionary;
    if (objc_msgSend(v9, "count") == 1)
    {
      p_super = &v10->super.super;
    }
    else
    {
      v12 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, v16);

        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v17);
        p_super = objc_claimAutoreleasedReturnValue();

        ++v12;
        v10 = (NSMutableDictionary *)p_super;
      }
      while (v12 < objc_msgSend(v9, "count") - 1);
    }
    objc_msgSend(v9, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](p_super, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = v20;

    objc_msgSend(v6, "floatValue");
    *(float *)&v22 = v21 + *(float *)&v22;
    if (*(float *)&v22 < 0.0)
      *(float *)&v22 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](p_super, "setObject:forKeyedSubscript:", v23, v24);

  }
  else
  {
    __biome_log_for_category();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      -[BPSHistogram scoreForKey:].cold.1();
  }

}

- (void)removeScoreForKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
  if (self->_keyType)
  {
    if (-[BPSHistogram _correctKeyType:](self, "_correctKeyType:", v5))
    {
      v6 = self->_backingDictionary;
      v7 = objc_msgSend(v5, "count");
      v8 = (void *)MEMORY[0x1E0C99DE8];
      if (v7 >= 2)
        v9 = objc_msgSend(v5, "count") - 2;
      else
        v9 = 0;
      objc_msgSend(v8, "arrayWithCapacity:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count") == 1)
      {
        v12 = v6;
LABEL_14:
        objc_msgSend(v5, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v17);

        v18 = objc_msgSend(v11, "count");
        if (v18 - 1 >= 0)
        {
          v19 = v18;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", --v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectAtIndexedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v22, "count"))
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectAtIndexedSubscript:", v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "removeObjectForKey:", v24);

            }
          }
          while (v19 > 0);
        }
        v6 = v12;
      }
      else
      {
        v13 = 0;
        while (1)
        {
          objc_msgSend(v11, "addObject:", v6);
          objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            break;
          objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v16);
          v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

          ++v13;
          v6 = v12;
          if (v13 >= objc_msgSend(v5, "count") - 1)
            goto LABEL_14;
        }
      }

    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BPSHistogram scoreForKey:].cold.1();

    }
  }

}

- (id)allKeysAtLevel:(unint64_t)a3
{
  NSArray *keyType;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  keyType = self->_keyType;
  if (keyType && -[NSArray count](keyType, "count") > a3)
  {
    v29 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSMutableDictionary allKeys](self->_backingDictionary, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v14);

          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v7, "addObject:", &unk_1E55656D8);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v10);
    }

    v15 = v32;
    v16 = v29;
    while (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectAtIndex:", 0);
      objc_msgSend(v6, "removeObjectAtIndex:", 0);
      objc_msgSend(v7, "removeObjectAtIndex:", 0);
      if (objc_msgSend(v19, "unsignedIntegerValue") >= v16)
      {
        objc_msgSend(v30, "addObject:", v18);
      }
      else
      {
        v31 = v18;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v17, "allKeys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v34 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
              objc_msgSend(v17, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v26);

              objc_msgSend(v6, "addObject:", v25);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "unsignedIntegerValue") + 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v27);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v22);
        }

        v16 = v29;
        v18 = v31;
        v15 = v32;
      }

    }
  }
  return v30;
}

- (void)removeAllScores
{
  NSArray *keyType;

  -[NSMutableDictionary removeAllObjects](self->_backingDictionary, "removeAllObjects");
  keyType = self->_keyType;
  self->_keyType = 0;

}

- (void)enumerateKeysAndScoresUsingBlock:(id)a3
{
  NSMutableDictionary *backingDictionary;
  void *v5;
  id v6;
  void *v7;
  char v8;

  if (self->_keyType)
  {
    v8 = 0;
    backingDictionary = self->_backingDictionary;
    v5 = (void *)MEMORY[0x1E0C99DE8];
    v6 = a3;
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSHistogram _enumerateWithBlock:node:currentKey:stop:](self, "_enumerateWithBlock:node:currentKey:stop:", v6, backingDictionary, v7, &v8);

  }
}

- (void)_enumerateWithBlock:(id)a3 node:(id)a4 currentKey:(id)a5 stop:(BOOL *)a6
{
  void (**v10)(id, id, void *, BOOL *);
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  void *v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, id, void *, BOOL *))a3;
  v11 = a4;
  v12 = a5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v11;
  objc_msgSend(v11, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v15)
        objc_enumerationMutation(obj);
      if (*a6)
        break;
      v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
      objc_msgSend(v12, "addObject:", v17);
      v18 = objc_msgSend(v12, "count");
      v19 = -[NSArray count](self->_keyType, "count");
      objc_msgSend(v22, "objectForKeyedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 == v19)
        v10[2](v10, v12, v20, a6);
      else
        -[BPSHistogram _enumerateWithBlock:node:currentKey:stop:](self, "_enumerateWithBlock:node:currentKey:stop:", v10, v20, v12, a6);

      objc_msgSend(v12, "removeLastObject");
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

- (void)scoreForKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_1A956A000, v0, v1, "Invalid key:%@, expected a key of type: %@");
  OUTLINED_FUNCTION_1_0();
}

@end

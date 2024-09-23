@implementation IMKeyValueCollection

- (id)objectForKey:(id)a3
{
  id v4;
  IMKeyValueCollection *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[IMKeyValueCollection keyValueStorage](v5, "keyValueStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  IMKeyValueCollection *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v10 = (unint64_t)a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[IMKeyValueCollection keyValueStorage](v7, "keyValueStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v10 | v9 && (!v10 && v9 || v10 && !v9 || v10 && v9 && (objc_msgSend((id)v10, "isEqual:", v9) & 1) == 0))
  {
    -[IMKeyValueCollection _setObject:forKey:](v7, "_setObject:forKey:", v10, v6);
    -[IMKeyValueCollection _recordChange:forKey:](v7, "_recordChange:forKey:", v10, v6);
    if (!v7->_batchCount)
      -[IMKeyValueCollection _broadcastIfNeeded](v7, "_broadcastIfNeeded");
  }

  objc_sync_exit(v7);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (id)objectForKey:(id)a3 withDefault:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[IMKeyValueCollection objectForKey:](self, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v6;
  v9 = v7;

  return v9;
}

- (IMKeyValueCollectionStorage)keyValueStorage
{
  return self->_keyValueStorage;
}

- (BOOL)BOOLForKey:(id)a3 withDefault:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection objectForKey:withDefault:](self, "objectForKey:withDefault:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "BOOLValue");
  return (char)v6;
}

- (void)_startBatchWrite
{
  IMKeyValueCollection *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_batchCount;
  objc_sync_exit(obj);

}

- (void)_commitBatchWrite
{
  uint64_t v2;
  IMKeyValueCollection *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj->_batchCount - 1;
  obj->_batchCount = v2;
  if (!v2)
    -[IMKeyValueCollection _broadcastIfNeeded](obj, "_broadcastIfNeeded");
  objc_sync_exit(obj);

}

- (void)_broadcastIfNeeded
{
  NSMutableDictionary *recordedChanges;
  void *v4;
  NSMutableDictionary *v5;

  if ((byte_1EE503828 & 1) == 0)
  {
    recordedChanges = self->_recordedChanges;
    if (recordedChanges)
    {
      if (-[NSMutableDictionary count](recordedChanges, "count"))
      {
        byte_1EE503828 = 1;
        v4 = (void *)MEMORY[0x1A1AE8394]();
        -[IMKeyValueCollection _notifyListeners](self, "_notifyListeners");
        objc_autoreleasePoolPop(v4);
        v5 = self->_recordedChanges;
        self->_recordedChanges = 0;

        byte_1EE503828 = 0;
      }
    }
  }
}

- (void)setError:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "serializedError_im");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", v7, v6);

}

- (id)errorForKey:(id)a3
{
  void *v3;
  void *v4;

  -[IMKeyValueCollection objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithSerializedError_im:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)addErrorToArray:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  IMKeyValueCollection *v29;
  void *v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[IMKeyValueCollection objectForKey:](self, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      goto LABEL_16;
    v29 = self;
    v30 = v8;
    v31 = v7;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      v14 = CFSTR("IMSerializedErrorDomainKey");
      do
      {
        v15 = 0;
        v32 = v12;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
          objc_msgSend(v6, "domain", v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
          {
            v19 = objc_msgSend(v6, "code");
            v20 = v6;
            v21 = v14;
            v22 = v19;
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("IMSerializedErrorCodeKey"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v10;
            v25 = objc_msgSend(v23, "integerValue");

            v26 = v22 == v25;
            v14 = v21;
            v6 = v20;
            v12 = v32;
            v10 = v24;
            if (v26)
            {
              v9 = v30;
              v7 = v31;
              goto LABEL_18;
            }
          }
          else
          {

          }
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    v27 = (void *)objc_msgSend(v10, "mutableCopy");
    v9 = v30;
    v7 = v31;
    self = v29;
    if (!v27)
    {
LABEL_16:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "serializedError_im", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

    v10 = v27;
    -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", v27, v7);
LABEL_18:

  }
}

- (id)errorArrayForKey:(id)a3
{
  void *v3;
  void *v4;

  -[IMKeyValueCollection objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorArrayFromSerializedErrorArray_im:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (IMKeyValueCollection)init
{
  -[IMKeyValueCollection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", 0);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMKeyValueCollection keyValueStorage](self, "keyValueStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithKeyValueStorage:", v6);

  return v7;
}

- (IMKeyValueCollection)initWithKeyValueStorage:(id)a3
{
  id v5;
  IMKeyValueCollection *v6;
  IMKeyValueCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMKeyValueCollection;
  v6 = -[IMKeyValueCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyValueStorage, a3);

  return v7;
}

- (void)_notifyListeners
{
  void *v3;
  void *v4;
  id v5;

  -[IMKeyValueCollection delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)-[NSMutableDictionary copy](self->_recordedChanges, "copy");
    objc_msgSend(v5, "keyValueCollection:willUpdateValues:", self, v3);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)-[NSMutableDictionary copy](self->_recordedChanges, "copy");
    objc_msgSend(v5, "keyValueCollection:didUpdateValues:", self, v4);

  }
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[IMKeyValueCollection keyValueStorage](self, "keyValueStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v6);
  }
  else
  {
    -[IMKeyValueCollection keyValueStorage](self, "keyValueStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v6);
  }

}

- (void)_recordChange:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *recordedChanges;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!self->_recordedChanges)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    recordedChanges = self->_recordedChanges;
    self->_recordedChanges = v7;

  }
  v9 = self->_recordedChanges;
  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v6);

  }
}

- (void)removeObjectForKey:(id)a3
{
  -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (BOOL)BOOLForKey:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_BOOLForKey_withDefault_);
}

- (int64_t)integerForKey:(id)a3 withDefault:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection objectForKey:withDefault:](self, "objectForKey:withDefault:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  return v10;
}

- (int64_t)integerForKey:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_integerForKey_withDefault_);
}

- (int64_t)int64ForKey:(id)a3 withDefault:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection objectForKey:withDefault:](self, "objectForKey:withDefault:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "longValue");
  return v10;
}

- (int64_t)int64ForKey:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_int64ForKey_withDefault_);
}

- (void)setInt64:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (unint64_t)uint64ForKey:(id)a3 withDefault:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection objectForKey:withDefault:](self, "objectForKey:withDefault:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedLongValue");
  return v10;
}

- (unint64_t)uint64ForKey:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_uint64ForKey_withDefault_);
}

- (void)setUint64:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (double)doubleForKey:(id)a3 withDefault:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection objectForKey:withDefault:](self, "objectForKey:withDefault:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return v11;
}

- (double)doubleForKey:(id)a3
{
  double result;

  MEMORY[0x1E0DE7D20](self, sel_doubleForKey_withDefault_);
  return result;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (id)stringForKey:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_stringForKey_withDefault_);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)IMKeyValueCollection;
  -[IMKeyValueCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollection keyValueStorage](self, "keyValueStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ storage:%@, recorded changes: %@, batch count: %zd]"), v4, v5, self->_recordedChanges, self->_batchCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (IMKeyValueCollectionDelegate)delegate
{
  return (IMKeyValueCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)recordedChanges
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedChanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyValueStorage, 0);
}

@end

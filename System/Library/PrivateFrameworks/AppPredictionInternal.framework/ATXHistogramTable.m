@implementation ATXHistogramTable

- (ATXHistogramTable)init
{
  return -[ATXHistogramTable initWithDict:usedIds:datastore:blobType:](self, "initWithDict:usedIds:datastore:blobType:", 0, 0, 0, 1);
}

- (ATXHistogramTable)initWithDatastore:(id)a3
{
  id v5;
  ATXHistogramTable *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHistogramData.mm"), 652, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("datastore"));

  }
  v6 = -[ATXHistogramTable initWithDict:usedIds:datastore:blobType:](self, "initWithDict:usedIds:datastore:blobType:", 0, 0, v5, 1);

  return v6;
}

- (ATXHistogramTable)initWithDatastore:(id)a3 blobType:(int64_t)a4
{
  id v7;
  ATXHistogramTable *v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHistogramData.mm"), 658, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("datastore"));

  }
  v8 = -[ATXHistogramTable initWithDict:usedIds:datastore:blobType:](self, "initWithDict:usedIds:datastore:blobType:", 0, 0, v7, a4);

  return v8;
}

- (ATXHistogramTable)initWithDict:(id)a3 usedIds:(id)a4 datastore:(id)a5 blobType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  ATXHistogramTable *v13;
  ATXHistogramTable *v14;
  NSMutableDictionary *dict;
  HTGuardedData *p_private_unsafeGuardedData;
  NSMutableIndexSet *usedIds;
  NSCopying *prevKey;
  uint64_t v19;
  char *value;
  void *v21;
  void *v22;
  id inited;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  ATXBackgroundSaver *v30;
  uint64_t v31;
  ATXBackgroundSaver *saver;
  char v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  ATXHistogramTable *v42;
  void *context;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id location;
  objc_super v50;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v50.receiver = self;
  v50.super_class = (Class)ATXHistogramTable;
  v13 = -[ATXHistogramTable init](&v50, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_23;
  p_private_unsafeGuardedData = &v13->_private_unsafeGuardedData;
  dict = v13->_private_unsafeGuardedData.dict;
  v13->_private_unsafeGuardedData.dict = 0;

  usedIds = v14->_private_unsafeGuardedData.usedIds;
  v14->_private_unsafeGuardedData.usedIds = 0;

  prevKey = v14->_private_unsafeGuardedData.prevKey;
  v14->_private_unsafeGuardedData.prevKey = 0;

  v14->_private_unsafeGuardedData.prevEventId = 0;
  v19 = operator new();
  *(_QWORD *)v19 = p_private_unsafeGuardedData;
  proactive::pas::detail::RecursiveMutex::RecursiveMutex((pthread_mutex_t *)(v19 + 8));
  location = 0;
  value = (char *)v14->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v21 = v10;
  if (!v10)
    v21 = (void *)objc_opt_new();
  objc_storeStrong(*(id **)value, v21);
  if (!v10)

  v22 = v11;
  if (!v11)
    v22 = (void *)objc_opt_new();
  objc_storeStrong((id *)(*(_QWORD *)value + 8), v22);
  if (!v11)

  v14->_blobType = a6;
  inited = objc_initWeak(&location, v14);
  if (v12 && v14->_blobType != 1)
  {
    context = (void *)MEMORY[0x1CAA48B6C](inited);
    objc_storeStrong((id *)&v14->_datastore, a5);
    -[_ATXDataStore blobOfType:](v14->_datastore, "blobOfType:", v14->_blobType);
    v24 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v24;
    if (v24)
    {
      v25 = (void *)MEMORY[0x1CAA48B6C]();
      v48 = 0;
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v24, &v48);
      v27 = v48;
      objc_msgSend(v26, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v25);
      if (!v28)
      {
        __atxlog_handle_default();
        v35 = objc_claimAutoreleasedReturnValue();
        v34 = v45;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[ATXHistogramTable initWithDict:usedIds:datastore:blobType:].cold.1((uint64_t)v27, v35, v36, v37, v38, v39, v40, v41);

        v33 = 0;
LABEL_21:

        objc_autoreleasePoolPop(context);
        if ((v33 & 1) == 0)
        {
          objc_destroyWeak(&location);
          pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
          v42 = 0;
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      v29 = v28[5];
      pthread_mutex_lock((pthread_mutex_t *)(v29 + 8));
      objc_storeStrong(*(id **)value, **(id **)v29);
      objc_storeStrong((id *)(*(_QWORD *)value + 8), *(id *)(*(_QWORD *)v29 + 8));
      pthread_mutex_unlock((pthread_mutex_t *)(v29 + 8));

    }
    if (-[ATXHistogramTable initWithDict:usedIds:datastore:blobType:]::_pasOnceToken385 != -1)
      dispatch_once(&-[ATXHistogramTable initWithDict:usedIds:datastore:blobType:]::_pasOnceToken385, &__block_literal_global_125);
    v27 = (id)-[ATXHistogramTable initWithDict:usedIds:datastore:blobType:]::_pasExprOnceResult;
    v30 = [ATXBackgroundSaver alloc];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __61__ATXHistogramTable_initWithDict_usedIds_datastore_blobType___block_invoke_2;
    v46[3] = &unk_1E82E4DD0;
    objc_copyWeak(&v47, &location);
    v31 = -[ATXBackgroundSaver initWithQueue:block:](v30, "initWithQueue:block:", v27, v46);
    saver = v14->_saver;
    v14->_saver = (ATXBackgroundSaver *)v31;

    objc_destroyWeak(&v47);
    v33 = 1;
    v34 = v45;
    goto LABEL_21;
  }
LABEL_22:
  objc_destroyWeak(&location);
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
LABEL_23:
  v42 = v14;
LABEL_24:

  return v42;
}

void __61__ATXHistogramTable_initWithDict_usedIds_datastore_blobType___block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = dispatch_queue_create("ATXHistogramTable-backgroundSaver", v2);
  v4 = (void *)-[ATXHistogramTable initWithDict:usedIds:datastore:blobType:]::_pasExprOnceResult;
  -[ATXHistogramTable initWithDict:usedIds:datastore:blobType:]::_pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

void __61__ATXHistogramTable_initWithDict_usedIds_datastore_blobType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "flush");

}

- (unsigned)intern:(id)a3
{
  id v5;
  char *value;
  int v7;
  uint64_t v8;
  unsigned __int16 v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  __int16 v20;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v7 = objc_msgSend(*(id *)(*(_QWORD *)value + 16), "isEqual:", v5);
  v8 = *(_QWORD *)value;
  if (v7)
  {
    v9 = *(_WORD *)(v8 + 24);
    *((_WORD *)v18 + 12) = v9;
  }
  else
  {
    objc_msgSend(*(id *)v8, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "unsignedShortValue");
      *((_WORD *)v18 + 12) = v12;
    }
    else
    {
      v13 = *(void **)(*(_QWORD *)value + 8);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __28__ATXHistogramTable_intern___block_invoke;
      v16[3] = &unk_1E82E4DF8;
      v16[4] = &v17;
      objc_msgSend(v13, "enumerateRangesUsingBlock:", v16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *((unsigned __int16 *)v18 + 12));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(**(id **)value, "setObject:forKeyedSubscript:", v14, v5);

      objc_msgSend(*(id *)(*(_QWORD *)value + 8), "addIndex:", *((unsigned __int16 *)v18 + 12));
      -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
    }
    objc_storeStrong((id *)(*(_QWORD *)value + 16), a3);
    *(_WORD *)(*(_QWORD *)value + 24) = *((_WORD *)v18 + 12);

    v9 = *((_WORD *)v18 + 12);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __28__ATXHistogramTable_intern___block_invoke(uint64_t result, __int16 a2, __int16 a3, _BYTE *a4)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 + a3;
  *a4 = 1;
  return result;
}

- (BOOL)lookup:(id)a3 into:(unsigned __int16 *)a4
{
  id v7;
  char *value;
  BOOL v9;
  void *v10;
  void *v11;
  unsigned __int16 v12;
  unsigned __int16 v13;

  v7 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if (objc_msgSend(*(id *)(*(_QWORD *)value + 16), "isEqual:", v7))
  {
    if (a4)
      *a4 = *(_WORD *)(*(_QWORD *)value + 24);
    v9 = 1;
  }
  else
  {
    objc_msgSend(**(id **)value, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v9 = v10 != 0;
    if (v10)
    {
      v12 = objc_msgSend(v10, "unsignedShortValue");
      v13 = v12;
      if (a4)
        *a4 = v12;
      objc_storeStrong((id *)(*(_QWORD *)value + 16), a3);
      *(_WORD *)(*(_QWORD *)value + 24) = v13;
    }

  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (id)allKeysFilteredBy:(id)a3
{
  unsigned int (**v5)(id, _QWORD);
  void *v6;
  char *value;
  pthread_mutex_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (unsigned int (**)(id, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHistogramData.mm"), 764, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filter"));

  }
  v6 = (void *)objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  v8 = (pthread_mutex_t *)(value + 8);
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = **(id **)value;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v5[2](v5, v13))
          objc_msgSend(v6, "addObject:", v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = v6;
  pthread_mutex_unlock(v8);

  return v14;
}

- (id)allKeys
{
  char *value;
  pthread_mutex_t *v3;
  void *v4;

  value = (char *)self->_guardedData.__ptr_.__value_;
  v3 = (pthread_mutex_t *)(value + 8);
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  objc_msgSend(**(id **)value, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(v3);
  return v4;
}

- (unsigned)remove:(id)a3
{
  id v4;
  char *value;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  objc_msgSend(**(id **)value, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(**(id **)value, "removeObjectForKey:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)value + 8), "removeIndex:", objc_msgSend(v6, "unsignedIntegerValue"));
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)value + 16), "isEqual:", v4))
  {
    v7 = *(void **)(*(_QWORD *)value + 16);
    *(_QWORD *)(*(_QWORD *)value + 16) = 0;

    *(_WORD *)(*(_QWORD *)value + 24) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  if (v6)
  {
    -[ATXBackgroundSaver scheduleSaveImmediately](self->_saver, "scheduleSaveImmediately");
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (void)clear
{
  char *value;
  void *v4;

  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  objc_msgSend(**(id **)value, "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)value + 8), "removeAllIndexes");
  -[ATXBackgroundSaver scheduleSaveImmediately](self->_saver, "scheduleSaveImmediately");
  v4 = *(void **)(*(_QWORD *)value + 16);
  *(_QWORD *)(*(_QWORD *)value + 16) = 0;

  *(_WORD *)(*(_QWORD *)value + 24) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHistogramTable)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ATXHistogramTable *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("dict"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usedIds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXHistogramTable initWithDict:usedIds:datastore:blobType:](self, "initWithDict:usedIds:datastore:blobType:", v9, v10, 0, 1);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  char *value;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v5 = (void *)objc_msgSend(**(id **)value, "mutableCopy");
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("dict"));

  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)value + 8), "mutableCopy");
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("usedIds"));

  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

- (void)flush
{
  void *v3;
  void *v4;
  _ATXDataStore *datastore;
  void *v6;

  if (self->_datastore)
  {
    v3 = (void *)MEMORY[0x1CAA48B6C]();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v4, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
    datastore = self->_datastore;
    objc_msgSend(v4, "encodedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXDataStore writeBlob:type:expirationDate:](datastore, "writeBlob:type:expirationDate:", v6, self->_blobType, 0);

    objc_autoreleasePoolPop(v3);
  }
}

- (id)histogramTableDict
{
  char *value;
  pthread_mutex_t *v3;
  void *v4;

  value = (char *)self->_guardedData.__ptr_.__value_;
  v3 = (pthread_mutex_t *)(value + 8);
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v4 = (void *)objc_msgSend(**(id **)value, "copy");
  pthread_mutex_unlock(v3);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saver, 0);
  objc_storeStrong((id *)&self->_datastore, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (void)initWithDict:(uint64_t)a3 usedIds:(uint64_t)a4 datastore:(uint64_t)a5 blobType:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not load eventId table: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

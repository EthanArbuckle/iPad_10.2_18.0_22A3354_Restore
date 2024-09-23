@implementation SGQuickResponsesRepliesFlattened

- (id)normalizedReplyTextsSet
{
  _PASLock *normalizedReplyTextsSet;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  normalizedReplyTextsSet = self->_normalizedReplyTextsSet;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__SGQuickResponsesRepliesFlattened_normalizedReplyTextsSet__block_invoke;
  v5[3] = &unk_24DDC3D08;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](normalizedReplyTextsSet, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;

  -[NSArray objectAtIndexedSubscript:](self->_replyTexts, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("position == 0"));

    }
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 535, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[obj isKindOfClass:NSArray.class]"));

    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)replyTextForIndexAndPosition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  objc_msgSend(v4, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGQuickResponsesRepliesFlattened replyTextForIndex:position:](self, "replyTextForIndex:position:", v6, objc_msgSend(v7, "unsignedIntegerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)replyTextsForIndex:(unint64_t)a3
{
  void *v3;
  id v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_replyTexts, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v3, 0);
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (unint64_t)replyCountForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v8;

  -[NSArray objectAtIndexedSubscript:](self->_replyTexts, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 562, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[obj isKindOfClass:NSArray.class]"));

    }
    v6 = objc_msgSend(v5, "count");
  }

  return v6;
}

- (unint64_t)replyTextCount
{
  return self->_replyTextStringsCount;
}

- (unint64_t)replyClassCount
{
  return -[NSArray count](self->_replyTexts, "count");
}

- (unint64_t)modelCount
{
  return -[NSArray count](self->_replyTexts, "count");
}

- (unint64_t)maxDistinctReplies
{
  return self->_replyTextStringsCount;
}

- (SGQuickResponsesRepliesFlattened)initWithArray:(id)a3
{
  id v5;
  void *v6;
  SGQuickResponsesRepliesFlattened *v7;
  SGQuickResponsesRepliesFlattened *v8;
  id v9;
  SGLazyInit *v10;
  SGLazyInit *v11;
  uint64_t v12;
  _PASLock *normalizedReplyTextsSet;
  SGQuickResponsesRepliesFlattened *v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {

    v18.receiver = self;
    v18.super_class = (Class)SGQuickResponsesRepliesFlattened;
    v7 = -[SGQuickResponsesRepliesFlattened init](&v18, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_replyTexts, a3);
      v8->_replyTextStringsCount = +[SGQuickResponsesRepliesFlattened countReplyTextsForArray:](SGQuickResponsesRepliesFlattened, "countReplyTextsForArray:", v6);
      v9 = objc_alloc(MEMORY[0x24BE7A610]);
      v10 = [SGLazyInit alloc];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __50__SGQuickResponsesRepliesFlattened_initWithArray___block_invoke;
      v16[3] = &unk_24DDC3F78;
      v17 = v6;
      v11 = -[SGLazyInit initWithInitializer:destructor:](v10, "initWithInitializer:destructor:", v16, 0);
      v12 = objc_msgSend(v9, "initWithGuardedData:", v11);
      normalizedReplyTextsSet = v8->_normalizedReplyTextsSet;
      v8->_normalizedReplyTextsSet = (_PASLock *)v12;

    }
    self = v8;
    v14 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "array", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedReplyTextsSet, 0);
  objc_storeStrong((id *)&self->_replyTexts, 0);
}

id __50__SGQuickResponsesRepliesFlattened_initWithArray___block_invoke(uint64_t a1)
{
  return +[SGQuickResponsesRepliesFlattened normalizedReplyTextsSetForArray:](SGQuickResponsesRepliesFlattened, "normalizedReplyTextsSetForArray:", *(_QWORD *)(a1 + 32));
}

void __59__SGQuickResponsesRepliesFlattened_normalizedReplyTextsSet__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (unint64_t)countReplyTextsForArray:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const char *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          ++v8;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v15 = a1;
            v12 = a2;
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v12, v15, CFSTR("SGQuickResponsesConfig.m"), 595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[obj isKindOfClass:NSArray.class]"));

            a2 = v12;
            a1 = v15;
          }
          v8 += objc_msgSend(v11, "count");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)normalizedReplyTextsSetForArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0x24BDD1000uLL;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SGQuickResponsesReplies normalizeReplyTextInternal:](SGQuickResponsesReplies, "normalizeReplyTextInternal:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGQuickResponsesConfig.m"), 611, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[obj isKindOfClass:NSArray.class]"));

          }
          v11 = v10;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = v12;
            v14 = v8;
            v15 = v7;
            v16 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v11);
                +[SGQuickResponsesReplies normalizeReplyTextInternal:](SGQuickResponsesReplies, "normalizeReplyTextInternal:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v18);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
            v7 = v15;
            v8 = v14;
            v6 = v24;
          }
        }

        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v4);
  return v20;
}

@end

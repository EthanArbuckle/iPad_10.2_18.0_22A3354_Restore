@implementation SGConversationTracker

- (SGConversationTracker)init
{
  SGConversationTracker *v2;
  uint64_t v3;
  _PASLRUCache *conversations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGConversationTracker;
  v2 = -[SGConversationTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A5F0]), "initWithCountLimit:", 5);
    conversations = v2->_conversations;
    v2->_conversations = (_PASLRUCache *)v3;

  }
  return v2;
}

- (id)conversationForSenderID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (v4)
  {
    -[_PASLRUCache objectForKey:](self->_conversations, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x3032000000;
      v13 = __Block_byref_object_copy__1060;
      v14 = __Block_byref_object_dispose__1061;
      v15 = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __49__SGConversationTracker_conversationForSenderID___block_invoke;
      v9[3] = &unk_24DDC5138;
      v9[4] = &v10;
      objc_msgSend(v5, "runWithLockAcquired:", v9);
      v7 = (id)v11[5];
      _Block_object_dispose(&v10, 8);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)addMessage:(id)a3
{
  id v4;
  void *v5;
  _PASLRUCache *conversations;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _PASLRUCache *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "senderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    conversations = self->_conversations;
    objc_msgSend(v4, "senderID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASLRUCache objectForKey:](conversations, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__1060;
      v21 = __Block_byref_object_dispose__1061;
      v22 = 0;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __36__SGConversationTracker_addMessage___block_invoke;
      v14[3] = &unk_24DDC5188;
      v15 = v4;
      v16 = &v17;
      objc_msgSend(v8, "runWithLockAcquired:", v14);
      v9 = (id)v18[5];

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v4, 0);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A610]), "initWithGuardedData:", v10);
      v11 = self->_conversations;
      objc_msgSend(v4, "senderID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PASLRUCache setObject:forKey:](v11, "setObject:forKey:", v8, v12);

      v9 = (id)objc_msgSend(v10, "copy");
    }

  }
  else
  {
    v23[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)clear
{
  -[_PASLRUCache removeAllObjects](self->_conversations, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversations, 0);
}

void __36__SGConversationTracker_addMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __36__SGConversationTracker_addMessage___block_invoke_2;
  v13[3] = &unk_24DDC5160;
  v14 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "indexOfObjectWithOptions:passingTest:", 2, v13);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
    if ((unint64_t)objc_msgSend(v3, "count") >= 6)
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
    v5 = objc_msgSend(v3, "count");
  }
  else
  {
    v6 = v4;
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "senderID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_debug_impl(&dword_21ABF4000, v7, OS_LOG_TYPE_DEBUG, "Added message id already in conversation. conversation id = %@", buf, 0xCu);

    }
    v5 = v6 + 1;
  }
  objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __36__SGConversationTracker_addMessage___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToConversationTurn:", *(_QWORD *)(a1 + 32));
}

void __49__SGConversationTracker_conversationForSenderID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)instance
{
  if (instance__pasOnceToken2 != -1)
    dispatch_once(&instance__pasOnceToken2, &__block_literal_global_1078);
  return (id)instance__pasExprOnceResult;
}

+ (id)sgConversationTurnsForStrings:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v8 = 0;
    v9 = v6 + -0.1;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v9 + (double)v8 * 0.0001);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x24BE285E0]);
      objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithText:senderID:timestamp:", v12, CFSTR("sender"), v10);

      objc_msgSend(v7, "addObject:", v13);
      ++v8;
    }
    while (v8 < objc_msgSend(v3, "count"));
  }

  return v7;
}

+ (id)getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4 maxPromptLength:(unint64_t)a5 maxPromptWindowSeconds:(double)a6 promptJoiningString:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  unint64_t v39;
  void *v40;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a7;
  if ((unint64_t)objc_msgSend(v12, "count") > 1)
  {
    v15 = (void *)MEMORY[0x220753E80]();
    objc_msgSend(v12, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _PASRepairString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "isEqualToString:", v19);

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v17, "timestamp");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v17;
      objc_msgSend(v17, "senderID");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v13, "length");
      v23 = objc_msgSend(v16, "count");
      v38 = v11;
      if ((uint64_t)(v23 - 1) < 0)
      {
        v27 = (void *)v21;
        v17 = v37;
      }
      else
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v23 - 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v39 = a5;
          v25 = -v22;
          while (1)
          {
            objc_msgSend(v24, "senderID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)v21;
            v28 = objc_msgSend(v26, "isEqualToString:", v21);

            if (!v28)
              goto LABEL_16;
            objc_msgSend(v24, "timestamp");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "timeIntervalSinceDate:", v29);
            v31 = v30;

            if (v31 > a6
              || (objc_msgSend(v24, "text"),
                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                  v25 += v22 + objc_msgSend(v32, "length"),
                  v32,
                  v25 > v39))
            {
LABEL_16:
              v17 = v37;
              a5 = v39;
              goto LABEL_18;
            }

            if ((uint64_t)(v23 - 1) <= 0)
              break;
            objc_msgSend(v16, "objectAtIndexedSubscript:", v23 - 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            --v23;
            v21 = (uint64_t)v27;
          }
          v23 = 0;
          v17 = v37;
          a5 = v39;
        }
        else
        {
          v27 = 0;
          v17 = v37;
LABEL_18:

        }
      }
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", a5);
      while (v23 < objc_msgSend(v16, "count") - 1)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v23);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "text");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "appendString:", v35);

        objc_msgSend(v33, "appendString:", v13);
        ++v23;
      }
      objc_msgSend(v33, "appendString:", v38);
      _PASRepairString();
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v38;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Most recent message in conversation turns does not match specified current message.", buf, 2u);
      }
      v14 = v11;
    }

  }
  else
  {
    v14 = v11;
  }

  return v14;
}

uint64_t __128__SGConversationTracker_getMergedPromptForMessage_conversationTurns_maxPromptLength_maxPromptWindowSeconds_promptJoiningString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __33__SGConversationTracker_instance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_opt_new();
  v2 = (void *)instance__pasExprOnceResult;
  instance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end

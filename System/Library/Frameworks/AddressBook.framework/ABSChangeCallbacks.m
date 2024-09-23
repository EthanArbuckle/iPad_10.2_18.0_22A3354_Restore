@implementation ABSChangeCallbacks

- (ABSChangeCallbacks)initWithAddressBook:(id)a3
{
  id v4;
  ABSChangeCallbacks *v5;
  ABSChangeCallbacks *v6;
  uint64_t v7;
  NSMutableArray *externalCallbacks;
  uint64_t v9;
  NSMutableArray *externalCallBackThreads;
  uint64_t v11;
  NSMutableArray *externalCallbackContexts;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ABSChangeCallbacks;
  v5 = -[ABSChangeCallbacks init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_addressBook, v4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    externalCallbacks = v6->_externalCallbacks;
    v6->_externalCallbacks = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    externalCallBackThreads = v6->_externalCallBackThreads;
    v6->_externalCallBackThreads = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    externalCallbackContexts = v6->_externalCallbackContexts;
    v6->_externalCallbackContexts = (NSMutableArray *)v11;

    v6->_initialAccessStatus = +[ABSAddressBook authorizationStatus](ABSAddressBook, "authorizationStatus");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_contactStoreChanged_, *MEMORY[0x24BDBA3D0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel_contactStoreChanged_, CFSTR("ABSInvokeAllLocalCallbacksNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *externalCallbacks;
  NSMutableArray *externalCallBackThreads;
  NSMutableArray *externalCallbackContexts;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_storeWeak((id *)&self->_addressBook, 0);
  externalCallbacks = self->_externalCallbacks;
  self->_externalCallbacks = 0;

  externalCallBackThreads = self->_externalCallBackThreads;
  self->_externalCallBackThreads = 0;

  externalCallbackContexts = self->_externalCallbackContexts;
  self->_externalCallbackContexts = 0;

  v7.receiver = self;
  v7.super_class = (Class)ABSChangeCallbacks;
  -[ABSChangeCallbacks dealloc](&v7, sel_dealloc);
}

- (void)contactStoreChanged:(id)a3
{
  ABSChangeCallbacks *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[NSMutableArray count](v4->_externalCallbacks, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v4->_addressBook);

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)&v4->_addressBook);
      v7 = (void *)-[NSMutableArray copy](v4->_externalCallbacks, "copy");
      v8 = (void *)-[NSMutableArray copy](v4->_externalCallBackThreads, "copy");
      v9 = (void *)-[NSMutableArray copy](v4->_externalCallbackContexts, "copy");
      for (i = 0; ; ++i)
      {
        if (i >= objc_msgSend(v7, "count"))
        {
          CFRelease(v6);

          goto LABEL_12;
        }
        objc_msgSend(v7, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedLongValue");

        objc_msgSend(v9, "objectAtIndexedSubscript:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend(v9, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedLongValue");

        if (v12)
          goto LABEL_9;
LABEL_10:
        ;
      }
      v16 = 0;
      if (!v12)
        goto LABEL_10;
LABEL_9:
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[ABSCallbackInvoker invokeOnThread:callback:withAddressBook:context:](ABSCallbackInvoker, "invokeOnThread:callback:withAddressBook:context:", v17, v12, v6, v16);

      goto LABEL_10;
    }
  }
LABEL_12:
  objc_sync_exit(v4);

}

- (void)addExternalCallback:(void *)a3 onThread:(id)a4 withContext:(void *)a5
{
  void *v8;
  int v9;
  ABSChangeCallbacks *v10;
  NSMutableArray *externalCallbacks;
  void *v12;
  NSMutableArray *externalCallBackThreads;
  void *v14;
  NSMutableArray *externalCallbackContexts;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  if (CNLinkedOnOrAfter()
    || self->_initialAccessStatus
    || +[ABSAddressBook authorizationStatus](ABSAddressBook, "authorizationStatus") != 3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = !-[ABSChangeCallbacks hasExternalCallback:onThread:withContext:](self, "hasExternalCallback:onThread:withContext:", a3, v8, a5);

  }
  v10 = self;
  objc_sync_enter(v10);
  if (a3)
  {
    externalCallbacks = v10->_externalCallbacks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](externalCallbacks, "addObject:", v12);

    externalCallBackThreads = v10->_externalCallBackThreads;
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](externalCallBackThreads, "addObject:", v14);

    externalCallbackContexts = v10->_externalCallbackContexts;
    if (a5)
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a5);
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](externalCallbackContexts, "addObject:", v16);

  }
  objc_sync_exit(v10);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("ABSInvokeAllLocalCallbacksNotification"), v10);

  }
}

- (BOOL)hasExternalCallback:(void *)a3 onThread:(id)a4 withContext:(void *)a5
{
  id v8;
  ABSChangeCallbacks *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  char v13;
  unint64_t i;
  void *v16;
  void *v17;
  id v18;

  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (a3 && -[NSMutableArray count](v9->_externalCallbacks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a5);
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    for (i = 0; ; ++i)
    {
      v11 = v13 & 1;
      if (i >= -[NSMutableArray count](v9->_externalCallbacks, "count") || v11)
        break;
      -[NSMutableArray objectAtIndexedSubscript:](v9->_externalCallbacks, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v10)
      {
        -[NSMutableArray objectAtIndexedSubscript:](v9->_externalCallbackContexts, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v12)
        {
          -[NSMutableArray objectAtIndexedSubscript:](v9->_externalCallBackThreads, "objectAtIndexedSubscript:", i);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18 == v8)
            v13 = 1;
        }
        else
        {

        }
      }
      else
      {

      }
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }
  objc_sync_exit(v9);

  return v11;
}

- (void)removeExternalCallback:(void *)a3 withContext:(void *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ABSChangeCallbacks *obj;

  obj = self;
  objc_sync_enter(obj);
  if (a3 && -[NSMutableArray count](obj->_externalCallbacks, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSMutableArray count](obj->_externalCallbacks, "count") - 1;
    if (v8 >= 0)
    {
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](obj->_externalCallbacks, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v6)
        {
          -[NSMutableArray objectAtIndexedSubscript:](obj->_externalCallbackContexts, "objectAtIndexedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 == v7)
          {
            -[NSMutableArray removeObjectAtIndex:](obj->_externalCallbacks, "removeObjectAtIndex:", v8);
            -[NSMutableArray removeObjectAtIndex:](obj->_externalCallBackThreads, "removeObjectAtIndex:", v8);
            -[NSMutableArray removeObjectAtIndex:](obj->_externalCallbackContexts, "removeObjectAtIndex:", v8);
            break;
          }
        }
        else
        {

        }
        --v8;
      }
      while (v8 != -1);
    }

  }
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalCallbackContexts, 0);
  objc_storeStrong((id *)&self->_externalCallBackThreads, 0);
  objc_storeStrong((id *)&self->_externalCallbacks, 0);
  objc_destroyWeak((id *)&self->_addressBook);
}

@end

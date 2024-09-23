@implementation MobileSyncAccountNotificationObserver

- (MobileSyncAccountNotificationObserver)init
{
  MobileSyncAccountNotificationObserver *v2;
  objc_class *v3;
  const char *Name;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MobileSyncAccountNotificationObserver;
  v2 = -[MobileSyncAccountNotificationObserver init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(Name, v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  char v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *serialQueue;
  id v38;
  id v39;
  char v40;
  uint64_t v41;
  id v42;
  char v43;
  uint64_t v44;
  _QWORD block[4];
  id v47;
  id v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;

  v8 = a3;
  v9 = a6;
  v10 = v9;
  if (v8)
    v11 = v8;
  else
    v11 = v9;
  v12 = v11;
  objc_msgSend(v12, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "supportedDataclasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x24BDB4580];
  if ((objc_msgSend(v14, "containsObject:") & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v42 = v8;
    v16 = a4;
    v17 = v10;
    objc_msgSend(v12, "accountType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "supportedDataclasses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "containsObject:", *MEMORY[0x24BDB4598]) & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v12, "accountType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "supportedDataclasses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v21, "containsObject:", *MEMORY[0x24BDB4560]);

    }
    v10 = v17;
    a4 = v16;
    v8 = v42;
  }

  if (qword_25414C098 != -1)
    dispatch_once(&qword_25414C098, &unk_24FFB8B10);
  objc_msgSend(v12, "accountType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "parentAccount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v12, "parentAccount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accountType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v27 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v27;
  }
  if ((v15 & objc_msgSend((id)qword_25414C090, "containsObject:", v23)) == 1)
  {
    objc_msgSend(v12, "parentAccount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      if ((a4 - 1) > 1)
      {
        v43 = 0;
        v41 = 0;
        v40 = 0;
      }
      else
      {
        v43 = objc_msgSend(v8, "isEnabledForDataclass:", v44);
        BYTE4(v41) = objc_msgSend(v8, "isEnabledForDataclass:", *MEMORY[0x24BDB4560]);
        LOBYTE(v41) = objc_msgSend(v8, "isEnabledForDataclass:", *MEMORY[0x24BDB4598]);
        v40 = objc_msgSend(v8, "isEnabledForDataclass:", *MEMORY[0x24BDB4608]);
      }
      if (a4 == 3)
      {
        v32 = v10;
        v29 = 1;
        v30 = 1;
        v31 = 1;
        v33 = 1;
      }
      else if (a4 == 2)
      {
        v29 = objc_msgSend(v10, "isEnabledForDataclass:", v44);
        v30 = objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x24BDB4560]);
        v31 = objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x24BDB4598]);
        v32 = v10;
        v33 = objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x24BDB4608]);
      }
      else
      {
        v32 = v10;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v33 = 0;
      }
      objc_msgSend(v12, "accountType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "accountTypeDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "accountDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_230F3B5F8;
      block[3] = &unk_24FFB8B38;
      v49 = v43;
      v50 = v29;
      v47 = v35;
      v48 = v36;
      v51 = BYTE4(v41);
      v52 = v30;
      v53 = v41;
      v54 = v31;
      v55 = v40;
      v56 = v33;
      v38 = v36;
      v39 = v35;
      dispatch_async(serialQueue, block);

      v10 = v32;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end

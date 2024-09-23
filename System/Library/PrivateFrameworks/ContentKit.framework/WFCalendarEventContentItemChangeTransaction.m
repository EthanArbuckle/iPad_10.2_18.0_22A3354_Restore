@implementation WFCalendarEventContentItemChangeTransaction

- (WFCalendarEventContentItemChangeTransaction)initWithContentItem:(id)a3 eventStore:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFCalendarEventContentItemChangeTransaction *v10;
  uint64_t v11;
  EKEvent *mutableEvent;
  WFCalendarEventContentItemChangeTransaction *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCalendarEventContentItemChangeTransaction.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItem"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCalendarEventContentItemChangeTransaction.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventStore"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCalendarEventContentItemChangeTransaction;
  v10 = -[WFContentItemChangeTransaction initWithContentItem:](&v17, sel_initWithContentItem_, v7);
  if (v10)
  {
    objc_msgSend(v7, "event");
    v11 = objc_claimAutoreleasedReturnValue();
    mutableEvent = v10->_mutableEvent;
    v10->_mutableEvent = (EKEvent *)v11;

    objc_storeStrong((id *)&v10->_eventStore, a4);
    v13 = v10;
  }

  return v10;
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *, _QWORD))a3;
  -[WFCalendarEventContentItemChangeTransaction eventStore](self, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCalendarEventContentItemChangeTransaction mutableEvent](self, "mutableEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v6, "saveEvent:span:error:", v7, 0, &v14);
  v9 = v14;

  if ((v8 & 1) != 0)
  {
    -[WFCalendarEventContentItemChangeTransaction mutableEvent](self, "mutableEvent");
    v10 = objc_claimAutoreleasedReturnValue();
    -[WFCalendarEventContentItemChangeTransaction eventStore](self, "eventStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCalendarEventContentItem itemWithEKEvent:fromEventStore:](WFCalendarEventContentItem, "itemWithEKEvent:fromEventStore:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v12, 0);

    v5 = (void (**)(id, void *, _QWORD))v10;
  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFCalendarEventContentItemChangeTransaction saveWithCompletionHandler:isNew:]";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Failed to save calendar event: %@", buf, 0x16u);
    }

    ((void (**)(id, void *, id))v5)[2](v5, 0, v9);
  }

}

- (void)updateAttachments:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Append"));

  if ((v5 & 1) != 0
    || (-[WFContentItemChangeTransaction mode](self, "mode"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RemoveAll")),
        v6,
        -[WFCalendarEventContentItemChangeTransaction removeAllAttachments](self, "removeAllAttachments"),
        (v7 & 1) == 0))
  {
    -[WFCalendarEventContentItemChangeTransaction addAttachments:](self, "addAttachments:", v8);
  }

}

- (void)addAttachments:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        -[WFCalendarEventContentItemChangeTransaction mutableEvent](self, "mutableEvent", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v21 = &v20;
        v22 = 0x2050000000;
        v10 = (void *)getEKAttachmentClass_softClass;
        v23 = getEKAttachmentClass_softClass;
        if (!getEKAttachmentClass_softClass)
        {
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __getEKAttachmentClass_block_invoke;
          v19[3] = &unk_24C4E3118;
          v19[4] = &v20;
          __getEKAttachmentClass_block_invoke((uint64_t)v19);
          v10 = (void *)v21[3];
        }
        v11 = objc_retainAutorelease(v10);
        _Block_object_dispose(&v20, 8);
        v12 = [v11 alloc];
        objc_msgSend(v8, "fileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithFilepath:", v13);
        objc_msgSend(v9, "addAttachment:", v14);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v5);
  }

}

- (void)removeAllAttachments
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WFCalendarEventContentItemChangeTransaction mutableEvent](self, "mutableEvent", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[WFCalendarEventContentItemChangeTransaction mutableEvent](self, "mutableEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAttachment:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (EKEvent)mutableEvent
{
  return self->_mutableEvent;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_mutableEvent, 0);
}

@end

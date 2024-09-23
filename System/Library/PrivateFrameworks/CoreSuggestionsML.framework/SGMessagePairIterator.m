@implementation SGMessagePairIterator

- (id)handleFromConversationId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x220753E80]();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(";"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 3)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(v3, "copy");
  }
  v7 = (void *)v6;

  objc_autoreleasePoolPop(v4);
  return v7;
}

- (SGMessagePairIterator)initWithStartDate:(id)a3 maxBatchSize:(unint64_t)a4 maxReplyLength:(unint64_t)a5 maxReplyGap:(double)a6
{
  id v10;
  SGMessagePairIterator *v11;
  SGMessagePairIterator *v12;
  uint64_t v13;
  NSMutableDictionary *latestPromptForHandle;
  NSDate *latestProcessedDate;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  NSArray *messageEvents;
  NSArray *v43;
  SGMessagePairIterator *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  objc_super v53;
  void *v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  __int128 buf;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v53.receiver = self;
  v53.super_class = (Class)SGMessagePairIterator;
  v11 = -[SGMessagePairIterator init](&v53, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_17;
  v11->_done = 0;
  v11->_maxReplyLength = a5;
  v11->_maxReplyGap = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = objc_claimAutoreleasedReturnValue();
  latestPromptForHandle = v12->_latestPromptForHandle;
  v12->_latestPromptForHandle = (NSMutableDictionary *)v13;

  latestProcessedDate = v12->_latestProcessedDate;
  v12->_latestProcessedDate = 0;

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v59 = 0x2020000000;
  v16 = (id *)getIMAttachmentCharacterStringSymbolLoc_ptr;
  v60 = getIMAttachmentCharacterStringSymbolLoc_ptr;
  if (!getIMAttachmentCharacterStringSymbolLoc_ptr)
  {
    v17 = IMFoundationLibrary();
    v16 = (id *)dlsym(v17, "IMAttachmentCharacterString");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v16;
    getIMAttachmentCharacterStringSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&buf, 8);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMAttachmentCharacterString(void)");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("SGMessagePairIterator.m"), 26, CFSTR("%s"), dlerror());

    goto LABEL_21;
  }
  objc_storeStrong((id *)&v12->_attachmentCharacterString, *v16);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v59 = 0x2020000000;
  v18 = (id *)getIMBreadcrumbCharacterStringSymbolLoc_ptr;
  v60 = getIMBreadcrumbCharacterStringSymbolLoc_ptr;
  if (!getIMBreadcrumbCharacterStringSymbolLoc_ptr)
  {
    v19 = IMFoundationLibrary();
    v18 = (id *)dlsym(v19, "IMBreadcrumbCharacterString");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v18;
    getIMBreadcrumbCharacterStringSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&buf, 8);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getIMBreadcrumbCharacterString(void)");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("SGMessagePairIterator.m"), 27, CFSTR("%s"), dlerror());

LABEL_21:
    __break(1u);
  }
  objc_storeStrong((id *)&v12->_breadcrumbCharacterString, *v18);
  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(MEMORY[0x24BE1B0A0], "intentClass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateForObjectsWithMetadataKey:inValues:", v21, &unk_24DDCF860);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v23 = (void *)MEMORY[0x24BDD14C0];
    v57[0] = v22;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("startDate > %@"), v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v26;
  }
  v27 = (void *)MEMORY[0x24BDD14C0];
  v56[0] = v22;
  v28 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(MEMORY[0x24BE1B100], "intentsSourceID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "predicateForEventsWithSourceID:bundleID:", v29, CFSTR("com.apple.MobileSMS"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "andPredicateWithSubpredicates:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BE1B088];
  objc_msgSend(MEMORY[0x24BE1B130], "appIntentsStream");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v32, v35, 0, a4, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B088], "allDevices");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDeviceIDs:", v39);

  v52 = 0;
  objc_msgSend(v51, "executeQuery:error:", v38, &v52);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v52;
  messageEvents = v12->_messageEvents;
  v12->_messageEvents = (NSArray *)v40;

  if (v41 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v41, "description");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v46;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to retrieve message events from CoreDuet. Error: %@", (uint8_t *)&buf, 0xCu);

  }
  v43 = v12->_messageEvents;
  if (v43 && -[NSArray count](v43, "count") >= 2)
  {
    v12->_messageEventCount = -[NSArray count](v12->_messageEvents, "count");
    v12->_messageEventIndex = 0;

LABEL_17:
    v44 = v12;
    goto LABEL_18;
  }

  v44 = 0;
LABEL_18:

  return v44;
}

- (id)removeBreadcrumbsFromMessage:(id)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x220753E80](self, a2);
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", self->_attachmentCharacterString, &stru_24DDC5810);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", self->_breadcrumbCharacterString, &stru_24DDC5810);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);

  return v7;
}

- (id)nextMessagePair
{
  NSArray *messageEvents;
  void *v5;
  NSDate *v6;
  NSDate *latestProcessedDate;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  SGMessagePair *v23;
  void *v24;
  void *v25;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  if (-[SGMessagePairIterator isDoneIterating](self, "isDoneIterating"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagePairIterator.m"), 159, CFSTR("Iterator exhausted!"));

  }
  messageEvents = self->_messageEvents;
  if (!messageEvents)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMessagePairIterator.m"), 160, CFSTR("messageEvents is nil"));

    messageEvents = self->_messageEvents;
  }
  -[NSArray objectAtIndexedSubscript:](messageEvents, "objectAtIndexedSubscript:", self->_messageEventIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_messageEventIndex;
  objc_msgSend(v5, "startDate");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  latestProcessedDate = self->_latestProcessedDate;
  self->_latestProcessedDate = v6;

  objc_msgSend(v5, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  INTypedInteractionWithInteraction();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    objc_msgSend(v11, "conversationIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12
      || (v13 = (void *)v12,
          objc_msgSend(v11, "content"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          !v14))
    {
      v23 = 0;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v11, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (__CFString *)objc_msgSend(v15, "mutableCopy");

    CFStringTrimWhitespace(v16);
    objc_msgSend(v11, "conversationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessagePairIterator handleFromConversationId:](self, "handleFromConversationId:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v8, "direction");
    if (v19 == 1)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_latestPromptForHandle, "objectForKeyedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_latestPromptForHandle, "setObject:forKeyedSubscript:", 0, v18);
      if (!v21)
      {
        v23 = 0;
        goto LABEL_20;
      }
      objc_msgSend(v21, "first");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMessagePairIterator removeBreadcrumbsFromMessage:](self, "removeBreadcrumbsFromMessage:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[SGMessagePairIterator removeBreadcrumbsFromMessage:](self, "removeBreadcrumbsFromMessage:", v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "length")
        && objc_msgSend(v22, "length")
        && objc_msgSend(v25, "length") <= self->_maxReplyLength)
      {
        objc_msgSend(v5, "startDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "second");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v31 = v27;
          objc_msgSend(v32, "timeIntervalSinceDate:", v27);
          if (v28 <= self->_maxReplyGap)
            v23 = -[SGMessagePair initWithReply:prompt:handle:sentAt:]([SGMessagePair alloc], "initWithReply:prompt:handle:sentAt:", v25, v22, v18, v32);
          else
            v23 = 0;
          v27 = v31;
        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      if (v19 != 2)
      {
        v23 = 0;
        goto LABEL_22;
      }
      v20 = (void *)MEMORY[0x24BE7A648];
      objc_msgSend(v5, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tupleWithFirst:second:", v16, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_latestPromptForHandle, "setObject:forKeyedSubscript:", v22, v18);
      v23 = 0;
    }

LABEL_20:
LABEL_22:

    goto LABEL_23;
  }
  v23 = 0;
LABEL_24:

  return v23;
}

- (BOOL)isDoneIterating
{
  return self->_messageEventIndex >= self->_messageEventCount;
}

- (NSDate)latestProcessedDate
{
  return self->_latestProcessedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestProcessedDate, 0);
  objc_storeStrong((id *)&self->_latestPromptForHandle, 0);
  objc_storeStrong((id *)&self->_breadcrumbCharacterString, 0);
  objc_storeStrong((id *)&self->_attachmentCharacterString, 0);
  objc_storeStrong((id *)&self->_messageEvents, 0);
}

@end

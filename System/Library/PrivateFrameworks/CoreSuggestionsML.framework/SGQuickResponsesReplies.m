@implementation SGQuickResponsesReplies

- (id)normalizedReplyTextsSet
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 435, CFSTR("%@ must implement -normalizedReplyTextsSet:"), objc_opt_class());

  return 0;
}

- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 441, CFSTR("%@ must implement -replyTextsForIndex:position:"), objc_opt_class());

  return 0;
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

  -[SGQuickResponsesReplies replyTextForIndex:position:](self, "replyTextForIndex:position:", v6, objc_msgSend(v7, "unsignedIntegerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)replyTextsForIndex:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 452, CFSTR("%@ must implement -replyTextsForIndex:"), objc_opt_class());

  return 0;
}

- (unint64_t)replyCountForIndex:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 458, CFSTR("%@ must implement -replyTextCount:"), objc_opt_class());

  return 0;
}

- (unint64_t)replyTextCount
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 464, CFSTR("%@ must implement -replyTextCount:"), objc_opt_class());

  return 0;
}

- (unint64_t)replyClassCount
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 470, CFSTR("%@ must implement -replyClassCount:"), objc_opt_class());

  return 0;
}

- (unint64_t)modelCount
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 476, CFSTR("%@ must implement -modelCount:"), objc_opt_class());

  return 0;
}

- (unint64_t)maxDistinctReplies
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 482, CFSTR("%@ must implement -maxDistinctReplies:"), objc_opt_class());

  return 0;
}

- (SGQuickResponsesReplies)initWithArray:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesConfig.m"), 488, CFSTR("%@ must implement -initWithArray:"), objc_opt_class());

  return 0;
}

+ (id)normalizeReplyText:(id)a3
{
  void *v3;
  void *v4;

  SGNormalizeEmojisInString(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedLowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)normalizeReplyTextInternal:(id)a3
{
  return (id)objc_msgSend(a3, "localizedLowercaseString");
}

+ (id)repliesWithArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __objc2_class *v6;
  void *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {

    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = SGQuickResponsesRepliesNested;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failure to read SGQuickResponsesReplies from config.", v9, 2u);
          }
          v7 = 0;
          goto LABEL_11;
        }
      }
      v6 = SGQuickResponsesRepliesFlattened;
    }
    v7 = (void *)objc_msgSend([v6 alloc], "initWithArray:", v4);
LABEL_11:

    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "array", buf, 2u);
  }
  v7 = 0;
LABEL_12:

  return v7;
}

@end

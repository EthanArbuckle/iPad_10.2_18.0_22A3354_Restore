@implementation IPMessage

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (IPMessage)initWithIdentifier:(id)a3 subject:(id)a4 sender:(id)a5 recipients:(id)a6 dateSent:(id)a7 type:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  IPMessage *v20;
  IPMessage *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)IPMessage;
  v20 = -[IPMessage init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    -[IPMessage setIdentifier:](v20, "setIdentifier:", v14);
    -[IPMessage setSubject:](v21, "setSubject:", v15);
    -[IPMessage setSender:](v21, "setSender:", v16);
    -[IPMessage setRecipients:](v21, "setRecipients:", v17);
    -[IPMessage setDateSent:](v21, "setDateSent:", v18);
    -[IPMessage setType:](v21, "setType:", v19);
    -[IPMessage setIsReply:](v21, "setIsReply:", 0);
    -[IPMessage subject](v21, "subject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_msgSend(v15, "length");
      if (v23 >= 0x2710)
        v24 = 10000;
      else
        v24 = v23;
      +[IPRegexToolbox emailSubjectPrefixRegex](IPRegexToolbox, "emailSubjectPrefixRegex");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "numberOfMatchesInString:options:range:", v15, 2, 0, v24);

      -[IPMessage setIsReply:](v21, "setIsReply:", v26 != 0);
    }
  }

  return v21;
}

- (IPMessage)init
{
  -[IPMessage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (IPMessage)initWithSGIPMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IPPerson *v11;
  void *v12;
  void *v13;
  void *v14;
  IPPerson *v15;
  void *v16;
  IPPerson *v17;
  void *v18;
  void *v19;
  IPMessage *v20;
  void *v21;
  IPMessage *v22;
  void *v24;
  _QWORD v25[4];
  IPMessage *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = -[IPPerson initWithSGIPPerson:]([IPPerson alloc], "initWithSGIPPerson:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "messageId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v4, "subject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  v15 = [IPPerson alloc];
  objc_msgSend(v4, "sender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[IPPerson initWithSGIPPerson:](v15, "initWithSGIPPerson:", v16);
  objc_msgSend(v4, "dateSent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  v20 = -[IPMessage initWithIdentifier:subject:sender:recipients:dateSent:type:](self, "initWithIdentifier:subject:sender:recipients:dateSent:type:", v12, v14, v17, v5, v19, IPMessageTypeEmail);

  -[IPMessage setIsSent:](v20, "setIsSent:", objc_msgSend(v4, "isSent"));
  -[IPMessage setIsGroupConversation:](v20, "setIsGroupConversation:", objc_msgSend(v4, "isGroupConversation"));
  -[IPMessage setIsSenderSignificant:](v20, "setIsSenderSignificant:", objc_msgSend(v4, "isSenderSignificant"));
  objc_msgSend(v4, "messageUnits");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __33__IPMessage_initWithSGIPMessage___block_invoke;
  v25[3] = &unk_24DAA5148;
  v22 = v20;
  v26 = v22;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v25);

  return v22;
}

void __33__IPMessage_initWithSGIPMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  IPMessageUnit *v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = -[IPMessageUnit initWithText:originalMessage:index:]([IPMessageUnit alloc], "initWithText:originalMessage:index:", v6, *(_QWORD *)(a1 + 32), a3);

  objc_msgSend(v5, "addMessageUnit:", v7);
}

- (IPMessage)initWithDateSent:(id)a3
{
  return -[IPMessage initWithDateSent:subject:](self, "initWithDateSent:subject:", a3, 0);
}

- (IPMessage)initWithDateSent:(id)a3 subject:(id)a4
{
  if (!a4)
    a4 = &stru_24DAA6418;
  return -[IPMessage initWithIdentifier:subject:sender:recipients:dateSent:type:](self, "initWithIdentifier:subject:sender:recipients:dateSent:type:", CFSTR("0"), a4, 0, MEMORY[0x24BDBD1A8], a3, 0);
}

- (IPMessage)initWithIdentifier:(id)a3 subject:(id)a4 sender:(id)a5 recipients:(id)a6 dateSent:(id)a7
{
  return -[IPMessage initWithIdentifier:subject:sender:recipients:dateSent:type:](self, "initWithIdentifier:subject:sender:recipients:dateSent:type:", a3, a4, a5, a6, a7, IPMessageTypeEmail);
}

- (id)firstHeaderValueForKey:(id)a3 inHeaders:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (IPMessage)initWithHTMLContent:(id)a3 emailHeadersDictionary:(id)a4 dateSent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  IPMessage *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IPMessage firstHeaderValueForKey:inHeaders:](self, "firstHeaderValueForKey:inHeaders:", CFSTR("Message-Id"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPMessage firstHeaderValueForKey:inHeaders:](self, "firstHeaderValueForKey:inHeaders:", CFSTR("Subject"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[IPMessage initWithIdentifier:subject:sender:recipients:dateSent:type:](self, "initWithIdentifier:subject:sender:recipients:dateSent:type:", v11, v12, 0, 0, v8, IPMessageTypeEmail);
  -[IPMessage setHtmlContent:](v13, "setHtmlContent:", v10);

  return v13;
}

- (void)addMessageUnit:(id)a3
{
  id v4;
  NSMutableArray *messageUnits;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  messageUnits = self->_messageUnits;
  v9 = v4;
  if (!messageUnits)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_messageUnits;
    self->_messageUnits = v6;

    v4 = v9;
    self->_messageUnitsTextLength = 0;
    messageUnits = self->_messageUnits;
  }
  -[NSMutableArray addObject:](messageUnits, "addObject:", v4);
  objc_msgSend(v9, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_messageUnitsTextLength += objc_msgSend(v8, "length");

}

- (NSArray)messageUnits
{
  NSMutableArray *messageUnits;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  IPMessageUnit *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  messageUnits = self->_messageUnits;
  if (!messageUnits)
  {
    -[IPMessage htmlContent](self, "htmlContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPQuoteParser strippedQuoteBlockWithHtml:](IPQuoteParser, "strippedQuoteBlockWithHtml:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _MDPlainTextFromHTMLData();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[IPMessageUnit initWithText:originalMessage:index:]([IPMessageUnit alloc], "initWithText:originalMessage:index:", v7, self, 0);
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
    v11 = self->_messageUnits;
    self->_messageUnits = v10;

    messageUnits = self->_messageUnits;
  }
  return (NSArray *)messageUnits;
}

- (void)setMessageUnits:(id)a3
{
  id v4;
  NSMutableArray *messageUnits;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  messageUnits = self->_messageUnits;
  self->_messageUnits = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[IPMessage addMessageUnit:](self, "addMessageUnit:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)lowercaseSubject
{
  NSString *lowercaseSubject;
  void *v4;
  NSString *v5;
  NSString *v6;

  lowercaseSubject = self->_lowercaseSubject;
  if (!lowercaseSubject)
  {
    -[IPMessage subject](self, "subject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lowercaseSubject;
    self->_lowercaseSubject = v5;

    lowercaseSubject = self->_lowercaseSubject;
  }
  return lowercaseSubject;
}

- (void)addDetectedKeyword:(id)a3 classificationTypeIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *keywordsDictionary;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6)
  {
    keywordsDictionary = self->_keywordsDictionary;
    if (!keywordsDictionary)
    {
      v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
      v9 = self->_keywordsDictionary;
      self->_keywordsDictionary = v8;

      keywordsDictionary = self->_keywordsDictionary;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](keywordsDictionary, "setObject:forKeyedSubscript:", v6, v10);
  }

}

- (id)detectedKeywordsDictionary
{
  return (id)-[NSMutableDictionary copy](self->_keywordsDictionary, "copy");
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)subject
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (IPPerson)sender
{
  return (IPPerson *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSender:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)dateSent
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDateSent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void)setIsReply:(BOOL)a3
{
  self->_isReply = a3;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (void)setIsGroupConversation:(BOOL)a3
{
  self->_isGroupConversation = a3;
}

- (BOOL)isSenderSignificant
{
  return self->_isSenderSignificant;
}

- (void)setIsSenderSignificant:(BOOL)a3
{
  self->_isSenderSignificant = a3;
}

- (NSString)htmlContent
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHtmlContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)messageUnitsTextLength
{
  return self->_messageUnitsTextLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lowercaseSubject, 0);
  objc_storeStrong((id *)&self->_keywordsDictionary, 0);
  objc_storeStrong((id *)&self->_messageUnits, 0);
}

@end

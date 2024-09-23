@implementation NNMKMessageContent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKMessageContent)initWithCoder:(id)a3
{
  id v4;
  NNMKMessageContent *v5;
  uint64_t v6;
  NSString *messageId;
  uint64_t v8;
  NSString *externalReferenceId;
  void *v10;
  uint64_t v11;
  NSData *textData;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *attachments;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NNMKMessageContent;
  v5 = -[NNMKMessageContent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMessageId"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyExternalReferenceId"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalReferenceId = v5->_externalReferenceId;
    v5->_externalReferenceId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMainAlternativeValid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mainAlternativeValid = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyTextData"));
    v11 = objc_claimAutoreleasedReturnValue();
    textData = v5->_textData;
    v5->_textData = (NSData *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("kNSCodingKeyAttachments"));
    v16 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyPartiallyLoaded"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_partiallyLoaded = objc_msgSend(v18, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageId;
  id v5;
  void *v6;
  id v7;

  messageId = self->_messageId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageId, CFSTR("kNSCodingKeyMessageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalReferenceId, CFSTR("kNSCodingKeyExternalReferenceId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_mainAlternativeValid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeyMainAlternativeValid"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_textData, CFSTR("kNSCodingKeyTextData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachments, CFSTR("kNSCodingKeyAttachments"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_partiallyLoaded);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("kNSCodingKeyPartiallyLoaded"));

}

- (void)setAttachments:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *attachments;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[NNMKMessageContent messageId](self, "messageId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMessageId:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  attachments = self->_attachments;
  self->_attachments = v4;

}

- (BOOL)isHTML
{
  return -[NSData length](self->_htmlContentData, "length") != 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Message Id: %@\nText Data Length: %lu\nAttachments: %@\n"), self->_messageId, -[NSData length](self->_textData, "length"), self->_attachments);
}

+ (id)classesForUnarchivingTextData
{
  if (classesForUnarchivingTextData_onceToken != -1)
    dispatch_once(&classesForUnarchivingTextData_onceToken, &__block_literal_global_5);
  return (id)classesForUnarchivingTextData_classesForUnarchivingTextData;
}

void __51__NNMKMessageContent_classesForUnarchivingTextData__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)classesForUnarchivingTextData_classesForUnarchivingTextData;
  classesForUnarchivingTextData_classesForUnarchivingTextData = v7;

}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (NSString)externalReferenceId
{
  return self->_externalReferenceId;
}

- (void)setExternalReferenceId:(id)a3
{
  objc_storeStrong((id *)&self->_externalReferenceId, a3);
}

- (BOOL)mainAlternativeValid
{
  return self->_mainAlternativeValid;
}

- (void)setMainAlternativeValid:(BOOL)a3
{
  self->_mainAlternativeValid = a3;
}

- (NSData)textData
{
  return self->_textData;
}

- (void)setTextData:(id)a3
{
  objc_storeStrong((id *)&self->_textData, a3);
}

- (NSData)htmlContentData
{
  return self->_htmlContentData;
}

- (void)setHtmlContentData:(id)a3
{
  objc_storeStrong((id *)&self->_htmlContentData, a3);
}

- (BOOL)hasTextData
{
  return self->_hasTextData;
}

- (void)setHasTextData:(BOOL)a3
{
  self->_hasTextData = a3;
}

- (unint64_t)originalContentSize
{
  return self->_originalContentSize;
}

- (void)setOriginalContentSize:(unint64_t)a3
{
  self->_originalContentSize = a3;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (BOOL)partiallyLoaded
{
  return self->_partiallyLoaded;
}

- (void)setPartiallyLoaded:(BOOL)a3
{
  self->_partiallyLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_textData, 0);
  objc_storeStrong((id *)&self->_externalReferenceId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

@end

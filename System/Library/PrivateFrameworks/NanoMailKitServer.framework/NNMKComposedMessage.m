@implementation NNMKComposedMessage

- (NNMKComposedMessage)init
{
  NNMKComposedMessage *v2;
  void *v3;
  uint64_t v4;
  NSString *composedMessageId;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NNMKComposedMessage;
  v2 = -[NNMKComposedMessage init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    composedMessageId = v2->_composedMessageId;
    v2->_composedMessageId = (NSString *)v4;

    v2->_sendingType = 1;
  }
  return v2;
}

- (unint64_t)size
{
  unint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSString lengthOfBytesUsingEncoding:](self->_body, "lengthOfBytesUsingEncoding:", 4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_attachments;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "fileSize", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKComposedMessage)initWithCoder:(id)a3
{
  id v4;
  NNMKComposedMessage *v5;
  uint64_t v6;
  NSString *composedMessageId;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *to;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *cc;
  uint64_t v19;
  NSString *subject;
  uint64_t v21;
  NSString *from;
  uint64_t v23;
  NSString *body;
  uint64_t v25;
  NSString *referenceMessageId;
  uint64_t v27;
  NSString *standaloneReferenceMessageId;
  uint64_t v29;
  NSString *accountId;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *attachments;
  void *v36;

  v4 = a3;
  v5 = -[NNMKComposedMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyComposedMessageId"));
    v6 = objc_claimAutoreleasedReturnValue();
    composedMessageId = v5->_composedMessageId;
    v5->_composedMessageId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySendingType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sendingType = objc_msgSend(v8, "unsignedIntegerValue");

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kNSCodingKeyTo"));
    v12 = objc_claimAutoreleasedReturnValue();
    to = v5->_to;
    v5->_to = (NSArray *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("kNSCodingKeyCC"));
    v17 = objc_claimAutoreleasedReturnValue();
    cc = v5->_cc;
    v5->_cc = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySubject"));
    v19 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFrom"));
    v21 = objc_claimAutoreleasedReturnValue();
    from = v5->_from;
    v5->_from = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyBody"));
    v23 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyReferenceMessageId"));
    v25 = objc_claimAutoreleasedReturnValue();
    referenceMessageId = v5->_referenceMessageId;
    v5->_referenceMessageId = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyStandaloneReferenceMessageId"));
    v27 = objc_claimAutoreleasedReturnValue();
    standaloneReferenceMessageId = v5->_standaloneReferenceMessageId;
    v5->_standaloneReferenceMessageId = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyAccountId"));
    v29 = objc_claimAutoreleasedReturnValue();
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v29;

    v31 = (void *)MEMORY[0x24BDBCF20];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("kNSCodingKeyAttachments"));
    v34 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyIncludeAttachments"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeAttachments = objc_msgSend(v36, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *composedMessageId;
  id v5;
  void *v6;
  id v7;

  composedMessageId = self->_composedMessageId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", composedMessageId, CFSTR("kNSCodingKeyComposedMessageId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sendingType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeySendingType"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_to, CFSTR("kNSCodingKeyTo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cc, CFSTR("kNSCodingKeyCC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subject, CFSTR("kNSCodingKeySubject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_from, CFSTR("kNSCodingKeyFrom"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_body, CFSTR("kNSCodingKeyBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceMessageId, CFSTR("kNSCodingKeyReferenceMessageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_standaloneReferenceMessageId, CFSTR("kNSCodingKeyStandaloneReferenceMessageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountId, CFSTR("kNSCodingKeyAccountId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachments, CFSTR("kNSCodingKeyAttachments"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_includeAttachments);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("kNSCodingKeyIncludeAttachments"));

}

- (id)copyWithNewId
{
  NNMKComposedMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(NNMKComposedMessage);
  -[NNMKComposedMessage setSendingType:](v3, "setSendingType:", -[NNMKComposedMessage sendingType](self, "sendingType"));
  -[NNMKComposedMessage to](self, "to");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setTo:](v3, "setTo:", v4);

  -[NNMKComposedMessage cc](self, "cc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setCc:](v3, "setCc:", v5);

  -[NNMKComposedMessage from](self, "from");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setFrom:](v3, "setFrom:", v6);

  -[NNMKComposedMessage subject](self, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setSubject:](v3, "setSubject:", v7);

  -[NNMKComposedMessage body](self, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setBody:](v3, "setBody:", v8);

  -[NNMKComposedMessage referenceMessageId](self, "referenceMessageId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setReferenceMessageId:](v3, "setReferenceMessageId:", v9);

  -[NNMKComposedMessage standaloneReferenceMessageId](self, "standaloneReferenceMessageId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setStandaloneReferenceMessageId:](v3, "setStandaloneReferenceMessageId:", v10);

  -[NNMKComposedMessage accountId](self, "accountId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKComposedMessage setAccountId:](v3, "setAccountId:", v11);

  -[NNMKComposedMessage attachments](self, "attachments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[NNMKComposedMessage setAttachments:](v3, "setAttachments:", v13);

  -[NNMKComposedMessage setIncludeAttachments:](v3, "setIncludeAttachments:", -[NNMKComposedMessage includeAttachments](self, "includeAttachments"));
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Composed Message Id: %@\nSending Type: %lu\nTo: %@\nCC: %@\nSubject: %@\nBody: %@\nReference Message Id: %@\nStandalone Reference Message Id: %@\nAccount Id:%@\nInclude Attachments: %d"), self->_composedMessageId, self->_sendingType, self->_to, self->_cc, self->_subject, self->_body, self->_referenceMessageId, self->_standaloneReferenceMessageId, self->_accountId, self->_includeAttachments);
}

- (NSString)composedMessageId
{
  return self->_composedMessageId;
}

- (void)setComposedMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_composedMessageId, a3);
}

- (unint64_t)sendingType
{
  return self->_sendingType;
}

- (void)setSendingType:(unint64_t)a3
{
  self->_sendingType = a3;
}

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_storeStrong((id *)&self->_to, a3);
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
  objc_storeStrong((id *)&self->_cc, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)referenceMessageId
{
  return self->_referenceMessageId;
}

- (void)setReferenceMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_referenceMessageId, a3);
}

- (NSString)standaloneReferenceMessageId
{
  return self->_standaloneReferenceMessageId;
}

- (void)setStandaloneReferenceMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_standaloneReferenceMessageId, a3);
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (BOOL)includeAttachments
{
  return self->_includeAttachments;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  self->_includeAttachments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_standaloneReferenceMessageId, 0);
  objc_storeStrong((id *)&self->_referenceMessageId, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_composedMessageId, 0);
}

@end

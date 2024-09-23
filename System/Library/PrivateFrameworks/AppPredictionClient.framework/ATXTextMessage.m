@implementation ATXTextMessage

- (ATXTextMessage)initWithMessageID:(id)a3 bundleID:(id)a4 dateReceived:(id)a5 threadID:(id)a6 sender:(id)a7 recipients:(id)a8 subject:(id)a9 body:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ATXTextMessage *v23;
  uint64_t v24;
  NSString *messageID;
  uint64_t v26;
  NSString *bundleID;
  uint64_t v28;
  NSString *threadID;
  uint64_t v30;
  NSArray *recipients;
  uint64_t v32;
  NSString *subject;
  uint64_t v34;
  NSString *body;
  id v37;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v37 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v38.receiver = self;
  v38.super_class = (Class)ATXTextMessage;
  v23 = -[ATXTextMessage init](&v38, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    messageID = v23->_messageID;
    v23->_messageID = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    bundleID = v23->_bundleID;
    v23->_bundleID = (NSString *)v26;

    objc_storeStrong((id *)&v23->_dateReceived, a5);
    v28 = objc_msgSend(v18, "copy");
    threadID = v23->_threadID;
    v23->_threadID = (NSString *)v28;

    objc_storeStrong((id *)&v23->_sender, a7);
    v30 = objc_msgSend(v20, "copy");
    recipients = v23->_recipients;
    v23->_recipients = (NSArray *)v30;

    v32 = objc_msgSend(v21, "copy");
    subject = v23->_subject;
    v23->_subject = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    body = v23->_body;
    v23->_body = (NSString *)v34;

  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[ATXTextMessage messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("messageID"));

  -[ATXTextMessage bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  -[ATXTextMessage dateReceived](self, "dateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dateReceived"));

  -[ATXTextMessage threadID](self, "threadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("threadID"));

  -[ATXTextMessage sender](self, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sender"));

  -[ATXTextMessage recipients](self, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("recipients"));

  -[ATXTextMessage subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("subject"));

  -[ATXTextMessage body](self, "body");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("body"));

}

- (ATXTextMessage)initWithCoder:(id)a3
{
  id v4;
  ATXTextMessage *v5;
  uint64_t v6;
  NSString *messageID;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSDate *dateReceived;
  uint64_t v12;
  NSString *threadID;
  uint64_t v14;
  ATXNamedHandle *sender;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *recipients;
  uint64_t v21;
  NSString *subject;
  uint64_t v23;
  NSString *body;
  ATXTextMessage *v25;
  objc_super v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ATXTextMessage;
  v5 = -[ATXTextMessage init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageID = v5->_messageID;
    v5->_messageID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateReceived"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadID"));
    v12 = objc_claimAutoreleasedReturnValue();
    threadID = v5->_threadID;
    v5->_threadID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
    v14 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (ATXNamedHandle *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("recipients"));
    v19 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
    v21 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v23 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v23;

    v25 = v5;
  }

  return v5;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (ATXNamedHandle)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end

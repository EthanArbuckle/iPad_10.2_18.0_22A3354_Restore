@implementation ATXMailMessage

- (ATXMailMessage)initWithMailID:(id)a3 bundleID:(id)a4 dateReceived:(id)a5 sender:(id)a6 recipients:(id)a7 subject:(id)a8 body:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ATXMailMessage *v21;
  uint64_t v22;
  NSString *mailID;
  uint64_t v24;
  NSString *bundleID;
  uint64_t v26;
  NSArray *recipients;
  uint64_t v28;
  NSString *subject;
  uint64_t v30;
  NSString *body;
  id v33;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v33 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ATXMailMessage;
  v21 = -[ATXMailMessage init](&v34, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    mailID = v21->_mailID;
    v21->_mailID = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    bundleID = v21->_bundleID;
    v21->_bundleID = (NSString *)v24;

    objc_storeStrong((id *)&v21->_dateReceived, a5);
    objc_storeStrong((id *)&v21->_sender, a6);
    v26 = objc_msgSend(v18, "copy");
    recipients = v21->_recipients;
    v21->_recipients = (NSArray *)v26;

    v28 = objc_msgSend(v19, "copy");
    subject = v21->_subject;
    v21->_subject = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    body = v21->_body;
    v21->_body = (NSString *)v30;

  }
  return v21;
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
  id v11;

  v4 = a3;
  -[ATXMailMessage mailID](self, "mailID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mailID"));

  -[ATXMailMessage bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  -[ATXMailMessage dateReceived](self, "dateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dateReceived"));

  -[ATXMailMessage sender](self, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sender"));

  -[ATXMailMessage recipients](self, "recipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("recipients"));

  -[ATXMailMessage subject](self, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("subject"));

  -[ATXMailMessage body](self, "body");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("body"));

}

- (ATXMailMessage)initWithCoder:(id)a3
{
  id v4;
  ATXMailMessage *v5;
  uint64_t v6;
  NSString *mailID;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSDate *dateReceived;
  uint64_t v12;
  ATXNamedHandle *sender;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *recipients;
  uint64_t v19;
  NSString *subject;
  uint64_t v21;
  NSString *body;
  ATXMailMessage *v23;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ATXMailMessage;
  v5 = -[ATXMailMessage init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mailID"));
    v6 = objc_claimAutoreleasedReturnValue();
    mailID = v5->_mailID;
    v5->_mailID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateReceived"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
    v12 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (ATXNamedHandle *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("recipients"));
    v17 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
    v19 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v21 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v21;

    v23 = v5;
  }

  return v5;
}

- (NSString)mailID
{
  return self->_mailID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
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
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_mailID, 0);
}

@end

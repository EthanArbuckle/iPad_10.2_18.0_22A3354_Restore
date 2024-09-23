@implementation OSLogEntryActivity

- (OSLogEntryActivity)initWithEventProxy:(id)a3
{
  id v4;
  OSLogEntryActivity *v5;
  uint64_t v6;
  NSString *process;
  uint64_t v8;
  NSString *sender;
  OSLogEntryActivity *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSLogEntryActivity;
  v5 = -[OSLogEntry initWithEventProxy:](&v12, sel_initWithEventProxy_, v4);
  if (v5)
  {
    v5->_activityIdentifier = objc_msgSend(v4, "activityIdentifier");
    objc_msgSend(v4, "process");
    v6 = objc_claimAutoreleasedReturnValue();
    process = v5->_process;
    v5->_process = (NSString *)v6;

    v5->_processIdentifier = objc_msgSend(v4, "processIdentifier");
    objc_msgSend(v4, "sender");
    v8 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    v5->_threadIdentifier = objc_msgSend(v4, "threadIdentifier");
    v5->_parentActivityIdentifier = objc_msgSend(v4, "parentActivityIdentifier");
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OSLogEntryActivity;
  v4 = a3;
  -[OSLogEntry encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntryActivity activityIdentifier](self, "activityIdentifier", v10.receiver, v10.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activityIdentifier"));

  -[OSLogEntryActivity process](self, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("process"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[OSLogEntryActivity processIdentifier](self, "processIdentifier"), CFSTR("processIdentifier"));
  -[OSLogEntryActivity sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sender"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntryActivity threadIdentifier](self, "threadIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("threadIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntryActivity parentActivityIdentifier](self, "parentActivityIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("parentActivityIdentifier"));

}

- (OSLogEntryActivity)initWithCoder:(id)a3
{
  id v4;
  OSLogEntryActivity *v5;
  void *v6;
  uint64_t v7;
  NSString *process;
  uint64_t v9;
  NSString *sender;
  void *v11;
  void *v12;
  OSLogEntryActivity *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OSLogEntryActivity;
  v5 = -[OSLogEntry initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activityIdentifier = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("process"));
    v7 = objc_claimAutoreleasedReturnValue();
    process = v5->_process;
    v5->_process = (NSString *)v7;

    v5->_processIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("processIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
    v9 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_threadIdentifier = objc_msgSend(v11, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentActivityIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_parentActivityIdentifier = objc_msgSend(v12, "unsignedLongLongValue");

    v13 = v5;
  }

  return v5;
}

- (unint64_t)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)process
{
  return self->_process;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)sender
{
  return self->_sender;
}

- (unint64_t)threadIdentifier
{
  return self->_threadIdentifier;
}

- (os_activity_id_t)parentActivityIdentifier
{
  return self->_parentActivityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation OSLogEntryLog

- (OSLogEntryLog)initWithEventProxy:(id)a3
{
  id v4;
  OSLogEntryLog *v5;
  uint64_t v6;
  NSString *process;
  uint64_t v8;
  NSString *sender;
  uint64_t v10;
  NSString *category;
  uint64_t v12;
  NSArray *components;
  uint64_t v14;
  NSString *formatString;
  uint64_t v16;
  NSString *subsystem;
  uint64_t v18;
  uint64_t v19;
  OSLogEntryLog *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)OSLogEntryLog;
  v5 = -[OSLogEntry initWithEventProxy:](&v22, sel_initWithEventProxy_, v4);
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
    objc_msgSend(v4, "category");
    v10 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v10;

    makeComponents(v4);
    v12 = objc_claimAutoreleasedReturnValue();
    components = v5->_components;
    v5->_components = (NSArray *)v12;

    objc_msgSend(v4, "formatString");
    v14 = objc_claimAutoreleasedReturnValue();
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v14;

    objc_msgSend(v4, "subsystem");
    v16 = objc_claimAutoreleasedReturnValue();
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v16;

    v18 = objc_msgSend(v4, "logType");
    if (v18 <= 1)
    {
      if (!v18)
      {
        v19 = 3;
        goto LABEL_14;
      }
      if (v18 == 1)
      {
        v19 = 2;
        goto LABEL_14;
      }
    }
    else
    {
      switch(v18)
      {
        case 2:
          v19 = 1;
          goto LABEL_14;
        case 16:
          v19 = 4;
          goto LABEL_14;
        case 17:
          v19 = 5;
LABEL_14:
          v5->_level = v19;
          v20 = v5;
          goto LABEL_15;
      }
    }
    v19 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (OSLogEntryLog)initWithDate:(id)a3 composedMessage:(id)a4 processIdentifier:(int)a5
{
  OSLogEntryLog *v6;
  OSLogEntryLog *v7;
  OSLogEntryLog *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OSLogEntryLog;
  v6 = -[OSLogEntry initWithDate:composedMessage:](&v10, sel_initWithDate_composedMessage_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_processIdentifier = a5;
    v8 = v6;
  }

  return v7;
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OSLogEntryLog;
  v4 = a3;
  -[OSLogEntry encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntryLog activityIdentifier](self, "activityIdentifier", v13.receiver, v13.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activityIdentifier"));

  -[OSLogEntryLog process](self, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("process"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[OSLogEntryLog processIdentifier](self, "processIdentifier"), CFSTR("processIdentifier"));
  -[OSLogEntryLog sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sender"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntryLog threadIdentifier](self, "threadIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("threadIdentifier"));

  -[OSLogEntryLog category](self, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("category"));

  -[OSLogEntryLog components](self, "components");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("components"));

  -[OSLogEntryLog formatString](self, "formatString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("formatString"));

  -[OSLogEntryLog subsystem](self, "subsystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("subsystem"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[OSLogEntryLog level](self, "level"), CFSTR("level"));
}

- (OSLogEntryLog)initWithCoder:(id)a3
{
  id v4;
  OSLogEntryLog *v5;
  void *v6;
  uint64_t v7;
  NSString *process;
  uint64_t v9;
  NSString *sender;
  void *v11;
  uint64_t v12;
  NSString *category;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *components;
  uint64_t v19;
  NSString *formatString;
  uint64_t v21;
  NSString *subsystem;
  OSLogEntryLog *v23;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)OSLogEntryLog;
  v5 = -[OSLogEntry initWithCoder:](&v25, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v12 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("components"));
    v17 = objc_claimAutoreleasedReturnValue();
    components = v5->_components;
    v5->_components = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatString"));
    v19 = objc_claimAutoreleasedReturnValue();
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subsystem"));
    v21 = objc_claimAutoreleasedReturnValue();
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v21;

    v5->_level = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("level"));
    v23 = v5;
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

- (NSString)category
{
  return self->_category;
}

- (NSArray)components
{
  return self->_components;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (OSLogEntryLogLevel)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

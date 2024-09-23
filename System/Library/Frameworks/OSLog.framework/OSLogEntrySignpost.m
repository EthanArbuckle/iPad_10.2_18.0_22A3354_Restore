@implementation OSLogEntrySignpost

- (OSLogEntrySignpost)initWithEventProxy:(id)a3
{
  id v4;
  OSLogEntrySignpost *v5;
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
  NSString *signpostName;
  unint64_t v20;
  int64_t v21;
  OSLogEntrySignpost *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)OSLogEntrySignpost;
  v5 = -[OSLogEntry initWithEventProxy:](&v24, sel_initWithEventProxy_, v4);
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

    v5->_signpostIdentifier = objc_msgSend(v4, "signpostIdentifier");
    objc_msgSend(v4, "signpostName");
    v18 = objc_claimAutoreleasedReturnValue();
    signpostName = v5->_signpostName;
    v5->_signpostName = (NSString *)v18;

    v20 = objc_msgSend(v4, "signpostType");
    if (v20 > 2)
      v21 = 0;
    else
      v21 = qword_1D419B2D0[v20];
    v5->_signpostType = v21;
    v22 = v5;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OSLogEntrySignpost;
  v4 = a3;
  -[OSLogEntry encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntrySignpost activityIdentifier](self, "activityIdentifier", v15.receiver, v15.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activityIdentifier"));

  -[OSLogEntrySignpost process](self, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("process"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[OSLogEntrySignpost processIdentifier](self, "processIdentifier"), CFSTR("processIdentifier"));
  -[OSLogEntrySignpost sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sender"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntrySignpost threadIdentifier](self, "threadIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("threadIdentifier"));

  -[OSLogEntrySignpost category](self, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("category"));

  -[OSLogEntrySignpost components](self, "components");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("components"));

  -[OSLogEntrySignpost formatString](self, "formatString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("formatString"));

  -[OSLogEntrySignpost subsystem](self, "subsystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("subsystem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogEntrySignpost signpostIdentifier](self, "signpostIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("signpostIdentifier"));

  -[OSLogEntrySignpost signpostName](self, "signpostName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("signpostName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[OSLogEntrySignpost signpostType](self, "signpostType"), CFSTR("signpostType"));
}

- (OSLogEntrySignpost)initWithCoder:(id)a3
{
  id v4;
  OSLogEntrySignpost *v5;
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
  void *v23;
  uint64_t v24;
  NSString *signpostName;
  OSLogEntrySignpost *v26;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)OSLogEntrySignpost;
  v5 = -[OSLogEntry initWithCoder:](&v28, sel_initWithCoder_, v4);
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
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_signpostIdentifier = objc_msgSend(v23, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostName"));
    v24 = objc_claimAutoreleasedReturnValue();
    signpostName = v5->_signpostName;
    v5->_signpostName = (NSString *)v24;

    v5->_signpostType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("level"));
    v26 = v5;
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

- (os_signpost_id_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

- (NSString)signpostName
{
  return self->_signpostName;
}

- (OSLogEntrySignpostType)signpostType
{
  return self->_signpostType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostName, 0);
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

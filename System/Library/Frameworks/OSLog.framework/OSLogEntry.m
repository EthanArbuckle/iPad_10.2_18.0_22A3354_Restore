@implementation OSLogEntry

- (OSLogEntry)initWithEventProxy:(id)a3
{
  id v4;
  OSLogEntry *v5;
  uint64_t v6;
  NSString *composedMessage;
  uint64_t v8;
  NSDate *date;
  OSLogEntry *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSLogEntry;
  v5 = -[OSLogEntry init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "composedMessage");
    v6 = objc_claimAutoreleasedReturnValue();
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    objc_msgSend(v4, "date");
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_storeCategory = 0;
    v10 = v5;
  }

  return v5;
}

- (OSLogEntry)initWithDate:(id)a3 composedMessage:(id)a4
{
  id v7;
  id v8;
  OSLogEntry *v9;
  OSLogEntry *v10;
  OSLogEntry *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OSLogEntry;
  v9 = -[OSLogEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_composedMessage, a4);
    objc_storeStrong((id *)&v10->_date, a3);
    v10->_storeCategory = 0;
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[OSLogEntry composedMessage](self, "composedMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("composedMessage"));

  -[OSLogEntry date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("date"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[OSLogEntry storeCategory](self, "storeCategory"), CFSTR("storeCategory"));
}

- (OSLogEntry)initWithCoder:(id)a3
{
  id v4;
  OSLogEntry *v5;
  uint64_t v6;
  NSString *composedMessage;
  uint64_t v8;
  NSDate *date;
  OSLogEntry *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSLogEntry;
  v5 = -[OSLogEntry init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("composedMessage"));
    v6 = objc_claimAutoreleasedReturnValue();
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_storeCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("storeCategory"));
    v10 = v5;
  }

  return v5;
}

- (NSString)composedMessage
{
  return self->_composedMessage;
}

- (NSDate)date
{
  return self->_date;
}

- (OSLogEntryStoreCategory)storeCategory
{
  return self->_storeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_composedMessage, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

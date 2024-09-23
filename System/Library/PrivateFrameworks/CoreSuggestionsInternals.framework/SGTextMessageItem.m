@implementation SGTextMessageItem

- (SGTextMessageItem)initWithTextMessage:(id)a3 detectedData:(id)a4
{
  id v8;
  id v9;
  SGTextMessageItem *v10;
  SGTextMessageItem *v11;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSString *senderID;
  uint64_t v16;
  NSDate *timestamp;
  uint64_t v18;
  NSString *language;
  uint64_t v20;
  NSArray *detectedData;
  void *v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SGTextMessageItem;
  v10 = -[SGTextMessageItem init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_message, a3);
    -[SGMessage textContent](v11->_message, "textContent");
    v12 = objc_claimAutoreleasedReturnValue();
    text = v11->_text;
    v11->_text = (NSString *)v12;

    if (!v11->_text)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SGTextMessageConversationTracker.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_text"));

    }
    objc_msgSend(v8, "conversationIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    senderID = v11->_senderID;
    v11->_senderID = (NSString *)v14;

    objc_msgSend(v8, "date");
    v16 = objc_claimAutoreleasedReturnValue();
    timestamp = v11->_timestamp;
    v11->_timestamp = (NSDate *)v16;

    objc_msgSend(MEMORY[0x1E0D70A90], "detectLanguageFromText:", v11->_text);
    v18 = objc_claimAutoreleasedReturnValue();
    language = v11->_language;
    v11->_language = (NSString *)v18;

    v20 = objc_msgSend(v9, "copy");
    detectedData = v11->_detectedData;
    v11->_detectedData = (NSArray *)v20;

  }
  return v11;
}

- (SGTextMessageItem)initWithTextMessage:(id)a3
{
  return -[SGTextMessageItem initWithTextMessage:detectedData:](self, "initWithTextMessage:detectedData:", a3, 0);
}

- (SGTextMessageItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SGTextMessageItem *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[SGTextMessageItem initWithTextMessage:](self, "initWithTextMessage:", v5);
    v7 = self;
  }
  else
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_fault_impl(&dword_1C3607000, v8, OS_LOG_TYPE_FAULT, "Error decoding null message.textContent in %@:", (uint8_t *)&v10, 0xCu);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_message, CFSTR("message"));
}

- (BOOL)isEqualToConversationTurn:(id)a3
{
  id *v5;
  NSString *text;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *senderID;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  char v16;
  NSDate *v17;
  NSDate *v18;
  void *v20;

  v5 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextMessageConversationTracker.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[otherItem isKindOfClass:[SGTextMessageItem class]]"));

  }
  text = self->_text;
  v7 = (NSString *)v5[2];
  if (text == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = text;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_9;
  }
  senderID = self->_senderID;
  v12 = (NSString *)v5[3];
  if (senderID == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = senderID;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_9:
      v16 = 0;
      goto LABEL_15;
    }
  }
  v17 = self->_timestamp;
  v18 = v17;
  if (v17 == v5[4])
    v16 = 1;
  else
    v16 = -[NSDate isEqual:](v17, "isEqual:");

LABEL_15:
  return v16;
}

- (SGTextMessage)message
{
  return (SGTextMessage *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)text
{
  return self->_text;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)detectedData
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)features
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_detectedData, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

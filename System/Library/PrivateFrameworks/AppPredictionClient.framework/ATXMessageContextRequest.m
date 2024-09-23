@implementation ATXMessageContextRequest

- (ATXMessageContextRequest)initWithTextMessage:(id)a3 additionalContextSignals:(id)a4
{
  id v7;
  id v8;
  ATXMessageContextRequest *v9;
  ATXMessageContextRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXMessageContextRequest;
  v9 = -[ATXMessageContextRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textMessage, a3);
    objc_storeStrong((id *)&v10->_contextRequestSignals, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXMessageContextRequest textMessage](self, "textMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("textMessage"));

  -[ATXMessageContextRequest contextRequestSignals](self, "contextRequestSignals");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contextRequestSignals"));

}

- (ATXMessageContextRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXMessageContextRequest *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_notification_categorization();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("textMessage"), v4, 1, CFSTR("ATXMessageContextRequestErrorDomain"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_notification_categorization();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("contextRequestSignals"), v4, 0, CFSTR("ATXMessageContextRequestErrorDomain"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      self = -[ATXMessageContextRequest initWithTextMessage:additionalContextSignals:](self, "initWithTextMessage:additionalContextSignals:", v8, v14);
      v10 = self;
    }

  }
  return v10;
}

- (ATXTextMessage)textMessage
{
  return self->_textMessage;
}

- (ATXEntityContextRequestOptionalSignals)contextRequestSignals
{
  return self->_contextRequestSignals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextRequestSignals, 0);
  objc_storeStrong((id *)&self->_textMessage, 0);
}

@end

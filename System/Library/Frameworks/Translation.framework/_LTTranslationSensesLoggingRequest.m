@implementation _LTTranslationSensesLoggingRequest

- (void)encodeWithCoder:(id)a3
{
  NSString *conversationID;
  id v5;

  conversationID = self->_conversationID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", conversationID, CFSTR("conversationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestID, CFSTR("requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senses, CFSTR("senses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInteractedSenses, CFSTR("userInteractedSenses"));

}

- (_LTTranslationSensesLoggingRequest)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationSensesLoggingRequest *v5;
  uint64_t v6;
  NSString *conversationID;
  uint64_t v8;
  NSString *requestID;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *senses;
  uint64_t v15;
  NSArray *userInteractedSenses;
  _LTTranslationSensesLoggingRequest *v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_LTTranslationSensesLoggingRequest;
  v5 = -[_LTTranslationSensesLoggingRequest init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationID"));
    v6 = objc_claimAutoreleasedReturnValue();
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestID"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestID = v5->_requestID;
    v5->_requestID = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("senses"));
    v13 = objc_claimAutoreleasedReturnValue();
    senses = v5->_senses;
    v5->_senses = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("userInteractedSenses"));
    v15 = objc_claimAutoreleasedReturnValue();
    userInteractedSenses = v5->_userInteractedSenses;
    v5->_userInteractedSenses = (NSArray *)v15;

    v17 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)senses
{
  return self->_senses;
}

- (void)setSenses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)userInteractedSenses
{
  return self->_userInteractedSenses;
}

- (void)setUserInteractedSenses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractedSenses, 0);
  objc_storeStrong((id *)&self->_senses, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
}

@end

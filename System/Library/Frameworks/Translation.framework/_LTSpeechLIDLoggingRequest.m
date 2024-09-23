@implementation _LTSpeechLIDLoggingRequest

- (void)encodeWithCoder:(id)a3
{
  NSString *conversationID;
  id v5;

  conversationID = self->_conversationID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", conversationID, CFSTR("conversationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestID, CFSTR("requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localePair, CFSTR("localePair"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedLocale, CFSTR("selectedLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetLocale, CFSTR("targetLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lidResult, CFSTR("lidResult"));

}

- (_LTSpeechLIDLoggingRequest)initWithCoder:(id)a3
{
  id v4;
  _LTSpeechLIDLoggingRequest *v5;
  uint64_t v6;
  NSString *conversationID;
  uint64_t v8;
  NSString *requestID;
  uint64_t v10;
  _LTLocalePair *localePair;
  uint64_t v12;
  NSLocale *selectedLocale;
  uint64_t v14;
  NSLocale *targetLocale;
  uint64_t v16;
  _LTLanguageDetectionResult *lidResult;
  _LTSpeechLIDLoggingRequest *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LTSpeechLIDLoggingRequest;
  v5 = -[_LTSpeechLIDLoggingRequest init](&v20, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localePair"));
    v10 = objc_claimAutoreleasedReturnValue();
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedLocale"));
    v12 = objc_claimAutoreleasedReturnValue();
    selectedLocale = v5->_selectedLocale;
    v5->_selectedLocale = (NSLocale *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetLocale"));
    v14 = objc_claimAutoreleasedReturnValue();
    targetLocale = v5->_targetLocale;
    v5->_targetLocale = (NSLocale *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lidResult"));
    v16 = objc_claimAutoreleasedReturnValue();
    lidResult = v5->_lidResult;
    v5->_lidResult = (_LTLanguageDetectionResult *)v16;

    v18 = v5;
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

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSLocale)selectedLocale
{
  return self->_selectedLocale;
}

- (void)setSelectedLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_LTLanguageDetectionResult)lidResult
{
  return self->_lidResult;
}

- (void)setLidResult:(id)a3
{
  objc_storeStrong((id *)&self->_lidResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lidResult, 0);
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
}

@end

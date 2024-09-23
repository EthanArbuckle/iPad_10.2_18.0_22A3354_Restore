@implementation FCPresentationOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxRetries, 0);
  objc_storeStrong((id *)&self->_maxPresentationAttempts, 0);
  objc_storeStrong((id *)&self->_maxPrecedingSameSessionPresentations, 0);
  objc_storeStrong((id *)&self->_operationUID, 0);
  objc_storeStrong((id *)&self->_handlerUID, 0);
}

- (FCPresentationOperation)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPresentationOperation *v5;
  uint64_t v6;
  NSString *handlerUID;
  uint64_t v8;
  NSString *operationUID;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *maxPrecedingSameSessionPresentations;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSNumber *maxPresentationAttempts;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSNumber *maxRetries;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FCPresentationOperation;
  v5 = -[FCPresentationOperation init](&v29, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("handlerUID"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    handlerUID = v5->_handlerUID;
    v5->_handlerUID = (NSString *)v6;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("operationUID"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    operationUID = v5->_operationUID;
    v5->_operationUID = (NSString *)v8;

    v5->_requiredAppLaunchCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("requiredAppLaunchCount"), 0);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxPrecedingSameSessionPresentations"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_5;
    v11 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxPrecedingSameSessionPresentations"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v13)
    {
LABEL_5:
      maxPrecedingSameSessionPresentations = v5->_maxPrecedingSameSessionPresentations;
      v5->_maxPrecedingSameSessionPresentations = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxPrecedingSameSessionPresentations"), 0));
      v14 = objc_claimAutoreleasedReturnValue();
      maxPrecedingSameSessionPresentations = v5->_maxPrecedingSameSessionPresentations;
      v5->_maxPrecedingSameSessionPresentations = (NSNumber *)v14;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxPresentationAttempts"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_9;
    v17 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxPresentationAttempts"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 == v19)
    {
LABEL_9:
      maxPresentationAttempts = v5->_maxPresentationAttempts;
      v5->_maxPresentationAttempts = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxPresentationAttempts"), 0));
      v20 = objc_claimAutoreleasedReturnValue();
      maxPresentationAttempts = v5->_maxPresentationAttempts;
      v5->_maxPresentationAttempts = (NSNumber *)v20;
    }

    v5->_endsPresentationSession = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("endsPresentationSession"), 0);
    v5->_suppressOnLaunchConditions = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("suppressOnLaunchConditions"), 0);
    v5->_ignoreAfterSuccessfulPresentation = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("ignoreAfterSuccessfulPresentation"), 0);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxRetries"));
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_13;
    v23 = (void *)v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxRetries"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 == v25)
    {
LABEL_13:
      maxRetries = v5->_maxRetries;
      v5->_maxRetries = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxRetries"), 0));
      v26 = objc_claimAutoreleasedReturnValue();
      maxRetries = v5->_maxRetries;
      v5->_maxRetries = (NSNumber *)v26;
    }

  }
  return v5;
}

- (NSString)handlerUID
{
  return self->_handlerUID;
}

- (void)setHandlerUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)operationUID
{
  return self->_operationUID;
}

- (void)setOperationUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)requiredAppLaunchCount
{
  return self->_requiredAppLaunchCount;
}

- (void)setRequiredAppLaunchCount:(int64_t)a3
{
  self->_requiredAppLaunchCount = a3;
}

- (NSNumber)maxPrecedingSameSessionPresentations
{
  return self->_maxPrecedingSameSessionPresentations;
}

- (void)setMaxPrecedingSameSessionPresentations:(id)a3
{
  objc_storeStrong((id *)&self->_maxPrecedingSameSessionPresentations, a3);
}

- (NSNumber)maxPresentationAttempts
{
  return self->_maxPresentationAttempts;
}

- (void)setMaxPresentationAttempts:(id)a3
{
  objc_storeStrong((id *)&self->_maxPresentationAttempts, a3);
}

- (BOOL)endsPresentationSession
{
  return self->_endsPresentationSession;
}

- (void)setEndsPresentationSession:(BOOL)a3
{
  self->_endsPresentationSession = a3;
}

- (int64_t)suppressOnLaunchConditions
{
  return self->_suppressOnLaunchConditions;
}

- (void)setSuppressOnLaunchConditions:(int64_t)a3
{
  self->_suppressOnLaunchConditions = a3;
}

- (BOOL)ignoreAfterSuccessfulPresentation
{
  return self->_ignoreAfterSuccessfulPresentation;
}

- (void)setIgnoreAfterSuccessfulPresentation:(BOOL)a3
{
  self->_ignoreAfterSuccessfulPresentation = a3;
}

- (NSNumber)maxRetries
{
  return self->_maxRetries;
}

- (void)setMaxRetries:(id)a3
{
  objc_storeStrong((id *)&self->_maxRetries, a3);
}

@end

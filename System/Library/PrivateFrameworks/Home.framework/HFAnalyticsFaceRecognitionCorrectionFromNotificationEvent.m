@implementation HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent

- (HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSNumber *errorCode;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v17, sel_initWithEventType_, 3);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "domain");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = CFSTR("nil");
    objc_storeStrong((id *)&v5->_errorDomain, v11);

    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = objc_msgSend(v8, "code");

    objc_msgSend(v12, "numberWithInteger:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)v14;

  }
  return v5;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent errorDomain](self, "errorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("errorDomain"));

  -[HFAnalyticsFaceRecognitionCorrectionFromNotificationEvent errorCode](self, "errorCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("errorCode"));

  return v4;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end

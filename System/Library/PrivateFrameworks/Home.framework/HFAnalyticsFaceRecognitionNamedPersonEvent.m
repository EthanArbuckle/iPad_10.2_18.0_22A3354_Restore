@implementation HFAnalyticsFaceRecognitionNamedPersonEvent

- (HFAnalyticsFaceRecognitionNamedPersonEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  HFAnalyticsFaceRecognitionNamedPersonEvent *v13;
  HFAnalyticsFaceRecognitionNamedPersonEvent *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSNumber *errorCode;
  objc_super v26;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNewPerson"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("Error: HFAnalyticsFaceRecognitionNamedPersonIsNewKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("person"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = -[HFAnalyticsFaceRecognitionNamedPersonEvent _namedPersonTypeForPerson:](self, "_namedPersonTypeForPerson:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)HFAnalyticsFaceRecognitionNamedPersonEvent;
  v13 = -[HFAnalyticsEvent initWithEventType:](&v26, sel_initWithEventType_, 4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_isNewPerson, v6);
    objc_storeStrong((id *)&v14->_personType, v12);
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "domain");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = CFSTR("nil");
    objc_storeStrong((id *)&v14->_errorDomain, v20);

    v21 = (void *)MEMORY[0x1E0CB37E8];
    v22 = objc_msgSend(v17, "code");

    objc_msgSend(v21, "numberWithInteger:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    errorCode = v14->_errorCode;
    v14->_errorCode = (NSNumber *)v23;

  }
  return v14;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsFaceRecognitionNamedPersonEvent;
  -[HFAnalyticsEvent payload](&v10, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsFaceRecognitionNamedPersonEvent isNewPerson](self, "isNewPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("namedPersonIsNew"));

  -[HFAnalyticsFaceRecognitionNamedPersonEvent personType](self, "personType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("namedPersonType"));

  -[HFAnalyticsFaceRecognitionNamedPersonEvent errorDomain](self, "errorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("errorDomain"));

  -[HFAnalyticsFaceRecognitionNamedPersonEvent errorCode](self, "errorCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("errorCode"));

  return v4;
}

- (unint64_t)_namedPersonTypeForPerson:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "name");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Expected HMPerson %@ to be unnamed but has name %@"), v4, v6);

      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NSNumber)isNewPerson
{
  return self->_isNewPerson;
}

- (void)setIsNewPerson:(id)a3
{
  objc_storeStrong((id *)&self->_isNewPerson, a3);
}

- (NSNumber)personType
{
  return self->_personType;
}

- (void)setPersonType:(id)a3
{
  objc_storeStrong((id *)&self->_personType, a3);
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
  objc_storeStrong((id *)&self->_personType, 0);
  objc_storeStrong((id *)&self->_isNewPerson, 0);
}

@end

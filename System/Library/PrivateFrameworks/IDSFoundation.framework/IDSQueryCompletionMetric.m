@implementation IDSQueryCompletionMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSQueryCompletion");
}

- (IDSQueryCompletionMetric)initWithService:(id)a3 querySuccess:(BOOL)a4 connectionType:(unsigned int)a5 queryTimeInterval:(double)a6 queryURITypes:(unsigned int)a7 conferenceResultCode:(unsigned int)a8 queryErrorType:(unsigned int)a9 queryError:(id)a10 wasReversePushAttempted:(BOOL)a11 hasEmptyResult:(BOOL)a12 queryReason:(id)a13 retryCount:(unint64_t)a14 uriCount:(unint64_t)a15
{
  id v21;
  id v22;
  id v23;
  IDSQueryCompletionMetric *v24;
  IDSQueryCompletionMetric *v25;
  objc_super v29;

  v21 = a3;
  v22 = a10;
  v23 = a13;
  v29.receiver = self;
  v29.super_class = (Class)IDSQueryCompletionMetric;
  v24 = -[IDSQueryCompletionMetric init](&v29, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_serviceIdentifier, a3);
    v25->_success = a4;
    v25->_queryTimeInterval = a6;
    v25->_connectionType = a5;
    v25->_queryURITypes = a7;
    v25->_conferenceResultCode = a8;
    v25->_queryErrorType = a9;
    objc_storeStrong((id *)&v25->_queryError, a10);
    v25->_wasReversePushAttempted = a11;
    v25->_hasEmptyResult = a12;
    objc_storeStrong((id *)&v25->_queryReason, a13);
    v25->_retryCount = a14;
    v25->_uriCount = a15;
  }

  return v25;
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  double v5;
  __CFDictionary *v6;
  NSString *serviceIdentifier;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  NSString *queryReason;
  void *v38;
  const char *v39;
  double v40;
  void *v41;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    CFDictionarySetValue(v3, CFSTR("service"), serviceIdentifier);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_success, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v6, CFSTR("querySuccess"), v8);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, self->_connectionType, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v6, CFSTR("connectionType"), v11);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v12, v13, self->_queryTimeInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    CFDictionarySetValue(v6, CFSTR("queryTimeInterval"), v14);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v15, self->_queryURITypes, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    CFDictionarySetValue(v6, CFSTR("queryURITypes"), v17);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v18, self->_queryErrorType, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    CFDictionarySetValue(v6, CFSTR("queryErrorType"), v20);

  v21 = (void *)MEMORY[0x1E0CB37E8];
  v25 = objc_msgSend_code(self->_queryError, v22, v23, v24);
  objc_msgSend_numberWithInteger_(v21, v26, v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue(v6, CFSTR("queryErrorCode"), v28);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v29, self->_wasReversePushAttempted, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v6, CFSTR("wasReversePushAttempted"), v31);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v32, self->_hasEmptyResult, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    CFDictionarySetValue(v6, CFSTR("hasEmptyResult"), v34);

  queryReason = self->_queryReason;
  if (queryReason)
    CFDictionarySetValue(v6, CFSTR("queryReason"), queryReason);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v35, self->_retryCount, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    CFDictionarySetValue(v6, CFSTR("retryCount"), v38);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v39, self->_uriCount, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    CFDictionarySetValue(v6, CFSTR("uriCount"), v41);

  return (NSDictionary *)v6;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (double)queryTimeInterval
{
  return self->_queryTimeInterval;
}

- (unsigned)queryURITypes
{
  return self->_queryURITypes;
}

- (unsigned)conferenceResultCode
{
  return self->_conferenceResultCode;
}

- (unsigned)queryErrorType
{
  return self->_queryErrorType;
}

- (NSError)queryError
{
  return self->_queryError;
}

- (BOOL)wasReversePushAttempted
{
  return self->_wasReversePushAttempted;
}

- (BOOL)hasEmptyResult
{
  return self->_hasEmptyResult;
}

- (NSString)queryReason
{
  return self->_queryReason;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (unint64_t)uriCount
{
  return self->_uriCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryReason, 0);
  objc_storeStrong((id *)&self->_queryError, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end

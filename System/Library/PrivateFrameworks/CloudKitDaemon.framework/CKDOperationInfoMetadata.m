@implementation CKDOperationInfoMetadata

- (CKDOperationInfoMetadata)initWithOperationInfo:(id)a3 lastAttemptDate:(id)a4 retryNumber:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKDOperationInfoMetadata *v12;
  CKDOperationInfoMetadata *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSDate *lastAttemptDate;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *retryNumber;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CKDOperationInfoMetadata;
  v12 = -[CKDOperationInfoMetadata init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operationInfo, a3);
    v16 = objc_msgSend_copy(v10, v14, v15);
    lastAttemptDate = v13->_lastAttemptDate;
    v13->_lastAttemptDate = (NSDate *)v16;

    v20 = objc_msgSend_copy(v11, v18, v19);
    retryNumber = v13->_retryNumber;
    v13->_retryNumber = (NSNumber *)v20;

  }
  return v13;
}

- (CKOperationInfo)operationInfo
{
  return self->_operationInfo;
}

- (NSDate)lastAttemptDate
{
  return self->_lastAttemptDate;
}

- (NSNumber)retryNumber
{
  return self->_retryNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryNumber, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
}

@end

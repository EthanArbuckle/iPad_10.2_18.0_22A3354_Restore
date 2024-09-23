@implementation CKDFetchArchivedRecordsRequestOperationResult

- (CKDFetchArchivedRecordsRequestOperationResult)init
{
  CKDFetchArchivedRecordsRequestOperationResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDFetchArchivedRecordsRequestOperationResult;
  result = -[CKDFetchArchivedRecordsRequestOperationResult init](&v3, sel_init);
  if (result)
    result->_status = 1;
  return result;
}

- (NSData)resultServerChangeTokenData
{
  return self->_resultServerChangeTokenData;
}

- (void)setResultServerChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_resultServerChangeTokenData, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultServerChangeTokenData, 0);
}

@end

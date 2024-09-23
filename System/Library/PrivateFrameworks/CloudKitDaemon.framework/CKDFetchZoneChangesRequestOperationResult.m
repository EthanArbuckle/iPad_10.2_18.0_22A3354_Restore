@implementation CKDFetchZoneChangesRequestOperationResult

- (NSSet)syncObligationZoneIDs
{
  return self->_syncObligationZoneIDs;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setResultServerChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_resultServerChangeTokenData, a3);
}

- (void)setResultClientChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, a3);
}

- (void)setHasPendingArchivedRecords:(BOOL)a3
{
  self->_hasPendingArchivedRecords = a3;
}

- (NSData)resultServerChangeTokenData
{
  return self->_resultServerChangeTokenData;
}

- (NSData)resultClientChangeTokenData
{
  return self->_resultClientChangeTokenData;
}

- (CKDFetchZoneChangesRequestOperationResult)init
{
  CKDFetchZoneChangesRequestOperationResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDFetchZoneChangesRequestOperationResult;
  result = -[CKDFetchZoneChangesRequestOperationResult init](&v3, sel_init);
  if (result)
    result->_status = -1;
  return result;
}

- (BOOL)hasPendingArchivedRecords
{
  return self->_hasPendingArchivedRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncObligationZoneIDs, 0);
  objc_storeStrong((id *)&self->_resultClientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_resultServerChangeTokenData, 0);
}

- (void)setSyncObligationZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_syncObligationZoneIDs, a3);
}

@end

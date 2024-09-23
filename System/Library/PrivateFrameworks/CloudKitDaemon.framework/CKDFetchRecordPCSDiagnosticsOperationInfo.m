@implementation CKDFetchRecordPCSDiagnosticsOperationInfo

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end

@implementation CKDDecryptRecordsOperationInfo

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
}

@end

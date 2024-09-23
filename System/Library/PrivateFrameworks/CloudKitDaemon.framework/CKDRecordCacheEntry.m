@implementation CKDRecordCacheEntry

- (id)description
{
  return (id)MEMORY[0x1E0DE7D20](CKDRecordCacheTable, sel_descriptionOfEntry_, self);
}

- (NSString)rowID
{
  return self->_rowID;
}

- (void)setRowID:(id)a3
{
  objc_storeStrong((id *)&self->_rowID, a3);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (NSNumber)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSNumber)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(id)a3
{
  objc_storeStrong((id *)&self->_databaseScope, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (NSDate)modificationTime
{
  return self->_modificationTime;
}

- (void)setModificationTime:(id)a3
{
  objc_storeStrong((id *)&self->_modificationTime, a3);
}

- (NSData)recordData
{
  return self->_recordData;
}

- (void)setRecordData:(id)a3
{
  objc_storeStrong((id *)&self->_recordData, a3);
}

- (NSSet)knownUserKeys
{
  return self->_knownUserKeys;
}

- (void)setKnownUserKeys:(id)a3
{
  objc_storeStrong((id *)&self->_knownUserKeys, a3);
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_knownUserKeys, 0);
  objc_storeStrong((id *)&self->_recordData, 0);
  objc_storeStrong((id *)&self->_modificationTime, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
}

@end

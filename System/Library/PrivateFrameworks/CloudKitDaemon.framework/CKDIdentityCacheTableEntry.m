@implementation CKDIdentityCacheTableEntry

- (NSNumber)rowid
{
  return self->_rowid;
}

- (void)setRowid:(id)a3
{
  objc_storeStrong((id *)&self->_rowid, a3);
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  return self->_lookupInfo;
}

- (void)setLookupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lookupInfo, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (NSString)dataSeparationHash
{
  return self->_dataSeparationHash;
}

- (void)setDataSeparationHash:(id)a3
{
  objc_storeStrong((id *)&self->_dataSeparationHash, a3);
}

- (CKUserIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_dataSeparationHash, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_rowid, 0);
}

@end

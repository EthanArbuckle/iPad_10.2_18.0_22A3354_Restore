@implementation ECIMAPCopyInfo

- (unsigned)uidValidity
{
  return self->_uidValidity;
}

- (void)setUidValidity:(unsigned int)a3
{
  self->_uidValidity = a3;
}

- (NSDictionary)sourceUIDsToDestinationUIDs
{
  return self->_sourceUIDsToDestinationUIDs;
}

- (void)setSourceUIDsToDestinationUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUIDsToDestinationUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUIDsToDestinationUIDs, 0);
}

@end

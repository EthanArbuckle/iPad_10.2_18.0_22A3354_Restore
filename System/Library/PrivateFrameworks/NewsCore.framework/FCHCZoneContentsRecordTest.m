@implementation FCHCZoneContentsRecordTest

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)unencryptedFields
{
  return self->_unencryptedFields;
}

- (void)setUnencryptedFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)encryptedFields
{
  return self->_encryptedFields;
}

- (void)setEncryptedFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)expectedValues
{
  return self->_expectedValues;
}

- (void)setExpectedValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_encryptedFields, 0);
  objc_storeStrong((id *)&self->_unencryptedFields, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end

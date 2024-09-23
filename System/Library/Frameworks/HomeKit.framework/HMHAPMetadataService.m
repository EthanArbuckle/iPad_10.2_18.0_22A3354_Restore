@implementation HMHAPMetadataService

- (NSString)svcDescription
{
  return self->_svcDescription;
}

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (void)setSvcDescription:(id)a3
{
  objc_storeStrong((id *)&self->_svcDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_svcDescription, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
}

@end

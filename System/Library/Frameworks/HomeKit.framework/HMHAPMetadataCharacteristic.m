@implementation HMHAPMetadataCharacteristic

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (void)setChrDescription:(id)a3
{
  objc_storeStrong((id *)&self->_chrDescription, a3);
}

- (NSString)chrDescription
{
  return self->_chrDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chrDescription, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
}

@end

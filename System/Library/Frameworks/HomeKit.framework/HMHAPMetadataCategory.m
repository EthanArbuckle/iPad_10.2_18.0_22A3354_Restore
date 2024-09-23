@implementation HMHAPMetadataCategory

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (NSString)catDescription
{
  return self->_catDescription;
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setCatDescription:(id)a3
{
  objc_storeStrong((id *)&self->_catDescription, a3);
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_catDescription, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
}

@end

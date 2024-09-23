@implementation IEResponseUndo

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong((id *)&self->_userData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

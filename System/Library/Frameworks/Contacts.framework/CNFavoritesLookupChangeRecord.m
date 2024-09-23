@implementation CNFavoritesLookupChangeRecord

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (int)uid
{
  return self->_uid;
}

- (void)setUid:(int)a3
{
  self->_uid = a3;
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)abDatabaseUUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAbDatabaseUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abDatabaseUUID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end

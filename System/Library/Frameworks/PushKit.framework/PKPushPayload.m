@implementation PKPushPayload

- (PKPushType)type
{
  return (PKPushType)objc_getProperty(self, a2, 8, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSDictionary)dictionaryPayload
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDictionaryPayload:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryPayload, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end

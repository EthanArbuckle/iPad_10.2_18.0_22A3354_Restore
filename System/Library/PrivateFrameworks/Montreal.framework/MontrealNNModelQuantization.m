@implementation MontrealNNModelQuantization

- (MontrealNNModelQuantization)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  MontrealNNModelQuantization *v7;
  uint64_t v8;
  NSString *weightStorage;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *weightStorageRange;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MontrealNNModelQuantization;
  v7 = -[MontrealNNModelQuantization init](&v15, sel_init);
  if (v7)
  {
    objc_msgSend_exMRL_stringForKey_(v4, v5, (uint64_t)off_1EE418B78, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    weightStorage = v7->_weightStorage;
    v7->_weightStorage = (NSString *)v8;

    objc_msgSend_exMRL_numberForKey_(v4, v10, (uint64_t)off_1EE418B80, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    weightStorageRange = v7->_weightStorageRange;
    v7->_weightStorageRange = (NSNumber *)v12;

  }
  return v7;
}

- (NSString)weightStorage
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)weightStorageRange
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightStorageRange, 0);
  objc_storeStrong((id *)&self->_weightStorage, 0);
}

@end

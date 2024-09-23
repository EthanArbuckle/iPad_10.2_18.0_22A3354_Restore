@implementation LKRecoverEMCSOperation

- (LKRecoverEMCSOperation)init
{
  LKRecoverEMCSOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LKRecoverEMCSOperation;
  result = -[LKOperation init](&v3, sel_init);
  if (result)
    result->_recoveredKeychainItemCount = 0;
  return result;
}

- (void)setRecoveredKeychainItemCount:(int64_t)a3
{
  if (self->_recoveredKeychainItemCount != a3)
    self->_recoveredKeychainItemCount = a3;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LKRecoverEMCSOperation;
  -[LKOperation dictionary](&v8, sel_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)-[LKRecoverEMCSOperation recoveredKeychainItemCount](self, "recoveredKeychainItemCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("recoveredKeychainItemCount"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (int64_t)recoveredKeychainItemCount
{
  return self->_recoveredKeychainItemCount;
}

@end

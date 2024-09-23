@implementation IKPlayerMediaItemChangeEventUserInfo

- (IKPlayerMediaItemChangeEventUserInfo)initWithReason:(int64_t)a3
{
  IKPlayerMediaItemChangeEventUserInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKPlayerMediaItemChangeEventUserInfo;
  result = -[IKPlayerMediaItemChangeEventUserInfo init](&v5, sel_init);
  if (result)
    result->_reason = a3;
  return result;
}

- (NSDictionary)properties
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("reason"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (int64_t)reason
{
  return self->_reason;
}

@end

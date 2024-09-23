@implementation IKPlayerDurationDidChangeEventUserInfo

- (IKPlayerDurationDidChangeEventUserInfo)initWithNewDuration:(double)a3
{
  IKPlayerDurationDidChangeEventUserInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKPlayerDurationDidChangeEventUserInfo;
  result = -[IKPlayerDurationDidChangeEventUserInfo init](&v5, sel_init);
  if (result)
    result->_newDuration = a3;
  return result;
}

- (NSDictionary)properties
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_newDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (double)newDuration
{
  return self->_newDuration;
}

@end

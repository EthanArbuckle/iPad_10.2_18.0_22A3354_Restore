@implementation IKPlayerTimeDidChangeEventUserInfo

- (IKPlayerTimeDidChangeEventUserInfo)initWithInterval:(double)a3 elapsedTime:(double)a4
{
  IKPlayerTimeDidChangeEventUserInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IKPlayerTimeDidChangeEventUserInfo;
  result = -[IKPlayerTimeDidChangeEventUserInfo init](&v7, sel_init);
  if (result)
  {
    result->_interval = a3;
    result->_elapsedTime = a4;
  }
  return result;
}

- (NSDictionary)properties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("interval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_elapsedTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("time"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

- (double)interval
{
  return self->_interval;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

@end

@implementation IKPlayerRequestSeekToTimeEventUserInfo

- (IKPlayerRequestSeekToTimeEventUserInfo)initWithRequestedTime:(double)a3 currentTime:(double)a4
{
  IKPlayerRequestSeekToTimeEventUserInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IKPlayerRequestSeekToTimeEventUserInfo;
  result = -[IKPlayerRequestSeekToTimeEventUserInfo init](&v7, sel_init);
  if (result)
  {
    result->_requestedTime = a3;
    result->_currentTime = a4;
    result->_shouldSeek = 1;
    result->_proposedTime = a3;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_requestedTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("requestedTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_currentTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currentTime"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  void *v5;
  double v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isNull"))
  {
    self->_shouldSeek = 0;
  }
  else if (objc_msgSend(v7, "isBoolean"))
  {
    self->_shouldSeek = objc_msgSend(v7, "toBool");
  }
  else if (objc_msgSend(v7, "isNumber"))
  {
    objc_msgSend(v7, "toNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    self->_proposedTime = v6;

  }
}

- (double)requestedTime
{
  return self->_requestedTime;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)shouldSeek
{
  return self->_shouldSeek;
}

- (double)proposedTime
{
  return self->_proposedTime;
}

@end

@implementation IKPlayerShouldChangeToMediaAtIndexEventUserInfo

- (IKPlayerShouldChangeToMediaAtIndexEventUserInfo)initWithIndex:(int64_t)a3
{
  IKPlayerShouldChangeToMediaAtIndexEventUserInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKPlayerShouldChangeToMediaAtIndexEventUserInfo;
  result = -[IKPlayerShouldChangeToMediaAtIndexEventUserInfo init](&v5, sel_init);
  if (result)
  {
    result->_index = a3;
    result->_shouldChange = 1;
  }
  return result;
}

- (NSDictionary)properties
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_index);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("requestedIndex"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (BOOL)expectsReturnValue
{
  return 1;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isNull"))
  {
    self->_shouldChange = 0;
  }
  else if (objc_msgSend(v5, "isBoolean"))
  {
    self->_shouldChange = objc_msgSend(v5, "toBool");
  }

}

- (int64_t)index
{
  return self->_index;
}

- (BOOL)shouldChange
{
  return self->_shouldChange;
}

@end

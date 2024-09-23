@implementation WKFindConfiguration

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKFindConfiguration accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKFindConfiguration accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (WKFindConfiguration)init
{
  WKFindConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKFindConfiguration;
  result = -[WKFindConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_backwards = 0;
    result->_wraps = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setBackwards:", self->_backwards);
  objc_msgSend(v4, "setCaseSensitive:", self->_caseSensitive);
  objc_msgSend(v4, "setWraps:", self->_wraps);
  return v4;
}

- (BOOL)backwards
{
  return self->_backwards;
}

- (void)setBackwards:(BOOL)backwards
{
  self->_backwards = backwards;
}

- (BOOL)caseSensitive
{
  return self->_caseSensitive;
}

- (void)setCaseSensitive:(BOOL)caseSensitive
{
  self->_caseSensitive = caseSensitive;
}

- (BOOL)wraps
{
  return self->_wraps;
}

- (void)setWraps:(BOOL)wraps
{
  self->_wraps = wraps;
}

@end

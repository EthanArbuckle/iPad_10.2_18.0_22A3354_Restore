@implementation CHRecognizerOptions

- (CHRecognizerOptions)init
{
  CHRecognizerOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHRecognizerOptions;
  result = -[CHRecognizerOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_enableCachingIfAvailable = 257;
    result->_enableGen2CharacterLMIfAvailable = 0;
  }
  return result;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (void)setEnableCachingIfAvailable:(BOOL)a3
{
  self->_enableCachingIfAvailable = a3;
}

- (BOOL)enableGen2ModelIfAvailable
{
  return self->_enableGen2ModelIfAvailable;
}

- (void)setEnableGen2ModelIfAvailable:(BOOL)a3
{
  self->_enableGen2ModelIfAvailable = a3;
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  return self->_enableGen2CharacterLMIfAvailable;
}

- (void)setEnableGen2CharacterLMIfAvailable:(BOOL)a3
{
  self->_enableGen2CharacterLMIfAvailable = a3;
}

@end

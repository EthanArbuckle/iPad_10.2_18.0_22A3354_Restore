@implementation DDActionNaturalLanguageContext

- (void)setResult:(__DDResult *)a3
{
  __DDResult *result;

  result = self->_result;
  if (result != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      result = self->_result;
    }
    if (result)
      CFRelease(result);
    self->_result = a3;
  }
}

- (__DDResult)result
{
  return self->_result;
}

- (void)dealloc
{
  __DDResult *result;
  objc_super v4;

  result = self->_result;
  if (result)
    CFRelease(result);
  v4.receiver = self;
  v4.super_class = (Class)DDActionNaturalLanguageContext;
  -[DDActionNaturalLanguageContext dealloc](&v4, sel_dealloc);
}

- (NSString)leadingText
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLeadingText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)trailingText
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrailingText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)associatedResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssociatedResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedResults, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end

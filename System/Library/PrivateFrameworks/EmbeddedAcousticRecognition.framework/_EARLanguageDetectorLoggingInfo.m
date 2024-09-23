@implementation _EARLanguageDetectorLoggingInfo

- (NSDictionary)loggingDict
{
  return self->_loggingDict;
}

- (void)setLoggingDict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_EARLanguageDetectorRequestContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_loggingDict, 0);
}

@end

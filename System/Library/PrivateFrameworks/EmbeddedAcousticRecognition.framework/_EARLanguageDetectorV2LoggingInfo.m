@implementation _EARLanguageDetectorV2LoggingInfo

- (NSDictionary)loggingDict
{
  return self->_loggingDict;
}

- (void)setLoggingDict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingDict, 0);
}

@end

@implementation NSSNewsAnalyticsEnvelopeDescriptor

- (NSSNewsAnalyticsEnvelopeDescriptor)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSNewsAnalyticsEnvelopeDescriptor init]";
    v9 = 2080;
    v10 = "NSSNewsAnalyticsPBEventAccumulator.m";
    v11 = 1024;
    v12 = 32;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NSSNewsAnalyticsEnvelopeDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSSNewsAnalyticsEnvelopeDescriptor)initWithContentType:(int)a3 contentTypeVersion:(int)a4 contentTypeMinorVersion:(int)a5 contentTypePatchVersion:(int)a6
{
  NSSNewsAnalyticsEnvelopeDescriptor *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSNewsAnalyticsEnvelopeDescriptor;
  result = -[NSSNewsAnalyticsEnvelopeDescriptor init](&v11, sel_init);
  if (result)
  {
    result->_contentType = a3;
    result->_contentTypeVersion = a4;
    result->_contentTypeMinorVersion = a5;
    result->_contentTypePatchVersion = a6;
  }
  return result;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)contentTypeVersion
{
  return self->_contentTypeVersion;
}

- (int)contentTypeMinorVersion
{
  return self->_contentTypeMinorVersion;
}

- (int)contentTypePatchVersion
{
  return self->_contentTypePatchVersion;
}

@end

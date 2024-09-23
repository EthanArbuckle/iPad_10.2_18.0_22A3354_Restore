@implementation CDMSpanMatchDataUpdateCommand

- (CDMSpanMatchDataUpdateCommand)initWithUserId:(id)a3
{
  id v5;
  CDMSpanMatchDataUpdateCommand *v6;
  CDMSpanMatchDataUpdateCommand *v7;
  NSObject *v8;
  uint64_t v9;
  SEMSpanMatcher *semSpanMatcher;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMSpanMatchDataUpdateCommand;
  v6 = -[CDMBaseCommand init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userId, a3);
    v8 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "-[CDMSpanMatchDataUpdateCommand initWithUserId:]";
      v15 = 2112;
      v16 = CFSTR("spanmatch");
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nSiriVocabularyProtoSpanMatcher initialized searcher for user: %@", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x24BE92CA8], "indexMatcher");
    v9 = objc_claimAutoreleasedReturnValue();
    semSpanMatcher = v7->_semSpanMatcher;
    v7->_semSpanMatcher = (SEMSpanMatcher *)v9;

  }
  return v7;
}

- (NSString)userId
{
  return self->_userId;
}

- (SEMSpanMatcher)semSpanMatcher
{
  return self->_semSpanMatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semSpanMatcher, 0);
  objc_storeStrong((id *)&self->_userId, 0);
}

@end

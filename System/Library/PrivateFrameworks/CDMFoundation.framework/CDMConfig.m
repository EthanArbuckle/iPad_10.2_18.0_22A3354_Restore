@implementation CDMConfig

- (NSOrderedSet)availableServiceGraphs
{
  return self->_availableServiceGraphs;
}

- (unsigned)maxConcurrentCount
{
  return self->_maxConcurrentCount;
}

- (NSString)defaultLocaleIdentifier
{
  __CFString *v2;

  +[CDMPlatformUtils normalizedAssistantLocaleIdentifier](CDMPlatformUtils, "normalizedAssistantLocaleIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("en_US");
  return (NSString *)v2;
}

- (CDMConfig)init
{
  return -[CDMConfig initWithMaxConcurrentCount:](self, "initWithMaxConcurrentCount:", 0);
}

- (CDMConfig)initWithMaxConcurrentCount:(unsigned int)a3
{
  CDMConfig *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSOrderedSet *availableServiceGraphs;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)CDMConfig;
  v4 = -[CDMConfig init](&v11, sel_init);
  if (v4)
  {
    if (!a3)
    {
      a3 = +[CDMUserDefaultsUtils readGraphRunnerMaxConcurrentCount](CDMUserDefaultsUtils, "readGraphRunnerMaxConcurrentCount");
      CDMOSLoggerForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[CDMConfig initWithMaxConcurrentCount:]";
        v14 = 1024;
        v15 = a3;
        _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s initWithDefaultMaxConcurrentCount=%d", buf, 0x12u);
      }

    }
    v4->_maxConcurrentCount = a3;
    v6 = (void *)MEMORY[0x24BDBCF00];
    v7 = (void *)objc_msgSend(&unk_24DCCCAB8, "copy");
    objc_msgSend(v6, "orderedSetWithArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    availableServiceGraphs = v4->_availableServiceGraphs;
    v4->_availableServiceGraphs = (NSOrderedSet *)v8;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[NSOrderedSet copy](self->_availableServiceGraphs, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableServiceGraphs, 0);
}

+ (id)defaultEnabledServiceGraph
{
  return (id)objc_msgSend(&unk_24DCCCAB8, "copy");
}

@end

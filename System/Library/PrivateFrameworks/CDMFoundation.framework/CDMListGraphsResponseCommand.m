@implementation CDMListGraphsResponseCommand

- (CDMListGraphsResponseCommand)initWithGraphs:(id)a3
{
  id v5;
  CDMListGraphsResponseCommand *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMListGraphsResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  if (v6)
  {
    if (!objc_msgSend(v5, "count"))
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[CDMListGraphsResponseCommand initWithGraphs:]";
        _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Zero service graphs configured? That doesn't sound right! But not going to bail, will just return empty set", buf, 0xCu);
      }

    }
    objc_storeStrong((id *)&v6->_availableServiceGraphs, a3);
  }

  return v6;
}

- (NSOrderedSet)availableServiceGraphs
{
  return self->_availableServiceGraphs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableServiceGraphs, 0);
}

@end

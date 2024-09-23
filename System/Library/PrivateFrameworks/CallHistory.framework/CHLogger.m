@implementation CHLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
}

- (CHLogger)initWithDomain:(const char *)a3
{
  CHLogger *v4;
  void *v5;
  uint64_t v6;
  OS_os_log *logHandle;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHLogger;
  v4 = -[CHLogger init](&v9, sel_init);
  if (v4)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandleForDomain:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    logHandle = v4->_logHandle;
    v4->_logHandle = (OS_os_log *)v6;

  }
  return v4;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

@end

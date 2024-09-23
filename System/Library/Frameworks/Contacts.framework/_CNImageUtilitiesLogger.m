@implementation _CNImageUtilitiesLogger

- (_CNImageUtilitiesLogger)init
{
  _CNImageUtilitiesLogger *v2;
  os_log_t v3;
  OS_os_log *log;
  _CNImageUtilitiesLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNImageUtilitiesLogger;
  v2 = -[_CNImageUtilitiesLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts", "CNImageUtilities");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end

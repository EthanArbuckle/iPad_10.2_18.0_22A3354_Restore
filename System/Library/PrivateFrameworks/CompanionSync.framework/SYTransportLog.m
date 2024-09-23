@implementation SYTransportLog

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  return (id)sharedInstance___singleton_0;
}

void __32__SYTransportLog_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___singleton_0;
  sharedInstance___singleton_0 = v0;

}

- (SYTransportLog)init
{
  SYTransportLog *v2;
  SYTransportLog *v3;
  SYTransportLog *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SYTransportLog;
  v2 = -[SYTransportLog init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SYTransportLog _createLog](v2, "_createLog");
    v4 = v3;
  }

  return v3;
}

- (void)_createLog
{
  OS_os_log *v3;
  OS_os_log *log;

  v3 = (OS_os_log *)os_log_create("com.apple.companionsync", "transport-errors");
  log = self->_log;
  self->_log = v3;

}

- (void)logMessage:(id)a3
{
  uint64_t v3;

  -[SYTransportLog logMessage:args:](self, "logMessage:args:", a3, &v3);
}

- (void)logMessage:(id)a3 args:(char *)a4
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  os_log_with_args();
}

- (void)_logOSMessage:(const char *)a3 args:(char *)a4 returnAddress:(void *)a5
{
  os_log_with_args();
}

- (NSString)facility
{
  return self->_facility;
}

- (void)setFacility:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_os_log)oslog
{
  return self->_oslog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oslog, 0);
  objc_storeStrong((id *)&self->_facility, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end

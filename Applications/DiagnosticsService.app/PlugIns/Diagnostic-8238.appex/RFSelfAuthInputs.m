@implementation RFSelfAuthInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  os_log_s *v5;
  uint64_t v6;
  char v8;
  uint8_t buf[4];
  id v10;

  v4 = a3;
  v8 = 0;
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Validating parmaeters: %@", buf, 0xCu);
  }
  if (v4)
    v6 = (uint64_t)objc_msgSend(v4, "ds_BOOLFromKey:defaultValue:failed:", CFSTR("addAPTagToTicket"), 1, &v8);
  else
    v6 = 1;
  -[RFSelfAuthInputs setAddAPTagToTicket:](self, "setAddAPTagToTicket:", v6);

  return 1;
}

- (BOOL)addAPTagToTicket
{
  return self->_addAPTagToTicket;
}

- (void)setAddAPTagToTicket:(BOOL)a3
{
  self->_addAPTagToTicket = a3;
}

@end

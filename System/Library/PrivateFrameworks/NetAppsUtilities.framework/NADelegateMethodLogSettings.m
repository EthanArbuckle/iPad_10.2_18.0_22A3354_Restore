@implementation NADelegateMethodLogSettings

- (id)formattedDescriptionForArgument:(id)a3
{
  void (**argumentFormatter)(id, id);

  argumentFormatter = (void (**)(id, id))self->_argumentFormatter;
  if (argumentFormatter)
    argumentFormatter[2](argumentFormatter, a3);
  else
    objc_msgSend(a3, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)logger
{
  return self->_logger;
}

- (OS_os_log)log
{
  return self->_log;
}

- (unsigned)logType
{
  return self->_logType;
}

- (NADelegateMethodLogSettings)initWithLog:(id)a3 logType:(unsigned __int8)a4 argumentFormatter:(id)a5
{
  id v9;
  id v10;
  NADelegateMethodLogSettings *v11;
  NADelegateMethodLogSettings *v12;
  uint64_t v13;
  id argumentFormatter;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NADelegateMethodLogSettings;
  v11 = -[NADelegateMethodLogSettings init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_log, a3);
    v12->_logType = a4;
    v13 = objc_msgSend(v10, "copy");
    argumentFormatter = v12->_argumentFormatter;
    v12->_argumentFormatter = (id)v13;

  }
  return v12;
}

- (NADelegateMethodLogSettings)init
{

  return 0;
}

- (id)argumentFormatter
{
  return self->_argumentFormatter;
}

- (void)setLogger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logger, 0);
  objc_storeStrong(&self->_argumentFormatter, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end

@implementation CUDashboardClient

- (int)activate
{
  return 0;
}

- (int)logJSON:(id)a3
{
  return 0;
}

- (int)logf:(const char *)a3
{
  return 0;
}

- (int)logv:(const char *)a3 args:(char *)a4
{
  return 0;
}

- (int)_logCStr:(const char *)a3 length:(unint64_t)a4
{
  return 0;
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

@end

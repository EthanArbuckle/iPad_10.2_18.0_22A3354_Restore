@implementation NWAppStateTracker

- (int)pid
{
  return self->_pid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWAppStateTracker, pid %d, uuid %@ display identifier %@"), self->_pid, self->_uuid, self->_identifier);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

@end

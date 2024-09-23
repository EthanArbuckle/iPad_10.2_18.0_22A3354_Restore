@implementation ADLogManagerHandler

- (id)name
{
  return 0;
}

- (int64_t)setLogFolder:(id)a3
{
  return 0;
}

- (int64_t)setHostName:(id)a3
{
  return 0;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)humanReadableFormat
{
  return self->_humanReadableFormat;
}

- (void)setHumanReadableFormat:(BOOL)a3
{
  self->_humanReadableFormat = a3;
}

@end

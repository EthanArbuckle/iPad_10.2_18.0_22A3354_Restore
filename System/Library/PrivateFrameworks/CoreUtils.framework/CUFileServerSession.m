@implementation CUFileServerSession

- ($D4BEE395F4A64DEBBB6B5EAEC9CA68BF)dirStream
{
  return self->_dirStream;
}

- (void)setDirStream:(id *)a3
{
  self->_dirStream = a3;
}

- (unint64_t)lastRequestTicks
{
  return self->_lastRequestTicks;
}

- (void)setLastRequestTicks:(unint64_t)a3
{
  self->_lastRequestTicks = a3;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_sessionID = a3;
}

@end

@implementation MAProgressNotification

- (int64_t)totalExpected
{
  return self->_totalExpected;
}

- (void)setTotalExpected:(int64_t)a3
{
  self->_totalExpected = a3;
}

- (int64_t)totalWritten
{
  return self->_totalWritten;
}

- (void)setTotalWritten:(int64_t)a3
{
  self->_totalWritten = a3;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (double)expectedTimeRemaining
{
  return self->_expectedTimeRemaining;
}

- (void)setExpectedTimeRemaining:(double)a3
{
  self->_expectedTimeRemaining = a3;
}

- (NSString)taskDescription
{
  return self->_taskDescription;
}

- (void)setTaskDescription:(id)a3
{
  objc_storeStrong((id *)&self->_taskDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskDescription, 0);
}

@end

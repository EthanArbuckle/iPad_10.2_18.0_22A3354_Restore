@implementation DADeviceConnectionCancelTestCommand

- (int64_t)commandType
{
  return 1;
}

- (NSNumber)testID
{
  return self->_testID;
}

- (void)setTestID:(id)a3
{
  objc_storeStrong((id *)&self->_testID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testID, 0);
}

@end

@implementation DADeviceConnectionStartTestCommand

- (int64_t)commandType
{
  return 0;
}

- (NSNumber)testID
{
  return self->_testID;
}

- (void)setTestID:(id)a3
{
  objc_storeStrong((id *)&self->_testID, a3);
}

- (DKDiagnosticParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_testID, 0);
}

@end

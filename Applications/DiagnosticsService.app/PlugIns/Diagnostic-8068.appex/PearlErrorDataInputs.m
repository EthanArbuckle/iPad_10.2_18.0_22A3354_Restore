@implementation PearlErrorDataInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v9;

  v9 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("testType"), &off_1000043C8, &off_1000043E0, &v9));
  -[PearlErrorDataInputs setTestType:](self, "setTestType:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("frameCount"), &off_1000043F8, &off_100004410, &off_100004428, &v9));
  -[PearlErrorDataInputs setFrameCount:](self, "setFrameCount:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("timeout"), &off_1000044D0, &off_1000044E0, &off_1000044F0, &v9));
  -[PearlErrorDataInputs setTimeout:](self, "setTimeout:", v7);

  return v9 == 0;
}

- (NSNumber)testType
{
  return self->_testType;
}

- (void)setTestType:(id)a3
{
  objc_storeStrong((id *)&self->_testType, a3);
}

- (NSNumber)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(id)a3
{
  objc_storeStrong((id *)&self->_frameCount, a3);
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_timeout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_frameCount, 0);
  objc_storeStrong((id *)&self->_testType, 0);
}

@end

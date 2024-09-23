@implementation TouchIDSensorSPIBusIntegrityInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("numberOfRuns"), &off_100004430, &off_100004448, &v8));
  -[TouchIDSensorSPIBusIntegrityInputs setNumberOfRuns:](self, "setNumberOfRuns:", objc_msgSend(v5, "intValue"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("runDelay"), &off_100004460, &off_100004470, &v8));
  objc_msgSend(v6, "doubleValue");
  -[TouchIDSensorSPIBusIntegrityInputs setRunDelay:](self, "setRunDelay:");

  return v8 == 0;
}

- (int)numberOfRuns
{
  return self->_numberOfRuns;
}

- (void)setNumberOfRuns:(int)a3
{
  self->_numberOfRuns = a3;
}

- (double)runDelay
{
  return self->_runDelay;
}

- (void)setRunDelay:(double)a3
{
  self->_runDelay = a3;
}

@end

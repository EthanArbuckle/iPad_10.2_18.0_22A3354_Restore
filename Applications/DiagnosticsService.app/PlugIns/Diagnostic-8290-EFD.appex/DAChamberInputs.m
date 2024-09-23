@implementation DAChamberInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v12 = 0;
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Validating parameters: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("detectChamberReady"), &off_10001D628, &off_10001D640, &off_10001D640, &v12));
  -[DAChamberInputs setDetectChamberSensor:](self, "setDetectChamberSensor:", objc_msgSend(v7, "intValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("ALSThreshold"), &off_10001D628, &off_10001D658, &off_10001D670, &v12));
  -[DAChamberInputs setDetectChamberReadyALSThreshold:](self, "setDetectChamberReadyALSThreshold:", objc_msgSend(v8, "intValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("closeChamberCountdown"), &off_10001D688, &off_10001D6A0, &off_10001D6B8, &v12));
  -[DAChamberInputs setDetectChamberReadyWaitTime:](self, "setDetectChamberReadyWaitTime:", objc_msgSend(v9, "intValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("testCompleteAlertTime"), &off_10001D688, &off_10001D6A0, &off_10001D6D0, &v12));
  -[DAChamberInputs setTestCompleteAlertTime:](self, "setTestCompleteAlertTime:", objc_msgSend(v10, "intValue"));

  -[DAChamberInputs setTestCompleteVibrationAlertEnabled:](self, "setTestCompleteVibrationAlertEnabled:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("vibrationAlert"), 1, &v12));
  -[DAChamberInputs setTestCompleteChimeAlertEnabled:](self, "setTestCompleteChimeAlertEnabled:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("chimeAlert"), 1, &v12));

  return 1;
}

- (int)detectChamberSensor
{
  return self->_detectChamberSensor;
}

- (void)setDetectChamberSensor:(int)a3
{
  self->_detectChamberSensor = a3;
}

- (unsigned)detectChamberReadyWaitTime
{
  return self->_detectChamberReadyWaitTime;
}

- (void)setDetectChamberReadyWaitTime:(unsigned int)a3
{
  self->_detectChamberReadyWaitTime = a3;
}

- (unsigned)detectChamberReadyALSThreshold
{
  return self->_detectChamberReadyALSThreshold;
}

- (void)setDetectChamberReadyALSThreshold:(unsigned int)a3
{
  self->_detectChamberReadyALSThreshold = a3;
}

- (BOOL)testCompleteVibrationAlertEnabled
{
  return self->_testCompleteVibrationAlertEnabled;
}

- (void)setTestCompleteVibrationAlertEnabled:(BOOL)a3
{
  self->_testCompleteVibrationAlertEnabled = a3;
}

- (BOOL)testCompleteChimeAlertEnabled
{
  return self->_testCompleteChimeAlertEnabled;
}

- (void)setTestCompleteChimeAlertEnabled:(BOOL)a3
{
  self->_testCompleteChimeAlertEnabled = a3;
}

- (unsigned)testCompleteAlertTime
{
  return self->_testCompleteAlertTime;
}

- (void)setTestCompleteAlertTime:(unsigned int)a3
{
  self->_testCompleteAlertTime = a3;
}

@end

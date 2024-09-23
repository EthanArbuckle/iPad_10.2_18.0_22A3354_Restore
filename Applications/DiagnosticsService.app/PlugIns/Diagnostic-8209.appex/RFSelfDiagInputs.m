@implementation RFSelfDiagInputs

- (id)commandDescription
{
  unsigned int v2;

  v2 = -[RFSelfDiagInputs command](self, "command");
  if (v2 > 3)
    return CFSTR("Unkown command");
  else
    return *(&off_100010400 + (int)v2);
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  os_log_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v13 = 0;
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Validating parmaeters: %@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ds_numberFromKey:defaultValue:failed:", CFSTR("command"), &off_1000109B8, &v13));
  -[RFSelfDiagInputs setCommand:](self, "setCommand:", objc_msgSend(v6, "intValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ds_numberFromKey:defaultValue:failed:", CFSTR("measureType"), &off_1000109D0, &v13));
  -[RFSelfDiagInputs setMeasureType:](self, "setMeasureType:", objc_msgSend(v7, "intValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ds_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("detectChamberReady"), &off_1000109B8, &off_1000109E8, &off_1000109E8, &v13));
  -[RFSelfDiagInputs setDetectChamberSensor:](self, "setDetectChamberSensor:", objc_msgSend(v8, "intValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ds_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("ALSThreshold"), &off_1000109B8, &off_100010A00, &off_100010A18, &v13));
  -[RFSelfDiagInputs setDetectChamberReadyALSThreshold:](self, "setDetectChamberReadyALSThreshold:", objc_msgSend(v9, "intValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ds_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("closeChamberCountdown"), &off_100010A30, &off_100010A48, &off_100010A60, &v13));
  -[RFSelfDiagInputs setDetectChamberReadyWaitTime:](self, "setDetectChamberReadyWaitTime:", objc_msgSend(v10, "intValue"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ds_numberFromKey:defaultValue:failed:", CFSTR("testCompleteAlertTime"), &off_100010A78, &v13));
  -[RFSelfDiagInputs setTestCompleteAlertTime:](self, "setTestCompleteAlertTime:", objc_msgSend(v11, "intValue"));

  -[RFSelfDiagInputs setTestCompleteVibrationAlertEnabled:](self, "setTestCompleteVibrationAlertEnabled:", objc_msgSend(v4, "ds_BOOLFromKey:defaultValue:failed:", CFSTR("vibrationAlert"), 1, &v13));
  -[RFSelfDiagInputs setTestCompleteChimeAlertEnabled:](self, "setTestCompleteChimeAlertEnabled:", objc_msgSend(v4, "ds_BOOLFromKey:defaultValue:failed:", CFSTR("chimeAlert"), 1, &v13));

  return 1;
}

- (int)command
{
  return self->_command;
}

- (void)setCommand:(int)a3
{
  self->_command = a3;
}

- (unsigned)measureType
{
  return self->_measureType;
}

- (void)setMeasureType:(unsigned int)a3
{
  self->_measureType = a3;
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

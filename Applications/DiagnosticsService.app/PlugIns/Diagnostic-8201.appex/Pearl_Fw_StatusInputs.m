@implementation Pearl_Fw_StatusInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configurationTimeForStreamInSec")));
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "intValue");
  else
    v7 = -1;
  self->_configurationTimeForStreamInSec = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ = %d"), CFSTR("configurationTimeForStreamInSec"), self->_configurationTimeForStreamInSec));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 37, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("diagnosticCasesMask")));
  if (v11 && !objc_msgSend(v11, "compare:options:range:", CFSTR("0x"), 1, 0, 2))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v11));
    v32 = 0;
    objc_msgSend(v12, "scanHexInt:", &v32);
    self->_diagnosticCasesMask = v32;

  }
  else
  {
    self->_diagnosticCasesMask = -1;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ = %d"), CFSTR("diagnosticCasesMask"), self->_diagnosticCasesMask));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 61, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preemtingWaitInMicroSec")));
  if (v16)
    v17 = objc_msgSend(v16, "intValue");
  else
    v17 = 2000000;
  self->_preemtingWaitInMicroSec = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ = %d"), CFSTR("diagnosticCasesMask"), self->_preemtingWaitInMicroSec));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 72, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useADControl")));
  if (v21)
    v22 = objc_msgSend(v21, "intValue");
  else
    v22 = 1;
  self->_useADControl = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ = %d"), CFSTR("useADControl"), self->_useADControl));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 83, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useHighPriority")));
  if (v26)
    v27 = objc_msgSend(v26, "intValue");
  else
    v27 = 0;
  self->_useHighPriority = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ = %d"), CFSTR("useHighPriority"), self->_useHighPriority));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 94, v30);

  return 1;
}

- (int)configurationTimeForStreamInSec
{
  return self->_configurationTimeForStreamInSec;
}

- (void)setConfigurationTimeForStreamInSec:(int)a3
{
  self->_configurationTimeForStreamInSec = a3;
}

- (int)diagnosticCasesMask
{
  return self->_diagnosticCasesMask;
}

- (void)setDiagnosticCasesMask:(int)a3
{
  self->_diagnosticCasesMask = a3;
}

- (int)useADControl
{
  return self->_useADControl;
}

- (void)setUseADControl:(int)a3
{
  self->_useADControl = a3;
}

- (int)preemtingWaitInMicroSec
{
  return self->_preemtingWaitInMicroSec;
}

- (void)setPreemtingWaitInMicroSec:(int)a3
{
  self->_preemtingWaitInMicroSec = a3;
}

- (int)useHighPriority
{
  return self->_useHighPriority;
}

- (void)setUseHighPriority:(int)a3
{
  self->_useHighPriority = a3;
}

@end

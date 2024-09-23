@implementation RGBJDKDiagnosticInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  float v13;
  void *v14;

  v4 = a3;
  NSLog(CFSTR("validateAndInitializeParameters: key=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sessionTimeOut")));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
    self->_sessionTimeOut = (int)v7;
    NSLog(CFSTR("validateAndInitializeParameters: sessionTimeOut=%d"), v7);
  }
  else
  {
    self->_sessionTimeOut = 0;
    NSLog(CFSTR("validateAndInitializeParameters: _sessionTimeOut is missing"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sceneErrorTimeOut")));

  if (v8)
  {
    v9 = objc_msgSend(v8, "intValue");
    self->_sceneErrorTimeOut = (int)v9;
    NSLog(CFSTR("validateAndInitializeParameters: _sceneErrorTimeOut=%d"), v9);
  }
  else
  {
    self->_sceneErrorTimeOut = 0;
    NSLog(CFSTR("validateAndInitializeParameters: _sceneErrorTimeOut is missing"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("userNotMovingTimeout")));

  if (v10)
  {
    v11 = objc_msgSend(v10, "intValue");
    self->_userNotMovingTimeout = v11;
    NSLog(CFSTR("validateAndInitializeParameters: _userNotMovingTimeout=%d"), v11);
  }
  else
  {
    self->_userNotMovingTimeout = 0;
    NSLog(CFSTR("validateAndInitializeParameters: _userNotMovingTimeout is missing"));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("noMovementAttitudeChangeMinThreshold")));

  if (v12)
  {
    objc_msgSend(v12, "floatValue");
    self->_noMovementAttitudeChangeMinThreshold = v13;
    NSLog(CFSTR("validateAndInitializeParameters: _sceneErrorTimeOut=%f"), v13);
  }
  else
  {
    self->_noMovementAttitudeChangeMinThreshold = 0.0;
    NSLog(CFSTR("validateAndInitializeParameters: _sceneErrorTimeOut is missing"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("skipSummaryScreen")));

  if (v14)
  {
    self->_skipSummaryScreen = objc_msgSend(v14, "BOOLValue");
    NSLog(CFSTR("validateAndInitializeParameters: received skipSummaryScreen parameter, skipSummaryScreen=%d"), objc_msgSend(v14, "BOOLValue"));
  }
  else
  {
    self->_skipSummaryScreen = 1;
    NSLog(CFSTR("validateAndInitializeParameters: skipSummaryScreen is missing, setting to true"));
  }

  return 1;
}

- (int)sessionTimeOut
{
  return self->_sessionTimeOut;
}

- (void)setSessionTimeOut:(int)a3
{
  self->_sessionTimeOut = a3;
}

- (int)sceneErrorTimeOut
{
  return self->_sceneErrorTimeOut;
}

- (void)setSceneErrorTimeOut:(int)a3
{
  self->_sceneErrorTimeOut = a3;
}

- (unsigned)userNotMovingTimeout
{
  return self->_userNotMovingTimeout;
}

- (void)setUserNotMovingTimeout:(unsigned int)a3
{
  self->_userNotMovingTimeout = a3;
}

- (float)noMovementAttitudeChangeMinThreshold
{
  return self->_noMovementAttitudeChangeMinThreshold;
}

- (void)setNoMovementAttitudeChangeMinThreshold:(float)a3
{
  self->_noMovementAttitudeChangeMinThreshold = a3;
}

- (BOOL)skipSummaryScreen
{
  return self->_skipSummaryScreen;
}

- (void)setSkipSummaryScreen:(BOOL)a3
{
  self->_skipSummaryScreen = a3;
}

@end

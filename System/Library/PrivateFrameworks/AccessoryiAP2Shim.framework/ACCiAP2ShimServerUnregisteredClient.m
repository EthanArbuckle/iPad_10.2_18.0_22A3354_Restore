@implementation ACCiAP2ShimServerUnregisteredClient

- (ACCiAP2ShimServerUnregisteredClient)initWithBundleId:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACCiAP2ShimServerUnregisteredClient;
  return -[ACCiAP2ShimServerUnregisteredClient init](&v4, sel_init, a3);
}

- (void)takeProcessAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSString *bundleId;
  NSObject *v12;
  id v13;
  NSString *v14;
  int v15;
  NSString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_processAssertion)
  {
LABEL_7:
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      bundleId = self->_bundleId;
      v15 = 138412546;
      v16 = bundleId;
      v17 = 1024;
      v18 = -[ACCiAP2ShimServerUnregisteredClient _getProcessId](self, "_getProcessId");
      _os_log_impl(&dword_217DCB000, v10, OS_LOG_TYPE_INFO, "[#ServerClient] creating process assertion - appId=%@ pid=%d", (uint8_t *)&v15, 0x12u);
    }

    -[ACCiAP2ShimServerUnregisteredClient _getProcessId](self, "_getProcessId");
    self->_processAssertion = (SBSProcessAssertion *)SBSProcessAssertionCreateForPID();
    self->_processAssertionStartTime = time(0);
    goto LABEL_35;
  }
  if (time(0) - self->_processAssertionStartTime >= 3)
  {
    if (self->_processAssertion)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v5 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v14 = self->_bundleId;
        v15 = 138412546;
        v16 = v14;
        v17 = 1024;
        v18 = -[ACCiAP2ShimServerUnregisteredClient _getProcessId](self, "_getProcessId");
        _os_log_impl(&dword_217DCB000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] renewing process assertion - appId=%@ pid=%d", (uint8_t *)&v15, 0x12u);
      }

      self->_processAssertionStartTime = 0;
      goto LABEL_35;
    }
    goto LABEL_7;
  }
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_217DCB000, v12, OS_LOG_TYPE_INFO, "[#ServerClient] using ea process hysteresis", (uint8_t *)&v15, 2u);
  }

LABEL_35:
}

- (void)releaseProcessAssertion
{
  SBSProcessAssertion *processAssertion;
  SBSProcessAssertion **p_processAssertion;

  p_processAssertion = &self->_processAssertion;
  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    CFRelease(processAssertion);
    *p_processAssertion = 0;
    p_processAssertion[1] = 0;
  }
}

- (id)_applicationInfoForBundleIDSync:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _getApplicationStateMonitor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationInfoForApplication:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)_getProcessId
{
  int result;
  void *v4;
  void *v5;
  int v6;

  result = self->_processId;
  if (result == -1)
  {
    self->_processId = 0;
    if (self->_bundleId)
    {
      -[ACCiAP2ShimServerUnregisteredClient _applicationInfoForBundleIDSync:](self, "_applicationInfoForBundleIDSync:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE0B4F0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedIntegerValue");

      self->_processId = v6;
      return self->_processId;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int)processId
{
  return self->_processId;
}

- (SBSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (int64_t)processAssertionStartTime
{
  return self->_processAssertionStartTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)takeProcessAssertion:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217DCB000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end

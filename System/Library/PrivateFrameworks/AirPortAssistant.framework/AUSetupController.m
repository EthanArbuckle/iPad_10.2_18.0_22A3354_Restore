@implementation AUSetupController

+ (void)initialize
{
  if (qword_2550F4D28 != -1)
    dispatch_once(&qword_2550F4D28, &unk_24DD07250);
}

- (AUSetupController)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)AUSetupController;
  v6 = -[AssistantCallbackController init](&v33, sel_init);
  if (v6)
  {
    *((_QWORD *)v6 + 7) = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    sub_21A6DCF44((uint64_t *)v6 + 5, v7, v8, v9, v10, v11, v12, v13);
    sub_21A6DD49C(*((_QWORD *)v6 + 5), (uint64_t)sub_21A6A7E60, (uint64_t)v6, v14, v15, v16, v17, v18);
    v19 = *((_QWORD *)v6 + 5);
    v22 = objc_msgSend_assistantCallback(v6, v20, v21);
    sub_21A6DD54C(v19, v22, (uint64_t)v6, v23, v24, v25, v26, v27);
    *((_BYTE *)v6 + 88) = 1;
    v30 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v28, v29);
    objc_msgSend_addObserver_selector_name_object_(v30, v31, (uint64_t)v6, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
  }
  if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController init]", 800, (uint64_t)"\n", v2, v3, v4, v5, (uint64_t)v33.receiver);
  return (AUSetupController *)v6;
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  objc_msgSend_closeAllConnections_(self, a2, 1);
  objc_msgSend_setLastDNSName_(self, v3, 0);
  objc_msgSend_setLastSystemName_(self, v4, 0);
  objc_msgSend_setAutoGuessSetupRecommendation_(self, v5, 0);
  objc_msgSend_setLastInstrumentation_(self, v6, 0);

  v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v7, v8);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, *MEMORY[0x24BDF7528], 0);
  v11.receiver = self;
  v11.super_class = (Class)AUSetupController;
  -[AssistantCallbackController dealloc](&v11, sel_dealloc);
}

- (int)closeAllConnections:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BSConfigurationContext *configContext;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v7 = a3;
  if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController closeAllConnections:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v25);
  if (!objc_msgSend_activeTask(self, a2, a3) || v7)
  {
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x24BEDCDF0], v9, (uint64_t)self, sel_handleCopyAllSettingsUpdateThread_, 0);
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x24BEDCDF0], v10, (uint64_t)self, sel_handleSettingsUpdate_, 0);

    self->_setupDelegates = 0;
    objc_sync_enter(self);
    configContext = self->_configContext;
    if (configContext)
    {
      sub_21A6DD49C((uint64_t)configContext, 0, 0, v11, v12, v13, v14, v15);
      v7 = sub_21A6DD070((uint64_t)self->_configContext, v17, v18, v19, v20, v21, v22, v23);
      self->_configContext = 0;
    }
    else
    {
      v7 = 0;
    }
    objc_sync_exit(self);

    self->_lastHeardFromDevice = 0;
  }
  return v7;
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  objc_msgSend_closeAllConnections_(self, a2, 1);
}

- (int)closeAllConnections
{
  return objc_msgSend_closeAllConnections_(self, a2, 0);
}

- (int)subclassAssistantCallback:(AssistantCallbackContext *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  AssistantCallbackContext *v39;
  AssistantCallbackContext *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  AssistantCallbackContext *callbackContext;
  BOOL v48;
  void *v49;
  const char *v50;
  uint64_t v52;
  void *v53;

  if (!a3)
  {
    LODWORD(v13) = -6705;
    return v13;
  }
  v52 = 0;
  v53 = 0;
  sub_21A70B0B0((uint64_t)a3, (uint64_t)CFSTR("kBSAssistantCallback_Configuration_UIConfigSelector"), &v53, v3, v4, v5, v6, v7);
  v12 = v13;
  LODWORD(v13) = 0;
  if (!v12 && v53)
  {
    v14 = objc_msgSend_integerValue(v53, v10, v11);
    if (sub_21A70B1D4((uint64_t)a3, CFSTR("kBSAssistantCallback_Configuration_UIConfigParamDict")))
    {
      sub_21A70B0B0((uint64_t)a3, (uint64_t)CFSTR("kBSAssistantCallback_Configuration_UIConfigParamDict"), &v52, v17, v18, v19, v20, v21);
      if ((_DWORD)v13)
        return v13;
      if (!v52)
        goto LABEL_38;
    }
    else
    {
      v52 = 0;
    }
    if ((v14 - 1) >= 6)
    {
      if ((v14 - 7) >= 2)
      {
        LODWORD(v13) = -6705;
        return v13;
      }
      if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController subclassAssistantCallback:]", 800, (uint64_t)"selector: %d paramDict: %@\n", v18, v19, v20, v21, v14);
      v13 = objc_msgSend_uiConfigDelegate(self, v15, v16);
      if (v13)
      {
        objc_msgSend_uiConfigDelegate(self, v43, v44);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          callbackContext = self->super._callbackContext;
          if (callbackContext)
            v48 = callbackContext == a3;
          else
            v48 = 1;
          if (!v48)
            goto LABEL_43;
          self->super._callbackContext = a3;
          v49 = (void *)objc_msgSend_uiConfigDelegate(self, v45, v46);
          objc_msgSend_setupUIConfigPrompt_paramDict_forController_(v49, v50, v14, v52, self);
        }
LABEL_42:
        LODWORD(v13) = 0;
      }
    }
    else
    {
      sub_21A70B0B0((uint64_t)a3, (uint64_t)CFSTR("kBSAssistantCallback_Configuration_UIConfigConnectionStatusOSStatus"), &v53, v17, v18, v19, v20, v21);
      if (!(_DWORD)v13)
      {
        if (!v53)
        {
LABEL_38:
          LODWORD(v13) = -6728;
          return v13;
        }
        v30 = objc_msgSend_integerValue(v53, v22, v23);
        if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController subclassAssistantCallback:]", 800, (uint64_t)"selector: %d status: %ld paramDict: %@\n", v26, v27, v28, v29, v14);
        if (!objc_msgSend_uiConfigDelegate(self, v24, v25)
          || (objc_msgSend_uiConfigDelegate(self, v31, v32), (objc_opt_respondsToSelector() & 1) == 0))
        {
          if ((_DWORD)v30)
            sub_21A70B2E0(a3, -6757, v32, v33, v34, v35, v36, v37);
          goto LABEL_42;
        }
        v39 = self->super._callbackContext;
        if (!v39 || v39 == a3)
        {
          if ((_DWORD)v30)
            v40 = a3;
          else
            v40 = 0;
          self->super._callbackContext = v40;
          v41 = (void *)objc_msgSend_uiConfigDelegate(self, v38, v32);
          objc_msgSend_setupUIConfigConnectionStatusUpdated_status_paramDict_forController_(v41, v42, v14, v30, v52, self);
          goto LABEL_42;
        }
LABEL_43:
        LODWORD(v13) = -6721;
      }
    }
  }
  return v13;
}

+ (id)setupController
{
  return objc_alloc_init(AUSetupController);
}

- (int)cancelTask
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6DD384(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return -6720;
}

- (int)cancelSetup
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6DD23C((uint64_t)configContext, 0, v2, v3, v4, v5, v6, v7);
  else
    return -6720;
}

- (int)setValue:(id)a3 forBSSetting:(int)a4
{
  BSConfigurationContext *configContext;
  int result;
  uint64_t v8;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  v8 = 0;
  result = sub_21A6DEFF0((uint64_t)configContext, &v8);
  if (!result)
  {
    if (v8)
      return sub_21A6D42C8(v8, a4, (const __CFString *)a3);
    else
      return -6728;
  }
  return result;
}

- (int)copyValue:(id *)a3 forBSSetting:(int)a4
{
  BSConfigurationContext *configContext;
  int result;
  uint64_t v8;

  if (!a3)
    return -6705;
  *a3 = 0;
  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  if (!a4)
    return -6705;
  v8 = 0;
  result = sub_21A6DEFF0((uint64_t)configContext, &v8);
  if (!result)
  {
    if (v8)
      return sub_21A6D4430(v8, a4, (CFMutableDictionaryRef *)a3);
    else
      return -6728;
  }
  return result;
}

- (int)getValue:(id *)a3 forBSSetting:(int)a4
{
  int v5;
  id v6;

  v5 = objc_msgSend_copyValue_forBSSetting_(self, a2, (uint64_t)a3, *(_QWORD *)&a4);
  if (!v5)
    v6 = *a3;
  return v5;
}

- (int)setValue:(id)a3 forSettingPath:(id)a4
{
  BSConfigurationContext *configContext;
  int result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  v12 = 0;
  result = sub_21A6DEFF0((uint64_t)configContext, &v12);
  if (!result)
  {
    v10 = v12;
    if (v12)
    {
      v11 = (char *)objc_msgSend_UTF8String(a4, v8, v9);
      return sub_21A6D40A0(v10, v11, (const __CFString *)a3);
    }
    else
    {
      return -6728;
    }
  }
  return result;
}

- (int)copyValue:(id *)a3 forSettingPath:(id)a4
{
  BSConfigurationContext *configContext;
  int result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  if (!a3)
    return -6705;
  *a3 = 0;
  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  if (!a4)
    return -6705;
  v12 = 0;
  result = sub_21A6DEFF0((uint64_t)configContext, &v12);
  if (!result)
  {
    v10 = v12;
    if (v12)
    {
      v11 = (char *)objc_msgSend_UTF8String(a4, v8, v9);
      return sub_21A6D4328(v10, v11, (CFMutableDictionaryRef *)a3);
    }
    else
    {
      return -6728;
    }
  }
  return result;
}

- (int)getValue:(id *)a3 forSettingPath:(id)a4
{
  int v5;
  id v6;

  v5 = objc_msgSend_copyValue_forSettingPath_(self, a2, (uint64_t)a3, a4);
  if (!v5)
    v6 = *a3;
  return v5;
}

- (BOOL)hasACPFeature:(unsigned int)a3
{
  BSConfigurationContext *configContext;
  _BOOL8 v6;

  configContext = self->_configContext;
  if (configContext)
  {
    v6 = 0;
    if (sub_21A6DEFF0((uint64_t)configContext, &v6))
    {
      LOBYTE(configContext) = 0;
    }
    else
    {
      LOBYTE(configContext) = v6;
      if (v6)
        LOBYTE(configContext) = sub_21A6D4724(v6, a3);
    }
  }
  return (char)configContext;
}

- (int)stateForProblem:(unsigned int)a3
{
  BSConfigurationContext *configContext;
  int v5;
  BOOL v7;
  _BOOL8 v8;

  configContext = self->_configContext;
  if (configContext)
  {
    v8 = 0;
    v7 = 0;
    v5 = sub_21A6DEFF0((uint64_t)configContext, &v8);
    LODWORD(configContext) = 0;
    if (!v5)
    {
      LODWORD(configContext) = v8;
      if (v8)
      {
        LODWORD(configContext) = sub_21A6D4724(v8, 1400460148);
        if ((_DWORD)configContext)
        {
          LODWORD(configContext) = sub_21A6D4750(v8, a3, &v7);
          if ((_DWORD)configContext)
          {
            if (v7)
              LODWORD(configContext) = 1;
            else
              LODWORD(configContext) = 2;
          }
        }
      }
    }
  }
  return (int)configContext;
}

- (int64_t)unignoredProblemCount
{
  BSConfigurationContext *configContext;
  int64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const __CFString *v29;
  CFMutableDictionaryRef v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  configContext = self->_configContext;
  if (!configContext)
    return 0;
  v30 = 0;
  v31 = 0;
  v4 = 0;
  if (sub_21A6DEFF0((uint64_t)configContext, &v31))
    return v4;
  if (!v31)
    return 0;
  if (!sub_21A6D4724(v31, 1400460148))
  {
    v29 = 0;
    sub_21A6DF418((uint64_t *)self->_configContext, &v29);
    if (v29)
      return sub_21A68F050(v29, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  v4 = 0;
  if (!sub_21A6D4430(v31, 1937331060, &v30) && v30)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = (void *)objc_msgSend_objectForKey_(v30, v5, (uint64_t)CFSTR("problems"), 0);
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, v32, 16);
    if (v8)
    {
      v10 = v8;
      v4 = 0;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v6);
          v13 = objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v25 + 1) + 8 * i), v9, (uint64_t)CFSTR("code"));
          v15 = sub_21A6912CC(v13, v14);
          if (objc_msgSend_stateForProblem_(self, v16, (uint64_t)v15) == 2)
            ++v4;
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v25, v32, 16);
      }
      while (v10);
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)validateAllSettingsAndGetErrors
{
  id result;
  int v3;
  int v4;
  id v5;
  id v6;
  void *v7;

  v6 = 0;
  result = self->_configContext;
  if (result)
  {
    v7 = 0;
    v3 = sub_21A6DEFF0((uint64_t)result, &v7);
    result = 0;
    if (!v3)
    {
      result = v7;
      if (v7)
      {
        v4 = sub_21A6D4B5C((uint64_t)v7, (__CFArray **)&v6);
        result = v6;
        if (v4 != -6727)
        {
          if (v6)
          {
            v5 = v6;
            return v6;
          }
        }
      }
    }
  }
  return result;
}

- (id)validateSettingsAndGetErrors:(id)a3
{
  id result;
  int v5;
  int v6;
  id v7;
  id v8;
  int v9[2];

  v8 = 0;
  result = self->_configContext;
  if (result)
  {
    *(_QWORD *)v9 = 0;
    v5 = sub_21A6DEFF0((uint64_t)result, v9);
    result = 0;
    if (!v5)
    {
      result = *(id *)v9;
      if (*(_QWORD *)v9)
      {
        v6 = sub_21A6D4830(*(uint64_t *)v9, (const __CFString *)a3, (__CFArray **)&v8);
        result = v8;
        if (v6 != -6727)
        {
          if (v8)
          {
            v7 = v8;
            return v8;
          }
        }
      }
    }
  }
  return result;
}

- (int)ignoreProblemCode:(unsigned int)a3
{
  BSConfigurationContext *configContext;
  int result;
  uint64_t v6;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  v6 = 0;
  result = sub_21A6DEFF0((uint64_t)configContext, &v6);
  if (!result)
  {
    if (v6)
      return sub_21A6D4774(v6, a3);
    else
      return -6728;
  }
  return result;
}

- (int)unIgnoreProblemCode:(unsigned int)a3
{
  BSConfigurationContext *configContext;
  int result;
  uint64_t v6;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  v6 = 0;
  result = sub_21A6DEFF0((uint64_t)configContext, &v6);
  if (!result)
  {
    if (v6)
      return sub_21A6D4788(v6, a3);
    else
      return -6728;
  }
  return result;
}

- (NSString)keychainBasePassword
{
  NSString *keychainBasePassword;

  objc_sync_enter(self);
  keychainBasePassword = self->_keychainBasePassword;
  objc_sync_exit(self);
  return keychainBasePassword;
}

- (NSString)keychainWiFiPassword
{
  NSString *keychainWiFiPassword;

  objc_sync_enter(self);
  keychainWiFiPassword = self->_keychainWiFiPassword;
  objc_sync_exit(self);
  return keychainWiFiPassword;
}

- (NSString)keychainDiskPassword
{
  NSString *keychainDiskPassword;

  objc_sync_enter(self);
  keychainDiskPassword = self->_keychainDiskPassword;
  objc_sync_exit(self);
  return keychainDiskPassword;
}

- (void)setKeychainBasePassword:(id)a3
{
  NSString *keychainBasePassword;
  BOOL v4;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  keychainBasePassword = self->_keychainBasePassword;
  if (keychainBasePassword)
    v4 = keychainBasePassword == a3;
  else
    v4 = 0;
  if (!v4)
  {
    objc_sync_enter(self);
    v7 = a3;

    self->_keychainBasePassword = (NSString *)a3;
    if (objc_msgSend_length(a3, v8, v9))
    {
      v12 = objc_msgSend_rememberBasePassword(self, v10, v11);
      objc_msgSend_setRememberBasePassword_(self, v13, v12);
    }
    else
    {
      objc_msgSend_setRememberBasePassword_(self, v10, 0);
    }
    objc_sync_exit(self);
  }
}

- (void)setKeychainWiFiPassword:(id)a3
{
  NSString *keychainWiFiPassword;
  BOOL v4;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;

  keychainWiFiPassword = self->_keychainWiFiPassword;
  if (keychainWiFiPassword)
    v4 = keychainWiFiPassword == a3;
  else
    v4 = 0;
  if (!v4)
  {
    objc_sync_enter(self);
    if (objc_msgSend_length(a3, v7, v8))
      v11 = objc_msgSend_length(self->_keychainWiFiPassword, v9, v10) == 0;
    else
      v11 = 0;
    v12 = a3;

    self->_keychainWiFiPassword = (NSString *)a3;
    if (v11)
    {
      objc_msgSend_setRememberWiFiPassword_(self, v13, 1);
    }
    else if (objc_msgSend_length(a3, v13, v14))
    {
      v17 = objc_msgSend_rememberWiFiPassword(self, v15, v16);
      objc_msgSend_setRememberWiFiPassword_(self, v18, v17);
    }
    else
    {
      objc_msgSend_setRememberWiFiPassword_(self, v15, 0);
    }
    objc_sync_exit(self);
  }
}

- (void)setKeychainDiskPassword:(id)a3
{
  NSString *keychainDiskPassword;
  BOOL v4;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  keychainDiskPassword = self->_keychainDiskPassword;
  if (keychainDiskPassword)
    v4 = keychainDiskPassword == a3;
  else
    v4 = 0;
  if (!v4)
  {
    objc_sync_enter(self);
    v7 = a3;

    self->_keychainDiskPassword = (NSString *)a3;
    if (objc_msgSend_length(a3, v8, v9))
    {
      v12 = objc_msgSend_rememberDiskPassword(self, v10, v11);
      objc_msgSend_setRememberDiskPassword_(self, v13, v12);
    }
    else
    {
      objc_msgSend_setRememberDiskPassword_(self, v10, 0);
    }
    objc_sync_exit(self);
  }
}

- (int)joinAsync
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_21A6DF460((uint64_t)self->_configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int)joinAndBrowseAsync
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_21A6DF6E8((uint64_t)self->_configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (int)readAllPropertiesFromBaseAsync
{
  return MEMORY[0x24BEDD108](self, sel_readPropertyListFromBaseAsync_, 0);
}

- (int)readPropertyListFromBaseAsync:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;
  int result;
  const char *v11;
  uint64_t v12;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  result = sub_21A6DFA44((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v11, v12);
    result = 0;
    self->_performingManualRead = 1;
  }
  return result;
}

- (int)updateSettingsAsync
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;
  int result;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  result = sub_21A6DFCEC((uint64_t)configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v11, v12);
    objc_msgSend_setupWiFiState(self, v13, v14);
    return 0;
  }
  return result;
}

- (id)snapshotChangedKeys
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  id result;
  id v6;
  id v7;

  v7 = 0;
  v3 = objc_msgSend_bsRef(self, a2, v2);
  v4 = sub_21A6D468C(v3, (const __CFArray **)&v7);
  result = v7;
  if (!v4)
  {
    if (v7)
    {
      v6 = v7;
      return v7;
    }
  }
  return result;
}

- (void)snapshotResetAll
{
  uint64_t v2;
  uint64_t v3;

  v3 = objc_msgSend_bsRef(self, a2, v2);
  sub_21A6D46B0(v3);
}

- (BOOL)snapshotDirty
{
  uint64_t v2;
  uint64_t v3;

  v3 = objc_msgSend_bsRef(self, a2, v2);
  return sub_21A6D46A0(v3);
}

- (int)snapshotPush
{
  uint64_t v2;
  uint64_t v3;

  v3 = objc_msgSend_bsRef(self, a2, v2);
  return sub_21A6D46C0(v3);
}

- (int)snapshotPop:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_msgSend_bsRef(self, a2, a3);
  return sub_21A6D46D0(v4, v3);
}

- (id)bestKeychainMACAddress
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int Value_forBSSetting;
  id result;
  const char *v9;
  void *v10;

  v10 = 0;
  if ((!objc_msgSend_getValue_forBSSetting_(self, a2, (uint64_t)&v10, 2002865473)
     && objc_msgSend_length(v10, v3, v4)
     && !objc_msgSend_isEqualToString_(v10, v3, (uint64_t)CFSTR("00:00:00:00:00:00"))
     || (v10 = 0, !objc_msgSend_getValue_forBSSetting_(self, v3, (uint64_t)&v10, 1918979393)))
    && objc_msgSend_length(v10, v3, v5)
    && !objc_msgSend_isEqualToString_(v10, v3, (uint64_t)CFSTR("00:00:00:00:00:00"))
    || (v10 = 0,
        Value_forBSSetting = objc_msgSend_getValue_forBSSetting_(self, v3, (uint64_t)&v10, 1818316097),
        result = 0,
        !Value_forBSSetting))
  {
    result = (id)objc_msgSend_length(v10, v3, v6);
    if (result)
    {
      if (objc_msgSend_isEqualToString_(v10, v9, (uint64_t)CFSTR("00:00:00:00:00:00")))
        return 0;
      else
        return v10;
    }
  }
  return result;
}

- (id)allKeychainMACAddresses
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v13;
  const char *v14;
  void *v15;

  v4 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v15 = 0;
  if (!objc_msgSend_getValue_forBSSetting_(self, v5, (uint64_t)&v15, 2002865473)
    && objc_msgSend_length(v15, v6, v7)
    && (objc_msgSend_isEqualToString_(v15, v6, (uint64_t)CFSTR("00:00:00:00:00:00")) & 1) == 0)
  {
    objc_msgSend_addObject_(v4, v6, (uint64_t)v15);
  }
  v15 = 0;
  if (!objc_msgSend_getValue_forBSSetting_(self, v6, (uint64_t)&v15, 1918979393)
    && objc_msgSend_length(v15, v8, v9)
    && (objc_msgSend_isEqualToString_(v15, v8, (uint64_t)CFSTR("00:00:00:00:00:00")) & 1) == 0)
  {
    objc_msgSend_addObject_(v4, v8, (uint64_t)v15);
  }
  v15 = 0;
  if (!objc_msgSend_getValue_forBSSetting_(self, v8, (uint64_t)&v15, 1818316097)
    && objc_msgSend_length(v15, v10, v11)
    && (objc_msgSend_isEqualToString_(v15, v13, (uint64_t)CFSTR("00:00:00:00:00:00")) & 1) == 0)
  {
    objc_msgSend_addObject_(v4, v14, (uint64_t)v15);
  }
  return v4;
}

- (void)updateRememberKeychainFlagsIfInitializing
{
  uint64_t v2;
  const char *v4;

  if (!self->_initializedBasePasswordFlag)
  {
    if (objc_msgSend_bonjourRecord(self, a2, v2))
    {
      self->_initializedBasePasswordFlag = 1;
      objc_msgSend_updateRememberKeychainFlagsButSkipBasePassword_(self, v4, 0);
    }
  }
}

- (void)updateRememberKeychainFlagsButSkipBasePassword:(BOOL)a3
{
  if (!a3)
    objc_msgSend_loadKeychainBasePassword(self, a2, a3);
  MEMORY[0x24BEDD108](self, sel_loadKeychainWirelessPassword, a3);
}

- (int)updateKeychainWithPasswordsWithStatus:(int)a3
{
  if (a3 != -16)
    return objc_msgSend_updateKeychainWithPasswords(self, a2, *(uint64_t *)&a3);
  objc_msgSend_deleteKeychainBasePassword(self, a2, *(uint64_t *)&a3);
  return 0;
}

- (int)updateKeychainWithPasswords
{
  uint64_t v2;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
  {
    v4 = objc_msgSend_rememberBasePassword(self, a2, v2);
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController updateKeychainWithPasswords]", 800, (uint64_t)"self.rememberBasePassword %d\n", v5, v6, v7, v8, v4);
  }
  if (objc_msgSend_rememberBasePassword(self, a2, v2))
    objc_msgSend_saveKeychainBasePassword(self, v9, v10);
  return 0;
}

- (void)loadKeychainBasePassword
{
  uint64_t *configContext;
  _QWORD block[6];
  CFTypeRef v5;

  v5 = 0;
  objc_sync_enter(self);
  configContext = (uint64_t *)self->_configContext;
  if (configContext && !sub_21A6DF418(configContext, &v5) && v5)
  {
    CFRetain(v5);
    objc_sync_exit(self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21A6A9970;
    block[3] = &unk_24DD07278;
    block[4] = self;
    block[5] = v5;
    dispatch_group_async((dispatch_group_t)qword_2550F4D38, (dispatch_queue_t)qword_2550F4D30, block);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (void)saveKeychainBasePassword
{
  uint64_t v2;
  BSConfigurationContext *configContext;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD block[8];
  uint64_t v29;
  uint64_t v30;
  void *v31;

  if (objc_msgSend_rememberBasePassword(self, a2, v2))
  {
    v30 = 0;
    v31 = 0;
    v29 = 0;
    objc_sync_enter(self);
    configContext = self->_configContext;
    if (!configContext || sub_21A6DEFF0((uint64_t)configContext, &v29) || !v29)
      goto LABEL_4;
    v13 = (void *)objc_msgSend_bestKeychainMACAddress(self, v5, v6);
    if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController saveKeychainBasePassword]", 800, (uint64_t)"macAddress: %@ err: %#m\n", v9, v10, v11, v12, (uint64_t)v13);
    if (!objc_msgSend_length(v13, v7, v8)
      || objc_msgSend_getValue_forBSSetting_(self, v14, (uint64_t)&v31, 1937330263)
      || (v17 = v31) == 0)
    {
LABEL_4:
      objc_sync_exit(self);
      return;
    }
    if (dword_2550EEDA8 <= 800)
    {
      if (dword_2550EEDA8 != -1)
      {
LABEL_18:
        v18 = objc_msgSend_length(v17, v15, v16);
        sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController saveKeychainBasePassword]", 800, (uint64_t)"password (length): %ld err: %#m\n", v19, v20, v21, v22, v18);
        goto LABEL_19;
      }
      if (sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u))
      {
        v17 = v31;
        goto LABEL_18;
      }
    }
LABEL_19:
    if (!objc_msgSend_getValue_forBSSetting_(self, v15, (uint64_t)&v30, 1937329773))
    {
      v27 = v30;
      if (v30)
      {
        if (dword_2550EEDA8 <= 800)
        {
          if (dword_2550EEDA8 != -1)
          {
LABEL_25:
            sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController saveKeychainBasePassword]", 800, (uint64_t)"name: %@ err: %#m\n", v23, v24, v25, v26, v27);
            goto LABEL_26;
          }
          if (sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u))
          {
            v27 = v30;
            goto LABEL_25;
          }
        }
LABEL_26:
        objc_sync_exit(self);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_21A6A9BDC;
        block[3] = &unk_24DD072A0;
        block[4] = v31;
        block[5] = self;
        block[6] = v13;
        block[7] = v30;
        dispatch_group_async((dispatch_group_t)qword_2550F4D38, (dispatch_queue_t)qword_2550F4D30, block);
        return;
      }
    }
    goto LABEL_4;
  }
}

- (void)deleteKeychainBasePassword
{
  uint64_t *configContext;
  _QWORD block[6];
  CFTypeRef v5;

  v5 = 0;
  objc_sync_enter(self);
  configContext = (uint64_t *)self->_configContext;
  if (configContext && !sub_21A6DF418(configContext, &v5) && v5)
  {
    CFRetain(v5);
    objc_sync_exit(self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21A6A9D60;
    block[3] = &unk_24DD07278;
    block[4] = self;
    block[5] = v5;
    dispatch_group_async((dispatch_group_t)qword_2550F4D38, (dispatch_queue_t)qword_2550F4D30, block);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (void)loadKeychainWirelessPassword
{
  BSConfigurationContext *configContext;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[8];
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v16 = 0;
  v17 = 0;
  v14 = 0;
  v15 = 0;
  objc_sync_enter(self);
  configContext = self->_configContext;
  if (configContext
    && !sub_21A6DEFF0((uint64_t)configContext, &v17)
    && v17
    && (sub_21A6D6A04(v17),
        v4 = sub_21A691214(1918979693),
        !objc_msgSend_getValue_forSettingPath_(self, v5, (uint64_t)&v16, v4))
    && v16
    && objc_msgSend_length(v16, v6, v7)
    && !objc_msgSend_getValue_forBSSetting_(self, v8, (uint64_t)&v14, 1651717454)
    && v14
    && (!objc_msgSend_BOOLValue(v14, v9, v10)
     || (sub_21A6D69F0(v17),
         v11 = sub_21A691214(1918979693),
         !objc_msgSend_getValue_forSettingPath_(self, v12, (uint64_t)&v15, v11))
     && v15))
  {
    objc_sync_exit(self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_21A6A9F10;
    v13[3] = &unk_24DD072A0;
    v13[4] = v16;
    v13[5] = v14;
    v13[6] = v15;
    v13[7] = self;
    dispatch_group_async((dispatch_group_t)qword_2550F4D38, (dispatch_queue_t)qword_2550F4D30, v13);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (void)deleteKeychainWirelessPassword
{
  BSConfigurationContext *configContext;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[8];
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  objc_sync_enter(self);
  configContext = self->_configContext;
  if (!configContext
    || sub_21A6DEFF0((uint64_t)configContext, &v15)
    || !v15
    || objc_msgSend_getValue_forBSSetting_(self, v4, (uint64_t)&v12, 1651717454)
    || !v12
    || (sub_21A6D6A04(v15),
        v5 = sub_21A691214(1918979693),
        objc_msgSend_getValue_forSettingPath_(self, v6, (uint64_t)&v14, v5))
    || !v14
    || objc_msgSend_BOOLValue(v12, v7, v8)
    && ((sub_21A6D69F0(v15),
         v9 = sub_21A691214(1918979693),
         objc_msgSend_getValue_forSettingPath_(self, v10, (uint64_t)&v13, v9))
     || !v13))
  {
    objc_sync_exit(self);
  }
  else
  {
    objc_sync_exit(self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_21A6AA164;
    v11[3] = &unk_24DD072A0;
    v11[4] = v14;
    v11[5] = v12;
    v11[6] = v13;
    v11[7] = self;
    dispatch_group_async((dispatch_group_t)qword_2550F4D38, (dispatch_queue_t)qword_2550F4D30, v11);
  }
}

- (int)rpcSystemInterfacesAsync
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D7CD0(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (int)rpcStartRemoteBrowse:(id)a3 withService:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D7EE8((uint64_t)configContext, (uint64_t)a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7);
  else
    return -6718;
}

- (int)rpcRefreshBSSettingAsync:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D82E0((uint64_t)configContext, a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (int)rpcDisconnectAllDiskUsersWithMessageAsync:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D85F4((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (int)rpcRenewDHCPLeaseAsync
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D8884(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (int)rpcWPSStartAsync:(BOOL)a3 dayPass:(BOOL)a4 timeout:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D8A18((uint64_t)configContext, a3, a4, *(uint64_t *)&a5, *(uint64_t *)&a5, v5, v6, v7);
  else
    return -6718;
}

- (int)rpcWPSStopAsync
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D8D3C(configContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (int)rpcWPSAllowClientAsync:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    return sub_21A6D9040((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (int)taskState
{
  BSConfigurationContext *configContext;
  int v4;

  v4 = 0;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_21A6D7B90((uint64_t)configContext, &v4);
    LODWORD(configContext) = v4;
  }
  return (int)configContext;
}

- (unsigned)taskCode
{
  uint64_t v2;
  unsigned int v5;

  v5 = 0;
  if (!self->_configContext || objc_msgSend_taskState(self, a2, v2) != 6)
    return 0;
  sub_21A6D7B54((uint64_t)self->_configContext, &v5);
  return v5;
}

- (int)busyState
{
  BSConfigurationContext *configContext;
  int v4;

  v4 = 0;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_21A6D7CA8((uint64_t)configContext, &v4);
    LODWORD(configContext) = v4;
  }
  return (int)configContext;
}

- (int)taskRestartAsync
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int result;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  if (!self->_configContext)
    return -6718;
  objc_msgSend_setActiveTask_(self, a2, 1);
  result = sub_21A6D9354((uint64_t)self->_configContext, v3, v4, v5, v6, v7, v8, v9);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v11, v12);
    objc_msgSend_setupWiFiState(self, v13, v14);
    return 0;
  }
  return result;
}

- (int)taskRestoreDefaultsAsync:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int result;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  if (!self->_configContext)
    return -6718;
  v3 = a3;
  objc_msgSend_setActiveTask_(self, a2, 1);
  result = sub_21A6DA190((uint64_t)self->_configContext, v3, v5, v6, v7, v8, v9, v10);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v12, v13);
    objc_msgSend_setupWiFiState(self, v14, v15);
    return 0;
  }
  return result;
}

- (int)taskUploadFirmwareAsync:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int result;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  if (!self->_configContext)
    return -6718;
  if (!a3)
    return -6705;
  objc_msgSend_setActiveTask_(self, a2, 1);
  result = sub_21A6DAFBC((uint64_t)self->_configContext, (CFDataRef)a3, v5, v6, v7, v8, v9, v10);
  if (!result)
  {
    objc_msgSend_handleBusyStart(self, v12, v13);
    objc_msgSend_setupWiFiState(self, v14, v15);
    return 0;
  }
  return result;
}

- (int)taskEraseDiskAsync:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  if (a3)
    return sub_21A6DC1A0((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  return -6705;
}

- (int)taskArchiveDiskAsync:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  if (a3)
    return sub_21A6DC780((uint64_t)configContext, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  return -6705;
}

- (int)setMonitorForChanges:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_configContext)
    return sub_21A6E257C((dispatch_group_t *)self->_configContext, a3, self->_busy, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (BOOL)isMonitoring
{
  BSConfigurationContext *configContext;
  char v4;

  v4 = 0;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_21A6E2674((uint64_t)configContext, &v4);
    LOBYTE(configContext) = v4 != 0;
  }
  return (char)configContext;
}

- (NSDate)lastHeardFromDevice
{
  return self->_lastHeardFromDevice;
}

- (BOOL)rememberBasePassword
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL result;
  BSConfigurationContext *configContext;
  char v11;

  result = 1;
  v11 = 1;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_21A6DF038((uint64_t)configContext, &v11, v2, v3, v4, v5, v6, v7);
    return v11 != 0;
  }
  return result;
}

- (void)setRememberBasePassword:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    sub_21A6DF0D4((uint64_t)configContext, a3, a3, v3, v4, v5, v6, v7);
}

- (BOOL)rememberWiFiPassword
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL result;
  BSConfigurationContext *configContext;
  char v11;

  result = 1;
  v11 = 1;
  configContext = self->_configContext;
  if (configContext)
  {
    sub_21A6DF170((uint64_t)configContext, &v11, v2, v3, v4, v5, v6, v7);
    return v11 != 0;
  }
  return result;
}

- (void)setRememberWiFiPassword:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (configContext)
    sub_21A6DF20C((uint64_t)configContext, a3, a3, v3, v4, v5, v6, v7);
}

- (NSDictionary)bonjourRecord
{
  NSDictionary *result;
  NSDictionary *v3;

  v3 = 0;
  result = (NSDictionary *)self->_configContext;
  if (result)
  {
    sub_21A6DF418((uint64_t *)result, &v3);
    return v3;
  }
  return result;
}

- (void)setBonjourRecord:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  _BOOL4 needToNilBonjour;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController setBonjourRecord:]", 800, (uint64_t)"record: %@\n", v3, v4, v5, v6, (uint64_t)a3);
  if (self->_configContext)
  {
    objc_sync_enter(self);
    if (a3)
    {
      self->_needToNilBonjour = 0;
LABEL_8:
      v16 = objc_msgSend_taskState(self, v9, v10);
      if (v16 == 6 || !v16)
        sub_21A6DCE04((uint64_t)self->_configContext, (const __CFString *)a3);
      goto LABEL_21;
    }
    if (!self->_busy)
    {
      self->_needToNilBonjour = 0;
LABEL_23:
      v19 = sub_21A6DD23C((uint64_t)self->_configContext, 1, v10, v11, v12, v13, v14, v15);
      if (dword_2550EEDA8 <= 800)
      {
        v24 = v19;
        if (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u))
          sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController setBonjourRecord:]", 800, (uint64_t)"err: %#m\n", v20, v21, v22, v23, v24);
      }
      goto LABEL_8;
    }
    v17 = objc_msgSend_taskState(self, v9, v10);
    needToNilBonjour = v17 != 0;
    self->_needToNilBonjour = needToNilBonjour;
    if (!v17 || dword_2550EEDA8 > 800)
    {
LABEL_20:
      if (needToNilBonjour)
      {
LABEL_21:
        objc_sync_exit(self);
        return;
      }
      goto LABEL_23;
    }
    if (dword_2550EEDA8 == -1)
    {
      if (!sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u))
      {
LABEL_19:
        needToNilBonjour = self->_needToNilBonjour;
        goto LABEL_20;
      }
      needToNilBonjour = self->_needToNilBonjour;
    }
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController setBonjourRecord:]", 800, (uint64_t)"_needToNilBonjour: %d\n", v12, v13, v14, v15, needToNilBonjour);
    goto LABEL_19;
  }
}

- (BOOL)dirty
{
  BSConfigurationContext *configContext;
  int v3;
  uint64_t v5;
  char v6;

  configContext = self->_configContext;
  if (configContext)
  {
    v6 = 0;
    v5 = 0;
    v3 = sub_21A6DEFF0((uint64_t)configContext, &v5);
    LOBYTE(configContext) = 0;
    if (!v3)
    {
      LOBYTE(configContext) = v5;
      if (v5)
      {
        if (sub_21A6D3F38(v5, &v6))
          LOBYTE(configContext) = 0;
        else
          LOBYTE(configContext) = v6 != 0;
      }
    }
  }
  return (char)configContext;
}

- (_BaseStation)bsRef
{
  _BaseStation *result;
  _BaseStation *v3;

  v3 = 0;
  result = (_BaseStation *)self->_configContext;
  if (result)
  {
    sub_21A6DEFF0((uint64_t)result, &v3);
    return v3;
  }
  return result;
}

- (int64_t)ethernetPortCount
{
  const char *v2;
  uint64_t v3;
  int Value_forBSSetting;
  int64_t result;
  uint64_t v6;
  void *v7;

  v7 = 0;
  Value_forBSSetting = objc_msgSend_getValue_forBSSetting_(self, a2, (uint64_t)&v7, 1937326416);
  result = 0;
  if (!Value_forBSSetting)
  {
    v6 = objc_msgSend_integerValue(v7, v2, v3);
    return sub_21A671268(v6);
  }
  return result;
}

- (void)setupUIConfigResult:(int)a3 withOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AssistantCallbackContext *callbackContext;
  int v11;
  AssistantCallbackContext *v12;

  callbackContext = self->super._callbackContext;
  if (callbackContext)
  {
    if (!a4
      || (v11 = sub_21A70B204((uint64_t)callbackContext, (uint64_t)CFSTR("kBSAssistantCallback_Configuration_UIConfigResultsDict"), (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7)) == 0)
    {
      v11 = a3;
    }
    v12 = self->super._callbackContext;
    if (v12)
      sub_21A70B2E0(v12, v11, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  self->super._callbackContext = 0;
}

- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int result;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  const char *v43;
  int v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  int v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  BSConfigurationContext *configContext;
  void *v71;
  const char *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  const char *v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;

  if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController setupFromAutoguessRecommendation:withOptions:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v120);
  if (!self->_configContext)
    return -6718;
  if (!a3)
    return -6705;
  v11 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  objc_msgSend_setAutoGuessSetupRecommendation_(self, v12, v11);
  if (!self->_autoGuessSetupRecommendation)
    return -6727;
  v15 = a4
      ? objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v13, (uint64_t)a4)
      : objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v13, v14);
  v18 = (void *)v15;
  v19 = objc_msgSend_objectForKey_(a3, v16, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  v21 = objc_msgSend_objectForKey_(a3, v20, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  if (!(v19 | v21))
    return -6727;
  v23 = v21;
  v24 = objc_msgSend_objectForKey_(a3, v22, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBaseSettings"));
  v32 = v24;
  if (v19)
  {
    if (!v24)
      return -6727;
  }
  if (v19)
    objc_msgSend_setObject_forKey_(v18, v25, v19, CFSTR("kBSAutoGuessSetupOptionKey_TargetBase"));
  if (v32)
    objc_msgSend_setObject_forKey_(v18, v25, v32, CFSTR("kBSAutoGuessSetupOptionKey_TargetSettings"));
  if (v23)
    objc_msgSend_setObject_forKey_(v18, v25, v23, CFSTR("kBSAutoGuessSetupOptionKey_TargetNetwork"));
  if (v19)
  {
    v33 = sub_21A68E368((const __CFString *)v19, (uint64_t)v25, v26, v27, v28, v29, v30, v31);
    v41 = sub_21A68E344(v19, v34, v35, v36, v37, v38, v39, v40);
  }
  else
  {
    v33 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v25, v23);
    v41 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v43, v23);
  }
  v44 = v41;
  v45 = (void *)objc_msgSend_objectForKey_(a4, v42, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_BaseName"));
  if (objc_msgSend_length(v45, v46, v47))
  {
    if (!v45)
      return -6727;
  }
  else
  {
    v45 = (void *)sub_21A69154C(v33, v44);
    if (!objc_msgSend_length(v45, v49, v50))
      v45 = (void *)sub_21A691584(v33, v44);
    if (!v45)
      return -6727;
    objc_msgSend_setObject_forKey_(v18, v51, (uint64_t)v45, CFSTR("kBSAutoGuessSetupOptionKey_BaseName"));
  }
  if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v48, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendWirelessly")) & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v52, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWireless")))
  {
    v53 = (void *)objc_msgSend_objectForKey_(a4, v52, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_ExtendOption_JoinApple"));
    v56 = objc_msgSend_BOOLValue(v53, v54, v55);
    v58 = objc_msgSend_objectForKey_(a3, v57, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
    if (v58)
      objc_msgSend_setObject_forKey_(v18, v59, v58, CFSTR("kBSAutoGuessSetupOptionKey_SourceBase"));
    if (v56)
      v65 = 7;
    else
      v65 = 6;
    goto LABEL_46;
  }
  if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v52, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendOverEthernet")) & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v66, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWired")))
  {
    v67 = objc_msgSend_objectForKey_(a3, v66, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
    if (v67)
      objc_msgSend_setObject_forKey_(v18, v68, v67, CFSTR("kBSAutoGuessSetupOptionKey_SourceBase"));
    v65 = 8;
    goto LABEL_46;
  }
  if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v66, (uint64_t)CFSTR("BSSetupRecommend_OfferCreate")) & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v81, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceSourceIsUnconfigurable")))
  {
    v82 = (void *)objc_msgSend_objectForKey_(a4, v81, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_SkipInternetTests"));
    objc_msgSend_BOOLValue(v82, v83, v84);
    result = sub_21A6DF2A8((uint64_t)self->_configContext, 1, v85, v86, v87, v88, v89, v90);
    if (result)
      return result;
    if (objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v91, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceSourceIsUnconfigurable")))
    {
      v93 = objc_msgSend_objectForKey_(a3, v92, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
      if (v93)
      {
        objc_msgSend_setObject_forKey_(v18, v94, v93, CFSTR("kBSAutoGuessSetupOptionKey_SourceBase"));
        v65 = 12;
        goto LABEL_46;
      }
      return -6727;
    }
    v65 = 1;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v81, (uint64_t)CFSTR("BSSetupRecommend_OfferJoinNetwork")) & 1) != 0|| objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v95, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseNetworkToJoin")))
    {
      v96 = objc_msgSend_objectForKey_(a3, v95, (uint64_t)CFSTR("BSAutoGuess_SourceNetwork"));
      if (v96)
        objc_msgSend_setObject_forKey_(v18, v97, v96, CFSTR("kBSAutoGuessSetupOptionKey_SourceNetwork"));
      if ((v44 & 0xFFFFFFFE) == 2
        && !objc_msgSend_objectForKey_(v18, v97, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_BasePassword")))
      {
        result = sub_21A6DF0D4((uint64_t)self->_configContext, 0, v98, v99, v100, v101, v102, v103);
        if (result)
          return result;
      }
      else
      {
        result = sub_21A6DF2A8((uint64_t)self->_configContext, 1, v98, v99, v100, v101, v102, v103);
        if (result)
          return result;
      }
      v65 = 2;
      goto LABEL_46;
    }
    if (objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v95, (uint64_t)CFSTR("BSSetupRecommend_OfferRestore")))
    {
      v106 = (void *)objc_msgSend_objectForKey_(a4, v104, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_ConfigChangeLogDict"));
      if (v106)
        objc_msgSend_setObject_forKey_(v18, v105, (uint64_t)v106, CFSTR("kBSAutoGuessSetupOptionKey_ConfigChangeLogDict"));
      if (objc_msgSend_objectForKey_(v106, v105, (uint64_t)CFSTR("device")))
        objc_msgSend_setObject_forKey_(v18, v107, (uint64_t)v45, CFSTR("kBSAutoGuessSetupOptionKey_BaseName"));
      v65 = 3;
      goto LABEL_46;
    }
    if (!objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v104, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceConfiguration")))
    {
      if (!objc_msgSend_isEqualToString_(self->_autoGuessSetupRecommendation, v108, (uint64_t)CFSTR("BSSetupRecommend_OfferReplace")))return -6735;
      v118 = objc_msgSend_objectForKey_(a3, v117, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
      if (!v118)
        return -6727;
      objc_msgSend_setObject_forKey_(v18, v119, v118, CFSTR("kBSAutoGuessSetupOptionKey_SourceBase"));
      v65 = 9;
      goto LABEL_46;
    }
    v109 = objc_msgSend_objectForKey_(a4, v108, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_ConfigChangeLogDict"));
    if (!v109)
      return -6727;
    objc_msgSend_setObject_forKey_(v18, v110, v109, CFSTR("kBSAutoGuessSetupOptionKey_ConfigChangeLogDict"));
    result = sub_21A6DF2A8((uint64_t)self->_configContext, 1, v111, v112, v113, v114, v115, v116);
    if (result)
      return result;
    v65 = 4;
  }
LABEL_46:
  result = sub_21A6DCBCC((uint64_t)self->_configContext, v65, v18, v60, v61, v62, v63, v64);
  if (!result)
  {
    configContext = self->_configContext;
    v71 = (void *)objc_msgSend_objectForKey_(a4, v69, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_RecommendationIsAutomatic"));
    v74 = objc_msgSend_BOOLValue(v71, v72, v73);
    return sub_21A6DF33C((uint64_t)configContext, v74, v75, v76, v77, v78, v79, v80);
  }
  return result;
}

- (int)setupWithTargetNetwork:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  if (a3)
    return sub_21A6DCC84((uint64_t)configContext, a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  return -6705;
}

- (int)setupWithTargetBaseStation:(id)a3 andSettings:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSConfigurationContext *configContext;

  configContext = self->_configContext;
  if (!configContext)
    return -6718;
  if (a3)
    return sub_21A6DCD34((uint64_t)configContext, (const __CFString *)a3, a4, (uint64_t)a4, v4, v5, v6, v7);
  return -6705;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  self->_context = a3;
}

- (NSMutableSet)setupDelegates
{
  return self->_setupDelegates;
}

- (SetupUIConfigDelegate)uiConfigDelegate
{
  return (SetupUIConfigDelegate *)self->_uiConfigDelegate;
}

- (void)setUiConfigDelegate:(id)a3
{
  self->_uiConfigDelegate = a3;
}

- (NSString)autoGuessSetupRecommendation
{
  return self->_autoGuessSetupRecommendation;
}

- (void)setAutoGuessSetupRecommendation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDictionary)lastInstrumentation
{
  return self->_lastInstrumentation;
}

- (void)setLastInstrumentation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)rememberDiskPassword
{
  return self->_rememberDiskPassword;
}

- (void)setRememberDiskPassword:(BOOL)a3
{
  self->_rememberDiskPassword = a3;
}

- (NSString)lastSystemName
{
  return self->_lastSystemName;
}

- (void)setLastSystemName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)lastDNSName
{
  return self->_lastDNSName;
}

- (void)setLastDNSName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (BOOL)activeTask
{
  return self->_activeTask;
}

- (void)setActiveTask:(BOOL)a3
{
  self->_activeTask = a3;
}

- (BOOL)performingManualRead
{
  return self->_performingManualRead;
}

- (void)handleBusyStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController(private) handleBusyStart]", 800, (uint64_t)"_busy:\n %d\n", v2, v3, v4, v5, self->_busy);
  self->_busy = 1;
  self->_needToNilBonjour = 0;
}

- (void)handleBusyComplete
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController(private) handleBusyComplete]", 800, (uint64_t)"_busy:\n %d\n", v2, v3, v4, v5, self->_busy);
  self->_busy = 0;
  self->_performingManualRead = 0;
  if (self->_needToNilBonjour)
    MEMORY[0x24BEDD108](self, sel_setBonjourRecord_, 0);
}

- (void)updateLastHeardFromDevice
{
  NSDate *v3;
  const char *v4;
  uint64_t v5;

  v3 = self->_lastHeardFromDevice;
  self->_lastHeardFromDevice = (NSDate *)(id)objc_msgSend_date(MEMORY[0x24BDBCE60], v4, v5);
}

- (void)setupWiFiState
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  int AutoJoinState;
  const char *v8;
  uint64_t v9;
  int isScanningActive;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  AutoJoinState = objc_msgSend_getAutoJoinState(v4, v5, v6);
  self->_autoJoinState = AutoJoinState;
  if (AutoJoinState)
    objc_msgSend_setAutoJoinState_(v4, v8, 0);
  isScanningActive = objc_msgSend_isScanningActive(v4, v8, v9);
  self->_scanningState = isScanningActive;
  if (isScanningActive)
  {
    if (objc_msgSend_isScanInProgress(v4, v11, v12))
      objc_msgSend_cancelAsync(v4, v13, v14);
    objc_msgSend_activateScanning_(v4, v13, 0);
  }
}

- (void)resetWiFiState
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;

  if (self->_autoJoinState)
  {
    v4 = (void *)objc_msgSend_sharedInstanceRef(WiFiUtils, a2, v2);
    objc_msgSend_setAutoJoinState_(v4, v5, self->_autoJoinState);
  }
  self->_autoJoinState = 0;
  if (self->_scanningState)
  {
    v6 = (void *)objc_msgSend_sharedInstanceRef(WiFiUtils, a2, v2);
    objc_msgSend_activateScanning_(v6, v7, self->_scanningState);
  }
  self->_scanningState = 0;
}

- (void)handleSetupComplete:(int)a3
{
  const char *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFDictionaryRef v20;

  objc_msgSend_resetWiFiState(self, a2, *(uint64_t *)&a3);
  if (!a3)
  {
    v7 = (const __CFString *)objc_msgSend_bonjourRecord(self, v5, v6);
    sub_21A730E3C(v7, 0, v8, v9, v10, v11, v12, v13);
  }
  v20 = 0;
  v14 = sub_21A6DD5FC((uint64_t)self->_configContext);
  if (!sub_21A70B044(v14, &v20))
  {
    if (dword_2550EEDA8 <= 800 && (dword_2550EEDA8 != -1 || sub_21A69876C((uint64_t)&dword_2550EEDA8, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550EEDA8, (uint64_t)"-[AUSetupController(private) handleSetupComplete:]", 800, (uint64_t)"instrumentation:\n %@\n", v16, v17, v18, v19, (uint64_t)v20);
    objc_msgSend_setLastInstrumentation_(self, v15, (uint64_t)v20);

  }
}

- (void)handleTaskComplete
{
  uint64_t v2;
  const char *v4;

  objc_msgSend_resetWiFiState(self, a2, v2);
  objc_msgSend_setActiveTask_(self, v4, 0);
}

- (void)logChangesToCCL
{
  uint64_t v2;
  uint64_t v3;

  v3 = objc_msgSend_bsRef(self, a2, v2);
  MEMORY[0x24BEDD108](ConfigChangeLogs, sel_writeConfigChangeLog_, v3);
}

- (id)targetBaseInfoDict
{
  uint64_t v2;
  void *v4;
  const char *v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  void *v99;
  const char *v100;
  int v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;

  if (!self->_configContext)
    return 0;
  v105 = 0;
  v106 = 0;
  v104 = 0;
  v4 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2);
  if (sub_21A6DEFF0((uint64_t)self->_configContext, &v106))
    v6 = 1;
  else
    v6 = v106 == 0;
  if (!v6 && !objc_msgSend_getValue_forBSSetting_(self, v5, (uint64_t)&v105, 1651717454))
  {
    if (v105)
    {
      v9 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v7, v8);
      sub_21A6D6A04(v106);
      v10 = sub_21A691214(1918979693);
      if (!objc_msgSend_getValue_forSettingPath_(self, v11, (uint64_t)&v104, v10))
      {
        v12 = (uint64_t)v104;
        if (v104)
        {
          v13 = sub_21A690CA4(1918979693);
          objc_msgSend_setObject_forKey_(v9, v14, v12, v13);
          sub_21A6D6A04(v106);
          v15 = sub_21A691214(1651725131);
          if (!objc_msgSend_getValue_forSettingPath_(self, v16, (uint64_t)&v104, v15))
          {
            v17 = (uint64_t)v104;
            if (v104)
            {
              v18 = sub_21A690CA4(1651725131);
              objc_msgSend_setObject_forKey_(v9, v19, v17, v18);
              objc_msgSend_setObject_forKey_(v4, v20, (uint64_t)v9, CFSTR("kSetupBaseStationInfoKey_RadioInfo"));
              if (objc_msgSend_BOOLValue(v105, v21, v22))
              {
                v25 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v23, v24);
                sub_21A6D69F0(v106);
                v26 = sub_21A691214(1918979693);
                if (objc_msgSend_getValue_forSettingPath_(self, v27, (uint64_t)&v104, v26))
                  return v4;
                v28 = (uint64_t)v104;
                if (!v104)
                  return v4;
                v29 = sub_21A690CA4(1918979693);
                objc_msgSend_setObject_forKey_(v25, v30, v28, v29);
                sub_21A6D69F0(v106);
                v31 = sub_21A691214(1651725131);
                if (objc_msgSend_getValue_forSettingPath_(self, v32, (uint64_t)&v104, v31))
                  return v4;
                v33 = (uint64_t)v104;
                if (!v104)
                  return v4;
                v34 = sub_21A690CA4(1651725131);
                objc_msgSend_setObject_forKey_(v25, v35, v33, v34);
                objc_msgSend_setObject_forKey_(v4, v36, (uint64_t)v25, CFSTR("kSetupBaseStationInfoKey_RadioInfo5GHz"));
              }
              if (objc_msgSend_bonjourRecord(self, v23, v24))
              {
                v39 = objc_msgSend_bonjourRecord(self, v37, v38);
                objc_msgSend_setObject_forKey_(v4, v40, v39, CFSTR("kSetupBaseStationInfoKey_BrowseRecord"));
                v43 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v41, v42);
                if (!objc_msgSend_getValue_forBSSetting_(self, v44, (uint64_t)&v104, 1937330263))
                {
                  v45 = v104;
                  if (v104)
                  {
                    v46 = sub_21A690CA4(1937330263);
                    objc_msgSend_setObject_forKey_(v43, v47, (uint64_t)v45, v46);
                    if (!objc_msgSend_getValue_forBSSetting_(self, v48, (uint64_t)&v104, 1937329773))
                    {
                      v49 = (uint64_t)v104;
                      if (v104)
                      {
                        v50 = sub_21A690CA4(1937329773);
                        objc_msgSend_setObject_forKey_(v43, v51, v49, v50);
                        if (!objc_msgSend_getValue_forBSSetting_(self, v52, (uint64_t)&v104, 1937326416))
                        {
                          v53 = (uint64_t)v104;
                          if (v104)
                          {
                            v54 = sub_21A690CA4(1937326416);
                            objc_msgSend_setObject_forKey_(v43, v55, v53, v54);
                            objc_msgSend_setObject_forKey_(v4, v56, (uint64_t)v43, CFSTR("kSetupBaseStationInfoKey_GeneralInfo"));
                            if (!objc_msgSend_hasACPFeature_(self, v57, 1297314927))
                              goto LABEL_39;
                            v60 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v58, v59);
                            if (!objc_msgSend_getValue_forBSSetting_(self, v61, (uint64_t)&v104, 1651721805))
                            {
                              v62 = (uint64_t)v104;
                              if (v104)
                              {
                                v63 = sub_21A690CA4(1651721805);
                                objc_msgSend_setObject_forKey_(v60, v64, v62, v63);
                                if (objc_msgSend_integerValue(v104, v65, v66) == 1)
                                {
                                  if (objc_msgSend_getValue_forBSSetting_(self, v67, (uint64_t)&v104, 1718842224))return v4;
                                  v45 = v104;
                                  if (!v104)
                                    return v4;
                                }
                                else
                                {
                                  if (objc_msgSend_integerValue(v104, v67, v68) != 2)
                                  {
                                    v104 = 0;
                                    goto LABEL_38;
                                  }
                                  v104 = v45;
                                }
                                v71 = sub_21A690CA4(1718842224);
                                objc_msgSend_setObject_forKey_(v60, v72, (uint64_t)v45, v71);
LABEL_38:
                                objc_msgSend_setObject_forKey_(v4, v70, (uint64_t)v60, CFSTR("kSetupBaseStationInfoKey_DiskInfo"));
LABEL_39:
                                if (objc_msgSend_hasACPFeature_(self, v58, 1198748750))
                                {
                                  v75 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v73, v74);
                                  v76 = sub_21A691214(1651722053);
                                  if (objc_msgSend_getValue_forSettingPath_(self, v77, (uint64_t)&v104, v76))return v4;
                                  v78 = (uint64_t)v104;
                                  if (!v104)
                                    return v4;
                                  v79 = sub_21A690CA4(1651722053);
                                  objc_msgSend_setObject_forKey_(v75, v80, v78, v79);
                                  if (objc_msgSend_integerValue(v104, v81, v82))
                                  {
                                    v84 = sub_21A691214(1651722062);
                                    if (objc_msgSend_getValue_forSettingPath_(self, v85, (uint64_t)&v104, v84))return v4;
                                    v86 = (uint64_t)v104;
                                    if (!v104)
                                      return v4;
                                    v87 = sub_21A690CA4(1651722062);
                                    objc_msgSend_setObject_forKey_(v75, v88, v86, v87);
                                    v89 = sub_21A691214(1651722067);
                                    if (objc_msgSend_getValue_forSettingPath_(self, v90, (uint64_t)&v104, v89))return v4;
                                    v91 = (uint64_t)v104;
                                    if (!v104)
                                      return v4;
                                    v92 = sub_21A690CA4(1651722067);
                                    objc_msgSend_setObject_forKey_(v75, v93, v91, v92);
                                    v94 = sub_21A691214(1651722064);
                                    if (objc_msgSend_getValue_forSettingPath_(self, v95, (uint64_t)&v104, v94))return v4;
                                    v96 = (uint64_t)v104;
                                    if (!v104)
                                      return v4;
                                    v97 = sub_21A690CA4(1651722064);
                                    objc_msgSend_setObject_forKey_(v75, v98, v96, v97);
                                  }
                                  objc_msgSend_setObject_forKey_(v4, v83, (uint64_t)v75, CFSTR("kSetupBaseStationInfoKey_GuestNetworkInfo"));
                                }
                                if (!self->_autoGuessSetupRecommendation)
                                  return v4;
                                v103 = 0;
                                v99 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v73, v74);
                                objc_msgSend_setObject_forKey_(v99, v100, (uint64_t)self->_autoGuessSetupRecommendation, CFSTR("BSAutoGuess_Recommendation"));
                                v101 = sub_21A6DF3D0((uint64_t)self->_configContext, &v103);
                                if (v101 != -6727)
                                {
                                  if (v101 || !v103)
                                    return v4;
                                  objc_msgSend_setObject_forKey_(v99, v102, v103, CFSTR("BSAutoGuess_SourceBase"));
                                }
                                objc_msgSend_setObject_forKey_(v4, v102, (uint64_t)v99, CFSTR("kSetupBaseStationInfoKey_RecommendationInfo"));
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

@end

@implementation AssistantCallbackController

- (AssistantCallbackController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AssistantCallbackController;
  return -[AssistantCallbackController init](&v3, sel_init);
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  id uiDelegate;
  objc_super v13;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  v8 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v6, v7);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
  uiDelegate = self->_uiDelegate;
  if (uiDelegate && self->_callbackContext)
    objc_msgSend_callbackAskCancel(uiDelegate, v10, v11);
  v13.receiver = self;
  v13.super_class = (Class)AssistantCallbackController;
  -[AssistantCallbackController dealloc](&v13, sel_dealloc);
}

- (void)assistantCallback
{
  return sub_21A677938;
}

- (int)subclassAssistantCallback:(AssistantCallbackContext *)a3
{
  return -6735;
}

+ (int)updateKeychainNetworkPassword:(id)a3 forNetworkNamed:(id)a4
{
  if (a4)
    return 0;
  else
    return -6705;
}

+ (int)updateKeychainBasePassword:(id)a3 forMACAddress:(id)a4 withBaseName:(id)a5
{
  int result;
  NSObject *global_queue;
  _QWORD block[7];

  result = -6705;
  if (a4 && a3 && a5)
  {
    if (objc_msgSend_length(a4, a2, (uint64_t)a3))
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_21A677A58;
      block[3] = &unk_24DD04D20;
      block[4] = a4;
      block[5] = a3;
      block[6] = a5;
      dispatch_async(global_queue, block);
      return 0;
    }
    else
    {
      return -6705;
    }
  }
  return result;
}

+ (id)keychainPasswordForBaseStation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  __CFArray *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __CFArray *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  if (!a3)
    goto LABEL_13;
  v9 = 0;
  if (sub_21A68EB8C((const __CFString *)a3, &v22, (uint64_t)a3, v3, v4, v5, v6, v7))
    goto LABEL_15;
  v10 = v22;
  if (!v22)
    goto LABEL_15;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v8, (uint64_t)&v18, v23, 16);
  if (!v11)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_15;
  }
  v13 = v11;
  v14 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v10);
      v16 = objc_msgSend_keychainPasswordForMACAddress_(KeychainWrapper, v12, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
      if (v16)
      {
        v9 = (void *)v16;
        goto LABEL_15;
      }
    }
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v18, v23, 16);
    v9 = 0;
    if (v13)
      continue;
    break;
  }
LABEL_15:

  return v9;
}

+ (void)keychainPasswordForBaseStation:(id)a3 delegate:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFArray *v8;
  int v11;
  NSObject *global_queue;
  _QWORD v13[7];
  __CFArray *v14;

  v8 = 0;
  v14 = 0;
  if (a3)
  {
    if (a4)
    {
      v11 = sub_21A68EB8C((const __CFString *)a3, &v14, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
      v8 = v14;
      if (!v11)
      {
        if (v14)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = sub_21A677CA8;
          v13[3] = &unk_24DD04D20;
          v13[4] = v8;
          v13[5] = a4;
          v13[6] = a3;
          dispatch_async(global_queue, v13);
          v8 = v14;
        }
      }
    }
  }

}

+ (int)removeKeychainPasswordForBaseStation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __CFArray *v9;
  int v10;
  NSObject *global_queue;
  _QWORD v13[5];
  __CFArray *v14;

  v14 = 0;
  if (a3)
  {
    v8 = sub_21A68EB8C((const __CFString *)a3, &v14, (uint64_t)a3, v3, v4, v5, v6, v7);
    v9 = v14;
    if (v8)
    {
      v10 = v8;
    }
    else if (v14)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_21A677E7C;
      v13[3] = &unk_24DD04D48;
      v13[4] = v9;
      dispatch_async(global_queue, v13);
      v10 = 0;
      v9 = v14;
    }
    else
    {
      v10 = -6728;
    }
  }
  else
  {
    v9 = 0;
    v10 = -6705;
  }

  return v10;
}

- (void)callbackAskUserForPasswordResult:(int)a3 password:(id)a4 remember:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AssistantCallbackContext *callbackContext;
  uint64_t v11;
  uint64_t *v12;

  callbackContext = self->_callbackContext;
  if (callbackContext)
  {
    if (a3)
    {
LABEL_3:
      sub_21A70B2E0(callbackContext, a3, *(uint64_t *)&a3, (uint64_t)a4, *(uint64_t *)&a5, v5, v6, v7);
      goto LABEL_4;
    }
    if (!a4)
    {
      *(_QWORD *)&a3 = 4294960591;
      goto LABEL_3;
    }
    v11 = sub_21A70B204((uint64_t)callbackContext, (uint64_t)CFSTR("BSAssistantCallback_String"), (uint64_t)a4, (uint64_t)a4, *(uint64_t *)&a5, v5, v6, v7);
    *(_QWORD *)&a3 = v11;
    if (a5 != 2 && !(_DWORD)v11)
    {
      v12 = (uint64_t *)MEMORY[0x24BDBD270];
      if (a5 != 1)
        v12 = (uint64_t *)MEMORY[0x24BDBD268];
      *(_QWORD *)&a3 = sub_21A70B204((uint64_t)self->_callbackContext, (uint64_t)CFSTR("BSAssistantCallback_Boolean"), *v12, (uint64_t)a4, *(uint64_t *)&a5, v5, v6, v7);
    }
    callbackContext = self->_callbackContext;
    if (callbackContext)
      goto LABEL_3;
  }
LABEL_4:
  self->_callbackContext = 0;
}

- (void)callbackAskUserToChooseFromStringListResult:(int)a3 selectedString:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  AssistantCallbackContext *callbackContext;

  v8 = a3;
  callbackContext = self->_callbackContext;
  if (!a3 && callbackContext)
  {
    v8 = sub_21A70B204((uint64_t)callbackContext, (uint64_t)CFSTR("BSAssistantCallback_String"), (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7);
    callbackContext = self->_callbackContext;
  }
  sub_21A70B2E0(callbackContext, v8, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  self->_callbackContext = 0;
}

- (void)callbackAskUserAQuestionResult:(int)a3 result:(int)a4
{
  switch(a3)
  {
    case 5:
      MEMORY[0x24BEDD108](self, sel_userResponseToPPPoECredsFailed_, *(_QWORD *)&a4);
      break;
    case 4:
      objc_msgSend_userResponseToWarning_(self, a2, *(uint64_t *)&a4);
      break;
    case 3:
      objc_msgSend_userResponseToJoinNetwork_(self, a2, *(uint64_t *)&a4);
      break;
  }
}

- (AssistantCallbackUIDelegate)uiDelegate
{
  return (AssistantCallbackUIDelegate *)self->_uiDelegate;
}

- (void)setUiDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)assistantCallback:(AssistantCallbackContext *)isEqualToString withSelector:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AssistantCallbackContext *v9;
  const char *v11;
  int v12;
  int v13;
  char *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  int started;
  int v19;
  int v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id uiDelegate;
  uint64_t v29;
  const char *v30;
  int v31;
  int v32;
  int v33;
  const char *v34;
  CFTypeRef v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const char *v47;
  int v48;
  char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t CurrentAssociationInfo;
  uint64_t v64;
  const __CFString *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  int v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  const char *v82;
  int v83;
  const char *v84;
  NSObject *global_queue;
  int v86;
  int v87;
  const char *v88;
  int v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  const char *v98;
  AssistantCallbackContext *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  int updated;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  const char *v118;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD block[5];
  int v124;
  CFTypeRef v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  char *v133;

  v8 = *(_QWORD *)&a4;
  v9 = isEqualToString;
  if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) assistantCallback:withSelector:]", 800, (uint64_t)"inSelector: %d\n", v4, v5, v6, v7, v8);
  switch((int)v8)
  {
    case 1:
      started = objc_msgSend_subclassAssistantCallback_(self, a2, (uint64_t)v9);
      goto LABEL_13;
    case 2:
      v132 = 0;
      v133 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_ScanInfo"), &v132, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v19;
      if (v19)
        goto LABEL_144;
      if (!v132)
        goto LABEL_143;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_Boolean"), &v133, *(uint64_t *)&a4, v4, v5, v6, v7);
      if (!v20)
        goto LABEL_20;
      v13 = v20;
      if (v20 != -6727)
        goto LABEL_144;
      v133 = (char *)*MEMORY[0x24BDBD268];
LABEL_20:
      if (self->_callbackContext)
        goto LABEL_30;
      self->_callbackContext = v9;
      if (!CFBooleanGetValue((CFBooleanRef)v133) || !self->_uiDelegate || (objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend_userResponseToJoinNetwork_(self, v21, 0);
        return 0;
      }
      v27 = objc_msgSend_objectForKey_(v132, v21, (uint64_t)CFSTR("SSID_STR"));
      if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) assistantCallback:withSelector:]", 800, (uint64_t)"***Asking user if switching is OK\n", v23, v24, v25, v26, v120);
      uiDelegate = self->_uiDelegate;
      v29 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCE70], v22, v27, CFSTR("kAssistantCallbackAskUserParamKey_SwitchNetwork_SSID"));
      started = objc_msgSend_callbackAskUserAQuestion_paramDict_forController_(uiDelegate, v30, 3, v29, self);
      goto LABEL_13;
    case 3:
      if (self->_callbackContext)
        goto LABEL_30;
      self->_callbackContext = v9;
      if (!self->_uiDelegate || (objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend_userResponseToWarning_(self, a2, 0);
        return 0;
      }
      v132 = 0;
      v133 = 0;
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v126 = 0;
      v127 = 0;
      v125 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_PromptKey"), &v133, v100, v101, v102, v103, v104);
      v13 = v105;
      if (v105)
        goto LABEL_144;
      if (!v133)
        goto LABEL_143;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_PromptParam1"), &v132, *(uint64_t *)&a4, v4, v5, v6, v7);
      if (v106 == -6727)
      {
        v132 = 0;
      }
      else
      {
        v13 = v106;
        if (v106)
          goto LABEL_144;
        if (!v132)
        {
LABEL_143:
          v13 = -6728;
          goto LABEL_144;
        }
      }
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_PromptParam2"), &v131, *(uint64_t *)&a4, v4, v5, v6, v7);
      if (v112 == -6727)
      {
        v131 = 0;
      }
      else
      {
        v13 = v112;
        if (v112)
          goto LABEL_144;
        if (!v131)
          goto LABEL_143;
      }
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_MessageKey"), &v130, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v113;
      if (v113)
        goto LABEL_144;
      if (!v130)
        goto LABEL_143;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_MessageParam1"), &v129, *(uint64_t *)&a4, v4, v5, v6, v7);
      if (v114 == -6727)
      {
        v129 = 0;
      }
      else
      {
        v13 = v114;
        if (v114)
          goto LABEL_144;
        if (!v129)
          goto LABEL_143;
      }
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_MessageParam2"), &v128, *(uint64_t *)&a4, v4, v5, v6, v7);
      if (v115 == -6727)
      {
        v128 = 0;
      }
      else
      {
        v13 = v115;
        if (v115)
          goto LABEL_144;
        if (!v128)
          goto LABEL_143;
      }
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_OkKey"), &v127, *(uint64_t *)&a4, v4, v5, v6, v7);
      if (v116 == -6727)
      {
        v127 = 0;
      }
      else
      {
        v13 = v116;
        if (v116)
          goto LABEL_144;
        if (!v127)
          goto LABEL_143;
      }
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_Warn_CancelKey"), &v126, *(uint64_t *)&a4, v4, v5, v6, v7);
      if (v117 == -6727)
      {
        v126 = 0;
      }
      else
      {
        v13 = v117;
        if (v117)
          goto LABEL_144;
        if (!v126)
          goto LABEL_143;
      }
      v13 = sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], &v125, (uint64_t)"{%ks=%O%ks=%O%ks=%O%ks=%O%ks=%O%ks=%O%ks=%O%ks=%O}", *(uint64_t *)&a4, v4, v5, v6, v7, (uint64_t)"kAssistantCallbackAskUserParamKey_Warning_PromptKey");
      if (v13)
        goto LABEL_144;
      if (!v125)
        goto LABEL_143;
      if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) assistantCallback:withSelector:]", 800, (uint64_t)"***Warning user\n", v4, v5, v6, v7, v122);
      v13 = objc_msgSend_callbackAskUserAQuestion_paramDict_forController_(self->_uiDelegate, v118, 4, v125, self);
      v35 = v125;
      if (v125)
LABEL_45:
        CFRelease(v35);
LABEL_46:
      if (!v13)
        return 0;
      goto LABEL_144;
    case 4:
      v132 = 0;
      v133 = 0;
      v130 = 0;
      v131 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_MessageKey"), &v133, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v31;
      if (v31)
        goto LABEL_144;
      if (!v133)
        goto LABEL_143;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_OkKey"), &v132, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v32;
      if (v32)
        goto LABEL_144;
      if (!v132)
        goto LABEL_143;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("kBSAssistantCallback_CancelKey"), &v131, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v33;
      if (v33)
        goto LABEL_144;
      if (!v131)
        goto LABEL_143;
      v13 = sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], (CFTypeRef *)&v130, (uint64_t)"{%ks=%O%ks=%O%ks=%O}", *(uint64_t *)&a4, v4, v5, v6, v7, (uint64_t)"kAssistantCallbackAskUserParamKey_MessageKey");
      if (v13)
        goto LABEL_144;
      if (!v130)
        goto LABEL_143;
      if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) assistantCallback:withSelector:]", 800, (uint64_t)"***Asking User whether to Skip PPPoE Creds failed\n", v4, v5, v6, v7, v121);
      if (self->_callbackContext)
        goto LABEL_30;
      self->_callbackContext = v9;
      v13 = objc_msgSend_callbackAskUserAQuestion_paramDict_forController_(self->_uiDelegate, v34, 5, v130, self);
      v35 = v130;
      if (v130)
        goto LABEL_45;
      goto LABEL_46;
    case 5:
    case 6:
      v133 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_AskUserDictionary"), &v133, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v12;
      if (v12)
        goto LABEL_144;
      v14 = v133;
      if (!v133)
        goto LABEL_143;
      if (!self->_uiDelegate)
        goto LABEL_95;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (self->_callbackContext)
          goto LABEL_30;
        self->_callbackContext = v9;
        v15 = self->_uiDelegate;
        v16 = objc_msgSend_allKeys(v133, v11, (uint64_t)isEqualToString);
        started = objc_msgSend_callbackAskUserToChooseFromStringList_context_forController_(v15, v17, v16, (_DWORD)v8 == 6, self);
        goto LABEL_13;
      }
      v14 = v133;
LABEL_95:
      v107 = (void *)objc_msgSend_allKeys(v14, v11, (uint64_t)isEqualToString);
      if (objc_msgSend_count(v107, v108, v109))
      {
        v64 = objc_msgSend_objectAtIndex_(v107, v110, 0);
        v65 = CFSTR("BSAssistantCallback_String");
LABEL_97:
        updated = sub_21A70B204((uint64_t)v9, (uint64_t)v65, v64, *(uint64_t *)&a4, v4, v5, v6, v7);
        goto LABEL_98;
      }
      return 0;
    case 7:
      v130 = 0;
      v131 = 0;
      v133 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_String"), &v133, *(uint64_t *)&a4, v4, v5, v6, v7);
      v132 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_Number"), &v132, v36, v37, v38, v39, v40);
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_WiFiType"), &v131, v41, v42, v43, v44, v45);
      v13 = v46;
      if (v46)
        goto LABEL_144;
      if (!v131)
        goto LABEL_110;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_Boolean"), &v130, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v48;
      if (v48)
        goto LABEL_144;
      if (!v130)
        goto LABEL_143;
      if (self->_callbackContext)
        goto LABEL_30;
      self->_callbackContext = v9;
      v49 = v133;
      v50 = objc_msgSend_integerValue(v131, v47, (uint64_t)isEqualToString);
      v53 = objc_msgSend_BOOLValue(v130, v51, v52);
      v56 = objc_msgSend_integerValue(v132, v54, v55);
      started = objc_msgSend_startScanForNetworks_wifiType_mergeResults_maxAge_(self, v57, (uint64_t)v49, v50, v53, v56);
      goto LABEL_13;
    case 8:
      v58 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)isEqualToString);
      if (!objc_msgSend_airPortIsOn(v58, v59, v60))
        goto LABEL_64;
      if (!objc_msgSend_isCurrentlyAssociatedToAnInfrastructureNetwork_(v58, v61, 0))
        goto LABEL_64;
      CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(v58, v62, (uint64_t)isEqualToString);
      if (!CurrentAssociationInfo)
        goto LABEL_64;
      v64 = CurrentAssociationInfo;
      v65 = CFSTR("BSAssistantCallback_AssociationInfo");
      goto LABEL_97;
    case 9:
      v66 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)isEqualToString);
      if (!objc_msgSend_airPortIsOn(v66, v67, v68))
        goto LABEL_81;
      v70 = objc_msgSend_disassociateSync(v66, v69, (uint64_t)isEqualToString);
      goto LABEL_62;
    case 10:
      v71 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)isEqualToString);
      if (objc_msgSend_airPortIsOn(v71, v72, v73))
      {
        v70 = objc_msgSend_clearScanCacheSync(v71, v74, (uint64_t)isEqualToString);
LABEL_62:
        v75 = v70;
      }
      else
      {
LABEL_81:
        v75 = 0;
      }
      v99 = v9;
      goto LABEL_83;
    case 11:
      v132 = 0;
      v133 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_String"), &v133, *(uint64_t *)&a4, v4, v5, v6, v7);
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_StringList"), &v132, v76, v77, v78, v79, v80);
LABEL_64:
      v13 = -6727;
      goto LABEL_144;
    case 12:
      if (!self->_uiDelegate || (objc_opt_respondsToSelector() & 1) == 0)
      {
        v13 = -6735;
        goto LABEL_144;
      }
      v132 = 0;
      v133 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_KeychainServiceType"), &v133, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v81;
      if (!v81)
      {
        sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_KeychainDeviceName"), &v132, *(uint64_t *)&a4, v4, v5, v6, v7);
        v13 = v83;
        if (!v83)
        {
          if ((objc_msgSend_isEqualToString_(v133, v82, (uint64_t)CFSTR("keychainBaseStationType")) & 1) != 0)
            isEqualToString = 0;
          else
            isEqualToString = (AssistantCallbackContext *)objc_msgSend_isEqualToString_(v133, v84, (uint64_t)CFSTR("keychainNetworkType"));
          if (self->_callbackContext)
          {
LABEL_30:
            v13 = -6721;
            goto LABEL_144;
          }
          self->_callbackContext = v9;
          started = objc_msgSend_callbackAskUserForPassword_param_forController_(self->_uiDelegate, v84, (uint64_t)isEqualToString, v132, self);
LABEL_13:
          v13 = started;
          if (!started)
            return 0;
        }
      }
      goto LABEL_144;
    case 13:
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_21A678B88;
      block[3] = &unk_24DD04D68;
      block[4] = v9;
      v124 = 13;
      dispatch_async(global_queue, block);
      return 0;
    case 14:
      v132 = 0;
      v133 = 0;
      v131 = 0;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_KeychainAccount"), &v133, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v86;
      if (v86)
        goto LABEL_144;
      if (!v133)
        goto LABEL_143;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_KeychainServiceType"), &v132, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v87;
      if (v87)
        goto LABEL_144;
      if (!v132)
        goto LABEL_143;
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_String"), &v131, *(uint64_t *)&a4, v4, v5, v6, v7);
      v13 = v89;
      if (v89)
        goto LABEL_144;
      if (!v131)
        goto LABEL_143;
      if (!objc_msgSend_isEqualToString_(v132, v88, (uint64_t)CFSTR("keychainBaseStationType")))
      {
        if (!objc_msgSend_isEqualToString_(v132, v90, (uint64_t)CFSTR("keychainNetworkType")))
        {
LABEL_110:
          v13 = -6705;
          goto LABEL_144;
        }
        goto LABEL_99;
      }
      v130 = 0;
      v133 = (char *)sub_21A69114C(v133, 0, v91);
      sub_21A70B0B0((uint64_t)v9, (uint64_t)CFSTR("BSAssistantCallback_KeychainDeviceName"), &v130, v92, v93, v94, v95, v96);
      if (v97)
      {
        v13 = v97;
        goto LABEL_144;
      }
      updated = objc_msgSend_updateKeychainBasePassword_forMACAddress_withBaseName_(AssistantCallbackController, v98, (uint64_t)v131, v133, v130);
LABEL_98:
      v13 = updated;
      if (!updated)
      {
LABEL_99:
        v99 = v9;
        v75 = 0;
LABEL_83:
        sub_21A70B2E0(v99, v75, (uint64_t)isEqualToString, *(uint64_t *)&a4, v4, v5, v6, v7);
        return 0;
      }
LABEL_144:
      if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) assistantCallback:withSelector:]", 800, (uint64_t)"failing inSelector: %d err: %m\n", v4, v5, v6, v7, v8);
      sub_21A70B2E0(v9, v13, (uint64_t)isEqualToString, *(uint64_t *)&a4, v4, v5, v6, v7);
      self->_callbackContext = 0;
      return 0;
    default:
      goto LABEL_110;
  }
}

- (void)userResponseToJoinNetwork:(int)a3
{
  uint64_t NetworkPassword;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int isEnterprise;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t started;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  v23 = 0;
  v22 = 0;
  if (!self->_callbackContext)
    goto LABEL_15;
  if (a3)
    goto LABEL_16;
  v24 = 0;
  if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) userResponseToJoinNetwork:]", 800, (uint64_t)"***Done asking user if switching is OK\n", v4, v5, v6, v7, v21);
  sub_21A70B0B0((uint64_t)self->_callbackContext, (uint64_t)CFSTR("BSAssistantCallback_ScanInfo"), &v25, NetworkPassword, v4, v5, v6, v7);
  *(_QWORD *)&a3 = v9;
  if ((_DWORD)v9)
    goto LABEL_16;
  if (!v25)
  {
LABEL_15:
    *(_QWORD *)&a3 = 4294960591;
    goto LABEL_16;
  }
  sub_21A70B148((uint64_t)self->_callbackContext, (uint64_t)CFSTR("BSAssistantCallback_JoinRememberChoice"), &v23, NetworkPassword, v4, v5, v6, v7);
  *(_QWORD *)&a3 = v11;
  if ((_DWORD)v11)
  {
LABEL_16:
    sub_21A70B2E0(&self->_callbackContext->var0, a3, *(uint64_t *)&a3, NetworkPassword, v4, v5, v6, v7);
    self->_callbackContext = 0;
    return;
  }
  isEnterprise = objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, v10, v25, 0, &v22);
  NetworkPassword = 0;
  if (isEnterprise && !v22)
  {
    sub_21A70B0B0((uint64_t)self->_callbackContext, (uint64_t)CFSTR("BSAssistantCallback_ScanInfoPassword"), &v24, 0, v14, v15, v16, v17);
    if ((_DWORD)v18 != -6727)
    {
      *(_QWORD *)&a3 = v18;
      if (!(_DWORD)v18)
      {
        started = objc_msgSend_startJoinNetwork_password_rememberChoice_(self, v19, v25, v24, v23);
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    NetworkPassword = objc_msgSend_getNetworkPassword_(WiFiUtils, v19, v25);
    v24 = NetworkPassword;
    if (!NetworkPassword)
    {
      *(_QWORD *)&a3 = 4294967280;
      goto LABEL_16;
    }
  }
  started = objc_msgSend_startJoinNetwork_password_rememberChoice_(self, v13, v25, NetworkPassword, v23);
LABEL_19:
  *(_QWORD *)&a3 = started;
  if ((_DWORD)started)
    goto LABEL_16;
}

- (void)userResponseToWarning:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;

  if (self->_callbackContext)
  {
    v9 = a3;
    if (!a3)
    {
      if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) userResponseToWarning:]", 800, (uint64_t)"***Done giving the user a warning\n", v4, v5, v6, v7, v10);
      v9 = 0;
    }
  }
  else
  {
    v9 = -6705;
  }
  sub_21A70B2E0(&self->_callbackContext->var0, v9, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  self->_callbackContext = 0;
}

- (void)userResponseToPPPoECredsFailed:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;

  if (self->_callbackContext)
  {
    v9 = a3;
    if (!a3)
    {
      if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) userResponseToPPPoECredsFailed:]", 800, (uint64_t)"***Done asking user to skip bad PPPoE Credentials\n", v4, v5, v6, v7, v10);
      v9 = 0;
    }
  }
  else
  {
    v9 = -6705;
  }
  sub_21A70B2E0(&self->_callbackContext->var0, v9, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  self->_callbackContext = 0;
}

- (int)startJoinNetwork:(id)a3 password:(id)a4 rememberChoice:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  if (a3)
  {
    v9 = *(_QWORD *)&a5;
    v12 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)a3);
    v14 = objc_msgSend_joinNetworkWithScanInfoAsync_password_rememberChoice_(v12, v13, (uint64_t)a3, a4, v9);
  }
  else
  {
    v14 = 4294960591;
  }
  if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) startJoinNetwork:password:rememberChoice:]", 800, (uint64_t)"err: %#m\n", *(uint64_t *)&a5, v5, v6, v7, v14);
  v15 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3);
  objc_msgSend_addObserver_selector_name_object_(v15, v16, (uint64_t)self, sel_joinNetworkDone_, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  return v14;
}

- (void)joinNetworkDone:(id)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  if (self->_callbackContext
    && (v14 = (void *)objc_msgSend_userInfo(a3, v7, v8),
        (v16 = (void *)objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("WiFiUtils_OSStatus"))) != 0))
  {
    v18 = objc_msgSend_integerValue(v16, v17, v8);
  }
  else
  {
    v18 = 4294960591;
  }
  if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) joinNetworkDone:]", 800, (uint64_t)"err: %#m\n", v10, v11, v12, v13, v18);
  sub_21A70B2E0(&self->_callbackContext->var0, v18, v8, v9, v10, v11, v12, v13);
  self->_callbackContext = 0;
}

- (int)startScanForNetworks:(id)a3 wifiType:(int)a4 mergeResults:(BOOL)a5 maxAge:(unint64_t)a6
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v11 = objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)a3);
  if (v11)
  {
    v18 = (void *)v11;
    v19 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v12, v13);
    objc_msgSend_addObserver_selector_name_object_(v19, v20, (uint64_t)self, sel_scanForNetworksDone_, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
    v24 = objc_msgSend_asyncWiFiScan_wifiType_merge_maxAge_(v18, v21, (uint64_t)a3, v8, v7, a6);
    if ((_DWORD)v24)
    {
      v25 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v22, v23);
      objc_msgSend_removeObserver_name_object_(v25, v26, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
    }
  }
  else
  {
    v24 = 4294960569;
  }
  if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) startScanForNetworks:wifiType:mergeResults:maxAge:]", 800, (uint64_t)"err: %#m\n", v14, v15, v16, v17, v24);
  return v24;
}

- (void)scanForNetworksDone:(id)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
  if (self->_callbackContext
    && (v14 = (void *)objc_msgSend_userInfo(a3, v7, v8)) != 0
    && (v16 = v14, (v17 = (void *)objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("WiFiUtils_OSStatus"))) != 0))
  {
    v20 = objc_msgSend_integerValue(v17, v18, v8);
    if (!(_DWORD)v20)
    {
      v21 = (void *)objc_msgSend_objectForKey_(v16, v19, (uint64_t)CFSTR("WiFiUtils_ScanInfos"));
      if (objc_msgSend_count(v21, v22, v23))
        v20 = sub_21A70B204((uint64_t)self->_callbackContext, (uint64_t)CFSTR("BSAssistantCallback_ScanInfoRecords"), (uint64_t)v21, v9, v10, v11, v12, v13);
      else
        v20 = 4294960569;
    }
  }
  else
  {
    v20 = 4294960591;
  }
  if (dword_2550EE3F0 <= 800 && (dword_2550EE3F0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3F0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3F0, (uint64_t)"-[AssistantCallbackController(Private) scanForNetworksDone:]", 800, (uint64_t)"err: %#m\n", v10, v11, v12, v13, v20);
  sub_21A70B2E0(&self->_callbackContext->var0, v20, v8, v9, v10, v11, v12, v13);
  self->_callbackContext = 0;
}

@end

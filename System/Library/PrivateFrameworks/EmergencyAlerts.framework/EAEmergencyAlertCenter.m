@implementation EAEmergencyAlertCenter

- (EAEmergencyAlertCenter)init
{
  void *v3;
  EAEmergencyAlertCenter *v4;

  EARegisterUserNotificationsLogging();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.cmas"));
  v4 = -[EAEmergencyAlertCenter initWithUserNotificationCenter:](self, "initWithUserNotificationCenter:", v3);

  return v4;
}

- (EAEmergencyAlertCenter)initWithUserNotificationCenter:(id)a3
{
  id v5;
  EAEmergencyAlertCenter *v6;
  EAEmergencyAlertCenter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EAEmergencyAlertCenter;
  v6 = -[EAEmergencyAlertCenter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userNotificationCenter, a3);

  return v7;
}

- (void)replaceContentForRequestWithRequestID:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  UNUserNotificationCenter *userNotificationCenter;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  userNotificationCenter = self->_userNotificationCenter;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __101__EAEmergencyAlertCenter_replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke;
  v13[3] = &unk_24DCD0EF0;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](userNotificationCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v12, a4, v13);

}

void __101__EAEmergencyAlertCenter_replaceContentForRequestWithRequestID_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = EALogDefault;
  v5 = os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5)
      goto LABEL_7;
    v6 = *(_QWORD *)(a1 + 32);
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v3;
    v7 = "Failed to replace Notification Content For Request Identifier (%@). Error = %@";
    v8 = v4;
    v9 = 22;
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v10;
    v7 = "Replaced Content for: %@";
    v8 = v4;
    v9 = 12;
  }
  _os_log_impl(&dword_21A501000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
LABEL_7:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

- (id)getUpdatedNotificationForAppleSafetyAlert:(id)a3 withMessageDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v9)
  {
    objc_msgSend(v5, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ea_getUpdatedBodyString:withMessageDictionary:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setBody:", v13);
    objc_msgSend(v5, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v9, "ea_updateUserInfo:withMessageDictionary:", v17, v6);

    objc_msgSend(v9, "ea_updateAlertCategory:", v6);
  }

  return v9;
}

- (void)handleAppleSafetyAlertMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  UNUserNotificationCenter *userNotificationCenter;
  _QWORD v11[4];
  id v12;
  id v13;
  EAEmergencyAlertCenter *v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("kCTSMSAppleSafetyAlertData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CmamText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ea_getHashForString(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CmamLongText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ea_getHashForString(v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v7 | v9)
  {
    userNotificationCenter = self->_userNotificationCenter;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke;
    v11[3] = &unk_24DCD0F80;
    v12 = (id)v7;
    v13 = (id)v9;
    v14 = self;
    v15 = v4;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](userNotificationCenter, "getDeliveredNotificationsWithCompletionHandler:", v11);

  }
  else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
  {
    -[EAEmergencyAlertCenter handleAppleSafetyAlertMessage:].cold.1();
  }

}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  dispatch_time_t v28;
  id v29;
  int *v30;
  id obj;
  _QWORD block[6];
  id v33;
  uint8_t v34;
  _BYTE v35[15];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[4];
  int v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    v30 = &v41;
    obj = v3;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
      objc_msgSend(v8, "request", v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "rangeOfString:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
        break;
      objc_msgSend(v8, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeOfString:", *(_QWORD *)(a1 + 40));

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_11;
      v14 = (void *)EALogDefault;
      if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEBUG))
        __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_2(v40, v14, v8, v30);
LABEL_16:
      if (v5 == ++v7)
      {
        v3 = obj;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_18;
      }
    }

LABEL_11:
    v15 = (void *)EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v8, "request");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v18;
      _os_log_impl(&dword_21A501000, v16, OS_LOG_TYPE_DEFAULT, "Apple safety alert matches previous alert: %@", buf, 0xCu);

    }
    objc_msgSend(v8, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "content");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 48), "getUpdatedNotificationForAppleSafetyAlert:withMessageDictionary:", v8, *(_QWORD *)(a1 + 56));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)EALogDefault;
      if (v23)
      {
        v25 = (void *)v23;
        v3 = obj;
        if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v24;
          objc_msgSend(v25, "userInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v43 = v27;
          _os_log_impl(&dword_21A501000, v26, OS_LOG_TYPE_DEFAULT, "UserInfo dict: %@", buf, 0xCu);

        }
        v28 = dispatch_time(0, 0);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2;
        block[3] = &unk_24DCD0F58;
        block[4] = *(_QWORD *)(a1 + 48);
        block[5] = v8;
        v33 = v25;
        v29 = v25;
        dispatch_after(v28, MEMORY[0x24BDAC9B8], block);

      }
      else
      {
        v3 = obj;
        if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
          __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_4();
      }

      goto LABEL_27;
    }
    v22 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
      __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_3(&v34, v35, v22);
    goto LABEL_16;
  }
LABEL_18:

  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
    __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_1();
LABEL_27:

}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "replaceContentForRequestWithRequestID:replacementContent:completionHandler:", v3, v4, &__block_literal_global);

}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = EALogDefault;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
      __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
  else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21A501000, v3, OS_LOG_TYPE_DEFAULT, "Alert updated", v4, 2u);
  }

}

- (id)handleCellBroadcastMessage:(id)a3 withCompletionHandler:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v5 = (objc_class *)MEMORY[0x24BDF8800];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "ea_setPropertiesForCellBroadcastMessage:withActivePhoneCall:", v6, -[EAEmergencyAlertCenter currentAudioAndVideoCallCount](self, "currentAudioAndVideoCallCount") != 0);
  objc_msgSend(v6, "objectForKey:", CFSTR("PreventScreenCapture"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v8, "BOOLValue");
  if ((_DWORD)v6)
  {
    v9 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21A501000, v9, OS_LOG_TYPE_DEFAULT, "Screen capture prohibited", v11, 2u);
    }
    objc_msgSend(v7, "setScreenCaptureProhibited:", 1);
  }
  return v7;
}

- (void)handleRawCellBroadcastMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDC2F50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("kCTSMSAppleSafetyAlertData"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    if (v9)
    {
      -[EAEmergencyAlertCenter handleAppleSafetyAlertMessage:](self, "handleAppleSafetyAlertMessage:", v6);
LABEL_11:
      v11 = 0;
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
    {
      -[EAEmergencyAlertCenter handleRawCellBroadcastMessage:withCompletionHandler:].cold.1();
      if (!v7)
        goto LABEL_11;
    }
    else if (!v7)
    {
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], -1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v24);

    goto LABEL_11;
  }
  -[EAEmergencyAlertCenter handleCellBroadcastMessage:withCompletionHandler:](self, "handleCellBroadcastMessage:withCompletionHandler:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = v15;

    v17 = (void *)MEMORY[0x24BDD17C8];
    ea_getHashForString(v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%f"), v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v19, v11, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      objc_msgSend(v20, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_21A501000, v22, OS_LOG_TYPE_DEFAULT, "Adding notification request for emergency alert %{public}@", buf, 0xCu);

    }
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __78__EAEmergencyAlertCenter_handleRawCellBroadcastMessage_withCompletionHandler___block_invoke;
    v25[3] = &unk_24DCD0FA8;
    v26 = v7;
    -[EAEmergencyAlertCenter addNotificationRequest:withCompletionHandler:](self, "addNotificationRequest:withCompletionHandler:", v20, v25);

  }
LABEL_12:

}

uint64_t __78__EAEmergencyAlertCenter_handleRawCellBroadcastMessage_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  return result;
}

- (unint64_t)currentAudioAndVideoCallCount
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentAudioAndVideoCallCount");

  return v3;
}

- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  _QWORD block[5];
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (self->_userNotificationCenter)
  {
    dispatch_get_global_queue(25, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke;
    block[3] = &unk_24DCD0FF8;
    block[4] = self;
    v11 = v6;
    v12 = v8;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
      -[EAEmergencyAlertCenter addNotificationRequest:withCompletionHandler:].cold.1();
    v8[2](v8, 0, 0);
  }

}

void __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_24DCD0FD0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addNotificationRequest:withCompletionHandler:", v1, v3);

}

uint64_t __71__EAEmergencyAlertCenter_addNotificationRequest_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

- (void)handleAppleSafetyAlertMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Missing CmamText and CmamLongText key. Dropping the Safety alert", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Safety alert did not match any existing alert", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_debug_impl(&dword_21A501000, v7, OS_LOG_TYPE_DEBUG, "Apple safety alert did not match previous alert: %@", a1, 0xCu);

}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21A501000, log, OS_LOG_TYPE_ERROR, "Missing UserInfo", buf, 2u);
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Failed to create new content", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__EAEmergencyAlertCenter_handleAppleSafetyAlertMessage___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21A501000, a2, OS_LOG_TYPE_ERROR, "Error while updating the notification content: %@", (uint8_t *)&v2, 0xCu);
}

- (void)handleRawCellBroadcastMessage:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Invalid CellBroadcast dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addNotificationRequest:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Missing userNotificationCenter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

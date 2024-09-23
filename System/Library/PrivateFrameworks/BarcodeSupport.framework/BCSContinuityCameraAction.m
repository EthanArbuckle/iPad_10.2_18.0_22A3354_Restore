@implementation BCSContinuityCameraAction

- (BCSContinuityCameraAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6;
  id v7;
  BCSContinuityCameraAction *v8;
  BCSContinuityCameraAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v11.receiver = self;
  v11.super_class = (Class)BCSContinuityCameraAction;
  v8 = -[BCSAction initWithData:codePayload:](&v11, sel_initWithData_codePayload_, v6, v7);
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (void)setConnecting:(BOOL)a3
{
  id v4;

  if (self->_connecting != a3)
  {
    self->_connecting = a3;
    -[BCSAction delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "actionDidUpdateTitle:", self);

  }
}

- (BOOL)isContinuityCameraAction
{
  return 1;
}

- (id)localizedDefaultActionDescription
{
  __CFString *v2;

  if (self->_connecting)
    v2 = CFSTR("Connecting to Apple TV…");
  else
    v2 = CFSTR("Connect to Apple TV");
  _BCSLocalizedString(v2, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionIcon
{
  return (id)objc_msgSend(getUIImageClass(), "_systemImageNamed:", CFSTR("appletv.fill"));
}

- (id)actionPickerItems
{
  BCSContinuityCameraActionPickerItem *v3;
  void *v4;
  BCSContinuityCameraActionPickerItem *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = [BCSContinuityCameraActionPickerItem alloc];
  -[BCSAction localizedActionDescription](self, "localizedActionDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BCSActionPickerItem initWithLabel:action:](v3, "initWithLabel:action:", v4, self);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performDefaultAction
{
  -[BCSContinuityCameraAction performDefaultActionWithCompletionHandler:](self, "performDefaultActionWithCompletionHandler:", &__block_literal_global_12);
}

- (void)performDefaultActionWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  RPRemoteDisplaySession *v28;
  RPRemoteDisplaySession *remoteDisplaySession;
  RPRemoteDisplaySession *v30;
  _QWORD v31[4];
  void (**v32)(id, id);
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[128];
  __int128 buf;
  Class (*v45)(uint64_t);
  void *v46;
  uint64_t *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, id))a3;
  -[BCSContinuityCameraAction setConnecting:](self, "setConnecting:", 1);
  v5 = (void *)MEMORY[0x24BDD1808];
  -[BCSAction data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsWithURL:resolvingAgainstBaseURL:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v8, "queryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v14, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v11);
    }

    v34 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 0, &v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v34;
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v18, "_bcs_privacyPreservingDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Failed to serialize pairing info: %@", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSActionErrorDomain"), 3, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v20);
    }
    else
    {
      v39 = 0;
      v40 = &v39;
      v41 = 0x2050000000;
      v21 = (void *)getRPRemoteDisplayDeviceClass_softClass;
      v42 = getRPRemoteDisplayDeviceClass_softClass;
      v22 = MEMORY[0x24BDAC760];
      if (!getRPRemoteDisplayDeviceClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v45 = __getRPRemoteDisplayDeviceClass_block_invoke;
        v46 = &unk_24D787158;
        v47 = &v39;
        __getRPRemoteDisplayDeviceClass_block_invoke((uint64_t)&buf);
        v21 = (void *)v40[3];
      }
      v23 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v39, 8);
      v20 = objc_alloc_init(v23);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIdentifier:", v25);

      v39 = 0;
      v40 = &v39;
      v41 = 0x2050000000;
      v26 = (void *)getRPRemoteDisplaySessionClass_softClass;
      v42 = getRPRemoteDisplaySessionClass_softClass;
      if (!getRPRemoteDisplaySessionClass_softClass)
      {
        *(_QWORD *)&buf = v22;
        *((_QWORD *)&buf + 1) = 3221225472;
        v45 = __getRPRemoteDisplaySessionClass_block_invoke;
        v46 = &unk_24D787158;
        v47 = &v39;
        __getRPRemoteDisplaySessionClass_block_invoke((uint64_t)&buf);
        v26 = (void *)v40[3];
      }
      v27 = objc_retainAutorelease(v26);
      _Block_object_dispose(&v39, 8);
      v28 = (RPRemoteDisplaySession *)objc_alloc_init(v27);
      remoteDisplaySession = self->_remoteDisplaySession;
      self->_remoteDisplaySession = v28;

      -[RPRemoteDisplaySession setDestinationDevice:](self->_remoteDisplaySession, "setDestinationDevice:", v20);
      if (remoteDisplaySessionQueue_onceToken != -1)
        dispatch_once(&remoteDisplaySessionQueue_onceToken, &__block_literal_global_55);
      -[RPRemoteDisplaySession setDispatchQueue:](self->_remoteDisplaySession, "setDispatchQueue:", remoteDisplaySessionQueue_queue);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[RPRemoteDisplaySession setPairingInfo:](self->_remoteDisplaySession, "setPairingInfo:", v17);
      -[RPRemoteDisplaySession setPasswordType:](self->_remoteDisplaySession, "setPasswordType:", 10);
      -[RPRemoteDisplaySession setServiceType:](self->_remoteDisplaySession, "setServiceType:", CFSTR("com.apple.ddui.guestpairing"));
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Connecting camera", (uint8_t *)&buf, 2u);
      }
      objc_initWeak((id *)&buf, self);
      v30 = self->_remoteDisplaySession;
      v31[0] = v22;
      v31[1] = 3221225472;
      v31[2] = __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke;
      v31[3] = &unk_24D788398;
      v32 = v4;
      objc_copyWeak(&v33, (id *)&buf);
      -[RPRemoteDisplaySession activateWithCompletion:](v30, "activateWithCompletion:", v31);
      objc_destroyWeak(&v33);

      objc_destroyWeak((id *)&buf);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Failed to get URL components", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSActionErrorDomain"), 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
  }

}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24D788370;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v8);

}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2(id *a1)
{
  id *v2;
  void (**v3)(id, void *);
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  v2 = a1 + 4;
  if (a1[4])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2_cold_1(v2);
    v3 = (void (**)(id, void *))a1[5];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSActionErrorDomain"), 3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v4);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Successfully connected", buf, 2u);
    }
    v5 = dispatch_time(0, 10000000000);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_19;
    v6[3] = &unk_24D788348;
    objc_copyWeak(&v8, a1 + 6);
    v7 = a1[5];
    dispatch_after(v5, MEMORY[0x24BDAC9B8], v6);

    objc_destroyWeak(&v8);
  }
}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  uint8_t v5[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSContinuityCameraAction: Invalidating session and calling completion", v5, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 13), "invalidate");
    v4 = (void *)v3[13];
    v3[13] = 0;

    objc_msgSend(v3, "setConnecting:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isConnecting
{
  return self->_connecting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisplaySessionQueue, 0);
  objc_storeStrong((id *)&self->_remoteDisplaySession, 0);
}

void __71__BCSContinuityCameraAction_performDefaultActionWithCompletionHandler___block_invoke_2_cold_1(id *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSContinuityCameraAction: Failed to connect: %{public}@", (uint8_t *)&v2, 0xCu);

}

@end

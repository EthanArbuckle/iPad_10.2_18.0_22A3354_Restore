@implementation HMSettingsMessageHandler

- (void)configureWithContext:(id)a3
{
  if (self)
    objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)sendUpdateValueMessage:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  const char *v14;
  void *v15;
  id v16;
  SEL v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  SEL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  SEL v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  HMSettingsMessageHandler *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMSettingsMessageHandler *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _QWORD aBlock[4];
  void (**v51)(_QWORD, _QWORD);
  _QWORD v52[4];
  _QWORD v53[2];
  id Property;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  const char *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = (void (**)(_QWORD, _QWORD))v10;
  if (!self)
  {
    if (v10)
      goto LABEL_6;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSettingsMessageHandler sendUpdateValueMessage:value:completionHandler:]", CFSTR("completionHandler"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1A1AC1AAC]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v43;
      v58 = 2112;
      v59 = (const char *)v39;
      _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v39, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  v13 = objc_getProperty(self, v11, 8, 1);
  if (!v12)
    goto LABEL_10;
  v15 = v13;
  if (v13)
  {
    v52[0] = CFSTR("value");
    v52[1] = CFSTR("keyPath");
    v53[0] = v9;
    v53[1] = v8;
    v52[2] = CFSTR("SettingTargetType");
    Property = objc_getProperty(self, v14, 32, 1);
    v52[3] = CFSTR("kUserUUIDKey");
    v16 = Property;
    v55 = objc_getProperty(self, v17, 24, 1);
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = v55;
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D285F8];
    v21 = objc_alloc(MEMORY[0x1E0D285D8]);
    v23 = (void *)objc_msgSend(v21, "initWithTarget:", objc_getProperty(self, v22, 16, 1));
    objc_msgSend(v20, "messageWithName:destination:payload:", CFSTR("HMS.uv"), v23, v45);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke;
    aBlock[3] = &unk_1E3AAFEB8;
    v51 = v12;
    v26 = _Block_copy(aBlock);
    objc_msgSend(objc_getProperty(self, v27, 8, 1), "pendingRequests");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = _Block_copy(v26);
    objc_msgSend(v28, "addCompletionBlock:forIdentifier:", v30, v29);

    v46[0] = v25;
    v46[1] = 3221225472;
    v46[2] = __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke_2;
    v46[3] = &unk_1E3AB60C8;
    v47 = v28;
    v48 = v29;
    v49 = v26;
    v31 = v26;
    v32 = v29;
    v33 = v28;
    objc_msgSend(v24, "setResponseHandler:", v46);
    objc_msgSend(v15, "messageDispatcher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sendMessage:completionHandler:", v24, 0);

    goto LABEL_9;
  }
LABEL_6:
  v35 = (void *)MEMORY[0x1A1AC1AAC]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v38;
    v58 = 2080;
    v59 = "-[HMSettingsMessageHandler sendUpdateValueMessage:value:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v35);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v12)[2](v12, v15);
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSettingsType, 0);
  objc_storeStrong((id *)&self->_userTargetUUID, 0);
  objc_storeStrong((id *)&self->_homeTargetUUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__HMSettingsMessageHandler_sendUpdateValueMessage_value_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end

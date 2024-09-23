@implementation MDMRequestClasses

+ (Class)classForRequestType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = classForRequestType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&classForRequestType__onceToken, &__block_literal_global_4);
  objc_msgSend((id)classForRequestType__requestClassByRequestType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

void __41__MDMRequestClasses_classForRequestType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 12);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_class();
  +[MDMRequestClearRestrictionsPasswordCommand requestType](MDMRequestClearRestrictionsPasswordCommand, "requestType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v0, v1);

  v2 = objc_opt_class();
  +[MDMRequestDeviceLocationCommand requestType](MDMRequestDeviceLocationCommand, "requestType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v2, v3);

  v4 = objc_opt_class();
  +[MDMRequestDeviceLockCommand requestType](MDMRequestDeviceLockCommand, "requestType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v4, v5);

  v6 = objc_opt_class();
  +[MDMRequestDisableLostModeCommand requestType](MDMRequestDisableLostModeCommand, "requestType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v6, v7);

  v8 = objc_opt_class();
  +[MDMRequestEnableLostModeCommand requestType](MDMRequestEnableLostModeCommand, "requestType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v8, v9);

  v10 = objc_opt_class();
  +[MDMRequestEraseDeviceCommand requestType](MDMRequestEraseDeviceCommand, "requestType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v10, v11);

  v12 = objc_opt_class();
  +[MDMRequestLogOutUserCommand requestType](MDMRequestLogOutUserCommand, "requestType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v12, v13);

  v14 = objc_opt_class();
  +[MDMRequestPlayLostModeSoundCommand requestType](MDMRequestPlayLostModeSoundCommand, "requestType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v14, v15);

  v16 = objc_opt_class();
  +[MDMRequestRestartDeviceCommand requestType](MDMRequestRestartDeviceCommand, "requestType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v16, v17);

  v18 = objc_opt_class();
  +[MDMRequestSecurityInfoCommand requestType](MDMRequestSecurityInfoCommand, "requestType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v18, v19);

  v20 = objc_opt_class();
  +[MDMRequestShutDownDeviceCommand requestType](MDMRequestShutDownDeviceCommand, "requestType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, v21);

  v22 = objc_opt_class();
  +[MDMRequestUserListCommand requestType](MDMRequestUserListCommand, "requestType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, v23);

  v24 = objc_msgSend(v26, "copy");
  v25 = (void *)classForRequestType__requestClassByRequestType;
  classForRequestType__requestClassByRequestType = v24;

}

@end

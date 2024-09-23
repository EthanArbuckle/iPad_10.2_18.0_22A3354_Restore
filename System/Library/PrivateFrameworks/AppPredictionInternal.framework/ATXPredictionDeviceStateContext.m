@implementation ATXPredictionDeviceStateContext

- (ATXPredictionDeviceStateContext)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  ATXPredictionDeviceStateContext *v9;
  NSObject *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXPredictionDeviceStateContext initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "wifiSSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "onWifi");
  v8 = objc_msgSend(v5, "inAirplaneMode");

  self = -[ATXPredictionDeviceStateContext initWithWifiSSID:onWifi:inAirplaneMode:](self, "initWithWifiSSID:onWifi:inAirplaneMode:", v6, v7, v8);
  v9 = self;
LABEL_8:

  return v9;
}

- (ATXPredictionDeviceStateContext)initWithWifiSSID:(id)a3 onWifi:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
  id v8;
  ATXPredictionDeviceStateContext *v9;
  uint64_t v10;
  NSString *wifiSSID;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXPredictionDeviceStateContext;
  v9 = -[ATXPredictionDeviceStateContext init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    wifiSSID = v9->_wifiSSID;
    v9->_wifiSSID = (NSString *)v10;

    v9->_onWifi = a4;
    v9->_inAirplaneMode = a5;
  }

  return v9;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setWifiSSID:", self->_wifiSSID);
  objc_msgSend(v3, "setOnWifi:", self->_onWifi);
  objc_msgSend(v3, "setInAirplaneMode:", self->_inAirplaneMode);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSSID, 0);
}

- (id)description
{
  void *v2;
  void *v3;

  -[ATXPredictionDeviceStateContext jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)jsonDict
{
  NSString *wifiSSID;
  const __CFString *v3;
  _BOOL4 inAirplaneMode;
  const __CFString *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  wifiSSID = self->_wifiSSID;
  v7[0] = CFSTR("wifiSSID");
  v7[1] = CFSTR("onWifi");
  if (self->_onWifi)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v8[0] = wifiSSID;
  v8[1] = v3;
  inAirplaneMode = self->_inAirplaneMode;
  v7[2] = CFSTR("inAirplaneMode");
  if (inAirplaneMode)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ATXPredictionDeviceStateContext)initWithProtoData:(id)a3
{
  id v4;
  ATXPBPredictionDeviceStateContext *v5;
  ATXPredictionDeviceStateContext *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBPredictionDeviceStateContext initWithData:]([ATXPBPredictionDeviceStateContext alloc], "initWithData:", v4);

    self = -[ATXPredictionDeviceStateContext initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXPredictionDeviceStateContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXPredictionDeviceStateContext *v4;
  ATXPredictionDeviceStateContext *v5;
  BOOL v6;

  v4 = (ATXPredictionDeviceStateContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPredictionDeviceStateContext isEqualToATXPredictionDeviceStateContext:](self, "isEqualToATXPredictionDeviceStateContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXPredictionDeviceStateContext:(id)a3
{
  id *v4;
  NSString *wifiSSID;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  BOOL v10;

  v4 = (id *)a3;
  wifiSSID = self->_wifiSSID;
  v6 = (NSString *)v4[2];
  if (wifiSSID == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = wifiSSID;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  if (self->_onWifi != *((unsigned __int8 *)v4 + 8))
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = self->_inAirplaneMode == *((unsigned __int8 *)v4 + 9);
LABEL_8:

  return v10;
}

- (BOOL)onWifi
{
  return self->_onWifi;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionDeviceStateContext proto", (uint8_t *)&v5, 0xCu);

}

@end

@implementation ATXPredictionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothEvent, 0);
  objc_storeStrong((id *)&self->_microlocationVisitEvent, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_userFocusComputedModeEvent, 0);
  objc_storeStrong((id *)&self->_inferredModeEvent, 0);
  objc_storeStrong((id *)&self->_candidateIdentifiersLaunchAge, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_ambientLightContext, 0);
  objc_storeStrong((id *)&self->_locationMotionContext, 0);
  objc_storeStrong((id *)&self->_timeContext, 0);
  objc_storeStrong((id *)&self->_deviceStateContext, 0);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (ATXPredictionContext)initWithProtoData:(id)a3
{
  id v4;
  ATXPBPredictionContext *v5;
  ATXPredictionContext *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBPredictionContext initWithData:]([ATXPBPredictionContext alloc], "initWithData:", v4);

    self = -[ATXPredictionContext initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXPredictionContext)initWithProto:(id)a3
{
  id v4;
  id v5;
  ATXPredictionDeviceStateContext *v6;
  void *v7;
  ATXPredictionDeviceStateContext *v8;
  ATXPredictionTimeContext *v9;
  void *v10;
  ATXPredictionTimeContext *v11;
  ATXPredictionLocationMotionContext *v12;
  void *v13;
  ATXPredictionLocationMotionContext *v14;
  ATXPredictionAmbientLightContext *v15;
  void *v16;
  ATXPredictionAmbientLightContext *v17;
  ATXPredictionUserContext *v18;
  void *v19;
  ATXPredictionUserContext *v20;
  uint64_t v21;
  ATXPredictionContext *v22;
  NSObject *v23;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[ATXPredictionContext initWithProto:].cold.1((uint64_t)self, v23);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = [ATXPredictionDeviceStateContext alloc];
  objc_msgSend(v5, "deviceStateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXPredictionDeviceStateContext initWithProto:](v6, "initWithProto:", v7);

  v9 = [ATXPredictionTimeContext alloc];
  objc_msgSend(v5, "timeContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXPredictionTimeContext initWithProto:](v9, "initWithProto:", v10);

  v12 = [ATXPredictionLocationMotionContext alloc];
  objc_msgSend(v5, "locationMotionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXPredictionLocationMotionContext initWithProto:](v12, "initWithProto:", v13);

  v15 = [ATXPredictionAmbientLightContext alloc];
  objc_msgSend(v5, "ambientLightContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ATXPredictionAmbientLightContext initWithProto:](v15, "initWithProto:", v16);

  v18 = [ATXPredictionUserContext alloc];
  objc_msgSend(v5, "userContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ATXPredictionUserContext initWithProto:](v18, "initWithProto:", v19);

  v21 = objc_msgSend(v5, "isOverridden");
  self = -[ATXPredictionContext initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:](self, "initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:", v8, v11, v14, v17, v20, v21);

  v22 = self;
LABEL_8:

  return v22;
}

- (ATXPredictionContext)initWithDeviceStateContext:(id)a3 timeContext:(id)a4 locationMotionContext:(id)a5 ambientLightContext:(id)a6 userContext:(id)a7 isOverridden:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXPredictionContext *v18;
  ATXPredictionContext *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXPredictionContext;
  v18 = -[ATXPredictionContext init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_deviceStateContext, a3);
    objc_storeStrong((id *)&v19->_timeContext, a4);
    objc_storeStrong((id *)&v19->_locationMotionContext, a5);
    objc_storeStrong((id *)&v19->_ambientLightContext, a6);
    objc_storeStrong((id *)&v19->_userContext, a7);
    v19->_isOverridden = a8;
  }

  return v19;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXPredictionContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[ATXPredictionDeviceStateContext proto](self->_deviceStateContext, "proto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceStateContext:", v4);

  -[ATXPredictionTimeContext proto](self->_timeContext, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeContext:", v5);

  -[ATXPredictionLocationMotionContext proto](self->_locationMotionContext, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocationMotionContext:", v6);

  -[ATXPredictionAmbientLightContext proto](self->_ambientLightContext, "proto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAmbientLightContext:", v7);

  -[ATXPredictionUserContext proto](self->_userContext, "proto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserContext:", v8);

  objc_msgSend(v3, "setIsOverridden:", self->_isOverridden);
  return v3;
}

- (ATXPredictionContext)initWithDeviceStateContext:(id)a3 timeContext:(id)a4 locationMotionContext:(id)a5 ambientLightContext:(id)a6 userContext:(id)a7
{
  return -[ATXPredictionContext initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:](self, "initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:", a3, a4, a5, a6, a7, 0);
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[ATXPredictionContext jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)updateWithInjectedContext:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *p_deviceStateContext;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  if (v6 == (void *)objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_deviceStateContext;
LABEL_14:
    objc_storeStrong(p_deviceStateContext, a3);
    goto LABEL_15;
  }
  if (v6 == (void *)objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_timeContext;
    goto LABEL_14;
  }
  if (v6 == (void *)objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_locationMotionContext;
    goto LABEL_14;
  }
  if (v6 == (void *)objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_ambientLightContext;
    goto LABEL_14;
  }
  if (v6 == (void *)objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_userContext;
    goto LABEL_14;
  }
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ATXPredictionContext updateWithInjectedContext:].cold.1(v6, v7);

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(v6, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise:format:", v9, CFSTR("Unexpected context injected %@"), v10);

LABEL_15:
}

- (void)updateTimeContextWithDate:(id)a3
{
  id v4;
  ATXPredictionTimeContext *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPredictionTimeContext initWithDate:]([ATXPredictionTimeContext alloc], "initWithDate:", v4);

    -[ATXPredictionContext updateWithInjectedContext:](self, "updateWithInjectedContext:", v5);
  }
}

- (unsigned)dataVersion
{
  return 1;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  NSDictionary *candidateIdentifiersLaunchAge;
  BMUserFocusInferredMode *inferredModeEvent;
  BMUserFocusModeComputed *userFocusComputedModeEvent;
  const __CFString *poiCategory;
  ATXBluetoothDuetEvent *bluetoothEvent;
  ATXMicrolocationVisitDuetEvent *microlocationVisitEvent;
  void *v16;
  _QWORD v18[12];
  _QWORD v19[13];

  v19[12] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("deviceStateContext");
  -[ATXPredictionDeviceStateContext jsonDict](self->_deviceStateContext, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v18[1] = CFSTR("timeContext");
  -[ATXPredictionTimeContext jsonDict](self->_timeContext, "jsonDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v4;
  v18[2] = CFSTR("locationMotionContext");
  -[ATXPredictionLocationMotionContext jsonDict](self->_locationMotionContext, "jsonDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v5;
  v18[3] = CFSTR("ambientLightContext");
  -[ATXPredictionAmbientLightContext jsonDict](self->_ambientLightContext, "jsonDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v6;
  v18[4] = CFSTR("userContext");
  -[ATXPredictionUserContext jsonDict](self->_userContext, "jsonDict");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("YES");
  if (!self->_isOverridden)
    v9 = CFSTR("NO");
  v19[4] = v7;
  v19[5] = v9;
  v18[5] = CFSTR("isOverridden");
  v18[6] = CFSTR("candidateIdentifiersLaunchAge");
  candidateIdentifiersLaunchAge = self->_candidateIdentifiersLaunchAge;
  inferredModeEvent = self->_inferredModeEvent;
  if (!candidateIdentifiersLaunchAge)
    candidateIdentifiersLaunchAge = (NSDictionary *)CFSTR("nil");
  if (!inferredModeEvent)
    inferredModeEvent = (BMUserFocusInferredMode *)CFSTR("nil");
  v19[6] = candidateIdentifiersLaunchAge;
  v19[7] = inferredModeEvent;
  v18[7] = CFSTR("inferredModeEvent");
  v18[8] = CFSTR("userFocusComputedModeEvent");
  userFocusComputedModeEvent = self->_userFocusComputedModeEvent;
  poiCategory = (const __CFString *)self->_poiCategory;
  if (!userFocusComputedModeEvent)
    userFocusComputedModeEvent = (BMUserFocusModeComputed *)CFSTR("nil");
  if (!poiCategory)
    poiCategory = CFSTR("nil");
  v19[8] = userFocusComputedModeEvent;
  v19[9] = poiCategory;
  v18[9] = CFSTR("poiCategory");
  v18[10] = CFSTR("bluetoothEvent");
  microlocationVisitEvent = self->_microlocationVisitEvent;
  bluetoothEvent = self->_bluetoothEvent;
  if (!bluetoothEvent)
    bluetoothEvent = (ATXBluetoothDuetEvent *)CFSTR("nil");
  v18[11] = CFSTR("microlocationVisitEvent");
  if (!microlocationVisitEvent)
    microlocationVisitEvent = (ATXMicrolocationVisitDuetEvent *)CFSTR("nil");
  v19[10] = bluetoothEvent;
  v19[11] = microlocationVisitEvent;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXPredictionContext jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXPredictionContext encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("predictionContext"));

}

- (ATXPredictionContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  ATXPredictionContext *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXPredictionContext checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("predictionContext"), v4, CFSTR("com.apple.duetexpertd.ATXPredictionContext"), -1);

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    self = -[ATXPredictionContext initWithProtoData:](self, "initWithProtoData:", v5);
    v7 = self;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXPredictionContext *v4;
  ATXPredictionContext *v5;
  BOOL v6;

  v4 = (ATXPredictionContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPredictionContext isEqualToATXPredictionContext:](self, "isEqualToATXPredictionContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXPredictionContext:(id)a3
{
  id *v4;
  ATXPredictionDeviceStateContext *deviceStateContext;
  ATXPredictionDeviceStateContext *v6;
  ATXPredictionDeviceStateContext *v7;
  ATXPredictionDeviceStateContext *v8;
  BOOL v9;
  ATXPredictionTimeContext *timeContext;
  ATXPredictionTimeContext *v11;
  ATXPredictionTimeContext *v12;
  ATXPredictionTimeContext *v13;
  BOOL v14;
  ATXPredictionLocationMotionContext *locationMotionContext;
  ATXPredictionLocationMotionContext *v16;
  ATXPredictionLocationMotionContext *v17;
  ATXPredictionLocationMotionContext *v18;
  BOOL v19;
  ATXPredictionAmbientLightContext *ambientLightContext;
  ATXPredictionAmbientLightContext *v21;
  ATXPredictionAmbientLightContext *v22;
  ATXPredictionAmbientLightContext *v23;
  BOOL v24;
  ATXPredictionUserContext *userContext;
  ATXPredictionUserContext *v26;
  ATXPredictionUserContext *v27;
  ATXPredictionUserContext *v28;
  BOOL v29;
  BOOL v30;

  v4 = (id *)a3;
  deviceStateContext = self->_deviceStateContext;
  v6 = (ATXPredictionDeviceStateContext *)v4[2];
  if (deviceStateContext == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = deviceStateContext;
    v9 = -[ATXPredictionDeviceStateContext isEqual:](v8, "isEqual:", v7);

    if (!v9)
      goto LABEL_19;
  }
  timeContext = self->_timeContext;
  v11 = (ATXPredictionTimeContext *)v4[3];
  if (timeContext == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = timeContext;
    v14 = -[ATXPredictionTimeContext isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_19;
  }
  locationMotionContext = self->_locationMotionContext;
  v16 = (ATXPredictionLocationMotionContext *)v4[4];
  if (locationMotionContext == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = locationMotionContext;
    v19 = -[ATXPredictionLocationMotionContext isEqual:](v18, "isEqual:", v17);

    if (!v19)
      goto LABEL_19;
  }
  ambientLightContext = self->_ambientLightContext;
  v21 = (ATXPredictionAmbientLightContext *)v4[5];
  if (ambientLightContext == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = ambientLightContext;
    v24 = -[ATXPredictionAmbientLightContext isEqual:](v23, "isEqual:", v22);

    if (!v24)
      goto LABEL_19;
  }
  userContext = self->_userContext;
  v26 = (ATXPredictionUserContext *)v4[6];
  if (userContext == v26)
  {

    goto LABEL_22;
  }
  v27 = v26;
  v28 = userContext;
  v29 = -[ATXPredictionUserContext isEqual:](v28, "isEqual:", v27);

  if (v29)
  {
LABEL_22:
    v30 = self->_isOverridden == *((unsigned __int8 *)v4 + 8);
    goto LABEL_20;
  }
LABEL_19:
  v30 = 0;
LABEL_20:

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXPredictionContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[ATXPredictionContext initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:](+[ATXPredictionContext allocWithZone:](ATXPredictionContext, "allocWithZone:", a3), "initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:", self->_deviceStateContext, self->_timeContext, self->_locationMotionContext, self->_ambientLightContext, self->_userContext, self->_isOverridden);
  -[ATXPredictionContext candidateIdentifiersLaunchAge](self, "candidateIdentifiersLaunchAge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContext setCandidateIdentifiersLaunchAge:](v4, "setCandidateIdentifiersLaunchAge:", v5);

  -[ATXPredictionContext inferredModeEvent](self, "inferredModeEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContext setInferredModeEvent:](v4, "setInferredModeEvent:", v6);

  -[ATXPredictionContext userFocusComputedModeEvent](self, "userFocusComputedModeEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContext setUserFocusComputedModeEvent:](v4, "setUserFocusComputedModeEvent:", v7);

  -[ATXPredictionContext poiCategory](self, "poiCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContext setPoiCategory:](v4, "setPoiCategory:", v8);

  -[ATXPredictionContext bluetoothEvent](self, "bluetoothEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContext setBluetoothEvent:](v4, "setBluetoothEvent:", v9);

  -[ATXPredictionContext microlocationVisitEvent](self, "microlocationVisitEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContext setMicrolocationVisitEvent:](v4, "setMicrolocationVisitEvent:", v10);

  return v4;
}

- (BOOL)isOverridden
{
  return self->_isOverridden;
}

- (void)setIsOverridden:(BOOL)a3
{
  self->_isOverridden = a3;
}

- (ATXPredictionDeviceStateContext)deviceStateContext
{
  return self->_deviceStateContext;
}

- (void)setDeviceStateContext:(id)a3
{
  objc_storeStrong((id *)&self->_deviceStateContext, a3);
}

- (ATXPredictionTimeContext)timeContext
{
  return self->_timeContext;
}

- (void)setTimeContext:(id)a3
{
  objc_storeStrong((id *)&self->_timeContext, a3);
}

- (ATXPredictionLocationMotionContext)locationMotionContext
{
  return self->_locationMotionContext;
}

- (void)setLocationMotionContext:(id)a3
{
  objc_storeStrong((id *)&self->_locationMotionContext, a3);
}

- (ATXPredictionAmbientLightContext)ambientLightContext
{
  return self->_ambientLightContext;
}

- (void)setAmbientLightContext:(id)a3
{
  objc_storeStrong((id *)&self->_ambientLightContext, a3);
}

- (ATXPredictionUserContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (NSDictionary)candidateIdentifiersLaunchAge
{
  return self->_candidateIdentifiersLaunchAge;
}

- (void)setCandidateIdentifiersLaunchAge:(id)a3
{
  objc_storeStrong((id *)&self->_candidateIdentifiersLaunchAge, a3);
}

- (BMUserFocusInferredMode)inferredModeEvent
{
  return self->_inferredModeEvent;
}

- (void)setInferredModeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_inferredModeEvent, a3);
}

- (BMUserFocusModeComputed)userFocusComputedModeEvent
{
  return self->_userFocusComputedModeEvent;
}

- (void)setUserFocusComputedModeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_userFocusComputedModeEvent, a3);
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategory, a3);
}

- (ATXMicrolocationVisitDuetEvent)microlocationVisitEvent
{
  return self->_microlocationVisitEvent;
}

- (void)setMicrolocationVisitEvent:(id)a3
{
  objc_storeStrong((id *)&self->_microlocationVisitEvent, a3);
}

- (ATXBluetoothDuetEvent)bluetoothEvent
{
  return self->_bluetoothEvent;
}

- (void)setBluetoothEvent:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothEvent, a3);
}

- (void)updateWithInjectedContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Unexpected context injected %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
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
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end

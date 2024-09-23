@implementation ATXModeConfigurationUIFlowLoggingEvent

- (ATXModeConfigurationUIFlowLoggingEvent)initWithDndModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 suggestedEntityIdentifiers:(id)a7 candidateEntityIdentifiers:(id)a8 previousEntityIdentifiers:(id)a9 currentEntityIdentifiers:(id)a10 eventDate:(id)a11
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  ATXModeConfigurationUIFlowLoggingEvent *v19;
  ATXModeConfigurationUIFlowLoggingEvent *v20;
  id v22;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v16 = a7;
  v28 = a8;
  v27 = a9;
  v26 = a10;
  v17 = a11;
  if (!v15)
  {
    v22 = v16;
    __atxlog_handle_notification_management();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[ATXModeConfigurationUIFlowLoggingEvent initWithDndModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:].cold.1(v18);

    v16 = v22;
  }
  v29.receiver = self;
  v29.super_class = (Class)ATXModeConfigurationUIFlowLoggingEvent;
  v19 = -[ATXModeConfigurationUIFlowLoggingEvent init](&v29, sel_init, v22);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dndModeUUID, a3);
    v20->_modeConfigurationEntityType = a5;
    v20->_modeConfigurationUI = a4;
    objc_storeStrong((id *)&v20->_suggestedEntityIdentifiers, a7);
    objc_storeStrong((id *)&v20->_candidateEntityIdentifiers, a8);
    objc_storeStrong((id *)&v20->_previousEntityIdentifiers, a9);
    objc_storeStrong((id *)&v20->_currentEntityIdentifiers, a10);
    objc_storeStrong((id *)&v20->_eventDate, a11);
    v20->_modeConfigurationType = a6;
  }

  return v20;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonRawData
{
  void *v3;
  uint64_t modeConfigurationUI;
  __CFString *v5;
  uint64_t modeConfigurationEntityType;
  __CFString *v7;
  int64_t modeConfigurationType;
  __CFString *v9;
  NSArray *suggestedEntityIdentifiers;
  NSArray *candidateEntityIdentifiers;
  NSArray *v12;
  NSArray *currentEntityIdentifiers;
  NSArray *previousEntityIdentifiers;
  NSArray *v15;
  void *v16;
  void *v17;
  _QWORD v19[9];
  _QWORD v20[10];

  v20[9] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("dndModeUUID");
  -[NSUUID UUIDString](self->_dndModeUUID, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v19[1] = CFSTR("modeConfigurationUI");
  modeConfigurationUI = self->_modeConfigurationUI;
  if (modeConfigurationUI >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationUI);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E4D5A758[modeConfigurationUI];
  }
  v20[1] = v5;
  v19[2] = CFSTR("modeConfigurationEntityType");
  modeConfigurationEntityType = self->_modeConfigurationEntityType;
  if (modeConfigurationEntityType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationEntityType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E4D5A778[modeConfigurationEntityType];
  }
  v20[2] = v7;
  v19[3] = CFSTR("modeConfigurationType");
  modeConfigurationType = self->_modeConfigurationType;
  if (modeConfigurationType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeConfigurationType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E4D5A790[(int)modeConfigurationType];
  }
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  if (!suggestedEntityIdentifiers)
    suggestedEntityIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];
  v20[3] = v9;
  v20[4] = suggestedEntityIdentifiers;
  v19[4] = CFSTR("suggestedEntityIdentifiers");
  v19[5] = CFSTR("candidateEntityIdentifiers");
  if (candidateEntityIdentifiers)
    v12 = candidateEntityIdentifiers;
  else
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  if (!currentEntityIdentifiers)
    currentEntityIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];
  v20[5] = v12;
  v20[6] = currentEntityIdentifiers;
  v19[6] = CFSTR("currentEntityIdentifiers");
  v19[7] = CFSTR("previousEntityIdentifiers");
  if (previousEntityIdentifiers)
    v15 = previousEntityIdentifiers;
  else
    v15 = (NSArray *)MEMORY[0x1E0C9AA60];
  v20[7] = v15;
  v19[8] = CFSTR("eventTime");
  -[NSDate description](self->_eventDate, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXModeConfigurationUIFlowLoggingEvent jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXModeConfigurationUIFlowLoggingEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBModeConfigurationUIFlowLoggingEvent *v5;
  ATXModeConfigurationUIFlowLoggingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBModeConfigurationUIFlowLoggingEvent initWithData:]([ATXPBModeConfigurationUIFlowLoggingEvent alloc], "initWithData:", v4);

    self = -[ATXModeConfigurationUIFlowLoggingEvent initWithProto:](self, "initWithProto:", v5);
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

  -[ATXModeConfigurationUIFlowLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXModeConfigurationUIFlowLoggingEvent)initWithProto:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  ATXModeConfigurationUIFlowLoggingEvent *v32;
  ATXModeConfigurationUIFlowLoggingEvent *v33;
  NSObject *v34;
  unsigned int v36;
  unsigned int v37;

  v4 = a3;
  if (!v4)
  {
LABEL_19:
    v33 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v34);

    goto LABEL_19;
  }
  v5 = (objc_class *)MEMORY[0x1E0CB3A28];
  v6 = v4;
  v7 = [v5 alloc];
  objc_msgSend(v6, "dndModeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  v37 = objc_msgSend(v6, "modeConfigurationUI");
  v36 = objc_msgSend(v6, "modeConfigurationEntityType");
  v10 = (int)objc_msgSend(v6, "modeConfigurationType");
  objc_msgSend(v6, "suggestedEntityIdentifiers");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v14 = (void *)v11;
  else
    v14 = (void *)MEMORY[0x1E0C9AA60];
  v15 = v14;

  objc_msgSend(v6, "candidateEntityIdentifiers");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v13;
  v19 = v18;

  objc_msgSend(v6, "previousEntityIdentifiers");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v13;
  v23 = v22;

  objc_msgSend(v6, "currentEntityIdentifiers");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (void *)v24;
  else
    v26 = v13;
  v27 = v26;

  v28 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "secondsSinceReferenceDate");
  v30 = v29;

  objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[ATXModeConfigurationUIFlowLoggingEvent initWithDndModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:](self, "initWithDndModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:", v9, v37, v36, v10, v15, v19, v23, v27, v31);

  self = v32;
  v33 = self;
LABEL_20:

  return v33;
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
  -[NSUUID UUIDString](self->_dndModeUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDndModeUUID:", v4);

  objc_msgSend(v3, "setModeConfigurationUI:", self->_modeConfigurationUI);
  objc_msgSend(v3, "setModeConfigurationEntityType:", self->_modeConfigurationEntityType);
  objc_msgSend(v3, "setModeConfigurationType:", LODWORD(self->_modeConfigurationType));
  v5 = (void *)-[NSArray mutableCopy](self->_suggestedEntityIdentifiers, "mutableCopy");
  objc_msgSend(v3, "setSuggestedEntityIdentifiers:", v5);

  v6 = (void *)-[NSArray mutableCopy](self->_candidateEntityIdentifiers, "mutableCopy");
  objc_msgSend(v3, "setCandidateEntityIdentifiers:", v6);

  v7 = (void *)-[NSArray mutableCopy](self->_previousEntityIdentifiers, "mutableCopy");
  objc_msgSend(v3, "setPreviousEntityIdentifiers:", v7);

  v8 = (void *)-[NSArray mutableCopy](self->_currentEntityIdentifiers, "mutableCopy");
  objc_msgSend(v3, "setCurrentEntityIdentifiers:", v8);

  -[NSDate timeIntervalSinceReferenceDate](self->_eventDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setSecondsSinceReferenceDate:");
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXModeConfigurationUIFlowLoggingEvent *v6;

  v4 = a3;
  v5 = -[ATXPBModeConfigurationUIFlowLoggingEvent initFromJSON:]([ATXPBModeConfigurationUIFlowLoggingEvent alloc], "initFromJSON:", v4);

  v6 = -[ATXModeConfigurationUIFlowLoggingEvent initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXModeConfigurationUIFlowLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (NSUUID)dndModeUUID
{
  return self->_dndModeUUID;
}

- (int)modeConfigurationEntityType
{
  return self->_modeConfigurationEntityType;
}

- (int)modeConfigurationUI
{
  return self->_modeConfigurationUI;
}

- (NSArray)suggestedEntityIdentifiers
{
  return self->_suggestedEntityIdentifiers;
}

- (NSArray)candidateEntityIdentifiers
{
  return self->_candidateEntityIdentifiers;
}

- (NSArray)previousEntityIdentifiers
{
  return self->_previousEntityIdentifiers;
}

- (NSArray)currentEntityIdentifiers
{
  return self->_currentEntityIdentifiers;
}

- (int64_t)modeConfigurationType
{
  return self->_modeConfigurationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_candidateEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_dndModeUUID, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
}

- (void)initWithDndModeUUID:(os_log_t)log modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "Attempting to initialize ATXModeConfigurationUIFlowLoggingEvent without specifying dndModeUUID", v1, 2u);
}

@end

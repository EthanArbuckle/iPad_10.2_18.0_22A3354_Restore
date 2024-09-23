@implementation ATXModeConfigurationUIFlowLogging

- (ATXModeConfigurationUIFlowLogging)initWithModeConfigurationUIFlowLoggingBiomeStream:(id)a3
{
  id v5;
  ATXModeConfigurationUIFlowLogging *v6;
  ATXModeConfigurationUIFlowLogging *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXModeConfigurationUIFlowLogging;
  v6 = -[ATXModeConfigurationUIFlowLogging init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeConfigurationUIFlowLoggingBiomeStream, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("ATXModeConfigurationUIFlowLogging.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (ATXModeConfigurationUIFlowLogging)init
{
  void *v3;
  ATXModeConfigurationUIFlowLogging *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXModeConfigurationUIFlowLogging initWithModeConfigurationUIFlowLoggingBiomeStream:](self, "initWithModeConfigurationUIFlowLoggingBiomeStream:", v3);

  return v4;
}

- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 previousEntityIdentifiers:(id)a6 suggestedEntityIdentifiers:(id)a7 currentEntityIdentifiers:(id)a8
{
  -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:currentEntityIdentifiers:](self, "logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:currentEntityIdentifiers:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, a6, a7, a8);
}

- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 previousEntityIdentifiers:(id)a7 suggestedEntityIdentifiers:(id)a8 currentEntityIdentifiers:(id)a9
{
  -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:](self, "logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, a7, a8, MEMORY[0x1E0C9AA60], a9);
}

- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 previousEntityIdentifiers:(id)a7 suggestedEntityIdentifiers:(id)a8 candidateEntityIdentifiers:(id)a9 currentEntityIdentifiers:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  int64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  ATXModeConfigurationUIFlowLoggingEvent *v30;
  void *v31;
  ATXModeConfigurationUIFlowLoggingEvent *v32;
  void *v33;
  id v34;
  ATXModeConfigurationUIFlowLogging *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v36 = *(_QWORD *)&a4;
  v37 = *(_QWORD *)&a5;
  v54 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  __atxlog_handle_notification_management();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v35 = self;
    objc_msgSend(v14, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v36);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E4D57730[(int)v36];
    }
    v22 = v21;
    v34 = v14;
    if (v37 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v37);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E4D57750[(int)v37];
    }
    NSStringForATXModeConfigurationType(a6);
    v24 = a6;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v39 = v20;
    v40 = 2112;
    v41 = v22;
    v42 = 2112;
    v43 = v23;
    v44 = 2112;
    v45 = v15;
    v46 = 2112;
    v47 = v16;
    v48 = 2112;
    v49 = v17;
    v50 = 2112;
    v51 = v18;
    v52 = 2112;
    v53 = v25;
    _os_log_impl(&dword_1A49EF000, v19, OS_LOG_TYPE_DEFAULT, "ModeConfigurationUIFlow logging returned from preferences: dndModeUUID: %@ modeConfigurationUI: %@ modeConfigurationEntityType: %@ previousEntityIdentifiers: %@ suggestedEntityIdentifiers: %@ candidateEntityIdentifiers: %@ currentEntityIdentifiers: %@ modeConfigurationType: %@", buf, 0x52u);

    a6 = v24;
    v14 = v34;
    self = v35;
  }

  if (v16)
  {
    if (v17)
      goto LABEL_11;
  }
  else
  {
    __atxlog_handle_notification_management();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:].cold.4();

    if (v17)
    {
LABEL_11:
      if (v15)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  __atxlog_handle_notification_management();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:].cold.3();

  if (v15)
  {
LABEL_12:
    if (v18)
      goto LABEL_26;
    goto LABEL_23;
  }
LABEL_20:
  __atxlog_handle_notification_management();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:].cold.2();

  if (!v18)
  {
LABEL_23:
    __atxlog_handle_notification_management();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:].cold.1();

  }
LABEL_26:
  v30 = [ATXModeConfigurationUIFlowLoggingEvent alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[ATXModeConfigurationUIFlowLoggingEvent initWithDndModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:](v30, "initWithDndModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:", v14, v36, v37, a6, v16, v17, v15, v18, v31);

  -[ATXModeConfigurationUIFlowLoggingBiomeStream source](self->_modeConfigurationUIFlowLoggingBiomeStream, "source");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sendEvent:", v32);

}

- (void)logModeConfigurationChangesOnboardingDismissedForModeUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__ATXModeConfigurationUIFlowLogging_logModeConfigurationChangesOnboardingDismissedForModeUUID___block_invoke;
  block[3] = &unk_1E4D57590;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

void __95__ATXModeConfigurationUIFlowLogging_logModeConfigurationChangesOnboardingDismissedForModeUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[ATXDNDModeConfigurationClient sharedInstance](ATXDNDModeConfigurationClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dndModeForDNDModeWithUUID:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setOnboardingOutcome:", 2);
  objc_msgSend(v2, "semanticType");
  DNDModeSemanticTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModeSemanticType:", v4);

  objc_msgSend(v3, "sendToCoreAnalytics");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_modeConfigurationUIFlowLoggingBiomeStream, 0);
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil currentEntityIdentifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil previousEntityIdentifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil candidateEntityIdentifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil suggestedEntityIdentifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

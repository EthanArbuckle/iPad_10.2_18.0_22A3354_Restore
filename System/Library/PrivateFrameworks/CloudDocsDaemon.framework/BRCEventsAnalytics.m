@implementation BRCEventsAnalytics

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1)
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global_65);
  return (id)sharedAnalytics_analytics;
}

void __37__BRCEventsAnalytics_sharedAnalytics__block_invoke()
{
  BRCEventsAnalytics *v0;
  void *v1;

  v0 = objc_alloc_init(BRCEventsAnalytics);
  v1 = (void *)sharedAnalytics_analytics;
  sharedAnalytics_analytics = (uint64_t)v0;

}

- (void)registerAndSendNewShareAcceptationWithLastStep:(id)a3 zoneMangledID:(id)a4 enhancedDrivePrivacyEnabled:(BOOL)a5 itemIDString:(id)a6 error:(id)a7 analyticsReporter:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v11 = a5;
  v21 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if ((objc_msgSend(v16, "brc_isFrontBoardOpenApplicationRequestDenied") & 1) == 0)
  {
    if (v16)
    {
      +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("FolderSharing"), CFSTR("ShareAcceptation"), v16);

    }
    v19 = +[AppTelemetryTimeSeriesEvent newShareAcceptationEventWithLastStep:zoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:error:](AppTelemetryTimeSeriesEvent, "newShareAcceptationEventWithLastStep:zoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:error:", v21, v14, v11, v15, v16);
    objc_msgSend(v17, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v19);
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("lastStep"));
    objc_msgSend(v20, "setObject:forKey:", CFSTR("none"), CFSTR("error"));
    register_error_in_dictionary(v20, v16);
    -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:](self, "_sendDictionaryToCoreAnalytics:eventName:", v20, CFSTR("com.apple.iCloudDrive.shareAcceptation"));

  }
}

- (void)registerAndSendNewPeriodicSyncWithOutcome:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("periodicSync"));

  -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:](self, "_sendDictionaryToCoreAnalytics:eventName:", v5, CFSTR("com.apple.iCloudDrive.periodicSync"));
}

- (void)registerAndSendNewContainerResetWithOutcome:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("containerReset"));

  -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:](self, "_sendDictionaryToCoreAnalytics:eventName:", v5, CFSTR("com.apple.iCloudDrive.containerReset"));
}

- (void)registerAndSendNewApplyFailureWithOutcome:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("applyFailure"));

  -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:](self, "_sendDictionaryToCoreAnalytics:eventName:", v5, CFSTR("com.apple.iCloudDrive.applyFailure"));
}

- (void)registerAndSendNewFolderSharePCSChainingTime:(double)a3 chainedRecordsCount:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(BOOL)a6 itemIDString:(id)a7 error:(id)a8 analyticsReporter:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v12 = a6;
  v25 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (v18)
  {
    +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("FolderSharing"), CFSTR("PCSChaining"), v18);

  }
  objc_msgSend(v18, "brc_cloudKitErrorMessage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[AppTelemetryTimeSeriesEvent newFolderSharePCSChainingEventWithTime:zoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:error:errorDescription:](AppTelemetryTimeSeriesEvent, "newFolderSharePCSChainingEventWithTime:zoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:error:errorDescription:", v16, v12, v17, v18, v21, a3);

  objc_msgSend(v19, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v22);
  v23 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("PCSChainingTime"));

  if (v25)
    objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("numOfUnchainedFiles"));
  register_error_in_dictionary(v23, v18);
  -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:](self, "_sendDictionaryToCoreAnalytics:eventName:", v23, CFSTR("com.apple.iCloudDrive.folderSharePCSChainingTime"));

}

- (void)_sendDictionaryToCoreAnalytics:(id)a3 eventName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (+[BRCAnalyticsReporter isTelemetryReportingEnabled](BRCAnalyticsReporter, "isTelemetryReportingEnabled"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("CKErrorDomain.2")))
      {
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:].cold.1((uint64_t)v8, v9);
LABEL_9:

      }
    }
    else if (v7)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BRCEventsAnalytics _sendDictionaryToCoreAnalytics:eventName:].cold.2((uint64_t)v7, (uint64_t)v8, v9);
      goto LABEL_9;
    }
    AnalyticsIsEventUsed();
    v10 = v5;
    AnalyticsSendEventLazy();

  }
}

id __63__BRCEventsAnalytics__sendDictionaryToCoreAnalytics_eventName___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_sendDictionaryToCoreAnalytics:(uint64_t)a1 eventName:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![errorString isEqualToString:@\"CKErrorDomain.2\"]%@", (uint8_t *)&v2, 0xCu);
}

- (void)_sendDictionaryToCoreAnalytics:(os_log_t)log eventName:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: error string is not a string value %@%@", (uint8_t *)&v3, 0x16u);
}

@end

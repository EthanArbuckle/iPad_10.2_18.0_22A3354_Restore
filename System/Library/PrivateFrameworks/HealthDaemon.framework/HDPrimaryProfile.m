@implementation HDPrimaryProfile

- (id)currentActivitySummaryHelper
{
  return self->_currentActivitySummaryHelper;
}

- (id)dataCollectionManager
{
  return self->_dataCollectionManager;
}

- (id)workoutManager
{
  return self->_workoutManager;
}

- (id)appSubscriptionManager
{
  return self->_appSubscriptionManager;
}

- (id)nanoSyncManager
{
  return self->_nanoSyncManager;
}

- (id)fitnessMachineManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF252338);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fitnessManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDPrimaryProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HDPrimaryProfile *v13;

  v8 = (void *)MEMORY[0x1E0CB6A10];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "primaryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDPrimaryProfile _initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:](self, "_initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:", v11, v10, v9, v12);

  return v13;
}

- (id)_initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6
{
  id v10;
  HDPrimaryProfile *v11;
  HDAssertionManager *v12;
  HDAssertionManager *sessionAssertionManager;
  HDAgeGatingManager *v14;
  HDAgeGatingManager *ageGatingManager;
  HDRestorableAlarmScheduler *v16;
  HDRestorableAlarmScheduler *alarmScheduler;
  void *v18;
  void *v19;
  int v20;
  HDAppSubscriptionManager *v21;
  HDAppSubscriptionManager *appSubscriptionManager;
  HDAssociationManager *v23;
  HDAssociationManager *associationManager;
  HDAttachmentManager *v25;
  HDAttachmentManager *attachmentManager;
  uint64_t v27;
  HDAWDSubmissionManager *awdSubmissionManager;
  HDCurrentActivitySummaryHelper *v29;
  HDCurrentActivitySummaryHelper *currentActivitySummaryHelper;
  HDProtectedDataOperationScheduler *v31;
  HDProtectedDataOperationScheduler *protectedDataOperationScheduler;
  HDDataCollectionManager *v33;
  HDDataCollectionManager *dataCollectionManager;
  uint64_t v35;
  HDNanoSyncManager *nanoSyncManager;
  HDNotificationManager *v37;
  HDNotificationManager *notificationManager;
  HDNotificationSyncManager *v39;
  HDNotificationSyncManager *notificationSyncManager;
  void *v41;
  int v42;
  uint64_t v43;
  HDPeriodicCountryMonitor *periodicCountryMonitor;
  uint64_t v45;
  HDRapportMessenger *rapportMessenger;
  HDTinkerPrivacyAlertCoordinator *v47;
  HDTinkerPrivacyAlertCoordinator *tinkerPrivacyAlertCoordinator;
  void *v49;
  int v50;
  HDSummarySharingEntryManager *v51;
  HDSummarySharingEntryManager *summarySharingEntryManager;
  HDSummarySharingEntryIDSManager *v53;
  HDSummarySharingEntryIDSManager *summarySharingEntryIDSManager;
  HDDemoDataManager *v55;
  HDDemoDataManager *demoDataManager;
  uint64_t v57;
  HDWorkoutManager *workoutManager;
  void *v59;
  void *v60;
  HDWorkoutCondenser *v61;
  HDWorkoutCondenser *workoutCondenser;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  int v67;
  char v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  objc_super v75;

  v10 = a5;
  v75.receiver = self;
  v75.super_class = (Class)HDPrimaryProfile;
  v11 = -[HDProfile initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:](&v75, sel_initWithDirectoryPath_medicalIDDirectoryPath_daemon_profileIdentifier_, a3, a4, v10, a6);
  if (v11)
  {
    v12 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    sessionAssertionManager = v11->_sessionAssertionManager;
    v11->_sessionAssertionManager = v12;

    v14 = -[HDAgeGatingManager initWithProfile:]([HDAgeGatingManager alloc], "initWithProfile:", v11);
    ageGatingManager = v11->_ageGatingManager;
    v11->_ageGatingManager = v14;

    v16 = -[HDRestorableAlarmScheduler initWithProfile:]([HDRestorableAlarmScheduler alloc], "initWithProfile:", v11);
    alarmScheduler = v11->_alarmScheduler;
    v11->_alarmScheduler = v16;

    -[HDProfile daemon](v11, "daemon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "behavior");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "supportsAppSubscriptions");

    if (v20)
      v21 = -[HDAppSubscriptionManager initWithProfile:]([HDAppSubscriptionManager alloc], "initWithProfile:", v11);
    else
      v21 = 0;
    appSubscriptionManager = v11->_appSubscriptionManager;
    v11->_appSubscriptionManager = v21;

    v23 = -[HDAssociationManager initWithProfile:]([HDAssociationManager alloc], "initWithProfile:", v11);
    associationManager = v11->_associationManager;
    v11->_associationManager = v23;

    v25 = -[HDAttachmentManager initWithProfile:]([HDAttachmentManager alloc], "initWithProfile:", v11);
    attachmentManager = v11->_attachmentManager;
    v11->_attachmentManager = v25;

    v27 = -[HDPrimaryProfile _newAWDSubmissionManager](v11, "_newAWDSubmissionManager");
    awdSubmissionManager = v11->_awdSubmissionManager;
    v11->_awdSubmissionManager = (HDAWDSubmissionManager *)v27;

    v29 = -[HDCurrentActivitySummaryHelper initWithProfile:]([HDCurrentActivitySummaryHelper alloc], "initWithProfile:", v11);
    currentActivitySummaryHelper = v11->_currentActivitySummaryHelper;
    v11->_currentActivitySummaryHelper = v29;

    v31 = -[HDProtectedDataOperationScheduler initWithProfile:]([HDProtectedDataOperationScheduler alloc], "initWithProfile:", v11);
    protectedDataOperationScheduler = v11->_protectedDataOperationScheduler;
    v11->_protectedDataOperationScheduler = v31;

    v33 = -[HDDataCollectionManager initWithProfile:]([HDDataCollectionManager alloc], "initWithProfile:", v11);
    dataCollectionManager = v11->_dataCollectionManager;
    v11->_dataCollectionManager = v33;

    v35 = -[HDPrimaryProfile _newNanoSyncManager](v11, "_newNanoSyncManager");
    nanoSyncManager = v11->_nanoSyncManager;
    v11->_nanoSyncManager = (HDNanoSyncManager *)v35;

    v37 = -[HDNotificationManager initWithProfile:bundle:]([HDNotificationManager alloc], "initWithProfile:bundle:", v11, 0);
    notificationManager = v11->_notificationManager;
    v11->_notificationManager = v37;

    v39 = -[HDNotificationSyncManager initWithProfile:]([HDNotificationSyncManager alloc], "initWithProfile:", v11);
    notificationSyncManager = v11->_notificationSyncManager;
    v11->_notificationSyncManager = v39;

    objc_msgSend(v10, "behavior");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "supportsPeriodicCountryMonitoring");

    if (v42)
    {
      v43 = -[HDPrimaryProfile _newPeriodicCountryMonitorWithNanoSyncManager:](v11, "_newPeriodicCountryMonitorWithNanoSyncManager:", v11->_nanoSyncManager);
      periodicCountryMonitor = v11->_periodicCountryMonitor;
      v11->_periodicCountryMonitor = (HDPeriodicCountryMonitor *)v43;

    }
    v45 = -[HDPrimaryProfile _newRapportMessenger](v11, "_newRapportMessenger");
    rapportMessenger = v11->_rapportMessenger;
    v11->_rapportMessenger = (HDRapportMessenger *)v45;

    v47 = -[HDTinkerPrivacyAlertCoordinator initWithProfile:]([HDTinkerPrivacyAlertCoordinator alloc], "initWithProfile:", v11);
    tinkerPrivacyAlertCoordinator = v11->_tinkerPrivacyAlertCoordinator;
    v11->_tinkerPrivacyAlertCoordinator = v47;

    objc_msgSend(v10, "behavior");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "healthAppSupportedOnDevice");

    if (v50)
    {
      v51 = -[HDSummarySharingEntryManager initWithProfile:]([HDSummarySharingEntryManager alloc], "initWithProfile:", v11);
      summarySharingEntryManager = v11->_summarySharingEntryManager;
      v11->_summarySharingEntryManager = v51;

      v53 = -[HDSummarySharingEntryIDSManager initWithProfile:]([HDSummarySharingEntryIDSManager alloc], "initWithProfile:", v11);
      summarySharingEntryIDSManager = v11->_summarySharingEntryIDSManager;
      v11->_summarySharingEntryIDSManager = v53;

    }
    v55 = -[HDDemoDataManager initWithProfile:]([HDDemoDataManager alloc], "initWithProfile:", v11);
    demoDataManager = v11->_demoDataManager;
    v11->_demoDataManager = v55;

    v57 = -[HDPrimaryProfile _newWorkoutManager](v11, "_newWorkoutManager");
    workoutManager = v11->_workoutManager;
    v11->_workoutManager = (HDWorkoutManager *)v57;

    -[HDProfile daemon](v11, "daemon");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "behavior");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v60, "performsWorkoutCondensation") & 1) != 0 || _HDIsUnitTesting)
      v61 = -[HDWorkoutCondenser initWithProfile:]([HDWorkoutCondenser alloc], "initWithProfile:", v11);
    else
      v61 = 0;

    workoutCondenser = v11->_workoutCondenser;
    v11->_workoutCondenser = v61;

    -[HDProfile daemon](v11, "daemon");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "behavior");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isAppleInternalInstall");

    if (v65)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "BOOLForKey:", CFSTR("HDPPTTestRunning"));
      v68 = objc_msgSend(v66, "BOOLForKey:", CFSTR("HDPPTTestDataUpdateApplied"));
      if (v67 && (v68 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 410255999.0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "timeIntervalSinceDate:", v69);
        v72 = v71;
        -[HDProfile database](v11, "database");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setOffsetTimeInterval:", v72);

        objc_msgSend(v66, "setBool:forKey:", 1, CFSTR("HDPPTTestDataUpdateApplied"));
      }

    }
  }

  return v11;
}

- (void)terminationCleanup
{
  void *v2;
  id v3;

  -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF252338);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "terminationCleanup");
}

- (id)activityCacheInterface
{
  void *v2;
  void *v3;
  void *v4;

  -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF252398);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "activityCacheInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ageGatingManager
{
  return self->_ageGatingManager;
}

- (id)alarmScheduler
{
  return self->_alarmScheduler;
}

- (id)associationManager
{
  return self->_associationManager;
}

- (id)attachmentManager
{
  return self->_attachmentManager;
}

- (id)awdSubmissionManager
{
  return self->_awdSubmissionManager;
}

- (id)workoutCondenser
{
  return self->_workoutCondenser;
}

- (id)notificationManager
{
  return self->_notificationManager;
}

- (id)notificationSyncManager
{
  return self->_notificationSyncManager;
}

- (id)periodicCountryMonitor
{
  return self->_periodicCountryMonitor;
}

- (id)protectedDataOperationScheduler
{
  return self->_protectedDataOperationScheduler;
}

- (id)rapportMessenger
{
  return self->_rapportMessenger;
}

- (id)serviceConnectionManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF252338);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "serviceConnectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serviceManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF252338);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "serviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sessionAssertionManager
{
  return self->_sessionAssertionManager;
}

- (id)tinkerPrivacyAlertCoordinator
{
  return self->_tinkerPrivacyAlertCoordinator;
}

- (id)sharingEntryManager
{
  return self->_summarySharingEntryManager;
}

- (id)summarySharingEntryIDSManager
{
  return self->_summarySharingEntryIDSManager;
}

- (id)_newAWDSubmissionManager
{
  return -[HDAWDSubmissionManager initWithProfile:]([HDAWDSubmissionManager alloc], "initWithProfile:", self);
}

- (id)_newNanoSyncManager
{
  void *v3;
  void *v4;
  HDNanoSyncManager *v5;

  -[HDProfile daemon](self, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "supportsNanoSync"))
    v5 = -[HDNanoSyncManager initWithProfile:isMaster:]([HDNanoSyncManager alloc], "initWithProfile:isMaster:", self, objc_msgSend(v4, "isAppleWatch") ^ 1);
  else
    v5 = 0;

  return v5;
}

- (id)_newPeriodicCountryMonitorWithNanoSyncManager:(id)a3
{
  id v4;
  HDPeriodicCountryMonitor *v5;

  v4 = a3;
  v5 = -[HDPeriodicCountryMonitor initWithProfile:nanoSyncManager:]([HDPeriodicCountryMonitor alloc], "initWithProfile:nanoSyncManager:", self, v4);

  return v5;
}

- (id)_newWorkoutManager
{
  return -[HDWorkoutManager initWithProfile:]([HDWorkoutManager alloc], "initWithProfile:", self);
}

- (id)_newRapportMessenger
{
  return -[HDRapportMessenger initForCompanionDevice]([HDRapportMessenger alloc], "initForCompanionDevice");
}

- (void)unitTest_setNanoSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_nanoSyncManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationManager, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_summarySharingEntryIDSManager, 0);
  objc_storeStrong((id *)&self->_summarySharingEntryManager, 0);
  objc_storeStrong((id *)&self->_tinkerPrivacyAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_demoDataManager, 0);
  objc_storeStrong((id *)&self->_workoutCondenser, 0);
  objc_storeStrong((id *)&self->_workoutManager, 0);
  objc_storeStrong((id *)&self->_sessionAssertionManager, 0);
  objc_storeStrong((id *)&self->_serviceConnectionManager, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_rapportMessenger, 0);
  objc_storeStrong((id *)&self->_protectedDataOperationScheduler, 0);
  objc_storeStrong((id *)&self->_periodicCountryMonitor, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_nanoSyncManager, 0);
  objc_storeStrong((id *)&self->_fitnessMachineManager, 0);
  objc_storeStrong((id *)&self->_dataCollectionManager, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryHelper, 0);
  objc_storeStrong((id *)&self->_awdSubmissionManager, 0);
  objc_storeStrong((id *)&self->_appSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_ageGatingManager, 0);
}

@end

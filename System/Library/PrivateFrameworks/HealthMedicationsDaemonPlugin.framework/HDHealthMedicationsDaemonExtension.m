@implementation HDHealthMedicationsDaemonExtension

- (HDHealthMedicationsDaemonExtension)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHealthMedicationsDaemonExtension)initWithHealthDaemon:(id)a3
{
  id v4;
  HDHealthMedicationsDaemonExtension *v5;
  HDHealthMedicationsDaemonExtension *v6;
  uint64_t v7;
  HKMedicationsBehavior *medicationsBehavior;
  HDMedicationPeriodicScheduler *v9;
  HDMedicationPeriodicScheduler *periodicScheduler;
  HDMedicationCountProvider *v11;
  HDMedicationCountProvider *medicationCountProvider;
  HDOntologyMedsEducationFeatureEvaluator *v13;
  HDOntologyMedsEducationFeatureEvaluator *medsEducationFeatureEvaluator;
  HDDrugInteractionFactorStateProvider *v15;
  HDDrugInteractionFactorStateProvider *drugInteractionStateProvider;
  HDOntologyCoreMedsFeatureEvaluator *v17;
  HDOntologyCoreMedsFeatureEvaluator *coreMedsFeatureEvaluator;
  HDOntologyInteractionsFeatureEvaluator *v19;
  HDOntologyInteractionsFeatureEvaluator *interactionsFeatureEvaluator;
  HDOntologyMedsScanningFeatureEvaluator *v21;
  HDOntologyMedsScanningFeatureEvaluator *medsScanningFeatureEvaluator;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthMedicationsDaemonExtension;
  v5 = -[HDHealthMedicationsDaemonExtension init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    objc_msgSend(MEMORY[0x1E0D2C4F0], "sharedBehavior");
    v7 = objc_claimAutoreleasedReturnValue();
    medicationsBehavior = v6->_medicationsBehavior;
    v6->_medicationsBehavior = (HKMedicationsBehavior *)v7;

    v9 = -[HDMedicationPeriodicScheduler initWithDaemon:]([HDMedicationPeriodicScheduler alloc], "initWithDaemon:", v4);
    periodicScheduler = v6->_periodicScheduler;
    v6->_periodicScheduler = v9;

    v11 = -[HDMedicationCountProvider initWithDaemon:]([HDMedicationCountProvider alloc], "initWithDaemon:", v4);
    medicationCountProvider = v6->_medicationCountProvider;
    v6->_medicationCountProvider = v11;

    v13 = -[HDOntologyMedsEducationFeatureEvaluator initWithDaemon:medicationCountProvider:]([HDOntologyMedsEducationFeatureEvaluator alloc], "initWithDaemon:medicationCountProvider:", v4, v6->_medicationCountProvider);
    medsEducationFeatureEvaluator = v6->_medsEducationFeatureEvaluator;
    v6->_medsEducationFeatureEvaluator = v13;

    v15 = -[HDDrugInteractionFactorStateProvider initWithDaemon:]([HDDrugInteractionFactorStateProvider alloc], "initWithDaemon:", v4);
    drugInteractionStateProvider = v6->_drugInteractionStateProvider;
    v6->_drugInteractionStateProvider = v15;

    v17 = -[HDOntologyCoreMedsFeatureEvaluator initWithDaemon:medicationCountProvider:]([HDOntologyCoreMedsFeatureEvaluator alloc], "initWithDaemon:medicationCountProvider:", v4, v6->_medicationCountProvider);
    coreMedsFeatureEvaluator = v6->_coreMedsFeatureEvaluator;
    v6->_coreMedsFeatureEvaluator = v17;

    v19 = -[HDOntologyInteractionsFeatureEvaluator initWithDaemon:medicationCountProvider:interactionFactorStateProvider:]([HDOntologyInteractionsFeatureEvaluator alloc], "initWithDaemon:medicationCountProvider:interactionFactorStateProvider:", v4, v6->_medicationCountProvider, v6->_drugInteractionStateProvider);
    interactionsFeatureEvaluator = v6->_interactionsFeatureEvaluator;
    v6->_interactionsFeatureEvaluator = v19;

    v21 = -[HDOntologyMedicationFeatureEvaluator initWithDaemon:]([HDOntologyMedsScanningFeatureEvaluator alloc], "initWithDaemon:", v4);
    medsScanningFeatureEvaluator = v6->_medsScanningFeatureEvaluator;
    v6->_medsScanningFeatureEvaluator = v21;

  }
  return v6;
}

- (NSArray)ontologyFeatureEvaluators
{
  HDOntologyMedsEducationFeatureEvaluator *medsEducationFeatureEvaluator;
  HDOntologyInteractionsFeatureEvaluator *interactionsFeatureEvaluator;
  HDOntologyMedsScanningFeatureEvaluator *medsScanningFeatureEvaluator;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  medsEducationFeatureEvaluator = self->_medsEducationFeatureEvaluator;
  interactionsFeatureEvaluator = self->_interactionsFeatureEvaluator;
  medsScanningFeatureEvaluator = self->_medsScanningFeatureEvaluator;
  v6[0] = self->_coreMedsFeatureEvaluator;
  v6[1] = interactionsFeatureEvaluator;
  v6[2] = medsEducationFeatureEvaluator;
  v6[3] = medsScanningFeatureEvaluator;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)daemonDidReceiveNotification:(const char *)a3
{
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  HDHealthMedicationsDaemonExtension *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = strcasecmp(a3, (const char *)*MEMORY[0x1E0D2C2E0]);
  if (v5)
  {
    if (!strcasecmp(a3, "com.apple.system.timezone"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543618;
        v18 = self;
        v19 = 2082;
        v20 = a3;
      }

      -[HDHealthMedicationsDaemonExtension daemon](self, "daemon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "primaryProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "healthMedicationsProfileExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "medicationScheduleManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeZoneManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "handleTimeZoneChange");
    }
  }
  else
  {
    -[HDHealthMedicationsDaemonExtension daemon](self, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "healthMedicationsProfileExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "medicationsDataDonator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didRecieveThirdPartyMigrationNotification");

  }
  return v5 == 0;
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (HKMedicationsBehavior)medicationsBehavior
{
  return self->_medicationsBehavior;
}

- (HDMedicationPeriodicScheduler)periodicScheduler
{
  return self->_periodicScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicScheduler, 0);
  objc_storeStrong((id *)&self->_medicationsBehavior, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_medsScanningFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_interactionsFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_medsEducationFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_coreMedsFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_drugInteractionStateProvider, 0);
  objc_storeStrong((id *)&self->_medicationCountProvider, 0);
}

@end

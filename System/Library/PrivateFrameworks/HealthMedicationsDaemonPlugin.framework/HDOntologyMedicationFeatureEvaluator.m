@implementation HDOntologyMedicationFeatureEvaluator

- (HDOntologyMedicationFeatureEvaluator)init
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

- (HDOntologyMedicationFeatureEvaluator)initWithDaemon:(id)a3
{
  id v4;
  HDOntologyMedicationFeatureEvaluator *v5;
  HDOntologyMedicationFeatureEvaluator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyMedicationFeatureEvaluator;
  v5 = -[HDOntologyMedicationFeatureEvaluator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_daemon, v4);

  return v6;
}

- (BOOL)canRequireShardWithError:(id *)a3
{
  char v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend(MEMORY[0x1E0D2C448], "supportsOntologyBackedMedications");
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    -[HDOntologyMedicationFeatureEvaluator featureIdentifier](self, "featureIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_assignError:code:format:", a3, 111, CFSTR("Cannot require %@ shard because device configuration does not support ontology backed medications"), v7);

  }
  return v5;
}

- (void)triggerShardEvaluatorWithReason:(id)a3
{
  HDDaemon **p_daemon;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  p_daemon = &self->_daemon;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_daemon);
  objc_msgSend(WeakRetained, "ontologyUpdateCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluteRequiredShardsForEvalulator:reason:", self, v5);

}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
}

- (NSString)featureIdentifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end

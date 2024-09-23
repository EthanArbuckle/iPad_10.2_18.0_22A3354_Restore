@implementation HDOntologyInteractionsFeatureEvaluator

- (HDOntologyInteractionsFeatureEvaluator)init
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

- (HDOntologyInteractionsFeatureEvaluator)initWithDaemon:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (HDOntologyInteractionsFeatureEvaluator)initWithDaemon:(id)a3 medicationCountProvider:(id)a4 interactionFactorStateProvider:(id)a5
{
  id v9;
  id v10;
  HDOntologyInteractionsFeatureEvaluator *v11;
  HDOntologyInteractionsFeatureEvaluator *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDOntologyInteractionsFeatureEvaluator;
  v11 = -[HDOntologyMedicationFeatureEvaluator initWithDaemon:](&v14, sel_initWithDaemon_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_medicationCountProvider, a4);
    objc_storeStrong((id *)&v12->_interactionFactorStateProvider, a5);
  }

  return v12;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CB56F8];
}

- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4
{
  HDMedicationCountProvider *medicationCountProvider;
  id v7;
  id v8;

  medicationCountProvider = self->_medicationCountProvider;
  v8 = a4;
  v7 = a3;
  -[HDMedicationCountProvider monitorMedicationCountsInProfile:](medicationCountProvider, "monitorMedicationCountsInProfile:", v7);
  -[HDMedicationCountProvider addMedicationCountObserver:queue:](self->_medicationCountProvider, "addMedicationCountObserver:queue:", self, v8);
  -[HDDrugInteractionFactorStateProvider monitorDrugInteractionFactorsInProfile:](self->_interactionFactorStateProvider, "monitorDrugInteractionFactorsInProfile:", v7);

  -[HDDrugInteractionFactorStateProvider addDrugInteractionFactorStateObserver:queue:](self->_interactionFactorStateProvider, "addDrugInteractionFactorStateObserver:queue:", self, v8);
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;

  v4 = a3;
  v5 = 0;
  if (-[HDOntologyMedicationFeatureEvaluator canRequireShardWithError:](self, "canRequireShardWithError:", 0))
  {
    v6 = -[HDMedicationCountProvider ontologyBackedMedicationCountInProfile:](self->_medicationCountProvider, "ontologyBackedMedicationCountInProfile:", v4);
    if (v6 == 2)
    {
      v5 = 1;
    }
    else if (v6 == 1)
    {
      v5 = -[HDDrugInteractionFactorStateProvider hasDrugInteractionFactorInProfile:](self->_interactionFactorStateProvider, "hasDrugInteractionFactorInProfile:", v4);
    }
    else if (v6)
    {
      v5 = 2;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)drugInteractionFactorStateProvider:(id)a3 didObserveChangeForProfile:(id)a4 hasDrugInteractionFactor:(int64_t)a5
{
  id v6;
  void *v7;
  id v8;

  if (a5 != 2)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    HKStringFromOptionalBooleanResult();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "initWithFormat:", CFSTR("hasDrugInteractionFactor changed to %@"), v7);

    -[HDOntologyMedicationFeatureEvaluator triggerShardEvaluatorWithReason:](self, "triggerShardEvaluatorWithReason:", v8);
  }
}

- (void)medicationCountProvider:(id)a3 didObserveChangeForProfile:(id)a4 ontologyBackedMedicationCount:(int64_t)a5
{
  id v6;

  if (a5 != -1)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("didObserve medications count change to %ld"), a5);
    -[HDOntologyMedicationFeatureEvaluator triggerShardEvaluatorWithReason:](self, "triggerShardEvaluatorWithReason:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionFactorStateProvider, 0);
  objc_storeStrong((id *)&self->_medicationCountProvider, 0);
}

@end

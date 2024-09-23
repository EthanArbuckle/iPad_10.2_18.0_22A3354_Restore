@implementation HDOntologyMedsEducationFeatureEvaluator

- (HDOntologyMedsEducationFeatureEvaluator)init
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

- (HDOntologyMedsEducationFeatureEvaluator)initWithDaemon:(id)a3
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

- (HDOntologyMedsEducationFeatureEvaluator)initWithDaemon:(id)a3 medicationCountProvider:(id)a4
{
  id v7;
  HDOntologyMedsEducationFeatureEvaluator *v8;
  HDOntologyMedsEducationFeatureEvaluator *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDOntologyMedsEducationFeatureEvaluator;
  v8 = -[HDOntologyMedicationFeatureEvaluator initWithDaemon:](&v11, sel_initWithDaemon_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_medicationCountProvider, a4);

  return v9;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CB5710];
}

- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4
{
  HDMedicationCountProvider *medicationCountProvider;
  id v7;

  medicationCountProvider = self->_medicationCountProvider;
  v7 = a4;
  -[HDMedicationCountProvider monitorMedicationCountsInProfile:](medicationCountProvider, "monitorMedicationCountsInProfile:", a3);
  -[HDMedicationCountProvider addMedicationCountObserver:queue:](self->_medicationCountProvider, "addMedicationCountObserver:queue:", self, v7);

}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = 0;
  if (-[HDOntologyMedicationFeatureEvaluator canRequireShardWithError:](self, "canRequireShardWithError:", 0))
  {
    v6 = -[HDMedicationCountProvider ontologyBackedMedicationCountInProfile:](self->_medicationCountProvider, "ontologyBackedMedicationCountInProfile:", v4);
    if (v6 > 2)
      v5 = 2;
    else
      v5 = qword_1B81B3420[v6];
  }

  return v5;
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
  objc_storeStrong((id *)&self->_medicationCountProvider, 0);
}

@end

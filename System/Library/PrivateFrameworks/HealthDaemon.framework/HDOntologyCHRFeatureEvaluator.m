@implementation HDOntologyCHRFeatureEvaluator

- (HDOntologyCHRFeatureEvaluator)init
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

- (HDOntologyCHRFeatureEvaluator)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyCHRFeatureEvaluator *v5;
  HDOntologyCHRFeatureEvaluator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyCHRFeatureEvaluator;
  v5 = -[HDOntologyCHRFeatureEvaluator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);

  return v6;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0CB56E8];
}

- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "healthRecordsAccountExistenceNotifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAccountExistenceObserver:queue:", self, v6);

}

- (BOOL)canRequireShardWithError:(id *)a3
{
  return 1;
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  void *v5;
  unint64_t v6;
  void *v8;

  objc_msgSend(a3, "healthRecordsAccountExistenceNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ontologyEnablingHealthRecordsAccountState");

  if (v6 < 3)
    return qword_1B7F562B0[v6];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDOntologyCHRFeatureEvaluator.m"), 65, CFSTR("Unreachable code has been executed"));

  return 2;
}

- (void)accountExistenceNotifier:(id)a3 didChangeHealthRecordAccountExistence:(BOOL)a4
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  objc_msgSend(WeakRetained, "featureCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluteRequiredShardsForEvalulator:reason:", self, CFSTR("didChangeHealthRecordAccountExistence"));

}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  return (HDOntologyUpdateCoordinator *)objc_loadWeakRetained((id *)&self->_updateCoordinator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
}

@end

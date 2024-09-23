@implementation HDUserDomainConceptSyncRequester

- (HDUserDomainConceptSyncRequester)initWithUserDomainConceptManager:(id)a3
{
  id v4;
  void *v5;
  HDUserDomainConceptSyncRequester *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HDUserDomainConceptSyncRequester;
  v6 = -[HDSyncRequester initWithProfile:](&v9, sel_initWithProfile_, v5);

  if (v6)
  {
    v7 = objc_storeWeak((id *)&v6->_userDomainConceptManager, v4);
    objc_msgSend(v4, "addUserDomainConceptObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptSyncRequester _triggerSyncsIfRequiredForReason:userDomainConcepts:](self, CFSTR("didAddUserDomainConcepts"), a4);
}

- (void)_triggerSyncsIfRequiredForReason:(void *)a3 userDomainConcepts:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];

  v11 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncIdentityManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentSyncIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "persistentID");

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__HDUserDomainConceptSyncRequester__triggerSyncsIfRequiredForReason_userDomainConcepts___block_invoke;
    v12[3] = &__block_descriptor_40_e29_B16__0__HKUserDomainConcept_8l;
    v12[4] = v10;
    if (objc_msgSend(v5, "hk_containsObjectPassingTest:", v12))
      objc_msgSend(a1, "requestSyncsWithReason:", v11);
  }

}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptSyncRequester _triggerSyncsIfRequiredForReason:userDomainConcepts:](self, CFSTR("didUpdateUserDomainConcepts"), a4);
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptSyncRequester _triggerSyncsIfRequiredForReason:userDomainConcepts:](self, CFSTR("didDeleteUserDomainConcepts"), a4);
}

uint64_t __88__HDUserDomainConceptSyncRequester__triggerSyncsIfRequiredForReason_userDomainConcepts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "hd_syncEntityIdentity") == *(_QWORD *)(a1 + 32))
    v4 = objc_msgSend(v3, "canRequestSyncUponInsertion");
  else
    v4 = 0;

  return v4;
}

- (HDUserDomainConceptManager)userDomainConceptManager
{
  return (HDUserDomainConceptManager *)objc_loadWeakRetained((id *)&self->_userDomainConceptManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userDomainConceptManager);
}

@end

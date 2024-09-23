@implementation BLSHBaseBacklightEnvironmentSessionProvider

- (BLSHBaseBacklightEnvironmentSessionProvider)init
{
  BLSHBaseBacklightEnvironmentSessionProvider *v2;
  BLSHBaseBacklightEnvironmentSessionProvider *v3;
  BLSHBacklightEnvironmentPresentation *v4;
  uint64_t v5;
  BLSHBacklightEnvironmentPresentation *lock_presentation;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BLSHBaseBacklightEnvironmentSessionProvider;
  v2 = -[BLSHBaseBacklightEnvironmentSessionProvider init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [BLSHBacklightEnvironmentPresentation alloc];
    v5 = -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:](v4, "initWithPresentationEntries:flipbookContext:expirationDate:", MEMORY[0x24BDBD1A8], 0, 0);
    lock_presentation = v3->_lock_presentation;
    v3->_lock_presentation = (BLSHBacklightEnvironmentPresentation *)v5;

  }
  return v3;
}

- (BLSHBacklightInactiveEnvironmentSession)activeSession
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightInactiveEnvironmentSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_activeSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightEnvironmentPresentation *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_presentation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPresentation:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  os_unfair_lock_s *p_lock;
  BLSHBacklightEnvironmentPresentation **p_lock_presentation;
  BLSHBacklightEnvironmentPresentation *lock_presentation;
  BLSHBacklightEnvironmentPresentation *v19;
  uint64_t v20;
  BLSHBacklightEnvironmentPresentation *v21;
  int v22;
  BLSHBacklightEnvironmentPresentation *v23;
  void (**v24)(_QWORD);
  uint64_t v25;
  BLSHBacklightEnvironmentPresentation *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "presentationEntries", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "environment");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAlwaysOnEnabledForEnvironment:", -[BLSHBaseBacklightEnvironmentSessionProvider presentationEntrySupportsAlwaysOn:](self, "presentationEntrySupportsAlwaysOn:", v14));

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentation = self->_lock_presentation;
  p_lock_presentation = &self->_lock_presentation;
  v19 = lock_presentation;
  objc_storeStrong((id *)p_lock_presentation, a3);
  v20 = MEMORY[0x2199D2BD8](v8);
  v21 = p_lock_presentation[1];
  p_lock_presentation[1] = (BLSHBacklightEnvironmentPresentation *)v20;

  v22 = objc_msgSend(v7, "isEqual:", v19);
  v23 = *(p_lock_presentation - 1);
  if (!v23)
    v22 = 1;
  if (v22)
    v24 = 0;
  else
    v24 = v8;
  v25 = MEMORY[0x2199D2BD8](v24);
  v26 = p_lock_presentation[1];
  p_lock_presentation[1] = (BLSHBacklightEnvironmentPresentation *)v25;

  os_unfair_lock_unlock(p_lock);
  if ((v22 & 1) != 0)
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    -[BLSHBacklightEnvironmentPresentation setPresentation:](v23, "setPresentation:", v7);
  }

}

- (void)setPresentationWithFBScenes:(id)a3 flipbookContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  BLSHBacklightEnvironmentPresentation *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_30);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:]([BLSHBacklightEnvironmentPresentation alloc], "initWithPresentationEntries:flipbookContext:expirationDate:", v11, v9, 0);

  -[BLSHBaseBacklightEnvironmentSessionProvider setPresentation:withCompletion:](self, "setPresentation:withCompletion:", v10, v8);
}

BLSHPresentationEntry *__102__BLSHBaseBacklightEnvironmentSessionProvider_setPresentationWithFBScenes_flipbookContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  BLSHPresentationEntry *v3;

  objc_msgSend(a2, "backlightSceneHostEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[BLSHPresentationEntry initWithEnvironment:userObject:]([BLSHPresentationEntry alloc], "initWithEnvironment:userObject:", v2, 0);

  return v3;
}

- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4
{
  id v6;
  BLSHBacklightInactiveEnvironmentSession *lock_activeSession;
  void (**v8)(_QWORD);
  id lock_setPresentationCompletion;
  id v10;

  v10 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_activeSession = self->_lock_activeSession;

  if (__PAIR128__(self->_lock_presentation, (unint64_t)lock_activeSession) == __PAIR128__((unint64_t)v10, (unint64_t)v6))
  {
    v8 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](self->_lock_setPresentationCompletion);
    lock_setPresentationCompletion = self->_lock_setPresentationCompletion;
    self->_lock_setPresentationCompletion = 0;

    os_unfair_lock_unlock(&self->_lock);
    if (v8)
    {
      v8[2](v8);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)didEndInactiveEnvironmentSession:(id)a3
{
  BLSHBacklightInactiveEnvironmentSession *v4;

  v4 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activeSession == v4)
  {
    self->_lock_activeSession = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHBacklightInactiveEnvironmentSession removeObserver:](v4, "removeObserver:", self);

}

- (id)createInactiveEnvironmentSession
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[BLSHBacklightInactiveEnvironmentSession sessionWithPresentation:](BLSHBacklightInactiveEnvironmentSession, "sessionWithPresentation:", self->_lock_presentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_lock_activeSession, v4);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "addObserver:", self);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_setPresentationCompletion, 0);
  objc_storeStrong((id *)&self->_lock_presentation, 0);
  objc_storeStrong((id *)&self->_lock_activeSession, 0);
}

- (BOOL)presentationEntrySupportsAlwaysOn:(id)a3
{
  return 1;
}

@end

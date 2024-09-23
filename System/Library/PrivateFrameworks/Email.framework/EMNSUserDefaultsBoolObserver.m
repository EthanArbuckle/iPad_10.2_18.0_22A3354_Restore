@implementation EMNSUserDefaultsBoolObserver

- (EMNSUserDefaultsBoolObserver)initWithUserDefaults:(id)a3 keyPath:(id)a4 keyRepresentsDisabled:(BOOL)a5 handler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  EMNSUserDefaultsBoolObserver *v13;
  EMNSUserDefaultsBoolObserver *v14;
  uint64_t v15;
  EFCancelable *observationToken;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id location;
  objc_super v25;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)EMNSUserDefaultsBoolObserver;
  v13 = -[EMNSUserDefaultsBoolObserver init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_enabled = -[EMNSUserDefaultsBoolObserver _getEnabledWithUserDefaults:keyPath:keyRepresentsDisabled:]((uint64_t)v13, v10, v11, v7);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v14);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __91__EMNSUserDefaultsBoolObserver_initWithUserDefaults_keyPath_keyRepresentsDisabled_handler___block_invoke;
    v18[3] = &unk_1E70F5430;
    objc_copyWeak(&v22, &location);
    v19 = v10;
    v20 = v11;
    v23 = v7;
    v21 = v12;
    objc_msgSend(v19, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v20, 1, 1, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    observationToken = v14->_observationToken;
    v14->_observationToken = (EFCancelable *)v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (uint64_t)_getEnabledWithUserDefaults:(void *)a3 keyPath:(int)a4 keyRepresentsDisabled:
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a2;
  v8 = a3;
  if (a1)
    v9 = objc_msgSend(v7, "BOOLForKey:", v8) ^ a4;
  else
    v9 = 0;

  return v9;
}

void __91__EMNSUserDefaultsBoolObserver_initWithUserDefaults_keyPath_keyRepresentsDisabled_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    WeakRetained[16] = -[EMNSUserDefaultsBoolObserver _getEnabledWithUserDefaults:keyPath:keyRepresentsDisabled:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
  }

}

- (EMNSUserDefaultsBoolObserver)initWithUserDefaultKey:(id)a3 keyRepresentsDisabled:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  EMNSUserDefaultsBoolObserver *v11;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EMNSUserDefaultsBoolObserver initWithUserDefaults:keyPath:keyRepresentsDisabled:handler:](self, "initWithUserDefaults:keyPath:keyRepresentsDisabled:handler:", v10, v8, v6, v9);

  return v11;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationToken, 0);
}

@end

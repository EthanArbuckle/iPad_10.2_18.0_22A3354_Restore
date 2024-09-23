@implementation BLSHSceneEnvironmentObserverToken

+ (id)tokenWithObserver:(id)a3 sceneIdentityToken:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObserver:sceneIdentityToken:", v7, v6);

  return v8;
}

- (BLSHSceneEnvironmentObserverToken)initWithObserver:(id)a3 sceneIdentityToken:(id)a4
{
  id v6;
  id v7;
  BLSHSceneEnvironmentObserverToken *v8;
  BLSHSceneEnvironmentObserverToken *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BLSHSceneEnvironmentObserverToken;
  v8 = -[BLSHSceneEnvironmentObserverToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_sceneIdentityToken, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v5 = (id)objc_msgSend(v3, "appendPointer:", WeakRetained);

  v6 = (id)objc_msgSend(v3, "appendObject:", self->_sceneIdentityToken);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *sceneIdentityToken;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke;
  v19[3] = &unk_24D1BC110;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendPointer:counterpart:", WeakRetained, v19);

  sceneIdentityToken = self->_sceneIdentityToken;
  v14 = v7;
  v15 = 3221225472;
  v16 = __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke_2;
  v17 = &unk_24D1BC138;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", sceneIdentityToken, &v14);
  LOBYTE(sceneIdentityToken) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)sceneIdentityToken;
}

id __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

  return WeakRetained;
}

id __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSHSceneEnvironmentObserverToken *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __48__BLSHSceneEnvironmentObserverToken_description__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__BLSHSceneEnvironmentObserverToken_description__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("scene"));
  v3 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("observer"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentityToken, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end

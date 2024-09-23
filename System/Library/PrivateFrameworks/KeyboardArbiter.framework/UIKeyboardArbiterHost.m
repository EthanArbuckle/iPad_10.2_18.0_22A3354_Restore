@implementation UIKeyboardArbiterHost

uint64_t __45___UIKeyboardArbiterHost_updateSceneSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "updateClientSettings:withTransitionContext:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __33___UIKeyboardArbiterHost_attach___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "attachLayer:", *(_QWORD *)(a1 + 40));
}

uint64_t __33___UIKeyboardArbiterHost_detach___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "detachLayer:", *(_QWORD *)(a1 + 40));
}

void __33___UIKeyboardArbiterHost_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getFBSceneManagerClass_0(), "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "destroyScene:withTransitionContext:", v2, 0);

}

void __76___UIKeyboardArbiterHost_launchAdvisorWithOmniscientDelegate_sceneDelegate___block_invoke(uint64_t a1)
{
  _UIKeyboardArbiter *v2;
  void *v3;
  _UIKeyboardArbiterHost *v4;

  if (objc_msgSend(MEMORY[0x24BEBDCD8], "useSystemService"))
  {
    v4 = objc_alloc_init(_UIKeyboardArbiterHost);
    v2 = -[_UIKeyboardArbiter initWithLink:]([_UIKeyboardArbiter alloc], "initWithLink:", v4);
    v3 = (void *)_MergedGlobals_3;
    _MergedGlobals_3 = (uint64_t)v2;

    objc_msgSend((id)_MergedGlobals_3, "setOmniscientDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend((id)_MergedGlobals_3, "setSceneDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend((id)_MergedGlobals_3, "resume");

  }
}

void __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v2 = (void *)getFBDisplayManagerClass_softClass_0;
  v26 = getFBDisplayManagerClass_softClass_0;
  v3 = MEMORY[0x24BDAC760];
  if (!getFBDisplayManagerClass_softClass_0)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __getFBDisplayManagerClass_block_invoke_0;
    v22[3] = &unk_24DAA0890;
    v22[4] = &v23;
    __getFBDisplayManagerClass_block_invoke_0((uint64_t)v22);
    v2 = (void *)v24[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v4, "mainConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE38468];
  +[FBSSceneSpecification specification](_UIKeyboardSceneSpecification, "specification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parametersForSpecification:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setClientSettings:", *(_QWORD *)(a1 + 32));
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_2;
  v19[3] = &unk_24DAA09A8;
  v9 = v5;
  v20 = v9;
  v21 = *(id *)(a1 + 32);
  objc_msgSend(v8, "updateSettingsWithBlock:", v19);
  objc_msgSend(getFBSceneManagerClass_0(), "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(getFBLocalSynchronousSceneClientProviderClass(), "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createSceneWithIdentifier:parameters:clientProvider:transitionContext:", v11, v8, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getFBLocalSynchronousSceneClientProviderClass(), "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fbsSceneForScene:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(getFBSceneManagerClass_0(), "setKeyboardScene:", v13);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("_UIKeyboardArbiterHost.m"), 192, CFSTR("Expected a scene but did not find one."));

  }
}

void __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDisplayConfiguration:", v3);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "preferredLevel");
  objc_msgSend(v4, "setLevel:");
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "preferredInterfaceOrientation"));
  objc_msgSend(v4, "setForeground:", 1);

}

uint64_t __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

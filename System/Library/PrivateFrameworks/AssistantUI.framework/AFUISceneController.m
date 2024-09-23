@implementation AFUISceneController

- (NSString)description
{
  void *v3;
  FBApplicationUpdateScenesTransaction *createTransaction;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  createTransaction = self->_createTransaction;
  -[FBScene identifier](self->_scene, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AFUISceneController(%p): <Transaction: %@\nScene (sceneID: %@, sceneState: %zd) (%@)>"), self, createTransaction, v5, -[FBScene contentState](self->_scene, "contentState"), self->_scene);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)dealloc
{
  objc_super v3;

  -[AFUISceneController cancelSceneLoadingTimeOut](self, "cancelSceneLoadingTimeOut");
  -[AFUISceneController invalidateSceneForReason:explanation:](self, "invalidateSceneForReason:explanation:", 2, CFSTR("#sceneHosting Invalidating scene because [AFUISceneController dealloc]"));
  v3.receiver = self;
  v3.super_class = (Class)AFUISceneController;
  -[AFUISceneController dealloc](&v3, sel_dealloc);
}

- (void)requestSceneViewWithConfiguration:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  FBScene *scene;
  os_log_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  FBScene *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  FBApplicationUpdateScenesTransaction *v36;
  FBApplicationUpdateScenesTransaction *createTransaction;
  void *v38;
  FBApplicationUpdateScenesTransaction *v39;
  void *v40;
  AFUISceneController *v41;
  FBApplicationUpdateScenesTransaction *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  AFUISceneController *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISceneController.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  if (self->_createTransaction)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISceneController.m"), 62, CFSTR("#sceneHosting Request is not allowed when we already have a scene or in flight request : scene=%@ createTransaction=%@"), self->_scene, self->_createTransaction);

  }
  scene = self->_scene;
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (!scene)
    goto LABEL_13;
  -[FBScene settings](scene, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "isEqual:", v15);

  if ((v16 & 1) == 0)
  {
    v17 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[FBScene settings](self->_scene, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "settings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("#sceneHosting Invalidating scene because displayIdentity changed from \"%@\" to \"%@\" for _scene:%@"), v19, v22, 0);

    v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v55 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
      v56 = 2112;
      v57 = v23;
      _os_log_impl(&dword_217514000, v24, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    -[AFUISceneController invalidateSceneForReason:explanation:](self, "invalidateSceneForReason:explanation:", 3, v23);

  }
  v25 = self->_scene;
  if (v25)
  {
    -[FBScene identifier](v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *v10;
    if (!os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315650;
    v55 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
    v56 = 2112;
    v57 = v26;
    v58 = 2112;
    v59 = v7;
    v28 = "%s #sceneHosting Starting scene update for %@ with configuration %@";
  }
  else
  {
LABEL_13:
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("SiriHostedScene-%@-%@"), CFSTR("com.apple.siri"), v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = *v10;
    if (!os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315650;
    v55 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
    v56 = 2112;
    v57 = v26;
    v58 = 2112;
    v59 = v7;
    v28 = "%s #sceneHosting Starting scene request for %@ with configuration %@";
  }
  _os_log_impl(&dword_217514000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x20u);
LABEL_16:
  -[AFUISceneController _recordSceneCreateBegin](self, "_recordSceneCreateBegin");
  self->_sceneForeground = objc_msgSend(v7, "foreground");
  if (objc_msgSend(v7, "cancelSceneLoadingAfterTimeout"))
  {
    objc_msgSend(v7, "sceneLoadingTimeOutDuration");
    -[AFUISceneController startSceneLoadingTimeOutTimerWithDuration:](self, "startSceneLoadingTimeOutTimerWithDuration:");
  }
  v32 = objc_alloc(MEMORY[0x24BE38050]);
  objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.siri"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke;
  v52[3] = &unk_24D7A2CD0;
  v35 = v7;
  v53 = v35;
  v36 = (FBApplicationUpdateScenesTransaction *)objc_msgSend(v32, "initWithProcessIdentity:executionContextProvider:", v33, v52);
  createTransaction = self->_createTransaction;
  self->_createTransaction = v36;

  objc_msgSend(MEMORY[0x24BE384C8], "identityForIdentifier:workspaceIdentifier:", v26, CFSTR("com.apple.siri"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = self->_createTransaction;
  objc_msgSend(v35, "sceneParameters");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBApplicationUpdateScenesTransaction updateSceneWithIdentity:parameters:transitionContext:](v39, "updateSceneWithIdentity:parameters:transitionContext:", v38, v40, 0);

  v41 = self;
  v42 = self->_createTransaction;
  v48[0] = v34;
  v48[1] = 3221225472;
  v48[2] = __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2;
  v48[3] = &unk_24D7A2CF8;
  v43 = v26;
  v49 = v43;
  v50 = v41;
  v44 = v8;
  v51 = v44;
  -[FBApplicationUpdateScenesTransaction setCompletionBlock:](v42, "setCompletionBlock:", v48);
  -[FBApplicationUpdateScenesTransaction setWaitsForSceneCommits:](self->_createTransaction, "setWaitsForSceneCommits:", 0);
  -[FBApplicationUpdateScenesTransaction addObserver:](self->_createTransaction, "addObserver:", v41);
  -[FBApplicationUpdateScenesTransaction begin](self->_createTransaction, "begin");
  v45 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]";
    _os_log_impl(&dword_217514000, v45, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting started FBApplicationUpdateScenesTransaction transaction", buf, 0xCu);
  }

}

id __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE38068]);
  objc_msgSend(v2, "setLaunchIntent:", objc_msgSend(*(id *)(a1 + 32), "launchIntent"));
  return v2;
}

void __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneWithIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 32);
    if (v7)
    {
      v8 = v7;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_3;
      v24[3] = &unk_24D7A1860;
      v25 = v8;
      v9 = v8;
      objc_msgSend(v5, "updateUISettingsWithBlock:", v24);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 32);
      *(_QWORD *)(v10 + 32) = 0;

      v6 = *(_QWORD *)(a1 + 40);
    }
    v14 = *(void **)(v6 + 8);
    v12 = (id *)(v6 + 8);
    v13 = v14;
    if (v14)
    {
      if (v13 != v5)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]_block_invoke_2");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("AFUISceneController.m"), 107, CFSTR("#sceneHosting scene mismatch : old=%@ new=%@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v5);

      }
    }
    else
    {
      objc_storeStrong(v12, v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObserver:");
    }
    objc_msgSend(*(id *)(a1 + 40), "_recordSceneCreateEnd");
  }
  objc_msgSend(*(id *)(a1 + 40), "cancelSceneLoadingTimeOut");
  v17 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(void **)(v18 + 16);
  *(_QWORD *)(v18 + 16) = 0;

  v20 = *MEMORY[0x24BE08FB0];
  v21 = *MEMORY[0x24BE08FB0];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]_block_invoke";
      _os_log_impl(&dword_217514000, v20, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting FBApplicationUpdateScenesTransaction succeeded", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2_cold_1(v20, v17);
  }
  v22 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v17, "error");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v22 + 16))(v22, v5, v23);

}

uint64_t __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureMutableSceneSettings:", a2);
}

- (void)updateSceneViewWithConfiguration:(id)a3
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  FBScene *scene;
  FBScene *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  FBScene *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    scene = self->_scene;
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFUISceneController updateSceneViewWithConfiguration:]";
    v22 = 2112;
    v23 = scene;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting updating scene (%@) with configuration %@", buf, 0x20u);
  }
  self->_sceneForeground = objc_msgSend(v5, "foreground");
  v9 = self->_scene;
  if (v9)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __56__AFUISceneController_updateSceneViewWithConfiguration___block_invoke;
    v18[3] = &unk_24D7A1860;
    v19 = v5;
    -[FBScene updateUISettingsWithBlock:](v9, "updateUISettingsWithBlock:", v18);

  }
  else if (-[FBApplicationUpdateScenesTransaction isRunning](self->_createTransaction, "isRunning"))
  {
    objc_storeStrong((id *)&self->_pendingConfigurationToApply, a3);
  }
  else
  {
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      -[AFUISceneController updateSceneViewWithConfiguration:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

uint64_t __56__AFUISceneController_updateSceneViewWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureMutableSceneSettings:", a2);
}

- (void)sceneLoadingTimeOutDidOccur
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s #sceneHosting Reached timeout, cancelling scene loading", a5, a6, a7, a8, 2u);
}

- (void)startSceneLoadingTimeOutTimerWithDuration:(double)a3
{
  -[AFUISceneController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_sceneLoadingTimeOutDidOccur, 0, a3);
}

- (void)cancelSceneLoadingTimeOut
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_sceneLoadingTimeOutDidOccur, 0);
}

- (void)invalidateSceneForReason:(unint64_t)a3 explanation:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  FBApplicationUpdateScenesTransaction *createTransaction;
  FBScene *scene;
  void *v13;
  void *v14;
  FBScene *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  BKSProcessAssertion *backgroundRunningAssertion;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  self->_invalidationReason = a3;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    +[AFUISceneConfiguration stringForInvalidationReason:](AFUISceneConfiguration, "stringForInvalidationReason:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "-[AFUISceneController invalidateSceneForReason:explanation:]";
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp #sceneHosting %@: %@", buf, 0x20u);

  }
  createTransaction = self->_createTransaction;
  if (createTransaction)
  {
    -[FBApplicationUpdateScenesTransaction failWithReason:](createTransaction, "failWithReason:", CFSTR("deactivating"));
    if (self->_createTransaction)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISceneController.m"), 169, CFSTR("#sceneHosting createTransaction should be gone by now ; %@"),
        self->_createTransaction);

    }
  }
  scene = self->_scene;
  if (scene)
  {
    objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene identifier](self->_scene, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sceneWithIdentifier:", v14);
    v15 = (FBScene *)objc_claimAutoreleasedReturnValue();

    if (scene == v15)
    {
      -[AFUISceneController delegate](self, "delegate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[AFUISceneController delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0)
        {
          -[AFUISceneController delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sceneController:willInvalidateScene:forReason:", self, self->_scene, self->_invalidationReason);

        }
      }
      objc_msgSend(MEMORY[0x24BE38100], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene identifier](self->_scene, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "destroyScene:withTransitionContext:", v22, 0);

    }
  }
  -[BKSProcessAssertion invalidate](self->_backgroundRunningAssertion, "invalidate");
  backgroundRunningAssertion = self->_backgroundRunningAssertion;
  self->_backgroundRunningAssertion = 0;

}

- (id)_currentConfiguration
{
  void *v2;
  void *v3;

  -[AFUISceneController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneConfigurationForDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_recordSceneCreateBegin
{
  kdebug_trace();
}

- (void)_recordSceneCreateEnd
{
  kdebug_trace();
}

- (void)sceneContentStateDidChange:(id)a3
{
  FBScene *v4;
  void *v5;
  FBScene *v6;

  v4 = (FBScene *)a3;
  if (self->_scene == v4)
  {
    v6 = v4;
    -[AFUISceneController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "sceneController:sceneContentStateDidChange:", self, v6);

    v4 = v6;
  }

}

- (void)sceneDidInvalidate:(id)a3
{
  FBScene *v4;
  NSObject *v5;
  FBScene *scene;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  FBScene *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (FBScene *)a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AFUISceneController sceneDidInvalidate:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting scene: %@", (uint8_t *)&v8, 0x16u);
  }
  if (self->_scene == v4)
  {
    -[FBScene removeObserver:](v4, "removeObserver:", self);
    scene = self->_scene;
    self->_scene = 0;

    -[AFUISceneController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "sceneController:sceneWasInvalidated:forReason:", self, v4, self->_invalidationReason);
    self->_invalidationReason = 0;

  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  FBScene *v7;
  void *v8;
  void *v9;
  void *v10;
  FBScene *v11;

  v7 = (FBScene *)a3;
  if (self->_scene == v7)
  {
    v11 = v7;
    -[FBScene uiClientSettings](v7, "uiClientSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FBScene uiClientSettings](v11, "uiClientSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    -[AFUISceneController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "sceneController:sceneDidUpdateClientSettings:", self, v9);

    v7 = v11;
  }

}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  BKSProcessAssertion *v9;
  BKSProcessAssertion *backgroundRunningAssertion;

  if (!self->_sceneForeground)
  {
    v5 = (objc_class *)MEMORY[0x24BE08A10];
    v6 = a4;
    v7 = [v5 alloc];
    v8 = objc_msgSend(v6, "pid");

    v9 = (BKSProcessAssertion *)objc_msgSend(v7, "initWithPID:flags:reason:name:withHandler:", v8, 13, 7, CFSTR("siri prewarming"), &__block_literal_global_4);
    backgroundRunningAssertion = self->_backgroundRunningAssertion;
    self->_backgroundRunningAssertion = v9;

  }
}

void __52__AFUISceneController_transaction_didLaunchProcess___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[AFUISceneController transaction:didLaunchProcess:]_block_invoke";
    v6 = 1024;
    v7 = a2;
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting prewarming assertion acquired %{BOOL}i", (uint8_t *)&v4, 0x12u);
  }
}

- (AFUISceneControllerDelegate)delegate
{
  return (AFUISceneControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingConfigurationToApply, 0);
  objc_storeStrong((id *)&self->_backgroundRunningAssertion, 0);
  objc_storeStrong((id *)&self->_createTransaction, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

void __73__AFUISceneController_requestSceneViewWithConfiguration_completionBlock___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315394;
  v7 = "-[AFUISceneController requestSceneViewWithConfiguration:completionBlock:]_block_invoke_2";
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_217514000, v3, OS_LOG_TYPE_ERROR, "%s #sceneHosting FBApplicationUpdateScenesTransaction failed with error: %@", (uint8_t *)&v6, 0x16u);

}

- (void)updateSceneViewWithConfiguration:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s #sceneHosting went to update scene, but no scene exists and no transaction is running. Nothing to update", a5, a6, a7, a8, 2u);
}

@end

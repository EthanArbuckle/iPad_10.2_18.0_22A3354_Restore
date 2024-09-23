@implementation HUFaceRecognitionAddPersonItemManager

- (HUFaceRecognitionAddPersonItemManager)initWithSignificantEvent:(id)a3 home:(id)a4 delegate:(id)a5
{
  HUFaceRecognitionAddPersonItemManager *v9;
  id v10;
  id v11;
  void *v12;
  HUFaceRecognitionAddPersonItemManager *v13;
  NSObject *v14;
  uint64_t v15;
  HMCameraProfile *cameraProfile;
  void *v17;
  uint64_t v18;
  HFHomePersonItemProvider *homePersonItemProvider;
  id v20;
  void *v21;
  uint64_t v22;
  HFPhotosPersonItemProvider *photosPersonItemProvider;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HMPersonManager *personManager;
  objc_super v30;
  uint8_t buf[4];
  HUFaceRecognitionAddPersonItemManager *v32;
  __int16 v33;
  HUFaceRecognitionAddPersonItemManager *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = (HUFaceRecognitionAddPersonItemManager *)a3;
  v10 = a4;
  v11 = a5;
  -[HUFaceRecognitionAddPersonItemManager faceClassification](v9, "faceClassification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || !v12)
    NSLog(CFSTR("Face classification on significant event %@ or home %@ is nil!"), v9, v10);
  v30.receiver = self;
  v30.super_class = (Class)HUFaceRecognitionAddPersonItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v30, sel_initWithDelegate_sourceItem_, v11, 0);
  if (v13)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v13;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@: Initialized with significant event:%@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v13->_significantEvent, a3);
    objc_msgSend(v10, "hf_cameraProfileForSignificantEvent:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    cameraProfile = v13->_cameraProfile;
    v13->_cameraProfile = (HMCameraProfile *)v15;

    -[HUFaceRecognitionAddPersonItemManager faceClassification](v9, "faceClassification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31440]), "initWithHome:", v10);
      homePersonItemProvider = v13->_homePersonItemProvider;
      v13->_homePersonItemProvider = (HFHomePersonItemProvider *)v18;

      -[HFHomePersonItemProvider setFilter:](v13->_homePersonItemProvider, "setFilter:", &__block_literal_global_265);
      v20 = objc_alloc(MEMORY[0x1E0D31628]);
      objc_msgSend(v10, "currentUser");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "initWithHome:forUser:", v10, v21);
      photosPersonItemProvider = v13->_photosPersonItemProvider;
      v13->_photosPersonItemProvider = (HFPhotosPersonItemProvider *)v22;

      -[HFPhotosPersonItemProvider setFilter:](v13->_photosPersonItemProvider, "setFilter:", &__block_literal_global_6_2);
    }
    else
    {
      HFLogForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "Face classification is nil on significant event %@", buf, 0xCu);
      }

    }
    -[HUFaceRecognitionAddPersonItemManager faceClassification](v13, "faceClassification");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "personManagerUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_personManagerWithIdentifier:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    personManager = v13->_personManager;
    v13->_personManager = (HMPersonManager *)v27;

    objc_storeStrong((id *)&v13->_overrideHome, a4);
  }

  return v13;
}

BOOL __80__HUFaceRecognitionAddPersonItemManager_initWithSignificantEvent_home_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") != 0;

  return v7;
}

BOOL __80__HUFaceRecognitionAddPersonItemManager_initWithSignificantEvent_home_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") != 0;

  return v7;
}

- (HUFaceRecognitionAddPersonItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSignificantEvent_home_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionAddPersonItemManager.m"), 69, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionAddPersonItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUFaceRecognitionAddPersonItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSignificantEvent_home_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionAddPersonItemManager.m"), 74, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionAddPersonItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HMFaceClassification)faceClassification
{
  void *v2;
  void *v3;

  -[HUFaceRecognitionAddPersonItemManager significantEvent](self, "significantEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceClassification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFaceClassification *)v3;
}

- (NAFuture)faceCropImageFuture
{
  void *v3;
  void *v4;
  void *v5;

  -[HUFaceRecognitionAddPersonItemManager cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionAddPersonItemManager significantEvent](self, "significantEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_faceCropImageForSignificantEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v5;
}

- (id)associateFaceClassificationWithNewPersonNamed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  HUFaceRecognitionAddPersonItemManager *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUFaceRecognitionAddPersonItemManager faceClassification](self, "faceClassification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: Associating %@ with new person named %@", buf, 0x20u);

  }
  -[HUFaceRecognitionAddPersonItemManager personManager](self, "personManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionAddPersonItemManager faceClassification](self, "faceClassification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "person");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_namePerson:name:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke;
  v13[3] = &unk_1E6F5EA78;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "personManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "faceClassification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceCrop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setWithSafeObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_2;
  v15[3] = &unk_1E6F502A0;
  v15[4] = *(_QWORD *)(a1 + 32);
  v13 = (id)objc_msgSend(v12, "addSuccessBlock:", v15);
  return v12;
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_3;
  v3[3] = &unk_1E6F575C8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dispatchCameraObserverMessage:sender:", v3, 0);

}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithNewPersonNamed___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clipManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "significantEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clipManager:didUpdateSignificantEvents:", v4, v7);

  }
}

- (id)associateFaceClassificationWithExistingPerson:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  HUFaceRecognitionAddPersonItemManager *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v38[5];
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  uint8_t buf[4];
  HUFaceRecognitionAddPersonItemManager *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUFaceRecognitionAddPersonItemManager faceClassification](self, "faceClassification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = self;
    v48 = 2112;
    v49 = v6;
    v50 = 2112;
    v51 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: Associating %@ with existing person %@", buf, 0x20u);

  }
  objc_msgSend(v4, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[HUFaceRecognitionAddPersonItemManager faceClassification](self, "faceClassification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = "EmbeddedActionGridViewController";
  if (v12)
  {
    -[HUFaceRecognitionAddPersonItemManager personManager](self, "personManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonItemManager faceClassification](self, "faceClassification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "person");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v10)
    {
      objc_msgSend(v17, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_reassociateFaceCropsFromPersonWithUUID:toPersonWithUUID:removePerson:", v19, v20, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = "EmbeddedActionGridViewController";
    }
    else
    {
      objc_msgSend(v7, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_namePerson:name:", v18, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v13;
      v43[1] = 3221225472;
      v43[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke;
      v43[3] = &unk_1E6F5EAA0;
      v43[4] = self;
      v44 = v7;
      v45 = v4;
      objc_msgSend(v30, "addCompletionBlock:", v43);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = "EmbeddedActionGridViewController";
      v13 = MEMORY[0x1E0C809B0];

    }
  }
  else
  {
    -[HUFaceRecognitionAddPersonItemManager faceClassification](self, "faceClassification");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "faceCrop");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HUFaceRecognitionAddPersonItemManager personManager](self, "personManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v23, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "na_setWithSafeObject:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v27, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = "EmbeddedActionGridViewController";
      v13 = MEMORY[0x1E0C809B0];

    }
    else
    {
      HFLogForCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "name");
        v32 = (HUFaceRecognitionAddPersonItemManager *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v47 = v32;
        v48 = 2112;
        v49 = v23;
        _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "Creating a new person with name %@ face crop %@", buf, 0x16u);

      }
      -[HUFaceRecognitionAddPersonItemManager personManager](self, "personManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "hf_namePerson:name:", 0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v13;
      v39[1] = 3221225472;
      v39[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_22;
      v39[3] = &unk_1E6F5EAC8;
      v39[4] = self;
      v40 = v7;
      v41 = v4;
      v42 = v23;
      objc_msgSend(v35, "flatMap:", v39);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v38[0] = v13;
  v38[1] = *((_QWORD *)v14 + 432);
  v38[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_2;
  v38[3] = &unk_1E6F502A0;
  v38[4] = self;
  v36 = (id)objc_msgSend(v21, "addSuccessBlock:", v38);

  return v21;
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "personManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "personManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "hf_linkFromPerson:toPerson:toPersonManagerUUID:", v8, v4, v6);

}

id __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_22(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "personManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "personManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "hf_linkFromPerson:toPerson:toPersonManagerUUID:", v4, v6, v8);

  objc_msgSend(*(id *)(a1 + 32), "personManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 56), "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "hf_associateFaceCropsWithUUIDs:toPersonWithUUID:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_3;
  v3[3] = &unk_1E6F575C8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dispatchCameraObserverMessage:sender:", v3, 0);

}

void __87__HUFaceRecognitionAddPersonItemManager_associateFaceClassificationWithExistingPerson___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clipManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "significantEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clipManager:didUpdateSignificantEvents:", v4, v7);

  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[HUFaceRecognitionAddPersonItemManager homePersonItemProvider](self, "homePersonItemProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[HUFaceRecognitionAddPersonItemManager photosPersonItemProvider](self, "photosPersonItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v24 = a3;
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionAddPersonItemManager homePersonItemProvider](self, "homePersonItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "na_flatMap:", &__block_literal_global_26_3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "na_map:", &__block_literal_global_28_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionAddPersonItemManager photosPersonItemProvider](self, "photosPersonItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFaceRecognitionAddPersonItemManager homePersonItemProvider](self, "homePersonItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_map:", &__block_literal_global_30_6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_4;
  v26[3] = &unk_1E6F5EB90;
  v27 = v9;
  v28 = v14;
  v23 = v14;
  v15 = v9;
  objc_msgSend(v11, "na_filter:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v16);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionHomePersonsSection"));
  objc_msgSend(v8, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingComparator:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setItems:", v20);

  objc_msgSend(v5, "addObject:", v17);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personUUID");
}

id __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_5;
  v11[3] = &unk_1E6F4E0D8;
  v12 = v3;
  v8 = v3;
  v9 = (v4 | objc_msgSend(v7, "na_any:", v11)) ^ 1;

  return v9;
}

uint64_t __74__HUFaceRecognitionAddPersonItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUFaceRecognitionAddPersonItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMCameraSignificantEvent)significantEvent
{
  return self->_significantEvent;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HFHomePersonItemProvider)homePersonItemProvider
{
  return self->_homePersonItemProvider;
}

- (HFPhotosPersonItemProvider)photosPersonItemProvider
{
  return self->_photosPersonItemProvider;
}

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
  objc_storeStrong((id *)&self->_photosPersonItemProvider, 0);
  objc_storeStrong((id *)&self->_homePersonItemProvider, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end

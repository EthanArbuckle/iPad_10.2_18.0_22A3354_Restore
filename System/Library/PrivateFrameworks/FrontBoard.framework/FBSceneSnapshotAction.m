@implementation FBSceneSnapshotAction

- (FBSceneSnapshotAction)initWithScene:(id)a3 requests:(id)a4 expirationInterval:(double)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  char **__ptr32 *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  FBSceneSnapshotAction *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  FBSceneSnapshotAction *v38;
  void *v39;
  uint64_t v40;
  NSString *sceneID;
  void *v43;
  void *v44;
  id v45;
  objc_super v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[2];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v45 = a4;
  v11 = a6;
  objc_msgSend(v10, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v12;
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v15, self, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  FBLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v16;
    _os_log_impl(&dword_1A359A000, v17, OS_LOG_TYPE_DEFAULT, "Created: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v10, "clientHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "processHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "pid");

  v21 = objc_msgSend(v10, "isValid");
  v22 = 0;
  v23 = MEMORY[0x1E0C809B0];
  v24 = &off_1A3619000;
  if (v21 && (int)v20 >= 1)
  {
    v25 = objc_alloc(MEMORY[0x1E0D87C98]);
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "identifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("FBSceneSnapshotAction:%@"), v43);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("SceneSnapshotAction"));
    v29 = self;
    v30 = v16;
    v31 = v11;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v32;
    objc_msgSend(MEMORY[0x1E0D87CE0], "invalidateAfterInterval:", a5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v25, "initWithExplanation:target:attributes:", v27, v28, v34);

    v23 = MEMORY[0x1E0C809B0];
    v11 = v31;
    v16 = v30;
    self = v29;
    v24 = &off_1A3619000;

    v51[0] = v23;
    v51[1] = 3221225472;
    v51[2] = __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke;
    v51[3] = &unk_1E4A12140;
    v52 = v16;
    objc_msgSend(v22, "setInvalidationHandler:", v51);

  }
  v47[0] = v23;
  v47[1] = *((_QWORD *)v24 + 258);
  v47[2] = __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_11;
  v47[3] = &unk_1E4A140B0;
  v35 = v16;
  v48 = v35;
  v36 = v22;
  v49 = v36;
  v37 = v11;
  v50 = v37;
  v46.receiver = self;
  v46.super_class = (Class)FBSceneSnapshotAction;
  v38 = -[FBSSceneSnapshotAction initWithRequests:expirationInterval:responseHandler:](&v46, sel_initWithRequests_expirationInterval_responseHandler_, v45, v47, a5);
  if (v38)
  {
    objc_msgSend(v10, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    sceneID = v38->_sceneID;
    v38->_sceneID = (NSString *)v40;

    objc_storeStrong((id *)&v38->_assertion, v22);
    objc_storeStrong((id *)&v38->_description, v16);
    objc_msgSend(v36, "acquireWithError:", 0);
  }

  return v38;
}

void __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_cold_1(a1, v4, v5);

}

void __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v4, "succinctDescription");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("success");
    }
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1A359A000, v5, OS_LOG_TYPE_DEFAULT, "Got response for %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    if (v4)

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)dealloc
{
  objc_super v3;

  -[RBSAssertion invalidate](self->_assertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FBSceneSnapshotAction;
  -[FBSceneSnapshotAction dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  NSString *description;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  FBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 138543362;
    v7 = description;
    _os_log_impl(&dword_1A359A000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating: %{public}@", buf, 0xCu);
  }

  -[RBSAssertion invalidate](self->_assertion, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)FBSceneSnapshotAction;
  -[FBSSceneSnapshotAction invalidate](&v5, sel_invalidate);
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

void __83__FBSceneSnapshotAction_initWithScene_requests_expirationInterval_responseHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "Assertion invalidated for %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end

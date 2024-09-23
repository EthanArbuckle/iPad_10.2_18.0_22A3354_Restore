@implementation CNPRUISPosterSnapshotController

- (id)sharedController
{
  return (id)-[objc_class sharedIncomingCallSnapshotController](getPRUISPosterSnapshotControllerClass(), "sharedIncomingCallSnapshotController");
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CNPRPosterSnapshotBundle *v10;

  v6 = a3;
  -[CNPRUISPosterSnapshotController sharedController](self, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wrappedRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "latestSnapshotBundleForRequest:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = -[CNPRPosterSnapshotBundle initWithWrappedBundle:]([CNPRPosterSnapshotBundle alloc], "initWithWrappedBundle:", v9);
  else
    v10 = 0;

  return v10;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[CNPRUISPosterSnapshotController sharedController](self, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wrappedRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__CNPRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke;
  v11[3] = &unk_1E20500A0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "executeSnapshotRequest:completion:", v9, v11);

}

- (void)acquireKeepActiveAssertionForReason:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 1)
  {
    CNUILogPosters();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v9 = "Posters are not supported on iPad";
      v10 = v8;
      v11 = 2;
LABEL_11:
      _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, v11);
    }
  }
  else
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNPostersSoftLinkWrappers.m"), 624, CFSTR("assertion reason must be non-empty"));

    }
    if (acquireKeepActiveAssertionForReason__onceToken != -1)
      dispatch_once(&acquireKeepActiveAssertionForReason__onceToken, &__block_literal_global_61491);
    objc_msgSend((id)_assertions, "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[CNPRUISPosterSnapshotController sharedController](self, "sharedController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "acquireKeepActiveAssertionForReason:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)_assertions, "setObject:forKeyedSubscript:", v14, v5);
      goto LABEL_13;
    }
    CNUILogPosters();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v5;
      v9 = "There's already an assertion for reason: %@, skipping adding another one";
      v10 = v8;
      v11 = 12;
      goto LABEL_11;
    }
  }

LABEL_13:
}

- (void)releaseKeepActiveAssertionForReason:(id)a3
{
  uint64_t v5;
  unsigned int (*v6)(uint64_t, id);
  id v7;
  void *v8;
  id v9;

  v5 = *MEMORY[0x1E0D13848];
  v6 = *(unsigned int (**)(uint64_t, id))(*MEMORY[0x1E0D13848] + 16);
  v7 = a3;
  if (v6(v5, v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNPostersSoftLinkWrappers.m"), 642, CFSTR("assertion reason must be non-empty"));

  }
  objc_msgSend((id)_assertions, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");
  objc_msgSend((id)_assertions, "setObject:forKeyedSubscript:", 0, v7);

}

void __71__CNPRUISPosterSnapshotController_acquireKeepActiveAssertionForReason___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_assertions;
  _assertions = (uint64_t)v0;

}

void __69__CNPRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CNPRUISPosterSnapshotResult *v10;
  CNPRUISPosterSnapshotRequest *v11;

  if (*(_QWORD *)(a1 + 32))
  {
    v7 = a4;
    v8 = a3;
    v9 = a2;
    v11 = -[CNPRUISPosterSnapshotRequest initWithWrappedRequest:]([CNPRUISPosterSnapshotRequest alloc], "initWithWrappedRequest:", v9);

    v10 = -[CNPRUISPosterSnapshotResult initWithWrappedResult:]([CNPRUISPosterSnapshotResult alloc], "initWithWrappedResult:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end

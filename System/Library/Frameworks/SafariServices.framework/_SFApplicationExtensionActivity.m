@implementation _SFApplicationExtensionActivity

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  objc_super v20;
  uint8_t buf[4];
  _BOOL4 v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_SFApplicationExtensionActivity;
  -[UIActivity activityDidFinish:items:error:](&v20, sel_activityDidFinish_items_error_, v6, v8, v9);
  v10 = WBS_LOG_CHANNEL_PREFIXExtensions();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_SFApplicationExtensionActivity activityDidFinish:items:error:].cold.1(v11, v9);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 67109376;
    v22 = v6;
    v23 = 2048;
    v24 = v13;
    _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_DEFAULT, "Toolbar button extension finished with status: %i; number of items returned: %lu",
      buf,
      0x12u);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65___SFApplicationExtensionActivity_activityDidFinish_items_error___block_invoke;
  v16[3] = &unk_1E4AC3978;
  v19 = v6;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  -[UIApplicationExtensionActivity _dismissActivityFromViewController:animated:completion:](self, "_dismissActivityFromViewController:animated:completion:", 0, 1, v16);

}

- (BOOL)validateExtensionHasSameContainerAsHostApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  char v13;
  id v15;
  id v16;

  v4 = a3;
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v6, &v16);
  v8 = v16;
  objc_msgSend(v7, "containingBundleRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "containingBundleRecord");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v13 = objc_msgSend(v9, "isEqual:", v10);

  return v13;
}

- (id)customCompletionHandler
{
  return self->_customCompletionHandler;
}

- (void)setCustomCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_customCompletionHandler, 0);
}

- (void)activityDidFinish:(void *)a1 items:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Toolbar button extension cancelled with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end

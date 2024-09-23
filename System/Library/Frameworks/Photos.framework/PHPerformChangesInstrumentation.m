@implementation PHPerformChangesInstrumentation

- (PHPerformChangesInstrumentation)init
{
  void *v3;
  PHPerformChangesInstrumentation *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (PHPerformChangesInstrumentation *)-[PHPerformChangesInstrumentation initWithUUID:](self, v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (_QWORD)initWithUUID:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PHPerformChangesInstrumentation;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[5];
      a1[5] = v4;

    }
  }

  return a1;
}

+ (PHPerformChangesInstrumentation)startPeformChangesWithName:(uint64_t)a1
{
  PHPerformChangesInstrumentation *v3;
  PHPerformChangesInstrumentation *v4;
  NSObject *v5;
  NSUUID *uuid;
  const char *performChangesName;
  void *v8;
  int v10;
  NSUUID *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = objc_alloc_init(PHPerformChangesInstrumentation);
  v4 = v3;
  if (v3)
  {
    v3->_performChangesName = a2;
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uuid = v4->_uuid;
      performChangesName = v4->_performChangesName;
      qos_class_self();
      PLStringFromQoSClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = uuid;
      v12 = 2082;
      v13 = performChangesName;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] %{public}s called at %{public}@", (uint8_t *)&v10, 0x20u);

    }
  }
  return v4;
}

- (void)endPerformChangesWithSuccess:(void *)a3 error:
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 8);
      qos_class_self();
      PLStringFromQoSClass();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("NO");
      if (a2)
        v10 = CFSTR("YES");
      v11 = v10;
      v12 = 138544386;
      v13 = v7;
      v14 = 2082;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] %{public}s completed at %{public}@, success: %{public}@, error: %@", (uint8_t *)&v12, 0x34u);

    }
    *(_QWORD *)(a1 + 8) = 0;
  }

}

@end

@implementation HMSoftwareUpdateController

- (HMSoftwareUpdateController)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMSoftwareUpdateController)initWithAccessory:(id)a3
{
  id v4;
  HMSoftwareUpdateController *v5;
  HMSoftwareUpdateController *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSUUID *uniqueIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMSoftwareUpdateController;
  v5 = -[HMSoftwareUpdateController init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v8, "getUUIDBytes:", objc_msgSend(v9, "mutableBytes"));

    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    +[HMSoftwareUpdateController namespace](HMSoftwareUpdateController, "namespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithNamespace:data:", v11, v9);
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSUUID *)v12;

  }
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMSoftwareUpdateController accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMSoftwareUpdateController *v4;
  HMSoftwareUpdateController *v5;
  HMSoftwareUpdateController *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMSoftwareUpdateController *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMSoftwareUpdateController accessory](self, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateController accessory](v6, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)configureWithContext:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  id v9;

  objc_storeStrong((id *)&self->_context, a3);
  v7 = a3;
  v8 = a4;
  objc_storeWeak((id *)&self->_accessory, v8);

  -[HMSoftwareUpdateController availableUpdate](self, "availableUpdate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithContext:", v7);

}

- (HMAccessory)accessory
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  os_unfair_lock_unlock(p_lock);
  return (HMAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_accessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isControllable
{
  void *v2;
  char v3;

  -[HMSoftwareUpdateController accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

- (HMSoftwareUpdate)availableUpdate
{
  os_unfair_lock_s *p_lock;
  HMSoftwareUpdate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_availableUpdate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAvailableUpdate:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_availableUpdate, a3);
  -[HMSoftwareUpdateController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithContext:", v5);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)fetchAvailableUpdateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMSoftwareUpdateController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMSoftwareUpdateController *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdateController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdateController fetchAvailableUpdateWithCompletionHandler:]", CFSTR("completionHandler"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      v24 = 2112;
      v25 = (const char *)v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v21 = v4;
    v20 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      v24 = 2080;
      v25 = "-[HMSoftwareUpdateController fetchAvailableUpdateWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)startUpdate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HMSoftwareUpdateController *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMSoftwareUpdateController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  HMSoftwareUpdateController *v27;
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  void (**v34)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC](v7);
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Update is a required parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v24);
  }
  v8 = (void (**)(_QWORD, _QWORD))v7;
  -[HMSoftwareUpdateController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdateController startUpdate:completionHandler:]", CFSTR("completionHandler"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v29;
      v37 = 2112;
      v38 = (const char *)v25;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke;
    block[3] = &unk_1E3AB4D20;
    block[4] = self;
    v32 = v6;
    v34 = v8;
    v33 = v10;
    dispatch_async(v11, block);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v15;
      v37 = 2080;
      v38 = "-[HMSoftwareUpdateController startUpdate:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v16);

  }
}

- (void)changeUpdateSource:(int64_t)a3 path:(id)a4 documentationPath:(id)a5 userInitiatedStaging:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HMSoftwareUpdateController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMSoftwareUpdateController *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  HMSoftwareUpdateController *v30;
  NSObject *v31;
  void *v32;
  char *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  int64_t v43;
  BOOL v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (a3 == 2 && !objc_msgSend(v12, "length"))
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      HMSoftwareUpdateAssetSourceAsString(2);
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v32;
      v47 = 2112;
      v48 = v33;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Path is a required parameter for source %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v34 = (void *)MEMORY[0x1E0C99DA0];
    v35 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, v36, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v37);
  }
  -[HMSoftwareUpdateController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdateController changeUpdateSource:path:documentationPath:userInitiatedStaging:completion:]", CFSTR("completion"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v27;
      v47 = 2112;
      v48 = (const char *)v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke;
    block[3] = &unk_1E3AAF630;
    block[4] = self;
    v43 = a3;
    v39 = v12;
    v40 = v13;
    v44 = a6;
    v42 = v14;
    v41 = v16;
    dispatch_async(v17, block);

  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v21;
      v47 = 2080;
      v48 = "-[HMSoftwareUpdateController changeUpdateSource:path:documentationPath:userInitiatedStaging:completion:]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v22);

  }
}

- (void)removeStagedSoftwareUpdate:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HMSoftwareUpdateController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMSoftwareUpdateController *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD block[4];
  void (**v21)(_QWORD, _QWORD);
  _BYTE *v22;
  id v23;
  id location;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdateController removeStagedSoftwareUpdate:]", CFSTR("completion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  -[HMSoftwareUpdateController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__14279;
    v27 = __Block_byref_object_dispose__14280;
    -[HMSoftwareUpdateController accessory](self, "accessory");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[HMSoftwareUpdateController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke;
    block[3] = &unk_1E3AAF658;
    objc_copyWeak(&v23, &location);
    v22 = buf;
    v21 = v5;
    dispatch_async(v8, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[HMSoftwareUpdateController removeStagedSoftwareUpdate:]";
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v13);

  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  HMSoftwareUpdateController *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "availableUpdate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateController availableUpdate](self, "availableUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if ((v9 & 1) != 0)
    {
      -[HMSoftwareUpdateController availableUpdate](self, "availableUpdate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mergeFromNewObject:", v7);

    }
    else
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating available software update: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMSoftwareUpdateController setAvailableUpdate:](v13, "setAvailableUpdate:", v7);
      -[HMSoftwareUpdateController delegate](v13, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMSoftwareUpdateController context](v13, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "queue");
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E3AB5CD0;
        block[4] = v13;
        v21 = v7;
        v22 = v16;
        dispatch_async(v18, block);

      }
    }
    v11 = v9 ^ 1;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMSoftwareUpdateController accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdateController accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMSoftwareUpdateController messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdateController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMSoftwareUpdateControllerDelegate)delegate
{
  return (HMSoftwareUpdateControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (_HMContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_availableUpdate, 0);
}

void __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of available software update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "softwareUpdateController:didUpdateAvailableUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@removing staged software update from accessory %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(v4, "messageDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageWithName:destination:payload:", CFSTR("HMSU.rsu"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke_81;
  v16 = &unk_1E3AB59B8;
  v17 = v4;
  v18 = *(id *)(a1 + 32);
  objc_msgSend(v10, "setResponseHandler:", &v13);
  objc_msgSend(v4, "context", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v10);

}

void __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v10)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v5;
    v12 = "%{public}@Failed to remove staged software update with error: %@";
    v13 = v9;
    v14 = 22;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    v12 = "%{public}@Successfully removed staged software update";
    v13 = v9;
    v14 = 12;
  }
  _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, v14);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 40), v5);

  }
}

void __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMSoftwareUpdateAssetSourceAsString(*(_QWORD *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Change update source to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("source"));

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("path"));
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("docpath"));
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("userInitiated"));

  }
  v12 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("HMSU.cus"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke_80;
  v20 = &unk_1E3AB4AE0;
  objc_copyWeak(&v22, (id *)buf);
  v21 = *(id *)(a1 + 64);
  objc_msgSend(v15, "setResponseHandler:", &v17);
  objc_msgSend(*(id *)(a1 + 56), "messageDispatcher", v17, v18, v19, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:completionHandler:", v15, 0);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

void __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v11)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v12;
    v20 = 2112;
    v21 = v5;
    v13 = "%{public}@Failed to change update source with error: %@";
    v14 = v10;
    v15 = 22;
  }
  else
  {
    if (!v11)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v12;
    v13 = "%{public}@Successfully changed update source";
    v14 = v10;
    v15 = 12;
  }
  _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, v15);

LABEL_7:
  objc_autoreleasePoolPop(v8);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v9, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

  }
}

void __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  const __CFString *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting update: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v19 = CFSTR("update");
  encodeRootObject(a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(a1[4], "messageDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageWithName:destination:payload:", CFSTR("HMSU.su"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, a1[4]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke_75;
  v16 = &unk_1E3AB4AE0;
  objc_copyWeak(&v18, (id *)buf);
  v17 = a1[7];
  objc_msgSend(v11, "setResponseHandler:", &v13);
  objc_msgSend(a1[6], "messageDispatcher", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:completionHandler:", v11, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v11)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v5;
    v13 = "%{public}@Failed to start updates with error: %{public}@";
    v14 = v10;
    v15 = 22;
  }
  else
  {
    if (!v11)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v12;
    v13 = "%{public}@Successfully started update";
    v14 = v10;
    v15 = 12;
  }
  _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, v15);

LABEL_7:
  objc_autoreleasePoolPop(v8);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v9, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

  }
}

void __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching available updates", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(a1[4], "messageDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMSU.fu"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, a1[4]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_67;
  v13 = &unk_1E3AB4AE0;
  objc_copyWeak(&v15, (id *)buf);
  v14 = a1[6];
  objc_msgSend(v8, "setResponseHandler:", &v10);
  objc_msgSend(a1[5], "messageDispatcher", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:completionHandler:", v8, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *context;
  void *contexta;
  void *contextb;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v11;
      v51 = 2112;
      v52 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to fetched available updates with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("update"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v48 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v48);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v48;
      v15 = v14;
      if (!v13)
      {
        v42 = v14;
        v16 = (void *)MEMORY[0x1A1AC1AAC]();
        v17 = WeakRetained;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          context = v16;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v19;
          v51 = 2112;
          v52 = v42;
          _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from software update data: %@", buf, 0x16u);

          v16 = context;
        }

        objc_autoreleasePoolPop(v16);
        v15 = v42;
      }
      objc_msgSend(WeakRetained, "availableUpdate", context);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = HMFEqualObjects();

      if ((v21 & 1) == 0)
      {
        contexta = (void *)MEMORY[0x1A1AC1AAC]();
        v22 = WeakRetained;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        v43 = v15;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v24;
          v51 = 2112;
          v52 = v13;
          _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Updating available software update: %@", buf, 0x16u);

          v15 = v43;
        }

        objc_autoreleasePoolPop(contexta);
        objc_msgSend(v22, "setAvailableUpdate:", v13);
        objc_msgSend(v22, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v26 = objc_loadWeakRetained((id *)(a1 + 40));
          v27 = (void *)MEMORY[0x1A1AC1AAC]();
          v28 = v26;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            contextb = v27;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v30;
            v51 = 2112;
            v52 = v13;
            _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_INFO, "%{public}@Notifying client of available software update: %@", buf, 0x16u);

            v27 = contextb;
          }

          objc_autoreleasePoolPop(v27);
          objc_msgSend(v28, "context");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "delegateCaller");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_72;
          v44[3] = &unk_1E3AB5CD0;
          v45 = v25;
          v46 = v28;
          v47 = v13;
          objc_msgSend(v32, "invokeBlock:", v44);

          v15 = v43;
        }

      }
    }
    else
    {
      v13 = 0;
    }

    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = WeakRetained;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v36;
      v51 = 2112;
      v52 = v13;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully fetched available update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "context");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "delegateCaller");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

  }
}

uint64_t __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_72(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "softwareUpdateController:didUpdateAvailableUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)namespace
{
  if (namespace_onceToken != -1)
    dispatch_once(&namespace_onceToken, &__block_literal_global_14348);
  return (id)namespace_namespace;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34 != -1)
    dispatch_once(&logCategory__hmf_once_t34, &__block_literal_global_82);
  return (id)logCategory__hmf_once_v35;
}

void __41__HMSoftwareUpdateController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35;
  logCategory__hmf_once_v35 = v0;

}

void __39__HMSoftwareUpdateController_namespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("514B3134-D00C-4B59-9FF6-7CA047DE7824"));
  v1 = (void *)namespace_namespace;
  namespace_namespace = v0;

}

@end

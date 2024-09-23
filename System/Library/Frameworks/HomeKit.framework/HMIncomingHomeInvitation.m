@implementation HMIncomingHomeInvitation

- (HMIncomingHomeInvitation)initWithInvitationData:(id)a3 homeManager:(id)a4
{
  id v6;
  id v7;
  HMIncomingHomeInvitation *v8;
  HMUser *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMUser *inviter;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMIncomingHomeInvitation;
  v8 = -[HMHomeInvitation initWithInvitationData:home:](&v16, sel_initWithInvitationData_home_, v6, 0);
  if (v8)
  {
    v9 = [HMUser alloc];
    objc_msgSend(v6, "inviterUserID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inviterName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inviterUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMUser initWithUserID:name:uuid:home:](v9, "initWithUserID:name:uuid:home:", v10, v11, v12, 0);
    inviter = v8->_inviter;
    v8->_inviter = (HMUser *)v13;

    objc_storeWeak((id *)&v8->_homeManager, v7);
  }

  return v8;
}

- (void)__configureWithContext:(id)a3 homeManager:(id)a4
{
  id v6;

  v6 = a4;
  -[HMHomeInvitation setContext:](self, "setContext:", a3);
  -[HMIncomingHomeInvitation setHomeManager:](self, "setHomeManager:", v6);

}

- (void)_unconfigureContext
{
  -[HMHomeInvitation setContext:](self, "setContext:", 0);
}

- (void)_unconfigure
{
  void *v3;
  void *v4;
  HMIncomingHomeInvitation *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMHomeInvitation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring incoming Home invitation", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMIncomingHomeInvitation setHomeManager:](v5, "setHomeManager:", 0);
    -[HMIncomingHomeInvitation _unconfigureContext](v5, "_unconfigureContext");
  }
}

- (NSString)homeName
{
  void *v2;
  void *v3;

  -[HMHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)homeUUID
{
  void *v2;
  void *v3;

  -[HMHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)cancelInviteWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  HMIncomingHomeInvitation *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMIncomingHomeInvitation *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HMHomeInvitation context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMIncomingHomeInvitation cancelInviteWithCompletionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling declined invitation.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMIncomingHomeInvitation homeManager](v8, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "_declineInvitation:completionHandler:", v8, v4);
    }
    else
    {
      objc_msgSend(v6, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v4, v16);

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation cancelInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v13);
  }

}

- (void)ignoreInviteWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  HMIncomingHomeInvitation *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMIncomingHomeInvitation *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HMHomeInvitation context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMIncomingHomeInvitation ignoreInviteWithCompletionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling ignored invitation.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMIncomingHomeInvitation homeManager](v8, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "_ignoreInvitation:completionHandler:", v8, v4);
    }
    else
    {
      objc_msgSend(v6, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v4, v16);

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation ignoreInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v13);
  }

}

- (void)acceptInviteWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  HMIncomingHomeInvitation *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMIncomingHomeInvitation *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HMHomeInvitation context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMIncomingHomeInvitation acceptInviteWithCompletionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling accepted invitation.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMIncomingHomeInvitation homeManager](v8, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "_acceptInvitation:completionHandler:", v8, v4);
    }
    else
    {
      objc_msgSend(v6, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 21, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v4, v16);

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation acceptInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v13);
  }

}

- (void)acceptInviteWithPresenceAuthStatus:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  HMIncomingHomeInvitation *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMIncomingHomeInvitation *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[HMHomeInvitation context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMIncomingHomeInvitation acceptInviteWithPresenceAuthStatus:completionHandler:]", CFSTR("completion"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMUserPresenceAuthorizationStatusAsString(a3);
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling accepted invitation with presenceAuthStatus: %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMIncomingHomeInvitation homeManager](v10, "homeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "_acceptInvitation:presenceAuthStatus:completionHandler:", v10, a3, v6);
    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 21, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v6, v19);

      v16 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2080;
      v29 = "-[HMIncomingHomeInvitation acceptInviteWithPresenceAuthStatus:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v16);
  }

}

- (void)reportJunkInviteWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  void *v6;
  void *v7;
  HMIncomingHomeInvitation *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMIncomingHomeInvitation *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HMHomeInvitation context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMIncomingHomeInvitation reportJunkInviteWithCompletionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling a junk invitation.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMIncomingHomeInvitation homeManager](v8, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "_reportJunkInvitation:completionHandler:", v8, v4);
    }
    else
    {
      objc_msgSend(v6, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v4, v16);

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2080;
      v26 = "-[HMIncomingHomeInvitation reportJunkInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v13);
  }

}

- (HMIncomingHomeInvitation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMIncomingHomeInvitation *v6;
  HMUser *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMUser *inviter;
  uint64_t v14;
  HMRestrictedGuestHomeAccessSchedule *restrictedGuestSchedule;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.invitationData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)HMIncomingHomeInvitation;
  v6 = -[HMHomeInvitation initWithCoder:invitationData:](&v17, sel_initWithCoder_invitationData_, v4, v5);
  if (v6)
  {
    v7 = [HMUser alloc];
    objc_msgSend(v5, "inviterUserID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviterName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviterUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeInvitation home](v6, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMUser initWithUserID:name:uuid:home:](v7, "initWithUserID:name:uuid:home:", v8, v9, v10, v11);
    inviter = v6->_inviter;
    v6->_inviter = (HMUser *)v12;

    v6->_homeHasCameras = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMIncomingInvitationHomeHasCamerasCodingKey"));
    v6->_inviteeRestrictedGuest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.u.isRG"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.RG.Schedule"));
    v14 = objc_claimAutoreleasedReturnValue();
    restrictedGuestSchedule = v6->_restrictedGuestSchedule;
    v6->_restrictedGuestSchedule = (HMRestrictedGuestHomeAccessSchedule *)v14;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMHomeInvitation invitationData](self, "invitationData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.invitationData"));

}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HMHomeInvitation invitationState](self, "invitationState");
    v7 = objc_msgSend(v5, "invitationState");
    v8 = v6 == v7;
    v9 = v6 != v7;
    if (!v8)
      -[HMHomeInvitation _updateInvitationState:](self, "_updateInvitationState:", objc_msgSend(v5, "invitationState"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeInvitation uniqueIdentifier](self, "uniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("ID"), v24);
  v25[0] = v23;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMIncomingHomeInvitation inviter](self, "inviter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "userID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Inviter UserID"), v21);
  v25[1] = v20;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMIncomingHomeInvitation inviter](self, "inviter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Inviter Name"), v7);
  v25[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMIncomingHomeInvitation isInviteeRestrictedGuest](self, "isInviteeRestrictedGuest");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Is RG"), v10);
  v25[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMIncomingHomeInvitation homeHasCameras](self, "homeHasCameras");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("DoesHomeHasCameras"), v13);
  v25[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMIncomingHomeInvitation restrictedGuestSchedule](self, "restrictedGuestSchedule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("rgSchedule"), v16);
  v25[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v18;
}

- (HMUser)inviter
{
  return self->_inviter;
}

- (BOOL)homeHasCameras
{
  return self->_homeHasCameras;
}

- (BOOL)isInviteeRestrictedGuest
{
  return self->_inviteeRestrictedGuest;
}

- (HMRestrictedGuestHomeAccessSchedule)restrictedGuestSchedule
{
  return self->_restrictedGuestSchedule;
}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_restrictedGuestSchedule, 0);
  objc_storeStrong((id *)&self->_inviter, 0);
}

+ (id)incomingHomeInvitationFromEncodedData:(id)a3 homeManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_11;
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v11, v6, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (!v12)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive incoming home invitation data from encoded invitations data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);

    goto LABEL_11;
  }
  v14 = v12;
  objc_opt_class();
  v15 = objc_opt_isKindOfClass() & 1;
  v16 = v15 ? v14 : 0;
  v17 = v16;

  if (!v15)
LABEL_11:
    v14 = (id)MEMORY[0x1E0C9AA60];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isForPKSharingMessageInvitationWithAppleSharingDict:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "hmf_stringForKey:", CFSTR("HMHomeInvitationIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeInvitation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

@end

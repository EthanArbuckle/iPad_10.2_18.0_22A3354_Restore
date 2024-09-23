@implementation HMOutgoingHomeInvitation

- (HMOutgoingHomeInvitation)initWithInvitationData:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMOutgoingHomeInvitation *v8;
  HMUser *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMUser *invitee;
  uint64_t v15;
  HMMutableArray *accessoryInvitations;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMOutgoingHomeInvitation;
  v8 = -[HMHomeInvitation initWithInvitationData:home:](&v18, sel_initWithInvitationData_home_, v6, v7);
  if (v8)
  {
    v9 = [HMUser alloc];
    objc_msgSend(v6, "inviteeUserID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inviteeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inviteeUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMUser initWithUserID:name:uuid:home:](v9, "initWithUserID:name:uuid:home:", v10, v11, v12, v7);
    invitee = v8->_invitee;
    v8->_invitee = (HMUser *)v13;

    +[HMMutableArray array](HMMutableArray, "array");
    v15 = objc_claimAutoreleasedReturnValue();
    accessoryInvitations = v8->_accessoryInvitations;
    v8->_accessoryInvitations = (HMMutableArray *)v15;

  }
  return v8;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;

  v6 = a4;
  -[HMHomeInvitation setContext:](self, "setContext:", a3);
  -[HMHomeInvitation setHome:](self, "setHome:", v6);

}

- (void)_unconfigureContext
{
  -[HMHomeInvitation setContext:](self, "setContext:", 0);
}

- (void)_unconfigure
{
  void *v3;
  void *v4;
  HMOutgoingHomeInvitation *v5;
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring home invitation", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMHomeInvitation setHome:](v5, "setHome:", 0);
    -[HMOutgoingHomeInvitation _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (NSArray)accessoryInvitations
{
  return -[HMMutableArray array](self->_accessoryInvitations, "array");
}

- (void)cancelInviteWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMOutgoingHomeInvitation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMOutgoingHomeInvitation *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeInvitation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMOutgoingHomeInvitation cancelInviteWithCompletionHandler:]", CFSTR("completion"));
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
      v22 = v17;
      v23 = 2112;
      v24 = (const char *)v13;
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
    block[2] = __62__HMOutgoingHomeInvitation_cancelInviteWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB60A0;
    block[4] = self;
    v20 = v4;
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
      v22 = v11;
      v23 = 2080;
      v24 = "-[HMOutgoingHomeInvitation cancelInviteWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)_cancelInviteWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HMHomeInvitation home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_cancelInvitation:completionHandler:", self, v9);
  }
  else
  {
    -[HMHomeInvitation context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callCompletion:error:", v9, v8);

  }
}

- (BOOL)_mergeWithNewAccessoryInvitations:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  HMObjectMergeCollection *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMOutgoingHomeInvitation accessoryInvitations](self, "accessoryInvitations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v6, v4);

  -[HMObjectMergeCollection removedObjects](v7, "removedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke;
  v14[3] = &unk_1E3AB3AE0;
  v14[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  -[HMObjectMergeCollection addedObjects](v7, "addedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke_130;
  v13[3] = &unk_1E3AB3AE0;
  v13[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  -[HMObjectMergeCollection mergeCommonObjects](v7, "mergeCommonObjects");
  -[HMObjectMergeCollection finalObjects](v7, "finalObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMutableArray setArray:](self->_accessoryInvitations, "setArray:", v11);

  LOBYTE(self) = -[HMObjectMergeCollection isModified](v7, "isModified");
  return (char)self;
}

- (HMOutgoingHomeInvitation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMOutgoingHomeInvitation *v6;
  HMUser *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMUser *invitee;
  HMMutableArray *accessoryInvitations;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.invitationData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HMOutgoingHomeInvitation;
  v6 = -[HMHomeInvitation initWithCoder:invitationData:](&v20, sel_initWithCoder_invitationData_, v4, v5);
  if (v6)
  {
    v7 = [HMUser alloc];
    objc_msgSend(v5, "inviteeUserID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviteeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inviteeUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeInvitation home](v6, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMUser initWithUserID:name:uuid:home:](v7, "initWithUserID:name:uuid:home:", v8, v9, v10, v11);
    invitee = v6->_invitee;
    v6->_invitee = (HMUser *)v12;

    accessoryInvitations = v6->_accessoryInvitations;
    v15 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("HM.accessoryInvitations"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMutableArray setArray:](accessoryInvitations, "setArray:", v18);

  }
  return v6;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  int64_t v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "accessoryInvitations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMOutgoingHomeInvitation _mergeWithNewAccessoryInvitations:](self, "_mergeWithNewAccessoryInvitations:", v6);
    v8 = -[HMHomeInvitation invitationState](self, "invitationState");
    if (v8 != objc_msgSend(v5, "invitationState"))
    {
      -[HMHomeInvitation _updateInvitationState:](self, "_updateInvitationState:", objc_msgSend(v5, "invitationState"));
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HMUser)invitee
{
  return self->_invitee;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitee, 0);
  objc_storeStrong((id *)&self->_accessoryInvitations, 0);
}

void __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory invitation via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __62__HMOutgoingHomeInvitation__mergeWithNewAccessoryInvitations___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added accessory invitation via merge: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_firstObjectWithUniqueIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessory:", v12);
}

uint64_t __62__HMOutgoingHomeInvitation_cancelInviteWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelInviteWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

+ (id)homeInvitationsFromEncodedData:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
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
  if (v6)
  {
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
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v17;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive outgoing home invitation data from encoded invitations data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    v18 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      +[HMOutgoingHomeInvitation homeInvitationsFromData:home:](HMOutgoingHomeInvitation, "homeInvitationsFromData:home:", v20, v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)homeInvitationsFromData:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HMOutgoingHomeInvitation *v14;
  HMOutgoingHomeInvitation *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [HMOutgoingHomeInvitation alloc];
        v15 = -[HMOutgoingHomeInvitation initWithInvitationData:home:](v14, "initWithInvitationData:home:", v13, v6, (_QWORD)v18);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)appleSharingDict
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("HMHomeInvitationIdentifierKey");
  -[HMHomeInvitation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

@end

@implementation HMHome(HFUserHandleAdditions)

- (id)hf_userForHandle:()HFUserHandleAdditions
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  if (v6 == 1)
  {
    objc_msgSend(a1, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__HMHome_HFUserHandleAdditions__hf_userForHandle___block_invoke;
    v11[3] = &unk_1EA72A818;
    v12 = v5;
    objc_msgSend(v8, "na_firstObjectPassingTest:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFUserHandle.m"), 83, CFSTR("Unknown user handle %@"), v5);

    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (HFUserHandle)hf_handleForUser:()HFUserHandleAdditions
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  HFUserHandle *v9;
  HFUserHandle *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  objc_msgSend(v4, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 || (v6 & 1) != 0)
  {
    v10 = [HFUserHandle alloc];
    objc_msgSend(v4, "userID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFUserHandle initWithType:userID:](v10, "initWithType:userID:", v6 ^ 1u, v11);

  }
  else
  {
    HFLogForCategory(0x45uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Can't create HFUserHandle from HMUser because HMUser.userID is nil: %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

@end

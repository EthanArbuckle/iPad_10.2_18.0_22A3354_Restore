@implementation HMFMessageDispatcher

- (void)dispatchMessage:(id)a3
{
  id v4;
  void *v5;
  HMFMessageDispatcher *v6;
  NSObject *v7;
  void *v8;
  HMFMessageDispatcher *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  HMFMessageDispatcher *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  HMFMessageDispatcher *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  __CFString *v39;
  void *v40;
  HMFMessageDispatcher *v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  HMFMessageDispatcher *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HMFMessageDispatcher *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *context;
  void *v56;
  int v57;
  id v58;
  void *v59;
  void *v60;
  HMFMessageDispatcher *v61;
  __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  const __CFString *v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1A1AC355C]();
  objc_msgSend(v4, "shortDescription");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1A1AC355C]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = (uint64_t)v8;
    v78 = 2112;
    v79 = v56;
    _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMFMessageDispatcher handlersForMessage:](v6, "handlersForMessage:", v4);
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v9;
  if (objc_msgSend(v10, "count"))
  {
    -[HMFMessageDispatcher filterClasses](v9, "filterClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v12 = v10;
    v64 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    if (v64)
    {
      v57 = 0;
      v62 = 0;
      v63 = *(_QWORD *)v73;
      v59 = v11;
      v60 = v10;
      v58 = v12;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v73 != v63)
            objc_enumerationMutation(v12);
          v14 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v14, "receiver");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v65 = v15;
            v66 = i;
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            v16 = v11;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v69;
              while (2)
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v69 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                  objc_msgSend(v14, "policies");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = 0;
                  v23 = v4;
                  v24 = objc_msgSend(v21, "filterMessage:withPolicies:error:", v4, v22, &v67);
                  v25 = (__CFString *)v67;

                  if (v24 == -1)
                  {
                    v33 = (void *)MEMORY[0x1A1AC355C]();
                    v34 = v61;
                    HMFGetOSLogHandle();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier(v34);
                      v36 = objc_claimAutoreleasedReturnValue();
                      v37 = (void *)v36;
                      *(_DWORD *)buf = 138544130;
                      v38 = CFSTR("(unspecified error)");
                      if (v25)
                        v38 = v25;
                      v77 = v36;
                      v78 = 2112;
                      v79 = v56;
                      v80 = 2112;
                      v81 = v21;
                      v82 = 2112;
                      v83 = v38;
                      _os_log_impl(&dword_19B546000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Message %@ rejected by %@: %@", buf, 0x2Au);

                    }
                    objc_autoreleasePoolPop(v33);
                    v11 = v59;
                    v10 = v60;
                    v39 = v62;
                    if (!v62)
                      v39 = v25;
                    v62 = v39;

                    v4 = v23;
                    goto LABEL_30;
                  }

                  v4 = v23;
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                if (v18)
                  continue;
                break;
              }
            }

            v26 = (void *)MEMORY[0x1A1AC355C]();
            v27 = v61;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier(v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "shortDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v77 = (uint64_t)v29;
              v78 = 2112;
              v79 = v30;
              _os_log_impl(&dword_19B546000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Invoking handler: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v26);
            v31 = objc_msgSend(v14, "invokeWithMessage:", v4);
            v32 = v57;
            if (v31)
              v32 = 1;
            v57 = v32;
            v11 = v59;
            v10 = v60;
LABEL_30:
            v12 = v58;
            v15 = v65;
            i = v66;
          }

        }
        v64 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      }
      while (v64);

      if ((v57 & 1) != 0)
      {
        v40 = (void *)MEMORY[0x1A1AC355C]();
        v41 = v61;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier(v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = (uint64_t)v43;
          v78 = 2112;
          v79 = v56;
          _os_log_impl(&dword_19B546000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Successfully dispatched message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        v44 = v62;
        goto LABEL_46;
      }
    }
    else
    {

      v62 = 0;
    }
  }
  else
  {
    v45 = (void *)MEMORY[0x1A1AC355C]();
    v46 = v9;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = (uint64_t)v48;
      v78 = 2112;
      v79 = v56;
      _os_log_impl(&dword_19B546000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@No handlers for message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v45);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 14);
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)MEMORY[0x1A1AC355C]();
  v50 = v61;
  HMFGetOSLogHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString shortDescription](v62, "shortDescription");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v77 = (uint64_t)v52;
    v78 = 2112;
    v79 = v56;
    v80 = 2112;
    v81 = v53;
    _os_log_impl(&dword_19B546000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@Message %@ was not handled with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v49);
  v44 = v62;
  if (v62)
  {
    objc_msgSend(v4, "respondWithError:", v62);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 14);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v54);

    v44 = 0;
  }
LABEL_46:

  objc_autoreleasePoolPop(context);
}

- (id)handlersForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  hmf_unfair_data_lock_s *p_lock;
  NSMutableOrderedSet *handlers;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HMFMessageDispatcher *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMFMessageDestination allMessageTargets](HMFMessageDestination, "allMessageTargets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9) ^ 1;

    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    handlers = self->_handlers;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __43__HMFMessageDispatcher_handlersForMessage___block_invoke;
    v22[3] = &unk_1E3B38748;
    v13 = v6;
    v23 = v13;
    v25 = v10;
    v14 = v8;
    v24 = v14;
    -[NSMutableOrderedSet indexesOfObjectsWithOptions:passingTest:](handlers, "indexesOfObjectsWithOptions:passingTest:", 1, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[NSMutableOrderedSet objectsAtIndexes:](self->_handlers, "objectsAtIndexes:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }

    os_unfair_lock_unlock(&p_lock->lock);
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC355C]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_19B546000, v19, OS_LOG_TYPE_FAULT, "%{public}@Requested handlers for nil message", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (NSSet)filterClasses
{
  hmf_unfair_data_lock_s *p_lock;
  NSSet *filterClasses;
  NSSet *v5;
  NSSet *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  filterClasses = self->_filterClasses;
  if (filterClasses)
  {
    v5 = filterClasses;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  os_unfair_lock_unlock(&p_lock->lock);
  return v6;
}

+ (NSUUID)allMessagesForMessageNameTarget
{
  return (NSUUID *)objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 selector:(SEL)a5
{
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](self, "registerForMessage:receiver:policies:selector:", a3, a4, MEMORY[0x1E0C9AA60], a5);
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  -[HMFMessageDispatcher dispatchMessage:](self, "dispatchMessage:", a4);
}

+ (id)logCategory
{
  if (_MergedGlobals_3_6 != -1)
    dispatch_once(&_MergedGlobals_3_6, &__block_literal_global_22);
  return (id)qword_1ED012EF8;
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "messageTargetUUID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:targetUUID:receiver:policies:selector:](self, "registerForMessage:targetUUID:receiver:policies:selector:", v12, v13, v11, v10, a6);

}

- (void)registerForMessage:(id)a3 targetUUID:(id)a4 receiver:(id)a5 policies:(id)a6 selector:(SEL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x1A1AC355C]();
  if (!v17)
    _HMFPreconditionFailure(CFSTR("messageName"));
  if (!v14)
    _HMFPreconditionFailure(CFSTR("policies"));
  if (!a7)
    _HMFPreconditionFailure(CFSTR("selector"));
  if (!v12)
    _HMFPreconditionFailure(CFSTR("targetUUID"));
  +[__HMFMessageHandler handlerWithReceiver:targetUUID:name:policies:selector:](__HMFMessageHandler, "handlerWithReceiver:targetUUID:name:policies:selector:", v13, v12, v17, v14, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    __HMFMessageDispatcherRegisterHandler(self, v16);

  objc_autoreleasePoolPop(v15);
}

- (void)sendMessage:(id)a3
{
  -[HMFMessageDispatcher sendMessage:completionHandler:](self, "sendMessage:completionHandler:", a3, 0);
}

- (void)sendMessage:(id)a3 target:(id)a4 responseQueue:(id)a5 responseHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  HMFMessageDestination *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  OS_dispatch_queue *v28;
  id v29;
  OS_dispatch_queue *v30;
  _QWORD v31[4];
  OS_dispatch_queue *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x1A1AC355C]();
  objc_msgSend(v12, "destination");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "target");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", v13);

  if ((v20 & 1) == 0)
  {
    v21 = -[HMFMessageDestination initWithTarget:]([HMFMessageDestination alloc], "initWithTarget:", v13);
    objc_msgSend(v12, "setDestination:", v21);

  }
  objc_msgSend(v12, "responseHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && v22)
  {
    v23 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v25;
      _os_log_impl(&dword_19B546000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot send with response handler if the message already has a response handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }
  objc_msgSend(v12, "responseHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = MEMORY[0x1E0C809B0];
  if (!v26)
  {
    if (v14 && v15)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke;
      v34[3] = &unk_1E3B38808;
      v35 = v14;
      v36 = v15;
      v26 = (void *)MEMORY[0x1A1AC373C](v34);

    }
    objc_msgSend(v12, "setResponseHandler:", v26);

  }
  v28 = self->_workQueue;
  v31[0] = v27;
  v31[1] = 3221225472;
  v31[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_3;
  v31[3] = &unk_1E3B38830;
  v29 = v16;
  v32 = v28;
  v33 = v29;
  v30 = v28;
  -[HMFMessageDispatcher sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v12, v31);

  objc_autoreleasePoolPop(v17);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  HMFMessageDispatcher *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  if (v6)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 8, CFSTR("Requested to send nil message"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = CFSTR("Requested to send nil message");
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_FAULT, "%{public}@%@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  -[HMFMessageDispatcher transport](self, "transport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v9)
      goto LABEL_8;
LABEL_11:
    objc_msgSend(v14, "sendMessage:completionHandler:", v6, v7);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("The dispatcher does not have a valid transport"));
  v15 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v15;
  if (!v15)
    goto LABEL_11;
LABEL_8:
  if (v7)
    v7[2](v7, v9);
LABEL_12:

  objc_autoreleasePoolPop(v8);
}

- (HMFMessageTransport)transport
{
  return self->_transport;
}

- (void)sendMessage:(id)a3 target:(id)a4 responseQueue:(id)a5 responseHandler:(id)a6
{
  -[HMFMessageDispatcher sendMessage:target:responseQueue:responseHandler:completionHandler:](self, "sendMessage:target:responseQueue:responseHandler:completionHandler:", a3, a4, a5, a6, 0);
}

uint64_t __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_4;
    block[3] = &unk_1E3B38630;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

- (HMFMessageDispatcher)initWithTransport:(id)a3
{
  id v5;
  HMFMessageDispatcher *v6;
  HMFMessageDispatcher *v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  uint64_t v12;
  NSMutableOrderedSet *handlers;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMFMessageDispatcher;
  v6 = -[HMFMessageDispatcher init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = (const char *)HMFDispatchQueueName(v6, CFSTR("workQ"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v12 = objc_claimAutoreleasedReturnValue();
    handlers = v7->_handlers;
    v7->_handlers = (NSMutableOrderedSet *)v12;

    objc_storeStrong((id *)&v7->_transport, a3);
    -[HMFMessageTransport setDelegate:](v7->_transport, "setDelegate:", v7);
  }

  return v7;
}

void __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_2;
  block[3] = &unk_1E3B387E0;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

- (void)sendMessage:(id)a3 target:(id)a4
{
  -[HMFMessageDispatcher sendMessage:target:responseQueue:responseHandler:completionHandler:](self, "sendMessage:target:responseQueue:responseHandler:completionHandler:", a3, a4, 0, 0, 0);
}

void __35__HMFMessageDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Messaging.Dispatcher"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012EF8;
  qword_1ED012EF8 = v0;

}

- (id)sendMessageExpectingResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  if (!v4
    || (v5 = v4,
        objc_msgSend(v4, "responseHandler"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    _HMFPreconditionFailure(CFSTR("message && !message.responseHandler"));
  }
  v15 = 0;
  +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke;
  v13[3] = &unk_1E3B37B48;
  v14 = v15;
  objc_msgSend(v8, "setResponseHandler:", v13);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke_2;
  v11[3] = &unk_1E3B37B70;
  v12 = v15;
  -[HMFMessageDispatcher sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v8, v11);

  return v7;
}

uint64_t __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "rejectWithError:", a2);
  else
    return objc_msgSend(v2, "fulfillWithValue:");
}

uint64_t __64__HMFMessageDispatcher_HMFFuture__sendMessageExpectingResponse___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "rejectWithError:", a2);
  return result;
}

- (HMFMessageDispatcher)init
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

- (void)setFilterClasses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class()) || v8 == (void *)objc_opt_class())
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid filter class '%@', must be subclass of %@"), v8, objc_opt_class(), (_QWORD)v12);
          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v11);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  os_unfair_lock_lock_with_options();
  if (v4)
  {
    v9 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_storeStrong((id *)&self->_filterClasses, v9);

  os_unfair_lock_unlock(&self->_lock.lock);
}

uint64_t __43__HMFMessageDispatcher_handlersForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(v3, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMFMessageDispatcher allMessagesForMessageNameTarget](HMFMessageDispatcher, "allMessagesForMessageNameTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0 || !*(_BYTE *)(a1 + 48))
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v3, "target");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 messageHandler:(id)a5
{
  -[HMFMessageDispatcher registerForMessage:receiver:policies:messageHandler:](self, "registerForMessage:receiver:policies:messageHandler:", a3, a4, MEMORY[0x1E0C9AA60], a5);
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 messageHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1A1AC355C]();
  if (!v15)
    _HMFPreconditionFailure(CFSTR("messageName"));
  if (!v11)
    _HMFPreconditionFailure(CFSTR("policies"));
  if (!v12)
    _HMFPreconditionFailure(CFSTR("messageHandler"));
  +[__HMFMessageHandler handlerWithReceiver:name:policies:handler:](__HMFMessageHandler, "handlerWithReceiver:name:policies:handler:", v10, v15, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    __HMFMessageDispatcherRegisterHandler(self, v14);

  objc_autoreleasePoolPop(v13);
}

- (void)deregisterForMessage:(id)a3 receiver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSMutableOrderedSet *handlers;
  void *v11;
  void *v12;
  HMFMessageDispatcher *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMFMessageDispatcher *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *context;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure(CFSTR("messageName"));
  v8 = v7;
  if (v7)
  {
    v9 = os_unfair_lock_lock_with_options();
    context = (void *)MEMORY[0x1A1AC355C](v9);
    handlers = self->_handlers;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__HMFMessageDispatcher_deregisterForMessage_receiver___block_invoke;
    v22[3] = &unk_1E3B38770;
    v23 = v8;
    v24 = v6;
    -[NSMutableOrderedSet indexesOfObjectsWithOptions:passingTest:](handlers, "indexesOfObjectsWithOptions:passingTest:", 1, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x1A1AC355C]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        v27 = 2112;
        v28 = (uint64_t)v11;
        _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing handlers at indexes: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v16 = (void *)MEMORY[0x1A1AC355C](-[NSMutableOrderedSet removeObjectsAtIndexes:](self->_handlers, "removeObjectsAtIndexes:", v11));
      v17 = v13;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v17);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = -[NSMutableOrderedSet count](self->_handlers, "count");
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        v27 = 2048;
        v28 = v20;
        _os_log_impl(&dword_19B546000, v18, OS_LOG_TYPE_INFO, "%{public}@_handlers: %lu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }

    objc_autoreleasePoolPop(context);
    os_unfair_lock_unlock(&self->_lock.lock);
  }

}

uint64_t __54__HMFMessageDispatcher_deregisterForMessage_receiver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "hasReceiver:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)deregisterReceiver:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableOrderedSet *handlers;
  void *v8;
  void *v9;
  HMFMessageDispatcher *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = os_unfair_lock_lock_with_options();
    v6 = (void *)MEMORY[0x1A1AC355C](v5);
    handlers = self->_handlers;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__HMFMessageDispatcher_deregisterReceiver___block_invoke;
    v13[3] = &unk_1E3B38798;
    v14 = v4;
    -[NSMutableOrderedSet indexesOfObjectsWithOptions:passingTest:](handlers, "indexesOfObjectsWithOptions:passingTest:", 1, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1A1AC355C]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing handlers at indexes: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_handlers, "removeObjectsAtIndexes:", v8);
    }

    objc_autoreleasePoolPop(v6);
    os_unfair_lock_unlock(&self->_lock.lock);
  }

}

uint64_t __43__HMFMessageDispatcher_deregisterReceiver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasReceiver:", *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_filterClasses, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

- (void)dispatchMessage:(id)a3 target:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  HMFMessageDestination *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!v6)
  {
    +[HMFMessageDestination allMessageTargets](HMFMessageDestination, "allMessageTargets");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if ((v9 & 1) == 0)
  {
    v10 = -[HMFMessageDestination initWithTarget:]([HMFMessageDestination alloc], "initWithTarget:", v6);
    objc_msgSend(v11, "setDestination:", v10);

  }
  -[HMFMessageDispatcher dispatchMessage:](self, "dispatchMessage:", v11);

}

- (void)sendMessage:(id)a3 target:(id)a4 andInvokeCompletionHandler:(id)a5
{
  -[HMFMessageDispatcher sendMessage:target:responseQueue:responseHandler:completionHandler:](self, "sendMessage:target:responseQueue:responseHandler:completionHandler:", a3, a4, 0, 0, a5);
}

uint64_t __103__HMFMessageDispatcher_Deprecated__sendMessage_target_responseQueue_responseHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

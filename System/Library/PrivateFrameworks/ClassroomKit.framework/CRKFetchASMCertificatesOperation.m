@implementation CRKFetchASMCertificatesOperation

- (CRKFetchASMCertificatesOperation)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 controlGroupIdentifier:(id)a5 destinationAppleID:(id)a6 sourceAppleID:(id)a7 destinationDeviceIdentifier:(id)a8 sourceRole:(int64_t)a9 destinationRole:(int64_t)a10 requesterCertificate:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  CRKFetchASMCertificatesOperation *v22;
  CRKFetchASMCertificatesOperation *v23;
  uint64_t v24;
  NSString *destinationAppleID;
  uint64_t v26;
  NSString *sourceAppleID;
  uint64_t v28;
  NSString *destinationDeviceIdentifier;
  uint64_t v30;
  NSData *requesterCertificate;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a4;
  v33 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a11;
  v36.receiver = self;
  v36.super_class = (Class)CRKFetchASMCertificatesOperation;
  v22 = -[CRKFetchASMCertificatesOperation init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_IDSPrimitives, a3);
    objc_storeStrong((id *)&v23->_addressTranslator, a4);
    objc_storeStrong((id *)&v23->_controlGroupIdentifier, a5);
    v24 = objc_msgSend(v18, "copy");
    destinationAppleID = v23->_destinationAppleID;
    v23->_destinationAppleID = (NSString *)v24;

    v26 = objc_msgSend(v19, "copy");
    sourceAppleID = v23->_sourceAppleID;
    v23->_sourceAppleID = (NSString *)v26;

    v28 = objc_msgSend(v20, "copy");
    destinationDeviceIdentifier = v23->_destinationDeviceIdentifier;
    v23->_destinationDeviceIdentifier = (NSString *)v28;

    v23->_sourceRole = a9;
    v23->_destinationRole = a10;
    v30 = objc_msgSend(v21, "copy");
    requesterCertificate = v23->_requesterCertificate;
    v23->_requesterCertificate = (NSData *)v30;

  }
  return v23;
}

- (void)operationWillFinish
{
  id v2;

  -[CRKFetchASMCertificatesOperation messageReceiveSubscription](self, "messageReceiveSubscription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKFetchASMCertificatesOperation;
  -[CRKFetchASMCertificatesOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CRKFetchASMCertificatesOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __42__CRKFetchASMCertificatesOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endOperationWithError:", v3);

  }
}

- (void)main
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  CRKFetchASMCertificatesOperation *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    _CRKLogASM_4();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      v27 = 2048;
      v28 = self;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "%{public}@ - %p: Fetching ASM certificate", buf, 0x16u);

    }
    -[CRKFetchASMCertificatesOperation controlGroupIdentifier](self, "controlGroupIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchASMCertificatesOperation destinationDeviceIdentifier](self, "destinationDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CRKFetchASMCertificatesOperation sourceRole](self, "sourceRole");
    v10 = -[CRKFetchASMCertificatesOperation destinationRole](self, "destinationRole");
    -[CRKFetchASMCertificatesOperation requesterCertificate](self, "requesterCertificate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRKRequestCertificatesIDSMessage messageWithControlGroupIdentifier:destinationDeviceIdentifier:sourceRole:destinationRole:requesterCertificate:](CRKRequestCertificatesIDSMessage, "messageWithControlGroupIdentifier:destinationDeviceIdentifier:sourceRole:destinationRole:requesterCertificate:", v7, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke;
    v23[3] = &unk_24D9C7258;
    v23[4] = self;
    v14 = v12;
    v24 = v14;
    v15 = (void *)MEMORY[0x219A226E8](v23);
    _CRKLogASM_4();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 2048;
      v28 = self;
      _os_log_impl(&dword_218C99000, v16, OS_LOG_TYPE_INFO, "%{public}@ - %p: Preparing to receive response before sending request", buf, 0x16u);

    }
    -[CRKFetchASMCertificatesOperation IDSPrimitives](self, "IDSPrimitives");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke_5;
    v21[3] = &unk_24D9C72A8;
    v21[4] = self;
    v22 = v14;
    v20 = v14;
    objc_msgSend(v19, "subscribeToMessagesWithHandler:completion:", v15, v21);

  }
  else
  {
    -[CRKFetchASMCertificatesOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

void __40__CRKFetchASMCertificatesOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "requestIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processMessage:senderAppleID:requestIdentifier:", v7, v6, v8);

}

void __40__CRKFetchASMCertificatesOperation_main__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke_2;
  v10[3] = &unk_24D9C7280;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __40__CRKFetchASMCertificatesOperation_main__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  CRKIDSMessageCannon *v6;
  void *v7;
  CRKIDSMessageCannon *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:");
    }
    else
    {
      _CRKLogASM_4();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v22 = v4;
        v23 = 2048;
        v24 = v5;
        _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "%{public}@ - %p: Ready to receive certificate response", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "setMessageReceiveSubscription:", *(_QWORD *)(a1 + 48));
      v6 = [CRKIDSMessageCannon alloc];
      objc_msgSend(*(id *)(a1 + 32), "IDSPrimitives");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CRKIDSMessageCannon initWithIDSPrimitives:](v6, "initWithIDSPrimitives:", v7);

      _CRKLogASM_4();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v12, "destinationAppleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v11;
        v23 = 2048;
        v24 = v12;
        v25 = 2114;
        v26 = v13;
        _os_log_impl(&dword_218C99000, v9, OS_LOG_TYPE_INFO, "%{public}@ - %p: Sending cert request to (%{public}@)", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "addressTranslator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "destinationAppleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "destinationAddressForAppleID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setFireAndForget:", 1);
      v18 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "sourceAppleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __40__CRKFetchASMCertificatesOperation_main__block_invoke_8;
      v20[3] = &unk_24D9C6E18;
      v20[4] = *(_QWORD *)(a1 + 32);
      -[CRKIDSMessageCannon sendIDSMessage:destinationAddress:sourceAppleID:options:completion:](v8, "sendIDSMessage:destinationAddress:sourceAppleID:options:completion:", v18, v16, v19, v17, v20);

    }
  }
}

uint64_t __40__CRKFetchASMCertificatesOperation_main__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSendMessage:", a2);
}

- (void)didSendMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke;
  v6[3] = &unk_24D9C72D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t result;
  id *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = (uint64_t *)(a1 + 32);
  result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = (id *)(a1 + 40);
    if (v5)
    {
      _CRKLogASM_4();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke_cold_1(v2, v4, v6);

      return objc_msgSend((id)*v2, "endOperationWithError:", *v4);
    }
  }
  return result;
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 requestIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__CRKFetchASMCertificatesOperation_processMessage_senderAppleID_requestIdentifier___block_invoke;
  v14[3] = &unk_24D9C7280;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __83__CRKFetchASMCertificatesOperation_processMessage_senderAppleID_requestIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    _CRKLogASM_4();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v26 = 138543874;
      v27 = v4;
      v28 = 2048;
      v29 = v5;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "%{public}@ - %p: Processing message response from (%{public}@)", (uint8_t *)&v26, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "destinationAppleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v8)
    {
      +[CRKIDSMessagePayload instanceWithDictionary:](CRKIDSMessagePayload, "instanceWithDictionary:", *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "messageMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "messageType");

        if (v12 == 2)
        {
          objc_msgSend(v10, "messageContent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[CRKRequestCertificatesResponseIDSMessage instanceWithDictionary:](CRKRequestCertificatesResponseIDSMessage, "instanceWithDictionary:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v14, "requestIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 56));

            if (v16)
            {
              objc_msgSend(v14, "error");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                v18 = *(void **)(a1 + 32);
                objc_msgSend(v14, "error");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "endOperationWithError:", v19);
              }
              else
              {
                _CRKLogASM_4();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  v21 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = *(_QWORD *)(a1 + 32);
                  v24 = *(_QWORD *)(a1 + 40);
                  v26 = 138543874;
                  v27 = v22;
                  v28 = 2048;
                  v29 = v23;
                  v30 = 2114;
                  v31 = v24;
                  _os_log_impl(&dword_218C99000, v20, OS_LOG_TYPE_INFO, "%{public}@ - %p: Valid cert response from (%{public}@)", (uint8_t *)&v26, 0x20u);

                }
                v25 = *(void **)(a1 + 32);
                objc_msgSend(v14, "certificateDataCollection");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "endOperationWithResultObject:", v19);
              }

            }
          }

        }
      }

    }
  }
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSAddressTranslator)addressTranslator
{
  return self->_addressTranslator;
}

- (DMFControlGroupIdentifier)controlGroupIdentifier
{
  return self->_controlGroupIdentifier;
}

- (NSString)destinationAppleID
{
  return self->_destinationAppleID;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (NSString)destinationDeviceIdentifier
{
  return self->_destinationDeviceIdentifier;
}

- (int64_t)sourceRole
{
  return self->_sourceRole;
}

- (int64_t)destinationRole
{
  return self->_destinationRole;
}

- (NSData)requesterCertificate
{
  return self->_requesterCertificate;
}

- (CRKCancelable)messageReceiveSubscription
{
  return self->_messageReceiveSubscription;
}

- (void)setMessageReceiveSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_messageReceiveSubscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceiveSubscription, 0);
  objc_storeStrong((id *)&self->_requesterCertificate, 0);
  objc_storeStrong((id *)&self->_destinationDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppleID, 0);
  objc_storeStrong((id *)&self->_destinationAppleID, 0);
  objc_storeStrong((id *)&self->_controlGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addressTranslator, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

void __51__CRKFetchASMCertificatesOperation_didSendMessage___block_invoke_cold_1(uint64_t *a1, id *a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a1;
  objc_msgSend(*a2, "verboseDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543874;
  v11 = v7;
  v12 = 2048;
  v13 = v8;
  v14 = 2114;
  v15 = v9;
  _os_log_error_impl(&dword_218C99000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - %p: Failed to send cert request. Error = %{public}@", (uint8_t *)&v10, 0x20u);

}

@end

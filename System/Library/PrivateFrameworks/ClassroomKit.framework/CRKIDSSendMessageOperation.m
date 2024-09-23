@implementation CRKIDSSendMessageOperation

- (CRKIDSSendMessageOperation)initWithIDSLocalPrimitives:(id)a3 message:(id)a4 destinationAddress:(id)a5 sourceAppleID:(id)a6 options:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CRKIDSSendMessageOperation *v18;
  CRKIDSSendMessageOperation *v19;
  uint64_t v20;
  NSDictionary *message;
  uint64_t v22;
  NSString *destinationAddress;
  uint64_t v24;
  NSString *sourceAppleID;
  uint64_t v26;
  CRKIDSMessageOptions *options;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)CRKIDSSendMessageOperation;
  v18 = -[CRKIDSSendMessageOperation init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_IDSLocalPrimitives, a3);
    v20 = objc_msgSend(v14, "copy");
    message = v19->_message;
    v19->_message = (NSDictionary *)v20;

    v22 = objc_msgSend(v15, "copy");
    destinationAddress = v19->_destinationAddress;
    v19->_destinationAddress = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    sourceAppleID = v19->_sourceAppleID;
    v19->_sourceAppleID = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    options = v19->_options;
    v19->_options = (CRKIDSMessageOptions *)v26;

  }
  return v19;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  _QWORD block[5];
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  CRKIDSSendMessageOperation *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _CRKLogASM_3();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "%{public}@ - %p: Canceled", buf, 0x16u);

  }
  v7.receiver = self;
  v7.super_class = (Class)CRKIDSSendMessageOperation;
  -[CRKIDSSendMessageOperation cancel](&v7, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CRKIDSSendMessageOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __36__CRKIDSSendMessageOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "messageSendSubscription");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

    v3 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endOperationWithError:", v4);

  }
}

- (void)main
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  CRKIDSSendMessageOperation *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    _CRKLogASM_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v6;
      v31 = 2048;
      v32 = self;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "%{public}@ - %p: Creating listener validate message send success", buf, 0x16u);

    }
    objc_initWeak(&location, self);
    -[CRKIDSSendMessageOperation IDSLocalPrimitives](self, "IDSLocalPrimitives");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __34__CRKIDSSendMessageOperation_main__block_invoke;
    v26[3] = &unk_24D9C71A0;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v7, "subscribeToMessageSendsWithHandler:", v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKIDSSendMessageOperation setMessageSendSubscription:](self, "setMessageSendSubscription:", v8);

    -[CRKIDSSendMessageOperation messageSendSubscription](self, "messageSendSubscription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

    -[CRKIDSSendMessageOperation IDSLocalPrimitives](self, "IDSLocalPrimitives");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKIDSSendMessageOperation message](self, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKIDSSendMessageOperation destinationAddress](self, "destinationAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKIDSSendMessageOperation sourceAppleID](self, "sourceAppleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKIDSSendMessageOperation options](self, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    v15 = objc_msgSend(v10, "sendMessage:toAddress:fromID:options:identifier:error:", v11, v12, v13, v14, &v25, &v24);
    v16 = v25;
    v17 = v24;

    if ((v15 & 1) != 0)
    {
      _CRKLogASM_3();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        -[CRKIDSSendMessageOperation destinationAddress](self, "destinationAddress");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v20;
        v31 = 2048;
        v32 = self;
        v33 = 2114;
        v34 = v21;
        v35 = 2114;
        v36 = v16;
        _os_log_impl(&dword_218C99000, v18, OS_LOG_TYPE_INFO, "%{public}@ - %p: Sent message to %{public}@ and received identifier %{public}@", buf, 0x2Au);

      }
      -[CRKIDSSendMessageOperation setMessageSendIdentifier:](self, "setMessageSendIdentifier:", v16);
      v22 = (void *)objc_opt_new();
      -[CRKIDSSendMessageOperation setInitialSendDate:](self, "setInitialSendDate:", v22);

    }
    else
    {
      -[CRKIDSSendMessageOperation messageSendSubscription](self, "messageSendSubscription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cancel");

      -[CRKIDSSendMessageOperation endOperationWithError:](self, "endOperationWithError:", v17);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CRKIDSSendMessageOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

void __34__CRKIDSSendMessageOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "didSendMessageWithIdentifier:sendSuccess:error:", v8, a3, v7);

}

- (void)didSendMessageWithIdentifier:(id)a3 sendSuccess:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__CRKIDSSendMessageOperation_didSendMessageWithIdentifier_sendSuccess_error___block_invoke;
  v12[3] = &unk_24D9C71C8;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __77__CRKIDSSendMessageOperation_didSendMessageWithIdentifier_sendSuccess_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "messageSendIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v3)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "initialSendDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v5);
      v7 = v6;

      _CRKLogASM_3();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v11, "destinationAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a1 + 56))
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        v15 = v14;
        v17 = 138544642;
        v18 = v10;
        v19 = 2048;
        v20 = v11;
        v21 = 2114;
        v22 = v12;
        v23 = 2114;
        v24 = v13;
        v25 = 2114;
        v26 = v15;
        v27 = 2048;
        v28 = v7;
        _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "%{public}@ - %p: Received message send status for message %{public}@ to %{public}@. Did succeed = %{public}@, duration = %.2f", (uint8_t *)&v17, 0x3Eu);

      }
      v16 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 56))
        objc_msgSend(v16, "endOperationWithResultObject:", 0);
      else
        objc_msgSend(v16, "endOperationWithError:", *(_QWORD *)(a1 + 48));
    }
  }
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (NSString)sourceAppleID
{
  return self->_sourceAppleID;
}

- (CRKIDSMessageOptions)options
{
  return self->_options;
}

- (CRKCancelable)messageSendSubscription
{
  return self->_messageSendSubscription;
}

- (void)setMessageSendSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendSubscription, a3);
}

- (NSString)messageSendIdentifier
{
  return self->_messageSendIdentifier;
}

- (void)setMessageSendIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSDate)initialSendDate
{
  return self->_initialSendDate;
}

- (void)setInitialSendDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialSendDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSendDate, 0);
  objc_storeStrong((id *)&self->_messageSendIdentifier, 0);
  objc_storeStrong((id *)&self->_messageSendSubscription, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sourceAppleID, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
}

@end

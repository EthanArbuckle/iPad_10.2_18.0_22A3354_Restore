@implementation CATSendSerialIDSMessagesOperation

- (CATSendSerialIDSMessagesOperation)initWithIDSPrimitives:(id)a3 workQueue:(id)a4 messages:(id)a5 destinationAddress:(id)a6 sourceAppleID:(id)a7 options:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CATSendSerialIDSMessagesOperation *v21;
  CATSendSerialIDSMessagesOperation *v22;
  uint64_t v23;
  NSArray *mMessages;
  uint64_t v25;
  NSString *mDestinationAddress;
  uint64_t v27;
  NSString *mSourceAppleID;
  uint64_t v29;
  CATIDSMessageOptions *mOptions;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CATSendSerialIDSMessagesOperation;
  v21 = -[CATOperation init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->mPrimitives, a3);
    objc_storeStrong((id *)&v22->mWorkQueue, a4);
    v23 = objc_msgSend(v17, "copy");
    mMessages = v22->mMessages;
    v22->mMessages = (NSArray *)v23;

    v25 = objc_msgSend(v18, "copy");
    mDestinationAddress = v22->mDestinationAddress;
    v22->mDestinationAddress = (NSString *)v25;

    v27 = objc_msgSend(v19, "copy");
    mSourceAppleID = v22->mSourceAppleID;
    v22->mSourceAppleID = (NSString *)v27;

    v29 = objc_msgSend(v20, "copy");
    mOptions = v22->mOptions;
    v22->mOptions = (CATIDSMessageOptions *)v29;

    v22->mLock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)sendMessages
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CATIDSMessagePayload *v8;
  CATIDSPrimitives *mPrimitives;
  void *v10;
  NSString *mDestinationAddress;
  NSString *mSourceAppleID;
  CATIDSMessageOptions *mOptions;
  NSArray *obj;
  _QWORD v15[7];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[3];
  NSUInteger v21;
  _QWORD v22[5];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__0;
  v22[4] = __Block_byref_object_dispose__0;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v21 = -[NSArray count](self->mMessages, "count");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->mMessages;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x20BD108A4]();
        v8 = -[CATIDSMessagePayload initWithMessage:]([CATIDSMessagePayload alloc], "initWithMessage:", v6);
        mPrimitives = self->mPrimitives;
        -[CATIDSMessagePayload dictionaryValue](v8, "dictionaryValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        mDestinationAddress = self->mDestinationAddress;
        mSourceAppleID = self->mSourceAppleID;
        mOptions = self->mOptions;
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __49__CATSendSerialIDSMessagesOperation_sendMessages__block_invoke;
        v15[3] = &unk_24C1C5EE8;
        v15[4] = self;
        v15[5] = v20;
        v15[6] = v22;
        -[CATIDSPrimitives sendMessage:toAddress:fromID:options:completion:](mPrimitives, "sendMessage:toAddress:fromID:options:completion:", v10, mDestinationAddress, mSourceAppleID, mOptions, v15);

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v3);
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

void __49__CATSendSerialIDSMessagesOperation_sendMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 424));
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "didSendMessagesWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 424));

}

- (void)didSendMessagesWithError:(id)a3
{
  if (a3)
    -[CATOperation endOperationWithError:](self, "endOperationWithError:");
  else
    -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOptions, 0);
  objc_storeStrong((id *)&self->mSourceAppleID, 0);
  objc_storeStrong((id *)&self->mDestinationAddress, 0);
  objc_storeStrong((id *)&self->mMessages, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mPrimitives, 0);
}

@end

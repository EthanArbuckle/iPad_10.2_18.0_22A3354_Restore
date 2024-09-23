@implementation HAPFragmentationStream

- (HAPFragmentationStream)init
{
  HAPFragmentationStream *v2;
  HAPFragmentationStream *v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *pendingPackets;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HAPFragmentationStream;
  v2 = -[HAPFragmentationStream init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HAPDispatchQueueName(v2, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    pendingPackets = v3->_pendingPackets;
    v3->_pendingPackets = v8;

  }
  return v3;
}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPFragmentationStream clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HAPFragmentationStream_close__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)receivedFragmentedPacket:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPFragmentationStream clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HAPFragmentationStream_receivedFragmentedPacket___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)__transactionDataWithTransactionIdentifier:(unsigned __int16)a3
{
  int v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  _BYTE v37[14];
  _BYTE v38[128];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  -[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "offset", (_QWORD)v30);
          if (objc_msgSend(v7, "length") != v14)
          {
            v17 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v13, "offset");
              v21 = objc_msgSend(v7, "length");
              *(_DWORD *)buf = 138543874;
              v35 = v19;
              v36 = 1024;
              *(_DWORD *)v37 = v20;
              *(_WORD *)&v37[4] = 2048;
              *(_QWORD *)&v37[6] = v21;
              _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Packet with offset %u does not match current offset %tu", buf, 0x1Cu);

            }
            objc_autoreleasePoolPop(v17);

            goto LABEL_21;
          }
          objc_msgSend(v13, "data");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendData:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v10)
          continue;
        break;
      }
    }

    if (objc_msgSend(v7, "length") == v6)
    {
      v16 = v7;
    }
    else
    {
      v25 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v7, "length");
        *(_DWORD *)buf = 138543874;
        v35 = v27;
        v36 = 2048;
        *(_QWORD *)v37 = v28;
        *(_WORD *)&v37[8] = 1024;
        *(_DWORD *)&v37[10] = v6;
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Final payload length, %tu, doesn't match expected payload length, %u", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v25);
LABEL_21:
      v16 = 0;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      v36 = 1024;
      *(_DWORD *)v37 = v3;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] No packets matching transaction %u", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v22);
    v16 = 0;
  }

  return v16;
}

- (BOOL)__isTransactionCompleteWithTransactionIdentifier:(unsigned __int16)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "offset", (_QWORD)v16) != v7)
          {

            goto LABEL_12;
          }
          objc_msgSend(v10, "data");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v7 += objc_msgSend(v11, "length");

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v4, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    v12 = v7 == v14;
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

- (id)__filteredPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  -[HAPFragmentationStream pendingPackets](self, "pendingPackets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("transactionIdentifier == %u"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredOrderedSetUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)__addFragmentationPacket:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[HAPFragmentationStream pendingPackets](self, "pendingPackets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __51__HAPFragmentationStream___addFragmentationPacket___block_invoke;
  v11 = &unk_1E894B968;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);

  -[HAPFragmentationStream pendingPackets](self, "pendingPackets", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, v15[3]);

  _Block_object_dispose(&v14, 8);
}

- (void)__removeAllPendingPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[HAPFragmentationStream pendingPackets](self, "pendingPackets");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInArray:", v6);

}

- (HAPFragmentationStreamDelegate)delegate
{
  return (HAPFragmentationStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableOrderedSet)pendingPackets
{
  return self->_pendingPackets;
}

- (NSNumber)currentPacketTransactionIdentifier
{
  return self->_currentPacketTransactionIdentifier;
}

- (void)setCurrentPacketTransactionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentPacketTransactionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPacketTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingPackets, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__HAPFragmentationStream___addFragmentationPacket___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "transactionIdentifier");
  if (v7 == objc_msgSend(v9, "transactionIdentifier")
    && (v8 = objc_msgSend(*(id *)(a1 + 32), "offset"), v8 < objc_msgSend(v9, "offset")))
  {
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 + 1;
  }

}

void __51__HAPFragmentationStream_receivedFragmentedPacket___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "currentPacketTransactionIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "currentPacketTransactionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedCharValue");
    v6 = objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier");

    if (v6 != v5)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "currentPacketTransactionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "__removeAllPendingPacketsWithTransactionIdentifier:", objc_msgSend(v8, "unsignedCharValue"));

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6723, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v11, "currentPacketTransactionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fragmentationStream:didReceiveData:transactionIdentifier:error:", v11, 0, objc_msgSend(v12, "unsignedCharValue"), v9);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "__addFragmentationPacket:", *(_QWORD *)(a1 + 40));
  v13 = objc_msgSend(*(id *)(a1 + 32), "__isTransactionCompleteWithTransactionIdentifier:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));
  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    objc_msgSend(v14, "__transactionDataWithTransactionIdentifier:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6732, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fragmentationStream:didReceiveData:transactionIdentifier:error:", *(_QWORD *)(a1 + 32), v15, objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"), v17);

    objc_msgSend(*(id *)(a1 + 32), "setCurrentPacketTransactionIdentifier:", 0);
    objc_msgSend(*(id *)(a1 + 32), "__removeAllPendingPacketsWithTransactionIdentifier:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentPacketTransactionIdentifier:");
  }

}

void __31__HAPFragmentationStream_close__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6752, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fragmentationStream:didCloseWithError:", *(_QWORD *)(a1 + 32), v3);

}

+ (id)fragmentationPacketsForData:(id)a3 maxLength:(unint64_t)a4 transactionIdentifier:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  HAPFragmentationPacket *v23;
  void *v24;
  HAPFragmentationPacket *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  _BYTE v33[18];
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  if (!a4 || (v9 = v8) == 0)
  {
    v14 = MEMORY[0x1D17B7244](v8);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543874;
      v31 = v16;
      v32 = 2048;
      *(_QWORD *)v33 = objc_msgSend(v7, "length");
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = a4;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Cannot create fragmented packet with length '%tu', max length '%tu'", (uint8_t *)&v30, 0x20u);

    }
    v13 = (void *)v14;
    goto LABEL_10;
  }
  if (HIDWORD(v8))
  {
    v10 = MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543874;
      v31 = v12;
      v32 = 1024;
      *(_DWORD *)v33 = -1;
      *(_WORD *)&v33[4] = 2048;
      *(_QWORD *)&v33[6] = v9;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Data cannot be larger than %u, is %tu", (uint8_t *)&v30, 0x1Cu);

    }
    v13 = (void *)v10;
LABEL_10:
    objc_autoreleasePoolPop(v13);
    v17 = 0;
    goto LABEL_22;
  }
  v18 = a4 - 12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (a4 + v8 - 13) / (a4 - 12));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = 0;
  while (1)
  {
    v22 = v9 - v20 >= v18 ? v18 : v9 - v20;
    v23 = [HAPFragmentationPacket alloc];
    objc_msgSend(v7, "subdataWithRange:", v20, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HAPFragmentationPacket initWithData:transactionIdentifier:length:offset:](v23, "initWithData:transactionIdentifier:length:offset:", v24, v5, v9, v21);

    if (!v25)
      break;
    objc_msgSend(v19, "addObject:", v25);

    v20 = (v21 + v18);
    v21 = v20;
    if (v20 >= v9)
    {
      v17 = v19;
      goto LABEL_21;
    }
  }
  v26 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v28;
    v32 = 1024;
    *(_DWORD *)v33 = v21;
    _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Failed to create packet for remaining data at offset %u", (uint8_t *)&v30, 0x12u);

  }
  objc_autoreleasePoolPop(v26);
  v17 = 0;
LABEL_21:

LABEL_22:
  return v17;
}

@end

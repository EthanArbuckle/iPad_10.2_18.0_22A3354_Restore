@implementation CNPropertyIDSRequest

- (CNPropertyIDSRequest)initWithPropertyItems:(id)a3 service:(id)a4 postToMainQueue:(BOOL)a5 resultBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  CNPropertyIDSRequest *v13;
  CNPropertyIDSRequest *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[4];
  CNPropertyIDSRequest *v19;
  BOOL v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNPropertyIDSRequest;
  v13 = -[CNPropertyIDSRequest init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CNPropertyIDSRequest setPropertyItems:](v13, "setPropertyItems:", v10);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CNPropertyIDSRequestListenerID_%lx"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyIDSRequest setListenerID:](v14, "setListenerID:", v15);

    -[CNPropertyIDSRequest setService:](v14, "setService:", v11);
    -[CNPropertyIDSRequest setRequestResultBlock:](v14, "setRequestResultBlock:", v12);
    objc_msgSend((id)objc_opt_class(), "sharedWorkQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__CNPropertyIDSRequest_initWithPropertyItems_service_postToMainQueue_resultBlock___block_invoke;
    block[3] = &unk_1E204C4D0;
    v19 = v14;
    v20 = a5;
    dispatch_async(v16, block);

  }
  return v14;
}

- (void)cleanupDelegate
{
  void *v3;
  void *v4;
  id v5;

  -[objc_class sharedInstance](getIDSIDQueryControllerClass_21959(), "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyIDSRequest service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyIDSRequest listenerID](self, "listenerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:forService:listenerID:", self, v3, v4);

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "sharedWorkQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CNPropertyIDSRequest_cancel__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(v3, block);

  -[CNPropertyIDSRequest setRequestResultBlock:](self, "setRequestResultBlock:", 0);
  -[CNPropertyIDSRequest setIdQueryResultHandler:](self, "setIdQueryResultHandler:", 0);
}

- (BOOL)cancelled
{
  void *v2;
  BOOL v3;

  -[CNPropertyIDSRequest requestResultBlock](self, "requestResultBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[CNPropertyIDSRequest service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  v9 = v12;
  if (v8)
  {
    -[CNPropertyIDSRequest idQueryResultHandler](self, "idQueryResultHandler");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v12);

    v9 = v12;
  }

}

- (void)_requestStatusOnMainQueue:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, void *, uint64_t);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v41;
  id obj;
  _QWORD v43[4];
  id v44;
  id v45;
  BOOL v46;
  id location;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[CNPropertyIDSRequest propertyItems](self, "propertyItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v49 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v6, "labeledValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (uint64_t (*)(void *, void *, uint64_t))softLinkIDSCopyIDForPhoneNumberWithOptions[0];
          v10 = v8;
          objc_msgSend(v10, "digits");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "countryCode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)v9(v11, v12, 1);
          if (!v13)
            goto LABEL_12;
LABEL_8:
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v6, v13);

          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v8, "_appearsToBeEmail"))
          {
            v13 = (void *)((uint64_t (*)(void *))softLinkIDSCopyIDForEmailAddress[0])(v8);
            if (v13)
              goto LABEL_8;
          }
        }
LABEL_12:

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v3);
  }

  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v41, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 126, 6, CFSTR("Querying IDS for handles: [%@]"), v16, v17, v18, v19, (uint64_t)v15);

    objc_initWeak(&location, self);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke;
    v43[3] = &unk_1E204A458;
    objc_copyWeak(&v45, &location);
    v20 = v41;
    v44 = v20;
    v46 = a3;
    -[CNPropertyIDSRequest setIdQueryResultHandler:](self, "setIdQueryResultHandler:", v43);
    objc_msgSend(v20, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 193, 6, CFSTR("Querying IDS for handles: [%@]"), v23, v24, v25, v26, (uint64_t)v22);

    -[objc_class sharedInstance](getIDSIDQueryControllerClass_21959(), "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyIDSRequest service](self, "service");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyIDSRequest listenerID](self, "listenerID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "sharedWorkQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyIDSRequest idQueryResultHandler](self, "idQueryResultHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v27, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v28, v29, v30, v31, v32);

    if ((v33 & 1) == 0)
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 202, 6, CFSTR("Failed to query IDS for handles"), v34, v35, v36, v37, v38);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }

}

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (void)setPropertyItems:(id)a3
{
  objc_storeStrong((id *)&self->_propertyItems, a3);
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- (void)setListenerID:(id)a3
{
  objc_storeStrong((id *)&self->_listenerID, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (id)requestResultBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRequestResultBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)idQueryResultHandler
{
  return self->_idQueryResultHandler;
}

- (void)setIdQueryResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idQueryResultHandler, 0);
  objc_storeStrong(&self->_requestResultBlock, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_propertyItems, 0);
}

void __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void (**v37)(_QWORD);
  void *v38;
  void *v39;
  void *v40;
  id obj;
  _QWORD aBlock[5];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "cancelled") & 1) == 0)
  {
    v5 = objc_msgSend(v3, "count");
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 132, 6, CFSTR("Received %u IDS responses"), v6, v7, v8, v9, v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v3, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "propertyItems");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v15);

          if (v17)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "integerValue");

            if (v19 == 1)
            {
              objc_msgSend(WeakRetained, "service");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 142, 6, CFSTR("%@: IDS %@ valid"), v21, v22, v23, v24, (uint64_t)v20);

              objc_msgSend(v40, "addObject:", v15);
            }
            else
            {
              v25 = WeakRetained;
              v26 = a1;
              v27 = v3;
              objc_msgSend(v3, "objectForKeyedSubscript:", v14);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "integerValue");

              v30 = v25;
              objc_msgSend(v25, "service");
              v31 = objc_claimAutoreleasedReturnValue();
              v36 = (void *)v31;
              if (v29 == 2)
              {
                _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 145, 6, CFSTR("%@: IDS %@ invalid"), v32, v33, v34, v35, v31);

                objc_msgSend(v39, "addObject:", v15);
              }
              else
              {
                _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 148, 6, CFSTR("%@: IDS %@ unknown"), v32, v33, v34, v35, v31);

              }
              v3 = v27;
              a1 = v26;
              WeakRetained = v30;
            }
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v40, "count") || objc_msgSend(v39, "count"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke_2;
      aBlock[3] = &unk_1E204FAA0;
      aBlock[4] = WeakRetained;
      v43 = v40;
      v44 = v39;
      v37 = (void (**)(_QWORD))_Block_copy(aBlock);
      v38 = v37;
      if (*(_BYTE *)(a1 + 48))
        dispatch_async(MEMORY[0x1E0C80D38], v37);
      else
        v37[2](v37);

    }
  }
  objc_msgSend(WeakRetained, "cleanupDelegate");

}

void __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke_2(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "requestResultBlock");
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "cancelled");
  v3 = (void *)v4;
  if ((v2 & 1) == 0 && v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = (void *)v4;
  }

}

uint64_t __30__CNPropertyIDSRequest_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupDelegate");
}

void __82__CNPropertyIDSRequest_initWithPropertyItems_service_postToMainQueue_resultBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend((id)getIDSIDQueryControllerClass_21959(), "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "listenerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedWorkQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDelegate:forService:listenerID:queue:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_requestStatusOnMainQueue:", *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken != -1)
    dispatch_once(&sharedWorkQueue_onceToken, &__block_literal_global_21991);
  return (id)sharedWorkQueue_sharedQueue;
}

void __39__CNPropertyIDSRequest_sharedWorkQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.contacts.ContactsUI.CNPropertyIDSRequest.workQueue", v2);
  v1 = (void *)sharedWorkQueue_sharedQueue;
  sharedWorkQueue_sharedQueue = (uint64_t)v0;

}

@end

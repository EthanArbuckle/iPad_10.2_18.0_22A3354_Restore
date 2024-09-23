@implementation NTKArgonPushHandler

- (NTKArgonPushHandler)initWithCloudKitDatabase:(id)a3
{
  id v5;
  NTKArgonPushHandler *v6;
  NTKArgonPushHandler *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKArgonPushHandler;
  v6 = -[NTKArgonPushHandler init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.nanotimekit.facesupport.push", v8);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)registerToken:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  if (v6)
  {
    -[NTKArgonPushHandler callbackQueue](self, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NTKArgonPushHandler database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v7)
      {
        v10 = objc_alloc(MEMORY[0x1E0C95010]);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("token"), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithRecordType:predicate:", CFSTR("Tokens"), v11);

        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_3;
        v13[3] = &unk_1E6BD3AD0;
        v13[4] = self;
        v16 = v6;
        v14 = v7;
        v15 = v9;
        objc_msgSend(v15, "performQuery:inZoneWithID:completionHandler:", v12, 0, v13);

      }
      else
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_2;
        v17[3] = &unk_1E6BCDF60;
        v18 = v6;
        dispatch_async(v8, v17);
        v12 = v18;
      }
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke;
      block[3] = &unk_1E6BCDF60;
      v20 = v6;
      dispatch_async(v8, block);
      v12 = v20;
    }

  }
}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKArgonPushHandlerErrorDomain"), 300, &unk_1E6CA8848);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKArgonPushHandlerErrorDomain"), 301, &unk_1E6CA8870);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_4;
  v12[3] = &unk_1E6BD3AA8;
  v13 = v6;
  v18 = a1[7];
  v14 = v5;
  v15 = a1[5];
  v8 = a1[6];
  v9 = a1[4];
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_4(uint64_t a1)
{
  void (*v2)(void);
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_5:
    v2();
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_5;
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("Tokens"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("token"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("TODO"), CFSTR("build"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_5;
  v5[3] = &unk_1E6BD3A80;
  v4 = *(void **)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 72);
  objc_msgSend(v4, "saveRecord:completionHandler:", v3, v5);

}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_6;
  v7[3] = &unk_1E6BD00B0;
  v8 = v4;
  v9 = *(id *)(a1 + 40);
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__NTKArgonPushHandler_registerToken_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)handleNotificationUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NTKArgonKeyDescriptor *v16;
  _QWORD block[4];
  NTKArgonKeyDescriptor *v18;
  id v19;
  _QWORD aBlock[4];
  id v21;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  -[NTKArgonPushHandler callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke;
  aBlock[3] = &unk_1E6BCDF60;
  v10 = v6;
  v21 = v10;
  v11 = _Block_copy(aBlock);
  objc_msgSend(v7, "objectForKey:", CFSTR("kd"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(v13, "objectForKey:", CFSTR("k"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("i"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke_2;
      block[3] = &unk_1E6BCE3C8;
      v18 = -[NTKArgonKeyDescriptor initWithKey:fileName:]([NTKArgonKeyDescriptor alloc], "initWithKey:fileName:", v14, v15);
      v19 = v10;
      v16 = v18;
      dispatch_async(v8, block);

    }
    else
    {
      dispatch_async(v8, v11);
    }

    v12 = v13;
  }
  else
  {
    dispatch_async(v8, v11);
  }

}

void __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKArgonPushHandlerErrorDomain"), 302, &unk_1E6CA8898);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (CKDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end

@implementation CNUIFMLFacade

- (CNUIFMLFacade)init
{
  return -[CNUIFMLFacade initWithFMLSession:](self, "initWithFMLSession:", 0);
}

- (CNUIFMLFacade)initWithFMLSession:(id)a3
{
  id v4;
  CNUIFMLFacade *v5;
  _TtC10ContactsUI19FindMyLocateSession *v6;
  _TtC10ContactsUI19FindMyLocateSession *findMyLocateSession;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUIFMLFacade;
  v5 = -[CNUIFMLFacade init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (_TtC10ContactsUI19FindMyLocateSession *)v4;
    else
      v6 = objc_alloc_init(_TtC10ContactsUI19FindMyLocateSession);
    findMyLocateSession = v5->_findMyLocateSession;
    v5->_findMyLocateSession = v6;

  }
  return v5;
}

- (void)fetchFriendHandlesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[CNUIFMLFacade findMyLocateSession](self, "findMyLocateSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E204F9B0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

- (_TtC10ContactsUI19FindMyLocateSession)findMyLocateSession
{
  return self->_findMyLocateSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyLocateSession, 0);
}

void __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E2048D50;
  v6 = v2;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = v2;
  objc_msgSend(v3, "getAllFriendIdsWithCompletion:", v5);

}

void __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E2048D28;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E204F9B0;
  v6 = *(id *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

@end

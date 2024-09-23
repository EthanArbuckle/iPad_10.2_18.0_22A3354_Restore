@implementation FALocationSharingHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:locationSharing"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:locationSharing"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[FALocationSharingHook _invokeLocationServicesWithServerAttributes:completion:](self, "_invokeLocationServicesWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FALocationSharingHook _invokeLocationServicesWithServerAttributes:completion:](self, "_invokeLocationServicesWithServerAttributes:completion:", v7, v6);

}

- (void)_invokeLocationServicesWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__1;
  v13[4] = __Block_byref_object_dispose__1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[FALocationSharingHook getFamilyCircle](self, "getFamilyCircle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__FALocationSharingHook__invokeLocationServicesWithServerAttributes_completion___block_invoke;
  v12[3] = &unk_24C88C7C8;
  v12[4] = v13;
  v10 = MEMORY[0x24BDAC9B8];
  v11 = MEMORY[0x24BDAC9B8];
  objc_msgSend(v9, "onComplete:onQueue:", v12, v10);

  _Block_object_dispose(v13, 8);
}

void __80__FALocationSharingHook__invokeLocationServicesWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FAProfilePictureStore *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  +[LocationViewModel createModel](_TtC14FamilyCircleUI17LocationViewModel, "createModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[FAProfilePictureStore initWithFamilyCircle:]([FAProfilePictureStore alloc], "initWithFamilyCircle:", v3);

  +[FASwiftUIHostingControllerProvider getLocationViewControllerWithViewModel:pictureStore:hackfromObjC:](_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider, "getLocationViewControllerWithViewModel:pictureStore:hackfromObjC:", v9, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isDismissing"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "hostViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "showViewController:sender:", v5, 0);

}

- (id)getFamilyCircle
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFC2F8]), "initWithBlock:", &__block_literal_global_10);
}

void __40__FALocationSharingHook_getFamilyCircle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setCachePolicy:", 1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__FALocationSharingHook_getFamilyCircle__block_invoke_2;
  v5[3] = &unk_24C88C810;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "startRequestWithCompletionHandler:", v5);

}

uint64_t __40__FALocationSharingHook_getFamilyCircle__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locationSharingController, 0);
}

@end

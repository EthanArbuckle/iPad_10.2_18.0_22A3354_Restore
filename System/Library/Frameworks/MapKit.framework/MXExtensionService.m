@implementation MXExtensionService

void __47___MXExtensionService_extensionCompletionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MapKit._MXExtensionService.completion", v2);
  v1 = (void *)qword_1ECE2D960;
  qword_1ECE2D960 = (uint64_t)v0;

}

void __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  void (**v9)(_QWORD);
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2;
    v8[3] = &unk_1E20D99E0;
    v8[4] = WeakRetained;
    v9 = v3;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_connectExtensionWithRemoteViewControllerNeeded:Handler:", v5, v8);

  }
  else
  {
    v3[2](v3);
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v12, "URLHandlingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "realExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "connectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_extensionContextForUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDFEE4B0))
    {
      objc_msgSend(v12, "URLHandlingDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setURLHandlingDelegate:", v10);

    }
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v12, v5);

}

void __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setConnectionIdentifier:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  if (v9 && v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setConnectionIdentifier:", v9);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  }
  objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __42___MXExtensionService_disconnectExtension__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void (**v4)(void);

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "state") == 2)
    objc_msgSend(WeakRetained, "setState:", 3);
  v4[2]();

}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a2;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_2;
  v9[3] = &unk_1E20D9AA8;
  v7 = *(NSObject **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v9[5] = &v10;
  dispatch_sync(v7, v9);
  v8 = v11[5];
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  _Block_object_dispose(&v10, 8);

}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = MEMORY[0x18D778DB8]();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_4;
    v8[3] = &unk_1E20D9AF8;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(a2, "vendorContextWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EDFFB5C8) & 1) != 0)
      {
        objc_msgSend(v6, "handleRequest:requestDispatcher:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      }
    }

  }
}

uint64_t __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "receiveUpdatedResponse:error:", 0, a3);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_2;
    v8[3] = &unk_1E20D9B48;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "vendorContextWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EDFFB628) & 1) != 0)
      {
        objc_msgSend(v6, "startSendingUpdatesForRequest:requestDispatcher:toObserver:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "receiveUpdatedResponse:error:", 0, v7);

      }
    }

  }
}

uint64_t __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveUpdatedResponse:error:", 0, a2);
}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "receiveUpdatedResponse:error:", 0, v2);
  objc_msgSend(*(id *)(a1 + 40), "stopSendingUpdatesForRequest:requestDispatcher:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_4(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__9;
  v8 = __Block_byref_object_dispose__9;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_5;
  v3[3] = &unk_1E20D9AA8;
  v1 = *(NSObject **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v3[5] = &v4;
  dispatch_sync(v1, v3);
  v2 = v5[5];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  _Block_object_dispose(&v4, 8);

}

void __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = MEMORY[0x18D778DB8]();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

uint64_t __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70___MXExtensionService_stopSendingUpdatesForRequest_requestDispatcher___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  if (a2)
  {
    objc_msgSend(a2, "vendorContextWithErrorHandler:", &__block_literal_global_101);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v6 = v3;
      v5 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFFB628);
      v4 = v6;
      if (v5)
      {
        objc_msgSend(v6, "stopSendingUpdatesForRequest:requestDispatcher:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        v4 = v6;
      }
    }

  }
}

uint64_t __53___MXExtensionService_vendorContextWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "disconnectExtension");
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a2;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__17;
  v14 = __Block_byref_object_dispose__17;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_2;
  v9[3] = &unk_1E20D9AA8;
  v7 = *(NSObject **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v9[5] = &v10;
  dispatch_sync(v7, v9);
  v8 = v11[5];
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  _Block_object_dispose(&v10, 8);

}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = MEMORY[0x18D778DB8]();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_4;
    v15[3] = &unk_1E20D9AF8;
    v16 = a1[6];
    objc_msgSend(v5, "vendorContextWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_errorForIntentVendorContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      objc_msgSend(a1[4], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_5;
      v10[3] = &unk_1E20DBCD8;
      v11 = v7;
      v12 = a1[5];
      v13 = a1[4];
      v14 = a1[6];
      objc_msgSend(v11, "beginTransactionWithIntentIdentifier:completion:", v9, v10);

    }
  }

}

uint64_t __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_6;
  v4[3] = &unk_1E20DBCB0;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "resolveIntentSlot:forIntent:completionBlock:", v2, v3, v4);

}

uint64_t __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__17;
  v20 = __Block_byref_object_dispose__17;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_2;
  v15[3] = &unk_1E20D9AA8;
  v13 = *(NSObject **)(a1 + 32);
  v15[4] = *(_QWORD *)(a1 + 40);
  v15[5] = &v16;
  dispatch_sync(v13, v15);
  v14 = v17[5];
  if (v14)
    (*(void (**)(uint64_t, id, id, id, id))(v14 + 16))(v14, v9, v10, v11, v12);
  _Block_object_dispose(&v16, 8);

}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = MEMORY[0x18D778DB8]();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_4;
    v22[3] = &unk_1E20D9AF8;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v5, "vendorContextWithErrorHandler:", v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_errorForIntentVendorContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_5;
      v19[3] = &unk_1E20DBD28;
      v20 = v5;
      v13 = *(_OWORD *)(a1 + 40);
      v9 = (id)v13;
      v21 = v13;
      v10 = (void *)MEMORY[0x18D778DB8](v19);
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_6;
      v14[3] = &unk_1E20DBD50;
      v18 = *(_BYTE *)(a1 + 56);
      v15 = v7;
      v16 = *(id *)(a1 + 32);
      v17 = v10;
      v12 = v10;
      objc_msgSend(v15, "beginTransactionWithIntentIdentifier:completion:", v11, v14);

    }
  }

}

uint64_t __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v17 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "_errorForIntentResponse:withExpectResponseClass:", v17, *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = v12;
  }
  else
  {
    v13 = v17;
    v14 = v9;
    v15 = v10;
    v16 = v11;
  }
  (*(void (**)(_QWORD, id, id, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v13, v14, v15, v16);

}

uint64_t __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_6(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v2)
    return objc_msgSend(v3, "handleIntent:withCompletion:", v4, v5);
  else
    return objc_msgSend(v3, "confirmIntent:withCompletion:", v4, v5);
}

void __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __84___MXExtensionService_INIntent__completeTransactionWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __94___MXExtensionService_INIntent__cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94___MXExtensionService_INIntent___completeOrCancelTransaction_withIntentIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (!a3)
  {
    v4 = a2;
    objc_msgSend(v4, "vendorContextWithErrorHandler:", &__block_literal_global_66);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_errorForIntentVendorContext:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(a1 + 48))
        objc_msgSend(v8, "completeTransactionWithIntentIdentifier:completion:", v6, v7);
      else
        objc_msgSend(v8, "cancelTransactionDueToTimeoutWithIntentIdentifier:completion:", v6, v7);
    }

  }
}

void __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "didReceiveError:", a3);
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_2;
    v11 = &unk_1E20DBDC8;
    v12 = *(id *)(a1 + 32);
    v13 = 0;
    objc_msgSend(v5, "vendorContextWithErrorHandler:", &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_errorForIntentVendorContext:", v6, v8, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "didReceiveError:", v7);
    else
      objc_msgSend(v6, "startSendingUpdatesForIntent:toObserver:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveError:", *(_QWORD *)(a1 + 40));
}

void __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "didReceiveError:", v2);
  objc_msgSend(*(id *)(a1 + 40), "stopSendingUpdatesForIntent:", *(_QWORD *)(a1 + 48));

}

void __61___MXExtensionService_INIntent__stopSendingUpdatesForIntent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  if (!a3)
  {
    v4 = a2;
    objc_msgSend(v4, "vendorContextWithErrorHandler:", &__block_literal_global_71_0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_errorForIntentVendorContext:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(v6, "stopSendingUpdatesForIntent:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __99___MXExtensionService_INIntent_willBeDepreicatedSoon__handleIntent_expectResponseClass_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  return result;
}

@end

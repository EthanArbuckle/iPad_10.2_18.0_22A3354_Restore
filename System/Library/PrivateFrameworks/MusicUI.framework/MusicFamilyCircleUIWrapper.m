@implementation MusicFamilyCircleUIWrapper

+ (void)presentFamilyCircleSheet:(id)a3 withParameters:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  id v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v10 = (void *)getFACircleStateControllerClass_softClass;
  v41 = getFACircleStateControllerClass_softClass;
  v11 = MEMORY[0x24BDAC760];
  if (!getFACircleStateControllerClass_softClass)
  {
    v33 = MEMORY[0x24BDAC760];
    v34 = 3221225472;
    v35 = (uint64_t)__getFACircleStateControllerClass_block_invoke;
    v36 = &unk_24E0E74B8;
    v37 = &v38;
    __getFACircleStateControllerClass_block_invoke((uint64_t)&v33);
    v10 = (void *)v39[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v38, 8);
  v32 = (id)objc_msgSend([v12 alloc], "initWithPresenter:", v7);
  objc_msgSend((id)v28[5], "setPresentationType:", 2);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v13 = (void *)getFACircleContextClass_softClass;
  v41 = getFACircleContextClass_softClass;
  if (!getFACircleContextClass_softClass)
  {
    v33 = v11;
    v34 = 3221225472;
    v35 = (uint64_t)__getFACircleContextClass_block_invoke;
    v36 = &unk_24E0E74B8;
    v37 = &v38;
    __getFACircleContextClass_block_invoke((uint64_t)&v33);
    v13 = (void *)v39[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v38, 8);
  v15 = [v14 alloc];
  v33 = 0;
  v34 = (uint64_t)&v33;
  v35 = 0x2020000000;
  v16 = (id *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  v36 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
  {
    v17 = (void *)FamilyCircleUILibrary();
    v16 = (id *)dlsym(v17, "FACircleEventTypeInitiate");
    *(_QWORD *)(v34 + 24) = v16;
    getFACircleEventTypeInitiateSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v33, 8);
  if (v16)
  {
    v18 = *v16;
    v19 = (void *)objc_msgSend(v15, "initWithEventType:", v18);

    objc_msgSend(v19, "setClientName:", CFSTR("AppleMusic"));
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClientBundleID:", v21);

    objc_msgSend(v19, "setAdditionalParameters:", v8);
    objc_msgSend(v19, "setActivityIndicatorStyle:", 0);
    v22 = (void *)v28[5];
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke;
    v24[3] = &unk_24E0E7490;
    v23 = v9;
    v25 = v23;
    v26 = &v27;
    objc_msgSend(v22, "performWithContext:completion:", v19, v24);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

void __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke_2;
  v4[3] = &unk_24E0E7468;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

@end

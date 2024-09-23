@implementation ILClassificationController

+ (ILClassificationController)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ILClassificationController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (ILClassificationController *)(id)sharedInstance_sharedInstance_0;
}

void __44__ILClassificationController_shouldActivate__block_invoke()
{
  const void *v0;
  CFTypeRef v1;
  NSObject *v2;
  int v3;
  CFTypeRef v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (const void *)MGCopyAnswer();
  v1 = CFAutorelease(v0);
  shouldActivate_shouldActivate = CFEqual(v1, CFSTR("iPhone")) != 0;
  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412802;
    v4 = v1;
    v5 = 2112;
    v6 = CFSTR("iPhone");
    v7 = 1024;
    v8 = shouldActivate_shouldActivate;
    _os_log_impl(&dword_2126D5000, v2, OS_LOG_TYPE_DEFAULT, "determined device class to be %@ (requires %@), should activate: %d", (uint8_t *)&v3, 0x1Cu);
  }

}

void __44__ILClassificationController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

void __53__ILClassificationController_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[5];
  id v15;
  uint8_t buf[16];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend((id)objc_opt_class(), "shouldActivate");
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126D5000, v4, OS_LOG_TYPE_DEFAULT, "classification controller already activated", buf, 2u);
    }

    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      dispatch_get_global_queue(21, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__ILClassificationController_activateWithCompletion___block_invoke_6;
      block[3] = &unk_24CE06E68;
      v8 = v6;
      block[4] = *(_QWORD *)(a1 + 32);
      v15 = v8;
      dispatch_async(v7, block);

      v9 = v15;
LABEL_14:

    }
  }
  else if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126D5000, v4, OS_LOG_TYPE_DEFAULT, "activating classification controller", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "beginMatchingExtensionsWithFirstCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126D5000, v4, OS_LOG_TYPE_DEFAULT, "shouldn't activate classification controller", buf, 2u);
    }

    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      dispatch_get_global_queue(21, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __53__ILClassificationController_activateWithCompletion___block_invoke_7;
      v12[3] = &unk_24CE06C80;
      v13 = v10;
      dispatch_async(v11, v12);

      v9 = v13;
      goto LABEL_14;
    }
  }
}

- (void)beginMatchingExtensionsWithFirstCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id matchingExtensionToken;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ILDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = _Block_copy(v4);
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_2126D5000, v5, OS_LOG_TYPE_DEFAULT, "begin matching extensions with first match completion: %@", buf, 0xCu);

  }
  -[ILClassificationController setFirstMatchCompletionBlock:](self, "setFirstMatchCompletionBlock:", v4);
  objc_initWeak((id *)buf, self);
  v13 = *MEMORY[0x24BDD0C48];
  v14 = CFSTR("com.apple.identitylookup.classification-ui");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1550];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke;
  v11[3] = &unk_24CE06EB8;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v8, "beginMatchingExtensionsWithAttributes:completion:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  matchingExtensionToken = self->_matchingExtensionToken;
  self->_matchingExtensionToken = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

- (void)setFirstMatchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

+ (BOOL)shouldActivate
{
  if (shouldActivate_onceToken != -1)
    dispatch_once(&shouldActivate_onceToken, &__block_literal_global_1);
  return shouldActivate_shouldActivate;
}

void __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *WeakRetained;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  uint8_t v16[8];
  _QWORD block[5];
  id v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ILDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_2126D5000, v7, OS_LOG_TYPE_DEFAULT, "update matched extensions: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v6)
  {
    ILDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_cold_1((uint64_t)v6, v8, v9);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy_;
      v23 = __Block_byref_object_dispose_;
      v24 = 0;
      -[NSObject queue](WeakRetained, "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_10;
      block[3] = &unk_24CE06E90;
      p_buf = &buf;
      block[4] = v8;
      v12 = v5;
      v18 = v12;
      dispatch_sync(v11, block);

      -[NSObject firstMatchCompletionBlock](v8, "firstMatchCompletionBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        ILDefaultLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_2126D5000, v14, OS_LOG_TYPE_DEFAULT, "Invoking first matching completion", v16, 2u);
        }

        -[NSObject firstMatchCompletionBlock](v8, "firstMatchCompletionBlock");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, id))v15)[2](v15, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v12);

        -[NSObject setFirstMatchCompletionBlock:](v8, "setFirstMatchCompletionBlock:", 0);
      }

      _Block_object_dispose(&buf, 8);
    }
  }

}

- (id)firstMatchCompletionBlock
{
  return self->_firstMatchCompletionBlock;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  ILDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2126D5000, v5, OS_LOG_TYPE_DEFAULT, "requested activate classification controller...", buf, 2u);
  }

  -[ILClassificationController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ILClassificationController_activateWithCompletion___block_invoke;
  v8[3] = &unk_24CE06DD8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ILClassificationController)init
{
  ILClassificationController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSHashTable *delegates;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ILClassificationController;
  v2 = -[ILClassificationController init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("ILClassificationControllerServiceName"), "UTF8String"), v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v6;

  }
  return v2;
}

- (void)updateExtensions:(id)a3 electedExtensions:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD block[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[ILClassificationController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  ILDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v7;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = CFSTR("com.apple.identitylookup.classification-ui");
    _os_log_impl(&dword_2126D5000, v10, OS_LOG_TYPE_DEFAULT, "updating extensions: %@ elected extension: %@ for point name: %@", buf, 0x20u);
  }
  v20 = v8;
  v21 = v7;

  objc_storeStrong((id *)&self->_electedExtension, a4);
  objc_storeStrong((id *)&self->_extensions, a3);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ILClassificationController delegates](self, "delegates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    v16 = MEMORY[0x24BDAC760];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        dispatch_get_global_queue(17, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __65__ILClassificationController_updateExtensions_electedExtensions___block_invoke;
        block[3] = &unk_24CE06EE0;
        block[4] = v18;
        block[5] = self;
        dispatch_async(v19, block);

        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v20, v21);
    }
    while (v14);
  }

}

- (NSHashTable)delegates
{
  return self->_delegates;
}

+ (id)electedExtensionFromExtensions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "optedIn", (_QWORD)v9))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

uint64_t __53__ILClassificationController_activateWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __53__ILClassificationController_activateWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "electedExtensionFromExtensions:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "updateExtensions:electedExtensions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __65__ILClassificationController_updateExtensions_electedExtensions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v3, "isClassificationAvailable");
  objc_msgSend(*(id *)(a1 + 40), "electedExtension");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "extensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classificationController:didUpdateAvailability:electedExtension:extensions:", v3, v4, v6, v5);

}

- (BOOL)isClassificationAvailable
{
  void *v2;
  BOOL v3;

  -[ILClassificationController electedExtension](self, "electedExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSExtension)electedExtension
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[ILClassificationController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__ILClassificationController_electedExtension__block_invoke;
  v6[3] = &unk_24CE06F08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSExtension *)v4;
}

void __46__ILClassificationController_electedExtension__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSArray)extensions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[ILClassificationController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__ILClassificationController_extensions__block_invoke;
  v6[3] = &unk_24CE06F08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __40__ILClassificationController_extensions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setElectedExtension:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ILClassificationController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__ILClassificationController_setElectedExtension___block_invoke;
  v7[3] = &unk_24CE06EE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__ILClassificationController_setElectedExtension___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (uint64_t *)(a1 + 40);
  if (v2 != *(id *)(a1 + 40))
  {
    ILDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2126D5000, v4, OS_LOG_TYPE_DEFAULT, "set elected: %@ in extensions: %@", buf, 0x16u);
    }

    if (v2)
    {
      v15 = 0;
      v7 = objc_msgSend(v2, "attemptOptOut:", &v15);
      v8 = v15;
      if ((v7 & 1) == 0)
      {
        ILDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __50__ILClassificationController_setElectedExtension___block_invoke_cold_2((uint64_t)v2, (uint64_t)v8, v9);

      }
    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      v14 = v8;
      v11 = objc_msgSend(v10, "attemptOptIn:", &v14);
      v12 = v14;

      if ((v11 & 1) == 0)
      {
        ILDefaultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __50__ILClassificationController_setElectedExtension___block_invoke_cold_1(v3, (uint64_t)v12, v13);

      }
    }
    else
    {
      v12 = v8;
    }

  }
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ILClassificationController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ILClassificationController_addDelegate___block_invoke;
  block[3] = &unk_24CE06EE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __42__ILClassificationController_addDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ILClassificationController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ILClassificationController_removeDelegate___block_invoke;
  block[3] = &unk_24CE06EE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __45__ILClassificationController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)MEMORY[0x24BDD1550];
  -[ILClassificationController matchingExtensionToken](self, "matchingExtensionToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endMatchingExtensions:", v4);

  v5.receiver = self;
  v5.super_class = (Class)ILClassificationController;
  -[ILClassificationController dealloc](&v5, sel_dealloc);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)matchingExtensionToken
{
  return self->_matchingExtensionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstMatchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong(&self->_matchingExtensionToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_electedExtension, 0);
}

void __73__ILClassificationController_beginMatchingExtensionsWithFirstCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = CFSTR("com.apple.identitylookup.classification-ui");
  OUTLINED_FUNCTION_0_1(&dword_2126D5000, a2, a3, "Error (%@) finding extensions for point name: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __50__ILClassificationController_setElectedExtension___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_1(&dword_2126D5000, a3, (uint64_t)a3, "Error opting in extension %@: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __50__ILClassificationController_setElectedExtension___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_1(&dword_2126D5000, a3, (uint64_t)a3, "Error opting out extension %@: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end

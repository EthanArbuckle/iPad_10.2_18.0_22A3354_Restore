@implementation IKJSApplication

- (id)asPrivateIKJSApplication
{
  IKJSApplication *v3;

  if (-[IKJSApplication conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01E2938))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (void)launchAppWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onLaunch"), v6, v8, v9);
  kdebug_trace();
}

- (void)suspendAppWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onSuspend"), v6, v8, v9);
}

- (void)resumeAppWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onResume"), v6, v8, v9);
}

- (void)openURLWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onOpenURL"), v6, v8, v9);
}

- (void)exitAppWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onExit"), v6, v8, v9);
}

- (void)updatedAppWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onUpdate"), v6, v8, v9);
}

- (void)traitCollectionChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onTraitCollectionChange"), v6, v8, v9);
}

- (BOOL)requestDocumentWithContext:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithObject:inContext:", self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "hasProperty:", CFSTR("onDocumentRequest"));
  if (v12)
  {
    v13 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17[0] = v13;
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onDocumentRequest"), v14);

    if (!v6)
  }

  return v12;
}

- (void)dispatchErrorWithMessage:(id)a3 sourceURL:(id)a4 line:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  objc_msgSend(v9, "arrayWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  v12 = objc_msgSend(v15, "length");
  if (v8 && v12)
  {
    objc_msgSend(v11, "addObject:", v15);
    objc_msgSend(v11, "addObject:", v8);
  }
  v13 = (void *)objc_msgSend(v11, "copy");
  v14 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onError"), v13);

}

- (void)reload:(id)a3 :(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("when"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v13, "isEqualToString:", CFSTR("onResume"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("minSuspensionTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 0.0;
  }
  -[IKJSObject appContext](self, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleReloadWithUrgencyType:minInterval:data:", v8, v6, v11);

}

- (void)update
{
  id v2;

  -[IKJSObject appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleCacheUpdate");

}

- (NSDictionary)traitCollection
{
  void *v3;
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
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__IKJSApplication_traitCollection__block_invoke;
  v6[3] = &unk_1E9F4B778;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __34__IKJSApplication_traitCollection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_appTraitCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end

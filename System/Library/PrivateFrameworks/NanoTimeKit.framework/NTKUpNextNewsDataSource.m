@implementation NTKUpNextNewsDataSource

+ (unint64_t)elementContentMode
{
  return 0;
}

+ (Class)nanoNewsDataSourceClass
{
  if (nanoNewsDataSourceClass_onceToken != -1)
    dispatch_once(&nanoNewsDataSourceClass_onceToken, &__block_literal_global_162);
  return 0;
}

- (NTKUpNextNewsDataSource)init
{
  NTKUpNextNewsDataSource *v2;
  objc_class *v3;
  NTKUpNextElementDataSource *v4;
  NTKUpNextElementDataSource *newsDataSourceProxy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextNewsDataSource;
  v2 = -[REElementDataSource init](&v7, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "nanoNewsDataSourceClass");
    if (-[objc_class isSubclassOfClass:](v3, "isSubclassOfClass:", objc_opt_class()))
    {
      v4 = (NTKUpNextElementDataSource *)objc_alloc_init(v3);
      newsDataSourceProxy = v2->_newsDataSourceProxy;
      v2->_newsDataSourceProxy = v4;

    }
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[REElementDataSource delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextNewsDataSource;
  -[REElementDataSource setDelegate:](&v7, sel_setDelegate_, v4);
  if (v5 != v4)
  {
    -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v4);

  }
}

- (void)setRunning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextNewsDataSource;
  -[REElementDataSource setRunning:](&v6, sel_setRunning_);
  -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRunning:", v3);

}

- (void)setState:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextNewsDataSource;
  -[REElementDataSource setState:](&v6, sel_setState_);
  -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", a3);

}

+ (id)bundleIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NTKUpNextNewsDataSource_bundleIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundleIdentifier_onceToken != -1)
    dispatch_once(&bundleIdentifier_onceToken, block);
  return (id)bundleIdentifier_bundleIdentifier;
}

void __43__NTKUpNextNewsDataSource_bundleIdentifier__block_invoke()
{
  void *v0;
  const __CFString *v1;
  void *v2;

  v0 = (void *)objc_msgSend((id)objc_opt_class(), "nanoNewsDataSourceClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v0, "bundleIdentifier");
    v1 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("com.apple.nanonews");
  }
  v2 = (void *)bundleIdentifier_bundleIdentifier;
  bundleIdentifier_bundleIdentifier = (uint64_t)v1;

}

- (id)supportedSections
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[NTKUpNextElementDataSource supportedSections](self->_newsDataSourceProxy, "supportedSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[NTKUpNextElementDataSource supportedSections](self->_newsDataSourceProxy, "supportedSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7[0] = *MEMORY[0x1E0D843D8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NTKUpNextNewsDataSource_getElementsInSection_withHandler___block_invoke;
  aBlock[3] = &unk_1E6BD9F50;
  v8 = v7;
  v13 = v8;
  v9 = _Block_copy(aBlock);
  -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getElementsInSection:withHandler:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60]);
  }

}

void __60__NTKUpNextNewsDataSource_getElementsInSection_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "content");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("REUICircularTemplateKey"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getElementsDuringDateInterval:(id)a3 inSection:(unint64_t)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getElementsDuringDateInterval:inSection:withHandler:", v8, a4, v9);

  }
  else
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[REElementDataSource logHeader](self, "logHeader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "%@ no elements with reason not loaded", (uint8_t *)&v14, 0xCu);

    }
    (*((void (**)(id, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60]);

  }
}

- (void)pause
{
  id v2;

  -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)resume
{
  id v2;

  -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)setAllowsLocationUse:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextNewsDataSource;
  -[REElementDataSource setAllowsLocationUse:](&v6, sel_setAllowsLocationUse_);
  -[NTKUpNextNewsDataSource newsDataSourceProxy](self, "newsDataSourceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsLocationUse:", v3);

}

+ (BOOL)wantsReloadForSignificantTimeChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__NTKUpNextNewsDataSource_wantsReloadForSignificantTimeChange__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (wantsReloadForSignificantTimeChange_onceToken != -1)
    dispatch_once(&wantsReloadForSignificantTimeChange_onceToken, block);
  return wantsReloadForSignificantTimeChange_wantsReloadForSignificantTimeChange;
}

uint64_t __62__NTKUpNextNewsDataSource_wantsReloadForSignificantTimeChange__block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_opt_class(), "nanoNewsDataSourceClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = objc_msgSend(v0, "wantsReloadForSignificantTimeChange");
  else
    result = 0;
  wantsReloadForSignificantTimeChange_wantsReloadForSignificantTimeChange = result;
  return result;
}

- (NTKUpNextElementDataSource)newsDataSourceProxy
{
  return self->_newsDataSourceProxy;
}

- (void)setNewsDataSourceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_newsDataSourceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsDataSourceProxy, 0);
}

@end

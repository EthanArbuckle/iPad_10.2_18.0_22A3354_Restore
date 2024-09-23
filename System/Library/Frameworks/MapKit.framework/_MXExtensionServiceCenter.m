@implementation _MXExtensionServiceCenter

- (_MXExtensionServiceCenter)initWithExtensionProvider:(id)a3
{
  id v4;
  _MXExtensionServiceCenter *v5;
  _MXExtensionServiceCenter *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *extlock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MXExtensionServiceCenter;
  v5 = -[_MXExtensionServiceCenter init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionProvider, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.maps._MXExtensionServiceCenter.extension", v7);
    extlock = v6->_extlock;
    v6->_extlock = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (void)receivedExtensions:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _MXExtensionServiceCenter *v15;
  id v16;

  v5 = a3;
  -[_MXExtensionServiceCenter mapsExtensions](self, "mapsExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54___MXExtensionServiceCenter_receivedExtensions_error___block_invoke;
  v12[3] = &unk_1E20DB410;
  v13 = v7;
  v14 = v6;
  v15 = self;
  v16 = v8;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  -[_MXExtensionServiceCenter setExtensions:](self, "setExtensions:", v11);
  -[_MXExtensionServiceCenter setMapsExtensions:](self, "setMapsExtensions:", v9);
  -[_MXExtensionServiceCenter setContainingAppProxies:](self, "setContainingAppProxies:", 0);

}

- (id)allExtensions
{
  void *v2;
  void *v3;

  -[_MXExtensionServiceCenter mapsExtensions](self, "mapsExtensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_extensionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_MXExtensionServiceCenter extensions](self, "extensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_clearExtensions
{
  -[_MXExtensionServiceCenter receivedExtensions:error:](self, "receivedExtensions:error:", MEMORY[0x1E0C9AA60], 0);
}

- (id)_siblingExtensionsWithContainingAppIdentifer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  -[_MXExtensionServiceCenter containingAppProxies](self, "containingAppProxies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MXExtensionServiceCenter allExtensions](self, "allExtensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __74___MXExtensionServiceCenter__siblingExtensionsWithContainingAppIdentifer___block_invoke;
    v20 = &unk_1E20DB438;
    v21 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v17);

    -[_MXExtensionServiceCenter setContainingAppProxies:](self, "setContainingAppProxies:", v8, v17, v18, v19, v20);
  }
  -[_MXExtensionServiceCenter containingAppProxies](self, "containingAppProxies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v22[0] = CFSTR("kExtensionUI");
    objc_msgSend(v10, "extensionUIIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    v23[0] = v12;
    v22[1] = CFSTR("kExtensionNonUI");
    objc_msgSend(v10, "extensionNonUIIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    v23[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setExtensions:(id)a3
{
  void *v4;
  NSObject *extlock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  extlock = self->_extlock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___MXExtensionServiceCenter_setExtensions___block_invoke;
  block[3] = &unk_1E20D7E58;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(extlock, block);

}

- (NSDictionary)extensions
{
  NSObject *extlock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  extlock = self->_extlock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39___MXExtensionServiceCenter_extensions__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(extlock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)setMapsExtensions:(id)a3
{
  void *v4;
  NSObject *extlock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  extlock = self->_extlock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___MXExtensionServiceCenter_setMapsExtensions___block_invoke;
  block[3] = &unk_1E20D7E58;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(extlock, block);

}

- (NSDictionary)mapsExtensions
{
  NSObject *extlock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  extlock = self->_extlock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43___MXExtensionServiceCenter_mapsExtensions__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(extlock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)setContainingAppProxies:(id)a3
{
  void *v4;
  NSObject *extlock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  extlock = self->_extlock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___MXExtensionServiceCenter_setContainingAppProxies___block_invoke;
  block[3] = &unk_1E20D7E58;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(extlock, block);

}

- (NSDictionary)containingAppProxies
{
  NSObject *extlock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  extlock = self->_extlock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49___MXExtensionServiceCenter_containingAppProxies__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(extlock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (_MXExtensionProvider)extensionProvider
{
  return (_MXExtensionProvider *)objc_loadWeakRetained((id *)&self->_extensionProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_containingAppProxies, 0);
  objc_storeStrong((id *)&self->_mapsExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_extlock, 0);
}

@end

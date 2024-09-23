@implementation IKAppMediaItemBridge

- (IKAppMediaItemBridge)initWithAppContext:(id)a3 jsMediaItem:(id)a4
{
  id v6;
  id v7;
  IKAppMediaItemBridge *v8;
  id *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IKAppMediaItemBridge;
  v8 = -[IKAppMediaItemBridge init](&v23, sel_init);
  if (v8)
  {
    if (initWithAppContext_jsMediaItem__onceToken != -1)
      dispatch_once(&initWithAppContext_jsMediaItem__onceToken, &__block_literal_global_25);
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeWeak((id *)&v8->_jsMediaItem, v7);
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__24;
    v21 = __Block_byref_object_dispose__24;
    v22 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __55__IKAppMediaItemBridge_initWithAppContext_jsMediaItem___block_invoke_60;
    v14 = &unk_1E9F4B778;
    v16 = &v17;
    v9 = v8;
    v15 = v9;
    objc_msgSend(v6, "evaluateDelegateBlockSync:", &v11);
    objc_msgSend((id)_globalMediaItems, "addObject:", v18[5], v11, v12, v13, v14);
    objc_storeWeak(v9 + 3, (id)v18[5]);

    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

void __55__IKAppMediaItemBridge_initWithAppContext_jsMediaItem___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
  v1 = (void *)_globalMediaItems;
  _globalMediaItems = v0;

}

void __55__IKAppMediaItemBridge_initWithAppContext_jsMediaItem___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForMediaItem:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)cleanup
{
  IKAppMediaItem **p_appMediaItem;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD block[5];

  p_appMediaItem = &self->_appMediaItem;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appMediaItem);
  v4 = (void *)_globalMediaItems;
  v5 = objc_loadWeakRetained((id *)p_appMediaItem);
  objc_msgSend(v4, "removeObject:", v5);

  objc_storeWeak((id *)p_appMediaItem, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__IKAppMediaItemBridge_cleanup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __31__IKAppMediaItemBridge_cleanup__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)setUrl:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__IKAppMediaItemBridge_setUrl___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __31__IKAppMediaItemBridge_setUrl___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "appMediaItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUrl:", v4);

}

- (NSString)url
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__IKAppMediaItemBridge_url__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __27__IKAppMediaItemBridge_url__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "appMediaItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)setType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__IKAppMediaItemBridge_setType___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __32__IKAppMediaItemBridge_setType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", *(_QWORD *)(a1 + 32));

}

- (NSString)type
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__IKAppMediaItemBridge_type__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __28__IKAppMediaItemBridge_type__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setInterstitials:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__IKAppMediaItemBridge_setInterstitials___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __41__IKAppMediaItemBridge_setInterstitials___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("interstitials"));

}

- (NSArray)interstitials
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppMediaItemBridge_interstitials__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __37__IKAppMediaItemBridge_interstitials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("interstitials"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setChapterGroups:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__IKAppMediaItemBridge_setChapterGroups___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __41__IKAppMediaItemBridge_setChapterGroups___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("chapterGroups"));

}

- (NSArray)chapterGroups
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppMediaItemBridge_chapterGroups__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __37__IKAppMediaItemBridge_chapterGroups__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("chapterGroups"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setExternalID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__IKAppMediaItemBridge_setExternalID___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __38__IKAppMediaItemBridge_setExternalID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("externalID"));

}

- (NSString)externalID
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppMediaItemBridge_externalID__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __34__IKAppMediaItemBridge_externalID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("externalID"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__IKAppMediaItemBridge_setTitle___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __33__IKAppMediaItemBridge_setTitle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("title"));

}

- (NSString)title
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__IKAppMediaItemBridge_title__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __29__IKAppMediaItemBridge_title__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("title"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__IKAppMediaItemBridge_setSubtitle___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __36__IKAppMediaItemBridge_setSubtitle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("subtite"));

}

- (NSString)subtitle
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__IKAppMediaItemBridge_subtitle__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __32__IKAppMediaItemBridge_subtitle__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("subtite"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setDescription:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__IKAppMediaItemBridge_setDescription___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __39__IKAppMediaItemBridge_setDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("description"));

}

- (NSString)description
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__IKAppMediaItemBridge_description__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __35__IKAppMediaItemBridge_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("description"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setContentRatingRanking:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__IKAppMediaItemBridge_setContentRatingRanking___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __48__IKAppMediaItemBridge_setContentRatingRanking___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("contentRatingRanking"));

}

- (NSNumber)contentRatingRanking
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__IKAppMediaItemBridge_contentRatingRanking__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __44__IKAppMediaItemBridge_contentRatingRanking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("contentRatingRanking"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setContentRatingDomain:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__IKAppMediaItemBridge_setContentRatingDomain___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __47__IKAppMediaItemBridge_setContentRatingDomain___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("contentRatingDomain"));

}

- (NSString)contentRatingDomain
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__IKAppMediaItemBridge_contentRatingDomain__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __43__IKAppMediaItemBridge_contentRatingDomain__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("contentRatingDomain"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setArtworkImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageURL, a3);
  -[IKAppMediaItemBridge _resolveArtworkImageURL](self, "_resolveArtworkImageURL");
}

- (NSString)artworkImageURL
{
  return self->_artworkImageURL;
}

- (void)setArtworkImageSrcset:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageSrcset, a3);
  -[IKAppMediaItemBridge _resolveArtworkImageURL](self, "_resolveArtworkImageURL");
}

- (NSString)artworkImageSrcset
{
  return self->_artworkImageSrcset;
}

- (void)setRatingBadge:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__IKAppMediaItemBridge_setRatingBadge___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __39__IKAppMediaItemBridge_setRatingBadge___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("ratingBadge"));

}

- (NSString)ratingBadge
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__IKAppMediaItemBridge_ratingBadge__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __35__IKAppMediaItemBridge_ratingBadge__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("ratingBadge"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setIsExplicit:(BOOL)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__IKAppMediaItemBridge_setIsExplicit___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __38__IKAppMediaItemBridge_setIsExplicit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("isExplicit"));

}

- (BOOL)isExplicit
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppMediaItemBridge_isExplicit__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = objc_msgSend((id)v6[5], "BOOLValue");
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__IKAppMediaItemBridge_isExplicit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("isExplicit"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setResumeTime:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = &unk_1E9F8C5F0;
  if (a3)
    v4 = a3;
  v5 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__IKAppMediaItemBridge_setResumeTime___block_invoke;
  v7[3] = &unk_1E9F4E8E0;
  v8 = v5;
  v6 = v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v7);

}

void __38__IKAppMediaItemBridge_setResumeTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("resumeTime"));

}

- (NSNumber)resumeTime
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppMediaItemBridge_resumeTime__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __34__IKAppMediaItemBridge_resumeTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("resumeTime"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setExtraMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__IKAppMediaItemBridge_setExtraMetadata___block_invoke;
  v6[3] = &unk_1E9F4E8E0;
  v7 = v4;
  v5 = v4;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v6);

}

void __41__IKAppMediaItemBridge_setExtraMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("extraMetadata"));

}

- (NSDictionary)extraMetadata
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppMediaItemBridge_extraMetadata__block_invoke;
  v4[3] = &unk_1E9F4E908;
  v4[4] = &v5;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __37__IKAppMediaItemBridge_extraMetadata__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("extraMetadata"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (double)contentProposalPresentationTime
{
  double v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__IKAppMediaItemBridge_contentProposalPresentationTime__block_invoke;
  v5[3] = &unk_1E9F4E908;
  v5[4] = &v6;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v5);
  objc_msgSend((id)v7[5], "doubleValue");
  v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__IKAppMediaItemBridge_contentProposalPresentationTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("contentProposalPresentationTime"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setContentProposalPresentationTime:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__IKAppMediaItemBridge_setContentProposalPresentationTime___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v24__0__IKAppContext_8__IKAppMediaItemBridge_16l;
  *(double *)&v3[4] = a3;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v3);
}

void __59__IKAppMediaItemBridge_setContentProposalPresentationTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "appMediaItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("contentProposalPresentationTime"));

}

- (double)contentProposalAutomaticAcceptanceInterval
{
  double v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__IKAppMediaItemBridge_contentProposalAutomaticAcceptanceInterval__block_invoke;
  v5[3] = &unk_1E9F4E908;
  v5[4] = &v6;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v5);
  objc_msgSend((id)v7[5], "doubleValue");
  v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __66__IKAppMediaItemBridge_contentProposalAutomaticAcceptanceInterval__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "appMediaItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("contentProposalPresentationTime"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__IKAppMediaItemBridge_setContentProposalAutomaticAcceptanceInterval___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v24__0__IKAppContext_8__IKAppMediaItemBridge_16l;
  *(double *)&v3[4] = a3;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v3);
}

void __70__IKAppMediaItemBridge_setContentProposalAutomaticAcceptanceInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "appMediaItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("contentProposalAutomaticAcceptanceInterval"));

}

- (void)prepareForLoadingWithCallback:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD v14[4];
  id v15;
  id v16;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_appContext);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke;
  v14[3] = &unk_1E9F4E978;
  objc_copyWeak(&v16, &to);
  v6 = v4;
  v15 = v6;
  v7 = (void *)MEMORY[0x1DF092410](v14);
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_3;
  v10[3] = &unk_1E9F4D740;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v10, 0);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&to);

}

void __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isBoolean"))
    v7 = objc_msgSend(v5, "toBool");
  else
    v7 = 0;
  if (objc_msgSend(v6, "isString"))
  {
    objc_msgSend(v6, "toString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_2;
  v13[3] = &unk_1E9F4E950;
  v11 = *(id *)(a1 + 32);
  v16 = v7;
  v14 = v9;
  v15 = v11;
  v12 = v9;
  objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v13);

}

uint64_t __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  v6 = (void *)MEMORY[0x1E0CBE108];
  v7 = objc_loadWeakRetained(WeakRetained + 5);
  objc_msgSend(v6, "valueWithObject:inContext:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hasProperty:", CFSTR("prepareForLoadingWithCompletion")))
  {
    v9 = objc_loadWeakRetained(WeakRetained + 5);
    v10 = (void *)MEMORY[0x1DF092410](*(_QWORD *)(a1 + 32));
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v9, "invokeMethod:withArguments:", CFSTR("prepareForLoadingWithCompletion"), v11);

  }
}

- (void)loadCertificateDataForURL:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id to;

  v6 = a3;
  v7 = a4;
  objc_copyWeak(&to, (id *)&self->_appContext);
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppMediaItemBridge jsMediaItem](self, "jsMediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(&to);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke;
  v14[3] = &unk_1E9F4E9F0;
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  objc_copyWeak(&v18, &to);
  v13 = v7;
  v17 = v13;
  objc_msgSend(v10, "evaluate:completionBlock:", v14, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);

}

void __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_2;
  v6[3] = &unk_1E9F4E9C8;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "loadCertificateDataForURI:withCallback:", v5, v6);

  objc_destroyWeak(&v8);
}

void __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id WeakRetained;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D50];
    v10 = a2;
    a2 = (void *)objc_msgSend([v9 alloc], "initWithBase64EncodedString:options:", v10, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_3;
  v16[3] = &unk_1E9F4E9A0;
  v12 = *(id *)(a1 + 32);
  v17 = a2;
  v18 = v7;
  v19 = v8;
  v20 = v12;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v16);

}

uint64_t __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)loadContentIdentifierDataForURL:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id to;

  v6 = a3;
  v7 = a4;
  objc_copyWeak(&to, (id *)&self->_appContext);
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppMediaItemBridge jsMediaItem](self, "jsMediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(&to);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke;
  v14[3] = &unk_1E9F4E9F0;
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  objc_copyWeak(&v18, &to);
  v13 = v7;
  v17 = v13;
  objc_msgSend(v10, "evaluate:completionBlock:", v14, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);

}

void __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_2;
  v6[3] = &unk_1E9F4E9C8;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "loadContentIdentifierDataForURI:withCallback:", v5, v6);

  objc_destroyWeak(&v8);
}

void __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id WeakRetained;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D50];
    v10 = a2;
    a2 = (void *)objc_msgSend([v9 alloc], "initWithBase64EncodedString:options:", v10, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_3;
  v16[3] = &unk_1E9F4E9A0;
  v12 = *(id *)(a1 + 32);
  v17 = a2;
  v18 = v7;
  v19 = v8;
  v20 = v12;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v16);

}

uint64_t __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)loadKeyDataForURL:(id)a3 keyRequestData:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id to;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_copyWeak(&to, (id *)&self->_appContext);
  objc_msgSend(v8, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppMediaItemBridge jsMediaItem](self, "jsMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained(&to);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke;
  v19[3] = &unk_1E9F4EA18;
  v15 = v13;
  v20 = v15;
  v16 = v11;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  objc_copyWeak(&v24, &to);
  v18 = v10;
  v23 = v18;
  objc_msgSend(v14, "evaluate:completionBlock:", v19, 0);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&to);

}

void __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_2;
  v7[3] = &unk_1E9F4E9C8;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "loadKeyDataForURI:requestData:withCallback:", v5, v6, v7);

  objc_destroyWeak(&v9);
}

void __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id WeakRetained;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D50];
    v10 = a2;
    a2 = (void *)objc_msgSend([v9 alloc], "initWithBase64EncodedString:options:", v10, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_3;
  v16[3] = &unk_1E9F4E9A0;
  v12 = *(id *)(a1 + 32);
  v17 = a2;
  v18 = v7;
  v19 = v8;
  v20 = v12;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v16);

}

uint64_t __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_resolveArtworkImageURL
{
  IKSrcsetParser *v3;
  IKSrcsetParser *v4;
  _QWORD v5[4];
  IKSrcsetParser *v6;

  v3 = -[IKSrcsetParser initWithSrcsetStr:defaultStr:]([IKSrcsetParser alloc], "initWithSrcsetStr:defaultStr:", self->_artworkImageSrcset, self->_artworkImageURL);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__IKAppMediaItemBridge__resolveArtworkImageURL__block_invoke;
  v5[3] = &unk_1E9F4E8E0;
  v6 = v3;
  v4 = v3;
  -[IKAppMediaItemBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v5);

}

void __47__IKAppMediaItemBridge__resolveArtworkImageURL__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "appMediaItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolvedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("artworkImageURL"));

}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[IKAppMediaItemBridge appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__IKAppMediaItemBridge__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E9F4CA00;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __51__IKAppMediaItemBridge__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, WeakRetained);
  }

}

- (IKAppMediaItem)appMediaItem
{
  return (IKAppMediaItem *)objc_loadWeakRetained((id *)&self->_appMediaItem);
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKJSMediaItem)jsMediaItem
{
  return (IKJSMediaItem *)objc_loadWeakRetained((id *)&self->_jsMediaItem);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsMediaItem);
  objc_destroyWeak((id *)&self->_appContext);
  objc_destroyWeak((id *)&self->_appMediaItem);
  objc_storeStrong((id *)&self->_artworkImageSrcset, 0);
  objc_storeStrong((id *)&self->_artworkImageURL, 0);
}

@end

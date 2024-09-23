@implementation CFXEffect

- (CFXEffect)initWithJTEffect:(id)a3
{
  id v5;
  CFXEffect *v6;
  CFXEffect *v7;
  uint64_t v8;
  NSString *localizedTitle;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  id v13;
  void *v14;
  CFXEffect *v15;
  objc_super v17;

  v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)CFXEffect;
    v6 = -[CFXEffect init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_jtEffect, a3);
      objc_msgSend(v5, "displayName");
      v8 = objc_claimAutoreleasedReturnValue();
      localizedTitle = v7->_localizedTitle;
      v7->_localizedTitle = (NSString *)v8;

      objc_msgSend(v5, "effectID");
      v10 = objc_claimAutoreleasedReturnValue();
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v10;

      if (objc_msgSend(v5, "type") == 1)
      {
        objc_msgSend(v5, "contentDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = v5;
          objc_msgSend(v13, "contentProperties");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addEffectParameters:", v14);

        }
      }
    }
    self = v7;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)initEffectRegistry
{
  if (initEffectRegistry_onceToken != -1)
    dispatch_once(&initEffectRegistry_onceToken, &__block_literal_global_30);
}

void __31__CFXEffect_initEffectRegistry__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BE79010];
  +[CFXEffectHostAppDelegate sharedInstance](CFXEffectHostAppDelegate, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "initEffectRegistryWithHostDelegate:", v1);

}

+ (void)setupFactoryDelegate
{
  id v2;

  +[CFXEffectFactoryDelegate sharedInstance](CFXEffectFactoryDelegate, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXEffectFactory setDelegate:](JFXEffectFactory, "setDelegate:", v2);

}

+ (void)preWarmShaderCache
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__CFXEffect_preWarmShaderCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

void __31__CFXEffect_preWarmShaderCache__block_invoke(uint64_t a1)
{
  void *v2;
  JFXEffectsPreviewGenerator *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  JFXEffectsPreviewGenerationRequest *v13;
  void *v14;
  JFXEffectsPreviewGenerationRequest *v15;
  id obj;
  void *v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  __int128 v21;
  uint64_t v22;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CVPixelBufferRef pixelBufferOut;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;
  _QWORD v32[4];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v31 = *MEMORY[0x24BDC5668];
  v32[0] = MEMORY[0x24BDBD1B8];
  pixelBufferOut = 0;
  CVPixelBufferCreate(0, 1uLL, 1uLL, 0x42475241u, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1), &pixelBufferOut);
  objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", pixelBufferOut);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(pixelBufferOut);
  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Filter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effectIdentifiersForEffectType:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(JFXEffectsPreviewGenerator);
  v4 = dispatch_semaphore_create(1);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(*(id *)(a1 + 32), "effectWithIdentifier:forEffectType:", v9, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "jtEffect");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRenderSize:", 1.0, 1.0);
        objc_msgSend(v11, "renderEffect");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = kDefaultEffectPreviewAnimationRange;
        v23[1] = xmmword_226AB8860;
        v23[2] = xmmword_226AB8870;
        objc_msgSend(v12, "setEffectRange:", v23);

        v13 = [JFXEffectsPreviewGenerationRequest alloc];
        v29 = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = kDefaultEffectPreviewRenderTime;
        v22 = 0;
        v15 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v13, "initWithInput:effectStack:outputSize:renderTime:", v18, v14, &v21, 1.0, 1.0);

        -[JFXEffectsPreviewGenerationRequest setChildCode:](v15, "setChildCode:", 60);
        -[JFXEffectsPreviewGenerationRequest setParentCode:](v15, "setParentCode:", 60);
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __31__CFXEffect_preWarmShaderCache__block_invoke_2;
        v19[3] = &unk_24EE59A10;
        v20 = v4;
        -[JFXEffectsPreviewGenerator generatePreviewRequest:completionHandler:](v3, "generatePreviewRequest:completionHandler:", v15, v19);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v6);
  }

}

intptr_t __31__CFXEffect_preWarmShaderCache__block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BE79018], "cleanupEffectsCache");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (CFXEffect)effectWithIdentifier:(id)a3 forEffectType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CFXEffect *v10;

  v5 = a4;
  v6 = a3;
  +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "jtEffectType");

  objc_msgSend(v7, "createEffectForType:fromID:withProperties:", v8, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = -[CFXEffect initWithJTEffect:]([CFXEffect alloc], "initWithJTEffect:", v9);
  else
    v10 = 0;

  return v10;
}

+ (id)effectIdentifiersForEffectType:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  id *v15;
  __CFString **v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  NSObject *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Text"));

  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Shapes"));

  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("EmojiStickers"));

  objc_msgSend(v3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Filter"));

  v12 = dispatch_semaphore_create(0);
  if ((v5 | v7 | v9) == 1)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__12;
    v51 = __Block_byref_object_dispose__12;
    v52 = 0;
    +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __44__CFXEffect_effectIdentifiersForEffectType___block_invoke;
    v44[3] = &unk_24EE58A68;
    v46 = &v47;
    v14 = v12;
    v45 = v14;
    objc_msgSend(v13, "effectCategoriesForType:completion:", 2, v44);

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (((v5 | v7 | v9) & 1) != 0)
    {
      v15 = (id *)kEditableOverlaysCategoryID;
      v16 = kShapeOverlaysCategoryID;
      if (!v7)
        v16 = kEmojiStickersCategoryID;
      if (!v5)
        v15 = (id *)v16;
      v17 = *v15;
    }
    else
    {
      v17 = 0;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v26 = (id)v48[5];
    v22 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    if (v22)
    {
      v27 = *(_QWORD *)v41;
LABEL_15:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v26);
        v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v28);
        objc_msgSend(v29, "categoryID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", v17);

        if ((v31 & 1) != 0)
          break;
        if (v22 == (id)++v28)
        {
          v22 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          if (v22)
            goto LABEL_15;
          goto LABEL_24;
        }
      }
      v32 = v29;

      if (v32)
      {
        objc_msgSend(v32, "effectIDs");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v26 = v32;
        goto LABEL_24;
      }
      v22 = 0;
    }
    else
    {
LABEL_24:

    }
    _Block_object_dispose(&v47, 8);

  }
  else if (v11)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__12;
    v51 = __Block_byref_object_dispose__12;
    v52 = 0;
    +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_2;
    v37[3] = &unk_24EE58A68;
    v39 = &v47;
    v19 = v12;
    v38 = v19;
    objc_msgSend(v18, "effectCategoriesForType:completion:", 1, v37);

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend((id)v48[5], "count");
    v20 = (void *)v48[5];
    if (v20)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "effectIDs");
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__12;
    v51 = __Block_byref_object_dispose__12;
    v52 = 0;
    +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v3, "jtEffectType");
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_3;
    v34[3] = &unk_24EE58A68;
    v36 = &v47;
    v25 = v12;
    v35 = v25;
    objc_msgSend(v23, "effectIDsForType:completion:", v24, v34);

    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    v22 = (id)v48[5];

    _Block_object_dispose(&v47, 8);
  }

  return v22;
}

void __44__CFXEffect_effectIdentifiersForEffectType___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (CFXEffect)effectWithJTEffect:(id)a3
{
  id v3;
  CFXEffect *v4;

  v3 = a3;
  v4 = -[CFXEffect initWithJTEffect:]([CFXEffect alloc], "initWithJTEffect:", v3);

  return v4;
}

- (BOOL)isNone
{
  void *v2;
  char v3;

  -[CFXEffect jtEffect](self, "jtEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNone");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  CFXEffect *v4;

  v3 = (void *)-[JFXEffect copy](self->_jtEffect, "copy", a3);
  v4 = -[CFXEffect initWithJTEffect:]([CFXEffect alloc], "initWithJTEffect:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CFXEffect *v4;
  CFXEffect *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CFXEffect *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CFXEffect jtEffect](self, "jtEffect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffect jtEffect](v5, "jtEffect");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CFXEffect jtEffect](self, "jtEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (JFXEffect)jtEffect
{
  return self->_jtEffect;
}

- (void)setJtEffect:(id)a3
{
  objc_storeStrong((id *)&self->_jtEffect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jtEffect, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

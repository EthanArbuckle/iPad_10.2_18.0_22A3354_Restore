@implementation INShortcut

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activitySubtitle, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_activityData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[INShortcut intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentWithTypedIntent(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("intent"));

  -[INShortcut activityData](self, "activityData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userActivity"));

  -[INShortcut activityImage](self, "activityImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("activityImage"));

  -[INShortcut activitySubtitle](self, "activitySubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("activitySubtitle"));

  -[INShortcut activityBundleIdentifier](self, "activityBundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("activityBundleIdentifier"));

}

- (NSString)activitySubtitle
{
  return self->_activitySubtitle;
}

- (INImage)activityImage
{
  return self->_activityImage;
}

- (NSData)activityData
{
  void *v3;
  NSData *activityData;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  NSData *v9;
  NSData *v10;
  void *v11;
  NSData *v12;

  -[INShortcut userActivity](self, "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activityData = self->_activityData;
  if (activityData)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    objc_msgSend(v3, "contentAttributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "contentAttributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setThumbnailData:", 0);

    INUserActivitySerializeToData(v3);
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    v10 = self->_activityData;
    self->_activityData = v9;

    objc_msgSend(v3, "contentAttributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setThumbnailData:", v7);

    activityData = self->_activityData;
  }
  v12 = activityData;

  return v12;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSString)activityBundleIdentifier
{
  return self->_activityBundleIdentifier;
}

- (INShortcut)initWithIntent:(INIntent *)intent
{
  INIntent *v4;
  INIntent *v5;
  INShortcut *v6;

  v4 = intent;
  v5 = v4;
  if (v4 && (-[INIntent _isConfigurable](v4, "_isConfigurable") || _INIsIntentValidForSuggestion(v5)))
  {
    self = (INShortcut *)-[INShortcut _initWithIntent:](self, "_initWithIntent:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_initWithIntent:(id)a3
{
  id v4;
  INShortcut *v5;
  uint64_t v6;
  INIntent *intent;
  INShortcut *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INShortcut;
  v5 = -[INShortcut init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

    v8 = v5;
  }

  return v5;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INShortcut)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INShortcut *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INTypedIntentWithIntent(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = (INShortcut *)-[INShortcut _initWithIntent:](self, "_initWithIntent:", v6);
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityImage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("activitySubtitle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityBundleIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[INShortcut initWithActivityData:activityImage:activitySubtitle:activityBundleIdentifier:](self, "initWithActivityData:activityImage:activitySubtitle:activityBundleIdentifier:", v8, v9, v13, v14);

      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (INImage)_keyImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[INShortcut intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[INShortcut activityImage](self, "activityImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (INImage *)v7;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v5;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  void *v9;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB36F8];
  v11 = 0;
  v6 = (void (**)(id, void *, id))a4;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v6[2](v6, v7, v8);

  v9 = (void *)objc_opt_new();
  return v9;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(v6, "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.sirikit.shortcut");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.sirikit.shortcut");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  INShortcut *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  INImageProxyInjectionOperation *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  INShortcut *v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    INImageProxyInjectionQueue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnderlyingQueue:", v9);

    objc_msgSend(v8, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v8, "setSuspended:", 1);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__59941;
    v23[4] = __Block_byref_object_dispose__59942;
    v10 = self;
    v24 = v10;
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v20[3] = &unk_1E2292798;
    v21 = v7;
    v22 = v23;
    objc_msgSend(v11, "blockOperationWithBlock:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INShortcut intent](v10, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INShortcut activityImage](v10, "activityImage");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14)
    {
      v17 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v17, "setInjector:", v14);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v17, "setImageProxyRequestBlock:", v6);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v19[3] = &unk_1E228E640;
      v19[4] = v10;
      v19[5] = v23;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v17, "setCopyReturnBlock:", v19);
      objc_msgSend(v13, "addDependency:", v17);
      objc_msgSend(v8, "addOperation:", v17);
    }
    else
    {
      if (!v15)
      {
LABEL_7:
        objc_msgSend(v8, "addOperation:", v13);
        objc_msgSend(v8, "setSuspended:", 0);

        _Block_object_dispose(v23, 8);
        goto LABEL_8;
      }
      v17 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v17, "setInjector:", v16);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v17, "setImageProxyRequestBlock:", v6);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v18[3] = &unk_1E228E668;
      v18[4] = v10;
      v18[5] = v23;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v17, "setCopyReturnBlock:", v18);
      objc_msgSend(v13, "addDependency:", v17);
      objc_msgSend(v8, "addOperation:", v17);
    }

    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    v3 = a2;
    v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIntent:", v3);

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __72__INShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "shortcutWithActivityImage:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (INShortcut)initWithUserActivity:(NSUserActivity *)userActivity
{
  return -[INShortcut initWithUserActivity:bundleIdentifier:](self, "initWithUserActivity:bundleIdentifier:", userActivity, 0);
}

- (INShortcut)initWithUserActivity:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  INShortcut *v14;
  void *v15;
  void *v16;
  INShortcut *v17;

  v7 = a3;
  if (v7)
  {
    v8 = a4;
    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
      NSLog((NSString *)CFSTR("Shortcut created from user activity (%@) is invalid because it is missing a title"), v7);
    objc_msgSend(v7, "contentAttributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "thumbnailURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isFileURL"))
    {
      +[INImage imageWithURL:](INImage, "imageWithURL:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "thumbnailData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        +[INImage imageWithImageData:](INImage, "imageWithImageData:", v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
    objc_msgSend(v11, "contentDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[INShortcut initWithActivityData:activityImage:activitySubtitle:activityBundleIdentifier:](self, "initWithActivityData:activityImage:activitySubtitle:activityBundleIdentifier:", 0, v13, v16, v8);

    if (self)
    {
      objc_storeStrong((id *)&self->_userActivity, a3);
      v17 = self;
    }

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (INShortcut)initWithActivityData:(id)a3 activityImage:(id)a4 activitySubtitle:(id)a5 activityBundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INShortcut *v14;
  uint64_t v15;
  NSData *activityData;
  uint64_t v17;
  INImage *activityImage;
  uint64_t v19;
  NSString *activitySubtitle;
  uint64_t v21;
  NSString *activityBundleIdentifier;
  uint64_t v23;
  NSUserActivity *userActivity;
  void *v25;
  objc_class *v26;
  id v27;
  void *v28;
  INShortcut *v29;
  objc_super v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)INShortcut;
  v14 = -[INShortcut init](&v31, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    activityData = v14->_activityData;
    v14->_activityData = (NSData *)v15;

    v17 = objc_msgSend(v11, "copy");
    activityImage = v14->_activityImage;
    v14->_activityImage = (INImage *)v17;

    if (objc_msgSend(v12, "length"))
    {
      v19 = objc_msgSend(v12, "copy");
      activitySubtitle = v14->_activitySubtitle;
      v14->_activitySubtitle = (NSString *)v19;
    }
    else
    {
      activitySubtitle = v14->_activitySubtitle;
      v14->_activitySubtitle = 0;
    }

    v21 = objc_msgSend(v13, "copy");
    activityBundleIdentifier = v14->_activityBundleIdentifier;
    v14->_activityBundleIdentifier = (NSString *)v21;

    if (objc_msgSend(v10, "length"))
    {
      INUserActivityDeserializeFromData(v10);
      v23 = objc_claimAutoreleasedReturnValue();
      userActivity = v14->_userActivity;
      v14->_userActivity = (NSUserActivity *)v23;

      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v25 = (void *)getCSSearchableItemAttributeSetClass_softClass_73345;
      v36 = getCSSearchableItemAttributeSetClass_softClass_73345;
      if (!getCSSearchableItemAttributeSetClass_softClass_73345)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __getCSSearchableItemAttributeSetClass_block_invoke_73346;
        v32[3] = &unk_1E22953C0;
        v32[4] = &v33;
        __getCSSearchableItemAttributeSetClass_block_invoke_73346((uint64_t)v32);
        v25 = (void *)v34[3];
      }
      v26 = objc_retainAutorelease(v25);
      _Block_object_dispose(&v33, 8);
      v27 = objc_alloc_init(v26);
      -[INImage _imageData](v14->_activityImage, "_imageData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setThumbnailData:", v28);

      -[NSUserActivity setContentAttributeSet:](v14->_userActivity, "setContentAttributeSet:", v27);
    }
    v29 = v14;
  }

  return v14;
}

- (INShortcut)shortcutWithActivityImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  INShortcut *v10;

  v4 = a3;
  -[INShortcut userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc((Class)objc_opt_class());
    -[INShortcut activityData](self, "activityData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INShortcut activitySubtitle](self, "activitySubtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INShortcut activityBundleIdentifier](self, "activityBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (INShortcut *)objc_msgSend(v6, "initWithActivityData:activityImage:activitySubtitle:activityBundleIdentifier:", v7, v4, v8, v9);

  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (INShortcut)shortcutWithActivityBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  INShortcut *v10;

  v4 = a3;
  -[INShortcut userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc((Class)objc_opt_class());
    -[INShortcut activityData](self, "activityData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INShortcut activityImage](self, "activityImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INShortcut activitySubtitle](self, "activitySubtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (INShortcut *)objc_msgSend(v6, "initWithActivityData:activityImage:activitySubtitle:activityBundleIdentifier:", v7, v8, v9, v4);

  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (NSString)_title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[INShortcut intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INShortcut userActivity](self, "userActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return (NSString *)v5;
}

- (NSString)_subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INShortcut intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INShortcut userActivity](self, "userActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[INShortcut activitySubtitle](self, "activitySubtitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return (NSString *)v5;
}

- (NSString)_associatedAppBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[INShortcut intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_intents_bundleIdForDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INShortcut userActivity](self, "userActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[INShortcut activityBundleIdentifier](self, "activityBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity(v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return (NSString *)v5;
}

- (NSString)description
{
  INIntent *intent;
  __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  intent = self->_intent;
  if (intent)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("intent: %@"), intent);
  }
  else
  {
    if (!self->_userActivity)
    {
      v4 = CFSTR("(empty)");
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("userActivity: %@"), self->_userActivity);
  }
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p %@>"), v7, self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  INShortcut *v5;
  INShortcut *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = (INShortcut *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[INShortcut intent](self, "intent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[INShortcut intent](v6, "intent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[INShortcut intent](self, "intent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[INShortcut intent](v6, "intent");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_25;
        }
      }
      -[INShortcut userActivity](self, "userActivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[INShortcut userActivity](v6, "userActivity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[INShortcut userActivity](self, "userActivity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[INShortcut userActivity](v6, "userActivity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      -[INShortcut activityImage](self, "activityImage");
      v14 = objc_claimAutoreleasedReturnValue();
      -[INShortcut activityImage](v6, "activityImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        -[INShortcut activityImage](self, "activityImage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[INShortcut activityImage](v6, "activityImage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      -[INShortcut activitySubtitle](self, "activitySubtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[INShortcut activitySubtitle](v6, "activitySubtitle");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

        v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        -[INShortcut activitySubtitle](self, "activitySubtitle");
        v24 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[INShortcut activitySubtitle](v6, "activitySubtitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v20, "isEqualToString:", v21);

        v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12)
          goto LABEL_24;
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    v10 = 0;
  }
LABEL_27:

  return v10;
}

@end

@implementation ISIcon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->prepareISIconDigestToSignpostIDs, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  _QWORD block[5];

  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__ISIcon_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    if (allocWithZone__onceToken != -1)
      dispatch_once(&allocWithZone__onceToken, block);
    return (id)allocWithZone__iconFactory;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___ISIcon;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)prepareImageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISIcon _beginPrepareISIconSignpost:funcName:](self, "_beginPrepareISIconSignpost:funcName:", v6, "-[ISIcon prepareImageForDescriptor:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISIcon imageForDescriptor:](self, "imageForDescriptor:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "placeholder"))
    {
      objc_msgSend(v5, "setIgnoreCache:", 0);
      -[ISIcon _prepareImagesForImageDescriptors:](self, "_prepareImagesForImageDescriptors:", v6);
      -[ISIcon imageForDescriptor:](self, "imageForDescriptor:", v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    -[ISIcon _endPrepareISIconSignpost:](self, "_endPrepareISIconSignpost:", v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_beginPrepareISIconSignpost:(id)a3 funcName:(const char *)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *p_lock;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  ISIcon *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    _ISPrepareISIconSignpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_enabled(v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v29 = v5;
      obj = v5;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v35;
        p_lock = &self->_lock;
        do
        {
          v13 = 0;
          v32 = v10;
          do
          {
            if (*(_QWORD *)v35 != v11)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
            objc_msgSend(v14, "digest");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
            {
              objc_msgSend(v8, "addObject:", v15);
              _ISPrepareISIconSignpostLog();
              v16 = objc_claimAutoreleasedReturnValue();
              v17 = os_signpost_id_generate(v16);

              if (v17)
              {
                _ISPrepareISIconSignpostLog();
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = v18;
                if (v17 != -1 && os_signpost_enabled(v18))
                {
                  v20 = objc_msgSend(obj, "count");
                  *(_DWORD *)buf = 138413314;
                  v39 = self;
                  v40 = 2112;
                  v41 = v14;
                  v42 = 2080;
                  v43 = a4;
                  v44 = 2112;
                  v45 = v15;
                  v46 = 2048;
                  v47 = v20;
                  _os_signpost_emit_with_name_impl(&dword_1AA928000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PrepareISIcon", "ISIcon: %@, descriptor: %@, func: %s, Digest=%{signpost.telemetry:string1}@, NumDescriptors=%{signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0x34u);
                }

                os_unfair_lock_lock(p_lock);
                -[ISIcon prepareISIconDigestToSignpostIDs](self, "prepareISIconDigestToSignpostIDs");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v21)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ISIcon setPrepareISIconDigestToSignpostIDs:](self, "setPrepareISIconDigestToSignpostIDs:", v22);

                }
                -[ISIcon prepareISIconDigestToSignpostIDs](self, "prepareISIconDigestToSignpostIDs");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", v15);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v24)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ISIcon prepareISIconDigestToSignpostIDs](self, "prepareISIconDigestToSignpostIDs");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v15);

                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObject:", v26);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v27);

                os_unfair_lock_unlock(p_lock);
                v10 = v32;
              }
            }

            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
        }
        while (v10);
      }

      v5 = v29;
    }
  }

  return v31;
}

- (void)_endPrepareISIconSignpost:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_unfair_lock_s *p_lock;
  uint64_t i;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    _ISPrepareISIconSignpostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_enabled(v5);

    if (v6)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v27 = v4;
      obj = v4;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v30)
      {
        p_lock = &self->_lock;
        v29 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v37 != v29)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (objc_msgSend(v9, "unsignedLongLongValue"))
            {
              _ISPrepareISIconSignpostLog();
              v10 = objc_claimAutoreleasedReturnValue();
              v11 = os_signpost_enabled(v10);

              if (v11)
              {
                _ISPrepareISIconSignpostLog();
                v12 = objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v9, "unsignedLongLongValue");
                if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
                {
                  v14 = v13;
                  if (os_signpost_enabled(v12))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1AA928000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PrepareISIcon", (const char *)&unk_1AA97B54A, buf, 2u);
                  }
                }

              }
            }
            os_unfair_lock_lock(p_lock);
            -[ISIcon prepareISIconDigestToSignpostIDs](self, "prepareISIconDigestToSignpostIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "allKeys");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v16, "copy");

            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v18 = v17;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v32 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
                  -[ISIcon prepareISIconDigestToSignpostIDs](self, "prepareISIconDigestToSignpostIDs");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "objectForKeyedSubscript:", v23);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v25, "removeObject:", v9);
                  if (!objc_msgSend(v25, "count"))
                  {
                    -[ISIcon prepareISIconDigestToSignpostIDs](self, "prepareISIconDigestToSignpostIDs");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "removeObjectForKey:", v23);

                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              }
              while (v20);
            }

            p_lock = &self->_lock;
            os_unfair_lock_unlock(&self->_lock);

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v30);
      }

      v4 = v27;
    }
  }

}

- (void)_eventPrepareISIconSignpost:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  os_signpost_id_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    _ISPrepareISIconSignpostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_enabled(v8);

    if (v9)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      -[ISIcon prepareISIconDigestToSignpostIDs](self, "prepareISIconDigestToSignpostIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v6;
      objc_msgSend(v6, "digest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

      os_unfair_lock_unlock(p_lock);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v20, "unsignedLongLongValue"))
            {
              _ISPrepareISIconSignpostLog();
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = os_signpost_enabled(v21);

              if (v22)
              {
                _ISPrepareISIconSignpostLog();
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v20, "unsignedLongLongValue");
                if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
                {
                  v25 = v24;
                  if (os_signpost_enabled(v23))
                  {
                    *(_DWORD *)buf = 138412290;
                    v32 = v7;
                    _os_signpost_emit_with_name_impl(&dword_1AA928000, v23, OS_SIGNPOST_EVENT, v25, "PrepareISIcon", "%@", buf, 0xCu);
                  }
                }

              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v17);
      }

      v6 = v26;
    }
  }

}

- (NSMutableDictionary)prepareISIconDigestToSignpostIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (ISIconManager)manager
{
  return +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
}

- (void)setPrepareISIconDigestToSignpostIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISIcon;
  result = -[ISIcon init](&v3, sel_init);
  if (result)
    *((_DWORD *)result + 2) = 0;
  return result;
}

+ (BOOL)variant:(int)a3 isMemberOfSet:(unint64_t)a4
{
  _LIIconVariantInfo *v5;
  _LIIconVariantInfo *v7;
  uint64_t v8;
  unint64_t v9;
  int var0;
  unint64_t v11;

  v11 = 0;
  v5 = +[ISIcon variantInfoForSet:count:](ISIcon, "variantInfoForSet:count:", a4, &v11);
  if (!v11)
    return 0;
  if (v5->var0 == a3)
    return 1;
  v7 = v5 + 1;
  v8 = 1;
  do
  {
    v9 = v8;
    if (v11 == v8)
      break;
    var0 = v7->var0;
    ++v7;
    ++v8;
  }
  while (var0 != a3);
  return v11 > v9;
}

+ (_LIIconVariantInfo)variantInfoForSet:(unint64_t)a3 count:(unint64_t *)a4
{
  int v5;
  unint64_t v6;
  _LIIconVariantInfo *result;
  NSObject *v8;

  v5 = a3;
  if (a3 >= 5)
  {
    _ISDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[ISIcon(LIIconVariant) variantInfoForSet:count:].cold.1(v5, v8);

    v6 = 0;
    result = 0;
  }
  else
  {
    v6 = qword_1AA977138[a3];
    result = (_LIIconVariantInfo *)*(&off_1E5801020 + a3);
  }
  *a4 = v6;
  return result;
}

+ (id)genericApplicationIcon
{
  return +[ISGenericApplicationIcon sharedInstance](ISGenericApplicationIcon, "sharedInstance");
}

void __24__ISIcon_allocWithZone___block_invoke(uint64_t a1)
{
  ISIconFactory *v1;
  void *v2;

  v1 = +[ISIcon allocWithZone:](ISIconFactory, "allocWithZone:", *(_QWORD *)(a1 + 32));
  v2 = (void *)allocWithZone__iconFactory;
  allocWithZone__iconFactory = (uint64_t)v1;

}

+ (unint64_t)behaviourRevision
{
  return 1000;
}

+ (id)applicationIcon
{
  void *v2;
  ISIcon *v3;
  void *v4;
  ISIcon *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [ISIcon alloc];
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ISIcon initWithBundleIdentifier:](v3, "initWithBundleIdentifier:", v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)genericDocumentIcon
{
  return +[ISGenericDocumentIcon sharedInstance](ISGenericDocumentIcon, "sharedInstance");
}

+ (id)transparentIcon
{
  return +[ISTransparentIcon sharedInstance](ISTransparentIcon, "sharedInstance");
}

- (unint64_t)variantOptions
{
  return 0;
}

- (unint64_t)badgeOptions
{
  return 0;
}

- (NSArray)decorations
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (IFSymbol)symbol
{
  return 0;
}

- (ISIcon)iconWithDecorations:(id)a3
{
  id v4;
  ISDecoratedIcon *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[ISDecoratedIcon initWithIcon:decorations:]([ISDecoratedIcon alloc], "initWithIcon:decorations:", self, v4);

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findOrRegisterIcon:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ISIcon *)v7;
}

- (CGImage)CGImageForImageDescriptor:(id)a3
{
  id v4;
  void *v5;
  CFTypeRef v6;
  CGImage *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  CFTypeRef v12;

  v4 = a3;
  -[ISIcon imageForImageDescriptor:](self, "imageForImageDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "CGImage"))
  {
    v6 = CFRetain((CFTypeRef)objc_msgSend(v5, "CGImage"));
    v7 = (CGImage *)CFAutorelease(v6);
  }
  else
  {
    _ISDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ISIcon CGImageForImageDescriptor:].cold.1();

    v9 = (void *)MEMORY[0x1E0D3A7C0];
    objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_placeholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:", v4, 1, v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "CGImage"))
    {
      v12 = CFRetain((CFTypeRef)objc_msgSend(v11, "CGImage"));
      v7 = (CGImage *)CFAutorelease(v12);
    }
    else
    {
      v7 = 0;
    }
    v5 = v11;
  }

  return v7;
}

- (CGImage)CGImageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  CFTypeRef v6;
  CGImage *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  CFTypeRef v12;

  v4 = a3;
  -[ISIcon imageForDescriptor:](self, "imageForDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "CGImage"))
  {
    v6 = CFRetain((CFTypeRef)objc_msgSend(v5, "CGImage"));
    v7 = (CGImage *)CFAutorelease(v6);
  }
  else
  {
    _ISDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ISIcon CGImageForImageDescriptor:].cold.1();

    v9 = (void *)MEMORY[0x1E0D3A7C0];
    objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_placeholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:", v4, 1, v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "CGImage"))
    {
      v12 = CFRetain((CFTypeRef)objc_msgSend(v11, "CGImage"));
      v7 = (CGImage *)CFAutorelease(v12);
    }
    else
    {
      v7 = 0;
    }
    v5 = v11;
  }

  return v7;
}

- (void)getCGImageForImageDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__ISIcon_getCGImageForImageDescriptor_completion___block_invoke;
  v8[3] = &unk_1E5800900;
  v9 = v6;
  v7 = v6;
  -[ISIcon getImageForImageDescriptor:completion:](self, "getImageForImageDescriptor:completion:", a3, v8);

}

uint64_t __50__ISIcon_getCGImageForImageDescriptor_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "CGImage"));
}

- (double)_aspectRatio
{
  return 1.0;
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  NSObject *v4;

  _ISDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ISIcon _prepareImagesForImageDescriptors:].cold.1((uint64_t)self, v4);

}

- (void)prepareImagesForImageDescriptors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISIcon _beginPrepareISIconSignpost:funcName:](self, "_beginPrepareISIconSignpost:funcName:", v4, "-[ISIcon prepareImagesForImageDescriptors:]");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ISIcon _prepareImagesForImageDescriptors:](self, "_prepareImagesForImageDescriptors:", v4);

  -[ISIcon _endPrepareISIconSignpost:](self, "_endPrepareISIconSignpost:", v5);
}

- (void)prepareImagesForDescriptors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISIcon _beginPrepareISIconSignpost:funcName:](self, "_beginPrepareISIconSignpost:funcName:", v4, "-[ISIcon prepareImagesForDescriptors:]");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ISIcon _prepareImagesForImageDescriptors:](self, "_prepareImagesForImageDescriptors:", v4);

  -[ISIcon _endPrepareISIconSignpost:](self, "_endPrepareISIconSignpost:", v5);
}

- (id)imageForImageDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  _ISDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ISIcon imageForImageDescriptor:].cold.1(v5);

  -[ISIcon prepareImageForDescriptor:](self, "prepareImageForDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_imageForSymbolImageDescriptor:(id)a3
{
  return 0;
}

- (id)imageForDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISIcon imageForImageDescriptor:](self, "imageForImageDescriptor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[ISIcon _imageForSymbolImageDescriptor:](self, "_imageForSymbolImageDescriptor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (ISIconIdentity)_identity
{
  ISImageDescriptor *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", 32.0, 32.0, 1.0);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v4);

  -[ISIcon imageForImageDescriptor:](self, "imageForImageDescriptor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (ISIconIdentity *)v6;
}

+ (BOOL)writeCustomIcon:(id)a3 toURL:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)_prepareImageForImageDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  _ISDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[ISIcon(Workaround) _prepareImageForImageDescriptor:].cold.1(v5);

  -[ISIcon prepareImageForDescriptor:](self, "prepareImageForDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "bitmapData");

  }
  return 0;
}

+ (const)_AttachedResourceInfoKey
{
  return "_kISAttachedResourceInfo";
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  ISImageDescriptor *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", a3.width, a3.height, a4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v6);

  -[ISIcon imageForImageDescriptor:](self, "imageForImageDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)layerUpdateQueue
{
  if (layerUpdateQueue_onceToken != -1)
    dispatch_once(&layerUpdateQueue_onceToken, &__block_literal_global_11);
  return (id)layerUpdateQueue_layerUpdateQueue;
}

void __43__ISIcon_CALayerDelegate__layerUpdateQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("Icon layer update queue", v2);
  v1 = (void *)layerUpdateQueue_layerUpdateQueue;
  layerUpdateQueue_layerUpdateQueue = (uint64_t)v0;

}

- (void)displayLayer:(id)a3
{
  id v4;
  id v5;
  ISIcon *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  ISImageDescriptor *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  ISIcon *v17;
  ISImageDescriptor *v18;
  id v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = self;
    objc_msgSend(v5, "preferredFrameSize");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    objc_msgSend(v5, "contentsScale");
    v11 = v10;
    _ISDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ISIcon(CALayerDelegate) displayLayer:].cold.1((uint64_t)v6, v12);

    v13 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", v9, v9, v11);
    -[ISImageDescriptor setVariantOptions:](v13, "setVariantOptions:", objc_msgSend(v5, "variantOptions"));
    -[ISImageDescriptor setShape:](v13, "setShape:", objc_msgSend(v5, "iconShape"));
    -[ISImageDescriptor setShouldApplyMask:](v13, "setShouldApplyMask:", objc_msgSend(v5, "shouldApplyMask"));
    -[ISImageDescriptor setDrawBorder:](v13, "setDrawBorder:", objc_msgSend(v5, "drawBorder"));
    -[ISIcon imageForImageDescriptor:](v6, "imageForImageDescriptor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContents:", objc_msgSend(v14, "CGImage"));
    if (objc_msgSend(v14, "placeholder"))
    {
      +[ISIcon layerUpdateQueue](ISIcon, "layerUpdateQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__ISIcon_CALayerDelegate__displayLayer___block_invoke;
      block[3] = &unk_1E5800C68;
      v17 = v6;
      v18 = v13;
      v19 = v5;
      dispatch_async(v15, block);

    }
  }

}

void __40__ISIcon_CALayerDelegate__displayLayer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareImagesForImageDescriptors:", v3);

  objc_msgSend(*(id *)(a1 + 32), "imageForImageDescriptor:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setContents:", objc_msgSend(v4, "CGImage"));

}

+ (int)findVariantFromSet:(unint64_t)a3 deviceIdiom:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6
{
  double height;
  double width;
  _LIIconVariantInfo *v10;
  uint64_t v11;
  int v12;
  double *i;
  NSObject *v15;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  height = a5.height;
  width = a5.width;
  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v10 = +[ISIcon variantInfoForSet:count:](ISIcon, "variantInfoForSet:count:", a3, &v19);
  v11 = v19;
  if (!v19)
    return 0;
  v12 = 0;
  for (i = &v10->var2; ; i += 6)
  {
    if (((_QWORD)i[1] & a4) != 0 && *i == a6)
    {
      v12 = *((_DWORD *)i - 6);
      if (*(i - 1) >= height || *(i - 2) >= width)
        break;
    }
    if (!--v11)
      return v12;
  }
  _ISDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18 = *((_QWORD *)i + 2);
    *(_DWORD *)buf = 136315906;
    v21 = v18;
    v22 = 2048;
    v23 = width;
    v24 = 2048;
    v25 = height;
    v26 = 2048;
    v27 = a6;
    _os_log_debug_impl(&dword_1AA928000, v15, OS_LOG_TYPE_DEBUG, "Picked %s for size: (%lf, %lf) scale: %lf", buf, 0x2Au);
  }

  return v12;
}

+ (id)sizesFromSet:(unint64_t)a3
{
  _LIIconVariantInfo *v3;
  void *v4;
  unint64_t v5;
  __int128 *p_var1;
  __int128 v7;
  void *v8;
  void *v9;
  __int128 v11;
  unint64_t v12;

  v12 = 0;
  v3 = +[ISIcon variantInfoForSet:count:](ISIcon, "variantInfoForSet:count:", a3, &v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v5 = 0;
    p_var1 = (__int128 *)&v3->var1;
    do
    {
      v7 = *p_var1;
      p_var1 += 3;
      v11 = v7;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v11, "{CGSize=dd}");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      ++v5;
    }
    while (v12 > v5);
  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

+ (id)templateTypeForType:(id)a3
{
  id v3;

  v3 = a3;
  if (!v3)
    v3 = (id)*MEMORY[0x1E0CA5BA0];
  return v3;
}

+ (id)templateTypeForTag:(id)a3 tagClass:(id)a4
{
  return 0;
}

- (void)CGImageForImageDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_1AA928000, v0, v1, "Failed to create icon image for %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_prepareImagesForImageDescriptors:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_1AA928000, a2, v5, "Should not be here. -_prepareImagesForImageDescriptors: should be overridden by: %s", v6);

}

- (void)imageForImageDescriptor:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "-imageForImageDescriptor: can do IO please adopt -imageForDescriptor: for IO free drawing or -prepareImageForDescriptor: if IO is allowed. (This will become a fault soon.)", v1, 2u);
}

@end

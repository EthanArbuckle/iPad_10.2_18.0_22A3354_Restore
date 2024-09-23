@implementation CKTranscriptPluginViewManager

+ (id)sharedInstance
{
  if (sharedInstance_creation_2 != -1)
    dispatch_once(&sharedInstance_creation_2, &__block_literal_global_256);
  return (id)sharedInstance_sInstance_5;
}

void __47__CKTranscriptPluginViewManager_sharedInstance__block_invoke()
{
  CKTranscriptPluginViewManager *v0;
  void *v1;

  v0 = objc_alloc_init(CKTranscriptPluginViewManager);
  v1 = (void *)sharedInstance_sInstance_5;
  sharedInstance_sInstance_5 = (uint64_t)v0;

}

- (CKTranscriptPluginViewManager)init
{
  CKTranscriptPluginViewManager *v2;
  void *v3;
  CKTranscriptPluginViewManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptPluginViewManager;
  v2 = -[CKTranscriptPluginViewManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didReceiveMemoryWarning, *MEMORY[0x1E0CEB298], 0);

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB298], 0);

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptPluginViewManager;
  -[CKTranscriptPluginViewManager dealloc](&v4, sel_dealloc);
}

- (void)didReceiveMemoryWarning
{
  -[IMMultiDict removeAllObjects](self->_reusablePluginViewsByClassName, "removeAllObjects");
}

- (void)resetState
{
  -[IMMultiDict removeAllObjects](self->_reusablePluginViewsByClassName, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pluginViewToReuseDelegateMap, "removeAllObjects");
}

- (id)dequeuePluginViewForBalloonController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (*v11)(void *);
  void *v13;

  v4 = a3;
  if (-[CKTranscriptPluginViewManager _objectSupportsPluginViewReuse:](self, "_objectSupportsPluginViewReuse:", v4))
  {
    NSStringFromClass((Class)objc_msgSend(v4, "pluginViewClassType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[IMMultiDict dequeueObjectForKey:](self->_reusablePluginViewsByClassName, "dequeueObjectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v4, "createNewPluginView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend((id)objc_opt_class(), "isEqual:", objc_msgSend(v4, "pluginViewClassType")) & 1) == 0)
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          v8 = IMFileLocationTrimFileName();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E276D870);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("[[pluginView class] isEqual:[balloonController pluginViewClassType]]"), "-[CKTranscriptPluginViewManager dequeuePluginViewForBalloonController:]", v8, 58, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = (void (*)(void *))IMGetAssertionFailureHandler();
          if (v11)
          {
            v11(v10);
          }
          else
          {
            v13 = v10;
            _IMWarn();
          }

        }
      }
      -[CKTranscriptPluginViewManager _registerPluginView:withReuseDelegate:](self, "_registerPluginView:withReuseDelegate:", v6, v4, v13);
    }
    else
    {
      _IMWarn();
      v6 = 0;
    }

  }
  else
  {
    _IMWarn();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "createNewPluginView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)_pointerKeyForPluginView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
}

- (BOOL)_objectSupportsPluginViewReuse:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "allowsReusablePluginViews");
  else
    v4 = 0;

  return v4;
}

- (void)_registerPluginView:(id)a3 withReuseDelegate:(id)a4
{
  id v6;
  NSMutableDictionary *pluginViewToReuseDelegateMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    if (-[CKTranscriptPluginViewManager _objectSupportsPluginViewReuse:](self, "_objectSupportsPluginViewReuse:", v6))
    {
      pluginViewToReuseDelegateMap = self->_pluginViewToReuseDelegateMap;
      if (!pluginViewToReuseDelegateMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v9 = self->_pluginViewToReuseDelegateMap;
        self->_pluginViewToReuseDelegateMap = Mutable;

        pluginViewToReuseDelegateMap = self->_pluginViewToReuseDelegateMap;
      }
      -[CKTranscriptPluginViewManager _pointerKeyForPluginView:](self, "_pointerKeyForPluginView:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](pluginViewToReuseDelegateMap, "setObject:forKey:", v6, v10);

    }
  }
  else
  {
    _IMWarn();
  }

}

- (void)enqueuePluginViewForReuse:(id)a3
{
  objc_class *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  IMMultiDict *reusablePluginViewsByClassName;
  IMMultiDict *v10;
  IMMultiDict *v11;
  id v12;

  v12 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v12 && v5)
  {
    -[CKTranscriptPluginViewManager _pointerKeyForPluginView:](self, "_pointerKeyForPluginView:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_pluginViewToReuseDelegateMap, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && -[CKTranscriptPluginViewManager _objectSupportsPluginViewReuse:](self, "_objectSupportsPluginViewReuse:", v8))
    {
      reusablePluginViewsByClassName = self->_reusablePluginViewsByClassName;
      if (reusablePluginViewsByClassName)
        v10 = reusablePluginViewsByClassName;
      else
        v10 = (IMMultiDict *)objc_alloc_init(MEMORY[0x1E0D36A70]);
      v11 = self->_reusablePluginViewsByClassName;
      self->_reusablePluginViewsByClassName = v10;

      -[IMMultiDict enqueueObject:forKey:](self->_reusablePluginViewsByClassName, "enqueueObject:forKey:", v12, v6);
      objc_msgSend(v8, "pluginViewDidEnterReuseQueue:", v12);
      -[NSMutableDictionary removeObjectForKey:](self->_pluginViewToReuseDelegateMap, "removeObjectForKey:", v7);
    }

  }
  else
  {
    _IMWarn();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginViewToReuseDelegateMap, 0);
  objc_storeStrong((id *)&self->_reusablePluginViewsByClassName, 0);
}

@end

@implementation FigCaptureProprietaryDefaults

- (void)setObject:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_lock;
  int v8;
  uint64_t v9;

  if (a4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_changingDefaultsMyself = 1;
    v8 = objc_msgSend(a4, "hasPrefix:", CFSTR("AUVoiceIOClients"));
    v9 = 8;
    if (v8)
      v9 = 16;
    objc_msgSend(*(id *)((char *)&self->super.isa + v9), "setObject:forKey:", a3, a4);
    self->_changingDefaultsMyself = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)observeChangesForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *observedKeys;
  int v7;
  uint64_t v8;

  if (a3)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    observedKeys = self->_observedKeys;
    if (!observedKeys)
    {
      observedKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      self->_observedKeys = observedKeys;
    }
    -[NSMutableSet addObject:](observedKeys, "addObject:", a3);
    os_unfair_lock_unlock(p_lock);
    v7 = objc_msgSend(a3, "hasPrefix:", CFSTR("AUVoiceIOClients"));
    v8 = 8;
    if (v7)
      v8 = 16;
    objc_msgSend(*(id *)((char *)&self->super.isa + v8), "addObserver:forKeyPath:options:context:", self, a3, 3, 0);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (id)objectForKey:(id)a3
{
  int v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    if (self)
    {
      v5 = objc_msgSend(a3, "hasPrefix:", CFSTR("AUVoiceIOClients"));
      v6 = 8;
      if (v5)
        v6 = 16;
      v7 = *(Class *)((char *)&self->super.isa + v6);
    }
    else
    {
      v7 = 0;
    }
    return (id)objc_msgSend(v7, "valueForKey:", a3);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (FigCaptureProprietaryDefaults)initWithDefaultsChangedHandler:(id)a3
{
  FigCaptureProprietaryDefaults *v4;
  objc_super v6;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Need a non-nil defaultsChangedHandler"), 0));
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureProprietaryDefaults;
  v4 = -[FigCaptureProprietaryDefaults init](&v6, sel_init);
  if (v4)
  {
    v4->_videoUserDefaults = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.cameracapture"));
    v4->_audioUserDefaults = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coreaudio"));
    v4->_defaultsChangedHandler = (id)objc_msgSend(a3, "copy");
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_msgSend((id)-[NSMutableSet allObjects](self->_observedKeys, "allObjects"), "copy");
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("AUVoiceIOClients")))
          v10 = 16;
        else
          v10 = 8;
        objc_msgSend(*(id *)((char *)&self->super.isa + v10), "removeObserver:forKeyPath:context:", self, v9, 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)FigCaptureProprietaryDefaults;
  -[FigCaptureProprietaryDefaults dealloc](&v11, sel_dealloc);
}

- (id)objectsForWildcardKey:(id)a3
{
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[6];

  if (a3)
  {
    if (self)
    {
      v5 = objc_msgSend(a3, "hasPrefix:", CFSTR("AUVoiceIOClients"));
      v6 = 8;
      if (v5)
        v6 = 16;
      v7 = *(Class *)((char *)&self->super.isa + v6);
    }
    else
    {
      v7 = 0;
    }
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    v9 = (void *)objc_msgSend(v7, "dictionaryRepresentation");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__FigCaptureProprietaryDefaults_objectsForWildcardKey___block_invoke;
    v11[3] = &unk_1E4920518;
    v11[4] = a3;
    v11[5] = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v8;
}

uint64_t __55__FigCaptureProprietaryDefaults_objectsForWildcardKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = fnmatch((const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), (const char *)objc_msgSend(a2, "UTF8String"), 16);
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", a3, a2);
  return result;
}

- (id)setObject:(id)a3 forWildcardKey:(id)a4
{
  os_unfair_lock_s *p_lock;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[8];

  if (a4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_changingDefaultsMyself = 1;
    v8 = objc_msgSend(a4, "hasPrefix:", CFSTR("AUVoiceIOClients"));
    v9 = 8;
    if (v8)
      v9 = 16;
    v10 = *(Class *)((char *)&self->super.isa + v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v12 = (void *)objc_msgSend(v10, "dictionaryRepresentation");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__FigCaptureProprietaryDefaults_setObject_forWildcardKey___block_invoke;
    v14[3] = &unk_1E4920540;
    v14[4] = a4;
    v14[5] = v10;
    v14[6] = a3;
    v14[7] = v11;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);
    if (!objc_msgSend(v11, "count") && (objc_msgSend(a4, "containsString:", CFSTR("*")) & 1) == 0)
    {
      objc_msgSend(v10, "setObject:forKey:", a3, a4);
      objc_msgSend(v11, "addObject:", a4);
    }
    self->_changingDefaultsMyself = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v11;
}

uint64_t __58__FigCaptureProprietaryDefaults_setObject_forWildcardKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = fnmatch((const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), (const char *)objc_msgSend(a2, "UTF8String"), 16);
  if (!(_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 48), a2);
    return objc_msgSend(*(id *)(a1 + 56), "addObject:", a2);
  }
  return result;
}

- (void)stopObservingChangesForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  int v6;
  int v7;
  uint64_t v8;

  if (a3)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = -[NSMutableSet containsObject:](self->_observedKeys, "containsObject:", a3);
    -[NSMutableSet removeObject:](self->_observedKeys, "removeObject:", a3);
    os_unfair_lock_unlock(p_lock);
    if (v6)
    {
      v7 = objc_msgSend(a3, "hasPrefix:", CFSTR("AUVoiceIOClients"));
      v8 = 8;
      if (v7)
        v8 = 16;
      objc_msgSend(*(id *)((char *)&self->super.isa + v8), "removeObserver:forKeyPath:context:", self, a3, 0);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  os_unfair_lock_s *p_lock;
  int v10;

  if (!self->_changingDefaultsMyself)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v10 = -[NSMutableSet containsObject:](self->_observedKeys, "containsObject:", a3);
    os_unfair_lock_unlock(p_lock);
    if (v10)
    {
      objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
      (*((void (**)(void))self->_defaultsChangedHandler + 2))();
    }
  }
}

- (void)sendNotificationOfNewTransientValue:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_lock;

  if (a4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    (*((void (**)(void))self->_defaultsChangedHandler + 2))();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

@end

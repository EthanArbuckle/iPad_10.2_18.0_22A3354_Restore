@implementation CASecureFlipBookLayer

- (NSString)type
{
  return self->_type;
}

- (NSString)currentState
{
  return self->_currentState;
}

- (NSString)nextState
{
  return self->_nextState;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  SILStateMachineRelease();
  v3.receiver = self;
  v3.super_class = (Class)CASecureFlipBookLayer;
  -[CALayer dealloc](&v3, sel_dealloc);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v7;
  malloc_zone_t *malloc_zone;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CASecureFlipBookLayer;
  v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v16, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v7 && (*((_BYTE *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    v10 = v9;
    if (v9)
    {
      v9[2] = 0;
      *((_DWORD *)v9 + 2) = 1;
      *((_DWORD *)v9 + 3) = 45;
      ++dword_1ECDC7CDC;
      *v9 = off_1E1598340;
    }
    v11 = indicator_id_from_name(-[CASecureFlipBookLayer type](self, "type"));
    if (v11 == -1)
      __assert_rtn("-[CASecureFlipBookLayer _copyRenderLayer:layerFlags:commitFlags:]", "CASecureIndicatorLayer.mm", 258, "type != ~0U");
    *((_DWORD *)v10 + 4) = v11;
    *((_WORD *)v10 + 10) = self->_currentFrame;
    self->_commitedFrame = self->_currentFrame;
    CA::Render::Layer::set_subclass(v7, (CA::Render::LayerSubclass *)v10);
    v12 = (unsigned int *)(v10 + 1);
    do
    {
      v13 = __ldaxr(v12);
      v14 = v13 - 1;
    }
    while (__stlxr(v14, v12));
    if (!v14)
      (*(void (**)(_QWORD *))(*v10 + 16))(v10);
  }
  return v7;
}

- (void)tick:(double)a3
{
  CA::Transaction *v4;
  NSString *v5;
  CA::Transaction *v6;
  NSString *currentState;
  NSObject *v8;
  const char *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (CA::Transaction *)SILStateMachineTick();
  v5 = (NSString *)v4;
  if (self->_currentFrame != self->_commitedFrame)
  {
    v6 = CA::Transaction::ensure_compat(v4);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0x10000);
  }
  currentState = self->_currentState;
  if (currentState != v5 && !-[NSString isEqualToString:](currentState, "isEqualToString:", v5))
  {
    -[CASecureFlipBookLayer willChangeValueForKey:](self, "willChangeValueForKey:", NSStringFromSelector(sel_currentState));
    self->_currentState = v5;
    -[CASecureFlipBookLayer didChangeValueForKey:](self, "didChangeValueForKey:", NSStringFromSelector(sel_currentState));
    if (x_log_hook_p())
    {
      -[NSString UTF8String](self->_currentState, "UTF8String");
      x_log_();
    }
    else
    {
      v8 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_INFO))
      {
        v9 = -[NSString UTF8String](self->_currentState, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v11 = v9;
        _os_log_impl(&dword_184457000, v8, OS_LOG_TYPE_INFO, "SILStateMachine finished transition %s", buf, 0xCu);
      }
    }
  }
}

- (BOOL)validTransitionFromState:(id)a3 toState:(id)a4
{
  return SILStateMachineTransitionSupported();
}

- (BOOL)canTransitionToState:(id)a3
{
  NSString *nextState;
  NSString *currentState;
  _BOOL4 v7;

  nextState = self->_nextState;
  currentState = self->_currentState;
  if (nextState == currentState)
    goto LABEL_4;
  v7 = -[NSString isEqualToString:](self->_nextState, "isEqualToString:", currentState);
  if (v7)
  {
    nextState = self->_currentState;
LABEL_4:
    LOBYTE(v7) = -[CASecureFlipBookLayer validTransitionFromState:toState:](self, "validTransitionFromState:toState:", nextState, a3);
  }
  return v7;
}

- (BOOL)transitionToState:(id)a3
{
  NSString *nextState;
  int v6;
  BOOL v7;

  nextState = self->_nextState;
  if (nextState != self->_currentState)
  {
    v6 = -[NSString isEqualToString:](nextState, "isEqualToString:");
    if (!v6)
      return v6;
    nextState = self->_currentState;
  }
  if (nextState)
    v7 = 1;
  else
    v7 = MEMORY[0x1E0D89808] == 0;
  if (v7)
  {
    v6 = SILStateMachineTransitionToState();
    if (!v6)
      return v6;
    goto LABEL_13;
  }
  v6 = SILStateMachineForceTransitionToState();
  if (v6)
  {
    self->_currentState = (NSString *)a3;
LABEL_13:
    self->_nextState = (NSString *)a3;
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (NSArray)states
{
  return self->_states;
}

+ (id)secureFlipBookWithType:(id)a3
{
  BOOL v3;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1E0D89810])
    v3 = MEMORY[0x1E0D89830] == 0;
  else
    v3 = 1;
  if (v3 || MEMORY[0x1E0D89828] == 0 || MEMORY[0x1E0D89820] == 0 || MEMORY[0x1E0D89800] == 0)
    return 0;
  v16 = *MEMORY[0x1E0D89850];
  v17[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = SILStateMachineCreate();
  if (!v9)
  {
    NSLog(CFSTR("CoreAnimation: Invalid Secure Flipbook type %@"), a3);
    return 0;
  }
  v10 = v9;
  v11 = objc_alloc_init((Class)a1);
  v12 = v11;
  if (v11)
  {
    v11[5] = a3;
    v11[4] = v10;
    v13 = (void *)SILStateMachineStateList();
    v12[9] = v13;
    if (MEMORY[0x1E0D89808])
    {
      v12[7] = 0;
      v12[6] = 0;
    }
    else
    {
      v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v12[7] = v15;
      v12[6] = v15;
    }
  }
  else
  {
    SILStateMachineRelease();
  }
  return v12;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CASecureFlipBookLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

@end

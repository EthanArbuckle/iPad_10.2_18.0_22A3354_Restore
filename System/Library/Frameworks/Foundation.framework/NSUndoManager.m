@implementation NSUndoManager

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
  objc_msgSend((id)qword_1ECD09530, "removeObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  objc_msgSend(self->_proxy, "superRelease");

  -[NSUndoManager _delayAutomaticTermination:](self, "_delayAutomaticTermination:", -1.0);
  v3.receiver = self;
  v3.super_class = (Class)NSUndoManager;
  -[NSUndoManager dealloc](&v3, sel_dealloc);
}

- (void)removeAllActions
{
  unint64_t flags;

  -[_NSUndoStack removeAllObjects](self->_undoStack, "removeAllObjects");
  -[_NSUndoStack removeAllObjects](self->_redoStack, "removeAllObjects");
  flags = self->_flags;
  self->_flags = flags & 0xFCFFFFFFFFLL;
  self->_target = 0;
  if ((flags & 0x1000000000) != 0)
    -[NSUndoManager _cancelAutomaticTopLevelGroupEnding](self, "_cancelAutomaticTopLevelGroupEnding");
  -[NSUndoManager _delayAutomaticTermination:](self, "_delayAutomaticTermination:", -1.0);
}

+ (void)initialize
{
  uint64_t v2;

  if (NSUndoManager == a1)
  {
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("NSUndoManagerDefaultLevelsOfUndo"));
    if (v2)
      defaultLevelsOfUndo = v2;
  }
}

- (NSUndoManager)init
{
  NSUndoManager *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSUndoManager;
  v2 = -[NSUndoManager init](&v4, sel_init);
  v2->_undoStack = -[_NSUndoStack init](+[_NSUndoStack allocWithZone:](_NSUndoStack, "allocWithZone:", -[NSUndoManager zone](v2, "zone")), "init");
  v2->_redoStack = -[_NSUndoStack init](+[_NSUndoStack allocWithZone:](_NSUndoStack, "allocWithZone:", -[NSUndoManager zone](v2, "zone")), "init");
  v2->_flags = 0x4000000000;
  v2->_target = 0;
  v2->_runLoopModes = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99748]);
  -[_NSUndoStack setMax:](v2->_undoStack, "setMax:", defaultLevelsOfUndo);
  return v2;
}

- (NSInteger)groupingLevel
{
  uint64_t v2;

  v2 = 16;
  if ((self->_flags & 0x100000000) == 0)
    v2 = 8;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v2), "nestingLevel");
}

- (void)setGroupsByEvent:(BOOL)groupsByEvent
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!groupsByEvent)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)removeAllActionsWithTarget:(id)target
{
  -[_NSUndoStack removeAllObjectsWithTarget:](self->_undoStack, "removeAllObjectsWithTarget:");
  -[_NSUndoStack removeAllObjectsWithTarget:](self->_redoStack, "removeAllObjectsWithTarget:", target);
}

- (BOOL)canUndo
{
  return -[_NSUndoStack count](self->_undoStack, "count") != 0;
}

- (BOOL)canRedo
{
  -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
  return -[_NSUndoStack count](self->_redoStack, "count") != 0;
}

- (void)_postCheckpointNotification
{
  unint64_t flags;

  flags = self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
    self->_flags = flags | 0x2000000000;
    -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("NSUndoManagerCheckpointNotification"), self);
    self->_flags &= ~0x2000000000uLL;
  }
}

- (void)_scheduleAutomaticTopLevelGroupEnding
{
  NSHashTable *v3;

  if (NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), "performSelector:target:argument:order:modes:", sel__processEndOfEventNotification_, self, 0, 350000, -[NSUndoManager runLoopModes](self, "runLoopModes"));
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
    v3 = (NSHashTable *)qword_1ECD09530;
    if (!qword_1ECD09530)
    {
      v3 = -[NSHashTable initWithOptions:capacity:]([NSHashTable alloc], "initWithOptions:capacity:", 5, 0);
      qword_1ECD09530 = (uint64_t)v3;
    }
    -[NSHashTable addObject:](v3, "addObject:", self);
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  }
  self->_flags |= 0x1000000000uLL;
}

- (void)_cancelAutomaticTopLevelGroupEnding
{
  if (NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), "cancelPerformSelector:target:argument:", sel__processEndOfEventNotification_, self, 0);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
    objc_msgSend((id)qword_1ECD09530, "removeObject:", self);
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  }
  self->_flags &= ~0x1000000000uLL;
}

- (void)_prepareEventGrouping
{
  unint64_t flags;
  BOOL v4;
  uint64_t v5;

  flags = self->_flags;
  if ((flags & 0x5000000000) == 0x4000000000)
  {
    v4 = (flags & 0x100000000) == 0;
    v5 = 16;
    if (v4)
      v5 = 8;
    if (!objc_msgSend(*(id *)((char *)&self->super.isa + v5), "nestingLevel"))
    {
      -[NSUndoManager _scheduleAutomaticTopLevelGroupEnding](self, "_scheduleAutomaticTopLevelGroupEnding");
      -[NSUndoManager beginUndoGrouping](self, "beginUndoGrouping");
    }
  }
}

- (void)beginUndoGrouping
{
  unint64_t flags;
  uint64_t v4;
  void *v5;

  flags = self->_flags;
  if (!(flags >> 40))
  {
    if ((flags & 0x300000000) == 0)
    {
      -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
      flags = self->_flags;
    }
    v4 = 16;
    if ((flags & 0x100000000) == 0)
      v4 = 8;
    v5 = *(Class *)((char *)&self->super.isa + v4);
    if ((flags & 0x4000000000) == 0 || objc_msgSend(*(id *)((char *)&self->super.isa + v4), "nestingLevel"))
      -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
    objc_msgSend(v5, "markBegin");
    if ((self->_flags & 0x300000000) == 0)
      -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("NSUndoManagerDidOpenUndoGroupNotification"), self);
  }
}

- (BOOL)_endUndoGroupRemovingIfEmpty:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  NSString *v14;
  objc_class *v15;
  void *v16;

  v3 = a3;
  v6 = 16;
  if ((self->_flags & 0x100000000) == 0)
    v6 = 8;
  v7 = *(Class *)((char *)&self->super.isa + v6);
  -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
  if (!objc_msgSend(v7, "nestingLevel"))
  {
    v14 = NSStringFromSelector(a2);
    v15 = (objc_class *)objc_opt_class();
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, endUndoGrouping called with no matching begin\n"), v14, NSStringFromClass(v15), self), 0);
    objc_exception_throw(v16);
  }
  v8 = objc_msgSend((id)objc_msgSend(v7, "topUndoObject"), "isBeginMark");
  if ((self->_flags & 0x300000000) == 0)
  {
    if (v3)
      v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8), CFSTR("NSUndoManagerGroupIsEmpty"));
    else
      v9 = 0;
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUndoManagerWillCloseUndoGroupNotification"), self, v9);
  }
  v10 = objc_msgSend(v7, "isDiscardable");
  if ((v8 & v3) == 1)
  {
    objc_msgSend(v7, "popUndoObject");
  }
  else
  {
    v11 = v10;
    if ((_DWORD)v8 && (self->_flags & 0x300000000) == 0)
      -[_NSUndoStack removeAllObjects](self->_redoStack, "removeAllObjects");
    objc_msgSend(v7, "markEnd");
    if ((self->_flags & 0x300000000) == 0)
    {
      if (v11)
        v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("NSUndoManagerGroupIsDiscardableKey"));
      else
        v12 = 0;
      -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUndoManagerDidCloseUndoGroupNotification"), self, v12);
    }
  }
  return v8 ^ 1;
}

- (void)endUndoGrouping
{
  if (!(self->_flags >> 40))
    -[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 0);
}

- (void)disableUndoRegistration
{
  self->_flags += 0x10000000000;
}

- (void)enableUndoRegistration
{
  unint64_t flags;
  NSString *v4;
  objc_class *v5;
  void *v6;

  flags = self->_flags;
  if (!(flags >> 40))
  {
    v4 = NSStringFromSelector(a2);
    v5 = (objc_class *)objc_opt_class();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, enableUndoRegistration may only be invoked with matching call to disableUndoRegistration\n"), v4, NSStringFromClass(v5), self), 0);
    objc_exception_throw(v6);
  }
  self->_flags = flags - 0x10000000000;
}

- (BOOL)isUndoRegistrationEnabled
{
  return self->_flags >> 40 == 0;
}

- (BOOL)groupsByEvent
{
  return (BYTE4(self->_flags) >> 6) & 1;
}

- (void)setLevelsOfUndo:(NSUInteger)levelsOfUndo
{
  -[_NSUndoStack setMax:](self->_undoStack, "setMax:", levelsOfUndo);
}

- (NSUInteger)levelsOfUndo
{
  return -[_NSUndoStack max](self->_undoStack, "max");
}

- (void)setRunLoopModes:(NSArray *)runLoopModes
{
  NSArray *v3;

  v3 = self->_runLoopModes;
  self->_runLoopModes = (NSArray *)-[NSArray copyWithZone:](runLoopModes, "copyWithZone:", -[NSUndoManager zone](self, "zone"));

}

- (NSArray)runLoopModes
{
  return self->_runLoopModes;
}

- (void)undo
{
  NSString *v4;
  objc_class *v5;
  void *v6;

  -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
  if ((self->_flags & 0x1000000000) != 0 && -[_NSUndoStack nestingLevel](self->_undoStack, "nestingLevel") == 1)
  {
    -[NSUndoManager endUndoGrouping](self, "endUndoGrouping");
    -[NSUndoManager _cancelAutomaticTopLevelGroupEnding](self, "_cancelAutomaticTopLevelGroupEnding");
  }
  if (-[_NSUndoStack nestingLevel](self->_undoStack, "nestingLevel"))
  {
    v4 = NSStringFromSelector(a2);
    v5 = (objc_class *)objc_opt_class();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, undo was called with too many nested undo groups"), v4, NSStringFromClass(v5), self), 0);
    objc_exception_throw(v6);
  }
  -[NSUndoManager undoNestedGroup](self, "undoNestedGroup");
}

- (void)undoNestedGroup
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSString *v7;
  objc_class *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
  self->_flags |= 0x100000000uLL;
  v4 = -[_NSUndoStack topUndoObject](self->_undoStack, "topUndoObject");
  if (v4)
  {
    if ((objc_msgSend(v4, "isEndMark") & 1) == 0)
    {
      self->_flags &= ~0x100000000uLL;
      v7 = NSStringFromSelector(a2);
      v8 = (objc_class *)objc_opt_class();
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, call endUndoGrouping before calling this method\n"), v7, NSStringFromClass(v8), self), 0);
      objc_exception_throw(v9);
    }
    -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("NSUndoManagerWillUndoChangeNotification"), self);
    -[NSUndoManager beginUndoGrouping](self, "beginUndoGrouping");
    v5 = -[_NSUndoStack isDiscardable](self->_undoStack, "isDiscardable");
    if (!(self->_flags >> 40))
    {
      -[_NSUndoStack setGroupIdentifier:](self->_redoStack, "setGroupIdentifier:", -[_NSUndoStack groupIdentifier](self->_undoStack, "groupIdentifier"));
      if (!(self->_flags >> 40))
      {
        -[_NSUndoStack setUserInfo:](self->_redoStack, "setUserInfo:", -[_NSUndoStack userInfo](self->_undoStack, "userInfo"));
        if (!(self->_flags >> 40))
          -[_NSUndoStack setDiscardable:](self->_redoStack, "setDiscardable:", v5);
      }
    }
    -[_NSUndoStack popAndInvoke](self->_undoStack, "popAndInvoke");
    if (!(self->_flags >> 40))
      -[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 1);
    if (v5)
    {
      v10 = CFSTR("NSUndoManagerGroupIsDiscardableKey");
      v11[0] = MEMORY[0x1E0C9AAB0];
      v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    }
    else
    {
      v6 = 0;
    }
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUndoManagerDidUndoChangeNotification"), self, v6);
  }
  self->_flags &= ~0x100000000uLL;
}

- (void)redo
{
  -[NSUndoManager __redoCommonDoSingle:](self, "__redoCommonDoSingle:", 0);
}

- (void)__redoSingle
{
  -[NSUndoManager __redoCommonDoSingle:](self, "__redoCommonDoSingle:", 1);
}

- (void)__redoCommonDoSingle:(BOOL)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  NSString *v8;
  objc_class *v9;
  void *v10;

  if (-[NSUndoManager canRedo](self, "canRedo", a3))
  {
    self->_flags |= 0x200000000uLL;
    v5 = -[_NSUndoStack topUndoObject](self->_redoStack, "topUndoObject");
    if (v5)
    {
      if ((objc_msgSend(v5, "isEndMark") & 1) == 0)
      {
        self->_flags &= ~0x200000000uLL;
        v8 = NSStringFromSelector(a2);
        v9 = (objc_class *)objc_opt_class();
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, do not invoke this method while undoing\n"), v8, NSStringFromClass(v9), self), 0);
        objc_exception_throw(v10);
      }
      -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("NSUndoManagerWillRedoChangeNotification"), self);
      -[NSUndoManager beginUndoGrouping](self, "beginUndoGrouping");
      v6 = -[_NSUndoStack isDiscardable](self->_redoStack, "isDiscardable");
      if (!(self->_flags >> 40))
      {
        -[_NSUndoStack setGroupIdentifier:](self->_undoStack, "setGroupIdentifier:", -[_NSUndoStack groupIdentifier](self->_redoStack, "groupIdentifier"));
        if (!(self->_flags >> 40))
        {
          -[_NSUndoStack setUserInfo:](self->_undoStack, "setUserInfo:", -[_NSUndoStack userInfo](self->_redoStack, "userInfo"));
          if (!(self->_flags >> 40))
            -[_NSUndoStack setDiscardable:](self->_undoStack, "setDiscardable:", v6);
        }
      }
      -[_NSUndoStack popAndInvoke](self->_redoStack, "popAndInvoke");
      -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
      -[NSUndoManager endUndoGrouping](self, "endUndoGrouping");
      if (v6)
        v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("NSUndoManagerGroupIsDiscardableKey"));
      else
        v7 = 0;
      -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSUndoManagerDidRedoChangeNotification"), self, v7);
    }
    self->_flags &= ~0x200000000uLL;
  }
}

- (unint64_t)undoCount
{
  return -[_NSUndoStack topLevelGroupCount](self->_undoStack, "topLevelGroupCount");
}

- (unint64_t)redoCount
{
  return -[_NSUndoStack topLevelGroupCount](self->_redoStack, "topLevelGroupCount");
}

- (BOOL)isUndoing
{
  return BYTE4(self->_flags) & 1;
}

- (BOOL)isRedoing
{
  return (BYTE4(self->_flags) >> 1) & 1;
}

- (id)prepareWithInvocationTarget:(id)target
{
  NSUndoManagerProxy *proxy;

  self->_target = target;
  proxy = (NSUndoManagerProxy *)self->_proxy;
  if (!proxy)
  {
    proxy = -[NSUndoManagerProxy initWithManager:]([NSUndoManagerProxy alloc], "initWithManager:", self);
    self->_proxy = proxy;
  }
  -[NSUndoManagerProxy setTargetClass:](proxy, "setTargetClass:", objc_opt_class());
  return self->_proxy;
}

- (id)_methodSignatureForTargetSelector:(SEL)a3
{
  id result;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSUndoManager;
  result = -[NSUndoManager methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    result = self->_target;
    if (result)
      return (id)objc_msgSend(result, "methodSignatureForSelector:", a3);
  }
  return result;
}

- (void)_registerUndoObject:(id)a3
{
  unint64_t flags;
  uint64_t v6;
  void *v7;
  NSString *v8;
  objc_class *v9;
  void *v10;

  flags = self->_flags;
  if (flags >> 40)
  {

  }
  else
  {
    if ((flags & 0x300000000) == 0)
      -[_NSUndoStack removeAllObjects](self->_redoStack, "removeAllObjects");
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    v6 = 16;
    if ((self->_flags & 0x100000000) == 0)
      v6 = 8;
    v7 = *(Class *)((char *)&self->super.isa + v6);
    if (!objc_msgSend(v7, "nestingLevel"))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, must begin a group before registering undo\n"), v8, NSStringFromClass(v9), self), 0);
      objc_exception_throw(v10);
    }
    objc_msgSend(v7, "push:", a3);
    if (-[NSUndoManager groupsByEvent](self, "groupsByEvent"))
      -[NSUndoManager _delayAutomaticTermination:](self, "_delayAutomaticTermination:", 28800.0);
  }
}

- (void)_forwardTargetInvocation:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;

  if (!self->_target)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p received forwarded invocation while invocation target is nil. Call prepareWithInvocationTarget: before invoking %@"), CFSTR("forwardInvocation:"), v6, self, NSStringFromSelector((SEL)objc_msgSend(a3, "selector"))), 0);
    objc_exception_throw(v7);
  }
  objc_msgSend(a3, "setTarget:", 0);
  -[NSUndoManager _registerUndoObject:](self, "_registerUndoObject:", objc_msgSend(objc_allocWithZone((Class)_NSUndoInvocation), "initWithTarget:invocation:", self->_target, a3));
  self->_target = 0;
}

- (void)registerUndoWithTarget:(id)target selector:(SEL)selector object:(id)anObject
{
  -[NSUndoManager _registerUndoObject:](self, "_registerUndoObject:", objc_msgSend(objc_allocWithZone((Class)_NSUndoLightInvocation), "initWithTarget:selector:object:", target, selector, anObject));
}

- (void)registerUndoWithTarget:(id)target handler:(void *)undoHandler
{
  _NSUndoBlockInvocation *v5;
  NSString *v6;

  if (!target)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** %s: targetcannot be nil"), undoHandler, "-[NSUndoManager registerUndoWithTarget:handler:]");
    goto LABEL_8;
  }
  if (!undoHandler)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** %s: handlercannot be nil"), 0, "-[NSUndoManager registerUndoWithTarget:handler:]");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  }
  v5 = -[_NSUndoBlockInvocation initWithTarget:handler:]([_NSUndoBlockInvocation alloc], "initWithTarget:handler:", target, undoHandler);
  if (v5)
    -[NSUndoManager _registerUndoObject:](self, "_registerUndoObject:", v5);
}

- (NSString)undoActionName
{
  NSString *result;

  result = -[_NSUndoStack groupIdentifier](self->_undoStack, "groupIdentifier");
  if (!result)
    return (NSString *)&stru_1E0F56070;
  return result;
}

- (NSString)redoActionName
{
  NSString *result;

  result = -[_NSUndoStack groupIdentifier](self->_redoStack, "groupIdentifier");
  if (!result)
    return (NSString *)&stru_1E0F56070;
  return result;
}

- (void)_setGroupIdentifier:(id)a3
{
  uint64_t v6;
  void *v7;
  NSString *v8;
  objc_class *v9;
  void *v10;

  if (a3 && !(self->_flags >> 40))
  {
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    v6 = 16;
    if ((self->_flags & 0x100000000) == 0)
      v6 = 8;
    v7 = *(Class *)((char *)&self->super.isa + v6);
    if (!objc_msgSend(v7, "nestingLevel"))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, must begin a group before registering undo\n"), v8, NSStringFromClass(v9), self), 0);
      objc_exception_throw(v10);
    }
    objc_msgSend(v7, "setGroupIdentifier:", a3);
  }
}

- (void)setActionIsDiscardable:(BOOL)discardable
{
  _BOOL8 v3;
  uint64_t v6;
  void *v7;
  NSString *v8;
  objc_class *v9;
  void *v10;

  if (!(self->_flags >> 40))
  {
    v3 = discardable;
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    v6 = 16;
    if ((self->_flags & 0x100000000) == 0)
      v6 = 8;
    v7 = *(Class *)((char *)&self->super.isa + v6);
    if (!objc_msgSend(v7, "nestingLevel"))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, must begin a group before setting undo action discardability\n"), v8, NSStringFromClass(v9), self), 0);
      objc_exception_throw(v10);
    }
    objc_msgSend(v7, "setDiscardable:", v3);
  }
}

- (BOOL)undoActionIsDiscardable
{
  return -[_NSUndoStack isDiscardable](self->_undoStack, "isDiscardable");
}

- (BOOL)redoActionIsDiscardable
{
  return -[_NSUndoStack isDiscardable](self->_redoStack, "isDiscardable");
}

- (void)setActionUserInfoValue:(id)a3 forKey:(id)a4
{
  uint64_t v8;
  void *v9;
  NSString *v10;
  objc_class *v11;
  void *v12;

  if (!(self->_flags >> 40))
  {
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    v8 = 16;
    if ((self->_flags & 0x100000000) == 0)
      v8 = 8;
    v9 = *(Class *)((char *)&self->super.isa + v8);
    if (!objc_msgSend(v9, "nestingLevel"))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (objc_class *)objc_opt_class();
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ %p is in invalid state, must begin a group before setting undo action user info\n"), v10, NSStringFromClass(v11), self), 0);
      objc_exception_throw(v12);
    }
    if (objc_msgSend(v9, "userInfo"))
      objc_msgSend((id)objc_msgSend(v9, "userInfo"), "setObject:forKey:", a3, a4);
    else
      objc_msgSend(v9, "setUserInfo:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, a4, 0));
  }
}

- (id)undoActionUserInfoValueForKey:(id)a3
{
  return (id)objc_msgSend(-[_NSUndoStack userInfo](self->_undoStack, "userInfo"), "objectForKey:", a3);
}

- (id)redoActionUserInfoValueForKey:(id)a3
{
  return (id)objc_msgSend(-[_NSUndoStack userInfo](self->_redoStack, "userInfo"), "objectForKey:", a3);
}

- (NSString)undoMenuItemTitle
{
  NSString *v3;

  if (-[NSUndoManager canUndo](self, "canUndo")
    && (v3 = -[NSUndoManager undoActionName](self, "undoActionName"),
        !-[NSString isEqual:](v3, "isEqual:", &stru_1E0F56070)))
  {
    return -[NSUndoManager undoMenuTitleForUndoActionName:](self, "undoMenuTitleForUndoActionName:", v3);
  }
  else
  {
    return (NSString *)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("Undo"), &stru_1E0F56070, CFSTR("Undo"));
  }
}

- (NSString)redoMenuItemTitle
{
  NSString *v3;

  if (-[NSUndoManager canRedo](self, "canRedo")
    && (v3 = -[NSUndoManager redoActionName](self, "redoActionName"),
        !-[NSString isEqual:](v3, "isEqual:", &stru_1E0F56070)))
  {
    return -[NSUndoManager redoMenuTitleForUndoActionName:](self, "redoMenuTitleForUndoActionName:", v3);
  }
  else
  {
    return (NSString *)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("Redo"), &stru_1E0F56070, CFSTR("Undo"));
  }
}

- (NSString)undoMenuTitleForUndoActionName:(NSString *)actionName
{
  const __CFString *v4;

  v4 = (const __CFString *)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("Undo %@"), &stru_1E0F56070, CFSTR("Undo"));
  return (NSString *)(id)CFStringCreateWithFormat(0, 0, v4, actionName);
}

- (NSString)redoMenuTitleForUndoActionName:(NSString *)actionName
{
  const __CFString *v4;

  v4 = (const __CFString *)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("Redo %@"), &stru_1E0F56070, CFSTR("Undo"));
  return (NSString *)(id)CFStringCreateWithFormat(0, 0, v4, actionName);
}

- (id)_undoStack
{
  return self->_undoStack;
}

- (BOOL)_shouldCoalesceTypingForText:(id)a3 :(id)a4
{
  uint64_t v6;
  _QWORD *v7;

  v6 = objc_msgSend(-[NSUndoManager _undoStack](self, "_undoStack"), "topUndoObject");
  if (v6)
  {
    v7 = (_QWORD *)v6;
    while ((id)objc_msgSend(v7, "target") != a4
         || object_getClass(v7) != (Class)_NSUndoLightInvocation
         || (id)objc_msgSend(v7, "_argument") != a3)
    {
      LODWORD(v6) = objc_msgSend(v7, "isEndMark");
      if (!(_DWORD)v6)
        return v6;
      v7 = (_QWORD *)v7[1];
      if (!v7)
      {
        LOBYTE(v6) = 0;
        return v6;
      }
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

+ (void)_setEndsTopLevelGroupingsAfterRunLoopIterations:(BOOL)a3
{
  NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations = a3;
}

- (void)_processEndOfEventNotification:(id)a3
{
  unint64_t flags;

  flags = self->_flags;
  if ((~flags & 0x5000000000) == 0)
  {
    self->_flags = flags & 0xFFFFFFEFFFFFFFFFLL;
    -[NSUndoManager endUndoGrouping](self, "endUndoGrouping", a3);
  }
}

+ (void)_endTopLevelGroupings
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSUndoManager.m"), 1158, CFSTR("+[NSUndoManager(NSInternal) _endTopLevelGroupings] is only safe to invoke on the main thread."));
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
  v4 = (void *)qword_1ECD09530;
  qword_1ECD09530 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_processEndOfEventNotification:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }

}

- (void)_commitUndoGrouping
{
  if (!(self->_flags >> 40))
    -[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 1);
}

- (void)_rollbackUndoGrouping
{
  if (!(self->_flags >> 40))
  {
    if (-[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 1))
    {
      -[NSUndoManager disableUndoRegistration](self, "disableUndoRegistration");
      -[NSUndoManager undoNestedGroup](self, "undoNestedGroup");
      -[NSUndoManager enableUndoRegistration](self, "enableUndoRegistration");
    }
  }
}

@end

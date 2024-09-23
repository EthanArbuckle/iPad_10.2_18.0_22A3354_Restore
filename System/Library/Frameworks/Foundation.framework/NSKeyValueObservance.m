@implementation NSKeyValueObservance

- (unint64_t)hash
{
  unint64_t v2;
  unsigned __int8 *v3;
  unint64_t i;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v2 = self;
  LODWORD(self) = 0;
  v13 = *MEMORY[0x1E0C80C00];
  v10 = *(_OWORD *)(v2 + 8);
  v11 = *(_BYTE *)(v2 + 40) & 0xF;
  v12 = *(_OWORD *)(v2 + 24);
  v3 = (unsigned __int8 *)&v10 + 3;
  for (i = 44; i > 7; i -= 4)
  {
    v5 = *(v3 - 3) + 16 * self;
    v6 = *(v3 - 2) + 16 * (v5 ^ (16 * (v5 >> 28)));
    v7 = *(v3 - 1) + 16 * (v6 ^ (16 * (v6 >> 28)));
    v8 = *v3;
    v3 += 4;
    v9 = v8 + 16 * (v7 ^ (16 * (v7 >> 28)));
    self = (v9 ^ ((v9 & 0xF0000000) >> 24)) & ~(v9 & 0xF0000000);
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  return self->_observer == *((_QWORD *)a3 + 1)
      && self->_property == (NSKeyValueProperty *)*((_QWORD *)a3 + 2)
      && ((*((_BYTE *)a3 + 40) ^ *((_BYTE *)self + 40)) & 0xF) == 0
      && self->_context == (void *)*((_QWORD *)a3 + 3)
      && self->_originalObservableOrUnownedObserver.originalObservable == *((_QWORD *)a3 + 4);
}

- (id)_initWithObserver:(id)a3 property:(id)a4 options:(unint64_t)a5 context:(void *)a6 originalObservable:(id)a7
{
  char v9;
  NSKeyValueObservance *v12;
  NSKeyValueObservance *v13;
  id inited;
  char v15;
  char v16;
  __objc2_class *Class;
  char v18;
  char v19;
  objc_super v21;
  uint64_t v22;

  v9 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)NSKeyValueObservance;
  v12 = -[NSKeyValueObservance init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    inited = objc_initWeakOrNil((id *)&v12->_observer, a3);
    v15 = *((_BYTE *)v13 + 40);
    if (inited)
    {
      v16 = v15 | 0x10;
    }
    else
    {
      v16 = v15 & 0xEF;
      v13->_observer = a3;
    }
    *((_BYTE *)v13 + 40) = v16 & 0xF0 | v9 & 0xB;
    v13->_property = (NSKeyValueProperty *)a4;
    v13->_context = a6;
    Class = (__objc2_class *)object_getClass(a3);
    if (Class == NSKeyValueObservance
      || _NSKVONotifyingOriginalClassForIsa((objc_class *)Class) == (objc_class *)NSKeyValueObservance)
    {
      *((_BYTE *)v13 + 40) |= 0x20u;
      if (!a7)
        __assert_rtn("-[NSKeyValueObservance _initWithObserver:property:options:context:originalObservable:]", "NSKeyValueObservationInfo.m", 360, "inOriginalObservableOrNil");
    }
    else
    {
      *((_BYTE *)v13 + 40) &= ~0x20u;
      a7 = a3;
    }
    v13->_originalObservableOrUnownedObserver.originalObservable = a7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = 0;
    else
      v18 = 64;
    *((_BYTE *)v13 + 40) = *((_BYTE *)v13 + 40) & 0xBF | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 0x80;
    else
      v19 = 0;
    *((_BYTE *)v13 + 40) = v19 & 0x80 | *((_BYTE *)v13 + 40) & 0x7F;
  }
  return v13;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  _BOOL4 v13;
  NSObject *originalObservable;
  __objc2_class *Class;
  void *v16;
  id *v17;
  char v18;
  uint64_t v19;

  v7 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a5, "objectForKey:", 0x1E0F61DF0, a4);
  if (v9)
  {
    v10 = (void *)v9;
    if (a6)
    {
      v18 = 0;
      v11 = objc_msgSend(a6, "dependentValueKeyOrKeysIsASet:", &v18);
      v12 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("notificationIsPrior")), "BOOLValue");
      v13 = v18 != 0;
      if (v12)
        NSKeyValueWillChangeWithPerThreadPendingNotifications(v10, v11, v13, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))NSKeyValueWillChangeBySetting, 0, (uint64_t)self);
      else
        NSKeyValueDidChangeWithPerThreadPendingNotifications(v10, v11, v13, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting, (uint64_t)self);
    }
    else
    {
      v17 = -[NSKeyValueObservance retainedObserver]((id *)&self->super.isa);
      if (v17)
      {
        if (self && (*((_BYTE *)self + 40) & 0x20) != 0)
          originalObservable = self->_originalObservableOrUnownedObserver.originalObservable;
        else
          originalObservable = 0;
        Class = (__objc2_class *)object_getClass(v7);
        if (Class == NSKeyValueChangeDictionary)
        {
          objc_msgSend(v7, "setOriginalObservable:", originalObservable);
        }
        else
        {
          v16 = (void *)objc_msgSend(v7, "mutableCopy");
          v7 = v16;
          if (originalObservable)
            objc_msgSend(v16, "setObject:forKey:", originalObservable, 0x1E0F61DF0);
          else
            objc_msgSend(v16, "removeObjectForKey:", 0x1E0F61DF0);
        }
        NSKVONotify(v17, (uint64_t)-[NSKeyValueProperty keyPath](self->_property, "keyPath"), (uint64_t)v10, (uint64_t)v7, (uint64_t)self->_context);
        if (Class != NSKeyValueChangeDictionary)

      }
    }
  }
}

- (id)retainedObserver
{
  id *v1;
  id v2;

  if (result)
  {
    v1 = result + 1;
    result = (id *)objc_loadWeakRetained(result + 1);
    if (!result)
    {
      if (_NSKVOIsObservableBeingDeallocated(*v1))
      {
        v2 = *v1;
        return (id *)*v1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (id)description
{
  uint64_t v3;
  NSObject *observer;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = objc_opt_class();
  observer = self->_observer;
  v5 = -[NSKeyValueProperty keyPath](self->_property, "keyPath");
  if ((*((_BYTE *)self + 40) & 1) != 0)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if ((*((_BYTE *)self + 40) & 2) != 0)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if ((*((_BYTE *)self + 40) & 8) != 0)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: Observer: %p, Key path: %@, Options: <New: %@, Old: %@, Prior: %@> Context: %p, Property: %p>"), v3, self, observer, v5, v6, v7, v8, self->_context, self->_property);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 40) & 0x10) != 0)
    objc_destroyWeak((id *)&self->_observer);
  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueObservance;
  -[NSKeyValueObservance dealloc](&v3, sel_dealloc);
}

@end

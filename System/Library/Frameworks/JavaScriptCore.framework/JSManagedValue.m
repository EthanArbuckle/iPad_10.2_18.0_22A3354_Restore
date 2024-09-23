@implementation JSManagedValue

+ (JSManagedValue)managedValueWithValue:(JSValue *)value
{
  return (JSManagedValue *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", value));
}

+ (JSManagedValue)managedValueWithValue:(JSValue *)value andOwner:(id)owner
{
  const void *v6;

  v6 = (const void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", value);
  -[JSVirtualMachine addManagedReference:withOwner:](-[JSContext virtualMachine](-[JSValue context](value, "context"), "virtualMachine"), "addManagedReference:withOwner:", v6, owner);
  return (JSManagedValue *)(id)CFMakeCollectable(v6);
}

- (JSManagedValue)init
{
  return -[JSManagedValue initWithValue:](self, "initWithValue:", 0);
}

- (JSManagedValue)initWithValue:(JSValue *)value
{
  JSManagedValue *v4;
  JSManagedValue *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WeakImpl *v14;
  WeakImpl *m_impl;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *m_ptr;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  OpaqueJSValue *m_value;
  const OpaqueJSValue *v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  OpaqueJSContext *v50;
  _QWORD *v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)JSManagedValue;
  v4 = -[JSManagedValue init](&v52, sel_init);
  v5 = v4;
  if (!value || !v4)
    return v5;
  v6 = -[JSContext JSGlobalContextRef](-[JSValue context](value, "context"), "JSGlobalContextRef");
  if ((byte_1ECF58529 & 1) == 0)
  {
    qword_1ECF58538 = &off_1E357B4D0;
    byte_1ECF58529 = 1;
    if (!v6)
      goto LABEL_5;
LABEL_27:
    if ((v6 & 8) != 0)
      v35 = (v6 - 112) | 1;
    else
      v35 = v6 & 0xFFFFFFFFFFFFC000;
    if ((v35 & 1) != 0)
      v36 = v35 + 47;
    else
      v36 = *(_QWORD *)v35 + 32;
    v14 = *(WeakImpl **)(v36 + 16);
    if (!v14)
    {
      v49 = v35;
      v50 = (OpaqueJSContext *)v6;
      v51 = (_QWORD *)v36;
      while (1)
      {
        v37 = *(_QWORD **)(v36 + 24);
        if (!v37)
          break;
        v36 = (uint64_t)v51;
        v51[3] = v37[2];
        v14 = (WeakImpl *)v37[4];
        v37[3] = 257;
        v37[4] = 0;
        if (v14)
          goto LABEL_33;
      }
      v38 = v51[6];
      if (!v51[1])
      {
        v39 = *(_QWORD **)(v38 + 488);
        *v51 = v38 + 480;
        v51[1] = v39;
        *v39 = v51;
        *(_QWORD *)(v38 + 488) = v51;
      }
      *(_QWORD *)(v38 + 1072) += 1024;
      v40 = (_QWORD *)WTF::fastMalloc((WTF *)0x400);
      JSC::WeakBlock::WeakBlock((uint64_t)v40, v49);
      JSC::Heap::didAllocate((JSC::Heap *)(v51[6] + 192), 0x400uLL, v41, v42, v43, v44, v45, v46);
      v36 = (uint64_t)v51;
      v47 = v51 + 4;
      v48 = v51[5];
      if (v48)
        v47 = (_QWORD *)(v48 + 16);
      *v47 = v40;
      v51[5] = v40;
      v40[1] = v48;
      v40[2] = 0;
      v14 = (WeakImpl *)v40[4];
      v40[3] = 257;
      v40[4] = 0;
      v6 = (unint64_t)v50;
    }
LABEL_33:
    *(_QWORD *)(v36 + 16) = *(_QWORD *)v14;
    *(_QWORD *)v14 = v6;
    *((_QWORD *)v14 + 1) = &qword_1ECF58538;
    *((_QWORD *)v14 + 2) = v5;
    goto LABEL_6;
  }
  if (v6)
    goto LABEL_27;
LABEL_5:
  v14 = 0;
LABEL_6:
  m_impl = v5->m_globalObject.m_impl;
  v5->m_globalObject.m_impl = v14;
  v16 = *(unsigned int **)(*(_QWORD *)(v6 + 56) + 112);
  if (v16)
  {
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 + 1, v16));
  }
  m_ptr = (unsigned int *)v5->m_lock.m_ptr;
  v5->m_lock.m_ptr = (JSLock *)v16;
  if (m_ptr)
  {
    do
    {
      v19 = __ldaxr(m_ptr);
      v20 = v19 - 1;
    }
    while (__stlxr(v20, m_ptr));
    if (!v20)
    {
      atomic_store(1u, m_ptr);
      JSC::JSLock::~JSLock((JSC::JSLock *)m_ptr, v7, v8, v9, v10, v11, v12, v13);
      WTF::fastFree(v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 1282, 1);
  m_value = v5->m_weakValue.m_value.primitive.m_value;
  v5->m_weakValue.m_value.primitive.m_value = (OpaqueJSValue *)v21;
  if (m_value)
    CFRelease(m_value);
  v23 = -[JSValue JSValueRef](value, "JSValueRef");
  if (v23)
    v24 = (unint64_t)v23;
  else
    v24 = 2;
  if ((v24 & 0xFFFE000000000002) != 0)
    goto LABEL_22;
  v25 = *(unsigned __int8 *)(v24 + 5);
  if (v25 >= 0x17)
  {
    JSC::JSWeakValue::setObject((uint64_t)&v5->m_weakValue, v24, (JSC::WeakHandleOwner *)&qword_1ECF58538, v5);
    goto LABEL_23;
  }
  if (v25 != 2)
  {
LABEL_22:
    v5->m_weakValue.m_tag = 1;
    v5->m_weakValue.m_value.primitive.super.isa = (Class)v24;
  }
  else
  {
    JSC::JSWeakValue::setString((JSC::JSWeakValue *)&v5->m_weakValue, v24, (JSC::WeakHandleOwner *)&qword_1ECF58538, (unint64_t)v5);
  }
LABEL_23:
  if (m_impl)
    *((_QWORD *)m_impl + 1) = 3;
  return v5;
}

- (void)dealloc
{
  JSVirtualMachine *v3;
  JSVirtualMachine *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const void *v10;
  char *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[JSContext virtualMachine](-[JSValue context](-[JSManagedValue value](self, "value"), "context"), "virtualMachine");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)-[OpaqueJSValue copy](self->m_weakValue.m_value.primitive.m_value, "copy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_msgSend(v5, "keyEnumerator");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(const void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v11 = (char *)NSMapGet((NSMapTable *)self->m_weakValue.m_value.primitive.m_value, v10) + 1;
          while (--v11)
            -[JSVirtualMachine removeManagedReference:withOwner:](v4, "removeManagedReference:withOwner:", self, v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    if (v5)
      CFRelease(v5);
  }
  -[JSManagedValue disconnectValue](self, "disconnectValue");
  v12.receiver = self;
  v12.super_class = (Class)JSManagedValue;
  -[JSManagedValue dealloc](&v12, sel_dealloc);
}

- (void)didAddOwner:(id)a3
{
  char *v5;

  v5 = (char *)NSMapGet((NSMapTable *)self->m_weakValue.m_value.primitive.m_value, a3) + 1;
  NSMapInsert((NSMapTable *)self->m_weakValue.m_value.primitive.m_value, a3, v5);
}

- (void)didRemoveOwner:(id)a3
{
  char *v5;

  v5 = (char *)NSMapGet((NSMapTable *)self->m_weakValue.m_value.primitive.m_value, a3);
  if (v5)
  {
    if (v5 == (char *)1)
      NSMapRemove((NSMapTable *)self->m_weakValue.m_value.primitive.m_value, a3);
    else
      NSMapInsert((NSMapTable *)self->m_weakValue.m_value.primitive.m_value, a3, v5 - 1);
  }
}

- (JSValue)value
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  JSLock *m_ptr;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  JSC::VM *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  WeakImpl *m_impl;
  JSValue *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  int v38;
  Class isa;
  JSContext *v40;
  Class v41;
  Class v42;
  unsigned int *v43;

  m_ptr = self->m_lock.m_ptr;
  if (!m_ptr)
    return 0;
  JSC::JSLock::lock((JSC::JSLock *)self->m_lock.m_ptr, (void *)a2, v2, v3, v4, v5, v6, v7);
  v17 = (JSC::VM *)*((_QWORD *)self->m_lock.m_ptr + 4);
  if (v17)
  {
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v43, v17, v10, v11, v12, v13, v14, v15, v16);
    m_impl = self->m_globalObject.m_impl;
    if (m_impl && (v19 = *(_QWORD *)m_impl) != 0 && (*((_BYTE *)m_impl + 8) & 3) == 0)
    {
      v26 = 0;
      switch(self->m_weakValue.m_tag)
      {
        case 0:
          break;
        case 1:
          if (self->m_weakValue.m_value.primitive.super.isa)
            goto LABEL_29;
          goto LABEL_6;
        case 2:
        case 3:
          isa = self->m_weakValue.m_value.primitive.super.isa;
          if (!isa || !*(_QWORD *)isa || (*((_BYTE *)isa + 8) & 3) != 0)
            goto LABEL_6;
LABEL_29:
          v40 = +[JSContext contextWithJSGlobalContextRef:](JSContext, "contextWithJSGlobalContextRef:");
          if (self->m_weakValue.m_tag == 1)
          {
            v41 = self->m_weakValue.m_value.primitive.super.isa;
          }
          else
          {
            v42 = self->m_weakValue.m_value.primitive.super.isa;
            if (!v42 || (*((_BYTE *)v42 + 8) & 3) != 0)
              v41 = 0;
            else
              v41 = *(Class *)v42;
          }
          v26 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v41, v40);
          break;
        default:
          goto LABEL_36;
      }
    }
    else
    {
LABEL_6:
      v26 = 0;
    }
    JSC::JSLockHolder::~JSLockHolder(&v43, v18, v19, v20, v21, v22, v23, v24);
  }
  else
  {
    v26 = 0;
  }
  if (!*((_BYTE *)m_ptr + 6))
    goto LABEL_36;
  v27 = *((_QWORD *)m_ptr + 1);
  v28 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
  if (!v28)
    v28 = WTF::Thread::initializeCurrentTLS(0);
  if (v27 != v28)
  {
LABEL_36:
    __break(0xC471u);
    JUMPOUT(0x197EFF5F8);
  }
  if (*((_QWORD *)m_ptr + 2) == 1)
  {
    JSC::JSLock::willReleaseLock((JSC::JSLock *)m_ptr, v17, v10, v11, v12, v13, v14, v15);
    v36 = *((_QWORD *)m_ptr + 2) - 1;
    *((_QWORD *)m_ptr + 2) = v36;
    if (!v36)
    {
      *((_BYTE *)m_ptr + 6) = 0;
      v37 = (unsigned __int8 *)m_ptr + 4;
      v38 = __ldxr((unsigned __int8 *)m_ptr + 4);
      if (v38 == 1)
      {
        if (!__stlxr(0, v37))
          return v26;
      }
      else
      {
        __clrex();
      }
      WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::unlockSlow(v37, 0, v30, v31, v32, v33, v34, v35);
    }
  }
  else
  {
    --*((_QWORD *)m_ptr + 2);
  }
  return v26;
}

- (void)disconnectValue
{
  WeakImpl *m_impl;
  Class isa;

  m_impl = self->m_globalObject.m_impl;
  if (m_impl)
  {
    *((_QWORD *)m_impl + 1) = 3;
    self->m_globalObject.m_impl = 0;
  }
  switch(self->m_weakValue.m_tag)
  {
    case 0:
      return;
    case 1:
      goto LABEL_6;
    case 2:
    case 3:
      isa = self->m_weakValue.m_value.primitive.super.isa;
      if (!isa)
        return;
      *((_QWORD *)isa + 1) = 3;
LABEL_6:
      self->m_weakValue.m_value.primitive.super.isa = 0;
      return;
    default:
      __break(0xC471u);
      JUMPOUT(0x197EFF750);
  }
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OpaqueJSValue *m_value;
  Class isa;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  WeakImpl *m_impl;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  m_value = self->m_weakValue.m_value.primitive.m_value;
  self->m_weakValue.m_value.primitive.m_value = 0;
  if (m_value)
    CFRelease(m_value);
  switch(self->m_weakValue.m_tag)
  {
    case 0:
      goto LABEL_7;
    case 1:
      goto LABEL_6;
    case 2:
    case 3:
      isa = self->m_weakValue.m_value.primitive.super.isa;
      if (!isa)
        goto LABEL_7;
      *((_QWORD *)isa + 1) = 3;
LABEL_6:
      self->m_weakValue.m_value.primitive.super.isa = 0;
LABEL_7:
      m_ptr = (unsigned int *)self->m_lock.m_ptr;
      self->m_lock.m_ptr = 0;
      if (m_ptr)
      {
        do
        {
          v12 = __ldaxr(m_ptr);
          v13 = v12 - 1;
        }
        while (__stlxr(v13, m_ptr));
        if (!v13)
        {
          atomic_store(1u, m_ptr);
          JSC::JSLock::~JSLock((JSC::JSLock *)m_ptr, (void *)a2, v2, v3, v4, v5, v6, v7);
          WTF::fastFree(v15, v16, v17, v18, v19, v20, v21, v22);
        }
      }
      m_impl = self->m_globalObject.m_impl;
      if (m_impl)
      {
        *((_QWORD *)m_impl + 1) = 3;
        self->m_globalObject.m_impl = 0;
      }
      return;
    default:
      __break(0xC471u);
      JUMPOUT(0x197EFF82CLL);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0;
  *((_OWORD *)self + 2) = 0uLL;
  return self;
}

@end

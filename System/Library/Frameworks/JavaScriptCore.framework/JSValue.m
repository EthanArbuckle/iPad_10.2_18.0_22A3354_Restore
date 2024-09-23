@implementation JSValue

- (void)dealloc
{
  JSContext *context;
  JSC::JSGlobalObject *v4;
  OpaqueJSValue *m_value;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  _QWORD *v21;
  uint64_t *v22;
  objc_super v23;
  unsigned int *v24;
  OpaqueJSValue *v25;

  context = self->_context;
  if (context)
  {
    v4 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
    m_value = self->m_value;
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v24, v4, v6, v7, v8, v9, v10, v11, v12);
    if (m_value)
      v20 = ((unint64_t)m_value & 0xFFFE000000000002) == 0;
    else
      v20 = 0;
    if (v20)
    {
      v21 = (_QWORD *)((unint64_t)m_value & 0xFFFFFFFFFFFFC000 | 8);
      if ((m_value & 8) != 0)
        v21 = (_QWORD *)((char *)m_value - 16);
      v22 = (uint64_t *)(*v21 + 552);
      v25 = m_value;
      WTF::HashCountedSet<JSC::JSCell *,WTF::DefaultHash<JSC::JSCell *>,WTF::HashTraits<JSC::JSCell *>>::remove(v22, &v25, v14, v15, v16, v17, v18, v19);
    }
    JSC::JSLockHolder::~JSLockHolder(&v24, v13, v14, v15, v16, v17, v18, v19);

    self->_context = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)JSValue;
  -[JSValue dealloc](&v23, sel_dealloc);
}

- (id)description
{
  void *v3;

  v3 = (void *)tryUnwrapObjcObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value);
  if (v3)
    return (id)objc_msgSend(v3, "description");
  else
    return -[JSValue toString](self, "toString");
}

- (JSValueRef)JSValueRef
{
  return self->m_value;
}

+ (JSValue)valueWithObject:(id)value inContext:(JSContext *)context
{
  uint64_t v5;

  objectToValue((objc_object *)context, (__CFString *)value);
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v5, context);
}

+ (JSValue)valueWithBool:(BOOL)value inContext:(JSContext *)context
{
  _BOOL4 v5;
  OpaqueJSContext *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = value;
  v6 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
  v7 = 6;
  if (v5)
    v7 = 7;
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v8, context);
}

+ (JSValue)valueWithDouble:(double)value inContext:(JSContext *)context
{
  double v6;
  BOOL v7;
  uint64_t v8;
  unint64_t v9;

  if (-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"))
  {
    v6 = value;
    v7 = (*(_QWORD *)&value & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF7FFFFFFFFFFFFLL
      || (*(_QWORD *)&value & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000;
    if (v7
      || (v8 = (int)value, value != (double)(int)v8)
      || !(_DWORD)v8 && (*(_QWORD *)&value & 0x8000000000000000) != 0)
    {
      v9 = *(_QWORD *)&value + 0x2000000000000;
    }
    else
    {
      v9 = v8 | 0xFFFE000000000000;
    }
  }
  else
  {
    v9 = 0;
  }
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v9, context, v6);
}

+ (JSValue)valueWithInt32:(int32_t)value inContext:(JSContext *)context
{
  unint64_t v6;

  if (-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"))
    v6 = value | 0xFFFE000000000000;
  else
    v6 = 0;
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v6, context);
}

+ (JSValue)valueWithUInt32:(uint32_t)value inContext:(JSContext *)context
{
  unint64_t v6;

  if (-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"))
  {
    if ((double)value == (double)(int)value)
      v6 = value | 0xFFFE000000000000;
    else
      v6 = COERCE__INT64((double)value) + 0x2000000000000;
  }
  else
  {
    v6 = 0;
  }
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v6, context);
}

+ (JSValue)valueWithNewObjectInContext:(JSContext *)context
{
  JSC::VM **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  JSC *v12;
  JSC::JSGlobalObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int *v28;

  v4 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
  v12 = (JSC *)v4;
  if (v4)
  {
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v28, v4[7], v5, v6, v7, v8, v9, v10, v11);
    v12 = (JSC *)JSC::constructEmptyObject(v12, v13, v14, v15, v16, v17, v18, v19);
    JSC::JSLockHolder::~JSLockHolder(&v28, v20, v21, v22, v23, v24, v25, v26);
  }
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v12, context);
}

+ (JSValue)valueWithNewArrayInContext:(JSContext *)context
{
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", JSObjectMakeArray(-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"), 0, 0, 0), context);
}

+ (JSValue)valueWithNewRegularExpressionFromPattern:(NSString *)pattern flags:(NSString *)flags inContext:(JSContext *)context
{
  WTF::AtomStringImpl *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  WTF::AtomStringImpl *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  OpaqueJSContext *v23;
  OpaqueJSContext *v24;
  JSStringRef v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  JSValue *v33;
  unsigned int v34;
  unsigned int v35;
  JSStringRef v36;
  unsigned int v37;
  unsigned int v38;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  WTF::StringImpl *v58;
  unint64_t v59;
  uint64_t v60;
  WTF::StringImpl *v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  JSStringRef v78;
  JSStringRef string;
  JSValueRef arguments[3];

  arguments[2] = *(JSValueRef *)MEMORY[0x1E0C80C00];
  WTF::String::String(arguments, (CFStringRef)pattern);
  OpaqueJSString::tryCreate((uint64_t *)arguments, (uint64_t *)&string);
  v14 = arguments[0];
  arguments[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
    {
      WTF::StringImpl::~StringImpl(v14, v7, v8, v9, v10, v11, v12, v13);
      WTF::fastFree(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    else
    {
      *(_DWORD *)v14 -= 2;
    }
  }
  WTF::String::String(arguments, (CFStringRef)flags);
  OpaqueJSString::tryCreate((uint64_t *)arguments, (uint64_t *)&v78);
  v22 = arguments[0];
  arguments[0] = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
    {
      WTF::StringImpl::~StringImpl(v22, v15, v16, v17, v18, v19, v20, v21);
      WTF::fastFree(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    else
    {
      *(_DWORD *)v22 -= 2;
    }
  }
  v23 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
  arguments[0] = JSValueMakeString(v23, string);
  v24 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
  v25 = v78;
  arguments[1] = JSValueMakeString(v24, v78);
  v33 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", JSObjectMakeRegExp(-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"), 2uLL, arguments, 0), context);
  v78 = 0;
  if (v25)
  {
    do
    {
      v34 = __ldaxr((unsigned int *)v25);
      v35 = v34 - 1;
    }
    while (__stlxr(v35, (unsigned int *)v25));
    if (!v35)
    {
      atomic_store(1u, (unsigned int *)v25);
      v56 = atomic_load((unint64_t *)v25 + 2);
      if (v56)
      {
        v57 = *((_QWORD *)v25 + 1);
        if (!v57 || (*(_BYTE *)(v57 + 16) & 4) != 0 || *(_QWORD *)(v57 + 8) != v56)
          WTF::fastFree(v56, v26, v27, v28, v29, v30, v31, v32);
      }
      v58 = (WTF::StringImpl *)*((_QWORD *)v25 + 1);
      *((_QWORD *)v25 + 1) = 0;
      if (v58)
      {
        if (*(_DWORD *)v58 == 2)
        {
          WTF::StringImpl::~StringImpl(v58, (WTF::AtomStringImpl *)v26, v27, v28, v29, v30, v31, v32);
          WTF::fastFree(v62, v63, v64, v65, v66, v67, v68, v69);
        }
        else
        {
          *(_DWORD *)v58 -= 2;
        }
      }
      WTF::fastFree((unint64_t)v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  v36 = string;
  string = 0;
  if (v36)
  {
    do
    {
      v37 = __ldaxr((unsigned int *)v36);
      v38 = v37 - 1;
    }
    while (__stlxr(v38, (unsigned int *)v36));
    if (!v38)
    {
      atomic_store(1u, (unsigned int *)v36);
      v59 = atomic_load((unint64_t *)v36 + 2);
      if (v59)
      {
        v60 = *((_QWORD *)v36 + 1);
        if (!v60 || (*(_BYTE *)(v60 + 16) & 4) != 0 || *(_QWORD *)(v60 + 8) != v59)
          WTF::fastFree(v59, v26, v27, v28, v29, v30, v31, v32);
      }
      v61 = (WTF::StringImpl *)*((_QWORD *)v36 + 1);
      *((_QWORD *)v36 + 1) = 0;
      if (v61)
      {
        if (*(_DWORD *)v61 == 2)
        {
          WTF::StringImpl::~StringImpl(v61, (WTF::AtomStringImpl *)v26, v27, v28, v29, v30, v31, v32);
          WTF::fastFree(v70, v71, v72, v73, v74, v75, v76, v77);
        }
        else
        {
          *(_DWORD *)v61 -= 2;
        }
      }
      WTF::fastFree((unint64_t)v36, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  return v33;
}

+ (JSValue)valueWithNewErrorFromMessage:(NSString *)message inContext:(JSContext *)context
{
  WTF::AtomStringImpl *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  OpaqueJSContext *v13;
  JSStringRef v14;
  OpaqueJSContext *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  JSValue *v23;
  unsigned int v24;
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
  WTF::StringImpl *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  WTF::StringImpl *v46;
  JSStringRef string;

  WTF::String::String(&v46, (CFStringRef)message);
  OpaqueJSString::tryCreate((uint64_t *)&v46, (uint64_t *)&string);
  v12 = v46;
  v46 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
    {
      WTF::StringImpl::~StringImpl(v12, v5, v6, v7, v8, v9, v10, v11);
      WTF::fastFree(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    else
    {
      *(_DWORD *)v12 -= 2;
    }
  }
  v13 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef", v46);
  v14 = string;
  v15 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef", JSValueMakeString(v13, string));
  v23 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", JSObjectMakeError(v15, 1uLL, &v46, 0), context);
  string = 0;
  if (v14)
  {
    do
    {
      v24 = __ldaxr((unsigned int *)v14);
      v25 = v24 - 1;
    }
    while (__stlxr(v25, (unsigned int *)v14));
    if (!v25)
    {
      atomic_store(1u, (unsigned int *)v14);
      v35 = atomic_load((unint64_t *)v14 + 2);
      if (v35)
      {
        v36 = *((_QWORD *)v14 + 1);
        if (!v36 || (*(_BYTE *)(v36 + 16) & 4) != 0 || *(_QWORD *)(v36 + 8) != v35)
          WTF::fastFree(v35, v16, v17, v18, v19, v20, v21, v22);
      }
      v37 = (WTF::StringImpl *)*((_QWORD *)v14 + 1);
      *((_QWORD *)v14 + 1) = 0;
      if (v37)
      {
        if (*(_DWORD *)v37 == 2)
        {
          WTF::StringImpl::~StringImpl(v37, (WTF::AtomStringImpl *)v16, v17, v18, v19, v20, v21, v22);
          WTF::fastFree(v38, v39, v40, v41, v42, v43, v44, v45);
        }
        else
        {
          *(_DWORD *)v37 -= 2;
        }
      }
      WTF::fastFree((unint64_t)v14, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  return v23;
}

+ (JSValue)valueWithNullInContext:(JSContext *)context
{
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", 2 * (-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef") != 0), context);
}

+ (JSValue)valueWithUndefinedInContext:(JSContext *)context
{
  uint64_t v4;

  if (-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"))
    v4 = 10;
  else
    v4 = 0;
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v4, context);
}

+ (JSValue)valueWithNewSymbolFromDescription:(NSString *)description inContext:(JSContext *)context
{
  WTF::AtomStringImpl *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  OpaqueJSContext *v13;
  JSStringRef v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  JSValue *v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  WTF::StringImpl *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  WTF::StringImpl *v45;
  JSStringRef descriptiona;

  WTF::String::String(&v45, (CFStringRef)description);
  OpaqueJSString::tryCreate((uint64_t *)&v45, (uint64_t *)&descriptiona);
  v12 = v45;
  v45 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
    {
      WTF::StringImpl::~StringImpl(v12, v5, v6, v7, v8, v9, v10, v11);
      WTF::fastFree(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      *(_DWORD *)v12 -= 2;
    }
  }
  v13 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef", v45);
  v14 = descriptiona;
  v22 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", JSValueMakeSymbol(v13, descriptiona), context);
  descriptiona = 0;
  if (v14)
  {
    do
    {
      v23 = __ldaxr((unsigned int *)v14);
      v24 = v23 - 1;
    }
    while (__stlxr(v24, (unsigned int *)v14));
    if (!v24)
    {
      atomic_store(1u, (unsigned int *)v14);
      v34 = atomic_load((unint64_t *)v14 + 2);
      if (v34)
      {
        v35 = *((_QWORD *)v14 + 1);
        if (!v35 || (*(_BYTE *)(v35 + 16) & 4) != 0 || *(_QWORD *)(v35 + 8) != v34)
          WTF::fastFree(v34, v15, v16, v17, v18, v19, v20, v21);
      }
      v36 = (WTF::StringImpl *)*((_QWORD *)v14 + 1);
      *((_QWORD *)v14 + 1) = 0;
      if (v36)
      {
        if (*(_DWORD *)v36 == 2)
        {
          WTF::StringImpl::~StringImpl(v36, (WTF::AtomStringImpl *)v15, v16, v17, v18, v19, v20, v21);
          WTF::fastFree(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        else
        {
          *(_DWORD *)v36 -= 2;
        }
      }
      WTF::fastFree((unint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  return v22;
}

+ (JSValue)valueWithNewBigIntFromString:(id)a3 inContext:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  JSC::JSBigInt *v21;
  unsigned int v22;
  unsigned int v23;
  WTF::StringImpl *v24;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  WTF::StringImpl *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  WTF::StringImpl *v45;
  unint64_t v46;
  uint64_t v47;

  v47 = 0;
  v6 = objc_msgSend(a4, "JSGlobalContextRef");
  WTF::String::String(&v45, (CFStringRef)a3);
  OpaqueJSString::tryCreate((uint64_t *)&v45, (uint64_t *)&v46);
  v7 = v46;
  v21 = JSBigIntCreateWithString(v6, v46, &v47, v8, v9, v10, v11, v12, v13);
  v46 = 0;
  if (v7)
  {
    do
    {
      v22 = __ldaxr((unsigned int *)v7);
      v23 = v22 - 1;
    }
    while (__stlxr(v23, (unsigned int *)v7));
    if (!v23)
    {
      atomic_store(1u, (unsigned int *)v7);
      v34 = atomic_load((unint64_t *)(v7 + 16));
      if (v34)
      {
        v35 = *(_QWORD *)(v7 + 8);
        if (!v35 || (*(_BYTE *)(v35 + 16) & 4) != 0 || *(_QWORD *)(v35 + 8) != v34)
          WTF::fastFree(v34, v14, v15, v16, v17, v18, v19, v20);
      }
      v36 = *(WTF::StringImpl **)(v7 + 8);
      *(_QWORD *)(v7 + 8) = 0;
      if (v36)
      {
        if (*(_DWORD *)v36 == 2)
        {
          WTF::StringImpl::~StringImpl(v36, (WTF::AtomStringImpl *)v14, v15, v16, v17, v18, v19, v20);
          WTF::fastFree(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        else
        {
          *(_DWORD *)v36 -= 2;
        }
      }
      WTF::fastFree(v7, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v24 = v45;
  v45 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
    {
      WTF::StringImpl::~StringImpl(v24, (WTF::AtomStringImpl *)v14, v15, v16, v17, v18, v19, v20);
      WTF::fastFree(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      *(_DWORD *)v24 -= 2;
    }
  }
  if (!v47)
    return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v21, a4);
  objc_msgSend(a4, "notifyException:");
  return 0;
}

+ (JSValue)valueWithNewBigIntFromInt64:(int64_t)a3 inContext:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  Inspector::JSGlobalObjectInspectorController **v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  JSC::Exception *v29;
  uint64_t v30;
  unsigned int *v32;
  unsigned int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int *v41;

  v6 = objc_msgSend(a4, "JSGlobalContextRef");
  if (v6)
  {
    v14 = (Inspector::JSGlobalObjectInspectorController **)v6;
    v15 = *(unsigned int **)(v6 + 56);
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v41, (JSC::VM *)v15, v7, v8, v9, v10, v11, v12, v13);
    v22 = JSC::JSBigInt::createFrom((JSC::JSBigInt *)v14, a3, v16, v17, v18, v19, v20, v21);
    v29 = (JSC::Exception *)*((_QWORD *)v15 + 2);
    if (v29)
    {
      v30 = *((_QWORD *)v29 + 1);
      *((_QWORD *)v15 + 2) = 0;
      v32 = v15 + 20;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 & 0xFFFFFFEF, v32));
      Inspector::JSGlobalObjectInspectorController::reportAPIException(v14[253], (JSC::JSGlobalObject *)v14, v29, v24, v25, v26, v27, v28);
      JSC::JSLockHolder::~JSLockHolder(&v41, v34, v35, v36, v37, v38, v39, v40);
      if (v30)
      {
        objc_msgSend(a4, "notifyException:", v30);
        return 0;
      }
    }
    else
    {
      v30 = v22;
      JSC::JSLockHolder::~JSLockHolder(&v41, v23, 0, v24, v25, v26, v27, v28);
    }
  }
  else
  {
    v30 = 0;
  }
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v30, a4);
}

+ (JSValue)valueWithNewBigIntFromUInt64:(unint64_t)a3 inContext:(id)a4
{
  JSC::JSGlobalObject **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  uint64_t v15;

  v15 = 0;
  v6 = (JSC::JSGlobalObject **)objc_msgSend(a4, "JSGlobalContextRef");
  v13 = JSBigIntCreateWithUInt64(v6, a3, &v15, v7, v8, v9, v10, v11, v12);
  if (!v15)
    return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v13, a4);
  objc_msgSend(a4, "notifyException:");
  return 0;
}

+ (JSValue)valueWithNewBigIntFromDouble:(double)a3 inContext:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  JSC::VM *v15;

  v15 = 0;
  v6 = objc_msgSend(a4, "JSGlobalContextRef");
  v13 = JSBigIntCreateWithDouble(v6, &v15, v7, v8, v9, v10, v11, v12, a3);
  if (!v15)
    return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v13, a4);
  objc_msgSend(a4, "notifyException:");
  return 0;
}

- (unsigned)compareUInt64:(unint64_t)a3
{
  OpaqueJSContext *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unsigned int v11;
  uint64_t v13;

  v13 = 0;
  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  v11 = JSValueCompareUInt64((uint64_t)v5, (unint64_t)self->m_value, a3, &v13, v6, v7, v8, v9, v10);
  if (v13)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v11;
}

- (unsigned)compareInt64:(int64_t)a3
{
  OpaqueJSContext *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unsigned int v11;
  uint64_t v13;

  v13 = 0;
  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  v11 = JSValueCompareInt64(v5, (unint64_t)self->m_value, a3, &v13, v6, v7, v8, v9, v10);
  if (v13)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v11;
}

- (unsigned)compareDouble:(double)a3
{
  OpaqueJSContext *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v13;

  v13 = 0;
  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  v11 = JSValueCompareDouble(v5, (unint64_t)self->m_value, &v13, v6, v7, v8, v9, v10, a3);
  if (v13)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v11;
}

- (unsigned)compareJSValue:(id)a3
{
  OpaqueJSContext *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unsigned int v11;
  uint64_t v13;

  v13 = 0;
  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  v11 = JSValueCompare(v5, (unint64_t)self->m_value, *((_QWORD *)a3 + 1), &v13, v6, v7, v8, v9, v10);
  if (v13)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v11;
}

+ (JSValue)valueWithNewPromiseInContext:(JSContext *)context fromExecutor:(void *)callback
{
  JSObjectRef DeferredPromise;
  JSValue *v7;
  JSObjectRef v8;
  JSValue *v9;
  CFTypeRef v10;
  CFTypeRef v11;
  _BYTE v13[16];
  CFTypeRef v14;
  CFTypeRef cf;
  JSValueRef exception;
  JSObjectRef reject;
  JSObjectRef resolve;
  JSValue *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  reject = 0;
  resolve = 0;
  exception = 0;
  DeferredPromise = JSObjectMakeDeferredPromise(-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"), &resolve, &reject, &exception);
  if (exception)
  {
    -[JSContext notifyException:](context, "notifyException:");
    return 0;
  }
  else
  {
    v8 = DeferredPromise;
    v7 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", DeferredPromise, context);
    v9 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", reject, context);
    v14 = 0;
    cf = 0;
    v20[0] = resolve;
    v20[1] = reject;
    -[JSContext beginCallbackWithData:calleeValue:thisValue:argumentCount:arguments:](context, "beginCallbackWithData:calleeValue:thisValue:argumentCount:arguments:", v13, 0, v8, 2, v20);
    (*((void (**)(void *, JSValue *, JSValue *))callback + 2))(callback, +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", resolve, context), v9);
    if (-[JSContext exception](context, "exception"))
    {
      v19 = -[JSContext exception](context, "exception");
      -[JSValue callWithArguments:](v9, "callWithArguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1));
    }
    -[JSContext endCallbackWithData:](context, "endCallbackWithData:", v13);
    v10 = cf;
    cf = 0;
    if (v10)
      CFRelease(v10);
    v11 = v14;
    v14 = 0;
    if (v11)
      CFRelease(v11);
  }
  return v7;
}

+ (JSValue)valueWithNewPromiseResolvedWithResult:(id)result inContext:(JSContext *)context
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__JSValue_valueWithNewPromiseResolvedWithResult_inContext___block_invoke;
  v5[3] = &unk_1E357B470;
  v5[4] = result;
  return +[JSValue valueWithNewPromiseInContext:fromExecutor:](JSValue, "valueWithNewPromiseInContext:fromExecutor:", context, v5);
}

uint64_t __59__JSValue_valueWithNewPromiseResolvedWithResult_inContext___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "callWithArguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
}

+ (JSValue)valueWithNewPromiseRejectedWithReason:(id)reason inContext:(JSContext *)context
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__JSValue_valueWithNewPromiseRejectedWithReason_inContext___block_invoke;
  v5[3] = &unk_1E357B470;
  v5[4] = reason;
  return +[JSValue valueWithNewPromiseInContext:fromExecutor:](JSValue, "valueWithNewPromiseInContext:fromExecutor:", context, v5);
}

uint64_t __59__JSValue_valueWithNewPromiseRejectedWithReason_inContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a3, "callWithArguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1));
}

- (id)toObject
{
  JSContext *context;
  OpaqueJSValue *m_value;
  const OpaqueJSContext *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  m_value = self->m_value;
  context = self->_context;
  v21 = 0uLL;
  v22 = 0;
  v4 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
  valueToObjectWithoutCopy((OpaqueJSContext *)&v21, v4, (unint64_t)m_value, v5, v6, v7, v8, v9, v10);
  if (!(_DWORD)v22)
    return (id)*((_QWORD *)&v21 + 1);
  v11 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
  v19 = v21;
  v20 = v22;
  return (id)containerValueToObject(v11, &v19, v12, v13, v14, v15, v16, v17, *(double *)&v21);
}

- (id)toObjectOfClass:(Class)expectedClass
{
  id v3;

  v3 = -[JSValue toObject](self, "toObject");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (BOOL)toBool
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OpaqueJSContext *v9;
  double v10;
  OpaqueJSValue *m_value;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  int v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  int *v26;
  int v27;
  BOOL v28;
  BOOL v29;
  unsigned int *v30;

  v9 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  if (v9)
  {
    m_value = self->m_value;
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v30, v9, v3, v4, v5, v6, v7, v8, v10);
    v19 = 2;
    if (m_value)
      v19 = (unint64_t)m_value;
    if (v19 >= 0xFFFE000000000000)
    {
      v24 = (_DWORD)v19 == 0;
      goto LABEL_15;
    }
    *(_QWORD *)&v20 = v19 - 0x2000000000000;
    if (v19 - 0x2000000000000 <= 0xFFFBFFFFFFFFFFFFLL)
    {
      v28 = v20 <= 0.0;
      v29 = v20 < 0.0;
      LOBYTE(v9) = !v28 || v29;
      goto LABEL_8;
    }
    if ((v19 & 0xFFFE000000000002) != 0)
    {
      LOBYTE(v9) = v19 == 7;
LABEL_8:
      JSC::JSLockHolder::~JSLockHolder(&v30, v12, v13, v14, v15, v16, v17, v18);
      return (char)v9;
    }
    v22 = *(unsigned __int8 *)(v19 + 5);
    if (v22 == 2)
    {
      v25 = *(_QWORD *)(v19 + 8);
      v26 = (int *)(v19 + 16);
      if ((v25 & 1) == 0)
        v26 = (int *)(v25 + 4);
      v27 = *v26;
    }
    else
    {
      if (v22 != 3)
      {
        v23 = 16 * (*(_DWORD *)v19 & 0xFFFFFFFE);
        if ((*(_BYTE *)(v23 + 10) & 1) == 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_8;
        }
        v24 = *(_QWORD *)(v23 + 40) == (_QWORD)v9;
LABEL_15:
        LOBYTE(v9) = !v24;
        goto LABEL_8;
      }
      v27 = *(_DWORD *)(v19 + 8);
    }
    v24 = v27 == 0;
    goto LABEL_15;
  }
  return (char)v9;
}

- (double)toDouble
{
  double result;
  JSValueRef exception;

  exception = 0;
  result = JSValueToNumber(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &exception);
  if (exception)
  {
    -[JSContext notifyException:](self->_context, "notifyException:", result);
    return NAN;
  }
  return result;
}

- (int32_t)toInt32
{
  OpaqueJSContext *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  int32_t result;
  uint64_t v11;

  v11 = 0;
  v3 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  result = JSValueToInt32(v3, (unint64_t)self->m_value, &v11, v4, v5, v6, v7, v8, v9);
  if (v11)
  {
    -[JSContext notifyException:](self->_context, "notifyException:");
    return 0;
  }
  return result;
}

- (uint32_t)toUInt32
{
  OpaqueJSContext *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint32_t v10;
  uint64_t v12;

  v12 = 0;
  v3 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  v10 = JSValueToUInt32(v3, (unint64_t)self->m_value, &v12, v4, v5, v6, v7, v8, v9);
  if (v12)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v10;
}

- (int64_t)toInt64
{
  OpaqueJSContext *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  int64_t result;
  uint64_t v11;

  v11 = 0;
  v3 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  result = JSValueToInt64(v3, (unint64_t)self->m_value, &v11, v4, v5, v6, v7, v8, v9);
  if (v11)
  {
    -[JSContext notifyException:](self->_context, "notifyException:");
    return 0;
  }
  return result;
}

- (unint64_t)toUInt64
{
  OpaqueJSContext *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  uint64_t v12;

  v12 = 0;
  v3 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  v10 = JSValueToUInt64(v3, (unint64_t)self->m_value, &v12, v4, v5, v6, v7, v8, v9);
  if (v12)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v10;
}

- (NSNumber)toNumber
{
  NSNumber *v3;
  JSValueRef v5;

  v5 = 0;
  v3 = (NSNumber *)valueToNumber(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &v5);
  if (v5)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v3;
}

- (NSString)toString
{
  NSString *v3;
  JSValueRef v5;

  v5 = 0;
  v3 = (NSString *)valueToString(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &v5);
  if (v5)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v3;
}

- (NSDate)toDate
{
  OpaqueJSContext *v3;
  OpaqueJSValue *m_value;
  uint64_t v5;
  NSDate *v6;
  double v7;
  JSValueRef exception;

  exception = 0;
  v3 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  m_value = self->m_value;
  v5 = tryUnwrapObjcObject(v3, m_value);
  if (!v5 || (v6 = (NSDate *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = JSValueToNumber(v3, m_value, &exception);
    if (exception)
    {
      v6 = 0;
LABEL_6:
      -[JSContext notifyException:](self->_context, "notifyException:", v7);
      return v6;
    }
    v6 = (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7 / 1000.0);
    if (exception)
      goto LABEL_6;
  }
  return v6;
}

- (NSArray)toArray
{
  NSArray *v3;
  JSC::VM *v5;

  v5 = 0;
  v3 = (NSArray *)valueToArray(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &v5);
  if (v5)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v3;
}

- (NSDictionary)toDictionary
{
  NSDictionary *v3;
  JSC::VM *v5;

  v5 = 0;
  v3 = (NSDictionary *)valueToDictionary(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &v5);
  if (v5)
    -[JSContext notifyException:](self->_context, "notifyException:");
  return v3;
}

- (JSValue)valueForProperty:(JSValueProperty)property
{
  JSContext *v5;
  JSObjectRef v6;
  OpaqueJSValue *v7;
  uint64_t v8;
  OpaqueJSString *v9;
  WTF::StringImpl *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  JSValueRef PropertyForKey;
  unsigned int v19;
  unsigned int v20;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  JSValueRef exception;

  v5 = -[JSValue context](self, "context");
  exception = 0;
  v6 = JSValueToObject(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), -[JSValue JSValueRef](self, "JSValueRef"), &exception);
  if (exception)
    return (JSValue *)-[JSContext valueFromNotifyException:](self->_context, "valueFromNotifyException:");
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WTF::String::String(&v30, (CFStringRef)property);
    if (v30)
    {
      v8 = WTF::fastMalloc((WTF *)0x18);
      v9 = (OpaqueJSString *)v8;
      *(_DWORD *)v8 = 1;
      v10 = v30;
      *(_QWORD *)(v8 + 8) = v30;
      if (v10)
      {
        if ((*((_BYTE *)v10 + 16) & 4) != 0)
          v10 = 0;
        else
          v10 = (WTF::StringImpl *)*((_QWORD *)v10 + 1);
      }
      *(_QWORD *)(v8 + 16) = v10;
    }
    else
    {
      v9 = 0;
    }
    PropertyForKey = JSObjectGetProperty(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), v7, v9, &exception);
    if (v9)
    {
      do
      {
        v19 = __ldaxr((unsigned int *)v9);
        v20 = v19 - 1;
      }
      while (__stlxr(v20, (unsigned int *)v9));
      if (!v20)
      {
        atomic_store(1u, (unsigned int *)v9);
        OpaqueJSString::~OpaqueJSString(v9, v11, v12, v13, v14, v15, v16, v17);
        WTF::fastFree(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  else
  {
    PropertyForKey = JSObjectGetPropertyForKey(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), v7, -[JSValue JSValueRef](+[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", property, v5), "JSValueRef"), &exception);
  }
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", PropertyForKey, self->_context);
}

- (void)setValue:(id)value forProperty:(JSValueProperty)property
{
  const OpaqueJSValue *v6;
  const OpaqueJSValue *v7;
  JSContext *v8;
  JSObjectRef v9;
  OpaqueJSValue *v10;
  uint64_t v11;
  unint64_t *v12;
  WTF::StringImpl *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  WTF::StringImpl *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  JSValueRef exception;

  objectToValue((objc_object *)self->_context, (__CFString *)value);
  v7 = v6;
  v8 = -[JSValue context](self, "context");
  exception = 0;
  v9 = JSValueToObject(-[JSContext JSGlobalContextRef](v8, "JSGlobalContextRef"), -[JSValue JSValueRef](self, "JSValueRef"), &exception);
  if (exception)
  {
    -[JSContext notifyException:](self->_context, "notifyException:");
  }
  else
  {
    v10 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      WTF::String::String(&v34, (CFStringRef)property);
      if (v34)
      {
        v11 = WTF::fastMalloc((WTF *)0x18);
        v12 = (unint64_t *)v11;
        *(_DWORD *)v11 = 1;
        v13 = v34;
        *(_QWORD *)(v11 + 8) = v34;
        if (v13)
        {
          if ((*((_BYTE *)v13 + 16) & 4) != 0)
            v13 = 0;
          else
            v13 = (WTF::StringImpl *)*((_QWORD *)v13 + 1);
        }
        *(_QWORD *)(v11 + 16) = v13;
      }
      else
      {
        v12 = 0;
      }
      JSObjectSetProperty(-[JSContext JSGlobalContextRef](v8, "JSGlobalContextRef"), v10, (JSStringRef)v12, v7, 0, &exception);
      if (v12)
      {
        do
        {
          v21 = __ldaxr((unsigned int *)v12);
          v22 = v21 - 1;
        }
        while (__stlxr(v22, (unsigned int *)v12));
        if (!v22)
        {
          atomic_store(1u, (unsigned int *)v12);
          v23 = atomic_load(v12 + 2);
          if (v23)
          {
            v24 = v12[1];
            if (!v24 || (*(_BYTE *)(v24 + 16) & 4) != 0 || *(_QWORD *)(v24 + 8) != v23)
              WTF::fastFree(v23, v14, v15, v16, v17, v18, v19, v20);
          }
          v25 = (WTF::StringImpl *)v12[1];
          v12[1] = 0;
          if (v25)
          {
            if (*(_DWORD *)v25 == 2)
            {
              WTF::StringImpl::~StringImpl(v25, (WTF::AtomStringImpl *)v14, v15, v16, v17, v18, v19, v20);
              WTF::fastFree(v26, v27, v28, v29, v30, v31, v32, v33);
            }
            else
            {
              *(_DWORD *)v25 -= 2;
            }
          }
          WTF::fastFree((unint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }
    else
    {
      JSObjectSetPropertyForKey(-[JSContext JSGlobalContextRef](v8, "JSGlobalContextRef"), v10, -[JSValue JSValueRef](+[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", property, v8), "JSValueRef"), v7, 0, &exception);
    }
  }
}

- (BOOL)deleteProperty:(JSValueProperty)property
{
  JSContext *v5;
  JSObjectRef v6;
  OpaqueJSValue *v8;
  uint64_t v9;
  unint64_t *v10;
  WTF::StringImpl *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  WTF::StringImpl *v24;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  JSValueRef exception;

  v5 = -[JSValue context](self, "context");
  exception = 0;
  v6 = JSValueToObject(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), -[JSValue JSValueRef](self, "JSValueRef"), &exception);
  if (exception)
    return -[JSContext BOOLFromNotifyException:](self->_context, "BOOLFromNotifyException:");
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return JSObjectDeletePropertyForKey(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), v8, -[JSValue JSValueRef](+[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", property, v5), "JSValueRef"), &exception);
  WTF::String::String(&v34, (CFStringRef)property);
  if (v34)
  {
    v9 = WTF::fastMalloc((WTF *)0x18);
    v10 = (unint64_t *)v9;
    *(_DWORD *)v9 = 1;
    v11 = v34;
    *(_QWORD *)(v9 + 8) = v34;
    if (v11)
    {
      if ((*((_BYTE *)v11 + 16) & 4) != 0)
        v11 = 0;
      else
        v11 = (WTF::StringImpl *)*((_QWORD *)v11 + 1);
    }
    *(_QWORD *)(v9 + 16) = v11;
  }
  else
  {
    v10 = 0;
  }
  v19 = JSObjectDeleteProperty(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), v8, (JSStringRef)v10, &exception);
  if (v10)
  {
    do
    {
      v20 = __ldaxr((unsigned int *)v10);
      v21 = v20 - 1;
    }
    while (__stlxr(v21, (unsigned int *)v10));
    if (!v21)
    {
      atomic_store(1u, (unsigned int *)v10);
      v22 = atomic_load(v10 + 2);
      if (v22)
      {
        v23 = v10[1];
        if (!v23 || (*(_BYTE *)(v23 + 16) & 4) != 0 || *(_QWORD *)(v23 + 8) != v22)
          WTF::fastFree(v22, v12, v13, v14, v15, v16, v17, v18);
      }
      v24 = (WTF::StringImpl *)v10[1];
      v10[1] = 0;
      if (v24)
      {
        if (*(_DWORD *)v24 == 2)
        {
          WTF::StringImpl::~StringImpl(v24, (WTF::AtomStringImpl *)v12, v13, v14, v15, v16, v17, v18);
          WTF::fastFree(v26, v27, v28, v29, v30, v31, v32, v33);
        }
        else
        {
          *(_DWORD *)v24 -= 2;
        }
      }
      WTF::fastFree((unint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  return v19;
}

- (BOOL)hasProperty:(JSValueProperty)property
{
  JSContext *v5;
  JSObjectRef v6;
  OpaqueJSValue *v8;
  uint64_t v9;
  unint64_t *v10;
  WTF::StringImpl *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL HasProperty;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  WTF::StringImpl *v24;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  JSValueRef exception;

  v5 = -[JSValue context](self, "context");
  exception = 0;
  v6 = JSValueToObject(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), -[JSValue JSValueRef](self, "JSValueRef"), &exception);
  if (exception)
    return -[JSContext BOOLFromNotifyException:](self->_context, "BOOLFromNotifyException:");
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return JSObjectHasPropertyForKey(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), v8, -[JSValue JSValueRef](+[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", property, v5), "JSValueRef"), &exception);
  WTF::String::String(&v34, (CFStringRef)property);
  if (v34)
  {
    v9 = WTF::fastMalloc((WTF *)0x18);
    v10 = (unint64_t *)v9;
    *(_DWORD *)v9 = 1;
    v11 = v34;
    *(_QWORD *)(v9 + 8) = v34;
    if (v11)
    {
      if ((*((_BYTE *)v11 + 16) & 4) != 0)
        v11 = 0;
      else
        v11 = (WTF::StringImpl *)*((_QWORD *)v11 + 1);
    }
    *(_QWORD *)(v9 + 16) = v11;
  }
  else
  {
    v10 = 0;
  }
  HasProperty = JSObjectHasProperty(-[JSContext JSGlobalContextRef](v5, "JSGlobalContextRef"), v8, (JSStringRef)v10);
  if (v10)
  {
    do
    {
      v20 = __ldaxr((unsigned int *)v10);
      v21 = v20 - 1;
    }
    while (__stlxr(v21, (unsigned int *)v10));
    if (!v21)
    {
      atomic_store(1u, (unsigned int *)v10);
      v22 = atomic_load(v10 + 2);
      if (v22)
      {
        v23 = v10[1];
        if (!v23 || (*(_BYTE *)(v23 + 16) & 4) != 0 || *(_QWORD *)(v23 + 8) != v22)
          WTF::fastFree(v22, v12, v13, v14, v15, v16, v17, v18);
      }
      v24 = (WTF::StringImpl *)v10[1];
      v10[1] = 0;
      if (v24)
      {
        if (*(_DWORD *)v24 == 2)
        {
          WTF::StringImpl::~StringImpl(v24, (WTF::AtomStringImpl *)v12, v13, v14, v15, v16, v17, v18);
          WTF::fastFree(v26, v27, v28, v29, v30, v31, v32, v33);
        }
        else
        {
          *(_DWORD *)v24 -= 2;
        }
      }
      WTF::fastFree((unint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  return HasProperty;
}

- (void)defineProperty:(JSValueProperty)property descriptor:(id)descriptor
{
  JSValue *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7 = -[JSValue objectForKeyedSubscript:](-[JSContext globalObject](self->_context, "globalObject"), "objectForKeyedSubscript:", CFSTR("Object"));
  v8[0] = self;
  v8[1] = property;
  v8[2] = descriptor;
  -[JSValue invokeMethod:withArguments:](v7, "invokeMethod:withArguments:", CFSTR("defineProperty"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3));
}

- (JSValue)valueAtIndex:(NSUInteger)index
{
  JSC::JSObject *v5;
  JSContext *context;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  Inspector::JSGlobalObjectInspectorController **v15;
  unsigned int *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  JSC::Exception *v24;
  uint64_t v25;
  unsigned int *v27;
  unsigned int v28;
  JSValueRef v29;
  unsigned int *v30;

  if (HIDWORD(index))
    return -[JSValue valueForProperty:](self, "valueForProperty:", -[JSValue toString](+[JSValue valueWithDouble:inContext:](JSValue, "valueWithDouble:inContext:", self->_context, (double)index), "toString"));
  v29 = 0;
  v5 = JSValueToObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &v29);
  context = self->_context;
  if (v29)
    return (JSValue *)-[JSContext valueFromNotifyException:](context, "valueFromNotifyException:", v29);
  v7 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
  if (v7)
  {
    v15 = (Inspector::JSGlobalObjectInspectorController **)v7;
    v16 = *(unsigned int **)(v7 + 56);
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v30, (JSC::VM *)v16, v8, v9, v10, v11, v12, v13, v14);
    v17 = JSC::JSObject::get(v5, (JSC::JSGlobalObject *)v15, index);
    v24 = (JSC::Exception *)*((_QWORD *)v16 + 2);
    if (v24)
    {
      v29 = (JSValueRef)*((_QWORD *)v24 + 1);
      *((_QWORD *)v16 + 2) = 0;
      v27 = v16 + 20;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 & 0xFFFFFFEF, v27));
      Inspector::JSGlobalObjectInspectorController::reportAPIException(v15[253], (JSC::JSGlobalObject *)v15, v24, v19, v20, v21, v22, v23);
      v25 = 0;
    }
    else
    {
      v25 = v17;
    }
    JSC::JSLockHolder::~JSLockHolder(&v30, v18, (uint64_t)v24, v19, v20, v21, v22, v23);
  }
  else
  {
    v25 = 0;
  }
  if (v29)
  {
    context = self->_context;
    return (JSValue *)-[JSContext valueFromNotifyException:](context, "valueFromNotifyException:", v29);
  }
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v25, self->_context);
}

- (void)setValue:(id)value atIndex:(NSUInteger)index
{
  unsigned int v4;
  OpaqueJSValue *v7;
  JSContext *context;
  const OpaqueJSContext *v9;
  JSValueRef v10;
  JSValueRef exception;

  v4 = index;
  if (HIDWORD(index))
  {
    -[JSValue setValue:forProperty:](self, "setValue:forProperty:", value, -[JSValue toString](+[JSValue valueWithDouble:inContext:](JSValue, "valueWithDouble:inContext:", self->_context, (double)index), "toString"));
    return;
  }
  exception = 0;
  v7 = JSValueToObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &exception);
  context = self->_context;
  if (!exception)
  {
    v9 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
    objectToValue((objc_object *)self->_context, (__CFString *)value);
    JSObjectSetPropertyAtIndex(v9, v7, v4, v10, &exception);
    if (!exception)
      return;
    context = self->_context;
  }
  -[JSContext notifyException:](context, "notifyException:");
}

- (BOOL)isUndefined
{
  return self->m_value == (OpaqueJSValue *)10;
}

- (BOOL)isNull
{
  return self->m_value == (OpaqueJSValue *)2;
}

- (BOOL)isBoolean
{
  return ((unint64_t)self->m_value & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (BOOL)isNumber
{
  return (unint64_t)self->m_value >> 49 != 0;
}

- (BOOL)isString
{
  OpaqueJSValue *m_value;

  m_value = self->m_value;
  return ((unint64_t)m_value & 0xFFFE000000000002) == 0 && *((_BYTE *)m_value + 5) == 2;
}

- (BOOL)isObject
{
  OpaqueJSValue *m_value;

  m_value = self->m_value;
  return ((unint64_t)m_value & 0xFFFE000000000002) == 0 && *((unsigned __int8 *)m_value + 5) > 0x16u;
}

- (BOOL)isSymbol
{
  OpaqueJSValue *m_value;

  m_value = self->m_value;
  return ((unint64_t)m_value & 0xFFFE000000000002) == 0 && *((_BYTE *)m_value + 5) == 4;
}

- (BOOL)isBigInt
{
  OpaqueJSValue *m_value;

  m_value = self->m_value;
  return ((unint64_t)m_value & 0xFFFE000000000002) == 0 && *((_BYTE *)m_value + 5) == 3;
}

- (BOOL)isArray
{
  OpaqueJSContext *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  OpaqueJSValue *m_value;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  unsigned int *v22;

  v3 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  if (!v3)
    return 0;
  m_value = self->m_value;
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v22, v3, v4, v5, v6, v7, v8, v9, v10);
  v19 = 2;
  if (m_value)
    v19 = (uint64_t)m_value;
  v20 = (v19 & 0xFFFE000000000002) == 0 && (*(_BYTE *)(v19 + 5) & 0xFE) == 36;
  JSC::JSLockHolder::~JSLockHolder(&v22, v12, v13, v14, v15, v16, v17, v18);
  return v20;
}

- (BOOL)isDate
{
  OpaqueJSContext *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  OpaqueJSValue *m_value;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  unsigned int *v22;

  v3 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  if (!v3)
    return 0;
  m_value = self->m_value;
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v22, v3, v4, v5, v6, v7, v8, v9, v10);
  v19 = 2;
  if (m_value)
    v19 = (uint64_t)m_value;
  v20 = (v19 & 0xFFFE000000000002) == 0
     && &JSC::DateInstance::s_info == (char **)(16 * *(unsigned int *)(16 * (*(_DWORD *)v19 & 0xFFFFFFFE) + 0x4C));
  JSC::JSLockHolder::~JSLockHolder(&v22, v12, v13, v14, v15, v16, v17, v18);
  return v20;
}

- (BOOL)isEqualToObject:(id)value
{
  OpaqueJSContext *v5;
  OpaqueJSValue *m_value;
  JSValueRef v7;

  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  m_value = self->m_value;
  objectToValue((objc_object *)self->_context, (__CFString *)value);
  return JSValueIsStrictEqual(v5, m_value, v7);
}

- (BOOL)isEqualWithTypeCoercionToObject:(id)value
{
  JSGlobalContextRef v5;
  OpaqueJSValue *m_value;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int8x16_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  JSC::Exception *v27;
  unsigned int *v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int *v38;

  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  m_value = self->m_value;
  objectToValue((objc_object *)self->_context, (__CFString *)value);
  if (v5)
  {
    v15 = v7;
    v16 = (unsigned int *)*((_QWORD *)v5 + 7);
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v38, (JSC::VM *)v16, v8, v9, v10, v11, v12, v13, v14);
    if (m_value)
      v23 = (unint64_t)m_value;
    else
      v23 = 2;
    if (v15)
      v24 = v15;
    else
      v24 = 2;
    if (v23 >= 0xFFFE000000000000 && v24 >= 0xFFFE000000000000)
      LOBYTE(v26) = v23 == v24;
    else
      LOBYTE(v26) = JSC::JSValue::equalSlowCase((JSC::VM **)v5, (JSC::JSBigInt *)v23, (JSC::JSBigInt *)v24, v17, v18, v19, v20, v21, v22);
    v27 = (JSC::Exception *)*((_QWORD *)v16 + 2);
    if (v27)
    {
      v26 = *((_QWORD *)v27 + 1);
      *((_QWORD *)v16 + 2) = 0;
      v29 = v16 + 20;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 & 0xFFFFFFEF, v29));
      Inspector::JSGlobalObjectInspectorController::reportAPIException(*((Inspector::JSGlobalObjectInspectorController **)v5 + 253), v5, v27, v17, v18, v19, v20, v21);
      JSC::JSLockHolder::~JSLockHolder(&v38, v31, v32, v33, v34, v35, v36, v37);
      if (v26)
        LOBYTE(v26) = -[JSContext BOOLFromNotifyException:](self->_context, "BOOLFromNotifyException:", v26);
    }
    else
    {
      JSC::JSLockHolder::~JSLockHolder(&v38, (void *)v23, 0, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    LOBYTE(v26) = 0;
  }
  return v26;
}

- (BOOL)isInstanceOf:(id)value
{
  OpaqueJSContext *v5;
  JSValueRef v6;
  OpaqueJSValue *v7;
  JSContext *context;
  BOOL result;
  JSValueRef exception;

  exception = 0;
  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  objectToValue((objc_object *)self->_context, (__CFString *)value);
  v7 = JSValueToObject(v5, v6, &exception);
  context = self->_context;
  if (!exception)
  {
    result = JSValueIsInstanceOfConstructor(-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"), self->m_value, v7, &exception);
    if (!exception)
      return result;
    context = self->_context;
  }
  return -[JSContext BOOLFromNotifyException:](context, "BOOLFromNotifyException:");
}

- (JSValue)callWithArguments:(NSArray *)arguments
{
  JSC::VM **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  WTF *v17;
  OpaqueJSValue *v19;
  JSContext *context;
  JSValue *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const OpaqueJSContext *v29;
  WTF *v30;
  JSValueRef v31;
  JSValue *v32;
  _QWORD *v33;
  WTF *v34;
  uint64_t v36;
  JSValueRef v37;
  uint64_t v38;
  _QWORD *v39;
  _BYTE v40[64];
  WTF *v41;
  unsigned int *v42;

  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v42, v5[7], v6, v7, v8, v9, v10, v11, v12);
  v13 = -[NSArray count](arguments, "count");
  JSC::MarkedJSValueRefArray::MarkedJSValueRefArray((JSC::MarkedJSValueRefArray *)&v38, -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), v13);
  if (v13)
  {
    v14 = 0;
    v15 = 1;
    do
    {
      objectToValue((objc_object *)self->_context, (__CFString *)-[NSArray objectAtIndex:](arguments, "objectAtIndex:", v14));
      v17 = v41;
      if (!v41)
        v17 = (WTF *)v40;
      *((_QWORD *)v17 + v14) = v16;
      v14 = v15;
    }
    while (v13 > v15++);
  }
  v19 = JSValueToObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef", 0), self->m_value, &v37);
  context = self->_context;
  if (v37)
  {
    v21 = -[JSContext valueFromNotifyException:](context, "valueFromNotifyException:");
  }
  else
  {
    v29 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
    if (v41)
      v30 = v41;
    else
      v30 = (WTF *)v40;
    v31 = JSObjectCallAsFunction(v29, v19, 0, v13, (const JSValueRef *)v30, &v37);
    if (v37)
      v21 = -[JSContext valueFromNotifyException:](self->_context, "valueFromNotifyException:");
    else
      v21 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v31, self->_context);
  }
  v32 = v21;
  v33 = v39;
  if (v39)
  {
    v36 = v38;
    *v39 = v38;
    *(_QWORD *)(v36 + 8) = v33;
    v38 = 0;
    v39 = 0;
  }
  v34 = v41;
  v41 = 0;
  if (v34)
    WTF::fastFree((unint64_t)v34, v22, v23, v24, v25, v26, v27, v28);
  JSC::JSLockHolder::~JSLockHolder(&v42, v22, v23, v24, v25, v26, v27, v28);
  return v32;
}

- (JSValue)constructWithArguments:(NSArray *)arguments
{
  JSC::VM **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  WTF *v17;
  OpaqueJSValue *v19;
  JSContext *context;
  JSValue *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const OpaqueJSContext *v29;
  WTF *v30;
  JSObjectRef v31;
  JSValue *v32;
  _QWORD *v33;
  WTF *v34;
  uint64_t v36;
  JSValueRef v37;
  uint64_t v38;
  _QWORD *v39;
  _BYTE v40[64];
  WTF *v41;
  unsigned int *v42;

  v5 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v42, v5[7], v6, v7, v8, v9, v10, v11, v12);
  v13 = -[NSArray count](arguments, "count");
  JSC::MarkedJSValueRefArray::MarkedJSValueRefArray((JSC::MarkedJSValueRefArray *)&v38, -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), v13);
  if (v13)
  {
    v14 = 0;
    v15 = 1;
    do
    {
      objectToValue((objc_object *)self->_context, (__CFString *)-[NSArray objectAtIndex:](arguments, "objectAtIndex:", v14));
      v17 = v41;
      if (!v41)
        v17 = (WTF *)v40;
      *((_QWORD *)v17 + v14) = v16;
      v14 = v15;
    }
    while (v13 > v15++);
  }
  v19 = JSValueToObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef", 0), self->m_value, &v37);
  context = self->_context;
  if (v37)
  {
    v21 = -[JSContext valueFromNotifyException:](context, "valueFromNotifyException:");
  }
  else
  {
    v29 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
    if (v41)
      v30 = v41;
    else
      v30 = (WTF *)v40;
    v31 = JSObjectCallAsConstructor(v29, v19, v13, (const JSValueRef *)v30, &v37);
    if (v37)
      v21 = -[JSContext valueFromNotifyException:](self->_context, "valueFromNotifyException:");
    else
      v21 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v31, self->_context);
  }
  v32 = v21;
  v33 = v39;
  if (v39)
  {
    v36 = v38;
    *v39 = v38;
    *(_QWORD *)(v36 + 8) = v33;
    v38 = 0;
    v39 = 0;
  }
  v34 = v41;
  v41 = 0;
  if (v34)
    WTF::fastFree((unint64_t)v34, v22, v23, v24, v25, v26, v27, v28);
  JSC::JSLockHolder::~JSLockHolder(&v42, v22, v23, v24, v25, v26, v27, v28);
  return v32;
}

- (JSValue)invokeMethod:(NSString *)method withArguments:(NSArray *)arguments
{
  JSC::VM **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  JSObjectRef v16;
  OpaqueJSValue *v17;
  WTF::AtomStringImpl *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  WTF::StringImpl *v25;
  OpaqueJSContext *v26;
  unsigned int *v27;
  const OpaqueJSValue *Property;
  JSContext *context;
  OpaqueJSValue *v30;
  const OpaqueJSContext *v31;
  WTF *v32;
  JSValueRef v33;
  JSValue *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  JSValue *v42;
  _QWORD *v43;
  WTF *v44;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  WTF *v57;
  uint64_t v59;
  WTF::StringImpl *v60;
  JSStringRef propertyName;
  JSValueRef exception;
  uint64_t v63;
  _QWORD *v64;
  _BYTE v65[64];
  WTF *v66;
  unsigned int *v67;

  v7 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef");
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v67, v7[7], v8, v9, v10, v11, v12, v13, v14);
  v15 = -[NSArray count](arguments, "count");
  JSC::MarkedJSValueRefArray::MarkedJSValueRefArray((JSC::MarkedJSValueRefArray *)&v63, -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), v15);
  if (v15)
  {
    v54 = 0;
    v55 = 1;
    do
    {
      objectToValue((objc_object *)self->_context, (__CFString *)-[NSArray objectAtIndex:](arguments, "objectAtIndex:", v54));
      v57 = v66;
      if (!v66)
        v57 = (WTF *)v65;
      *((_QWORD *)v57 + v54) = v56;
      v54 = v55;
    }
    while (v15 > v55++);
  }
  exception = 0;
  v16 = JSValueToObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), self->m_value, &exception);
  if (exception)
  {
    v42 = -[JSContext valueFromNotifyException:](self->_context, "valueFromNotifyException:");
  }
  else
  {
    v17 = v16;
    WTF::String::String(&v60, (CFStringRef)method);
    OpaqueJSString::tryCreate((uint64_t *)&v60, (uint64_t *)&propertyName);
    v25 = v60;
    v60 = 0;
    if (v25)
    {
      if (*(_DWORD *)v25 == 2)
      {
        WTF::StringImpl::~StringImpl(v25, v18, v19, v20, v21, v22, v23, v24);
        WTF::fastFree(v46, v47, v48, v49, v50, v51, v52, v53);
      }
      else
      {
        *(_DWORD *)v25 -= 2;
      }
    }
    v26 = -[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef", v60);
    v27 = (unsigned int *)propertyName;
    Property = JSObjectGetProperty(v26, v17, propertyName, &exception);
    context = self->_context;
    if (exception
      || (v30 = JSValueToObject(-[JSContext JSGlobalContextRef](context, "JSGlobalContextRef"), Property, &exception),
          context = self->_context,
          exception))
    {
      v34 = -[JSContext valueFromNotifyException:](context, "valueFromNotifyException:");
    }
    else
    {
      v31 = -[JSContext JSGlobalContextRef](context, "JSGlobalContextRef");
      if (v66)
        v32 = v66;
      else
        v32 = (WTF *)v65;
      v33 = JSObjectCallAsFunction(v31, v30, v17, v15, (const JSValueRef *)v32, &exception);
      if (exception)
        v34 = -[JSContext valueFromNotifyException:](self->_context, "valueFromNotifyException:");
      else
        v34 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v33, self->_context);
    }
    v42 = v34;
    if (v27)
      WTF::ThreadSafeRefCounted<OpaqueJSString,(WTF::DestructionThread)0>::deref(v27, v35, v36, v37, v38, v39, v40, v41);
  }
  v43 = v64;
  if (v64)
  {
    v59 = v63;
    *v64 = v63;
    *(_QWORD *)(v59 + 8) = v43;
    v63 = 0;
    v64 = 0;
  }
  v44 = v66;
  v66 = 0;
  if (v44)
    WTF::fastFree((unint64_t)v44, v35, v36, v37, v38, v39, v40, v41);
  JSC::JSLockHolder::~JSLockHolder(&v67, v35, v36, v37, v38, v39, v40, v41);
  return v42;
}

- (JSContext)context
{
  return (JSContext *)objc_getProperty(self, a2, 16, 1);
}

- (CGPoint)toPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[JSValue toDouble](-[JSValue objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("x")), "toDouble");
  v4 = v3;
  -[JSValue toDouble](-[JSValue objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("y")), "toDouble");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (NSRange)toRange
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSRange result;

  v3 = -[NSNumber unsignedIntegerValue](-[JSValue toNumber](-[JSValue objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("location")), "toNumber"), "unsignedIntegerValue");
  v4 = -[NSNumber unsignedIntegerValue](-[JSValue toNumber](-[JSValue objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("length")), "toNumber"), "unsignedIntegerValue");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (CGRect)toRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[JSValue toPoint](self, "toPoint");
  v4 = v3;
  v6 = v5;
  -[JSValue toSize](self, "toSize");
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGSize)toSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[JSValue toDouble](-[JSValue objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("width")), "toDouble");
  v4 = v3;
  -[JSValue toDouble](-[JSValue objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("height")), "toDouble");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (JSValue)valueWithPoint:(CGPoint)point inContext:(JSContext *)context
{
  double y;
  _QWORD v7[2];
  _QWORD v8[3];

  y = point.y;
  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("x");
  v7[1] = CFSTR("y");
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", point.x);
  v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  return +[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2), context);
}

+ (JSValue)valueWithRange:(NSRange)range inContext:(JSContext *)context
{
  NSUInteger length;
  _QWORD v7[2];
  _QWORD v8[3];

  length = range.length;
  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("location");
  v7[1] = CFSTR("length");
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", range.location);
  v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", length);
  return +[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2), context);
}

+ (JSValue)valueWithRect:(CGRect)rect inContext:(JSContext *)context
{
  double height;
  double width;
  double y;
  _QWORD v9[4];
  _QWORD v10[5];

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("x");
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", rect.origin.x);
  v9[1] = CFSTR("y");
  v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v9[2] = CFSTR("width");
  v10[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  v9[3] = CFSTR("height");
  v10[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  return +[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4), context);
}

+ (JSValue)valueWithSize:(CGSize)size inContext:(JSContext *)context
{
  double height;
  _QWORD v7[2];
  _QWORD v8[3];

  height = size.height;
  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("width");
  v7[1] = CFSTR("height");
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", size.width);
  v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  return +[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2), context);
}

+ (JSValue)valueWithJSValueRef:(JSValueRef)value inContext:(JSContext *)context
{
  return (JSValue *)-[JSContext wrapperForJSObject:](context, "wrapperForJSObject:", value);
}

- (JSValue)init
{
  return 0;
}

- (JSValue)initWithValue:(OpaqueJSValue *)a3 inContext:(id)a4
{
  JSValue *v6;
  JSContext *v7;
  JSC::JSGlobalObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t m_value;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  _QWORD *v25;
  uint64_t *v26;
  objc_super v28;
  unsigned int *v29;
  _QWORD v30[3];
  uint64_t v31;
  int v32;

  if (a3 && a4)
  {
    v28.receiver = self;
    v28.super_class = (Class)JSValue;
    v6 = -[JSValue init](&v28, sel_init);
    if (v6)
    {
      v7 = (JSContext *)a4;
      v6->m_value = a3;
      v6->_context = v7;
      v8 = -[JSContext JSGlobalContextRef](v7, "JSGlobalContextRef");
      if (v8)
      {
        m_value = (uint64_t)v6->m_value;
        JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v29, v8, v9, v10, v11, v12, v13, v14, v15);
        if (m_value)
          v24 = (m_value & 0xFFFE000000000002) == 0;
        else
          v24 = 0;
        if (v24)
        {
          v25 = (_QWORD *)(m_value & 0xFFFFFFFFFFFFC000 | 8);
          if ((m_value & 8) != 0)
            v25 = (_QWORD *)(m_value - 16);
          v26 = (uint64_t *)(*v25 + 552);
          v31 = m_value;
          v32 = 0;
          WTF::HashMap<JSC::JSCell *,unsigned int,WTF::DefaultHash<JSC::JSCell *>,WTF::HashTraits<JSC::JSCell *>,WTF::HashTraits<unsigned int>,WTF::HashTableTraits>::add<int>(v26, &v31, &v32, v19, v20, v21, v22, v23, (uint64_t)v30);
          ++*(_DWORD *)(v30[0] + 8);
        }
        JSC::JSLockHolder::~JSLockHolder(&v29, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

+ (SEL)selectorForStructToValue:(const char *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SEL result;

  result = (SEL)handerForStructTag(a3, (WTF::AtomStringImpl *)a2, (const WTF::StringImpl *)a3, v3, v4, v5, v6, v7);
  if (result)
    return *(SEL *)result;
  return result;
}

+ (SEL)selectorForValueToStruct:(const char *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SEL result;

  result = (SEL)handerForStructTag(a3, (WTF::AtomStringImpl *)a2, (const WTF::StringImpl *)a3, v3, v4, v5, v6, v7);
  if (result)
    return (SEL)*((_QWORD *)result + 1);
  return result;
}

@end

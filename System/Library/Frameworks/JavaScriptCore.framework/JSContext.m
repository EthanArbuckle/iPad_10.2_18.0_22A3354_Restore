@implementation JSContext

- (JSGlobalContextRef)JSGlobalContextRef
{
  return self->m_context;
}

- (void)ensureWrapperMap
{
  if (!*(_QWORD *)(-[JSContext JSGlobalContextRef](self, "JSGlobalContextRef") + 3288))

}

- (JSContext)init
{
  JSVirtualMachine *v3;
  JSContext *v4;

  v3 = objc_alloc_init(JSVirtualMachine);
  v4 = -[JSContext initWithVirtualMachine:](self, "initWithVirtualMachine:", v3);
  if (v3)
    CFRelease(v3);
  return v4;
}

- (JSContext)initWithVirtualMachine:(JSVirtualMachine *)virtualMachine
{
  JSContext *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JSContext;
  v4 = -[JSContext init](&v7, sel_init);
  if (v4)
  {
    if (virtualMachine)
      CFRetain(virtualMachine);
    m_ptr = v4->m_virtualMachine.m_ptr;
    v4->m_virtualMachine.m_ptr = virtualMachine;
    if (m_ptr)
      CFRelease(m_ptr);
    v4->m_context = JSGlobalContextCreateInGroup(virtualMachine->m_group, 0);
    -[JSContext setExceptionHandler:](v4, "setExceptionHandler:", &__block_literal_global_2);
    -[JSContext ensureWrapperMap](v4, "ensureWrapperMap");
    objc_msgSend(v4->m_virtualMachine.m_ptr, "addContext:forGlobalContextRef:", v4, v4->m_context);
  }
  return v4;
}

uint64_t __36__JSContext_initWithVirtualMachine___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setException:");
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  JSValue *m_slot;
  OpaqueJSContext *m_context;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  OpaqueJSValue **p_m_value;
  uint64_t v31;
  JSContext *context;
  OpaqueJSValue *v33;
  objc_super v34;
  unsigned int *v35;
  OpaqueJSContext *v36;

  m_slot = self->m_exception.m_slot;
  if (m_slot)
  {
    p_m_value = &m_slot[-1].m_value;
    v31 = *(_QWORD *)(((unint64_t)&m_slot[-1].m_value & 0xFFFFFFFFFFFFF000) + 0x10);
    context = m_slot[-1]._context;
    if (context)
    {
      v33 = *p_m_value;
      context->super.isa = *p_m_value;
      *((_QWORD *)v33 + 1) = context;
      *p_m_value = 0;
      p_m_value[1] = 0;
    }
    *p_m_value = *(OpaqueJSValue **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = p_m_value;
    self->m_exception.m_slot = 0;
  }
  m_context = self->m_context;
  v12 = (uint64_t *)*((_QWORD *)m_context + 7);
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v35, (JSC::VM *)v12, v2, v3, v4, v5, v6, v7, v8);
  if (((unint64_t)m_context & 0xFFFE000000000002) == 0)
  {
    v36 = m_context;
    if (WTF::HashCountedSet<JSC::JSCell *,WTF::DefaultHash<JSC::JSCell *>,WTF::HashTraits<JSC::JSCell *>>::remove(v12 + 69, &v36, v14, v15, v16, v17, v18, v19))JSC::Heap::reportAbandonedObjectGraph((JSC::Heap *)(v12 + 24));
  }
  do
  {
    v20 = __ldaxr((unsigned int *)v12);
    v21 = v20 - 1;
  }
  while (__stlxr(v21, (unsigned int *)v12));
  if (!v21)
  {
    atomic_store(1u, (unsigned int *)v12);
    JSC::VM::~VM((JSC::VM *)v12);
    WTF::fastFree(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  JSC::JSLockHolder::~JSLockHolder(&v35, v13, v14, v15, v16, v17, v18, v19);

  v34.receiver = self;
  v34.super_class = (Class)JSContext;
  -[JSContext dealloc](&v34, sel_dealloc);
}

- (JSValue)evaluateScript:(NSString *)script
{
  return -[JSContext evaluateScript:withSourceURL:](self, "evaluateScript:withSourceURL:", script, 0);
}

- (JSValue)evaluateScript:(NSString *)script withSourceURL:(NSURL *)sourceURL
{
  WTF::AtomStringImpl *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::AtomStringImpl *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  unsigned int *v22;
  unsigned int *v23;
  JSValueRef v24;
  JSValue *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  JSValue *v33;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  WTF::StringImpl *v51;
  WTF::StringImpl *v52;
  unsigned int *v53;
  JSValueRef exception;

  exception = 0;
  WTF::String::String(&v52, (CFStringRef)script);
  OpaqueJSString::tryCreate((uint64_t *)&v52, (uint64_t *)&v53);
  v13 = v52;
  v52 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
    {
      WTF::StringImpl::~StringImpl(v13, v6, v7, v8, v9, v10, v11, v12);
      WTF::fastFree(v35, v36, v37, v38, v39, v40, v41, v42);
    }
    else
    {
      *(_DWORD *)v13 -= 2;
    }
  }
  WTF::String::String(&v51, (CFStringRef)-[NSURL absoluteString](sourceURL, "absoluteString"));
  OpaqueJSString::tryCreate((uint64_t *)&v51, (uint64_t *)&v52);
  v21 = v51;
  v51 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
    {
      WTF::StringImpl::~StringImpl(v21, v14, v15, v16, v17, v18, v19, v20);
      WTF::fastFree(v43, v44, v45, v46, v47, v48, v49, v50);
    }
    else
    {
      *(_DWORD *)v21 -= 2;
    }
  }
  v23 = (unsigned int *)v52;
  v22 = v53;
  v24 = JSEvaluateScript(self->m_context, (JSStringRef)v53, 0, v52, 0, &exception);
  if (exception)
    v25 = -[JSContext valueFromNotifyException:](self, "valueFromNotifyException:", v51);
  else
    v25 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v24, self, v51);
  v33 = v25;
  if (v23)
    WTF::ThreadSafeRefCounted<OpaqueJSString,(WTF::DestructionThread)0>::deref(v23, v26, v27, v28, v29, v30, v31, v32);
  if (v22)
    WTF::ThreadSafeRefCounted<OpaqueJSString,(WTF::DestructionThread)0>::deref(v22, v26, v27, v28, v29, v30, v31, v32);
  return v33;
}

- (id)evaluateJSScript:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  unsigned int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  JSValue *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  WTF::AtomStringImpl *v27;
  const WTF::StringImpl *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  WTF::StringImpl *var0;
  uint64_t v36;
  JSValue *v37;
  JSValue *v38;
  SourceProvider *v39;
  int v40;
  WTF::StringImpl *v41;
  WTF::AtomStringImpl *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  WTF::StringImpl *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int *v56;
  unsigned int v57;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  unint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t SlowCase;
  SourceCode v92;
  unsigned int *v93;
  WTF::StringImpl *v94;
  WTF::StringImpl *v95;

  m_context = self->m_context;
  v12 = (unsigned int *)*((_QWORD *)m_context + 7);
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v93, (JSC::VM *)v12, (uint64_t)a3, v3, v4, v5, v6, v7, v8);
  if (objc_msgSend(a3, "type"))
  {
    if (&JSC::JSAPIGlobalObject::s_info != (char **)(16
                                                    * *(unsigned int *)(16 * (*(_DWORD *)m_context & 0xFFFFFFFE) + 0x4C)))
    {
      v17 = +[JSValue valueWithNewPromiseRejectedWithReason:inContext:](JSValue, "valueWithNewPromiseRejectedWithReason:inContext:", +[JSValue valueWithNewErrorFromMessage:inContext:](JSValue, "valueWithNewErrorFromMessage:inContext:", CFSTR("Context does not support module loading"), self), self);
LABEL_39:
      v38 = v17;
      goto LABEL_40;
    }
    v25 = *((_QWORD *)m_context + 7);
    v26 = (unint64_t *)(v25 + 38992);
    WTF::String::String(&v94, (CFStringRef)objc_msgSend((id)objc_msgSend(a3, "sourceURL"), "absoluteString"));
    var0 = v94;
    if (v94)
    {
      if ((*((_BYTE *)v94 + 16) & 0x10) != 0)
      {
        *(_DWORD *)v94 += 2;
      }
      else
      {
        WTF::AtomStringImpl::addSlowCase(*(uint64_t **)(v25 + 41912), (unint64_t)v94, v28, v29, v30, v31, v32, v33, &v92);
        var0 = (WTF::StringImpl *)v92.var0.var0;
      }
    }
    v40 = *(_DWORD *)var0;
    *(_DWORD *)var0 += 2;
    if (v40)
    {
      *(_DWORD *)var0 = v40;
    }
    else
    {
      WTF::StringImpl::~StringImpl(var0, v27, (uint64_t)v28, v29, v30, v31, v32, v33);
      WTF::fastFree(v59, v60, v61, v62, v63, v64, v65, v66);
    }
    v41 = v94;
    v94 = 0;
    v95 = var0;
    if (v41)
    {
      if (*(_DWORD *)v41 == 2)
      {
        WTF::StringImpl::~StringImpl(v41, v27, (uint64_t)v28, v29, v30, v31, v32, v33);
        WTF::fastFree(v67, v68, v69, v70, v71, v72, v73, v74);
      }
      else
      {
        *(_DWORD *)v41 -= 2;
      }
    }
    v43 = JSC::importModule((uint64_t *)m_context, (JSC::VM *)&v95, 10, 10, 0xAuLL, v31, v32, v33, v34);
    if (*(_DWORD *)(v25 + 80))
    {
      v83 = *(_DWORD *)(v25 + 80);
      if ((v83 & 0x27) != 0 && (v83 & 0x20) == 0)
      {
        v86 = v43;
        JSC::VMTraps::handleTraps((JSC::VMTraps *)(v25 + 64), 7u, v43, v44, v45, v46, v47, v48);
        v43 = v86;
      }
      if (*(_QWORD *)(v25 + 16))
      {
LABEL_52:
        v51 = 0;
LABEL_31:
        v53 = v95;
        v95 = 0;
        if (v53)
        {
          if (*(_DWORD *)v53 == 2)
          {
            WTF::StringImpl::~StringImpl(v53, v42, v43, v44, v45, v46, v47, v48);
            WTF::fastFree(v75, v76, v77, v78, v79, v80, v81, v82);
          }
          else
          {
            *(_DWORD *)v53 -= 2;
          }
        }
        v54 = *((_QWORD *)v12 + 2);
        if (v54)
        {
          v55 = *(_QWORD *)(v54 + 8);
          *((_QWORD *)v12 + 2) = 0;
          v56 = v12 + 20;
          do
            v57 = __ldaxr(v56);
          while (__stlxr(v57 & 0xFFFFFFEF, v56));
          v17 = +[JSValue valueWithNewPromiseRejectedWithReason:inContext:](JSValue, "valueWithNewPromiseRejectedWithReason:inContext:", +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v55, self), self);
        }
        else
        {
          v17 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v51, self);
        }
        goto LABEL_39;
      }
    }
    v49 = *((_DWORD *)m_context + 291);
    if (v49)
      v50 = 16 * (v49 & 0xFFFFFFFE);
    else
      v50 = 0;
    v51 = *v26;
    if (*v26 >= *(_QWORD *)(v25 + 39000))
    {
      v51 = *(_QWORD *)(v25 + 39008);
      if ((v51 & 1) != 0)
      {
        v87 = v43;
        JSC::sanitizeStackForVM((JSC *)v25, v42, v43, v44, v45, v46, v47, v48);
        SlowCase = JSC::LocalAllocator::allocateSlowCase(v25 + 38968, v25 + 192, 32, 0, 0, v88, v89, v90);
        v43 = v87;
        v51 = SlowCase;
LABEL_28:
        *(_DWORD *)v51 = 0;
        v52 = *(_DWORD *)(v50 + 8);
        *(_DWORD *)v51 = v50 >> 4;
        *(_DWORD *)(v51 + 4) = v52;
        *(_QWORD *)(v51 + 8) = 0;
        *(_QWORD *)(v51 + 16) = 0;
        *(_QWORD *)(v51 + 24) = 0;
        if (*(_BYTE *)(v25 + 755))
          __dmb(0xAu);
        *(_OWORD *)(v51 + 16) = xmmword_19914EFB0;
        JSC::JSPromise::resolve(v51, (uint64_t *)m_context, v43, v44, v45, v46, v47, v48);
        if (!*(_DWORD *)(v25 + 80))
          goto LABEL_31;
        v85 = *(_DWORD *)(v25 + 80);
        if ((v85 & 0x27) != 0 && (v85 & 0x20) == 0)
          JSC::VMTraps::handleTraps((JSC::VMTraps *)(v25 + 64), 7u, v43, v44, v45, v46, v47, v48);
        if (!*(_QWORD *)(v25 + 16))
          goto LABEL_31;
        goto LABEL_52;
      }
      v84 = *(_QWORD *)(v51 + 8) ^ *(_QWORD *)(v25 + 39016);
      *(_QWORD *)(v25 + 39000) = v51 + HIDWORD(v84);
      *(_QWORD *)(v25 + 39008) = v51 + (int)v84;
    }
    *v26 = v51 + 32;
    goto LABEL_28;
  }
  v95 = 0;
  if (a3)
    objc_msgSend(a3, "sourceCode");
  else
    memset(&v92, 0, sizeof(v92));
  v36 = JSEvaluateScriptInternal(v16, (uint64_t)&v93, (Inspector::JSGlobalObjectInspectorController **)self->m_context, 0, &v92, &v95, v13, v14, v15);
  if (v95)
    v37 = -[JSContext valueFromNotifyException:](self, "valueFromNotifyException:");
  else
    v37 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v36, self);
  v38 = v37;
  v39 = v92.var0.var0;
  v92.var0.var0 = 0;
  if (v39)
  {
    if (*((_DWORD *)v39 + 2) == 1)
      (*(void (**)(SourceProvider *))(*(_QWORD *)v39 + 8))(v39);
    else
      --*((_DWORD *)v39 + 2);
  }
LABEL_40:
  JSC::JSLockHolder::~JSLockHolder(&v93, v18, v19, v20, v21, v22, v23, v24);
  return v38;
}

- (id)dependencyIdentifiersForModuleJSScript:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  WTF::AtomStringImpl *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int *v37;
  unsigned int v38;
  JSValue *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (**v47)(void *, JSContext *, JSValue *);
  JSValue *v48;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (**v58)(void *, JSContext *, JSValue *);
  uint64_t (*v59)(WTF::StringImpl **);
  WTF::StringImpl **v60;
  unsigned int *v61;
  WTF::StringImpl *v62[3];

  m_context = self->m_context;
  v12 = (unsigned int *)*((_QWORD *)m_context + 7);
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v61, (JSC::VM *)v12, (uint64_t)a3, v3, v4, v5, v6, v7, v8);
  if (objc_msgSend(a3, "type") == 1)
  {
    v13 = *((_QWORD *)m_context + 81);
    if ((v13 & 1) != 0)
    {
      v59 = *(uint64_t (**)(WTF::StringImpl **))(v13 & 0xFFFFFFFFFFFFFFFCLL);
      v60 = (WTF::StringImpl **)((unint64_t)m_context & 0xFFFFFFFFFFFFC000 | 8);
      if ((m_context & 8) != 0)
        v60 = (WTF::StringImpl **)((char *)m_context - 16);
      v62[0] = *v60;
      v62[1] = m_context;
      v62[2] = (OpaqueJSContext *)((char *)m_context + 648);
      v13 = v59(v62);
    }
    WTF::String::String(v62, (CFStringRef)objc_msgSend((id)objc_msgSend(a3, "sourceURL"), "absoluteString"));
    v20 = JSC::jsString((uint64_t)v12, (JSC::VM *)v62, v14, v15, v16, v17, v18, v19);
    v33 = JSC::JSModuleLoader::dependencyKeysIfEvaluated((unsigned int *)v13, (uint64_t *)m_context, v20, v21, v22, v23, v24, v25);
    v34 = v62[0];
    v62[0] = 0;
    if (v34)
    {
      if (*(_DWORD *)v34 == 2)
      {
        WTF::StringImpl::~StringImpl(v34, v26, v27, v28, v29, v30, v31, v32);
        WTF::fastFree(v50, v51, v52, v53, v54, v55, v56, v57);
      }
      else
      {
        *(_DWORD *)v34 -= 2;
      }
    }
    v35 = *((_QWORD *)v12 + 2);
    if (v35)
    {
      v36 = *(_QWORD *)(v35 + 8);
      *((_QWORD *)v12 + 2) = 0;
      v37 = v12 + 20;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 & 0xFFFFFFEF, v37));
      v39 = -[JSContext valueFromNotifyException:](self, "valueFromNotifyException:", v36);
    }
    else if (v33)
    {
      v39 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v33, self);
    }
    else
    {
      v58 = -[JSContext exceptionHandler](self, "exceptionHandler");
      v58[2](v58, self, +[JSValue valueWithNewErrorFromMessage:inContext:](JSValue, "valueWithNewErrorFromMessage:inContext:", CFSTR("script has not run in context or was not evaluated successfully"), self));
      v39 = +[JSValue valueWithUndefinedInContext:](JSValue, "valueWithUndefinedInContext:", self);
    }
  }
  else
  {
    v47 = -[JSContext exceptionHandler](self, "exceptionHandler");
    v47[2](v47, self, +[JSValue valueWithNewErrorFromMessage:inContext:](JSValue, "valueWithNewErrorFromMessage:inContext:", CFSTR("script is not a module"), self));
    v39 = +[JSValue valueWithUndefinedInContext:](JSValue, "valueWithUndefinedInContext:", self);
  }
  v48 = v39;
  JSC::JSLockHolder::~JSLockHolder(&v61, v40, v41, v42, v43, v44, v45, v46);
  return v48;
}

- (void)_setITMLDebuggableType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;

  m_context = self->m_context;
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v17, *((JSC::VM **)m_context + 7), v2, v3, v4, v5, v6, v7, v8);
  *(_DWORD *)(*((_QWORD *)m_context + 254) + 48) = 1;
  JSC::JSLockHolder::~JSLockHolder(&v17, v10, v11, v12, v13, v14, v15, v16);
}

- (void)setException:(JSValue *)exception
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  _QWORD *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  JSObjectRef v19;
  JSValue *m_slot;
  uint64_t v21;
  OpaqueJSValue **p_m_value;
  JSContext *v23;
  JSValue *v24;
  JSValue *v25;
  OpaqueJSValue **v26;
  uint64_t v27;
  JSContext *v28;
  OpaqueJSValue *v29;
  JSContext *context;
  uint64_t v31;
  OpaqueJSValue *v32;
  unsigned int *v33;

  v11 = (_QWORD *)*((_QWORD *)self->m_context + 7);
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v33, (JSC::VM *)v11, (uint64_t)exception, v3, v4, v5, v6, v7, v8);
  if (exception)
  {
    v19 = JSValueToObject(self->m_context, exception->m_value, 0);
    m_slot = self->m_exception.m_slot;
    if (!m_slot)
    {
      v21 = v11[89];
      if (!v21)
      {
        v32 = v19;
        JSC::HandleSet::grow((JSC::HandleSet *)(v11 + 84), (uint64_t)v12, v13, v14, v15, v16, v17, v18);
        v19 = v32;
        v21 = v11[89];
      }
      v11[89] = *(_QWORD *)v21;
      *(_QWORD *)(v21 + 16) = 0;
      m_slot = (JSValue *)(v21 + 16);
      *(_QWORD *)v21 = 0;
      *(_QWORD *)(v21 + 8) = 0;
      self->m_exception.m_slot = (JSValue *)(v21 + 16);
    }
    p_m_value = &m_slot[-1].m_value;
    if ((v19 != 0) != (m_slot->super.isa != 0))
    {
      if (v19)
      {
        v23 = *(JSContext **)(((unint64_t)p_m_value & 0xFFFFFFFFFFFFF000) + 0x10);
        v24 = v23->m_exception.m_slot;
        v23 = (JSContext *)((char *)v23 + 24);
        *p_m_value = (OpaqueJSValue *)v24;
        m_slot[-1]._context = v23;
        v23->super.isa = (Class)p_m_value;
        v24->m_value = (OpaqueJSValue *)p_m_value;
      }
      else
      {
        v31 = (uint64_t)*p_m_value;
        context = m_slot[-1]._context;
        context->super.isa = *p_m_value;
        *(_QWORD *)(v31 + 8) = context;
        *p_m_value = 0;
        p_m_value[1] = 0;
        m_slot = self->m_exception.m_slot;
      }
    }
    m_slot->super.isa = v19;
  }
  else
  {
    v25 = self->m_exception.m_slot;
    if (v25)
    {
      v26 = &v25[-1].m_value;
      v27 = *(_QWORD *)(((unint64_t)&v25[-1].m_value & 0xFFFFFFFFFFFFF000) + 0x10);
      v28 = v25[-1]._context;
      if (v28)
      {
        v29 = *v26;
        v28->super.isa = *v26;
        *((_QWORD *)v29 + 1) = v28;
        *v26 = 0;
        v26[1] = 0;
      }
      *v26 = *(OpaqueJSValue **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;
      self->m_exception.m_slot = 0;
    }
  }
  JSC::JSLockHolder::~JSLockHolder(&v33, v12, v13, v14, v15, v16, v17, v18);
}

- (JSValue)exception
{
  JSValue *m_slot;

  m_slot = self->m_exception.m_slot;
  if (m_slot && m_slot->super.isa)
    return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", m_slot->super.isa, self);
  else
    return 0;
}

- (JSValue)globalObject
{
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", JSContextGetGlobalObject(self->m_context), self);
}

+ (JSContext)currentContext
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
  if (!v2)
    v2 = WTF::Thread::initializeCurrentTLS(0);
  v3 = *(_QWORD *)(v2 + 88);
  if (v3)
    return *(JSContext **)(v3 + 8);
  else
    return 0;
}

+ (JSValue)currentThis
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
  if (!v2)
    v2 = WTF::Thread::initializeCurrentTLS(0);
  v3 = *(_QWORD *)(v2 + 88);
  if (v3)
    return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", *(_QWORD *)(v3 + 32), +[JSContext currentContext](JSContext, "currentContext"));
  else
    return 0;
}

+ (JSValue)currentCallee
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
  if (!v2)
    v2 = WTF::Thread::initializeCurrentTLS(0);
  v3 = *(_QWORD *)(v2 + 88);
  if (v3 && (v4 = *(_QWORD *)(v3 + 24)) != 0)
    return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v4, +[JSContext currentContext](JSContext, "currentContext"));
  else
    return 0;
}

+ (NSArray)currentArguments
{
  uint64_t v2;
  uint64_t v3;
  NSArray *v4;
  JSContext *v5;
  uint64_t v6;
  uint64_t i;
  const void *v8;

  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
  if (!v2)
    v2 = WTF::Thread::initializeCurrentTLS(0);
  v3 = *(_QWORD *)(v2 + 88);
  if (!v3)
    return 0;
  v4 = *(NSArray **)(v3 + 56);
  if (!v4)
  {
    v5 = +[JSContext currentContext](JSContext, "currentContext");
    v6 = *(_QWORD *)(v3 + 40);
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    if (v6)
    {
      for (i = 0; i != v6; ++i)
        -[NSArray setObject:atIndexedSubscript:](v4, "setObject:atIndexedSubscript:", +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * i), v5), i);
    }
    v8 = *(const void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v4;
    if (v8)
    {
      CFRelease(v8);
      return *(NSArray **)(v3 + 56);
    }
  }
  return v4;
}

- (JSVirtualMachine)virtualMachine
{
  return (JSVirtualMachine *)self->m_virtualMachine.m_ptr;
}

- (NSString)name
{
  OpaqueJSString *v2;
  unint64_t v3;
  CFStringRef v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = JSGlobalContextCopyName(self->m_context);
  if (!v2)
    return 0;
  v3 = (unint64_t)v2;
  v4 = JSStringCopyCFString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2);
  v12 = (id)CFMakeCollectable(v4);
  do
  {
    v13 = __ldaxr((unsigned int *)v3);
    v14 = v13 - 1;
  }
  while (__stlxr(v14, (unsigned int *)v3));
  if (!v14)
  {
    atomic_store(1u, (unsigned int *)v3);
    v15 = atomic_load((unint64_t *)(v3 + 16));
    if (v15)
    {
      v16 = *(_QWORD *)(v3 + 8);
      if (!v16 || (*(_BYTE *)(v16 + 16) & 4) != 0 || *(_QWORD *)(v16 + 8) != v15)
        WTF::fastFree(v15, v5, v6, v7, v8, v9, v10, v11);
    }
    v17 = *(WTF::StringImpl **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
      {
        WTF::StringImpl::~StringImpl(v17, (WTF::AtomStringImpl *)v5, v6, v7, v8, v9, v10, v11);
        WTF::fastFree(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      else
      {
        *(_DWORD *)v17 -= 2;
      }
    }
    WTF::fastFree(v3, v5, v6, v7, v8, v9, v10, v11);
  }
  return v12;
}

- (void)setName:(NSString *)name
{
  OpaqueJSContext *m_context;
  OpaqueJSString *v4;
  unint64_t v5;
  uint64_t v6;
  WTF::StringImpl *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  WTF::StringImpl *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  WTF::StringImpl *v36;

  m_context = self->m_context;
  WTF::String::String(&v36, (CFStringRef)name);
  if (!v36)
  {
    JSGlobalContextSetName(m_context, 0);
    goto LABEL_6;
  }
  v4 = (OpaqueJSString *)WTF::fastMalloc((WTF *)0x18);
  v5 = (unint64_t)v4;
  v6 = 0;
  *(_DWORD *)v4 = 1;
  v7 = v36;
  v36 = 0;
  *((_QWORD *)v4 + 1) = v7;
  if (v7)
  {
    if ((*((_BYTE *)v7 + 16) & 4) != 0)
      v6 = 0;
    else
      v6 = *((_QWORD *)v7 + 1);
  }
  *((_QWORD *)v4 + 2) = v6;
  JSGlobalContextSetName(m_context, v4);
  do
  {
    v15 = __ldaxr((unsigned int *)v5);
    v16 = v15 - 1;
  }
  while (__stlxr(v16, (unsigned int *)v5));
  if (!v16)
  {
    atomic_store(1u, (unsigned int *)v5);
    v26 = atomic_load((unint64_t *)(v5 + 16));
    v27 = *(_QWORD *)(v5 + 8);
    if (v26)
    {
      if (v27 && (*(_BYTE *)(v27 + 16) & 4) == 0 && *(_QWORD *)(v27 + 8) == v26)
      {
        *(_QWORD *)(v5 + 8) = 0;
        goto LABEL_16;
      }
      WTF::fastFree(v26, v8, v9, v10, v11, v12, v13, v14);
      v27 = *(_QWORD *)(v5 + 8);
    }
    *(_QWORD *)(v5 + 8) = 0;
    if (!v27)
    {
LABEL_18:
      WTF::fastFree(v5, v8, v9, v10, v11, v12, v13, v14);
      goto LABEL_6;
    }
LABEL_16:
    if (*(_DWORD *)v27 == 2)
    {
      WTF::StringImpl::~StringImpl((WTF::StringImpl *)v27, (WTF::AtomStringImpl *)v8, v9, v10, v11, v12, v13, v14);
      WTF::fastFree(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    else
    {
      *(_DWORD *)v27 -= 2;
    }
    goto LABEL_18;
  }
LABEL_6:
  v17 = v36;
  v36 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
    {
      WTF::StringImpl::~StringImpl(v17, (WTF::AtomStringImpl *)v8, v9, v10, v11, v12, v13, v14);
      WTF::fastFree(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      *(_DWORD *)v17 -= 2;
    }
  }
}

- (BOOL)isInspectable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int *v20;

  m_context = self->m_context;
  if (m_context)
  {
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v20, *((JSC::VM **)m_context + 7), v2, v3, v4, v5, v6, v7, v8);
    v17 = *(unsigned __int8 *)(*((_QWORD *)m_context + 254) + 20);
    LOBYTE(m_context) = (v17 & 7) == 0 && v17 < 3;
    JSC::JSLockHolder::~JSLockHolder(&v20, v10, v11, v12, v13, v14, v15, v16);
  }
  return (char)m_context;
}

- (void)setInspectable:(BOOL)inspectable
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;

  m_context = self->m_context;
  if (m_context)
  {
    v10 = inspectable;
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v18, *((JSC::VM **)m_context + 7), inspectable, v3, v4, v5, v6, v7, v8);
    Inspector::RemoteInspectionTarget::setInspectable(*((Inspector::RemoteInspectionTarget **)m_context + 254), v10);
    JSC::JSLockHolder::~JSLockHolder(&v18, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (BOOL)_includesNativeCallStackWhenReportingExceptions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v18;

  m_context = self->m_context;
  if (m_context)
  {
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v18, *((JSC::VM **)m_context + 7), v2, v3, v4, v5, v6, v7, v8);
    LOBYTE(m_context) = *(_BYTE *)(*((_QWORD *)m_context + 253) + 128) != 0;
    JSC::JSLockHolder::~JSLockHolder(&v18, v10, v11, v12, v13, v14, v15, v16);
  }
  return (char)m_context;
}

- (void)_setIncludesNativeCallStackWhenReportingExceptions:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;

  m_context = self->m_context;
  if (m_context)
  {
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v18, *((JSC::VM **)m_context + 7), a3, v3, v4, v5, v6, v7, v8);
    *(_BYTE *)(*((_QWORD *)m_context + 253) + 128) = a3;
    JSC::JSLockHolder::~JSLockHolder(&v18, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (__CFRunLoop)_debuggerRunLoop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v18;

  m_context = self->m_context;
  if (m_context)
  {
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v18, *((JSC::VM **)m_context + 7), v2, v3, v4, v5, v6, v7, v8);
    m_context = *(OpaqueJSContext **)(*((_QWORD *)m_context + 254) + 24);
    JSC::JSLockHolder::~JSLockHolder(&v18, v10, v11, v12, v13, v14, v15, v16);
  }
  return m_context;
}

- (void)_setDebuggerRunLoop:(__CFRunLoop *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  OpaqueJSContext *m_context;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  unsigned int *v20;

  m_context = self->m_context;
  if (m_context)
  {
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v20, *((JSC::VM **)m_context + 7), (uint64_t)a3, v3, v4, v5, v6, v7, v8);
    v18 = *((_QWORD *)m_context + 254);
    if (a3)
      CFRetain(a3);
    v19 = *(const void **)(v18 + 24);
    *(_QWORD *)(v18 + 24) = a3;
    if (v19)
      CFRelease(v19);
    JSC::JSLockHolder::~JSLockHolder(&v20, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (id)moduleLoaderDelegate
{
  return objc_loadWeak(&self->m_moduleLoaderDelegate.m_weakReference);
}

- (void)setModuleLoaderDelegate:(id)a3
{
  objc_storeWeak(&self->m_moduleLoaderDelegate.m_weakReference, a3);
}

- (void)exceptionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setExceptionHandler:(void *)exceptionHandler
{
  objc_setProperty_atomic_copy(self, a2, exceptionHandler, 40);
}

- (void).cxx_destruct
{
  JSValue *m_slot;
  void *m_ptr;
  OpaqueJSValue **p_m_value;
  uint64_t v6;
  JSContext *context;
  OpaqueJSValue *v8;

  objc_destroyWeak(&self->m_moduleLoaderDelegate.m_weakReference);
  m_slot = self->m_exception.m_slot;
  if (m_slot)
  {
    p_m_value = &m_slot[-1].m_value;
    v6 = *(_QWORD *)(((unint64_t)&m_slot[-1].m_value & 0xFFFFFFFFFFFFF000) + 0x10);
    context = m_slot[-1]._context;
    if (context)
    {
      v8 = *p_m_value;
      context->super.isa = *p_m_value;
      *((_QWORD *)v8 + 1) = context;
      *p_m_value = 0;
      p_m_value[1] = 0;
    }
    *p_m_value = *(OpaqueJSValue **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = p_m_value;
    self->m_exception.m_slot = 0;
  }
  m_ptr = self->m_virtualMachine.m_ptr;
  self->m_virtualMachine.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (JSValue)objectForKeyedSubscript:(id)key
{
  return -[JSValue objectForKeyedSubscript:](-[JSContext globalObject](self, "globalObject"), "objectForKeyedSubscript:", key);
}

- (void)setObject:(id)object forKeyedSubscript:(NSObject *)key
{
  -[JSValue setObject:forKeyedSubscript:](-[JSContext globalObject](self, "globalObject"), "setObject:forKeyedSubscript:", object, key);
}

- (JSContext)initWithGlobalContextRef:(OpaqueJSContext *)a3
{
  JSContext *v4;
  JSVirtualMachine *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  JSVirtualMachine *v13;
  void *m_ptr;
  JSC::VM *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  _QWORD *v25;
  uint64_t *v26;
  objc_super v27;
  unsigned int *v28;
  _QWORD v29[3];
  OpaqueJSContext *v30;
  int v31;

  v27.receiver = self;
  v27.super_class = (Class)JSContext;
  v4 = -[JSContext init](&v27, sel_init);
  if (v4)
  {
    v5 = +[JSVirtualMachine virtualMachineWithContextGroupRef:](JSVirtualMachine, "virtualMachineWithContextGroupRef:", *((_QWORD *)a3 + 7));
    v13 = v5;
    if (v5)
      CFRetain(v5);
    m_ptr = v4->m_virtualMachine.m_ptr;
    v4->m_virtualMachine.m_ptr = v13;
    if (m_ptr)
      CFRelease(m_ptr);
    v15 = (JSC::VM *)*((_QWORD *)a3 + 7);
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v28, v15, v6, v7, v8, v9, v10, v11, v12);
    if (((unint64_t)a3 & 0xFFFE000000000002) == 0)
    {
      v25 = (_QWORD *)((unint64_t)a3 & 0xFFFFFFFFFFFFC000 | 8);
      if ((a3 & 8) != 0)
        v25 = (_QWORD *)((char *)a3 - 16);
      v26 = (uint64_t *)(*v25 + 552);
      v30 = a3;
      v31 = 0;
      WTF::HashMap<JSC::JSCell *,unsigned int,WTF::DefaultHash<JSC::JSCell *>,WTF::HashTraits<JSC::JSCell *>,WTF::HashTraits<unsigned int>,WTF::HashTableTraits>::add<int>(v26, (uint64_t *)&v30, &v31, v18, v19, v20, v21, v22, (uint64_t)v29);
      ++*(_DWORD *)(v29[0] + 8);
    }
    do
      v23 = __ldaxr((unsigned int *)v15);
    while (__stlxr(v23 + 1, (unsigned int *)v15));
    JSC::JSLockHolder::~JSLockHolder(&v28, v16, v17, v18, v19, v20, v21, v22);
    v4->m_context = a3;
    -[JSContext ensureWrapperMap](v4, "ensureWrapperMap");
    -[JSContext setExceptionHandler:](v4, "setExceptionHandler:", &__block_literal_global_91);
    objc_msgSend(v4->m_virtualMachine.m_ptr, "addContext:forGlobalContextRef:", v4, v4->m_context);
  }
  return v4;
}

uint64_t __48__JSContext_Internal__initWithGlobalContextRef___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setException:");
}

- (void)notifyException:(OpaqueJSValue *)a3
{
  void (**v5)(void *, JSContext *, JSValue *);

  v5 = -[JSContext exceptionHandler](self, "exceptionHandler");
  v5[2](v5, self, +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", a3, self));
}

- (id)valueFromNotifyException:(OpaqueJSValue *)a3
{
  -[JSContext notifyException:](self, "notifyException:", a3);
  return +[JSValue valueWithUndefinedInContext:](JSValue, "valueWithUndefinedInContext:", self);
}

- (BOOL)BOOLFromNotifyException:(OpaqueJSValue *)a3
{
  -[JSContext notifyException:](self, "notifyException:", a3);
  return 0;
}

- (void)beginCallbackWithData:(void *)a3 calleeValue:(OpaqueJSValue *)a4 thisValue:(OpaqueJSValue *)a5 argumentCount:(unint64_t)a6 arguments:(const OpaqueJSValue *)a7
{
  uint64_t v13;
  JSContext *v14;
  uint64_t v15;
  JSValue *v16;
  JSValue *v17;
  const void *v18;
  const void *v19;

  v13 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
  if (!v13)
    v13 = WTF::Thread::initializeCurrentTLS((WTF::Thread *)self);
  v14 = self;
  v15 = *(_QWORD *)(v13 + 88);
  v16 = -[JSContext exception](self, "exception");
  v17 = v16;
  if (v16)
    CFRetain(v16);
  *(_QWORD *)a3 = v15;
  *((_QWORD *)a3 + 1) = self;
  v18 = (const void *)*((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = v17;
  if (v18)
    CFRelease(v18);
  *((_QWORD *)a3 + 3) = a4;
  *((_QWORD *)a3 + 4) = a5;
  *((_QWORD *)a3 + 5) = a6;
  *((_QWORD *)a3 + 6) = a7;
  v19 = (const void *)*((_QWORD *)a3 + 7);
  *((_QWORD *)a3 + 7) = 0;
  if (v19)
    CFRelease(v19);
  *(_QWORD *)(v13 + 88) = a3;
  -[JSContext setException:](self, "setException:", 0);
}

- (void)endCallbackWithData:(void *)a3
{
  uint64_t v4;
  JSContext *v5;

  v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
  v5 = self;
  if (!v4)
  {
    v4 = WTF::Thread::initializeCurrentTLS((WTF::Thread *)self);
    self = v5;
  }
  -[JSContext setException:](self, "setException:", *((_QWORD *)a3 + 2));
  *(_QWORD *)(v4 + 88) = *(_QWORD *)a3;

}

- (id)wrapperForObjCObject:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v20;

  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v20, self->m_context, (uint64_t)a3, v3, v4, v5, v6, v7, v8);
  v11 = (void *)objc_msgSend(-[JSContext wrapperMap](self, "wrapperMap"), "jsWrapperForObject:inContext:", a3, self);
  JSC::JSLockHolder::~JSLockHolder(&v20, v12, v13, v14, v15, v16, v17, v18);
  return v11;
}

- (id)wrapperMap
{
  return (id)*((_QWORD *)self->m_context + 411);
}

- (id)wrapperForJSObject:(OpaqueJSValue *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v20;

  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v20, self->m_context, (uint64_t)a3, v3, v4, v5, v6, v7, v8);
  v11 = (void *)objc_msgSend(-[JSContext wrapperMap](self, "wrapperMap"), "objcWrapperForJSValueRef:inContext:", a3, self);
  JSC::JSLockHolder::~JSLockHolder(&v20, v12, v13, v14, v15, v16, v17, v18);
  return v11;
}

+ (JSContext)contextWithJSGlobalContextRef:(JSGlobalContextRef)jsGlobalContextRef
{
  JSContext *v4;
  JSContext *v5;

  v4 = -[JSVirtualMachine contextForGlobalContextRef:](+[JSVirtualMachine virtualMachineWithContextGroupRef:](JSVirtualMachine, "virtualMachineWithContextGroupRef:", *((_QWORD *)jsGlobalContextRef + 7)), "contextForGlobalContextRef:", jsGlobalContextRef);
  if (v4)
  {
    v5 = v4;
    CFRetain(v4);
  }
  else
  {
    v5 = -[JSContext initWithGlobalContextRef:]([JSContext alloc], "initWithGlobalContextRef:", jsGlobalContextRef);
  }
  return (JSContext *)(id)CFMakeCollectable(v5);
}

@end

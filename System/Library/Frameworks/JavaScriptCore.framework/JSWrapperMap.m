@implementation JSWrapperMap

- (JSWrapperMap)initWithGlobalContextRef:(OpaqueJSContext *)a3
{
  JSWrapperMap *v4;
  uint64_t v5;
  void *m_ptr;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t value;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  id v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  _BYTE v36[24];
  _QWORD *v37;

  v35.receiver = self;
  v35.super_class = (Class)JSWrapperMap;
  v4 = -[JSWrapperMap init](&v35, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 5, 0);
    m_ptr = v4->m_cachedObjCWrappers.m_ptr;
    v4->m_cachedObjCWrappers.m_ptr = (void *)v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = *((_QWORD *)a3 + 7);
    v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v8 = off_1E357B958;
    v8[1] = 0;
    v8[2] = v7;
    v37 = v8;
    WTF::HashTable<JSC::WeakGCHashTable *,JSC::WeakGCHashTable *,WTF::IdentityExtractor,WTF::DefaultHash<JSC::WeakGCHashTable *>,WTF::HashTraits<JSC::WeakGCHashTable *>,WTF::HashTraits<JSC::WeakGCHashTable *>>::add((uint64_t *)(v7 + 920), (uint64_t *)&v37, v9, v10, v11, v12, v13, (uint64_t)v36);
    value = (unint64_t)v4->m_cachedJSWrappers.__ptr_.__value_;
    v4->m_cachedJSWrappers.__ptr_.__value_ = v8;
    if (value)
    {
      JSC::Heap::unregisterWeakGCHashTable((uint64_t *)(*(_QWORD *)(value + 16) + 192), value, v14, v15, v16, v17, v18, v19);
      v28 = *(_QWORD *)(value + 8);
      if (v28)
      {
        v33 = *(unsigned int *)(v28 - 4);
        if ((_DWORD)v33)
        {
          v34 = v28 + 8;
          do
          {
            if (*(_QWORD *)(v34 - 8) != -1 && *(_QWORD *)v34)
            {
              *(_QWORD *)(*(_QWORD *)v34 + 8) = 3;
              *(_QWORD *)v34 = 0;
            }
            v34 += 16;
            --v33;
          }
          while (v33);
        }
        WTF::fastFree(v28 - 16, v21, v22, v23, v24, v25, v26, v27);
      }
      WTF::fastFree(value, v21, v22, v23, v24, v25, v26, v27);
    }
    CFRetain(v4);
    v29 = (const void *)*((_QWORD *)a3 + 411);
    *((_QWORD *)a3 + 411) = v4;
    if (v29)
      CFRelease(v29);
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v31 = v4->m_classMap.m_ptr;
    v4->m_classMap.m_ptr = v30;
    if (v31)
      CFRelease(v31);
  }
  return v4;
}

- (id)classInfoForClass:(Class)a3
{
  id v5;
  Protocol *Protocol;
  _QWORD v8[5];
  char v9;

  if (!a3)
    return 0;
  v5 = (id)objc_msgSend(self->m_classMap.m_ptr, "objectForKeyedSubscript:");
  if (!v5)
  {
    if (*class_getName(a3) != 95)
      goto LABEL_7;
    v9 = 0;
    {
      Protocol = (Protocol *)getJSExportProtocol(void)::protocol;
    }
    else
    {
      Protocol = objc_getProtocol("JSExport");
      getJSExportProtocol(void)::protocol = (uint64_t)Protocol;
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3321888768;
    v8[2] = __34__JSWrapperMap_classInfoForClass___block_invoke;
    v8[3] = &__block_descriptor_40_e8_32c47_ZTSKZ34__JSWrapperMap_classInfoForClass__E3__0_e22_v24__0__Protocol_8_B16l;
    v8[4] = &v9;
    forEachProtocolImplementingProtocol(a3, Protocol, (uint64_t)v8);
    if (!v9)
    {
      v5 = -[JSWrapperMap classInfoForClass:](self, "classInfoForClass:", class_getSuperclass(a3));
      objc_msgSend(self->m_classMap.m_ptr, "setObject:forKeyedSubscript:", v5, a3);
    }
    else
    {
LABEL_7:
      v5 = -[JSObjCClassInfo initForClass:]([JSObjCClassInfo alloc], "initForClass:", a3);
      objc_msgSend(self->m_classMap.m_ptr, "setObject:forKeyedSubscript:", v5, a3);
      if (v5)
        CFRelease(v5);
    }
  }
  return v5;
}

uint64_t __34__JSWrapperMap_classInfoForClass___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  **(_BYTE **)(result + 32) = 1;
  *a3 = 1;
  return result;
}

- (id)jsWrapperForObject:(id)a3 inContext:(id)a4
{
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  objc_class *Class;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *value;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int v33;
  id *v34;
  id v35;
  id *v36;
  int v37;
  _QWORD *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  unint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  _QWORD *v64;

  v7 = *((_QWORD *)self->m_cachedJSWrappers.__ptr_.__value_ + 1);
  if (v7)
  {
    v8 = *(_DWORD *)(v7 - 8);
    v9 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
    v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
    v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
    v12 = v8 & ((v11 >> 31) ^ v11);
    v13 = *(id *)(v7 + 16 * v12);
    if (v13 == a3)
    {
LABEL_6:
      v15 = *(_QWORD *)(v7 + 16 * v12 + 8);
      if (v15 && (*(_BYTE *)(v15 + 8) & 3) == 0 && *(_QWORD *)v15)
        return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:");
    }
    else
    {
      v14 = 1;
      while (v13)
      {
        v12 = ((_DWORD)v12 + v14) & v8;
        v13 = *(id *)(v7 + 16 * v12);
        ++v14;
        if (v13 == a3)
          goto LABEL_6;
      }
    }
  }
  Class = object_getClass(a3);
  if (class_isMetaClass(Class))
    v17 = objc_msgSend(-[JSWrapperMap classInfoForClass:](self, "classInfoForClass:", a3), "constructorInContext:", a4);
  else
    v17 = objc_msgSend(-[JSWrapperMap classInfoForClass:](self, "classInfoForClass:", objc_opt_class()), "wrapperForObject:inContext:", a3, a4);
  v23 = v17;
  value = self->m_cachedJSWrappers.__ptr_.__value_;
  if (v17)
  {
    v48 = (v17 - 112) | 1;
    if ((v17 & 8) == 0)
      v48 = v17 & 0xFFFFFFFFFFFFC000;
    if ((v48 & 1) != 0)
      v49 = v48 + 47;
    else
      v49 = *(_QWORD *)v48 + 32;
    v25 = *(uint64_t **)(v49 + 16);
    if (!v25)
    {
      v63 = v48;
      v64 = (_QWORD *)v49;
      while (1)
      {
        v50 = *(_QWORD **)(v49 + 24);
        if (!v50)
          break;
        v49 = (uint64_t)v64;
        v64[3] = v50[2];
        v25 = (uint64_t *)v50[4];
        v50[3] = 257;
        v50[4] = 0;
        if (v25)
          goto LABEL_50;
      }
      v51 = v64[6];
      if (!v64[1])
      {
        v52 = *(_QWORD **)(v51 + 488);
        *v64 = v51 + 480;
        v64[1] = v52;
        *v52 = v64;
        *(_QWORD *)(v51 + 488) = v64;
      }
      *(_QWORD *)(v51 + 1072) += 1024;
      v53 = (_QWORD *)WTF::fastMalloc((WTF *)0x400);
      JSC::WeakBlock::WeakBlock((uint64_t)v53, v63);
      JSC::Heap::didAllocate((JSC::Heap *)(v64[6] + 192), 0x400uLL, v54, v55, v56, v57, v58, v59);
      v49 = (uint64_t)v64;
      v60 = v64 + 4;
      v61 = v64[5];
      if (v61)
        v60 = (_QWORD *)(v61 + 16);
      *v60 = v53;
      v64[5] = v53;
      v53[1] = v61;
      v53[2] = 0;
      v62 = (uint64_t *)v53[4];
      v53[3] = 257;
      v53[4] = 0;
      v25 = v62;
    }
LABEL_50:
    *(_QWORD *)(v49 + 16) = *v25;
    *v25 = v23;
    v25[1] = 0;
    v25[2] = 0;
  }
  else
  {
    v25 = 0;
  }
  v28 = value[1];
  v27 = value + 1;
  v26 = v28;
  if (v28
    || (WTF::HashTable<objc_object *,WTF::KeyValuePair<objc_object *,JSC::Weak<JSC::JSObject>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_object *,JSC::Weak<JSC::JSObject>>>,WTF::DefaultHash<objc_object *>,WTF::HashMap<objc_object *,JSC::Weak<JSC::JSObject>,WTF::DefaultHash<objc_object *>,WTF::HashTraits<objc_object *>,WTF::HashTraits<JSC::Weak<JSC::JSObject>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_object *>>::rehash(v27, 8uLL, 0, v18, v19, v20, v21, v22), (v26 = *v27) != 0))
  {
    v29 = *(_DWORD *)(v26 - 8);
  }
  else
  {
    v29 = 0;
  }
  v30 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
  v31 = 9 * ((v30 + ~(v30 << 13)) ^ ((v30 + ~(v30 << 13)) >> 8));
  v32 = (v31 ^ (v31 >> 15)) + ~((v31 ^ (v31 >> 15)) << 27);
  v33 = v29 & ((v32 >> 31) ^ v32);
  v34 = (id *)(v26 + 16 * v33);
  v35 = *v34;
  if (!*v34)
  {
LABEL_25:
    v38 = v34[1];
    *v34 = a3;
    v34[1] = v25;
    if (v38)
      v38[1] = 3;
    v39 = *v27;
    if (*v27)
      v40 = *(_DWORD *)(v39 - 12) + 1;
    else
      v40 = 1;
    *(_DWORD *)(v39 - 12) = v40;
    v41 = *v27;
    if (*v27)
      v42 = *(_DWORD *)(v41 - 12);
    else
      v42 = 0;
    v43 = (*(_DWORD *)(v41 - 16) + v42);
    v44 = *(unsigned int *)(v41 - 4);
    if (v44 > 0x400)
    {
      if (v44 > 2 * v43)
        return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:");
    }
    else
    {
      if (3 * v44 > 4 * v43)
        return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:");
      if (!(_DWORD)v44)
      {
        v45 = 8;
        goto LABEL_39;
      }
    }
    v45 = ((_DWORD)v44 << (6 * *(_DWORD *)(v41 - 12) >= (2 * v44)));
LABEL_39:
    WTF::HashTable<objc_object *,WTF::KeyValuePair<objc_object *,JSC::Weak<JSC::JSObject>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_object *,JSC::Weak<JSC::JSObject>>>,WTF::DefaultHash<objc_object *>,WTF::HashMap<objc_object *,JSC::Weak<JSC::JSObject>,WTF::DefaultHash<objc_object *>,WTF::HashTraits<objc_object *>,WTF::HashTraits<JSC::Weak<JSC::JSObject>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_object *>>::rehash(v27, v45, (uint64_t)v34, v18, v19, v20, v21, v22);
    return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:");
  }
  v36 = 0;
  v37 = 1;
  while (v35 != a3)
  {
    if (v35 == (id)-1)
      v36 = v34;
    v33 = (v33 + v37) & v29;
    v34 = (id *)(v26 + 16 * v33);
    v35 = *v34;
    ++v37;
    if (!*v34)
    {
      if (v36)
      {
        *v36 = 0;
        v36[1] = 0;
        --*(_DWORD *)(*v27 - 16);
        v34 = v36;
      }
      goto LABEL_25;
    }
  }
  v46 = v34[1];
  v34[1] = v25;
  if (v46)
    v46[1] = 3;
  return +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:");
}

- (id)objcWrapperForJSValueRef:(OpaqueJSValue *)a3 inContext:(id)a4
{
  JSValue *v7;
  JSValue *v8;

  v7 = (JSValue *)NSMapGet((NSMapTable *)self->m_cachedObjCWrappers.m_ptr, a3);
  if (v7)
  {
    v8 = v7;
    CFRetain(v7);
  }
  else
  {
    v8 = -[JSValue initWithValue:inContext:]([JSValue alloc], "initWithValue:inContext:", a3, a4);
    NSMapInsert((NSMapTable *)self->m_cachedObjCWrappers.m_ptr, a3, v8);
  }
  return (id)(id)CFMakeCollectable(v8);
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *m_ptr;
  _QWORD *value;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  m_ptr = self->m_cachedObjCWrappers.m_ptr;
  self->m_cachedObjCWrappers.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  value = self->m_cachedJSWrappers.__ptr_.__value_;
  self->m_cachedJSWrappers.__ptr_.__value_ = 0;
  if (value)
  {
    JSC::Heap::unregisterWeakGCHashTable((uint64_t *)(value[2] + 192), (uint64_t)value, v2, v3, v4, v5, v6, v7);
    v18 = value[1];
    if (v18)
    {
      v20 = *(unsigned int *)(v18 - 4);
      if ((_DWORD)v20)
      {
        v21 = v18 + 8;
        do
        {
          if (*(_QWORD *)(v21 - 8) != -1 && *(_QWORD *)v21)
          {
            *(_QWORD *)(*(_QWORD *)v21 + 8) = 3;
            *(_QWORD *)v21 = 0;
          }
          v21 += 16;
          --v20;
        }
        while (v20);
      }
      WTF::fastFree(v18 - 16, v11, v12, v13, v14, v15, v16, v17);
    }
    WTF::fastFree((unint64_t)value, v11, v12, v13, v14, v15, v16, v17);
  }
  v19 = self->m_classMap.m_ptr;
  self->m_classMap.m_ptr = 0;
  if (v19)
    CFRelease(v19);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

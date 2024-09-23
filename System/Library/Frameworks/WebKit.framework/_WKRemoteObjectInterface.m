@implementation _WKRemoteObjectInterface

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)remoteObjectInterfaceWithProtocol:(id)a3
{
  const void *v3;

  v3 = (const void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtocol:identifier:", a3, NSStringFromProtocol((Protocol *)a3));
  return (id)(id)CFMakeCollectable(v3);
}

- (_WKRemoteObjectInterface)initWithProtocol:(id)a3 identifier:(id)a4
{
  _WKRemoteObjectInterface *v6;
  _WKRemoteObjectInterface *v7;
  uint64_t v8;
  void *m_ptr;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_WKRemoteObjectInterface;
  v6 = -[_WKRemoteObjectInterface init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_protocol = (Protocol *)a3;
    v8 = objc_msgSend(a4, "copy");
    m_ptr = v7->_identifier.m_ptr;
    v7->_identifier.m_ptr = (void *)v8;
    if (m_ptr)
      CFRelease(m_ptr);
    initializeMethods(v7, v7->_protocol);
  }
  return v7;
}

- (void)setClasses:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(a3);
        v19 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::add(&v24, &v19, (uint64_t)&v18);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v11);
  }
  v14 = (uint64_t *)classesForSelectorArgument((_WKRemoteObjectInterface *)self->_methods.m_impl.var0.m_table, (objc_selector *)a4, a5, v6);
  v16 = v24;
  v24 = 0;
  v17 = *v14;
  *v14 = v16;
  if (v17)
    WTF::fastFree((WTF *)(v17 - 16), v15);
  if (v24)
    WTF::fastFree((WTF *)(v24 - 16), v15);
}

- (NSString)identifier
{
  return (NSString *)self->_identifier.m_ptr;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  unsigned int *m_tableForLLDB;
  uint64_t v8;
  SEL *v9;
  SEL *m_table;
  uint64_t v11;
  SEL *v12;
  const char *Name;
  char *v14;
  SEL *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; protocol = \"%@\"; identifier = \"%@\"\n"),
                 v5,
                 self,
                 self->_identifier.m_ptr,
                 NSStringFromProtocol(self->_protocol));
  m_tableForLLDB = self->_methods.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB)
  {
    m_table = 0;
    LODWORD(v8) = 0;
    goto LABEL_9;
  }
  v8 = *(m_tableForLLDB - 1);
  v9 = (SEL *)&m_tableForLLDB[14 * v8];
  if (!*(m_tableForLLDB - 3))
  {
    m_table = (SEL *)&m_tableForLLDB[14 * v8];
LABEL_9:
    v9 = (SEL *)&m_tableForLLDB[14 * v8];
    goto LABEL_10;
  }
  m_table = (SEL *)self->_methods.m_impl.var0.m_table;
  if ((_DWORD)v8)
  {
    v11 = 56 * v8;
    m_table = (SEL *)self->_methods.m_impl.var0.m_table;
    while ((unint64_t)(*m_table + 1) <= 1)
    {
      m_table += 7;
      v11 -= 56;
      if (!v11)
      {
        m_table = v9;
        break;
      }
    }
  }
LABEL_10:
  if (m_tableForLLDB)
    v12 = (SEL *)&m_tableForLLDB[14 * *(m_tableForLLDB - 1)];
  else
    v12 = 0;
  while (m_table != v12)
  {
    Name = sel_getName(*m_table);
    objc_msgSend(v6, "appendFormat:", CFSTR(" selector = %s\n  argument classes = %@\n"), Name, -[_WKRemoteObjectInterface debugDescription]::$_0::operator()<WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t)(m_table + 1)));
    v14 = (char *)m_table[6];
    if (v14)
      objc_msgSend(v6, "appendFormat:", CFSTR("  reply block = (argument '%@') %@\n"), objc_msgSend((id)objc_msgSend(v14, "methodSignature"), "_typeString"), -[_WKRemoteObjectInterface debugDescription]::$_0::operator()<WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t)(m_table + 4)));
    v15 = m_table + 7;
    m_table = v9;
    if (v15 != v9)
    {
      m_table = v15;
      while ((unint64_t)(*m_table + 1) <= 1)
      {
        m_table += 7;
        if (m_table == v9)
        {
          m_table = v9;
          break;
        }
      }
    }
  }
  objc_msgSend(v6, "appendString:", CFSTR(">\n"));
  return (id)(id)CFMakeCollectable(v6);
}

- (CFTypeRef)debugDescription
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t **v5;
  uint64_t **v6;
  CFTypeRef result;
  void *v8;
  uint64_t v9;
  WTF *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  Class *v21;
  void *v22;
  CFTypeRef v23;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  v3 = *(unsigned int *)(a1 + 12);
  if (!(_DWORD)v3)
  {
LABEL_33:
    objc_msgSend(v2, "appendString:", CFSTR("]"));
    return (id)CFMakeCollectable(v2);
  }
  v4 = 0;
  v5 = *(uint64_t ***)a1;
  v6 = &v5[v3];
  while (1)
  {
    if ((v4 & 1) != 0)
      objc_msgSend(v2, "appendString:", CFSTR(", "));
    result = (CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{"));
    v8 = (void *)result;
    if (!*v5 || (v9 = *((unsigned int *)*v5 - 3), !(_DWORD)v9))
    {
      v10 = 0;
      goto LABEL_10;
    }
    if (v9 >> 29)
      break;
    v10 = (WTF *)WTF::fastMalloc((WTF *)(8 * v9));
LABEL_10:
    v11 = WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin(v5);
    v13 = *v5;
    if (*v5)
      v13 += *((unsigned int *)v13 - 1);
    if (v13 == v11)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      do
      {
        v15 = *v11++;
        *((_QWORD *)v10 + v14) = v15;
        while (v11 != v12)
        {
          if ((unint64_t)(*v11 + 1) > 1)
            goto LABEL_19;
          ++v11;
        }
        v11 = v12;
LABEL_19:
        ++v14;
      }
      while (v11 != v13);
    }
    v16 = v14;
    v17 = 126 - 2 * __clz(v14);
    if (v14)
      v18 = v17;
    else
      v18 = 0;
    _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZZZ44___WKRemoteObjectInterface_debugDescription_ENK3__0clIN3WTF6VectorINS4_7HashSetIPKvNS4_11DefaultHashIS8_EENS4_10HashTraitsIS8_EENS4_15HashTableTraitsEEELm0ENS4_15CrashOnOverflowELm16ENS4_10FastMallocEEEEEDaRT_ENKUlSK_E_clISE_EESI_SK_EUlS8_S8_E_PS8_Lb0EEEvT1_SQ_T0_NS_15iterator_traitsISQ_E15difference_typeEb((uint64_t)v10, (objc_class **)v10 + v14, v18, 1);
    if ((_DWORD)v16)
    {
      v19 = 0;
      v20 = 8 * v16;
      v21 = (Class *)v10;
      do
      {
        if ((v19 & 1) != 0)
          objc_msgSend(v8, "appendString:", CFSTR(", "));
        objc_msgSend(v8, "appendFormat:", CFSTR("%s"), class_getName(*v21++));
        v19 = 1;
        v20 -= 8;
      }
      while (v20);
    }
    objc_msgSend(v8, "appendString:", CFSTR("}"));
    v23 = (id)CFMakeCollectable(v8);
    if (v10)
      WTF::fastFree(v10, v22);
    objc_msgSend(v2, "appendString:", v23);
    ++v5;
    v4 = 1;
    if (v5 == v6)
      goto LABEL_33;
  }
  __break(0xC471u);
  return result;
}

- (id)classesForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  _QWORD **v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v5 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = (_QWORD **)classesForSelectorArgument((_WKRemoteObjectInterface *)self->_methods.m_impl.var0.m_table, (objc_selector *)a3, a4, v5);
  v11 = WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin(v10);
  v12 = v11;
  v14 = v13;
  if (*v10)
    v15 = (uint64_t)&(*v10)[*((unsigned int *)*v10 - 1)];
  else
    v15 = 0;
  if ((_QWORD *)v15 != v11)
  {
    do
    {
      objc_msgSend(v9, "addObject:", *v12);
      while (++v12 != v14)
      {
        if ((unint64_t)(*v12 + 1) > 1)
          goto LABEL_10;
      }
      v12 = v14;
LABEL_10:
      ;
    }
    while (v12 != (_QWORD *)v15);
  }
  return (id)(id)CFMakeCollectable(v9);
}

- (id)classesForSelector:(SEL)a3 argumentIndex:(unint64_t)a4
{
  return -[_WKRemoteObjectInterface classesForSelector:argumentIndex:ofReply:](self, "classesForSelector:argumentIndex:ofReply:", a3, a4, 0);
}

- (void)setClasses:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5
{
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](self, "setClasses:forSelector:argumentIndex:ofReply:", a3, a4, a5, 0);
}

- (id)_invocationForSelector:(SEL)a3
{
  char *m_table;
  uint64_t *v4;
  uint64_t *v5;

  m_table = (char *)self->_methods.m_impl.var0.m_table;
  v4 = WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)m_table, (uint64_t)a3);
  if (m_table)
    v5 = (uint64_t *)&m_table[56 * *((unsigned int *)m_table - 1)];
  else
    v5 = 0;
  if (v5 == v4)
    return 0;
  else
    return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend((id)v4[3], "copy"));
}

- (id)_invocationForReplyBlockOfSelector:(SEL)a3
{
  char *m_table;
  uint64_t *v4;
  uint64_t *v5;

  m_table = (char *)self->_methods.m_impl.var0.m_table;
  v4 = WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)m_table, (uint64_t)a3);
  if (m_table)
    v5 = (uint64_t *)&m_table[56 * *((unsigned int *)m_table - 1)];
  else
    v5 = 0;
  if (v5 == v4)
    return 0;
  else
    return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend((id)v4[6], "copy"));
}

- (const)_allowedArgumentClassesForSelector:(SEL)a3
{
  return WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)self->_methods.m_impl.var0.m_table, (uint64_t)a3)+ 1;
}

- (const)_allowedArgumentClassesForReplyBlockOfSelector:(SEL)a3
{
  return WTF::HashTable<objc_selector *,WTF::KeyValuePair<objc_selector *,MethodInfo>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<objc_selector *,MethodInfo>>,WTF::DefaultHash<objc_selector *>,WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<objc_selector *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<objc_selector *,MethodInfo,WTF::DefaultHash<objc_selector *>,WTF::HashTraits<objc_selector *>,WTF::HashTraits<MethodInfo>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<objc_selector *>>,objc_selector *>((uint64_t)self->_methods.m_impl.var0.m_table, (uint64_t)a3)+ 4;
}

- (void).cxx_destruct
{
  unsigned int *m_tableForLLDB;
  uint64_t v4;
  char *v5;
  const void *v6;
  void *v7;
  const void *v8;
  void *m_ptr;

  m_tableForLLDB = self->_methods.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v4 = *(m_tableForLLDB - 1);
    if ((_DWORD)v4)
    {
      v5 = (char *)(m_tableForLLDB + 6);
      do
      {
        if (*((_QWORD *)v5 - 3) != -1)
        {
          v6 = (const void *)*((_QWORD *)v5 + 3);
          *((_QWORD *)v5 + 3) = 0;
          if (v6)
            CFRelease(v6);
          WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)(v5 + 8), (void *)a2);
          v8 = *(const void **)v5;
          *(_QWORD *)v5 = 0;
          if (v8)
            CFRelease(v8);
          WTF::Vector<WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)(v5 - 16), v7);
        }
        v5 += 56;
        --v4;
      }
      while (v4);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
  m_ptr = self->_identifier.m_ptr;
  self->_identifier.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

@end

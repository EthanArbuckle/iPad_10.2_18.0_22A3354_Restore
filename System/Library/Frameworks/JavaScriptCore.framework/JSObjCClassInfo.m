@implementation JSObjCClassInfo

- (id)initForClass:(Class)a3
{
  JSObjCClassInfo *v4;
  const char *Name;
  Class Class;
  JSClassDefinition v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)JSObjCClassInfo;
  v4 = -[JSObjCClassInfo init](&v9, sel_init);
  if (v4)
  {
    Name = class_getName(a3);
    v4->m_class = a3;
    if (byte_1ECF58552 == 1)
    {
      Class = (Class)qword_1ECF58558;
    }
    else
    {
      Class = objc_getClass("NSBlock");
      qword_1ECF58558 = (uint64_t)Class;
      byte_1ECF58552 = 1;
    }
    v4->m_block = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", Class);
    *(_QWORD *)&v8.version = 0;
    memset(&v8.parentClass, 0, 112);
    v8.className = Name;
    v4->m_classRef.m_ptr = JSClassCreate(&v8);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *m_ptr;
  unsigned int v10;
  unsigned int v11;
  objc_super v12;
  OpaqueJSClass *v13;

  m_ptr = (unsigned int *)self->m_classRef.m_ptr;
  do
  {
    v10 = __ldaxr(m_ptr);
    v11 = v10 - 1;
  }
  while (__stlxr(v11, m_ptr));
  if (!v11)
  {
    atomic_store(1u, m_ptr);
    v13 = (OpaqueJSClass *)m_ptr;
    WTF::ThreadSafeRefCounted<OpaqueJSClass,(WTF::DestructionThread)0>::deref(void)const::{lambda(void)#1}::operator()(&v13, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  v12.receiver = self;
  v12.super_class = (Class)JSObjCClassInfo;
  -[JSObjCClassInfo dealloc](&v12, sel_dealloc);
}

- (pair<JSC::JSObject)allocateConstructorAndPrototypeInContext:(id)a3
{
  JSObjCClassInfo *v4;
  uint64_t v5;
  void *v6;
  WeakImpl *m_impl;
  unint64_t Wrapper;
  WeakImpl *v9;
  uint64_t Protocol;
  const char *Name;
  OpaqueJSClass *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  objc_class *i;
  uint64_t v33;
  objc_class *j;
  Method *v35;
  Method *v36;
  unint64_t k;
  int v38;
  uint64_t v39;
  void *v40;
  char *MethodTypeEncoding;
  int v42;
  void *v43;
  OpaqueJSClass *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  WTF::AtomStringImpl *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  WTF::StringImpl **v68;
  uint64_t v69;
  WTF::StringImpl **v70;
  WTF::StringImpl *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  WTF *v80;
  void *v81;
  OpaqueJSClass *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int v98;
  uint64_t v99;
  JSValue *v100;
  JSValue *v101;
  Protocol *v102;
  objc_class *m_class;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  Inspector::JSGlobalObjectInspectorController **v113;
  unsigned int *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  JSC::Exception *v122;
  uint64_t v123;
  _QWORD *v124;
  WeakImpl *v125;
  WeakImpl *v126;
  WeakImpl *v127;
  WeakImpl *v128;
  JSObject *v129;
  JSObject *v130;
  uint64_t v131;
  _QWORD *v132;
  _QWORD *v133;
  uint64_t v134;
  _QWORD *v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  _QWORD *v143;
  uint64_t v144;
  unsigned int *v145;
  unsigned int v146;
  _QWORD *v147;
  uint64_t v148;
  _QWORD *v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  unint64_t v159;
  JSObjCClassInfo *v160;
  void *v161;
  const char *v162;
  objc_object *cls;
  _QWORD v164[8];
  OpaqueJSClass *v165[2];
  void (*v166)(OpaqueJSClass **, Method);
  void *v167;
  _QWORD *v168;
  OpaqueJSClass **v169;
  uint64_t *v170;
  JSClassDefinition *p_definition;
  uint64_t *v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t v180;
  OpaqueJSClass *v181;
  OpaqueJSClass **v182;
  uint64_t v183;
  int v184;
  _QWORD v185[5];
  _QWORD v186[6];
  WTF::StringImpl **v187;
  unsigned int outCount;
  JSClassDefinition definition;
  pair<JSC::JSObject *, JSC::JSObject *> result;

  v4 = self;
  v5 = objc_msgSend((id)objc_msgSend(a3, "wrapperMap"), "classInfoForClass:", class_getSuperclass(self->m_class));
  v6 = (void *)v5;
  m_impl = v4->m_prototype.m_impl;
  if (!m_impl || (*((_BYTE *)m_impl + 8) & 3) != 0)
    Wrapper = 0;
  else
    Wrapper = *(_QWORD *)m_impl;
  v9 = v4->m_constructor.m_impl;
  if (!v9 || (*((_BYTE *)v9 + 8) & 3) != 0)
  {
    Protocol = 0;
    if (v5)
      goto LABEL_8;
LABEL_22:
    v33 = objc_msgSend(a3, "JSGlobalContextRef");
    if (Protocol)
    {
      if (Wrapper)
        goto LABEL_76;
    }
    else
    {
      Protocol = *(_QWORD *)(v33 + 224);
      if (Wrapper)
        goto LABEL_76;
    }
    Wrapper = *(_QWORD *)(v33 + 656);
    goto LABEL_83;
  }
  Protocol = *(_QWORD *)v9;
  if (!v5)
    goto LABEL_22;
LABEL_8:
  Name = class_getName(v4->m_class);
  if (!Wrapper)
  {
    *(_QWORD *)&definition.version = 0;
    memset(&definition.parentClass, 0, 112);
    definition.className = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%sPrototype"), Name), "UTF8String");
    v12 = JSClassCreate(&definition);
    v13 = objc_msgSend(a3, "JSGlobalContextRef");
    Wrapper = makeWrapper(v13, v12, 0, v14, v15, v16, v17, v18, v19);
    do
    {
      v27 = __ldaxr((unsigned int *)v12);
      v28 = v27 - 1;
    }
    while (__stlxr(v28, (unsigned int *)v12));
    if (!v28)
    {
      atomic_store(1u, (unsigned int *)v12);
      v165[0] = v12;
      WTF::ThreadSafeRefCounted<OpaqueJSClass,(WTF::DestructionThread)0>::deref(void)const::{lambda(void)#1}::operator()(v165, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  v162 = Name;
  v29 = &bmalloc::availableMemory(void)::availableMemory;
  v30 = MEMORY[0x1E0C809B0];
  v31 = &qword_199123000;
  if (Protocol)
    goto LABEL_65;
  cls = (objc_object *)v4->m_class;
  if (byte_1ECF58551 != 1)
  {
    v80 = (WTF *)NSVersionOfLinkTimeLibrary("JavaScriptCore");
    if ((_DWORD)v80 == -1)
    {
      _MergedGlobals_26 = WTF::sdkAlignedBehaviors(v80)[1] & 1;
      byte_1ECF58551 = 1;
      if (_MergedGlobals_26)
        goto LABEL_16;
    }
    else
    {
      byte_1ECF58551 = 1;
      _MergedGlobals_26 = (int)v80 > 35259391;
      if ((int)v80 > 35259391)
        goto LABEL_16;
    }
LABEL_61:
    v81 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%sConstructor"), v162);
    memset(&definition, 0, sizeof(definition));
    definition.className = (const char *)objc_msgSend(v81, "UTF8String");
    definition.hasInstance = (JSObjectHasInstanceCallback)constructorHasInstance;
    v82 = JSClassCreate(&definition);
    v83 = objc_msgSend(a3, "JSGlobalContextRef");
    Protocol = makeWrapper(v83, v82, cls, v84, v85, v86, v87, v88, v89);
    do
    {
      v97 = __ldaxr((unsigned int *)v82);
      v98 = v97 - 1;
    }
    while (__stlxr(v98, (unsigned int *)v82));
    if (!v98)
    {
      atomic_store(1u, (unsigned int *)v82);
      v165[0] = v82;
      WTF::ThreadSafeRefCounted<OpaqueJSClass,(WTF::DestructionThread)0>::deref(void)const::{lambda(void)#1}::operator()(v165, v90, v91, v92, v93, v94, v95, v96);
    }
    goto LABEL_65;
  }
  if (!_MergedGlobals_26)
    goto LABEL_61;
LABEL_16:
  v186[0] = 0;
  v186[1] = v186;
  v186[2] = 0x3812000000;
  v186[3] = __Block_byref_object_copy_;
  v186[4] = __Block_byref_object_dispose_;
  v186[5] = &unk_1991A389B;
  v187 = 0;
  v161 = v6;
  {
    Protocol = getJSExportProtocol(void)::protocol;
  }
  else
  {
    Protocol = (uint64_t)objc_getProtocol("JSExport");
    getJSExportProtocol(void)::protocol = Protocol;
  }
  for (i = (objc_class *)cls; i; i = class_getSuperclass(i))
  {
    v185[0] = v30;
    v185[1] = 3221225472;
    v185[2] = ___ZL33allocateConstructorForCustomClassP9JSContextPKcP10objc_class_block_invoke;
    v185[3] = &unk_1E357B870;
    v185[4] = v186;
    forEachProtocolImplementingProtocol(i, (Protocol *)Protocol, (uint64_t)v185);
  }
  v159 = Wrapper;
  v160 = v4;
  for (j = (objc_class *)cls; j; j = class_getSuperclass(j))
  {
    v181 = 0;
    v182 = &v181;
    v183 = 0x2020000000;
    v184 = 0;
    v177 = 0;
    v178 = &v177;
    v179 = 0x2020000000;
    v180 = 0;
    *(_QWORD *)&definition.version = 0;
    definition.className = (const char *)&definition;
    definition.parentClass = (JSClassRef)0x3052000000;
    definition.staticValues = (const JSStaticValue *)__Block_byref_object_copy__64;
    definition.staticFunctions = (const JSStaticFunction *)__Block_byref_object_dispose__65;
    definition.initialize = 0;
    v173 = 0;
    v174 = &v173;
    v175 = 0x2020000000;
    v176 = 0;
    v165[0] = (OpaqueJSClass *)MEMORY[0x1E0C809B0];
    v165[1] = (OpaqueJSClass *)3221225472;
    v166 = (void (*)(OpaqueJSClass **, Method))___ZL33allocateConstructorForCustomClassP9JSContextPKcP10objc_class_block_invoke_66;
    v167 = &unk_1E357B898;
    v168 = v186;
    v169 = &v181;
    v170 = &v177;
    p_definition = &definition;
    v172 = &v173;
    outCount = 0;
    v35 = class_copyMethodList(j, &outCount);
    v36 = v35;
    if (outCount)
    {
      for (k = 0; k < outCount; v166(v165, v36[k++]))
        ;
    }
    else if (!v35)
    {
      goto LABEL_33;
    }
    free(v36);
LABEL_33:
    v38 = *((_DWORD *)v182 + 6);
    if (!v38)
      goto LABEL_36;
    if (v38 == 1)
    {
      v39 = v178[3];
      v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v174[3]));
      objc_msgSend(v40, "setSelector:", v39);
      MethodTypeEncoding = (char *)_protocol_getMethodTypeEncoding();
      Protocol = objCCallbackFunctionForInvocation(a3, v40, 0, cls, MethodTypeEncoding);
LABEL_36:
      v42 = 0;
      goto LABEL_38;
    }
    NSLog((NSString *)CFSTR("ERROR: Class %@ exported more than one init family method via JSExport. Class %@ will not have a callable JavaScript constructor function."), cls, cls);
    v42 = 1;
LABEL_38:
    _Block_object_dispose(&v173, 8);
    _Block_object_dispose(&definition, 8);
    _Block_object_dispose(&v177, 8);
    _Block_object_dispose(&v181, 8);
    if (v38)
    {
      if (!v42)
        goto LABEL_47;
      break;
    }
  }
  v43 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%sConstructor"), v162);
  memset(&definition, 0, sizeof(definition));
  definition.className = (const char *)objc_msgSend(v43, "UTF8String");
  definition.hasInstance = (JSObjectHasInstanceCallback)constructorHasInstance;
  v44 = JSClassCreate(&definition);
  v45 = objc_msgSend(a3, "JSGlobalContextRef");
  Protocol = makeWrapper(v45, v44, cls, v46, v47, v48, v49, v50, v51);
  do
  {
    v59 = __ldaxr((unsigned int *)v44);
    v60 = v59 - 1;
  }
  while (__stlxr(v60, (unsigned int *)v44));
  if (!v60)
  {
    atomic_store(1u, (unsigned int *)v44);
    v181 = v44;
    WTF::ThreadSafeRefCounted<OpaqueJSClass,(WTF::DestructionThread)0>::deref(void)const::{lambda(void)#1}::operator()(&v181, v52, v53, v54, v55, v56, v57, v58);
  }
LABEL_47:
  _Block_object_dispose(v186, 8);
  v68 = v187;
  Wrapper = v159;
  v4 = v160;
  v30 = MEMORY[0x1E0C809B0];
  v31 = &qword_199123000;
  if (v187)
  {
    v69 = *((unsigned int *)v187 - 1);
    if ((_DWORD)v69)
    {
      v70 = v187;
      do
      {
        v71 = *v70;
        if (*v70 != (WTF::StringImpl *)-1)
        {
          *v70 = 0;
          if (v71)
          {
            if (*(_DWORD *)v71 == 2)
            {
              WTF::StringImpl::~StringImpl(v71, v61, v62, v63, v64, v65, v66, v67);
              WTF::fastFree(v72, v73, v74, v75, v76, v77, v78, v79);
            }
            else
            {
              *(_DWORD *)v71 -= 2;
            }
          }
        }
        v70 += 2;
        --v69;
      }
      while (v69);
    }
    WTF::fastFree((unint64_t)(v68 - 2), v61, v62, v63, v64, v65, v66, v67);
  }
  v6 = v161;
  v29 = &bmalloc::availableMemory(void)::availableMemory;
LABEL_65:
  v99 = v30;
  v100 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", Wrapper, a3);
  v101 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", Protocol, a3);
  putNonEnumerable((JSContext *)a3, v100, CFSTR("constructor"), v101);
  putNonEnumerable((JSContext *)a3, v101, CFSTR("prototype"), v100);
  if (*((_BYTE *)v29 + 184) == 1)
  {
    v102 = (Protocol *)getJSExportProtocol(void)::protocol;
  }
  else
  {
    v102 = objc_getProtocol("JSExport");
    getJSExportProtocol(void)::protocol = (uint64_t)v102;
    *((_BYTE *)v29 + 184) = 1;
  }
  m_class = v4->m_class;
  v164[0] = v99;
  v164[1] = v31[10];
  v164[2] = __60__JSObjCClassInfo_allocateConstructorAndPrototypeInContext___block_invoke;
  v164[3] = &unk_1E357B7C8;
  v164[4] = a3;
  v164[5] = v4;
  v164[6] = v100;
  v164[7] = v101;
  forEachProtocolImplementingProtocol(m_class, v102, (uint64_t)v164);
  v104 = objc_msgSend(v6, "prototypeInContext:", a3);
  v105 = objc_msgSend(a3, "JSGlobalContextRef");
  if (v105)
  {
    v113 = (Inspector::JSGlobalObjectInspectorController **)v105;
    v114 = *(unsigned int **)(v105 + 56);
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&definition, (JSC::VM *)v114, v106, v107, v108, v109, v110, v111, v112);
    if (v104)
      v115 = v104;
    else
      v115 = 2;
    if ((v115 & 0xFFFE000000000002) != 0 || *(unsigned __int8 *)(v115 + 5) <= 0x16u)
      v115 = 2;
    (*(void (**)(unint64_t, Inspector::JSGlobalObjectInspectorController **, uint64_t, _QWORD))(16 * *(unsigned int *)(16 * (*(_DWORD *)Wrapper & 0xFFFFFFFE) + 0x4C) + 0xA8))(Wrapper, v113, v115, 0);
    v122 = (JSC::Exception *)*((_QWORD *)v114 + 2);
    if (v122)
    {
      *((_QWORD *)v114 + 2) = 0;
      v145 = v114 + 20;
      do
        v146 = __ldaxr(v145);
      while (__stlxr(v146 & 0xFFFFFFEF, v145));
      Inspector::JSGlobalObjectInspectorController::reportAPIException(v113[253], (JSC::JSGlobalObject *)v113, v122, v117, v118, v119, v120, v121);
    }
    JSC::JSLockHolder::~JSLockHolder((unsigned int **)&definition, v116, (uint64_t)v122, v117, v118, v119, v120, v121);
LABEL_76:
    if ((Wrapper & 8) != 0)
      v123 = (Wrapper - 112) | 1;
    else
      v123 = Wrapper & 0xFFFFFFFFFFFFC000;
    if ((v123 & 1) != 0)
      v124 = (_QWORD *)(v123 + 47);
    else
      v124 = (_QWORD *)(*(_QWORD *)v123 + 32);
    v125 = (WeakImpl *)v124[2];
    if (!v125)
    {
      while (1)
      {
        v133 = (_QWORD *)v124[3];
        if (!v133)
          break;
        v124[3] = v133[2];
        v125 = (WeakImpl *)v133[4];
        v133[3] = 257;
        v133[4] = 0;
        if (v125)
          goto LABEL_82;
      }
      v134 = v124[6];
      if (!v124[1])
      {
        v135 = *(_QWORD **)(v134 + 488);
        *v124 = v134 + 480;
        v124[1] = v135;
        *v135 = v124;
        *(_QWORD *)(v134 + 488) = v124;
      }
      *(_QWORD *)(v134 + 1072) += 1024;
      v136 = (_QWORD *)WTF::fastMalloc((WTF *)0x400);
      JSC::WeakBlock::WeakBlock((uint64_t)v136, v123);
      JSC::Heap::didAllocate((JSC::Heap *)(v124[6] + 192), 0x400uLL, v137, v138, v139, v140, v141, v142);
      v143 = v124 + 4;
      v144 = v124[5];
      if (v144)
        v143 = (_QWORD *)(v144 + 16);
      *v143 = v136;
      v124[5] = v136;
      v136[1] = v144;
      v136[2] = 0;
      v125 = (WeakImpl *)v136[4];
      v136[3] = 257;
      v136[4] = 0;
    }
LABEL_82:
    v124[2] = *(_QWORD *)v125;
    *(_QWORD *)v125 = Wrapper;
    *((_QWORD *)v125 + 1) = 0;
    *((_QWORD *)v125 + 2) = 0;
    goto LABEL_85;
  }
LABEL_83:
  if (Wrapper)
    goto LABEL_76;
  v125 = 0;
LABEL_85:
  v126 = v4->m_prototype.m_impl;
  v4->m_prototype.m_impl = v125;
  if (v126)
  {
    *((_QWORD *)v126 + 1) = 3;
    if (Protocol)
      goto LABEL_92;
LABEL_87:
    v127 = 0;
  }
  else
  {
    if (!Protocol)
      goto LABEL_87;
LABEL_92:
    if ((Protocol & 8) != 0)
      v131 = (Protocol - 112) | 1;
    else
      v131 = Protocol & 0xFFFFFFFFFFFFC000;
    if ((v131 & 1) != 0)
      v132 = (_QWORD *)(v131 + 47);
    else
      v132 = (_QWORD *)(*(_QWORD *)v131 + 32);
    v127 = (WeakImpl *)v132[2];
    if (!v127)
    {
      while (1)
      {
        v147 = (_QWORD *)v132[3];
        if (!v147)
          break;
        v132[3] = v147[2];
        v127 = (WeakImpl *)v147[4];
        v147[3] = 257;
        v147[4] = 0;
        if (v127)
          goto LABEL_98;
      }
      v148 = v132[6];
      if (!v132[1])
      {
        v149 = *(_QWORD **)(v148 + 488);
        *v132 = v148 + 480;
        v132[1] = v149;
        *v149 = v132;
        *(_QWORD *)(v148 + 488) = v132;
      }
      *(_QWORD *)(v148 + 1072) += 1024;
      v150 = (_QWORD *)WTF::fastMalloc((WTF *)0x400);
      JSC::WeakBlock::WeakBlock((uint64_t)v150, v131);
      JSC::Heap::didAllocate((JSC::Heap *)(v132[6] + 192), 0x400uLL, v151, v152, v153, v154, v155, v156);
      v157 = v132 + 4;
      v158 = v132[5];
      if (v158)
        v157 = (_QWORD *)(v158 + 16);
      *v157 = v150;
      v132[5] = v150;
      v150[1] = v158;
      v150[2] = 0;
      v127 = (WeakImpl *)v150[4];
      v150[3] = 257;
      v150[4] = 0;
    }
LABEL_98:
    v132[2] = *(_QWORD *)v127;
    *(_QWORD *)v127 = Protocol;
    *((_QWORD *)v127 + 1) = 0;
    *((_QWORD *)v127 + 2) = 0;
  }
  v128 = v4->m_constructor.m_impl;
  v4->m_constructor.m_impl = v127;
  if (v128)
    *((_QWORD *)v128 + 1) = 3;
  v129 = (JSObject *)Protocol;
  v130 = (JSObject *)Wrapper;
  result.var1 = v130;
  result.var0 = v129;
  return result;
}

void __60__JSObjCClassInfo_allocateConstructorAndPrototypeInContext___block_invoke(_QWORD *a1, Protocol *a2)
{
  JSContext *v4;
  objc_class *v5;
  NSMutableDictionary *v6;
  objc_property_t *v7;
  objc_property_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const void **v24;
  const void *v25;
  const void *v26;
  WTF *v27;
  _QWORD *v28;
  Protocol *v29;
  JSValue *v30;
  JSValue *v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, objc_property_t);
  void *v34;
  NSMutableDictionary *v35;
  JSValue *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  WTF *v44;
  uint64_t v45;
  _QWORD v46[4];
  unsigned int outCount[2];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = (JSContext *)a1[4];
  v5 = *(objc_class **)(a1[5] + 8);
  v30 = (JSValue *)a1[6];
  v38 = 0;
  v39 = &v38;
  v40 = 0x4012000000;
  v41 = __Block_byref_object_copy__76;
  v42 = __Block_byref_object_dispose__77;
  v44 = 0;
  v45 = 0;
  v43 = 0;
  v6 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v31 = +[JSValue valueWithUndefinedInContext:](JSValue, "valueWithUndefinedInContext:", v4);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = ___ZL23copyPrototypePropertiesP9JSContextP10objc_classP8ProtocolP7JSValue_block_invoke;
  v34 = &unk_1E357B8C0;
  v35 = v6;
  v36 = v31;
  v37 = &v38;
  outCount[0] = 0;
  v7 = protocol_copyPropertyList(a2, outCount);
  v8 = v7;
  if (outCount[0])
  {
    v9 = 0;
    do
      v33((uint64_t)v32, v8[v9++]);
    while (v9 < outCount[0]);
  }
  else if (!v7)
  {
    goto LABEL_7;
  }
  free(v8);
LABEL_7:
  copyMethodsToObject(v4, v5, a2, 1, v30, v6);
  v28 = a1;
  v29 = a2;
  v10 = *((unsigned int *)v39 + 15);
  if ((_DWORD)v10)
  {
    v11 = 24 * v10;
    v12 = (_QWORD *)(v39[6] + 16);
    do
    {
      v13 = -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *(v12 - 1));
      v14 = (uint64_t)v31;
      if (*v12)
        v14 = -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:");
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(v12 - 2));
      v46[0] = CFSTR("get");
      v46[1] = CFSTR("set");
      *(_QWORD *)outCount = v13;
      v48 = v14;
      v46[2] = CFSTR("enumerable");
      v46[3] = CFSTR("configurable");
      v49 = MEMORY[0x1E0C9AAA0];
      v50 = MEMORY[0x1E0C9AAB0];
      -[JSValue defineProperty:descriptor:](v30, "defineProperty:descriptor:", v15, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", outCount, v46, 4));
      v12 += 3;
      v11 -= 24;
    }
    while (v11);
  }
  _Block_object_dispose(&v38, 8);
  if (HIDWORD(v45))
  {
    v23 = 24 * HIDWORD(v45);
    v24 = (const void **)((char *)v44 + 16);
    do
    {
      v25 = *v24;
      *v24 = 0;
      if (v25)
        CFRelease(v25);
      v26 = *(v24 - 1);
      *(v24 - 1) = 0;
      if (v26)
        CFRelease(v26);
      v24 += 3;
      v23 -= 24;
    }
    while (v23);
  }
  v27 = v44;
  if (v44)
  {
    v44 = 0;
    LODWORD(v45) = 0;
    WTF::fastFree((unint64_t)v27, v16, v17, v18, v19, v20, v21, v22);
  }
  copyMethodsToObject((JSContext *)v28[4], *(objc_class **)(v28[5] + 8), v29, 0, (JSValue *)v28[7], 0);
}

- (void)wrapperForObject:(id)a3 inContext:(id)a4
{
  char *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  JSValue *v11;
  JSValue *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int *v31;

  if (self->m_block
    && _Block_has_signature(a3)
    && (v7 = (char *)_Block_signature(a3),
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v7)), objc_msgSend(v8, "setTarget:", objc_msgSend(a3, "copy")), (v9 = objCCallbackFunctionForInvocation(a4, v8, 3u, 0, v7)) != 0))
  {
    v10 = (void *)v9;
    v11 = +[JSValue valueWithJSValueRef:inContext:](JSValue, "valueWithJSValueRef:inContext:", v9, a4);
    v12 = +[JSValue valueWithNewObjectInContext:](JSValue, "valueWithNewObjectInContext:", a4);
    putNonEnumerable((JSContext *)a4, v11, CFSTR("prototype"), v12);
    putNonEnumerable((JSContext *)a4, v12, CFSTR("constructor"), v11);
  }
  else
  {
    v13 = -[JSObjCClassInfo structureInContext:](self, "structureInContext:", a4);
    v14 = objc_msgSend(a4, "JSGlobalContextRef");
    JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v31, *(JSC::VM **)(v14 + 56), v15, v16, v17, v18, v19, v20, v21);
    JSC::JSCallbackObject<JSC::JSAPIWrapperObject>::create(v14, (unint64_t)v13, (unsigned int *)self->m_classRef.m_ptr);
    v10 = v22;
    v22[2] = a3;
    JSC::JSLockHolder::~JSLockHolder(&v31, v23, v24, v25, v26, v27, v28, v29);
  }
  return v10;
}

- (void)constructorInContext:(id)a3
{
  WeakImpl *m_impl;
  void *v4;

  m_impl = self->m_constructor.m_impl;
  if (!m_impl)
    return (void *)-[JSObjCClassInfo allocateConstructorAndPrototypeInContext:](self, "allocateConstructorAndPrototypeInContext:", a3);
  if ((*((_BYTE *)m_impl + 8) & 3) != 0)
    return (void *)-[JSObjCClassInfo allocateConstructorAndPrototypeInContext:](self, "allocateConstructorAndPrototypeInContext:", a3);
  v4 = *(void **)m_impl;
  if (!v4)
    return (void *)-[JSObjCClassInfo allocateConstructorAndPrototypeInContext:](self, "allocateConstructorAndPrototypeInContext:", a3);
  return v4;
}

- (void)prototypeInContext:(id)a3
{
  WeakImpl *m_impl;
  void *v4;

  m_impl = self->m_prototype.m_impl;
  if (!m_impl || (*((_BYTE *)m_impl + 8) & 3) != 0 || (v4 = *(void **)m_impl) == 0)
    -[JSObjCClassInfo allocateConstructorAndPrototypeInContext:](self, "allocateConstructorAndPrototypeInContext:", a3);
  return v4;
}

- (void)structureInContext:(id)a3
{
  WeakImpl *m_impl;
  void *result;
  JSC::VM **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t Structure;
  uint64_t v16;
  WeakImpl *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;

  m_impl = self->m_structure.m_impl;
  if (!m_impl || (*((_BYTE *)m_impl + 8) & 3) != 0 || (result = *(void **)m_impl) == 0)
  {
    v7 = (JSC::VM **)objc_msgSend(a3, "JSGlobalContextRef");
    v8 = -[JSObjCClassInfo prototypeInContext:](self, "prototypeInContext:", a3);
    Structure = JSC::JSCallbackObject<JSC::JSAPIWrapperObject>::createStructure(v7[7], (JSC::VM *)v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
    if (Structure)
    {
      v18 = Structure;
      if ((Structure & 8) != 0)
        v19 = (Structure - 112) | 1;
      else
        v19 = Structure & 0xFFFFFFFFFFFFC000;
      if ((v19 & 1) != 0)
        v20 = (_QWORD *)(v19 + 47);
      else
        v20 = (_QWORD *)(*(_QWORD *)v19 + 32);
      v16 = v20[2];
      if (!v16)
      {
        while (1)
        {
          v21 = (_QWORD *)v20[3];
          if (!v21)
            break;
          v20[3] = v21[2];
          v16 = v21[4];
          v21[3] = 257;
          v21[4] = 0;
          if (v16)
            goto LABEL_19;
        }
        v22 = v20[6];
        if (!v20[1])
        {
          v23 = *(_QWORD **)(v22 + 488);
          *v20 = v22 + 480;
          v20[1] = v23;
          *v23 = v20;
          *(_QWORD *)(v22 + 488) = v20;
        }
        *(_QWORD *)(v22 + 1072) += 1024;
        v24 = (_QWORD *)WTF::fastMalloc((WTF *)0x400);
        JSC::WeakBlock::WeakBlock((uint64_t)v24, v19);
        JSC::Heap::didAllocate((JSC::Heap *)(v20[6] + 192), 0x400uLL, v25, v26, v27, v28, v29, v30);
        v31 = v20 + 4;
        v32 = v20[5];
        if (v32)
          v31 = (_QWORD *)(v32 + 16);
        *v31 = v24;
        v20[5] = v24;
        v24[1] = v32;
        v24[2] = 0;
        v16 = v24[4];
        v24[3] = 257;
        v24[4] = 0;
      }
LABEL_19:
      v20[2] = *(_QWORD *)v16;
      *(_QWORD *)v16 = v18;
      *(_QWORD *)(v16 + 8) = 0;
      *(_QWORD *)(v16 + 16) = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = self->m_structure.m_impl;
    self->m_structure.m_impl = (WeakImpl *)v16;
    if (v17)
    {
      *((_QWORD *)v17 + 1) = 3;
      if (!v16)
        return 0;
    }
    else if (!v16)
    {
      return 0;
    }
    if ((*(_BYTE *)(v16 + 8) & 3) == 0)
      return *(void **)v16;
    return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  WeakImpl *m_impl;
  WeakImpl *v3;
  WeakImpl *v4;

  m_impl = self->m_structure.m_impl;
  if (m_impl)
  {
    *((_QWORD *)m_impl + 1) = 3;
    self->m_structure.m_impl = 0;
  }
  v3 = self->m_constructor.m_impl;
  if (v3)
  {
    *((_QWORD *)v3 + 1) = 3;
    self->m_constructor.m_impl = 0;
  }
  v4 = self->m_prototype.m_impl;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = 3;
    self->m_prototype.m_impl = 0;
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end

@implementation NSXPCDecoder

- (int)decodeIntForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  int result;
  unint64_t v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = 0;
  p_decoder = &self->_decoder;
  result = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v5);
  if (result)
    return _NSXPCSerializationIntegerForObject(p_decoder, v5);
  return result;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  _BOOL4 ObjectInDictionaryForKey;
  int64_t result;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  p_decoder = &self->_decoder;
  ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v6);
  result = 0;
  if (ObjectInDictionaryForKey)
    return _NSXPCSerializationIntegerForObject(p_decoder, v6);
  return result;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  _BOOL4 ObjectInDictionaryForKey;
  int64_t result;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  p_decoder = &self->_decoder;
  ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v6);
  result = 0;
  if (ObjectInDictionaryForKey)
    return _NSXPCSerializationIntegerForObject(p_decoder, v6);
  return result;
}

- (id)_decodeObjectOfClasses:(id)a3 atObject:(id *)a4
{
  objc_class *Class;
  id result;
  NSNumber *v9;

  Class = object_getClass(a3);
  if (class_isMetaClass(Class))
  {
    _setAllowedClass((uint64_t)self, (uint64_t)a3);
    result = _decodeObject_0((uint64_t)self, 0, (uint64_t)a4);
    if (a3)
      self->_allowedClassesList[self->_allowedClassesIndex--] = 0;
  }
  else
  {
    _setAllowedClasses(self, a3);
    v9 = _decodeObject_0((uint64_t)self, 0, (uint64_t)a4);
    _resetAllowedClasses((uint64_t)self, (uint64_t)a3);
    return v9;
  }
  return result;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  id result;

  _setAllowedClass((uint64_t)self, (uint64_t)a3);
  result = _decodeObjectAfterSettingAllowListForKey((uint64_t)self, (const __CFString *)a4);
  if (a3)
    self->_allowedClassesList[self->_allowedClassesIndex--] = 0;
  return result;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  NSNumber *v7;

  _setAllowedClasses(self, a3);
  v7 = _decodeObjectAfterSettingAllowListForKey((uint64_t)self, (const __CFString *)a4);
  _resetAllowedClasses((uint64_t)self, (uint64_t)a3);
  return v7;
}

- (void)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5
{
  _BOOL4 v6;
  id v9;
  NSXPCConnection *connection;
  objc_class *Superclass;
  const __CFString *v12;
  NSString *v13;
  objc_class *Class;
  NSXPCConnection *v15;
  const char *Name;
  const char *v17;

  if (!a3)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to decode an object with no class for key '%@'."), a4, v17);
    goto LABEL_16;
  }
  v6 = a5;
  v9 = -[NSXPCDecoder _currentClassAllowlist](self, "_currentClassAllowlist");
  if ((-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)self, a3, (uint64_t)a4, v9, self->_strictSecureDecodingEnabled, self->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded, -[NSXPCInterface _specialCaseObject](self->_interface, "_specialCaseObject")) & 1) == 0)
  {
    v13 = -[NSCoder __descriptionForUnexpectedClass:forKey:allowedClasses:]((NSString *)self, (uint64_t)a3, (const __CFString *)a4, v9);
    goto LABEL_16;
  }
  if (!v6 || (Class)MEMORY[0x1E0C99DB8] != a3 && (Class)MEMORY[0x1E0C99D30] != a3)
  {
    connection = self->_connection;
    if (!connection
      || (-[_NSXPCConnectionClassCache containsClass:]((os_unfair_lock_s *)connection->_dCache, (uint64_t)a3) & 1) == 0)
    {
      if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EDCC2CC8) & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (-[objc_class supportsSecureCoding](a3, "supportsSecureCoding"))
          {
            Superclass = a3;
            while ((_classOverridesSelector(Superclass, sel_initWithCoder_) & 1) == 0)
            {
              Superclass = class_getSuperclass(Superclass);
              if (!Superclass)
              {
                Name = class_getName(a3);
                v12 = CFSTR("Class '%s' does not implement initWithCoder:.");
                goto LABEL_15;
              }
            }
            Class = object_getClass(Superclass);
            if ((_classOverridesSelector(Class, sel_supportsSecureCoding) & 1) != 0)
            {
              v15 = self->_connection;
              if (v15)
                -[_NSXPCConnectionClassCache addClass:]((uint64_t)v15->_dCache, (uint64_t)a3);
              return;
            }
            Name = class_getName(a3);
            v17 = class_getName(a3);
            v12 = CFSTR("Class '%s' has a superclass that supports secure coding, but '%s' overrides -initWithCoder: and does not override +supportsSecureCoding. The class must implement +supportsSecureCoding and return YES to verify that its implementation of -initWithCoder: is secure coding compliant.");
          }
          else
          {
            Name = class_getName(a3);
            v12 = CFSTR("Class '%s' disallows secure coding. It must return YES from supportsSecureCoding.");
          }
        }
        else
        {
          Name = class_getName(a3);
          v12 = CFSTR("Class '%s' disallows secure coding. It must implement supportsSecureCoding and return YES.");
        }
      }
      else
      {
        Name = class_getName(a3);
        v12 = CFSTR("This decoder will only decode classes that adopt NSSecureCoding. Class '%s' does not adopt it.");
      }
LABEL_15:
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, Name, v17);
LABEL_16:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v13, 0));
    }
  }
}

- (void)_validateAllowedXPCType:(_xpc_type_s *)a3 forKey:(id)a4
{
  id v7;
  _xpc_type_s *v8;
  NSString *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to decode an xpc type with no xpc for key '%@'."), a4, v11, v12);
    goto LABEL_14;
  }
  if (!xpc_get_class4NSXPC())
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to decode an xpc type that has no class for key '%@'."), a4, v11, v12);
    goto LABEL_14;
  }
  v7 = self->_allowedClassesList[self->_allowedClassesIndex];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to decode an xpc type but allowed list does not specify an XPC type '%@'."), a4, v11, v12);
    goto LABEL_14;
  }
  if (!v7)
  {
    v8 = 0;
    goto LABEL_11;
  }
  v8 = (_xpc_type_s *)*((_QWORD *)v7 + 1);
  if (v8 != a3)
  {
LABEL_11:
    v10 = CFSTR("(no key, possibly an argument to a message)");
    if (a4)
      v10 = (const __CFString *)a4;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("value for key '%@' was of unexpected XPC type '%@'. Allowed type is '%@'."), v10, a3, v8);
LABEL_14:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v9, 0));
  }
}

- (BOOL)containsValueForKey:(id)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v3;
  BOOL result;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v3 = self->_collections[self->_collectionPointer];
  v5[0] = 0;
  v5[1] = 0;
  result = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, v3, (const __CFString *)a3, (uint64_t)v5);
  if (!v5[0])
    return 0;
  return result;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)_decodeArrayOfObjectsForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  void *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = 0;
  p_decoder = &self->_decoder;
  v6 = 0;
  if (_NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)&v9))
  {
    v6 = 0;
    if (v9)
    {
      if ((_DWORD)v10 == 160)
      {
        v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __44__NSXPCDecoder__decodeArrayOfObjectsForKey___block_invoke;
        v8[3] = &unk_1E0F55868;
        v8[4] = self;
        v8[5] = a3;
        v8[6] = v6;
        _NSXPCSerializationIterateArrayObject(p_decoder, &v9, (uint64_t)v8);
      }
    }
  }
  return v6;
}

uint64_t __44__NSXPCDecoder__decodeArrayOfObjectsForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSNumber *v5;
  NSString *v7;

  v4 = (void *)MEMORY[0x186DA8F78]();
  v5 = _decodeObject_0(*(_QWORD *)(a1 + 32), *(const __CFString **)(a1 + 40), a2);
  if (!v5)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A value in array of key %@ was decoded as nil, which is not allowed."), *(_QWORD *)(a1 + 40));
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v7, 0));
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  objc_autoreleasePoolPop(v4);
  return 1;
}

- (double)decodeDoubleForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  _BOOL4 ObjectInDictionaryForKey;
  double result;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  p_decoder = &self->_decoder;
  ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v6);
  result = 0.0;
  if (ObjectInDictionaryForKey)
    return _NSXPCSerializationDoubleForObject(p_decoder, v6);
  return result;
}

- (int)__decodeXPCObject:(id)a3 allowingSimpleMessageSend:(BOOL)a4 outInvocation:(id *)a5 outArguments:(id *)a6 outArgumentsMaxCount:(unint64_t)a7 outMethodSignature:(id *)a8 outSelector:(SEL *)a9 isReply:(BOOL)a10 replySelector:(SEL)a11
{
  _BOOL4 v15;
  unint64_t offset;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  char *data;
  unint64_t v23;
  int v24;
  const char *v25;
  const char *v26;
  const char *v27;
  BOOL v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  _WORD *v46;
  __int16 v47;
  id v48;
  void *v49;
  const char *v50;
  id *v51;
  int result;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t i;
  id v57;
  id v58;
  void *v59;
  const char *v60;
  void *v61;
  const __CFString *v62;
  const __CFString *v63;
  const NSExceptionName *v64;
  NSString *v65;
  const char *Name;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id *v71;
  id *v72;
  id selfa;
  void *v74;
  void *v75;
  SEL v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;

  v15 = a4;
  v81 = *MEMORY[0x1E0C80C00];
  -[NSXPCDecoder _startReadingFromXPCObject:](self, "_startReadingFromXPCObject:", a3);
  offset = self->_rootObject.offset;
  v18 = offset + 9;
  v19 = offset >= 0xFFFFFFFFFFFFFFF7;
  v20 = v19 << 63 >> 63;
  if (v20 != v19 || v20 < 0 || (p_decoder = &self->_decoder, self->_decoder.dataLen <= v18))
  {
    v61 = (void *)MEMORY[0x1E0C99DA0];
    v62 = CFSTR("NSInvalidUnarchiveOperationException");
    v63 = CFSTR("Expected to find array of NSInvocation metadata but there were no entries");
    goto LABEL_73;
  }
  data = p_decoder->data;
  v23 = *(_QWORD *)&p_decoder->data[offset + 1];
  v79 = v18;
  v80 = v23;
  v78 = 0;
  if (v23 < v18)
  {
    v61 = (void *)MEMORY[0x1E0C99DA0];
    v62 = CFSTR("NSInvalidUnarchiveOperationException");
    v63 = CFSTR("Expected to find SEL for NSInvocation");
    goto LABEL_73;
  }
  v77 = v18;
  v24 = data[v18] & 0xF0;
  LODWORD(v78) = v24;
  v72 = a5;
  if (a10)
  {
    if (v24 == 224)
    {
      v25 = a11;
      v76 = a11;
      goto LABEL_12;
    }
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ received a reply that has should have been a reply, but does not have a null selector."), self, v67, v68, v70);
LABEL_84:
    v63 = (const __CFString *)v65;
    v61 = (void *)MEMORY[0x1E0C99DA0];
    v64 = &NSInvalidUnarchiveOperationException;
LABEL_85:
    v62 = (const __CFString *)*v64;
LABEL_73:
    objc_exception_throw((id)objc_msgSend(v61, "exceptionWithName:reason:userInfo:", v62, v63, 0));
  }
  if (v24 != 112)
  {
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ received a message that should have had a selector, but it does not (non-string)."), self, v67, v68, v70);
    goto LABEL_84;
  }
  v26 = (const char *)_NSXPCSerializationASCIIStringForObject(p_decoder, &v77);
  if (!v26)
    goto LABEL_78;
  v27 = sel_registerName(v26);
  v25 = v27;
  v76 = v27;
  if (a9)
    *a9 = v27;
LABEL_12:
  v71 = a8;
  v74 = 0;
  v75 = 0;
  if (-[NSXPCInterface _selectorIsAllowed:isReply:methodSignature:allowedClasses:](self->_interface, "_selectorIsAllowed:isReply:methodSignature:allowedClasses:", v25, a10, &v74, &v75))
  {
    v28 = v74 == 0;
  }
  else
  {
    v28 = 1;
  }
  if (v28)
  {
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ received a message or reply block that is not in the interface of the remote object (%s), dropping."), self, sel_getName(v25), v68, v70);
    goto LABEL_84;
  }
  _getLastByteOfValueIncludingMarker(p_decoder, v18, &v79);
  v29 = v79 + 1;
  v30 = v79 == -1;
  v31 = v30 << 63 >> 63;
  ++v79;
  if (v31 != v30 || v31 < 0)
  {
LABEL_76:
    v61 = (void *)MEMORY[0x1E0C99DA0];
    v62 = CFSTR("NSInvalidUnarchiveOperationException");
    v63 = CFSTR("Overflow of array data");
    goto LABEL_73;
  }
  if (v80 < v29 || self->_decoder.dataLen <= v29)
  {
    v61 = (void *)MEMORY[0x1E0C99DA0];
    v62 = CFSTR("NSInvalidUnarchiveOperationException");
    v63 = CFSTR("Expected to find types for NSInvocation");
    goto LABEL_73;
  }
  v77 = v29;
  LODWORD(v78) = p_decoder->data[v29] & 0xF0;
  if ((_DWORD)v78 != 112)
  {
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ received a message that has no NSInvocation types (non-string) (%s), dropping."), self, sel_getName(v25), v68, v70);
    goto LABEL_84;
  }
  v32 = _NSXPCSerializationASCIIStringForObject(p_decoder, &v77);
  if (!v32)
  {
LABEL_78:
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ received a message that should have had a selector, but it does not."), self, v67, v68, v70);
    goto LABEL_84;
  }
  v33 = (void *)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v32);
  v34 = v33;
  v35 = v74;
  if (v33 && v74)
  {
    if ((objc_msgSend(v33, "isEqual:", v74) & 1) != 0)
    {
      v36 = 1;
      goto LABEL_31;
    }
    v35 = v74;
  }
  if (!v34 || !v35 || (objc_msgSend(v35, "_isCompatibleWithMethodSignature:", v34) & 1) == 0)
  {
    Name = sel_getName(v25);
    v69 = objc_msgSend(v34, "_cTypeString");
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ received a message (%s) with an incompatible message signature (wire: %s vs local: %s)"), self, Name, v69, objc_msgSend(v74, "_cTypeString"));
    goto LABEL_84;
  }
  v36 = 0;
LABEL_31:
  _getLastByteOfValueIncludingMarker(p_decoder, v29, &v79);
  v37 = v79 + 1;
  v38 = v79 == -1;
  v39 = v38 << 63 >> 63;
  if (v39 != v38 || v39 < 0)
    goto LABEL_76;
  if (v80 < v37 || self->_decoder.dataLen <= v37)
  {
    v61 = (void *)MEMORY[0x1E0C99DA0];
    v62 = CFSTR("NSInvalidUnarchiveOperationException");
    v63 = CFSTR("Expected to find arguments for NSInvocation");
    goto LABEL_73;
  }
  v77 = v79 + 1;
  LODWORD(v78) = p_decoder->data[v37] & 0xF0;
  if ((_DWORD)v78 != 160)
  {
    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ received a message that has no NSInvocation arguments (non-array) (%s), dropping."), self, sel_getName(v25), v68, v70);
    goto LABEL_84;
  }
  if (v15 && objc_msgSend(v74, "_isAllObjects") && objc_msgSend(v74, "numberOfArguments") <= a7 + 2)
  {
    v53 = objc_msgSend(v34, "numberOfArguments");
    v54 = 1;
    if (!a10)
      v54 = 2;
    v55 = v53 - v54;
    if (v53 > v54)
    {
      _NSXPCSerializationDecodeInvocationObjectOnlyArgumentArray((uint64_t)a6, a7, v34, self, p_decoder, &v77, v75);
      for (i = 0; v55 != i; ++i)
      {
        v57 = a6[i];
        if (v57 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          v58 = -[NSXPCInterface _interfaceForArgument:ofSelector:reply:](self->_interface, "_interfaceForArgument:ofSelector:reply:", i, v25, a10);
          if (!v58 || (v59 = v58, (objc_opt_isKindOfClass() & 1) == 0))
          {
LABEL_74:
            v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Received a proxy object but the protocol does not describe a proxy object for this argument."), self);
            v61 = (void *)MEMORY[0x1E0C99DA0];
            v64 = (const NSExceptionName *)MEMORY[0x1E0C99778];
            goto LABEL_85;
          }
          objc_setProperty_atomic(v57, v60, v59, 16);
        }
      }
    }
    v51 = v71;
    *v72 = 0;
    result = 1;
    if (v71)
      goto LABEL_58;
  }
  else
  {
    v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v34);
    _NSXPCSerializationDecodeInvocationArgumentArray(v40, v34, self, (uint64_t *)p_decoder, &v77, v75);
    if ((v36 & 1) == 0)
    {
      v41 = v40;
      v40 = convertInvocationToMethodSignature(v41, v74, 0);
    }
    if (a10)
    {
      v42 = 1;
    }
    else
    {
      objc_msgSend(v40, "setArgument:atIndex:", &v76, 1);
      v42 = 2;
    }
    v43 = objc_msgSend(v34, "numberOfArguments");
    v44 = v43 - v42;
    if (v43 != v42)
    {
      for (j = 0; v44 != j; ++j)
      {
        v46 = (_WORD *)objc_msgSend(v34, "_argInfo:", v42 + j);
        v47 = v46[17];
        if ((v47 & 0x80) != 0)
          v47 = *(_WORD *)(*(_QWORD *)v46 + 34);
        if ((v47 & 0x2000) != 0)
        {
          selfa = 0;
          objc_msgSend(v40, "getArgument:atIndex:", &selfa, v42 + j);
          if (selfa)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v48 = -[NSXPCInterface _interfaceForArgument:ofSelector:reply:](self->_interface, "_interfaceForArgument:ofSelector:reply:", j, v76, a10);
              if (!v48)
                goto LABEL_74;
              v49 = v48;
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_74;
              if (selfa)
                objc_setProperty_atomic(selfa, v50, v49, 16);
            }
          }
        }
      }
    }
    v51 = v71;
    *v72 = v40;
    if (v71)
    {
      v34 = (void *)objc_msgSend(v40, "methodSignature");
      result = 0;
LABEL_58:
      *v51 = v34;
      return result;
    }
    return 0;
  }
  return result;
}

- (void)dealloc
{
  OS_xpc_object *oolObjects;
  __CFDictionary *objectReferences;
  int64_t allowedClassesIndex;
  uint64_t v6;
  unsigned int v7;
  id v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  oolObjects = self->_oolObjects;
  if (oolObjects)
    xpc_release(oolObjects);
  objectReferences = self->_decoder.objectReferences;
  if (objectReferences)
  {
    CFRelease(objectReferences);
    self->_decoder.objectReferences = 0;
  }
  allowedClassesIndex = self->_allowedClassesIndex;
  if ((allowedClassesIndex & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = self->_allowedClassesList[v6];
      if (v8)
      {

        allowedClassesIndex = self->_allowedClassesIndex;
      }
      v6 = v7;
    }
    while (allowedClassesIndex >= v7++);
  }

  v10.receiver = self;
  v10.super_class = (Class)NSXPCDecoder;
  -[NSXPCCoder dealloc](&v10, sel_dealloc);
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  id v6;
  void *v7;
  id v8;
  const char *result;
  unint64_t v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v10[1] = 0;
  p_decoder = &self->_decoder;
  if (_NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v10)&& (v6 = _NSXPCSerializationDataForObject(p_decoder, v10)) != 0&& (v7 = v6, objc_msgSend(v6, "length")))
  {
    v8 = v7;
    if (a4)
      *a4 = objc_msgSend(v7, "length");
    return (const char *)objc_msgSend(v7, "bytes");
  }
  else
  {
    result = 0;
    if (a4)
      *a4 = 0;
  }
  return result;
}

- (id)allowedClasses
{
  id v2;

  v2 = self->_allowedClassesList[self->_allowedClassesIndex];
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4 size:(unint64_t)a5
{
  uint64_t *p_decoder;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  unint64_t genericIndex;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v16[0] = 0;
  v16[1] = 0;
  p_decoder = (uint64_t *)&self->_decoder;
  v10 = self->_collections[self->_collectionPointer];
  genericIndex = self->_genericIndex;
  self->_genericIndex = genericIndex + 1;
  if (_NSXPCSerializationCreateObjectInDictionaryForGenericKey(&self->_decoder.data, v10, genericIndex, (uint64_t)v16))
  {
    v12 = v16[0] >= 0xFFFFFFFFFFFFFFF7;
    v13 = v12 << 63 >> 63;
    if (v13 != v12 || v13 < 0 || p_decoder[1] <= (unint64_t)(v16[0] + 9))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), CFSTR("Expected to find array of Objective-C typed arguments but there was nothing there"), 0));
    v14 = *(_QWORD *)(v16[0] + *p_decoder + 1);
    v15[0] = v16[0] + 9;
    v15[1] = v14;
    _NSXPCSerializationDecodeTypedObjCValuesFromArray(self, p_decoder, a3, a4, a5, 1, (uint64_t)v16, v15, 0, 0);
  }
}

- (NSXPCDecoder)initWithInterface:(id)a3
{
  NSXPCDecoder *v4;

  v4 = -[NSXPCDecoder init](self, "init");
  if (v4)
    v4->_interface = (NSXPCInterface *)a3;
  return v4;
}

- (int)_decodeMessageFromXPCObject:(id)a3 allowingSimpleMessageSend:(BOOL)a4 outInvocation:(id *)a5 outArguments:(id *)a6 outArgumentsMaxCount:(unint64_t)a7 outMethodSignature:(id *)a8 outSelector:(SEL *)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[NSXPCDecoder __decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:isReply:replySelector:](self, "__decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:isReply:replySelector:", a3, a4, a5, a6, a7, a8, a9, v10, 0);
}

- (id)_decodeReplyFromXPCObject:(id)a3 forSelector:(SEL)a4
{
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  LOBYTE(v5) = 1;
  -[NSXPCDecoder __decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:isReply:replySelector:](self, "__decodeXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:isReply:replySelector:", a3, 0, v6, 0, 0, 0, 0, v5, a4);
  return (id)v6[0];
}

- (BOOL)decodeBoolForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  _BOOL4 ObjectInDictionaryForKey;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  p_decoder = &self->_decoder;
  ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v6);
  if (ObjectInDictionaryForKey)
    LOBYTE(ObjectInDictionaryForKey) = v6[0]
                                    && p_decoder->dataLen > v6[0]
                                    && p_decoder->data[v6[0]] == 176;
  return ObjectInDictionaryForKey;
}

- (int)decodeInt32ForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  int result;
  unint64_t v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = 0;
  p_decoder = &self->_decoder;
  result = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v5);
  if (result)
    return _NSXPCSerializationIntegerForObject(p_decoder, v5);
  return result;
}

- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5
{
  void *v8;
  NSString *v9;

  v8 = (void *)objc_msgSend(a3, "setByAddingObjectsFromSet:", a4);
  v9 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v8, (uint64_t)v9))
  {
    return -[NSXPCDecoder _decodeCollectionOfClass:allowedClasses:forKey:](self, "_decodeCollectionOfClass:allowedClasses:forKey:", MEMORY[0x1E0C99D80], v8, a5);
  }
  else
  {
    return 0;
  }
}

- (id)_decodeCollectionOfClass:(Class)a3 allowedClasses:(id)a4 forKey:(id)a5
{
  id result;

  self->expectedUnnestedCollectionType = a3;
  result = -[NSXPCDecoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", objc_msgSend(a4, "setByAddingObject:"), a5);
  self->expectedUnnestedCollectionType = 0;
  return result;
}

- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4
{
  NSString *v7;

  v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, a3, (uint64_t)v7))
  {
    return -[NSXPCDecoder _decodeCollectionOfClass:allowedClasses:forKey:](self, "_decodeCollectionOfClass:allowedClasses:forKey:", MEMORY[0x1E0C99D20], a3, a4);
  }
  else
  {
    return 0;
  }
}

- (float)decodeFloatForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  _BOOL4 ObjectInDictionaryForKey;
  float result;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  p_decoder = &self->_decoder;
  ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v6);
  result = 0.0;
  if (ObjectInDictionaryForKey)
    return _NSXPCSerializationFloatForObject(p_decoder, v6);
  return result;
}

- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  uint64_t v9;
  NSString *v10;
  void *v11;
  NSString *v12;

  v6 = -[NSXPCDecoder decodeXPCObjectForKey:](self, "decodeXPCObjectForKey:", a4);
  v7 = v6;
  if (v6 && object_getClass(v6) != a3)
  {
    v9 = MEMORY[0x186DAAD0C](v7);
    if (v9)
    {
      v11 = (void *)v9;
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9);
      free(v11);
    }
    else
    {
      v10 = 0;
    }
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Type of resulting xpc_object_t (%@) does not match expected type for key '%@'."), v10, a4);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v12, 0));
  }
  return v7;
}

- (id)decodeXPCObjectForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  _BOOL4 ObjectInDictionaryForKey;
  id result;
  unint64_t v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  p_decoder = &self->_decoder;
  ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v7);
  result = 0;
  if (ObjectInDictionaryForKey)
    return -[NSXPCDecoder _xpcObjectForIndex:](self, "_xpcObjectForIndex:", _NSXPCSerializationIntegerForObject(p_decoder, v7));
  return result;
}

- (id)_xpcObjectForIndex:(int64_t)a3
{
  OS_xpc_object *oolObjects;

  oolObjects = self->_oolObjects;
  if (oolObjects && xpc_array_get_count(oolObjects) - 1 >= a3)
    return xpc_array_get_value(self->_oolObjects, a3);
  else
    return 0;
}

- (id)decodeObjectForKey:(id)a3
{
  return -[NSXPCDecoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", 0, a3);
}

- (id)connection
{
  return self->_connection;
}

- (void)_setConnection:(id)a3
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (connection != a3)
  {

    self->_connection = (NSXPCConnection *)a3;
  }
}

- (NSXPCDecoder)init
{
  NSXPCDecoder *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCDecoder;
  result = -[NSXPCCoder init](&v3, sel_init);
  if (result)
  {
    result->_allowedClassesIndex = 0;
    result->_allowedClassesList[0] = 0;
    result->_collectionPointer = 0;
    result->expectedUnnestedCollectionType = 0;
    result->_strictSecureDecodingEnabled = 0;
    result->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded = 0;
    result->_interface = 0;
  }
  return result;
}

- (void)beginReadingFromXPCObject:(id)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *p_rootObject;
  xpc_object_t value;
  void *v8;
  NSString *v9;

  p_rootObject = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->_rootObject;
  if (!_NSXPCSerializationStartRead(a3, &self->_decoder.data, (uint64_t)&self->_rootObject))
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: encoded data has been corrupted, there is no payload"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }
  self->_collections[self->_collectionPointer] = p_rootObject;
  value = xpc_dictionary_get_value(a3, "ool");
  if (!value)
    return;
  v8 = value;
  if (object_getClass(value) != (Class)MEMORY[0x1E0C812C8])
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: encoded data has been corrupted, out of line data is not an XPC array"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0));
  }
  self->_oolObjects = (OS_xpc_object *)xpc_retain(v8);
}

- (id)debugDescription
{
  OS_xpc_object *oolObjects;
  char *v4;
  uint64_t Data;
  id v6;
  const char *v7;
  NSString *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  oolObjects = self->_oolObjects;
  if (oolObjects)
    v4 = (char *)MEMORY[0x186DAAD0C](oolObjects, a2);
  else
    v4 = 0;
  Data = _NSXPCSerializationDebugInfoForReadData((uint64_t *)&self->_decoder);
  v10.receiver = self;
  v10.super_class = (Class)NSXPCDecoder;
  v6 = -[NSXPCDecoder debugDescription](&v10, sel_debugDescription);
  v7 = "(none)";
  if (v4)
    v7 = v4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Container data:\n%@\n OOL XPC data: %s"), v6, Data, v7);
  if (v4)
    free(v4);
  return v8;
}

- (id)__decoderInfoForAllowedClassesWarning
{
  NSString *connection;

  connection = (NSString *)self->_connection;
  if (connection)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), -[NSXPCConnection _serviceInfoForDecoder](connection));
  else
    return &stru_1E0F56070;
}

- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded
{
  self->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded = 1;
}

- (id)_currentClassAllowlist
{
  __objc2_class *v2;
  __objc2_class *v3;

  v2 = (__objc2_class *)self->_allowedClassesList[self->_allowedClassesIndex];
  v3 = (__objc2_class *)objc_opt_class();
  if (v3 != v2)
  {
    if (v3 != NSXPCInterface)
      return v2;
    v2 = _NSXPCDistantObject;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
}

- (void)_validateReusedReference:(id)a3 forKey:(id)a4
{
  id v7;
  NSString *v8;
  uint64_t v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = 0;
  v7 = -[NSXPCDecoder _currentClassAllowlist](self, "_currentClassAllowlist");
  if ((-[NSCoder _walkAllowedClassListValidatingInstance:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:invalidElementClass:](self, a3, (uint64_t)a4, v7, self->_strictSecureDecodingEnabled, self->_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded, -[NSXPCInterface _specialCaseObject](self->_interface, "_specialCaseObject"), v9) & 1) == 0)
  {
    if (v9[0])
      v8 = -[NSCoder __descriptionForUnexpectedElementClass:forContainerKey:allowedClasses:]((NSString *)self, v9[0], (const __CFString *)a4, v7);
    else
      v8 = -[NSCoder __descriptionForUnexpectedClass:forKey:allowedClasses:]((NSString *)self, 0, (const __CFString *)a4, v7);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v8, 0));
  }
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  uint64_t *p_decoder;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  unint64_t genericIndex;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v14[0] = 0;
  v14[1] = 0;
  p_decoder = (uint64_t *)&self->_decoder;
  v8 = self->_collections[self->_collectionPointer];
  genericIndex = self->_genericIndex;
  self->_genericIndex = genericIndex + 1;
  if (_NSXPCSerializationCreateObjectInDictionaryForGenericKey(&self->_decoder.data, v8, genericIndex, (uint64_t)v14))
  {
    v10 = v14[0] >= 0xFFFFFFFFFFFFFFF7;
    v11 = v10 << 63 >> 63;
    if (v11 != v10 || v11 < 0 || p_decoder[1] <= (unint64_t)(v14[0] + 9))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), CFSTR("Expected to find array of Objective-C typed arguments but there was nothing there"), 0));
    v12 = *(_QWORD *)(v14[0] + *p_decoder + 1);
    v13[0] = v14[0] + 9;
    v13[1] = v12;
    _NSXPCSerializationDecodeTypedObjCValuesFromArray(self, p_decoder, a3, a4, 0xFFFFFFFFuLL, 1, (uint64_t)v14, v13, 0, 0);
  }
}

- (id)decodeObject
{
  return -[NSXPCDecoder decodeObjectForKey:](self, "decodeObjectForKey:", 0);
}

- (const)_decodeCStringForKey:(id)a3
{
  $F2FB10EB8AB36D1DAB077BBC3792CBD6 *p_decoder;
  _BOOL4 ObjectInDictionaryForKey;
  const char *result;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  p_decoder = &self->_decoder;
  ObjectInDictionaryForKey = _NSXPCSerializationCreateObjectInDictionaryForKey(&self->_decoder.data, self->_collections[self->_collectionPointer], (const __CFString *)a3, (uint64_t)v6);
  result = 0;
  if (ObjectInDictionaryForKey)
    return (const char *)_NSXPCSerializationASCIIStringForObject(p_decoder, v6);
  return result;
}

- (BOOL)_testClass:(Class)a3 isAllowedByAllowList:(id)a4
{
  return -[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)self, a3, (uint64_t)CFSTR("DummyKey"), a4, self->_strictSecureDecodingEnabled, 1, 0);
}

@end

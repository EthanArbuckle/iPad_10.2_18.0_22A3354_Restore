@implementation NSXPCEncoder

- (void)_encodeArrayOfObjects:(id)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationStartArrayWrite((uint64_t *)p_encoder);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a3);
        -[NSXPCEncoder _encodeUnkeyedObject:](self, "_encodeUnkeyedObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v8);
  }
  _NSXPCSerializationEndArrayWrite(p_encoder);
}

- (void)_encodeObject:(id)a3
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;
  __CFDictionary *objectReferences;
  const void *Value;
  unint64_t genericIndex;
  BOOL askForReplacement;
  objc_class *Class;
  objc_class *v12;
  char *Name;
  size_t v14;
  NSString *v15;

  p_encoder = &self->_encoder;
  if (!a3)
  {
    _NSXPCSerializationAddNull((uint64_t)&self->_encoder);
    return;
  }
  objectReferences = self->_encoder._objectReferences;
  if (objectReferences)
  {
    Value = CFDictionaryGetValue(objectReferences, a3);
    if (Value)
    {
      _NSXPCSerializationAddReference((uint64_t)p_encoder, (unint64_t)Value);
      return;
    }
  }
  if (objc_msgSend(a3, "_allowsDirectEncoding"))
  {
    if (_NSIsNSString())
    {
      _NSXPCSerializationAddString((uint64_t)p_encoder, (CFStringRef)a3, 0);
      return;
    }
    if (_NSIsNSNumber())
    {
      _NSXPCSerializationAddNumber((uint64_t)p_encoder, (CFNumberRef)a3);
      return;
    }
    if (_NSIsNSData())
    {
      _NSXPCSerializationAddData((uint64_t)p_encoder, (CFDataRef)a3);
      return;
    }
  }
  else
  {
    _NSXPCSerializationAddObjectRef((uint64_t)p_encoder, a3);
  }
  genericIndex = self->_genericIndex;
  self->_genericIndex = 0;
  _NSXPCSerializationStartDictionaryWrite((uint64_t *)p_encoder);
  askForReplacement = self->_askForReplacement;
  self->_askForReplacement = 0;
  Class = object_getClass(a3);
  if (class_isMetaClass(Class))
  {
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Class objects may not be encoded at this time."), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_22;
  }
  v12 = (objc_class *)objc_msgSend(a3, "classForCoder");
  if (!v12)
  {
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Unable to determine what Class the encoded object should encode (classForCoder returned nil)"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_22:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0));
  }
  Name = (char *)class_getName(v12);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, "$class", 6, 1);
  v14 = strlen(Name);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v14, 1);
  self->_askForReplacement = askForReplacement;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, "$xpc", 4, 1);
    _NSXPCSerializationAddInteger((uint64_t)p_encoder, -[NSXPCEncoder _addOOLXPCObject:](self, "_addOOLXPCObject:", a3));
  }
  else
  {
    objc_msgSend(a3, "encodeWithCoder:", self);
  }
  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_genericIndex = genericIndex;
}

- (void)_encodeUnkeyedObject:(id)a3
{
  id v4;

  v4 = -[NSXPCEncoder _replaceObject:](self, "_replaceObject:", a3);
  -[NSXPCEncoder _checkObject:](self, "_checkObject:", v4);
  -[NSXPCEncoder _encodeObject:](self, "_encodeObject:", v4);
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  v6 = -[NSXPCEncoder _replaceObject:](self, "_replaceObject:", a3);
  -[NSXPCEncoder _checkObject:](self, "_checkObject:", v6);
  p_encoder = &self->_encoder;
  if (a4)
    _NSXPCSerializationAddString((uint64_t)p_encoder, (CFStringRef)a4, 1);
  else
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
  -[NSXPCEncoder _encodeObject:](self, "_encodeObject:", v6);
}

- (id)_replaceObject:(id)a3
{
  id v3;
  id v6;
  __CFDictionary *replacedByDelegateObjects;
  id Weak;
  void *v9;
  const void *v10;
  __CFDictionary *Mutable;
  void *v13;
  void *value[2];

  v3 = a3;
  value[1] = *(void **)MEMORY[0x1E0C80C00];
  value[0] = a3;
  if (self->_askForReplacement)
  {
    if (a3)
    {
      v6 = (id)objc_msgSend(a3, "replacementObjectForCoder:", self);
      if (v6 == v3 || (value[0] = v6, (v3 = v6) != 0))
      {
        if (objc_loadWeak((id *)&self->_delegate))
        {
          replacedByDelegateObjects = self->_replacedByDelegateObjects;
          if (replacedByDelegateObjects
            && CFDictionaryGetValueIfPresent(replacedByDelegateObjects, v3, (const void **)value))
          {
            return value[0];
          }
          else
          {
            Weak = objc_loadWeak((id *)&self->_delegate);
            v9 = (void *)objc_msgSend(Weak, "replacementObjectForEncoder:object:", self, value[0]);
            if (!v9)
            {
              v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The replacement object must not be nil."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
              objc_exception_throw(v13);
            }
            v3 = v9;
            v10 = value[0];
            if (v9 != value[0])
            {
              Mutable = self->_replacedByDelegateObjects;
              if (!Mutable)
              {
                Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                self->_replacedByDelegateObjects = Mutable;
                v10 = value[0];
              }
              CFDictionarySetValue(Mutable, v10, v3);
            }
          }
        }
      }
    }
  }
  return v3;
}

- (void)_checkObject:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  NSXPCConnection *connection;
  NSXPCConnection *v9;
  NSString *v10;
  NSString *v11;
  objc_class *v12;
  uint64_t v13;

  if (a3)
  {
    v6 = objc_opt_class();
    if (!v6)
    {
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: An object had no class."), _NSMethodExceptionProem((objc_class *)self, a2), v13);
      goto LABEL_12;
    }
    v7 = v6;
    connection = self->_connection;
    if (!connection
      || (-[_NSXPCConnectionClassCache containsClass:]((os_unfair_lock_s *)connection->_eCache, v6) & 1) == 0)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCC2CC8) & 1) != 0
        || (objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = self->_connection;
        if (v9)
          -[_NSXPCConnectionClassCache addClass:]((uint64_t)v9->_eCache, v7);
        return;
      }
      v11 = _NSMethodExceptionProem((objc_class *)self, a2);
      v12 = (objc_class *)objc_opt_class();
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This coder only encodes objects that adopt NSSecureCoding (object is of class '%s')."), v11, class_getName(v12));
LABEL_12:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0));
    }
  }
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddDouble((uint64_t)p_encoder, a3);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL4 v4;
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  v4 = a3;
  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddBool((uint64_t)p_encoder, v4);
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddFloat((uint64_t)p_encoder, a3);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)_encodeInvocation:(id)a3 isReply:(BOOL)a4 into:(id)a5
{
  _BOOL4 v6;
  unint64_t genericIndex;
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;
  int v11;
  char *Name;
  size_t v13;
  void *v14;
  char *v15;
  size_t v16;
  xpc_object_t v17;
  void *v18;
  OS_xpc_object *oolObjects;

  v6 = a4;
  genericIndex = self->_genericIndex;
  self->_genericIndex = 0;
  p_encoder = &self->_encoder;
  _NSXPCSerializationStartArrayWrite((uint64_t *)&self->_encoder);
  if (v6)
  {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
    v11 = 1;
  }
  else
  {
    Name = (char *)sel_getName((SEL)objc_msgSend(a3, "selector"));
    v13 = strlen(Name);
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v13, 0);
    v11 = 2;
  }
  v14 = (void *)objc_msgSend(a3, "methodSignature");
  v15 = (char *)objc_msgSend(v14, "_cTypeString");
  v16 = strlen(v15);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, v15, v16, 0);
  self->_askForReplacement = 1;
  _NSXPCSerializationAddInvocationArgumentsArray(a3, v14, self, (uint64_t *)p_encoder, v11);
  self->_askForReplacement = 0;
  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_genericIndex = genericIndex;
  v17 = _NSXPCSerializationCreateWriteData((uint64_t)p_encoder);
  if (!v17)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCoder is unable to serialize objects to be sent"), 0));
  v18 = v17;
  self->_finished = 1;
  xpc_dictionary_set_value(a5, "root", v17);
  xpc_release(v18);
  oolObjects = self->_oolObjects;
  if (oolObjects)
    xpc_dictionary_set_value(a5, "ool", oolObjects);
}

- (void)_encodeInvocationObjectArgumentsOnly:(id *)a3 count:(unint64_t)a4 typeString:(const char *)a5 selector:(SEL)a6 isReply:(BOOL)a7 into:(id)a8
{
  _BOOL4 v9;
  unint64_t genericIndex;
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;
  char *Name;
  size_t v18;
  size_t v19;
  xpc_object_t v20;
  void *v21;
  OS_xpc_object *oolObjects;

  v9 = a7;
  genericIndex = self->_genericIndex;
  self->_genericIndex = 0;
  p_encoder = &self->_encoder;
  _NSXPCSerializationStartArrayWrite((uint64_t *)&self->_encoder);
  if (v9)
  {
    _NSXPCSerializationAddNull((uint64_t)p_encoder);
  }
  else
  {
    Name = (char *)sel_getName(a6);
    v18 = strlen(Name);
    _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, Name, v18, 0);
  }
  v19 = strlen(a5);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, (void *)a5, v19, 0);
  self->_askForReplacement = 1;
  _NSXPCSerializationAddInvocationWithOnlyObjectArgumentsArray((double *)a3, a4, self, (uint64_t *)p_encoder);
  self->_askForReplacement = 0;
  _NSXPCSerializationEndArrayWrite(p_encoder);
  self->_genericIndex = genericIndex;
  v20 = _NSXPCSerializationCreateWriteData((uint64_t)p_encoder);
  if (!v20)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCoder is unable to serialize objects to be sent"), 0));
  v21 = v20;
  self->_finished = 1;
  xpc_dictionary_set_value(a8, "root", v20);
  xpc_release(v21);
  oolObjects = self->_oolObjects;
  if (oolObjects)
    xpc_dictionary_set_value(a8, "ool", oolObjects);
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddNull((uint64_t)&self->_encoder);
  _NSXPCSerializationStartArrayWrite((uint64_t *)p_encoder);
  _NSXPCSerializationAddTypedObjCValuesToArray(self, (uint64_t)p_encoder, a3, (double *)a4);
  _NSXPCSerializationEndArrayWrite(p_encoder);
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  void *v7;
  const __CFData *v8;

  if (!a3 && a4)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: argument inconsistency: bytes pointer is null but length (%ld) is not zero"), _NSMethodExceptionProem((objc_class *)self, a2), a4), 0);
    objc_exception_throw(v7);
  }
  v8 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a5, 1);
  _NSXPCSerializationAddData((uint64_t)&self->_encoder, v8);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  OS_xpc_object *oolObjects;
  __CFDictionary *replacedByDelegateObjects;
  xpc_object_t v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  oolObjects = self->_oolObjects;
  if (oolObjects)
    xpc_release(oolObjects);
  replacedByDelegateObjects = self->_replacedByDelegateObjects;
  if (replacedByDelegateObjects)
    CFRelease(replacedByDelegateObjects);
  if (!self->_finished)
  {
    v5 = _NSXPCSerializationCreateWriteData((uint64_t)&self->_encoder);
    xpc_release(v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)NSXPCEncoder;
  -[NSXPCCoder dealloc](&v6, sel_dealloc);
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (NSXPCEncoder)initWithStackSpace:(char *)a3 size:(unint64_t)a4
{
  NSXPCEncoder *v6;
  NSXPCEncoder *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSXPCEncoder;
  v6 = -[NSXPCCoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    _NSXPCSerializationStartWrite((uint64_t)&v6->_encoder, (uint64_t)a3, a4);
  return v7;
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, a3);
}

- (void)encodeXPCObject:(id)a3 forKey:(id)a4
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a4, 1);
  _NSXPCSerializationAddInteger((uint64_t)p_encoder, -[NSXPCEncoder _addOOLXPCObject:](self, "_addOOLXPCObject:", a3));
}

- (unint64_t)_addOOLXPCObject:(id)a3
{
  OS_xpc_object *oolObjects;
  size_t count;
  xpc_object_t v8[2];

  v8[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  v8[0] = a3;
  oolObjects = self->_oolObjects;
  if (oolObjects)
  {
    count = xpc_array_get_count(oolObjects);
    xpc_array_append_value(self->_oolObjects, a3);
    return count;
  }
  else
  {
    self->_oolObjects = (OS_xpc_object *)xpc_array_create(v8, 1uLL);
    return 0;
  }
}

- (id)_newRootXPCObject
{
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  OS_xpc_object *oolObjects;

  if (self->_topLevelDictionary)
    _NSXPCSerializationEndArrayWrite(self->_encoder.collectionSizeOffset);
  v3 = _NSXPCSerializationCreateWriteData((uint64_t)&self->_encoder);
  if (!v3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCoder is unable to serialize objects to be sent"), 0));
  v4 = v3;
  self->_finished = 1;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v5, "root", v4);
  xpc_release(v4);
  oolObjects = self->_oolObjects;
  if (oolObjects)
    xpc_dictionary_set_value(v5, "ool", oolObjects);
  return v5;
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

- (NSXPCEncoder)init
{
  return -[NSXPCEncoder initWithStackSpace:size:](self, "initWithStackSpace:size:", 0, 0);
}

- (id)debugDescription
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCEncoder;
  return -[NSXPCEncoder debugDescription](&v3, sel_debugDescription);
}

- (void)encodeObject:(id)a3
{
  -[NSXPCEncoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, 0);
}

- (void)beginEncoding
{
  self->_topLevelDictionary = 1;
  _NSXPCSerializationStartDictionaryWrite((uint64_t *)&self->_encoder);
}

- (id)finishEncoding
{
  return -[NSXPCEncoder _newRootXPCObject](self, "_newRootXPCObject");
}

- (void)_encodeCString:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  $E78745FDC0AF6599744021FB1675F31F *p_encoder;

  p_encoder = &self->_encoder;
  _NSXPCSerializationAddString((uint64_t)&self->_encoder, (CFStringRef)a5, 1);
  _NSXPCSerializationAddASCIIString((uint64_t)p_encoder, (void *)a3, a4, 1);
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This coder subclass does not support this method."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v4);
}

- (NSXPCEncoderDelegate)delegate
{
  return (NSXPCEncoderDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

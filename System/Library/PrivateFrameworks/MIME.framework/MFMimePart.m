@implementation MFMimePart

+ (void)initialize
{
  const __CFString *v3;
  unsigned int v4;
  NSHashTableCallBacks v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!sFore)
    sFore = -[MFLock initWithName:andDelegate:]([MFLock alloc], "initWithName:andDelegate:", CFSTR("fore"), a1);
  if (!sStringsCache)
  {
    v5.hash = (NSUInteger (__cdecl *)(NSHashTable *, const void *))_UniquingHash;
    v5.isEqual = (BOOL (__cdecl *)(NSHashTable *, const void *, const void *))_UniquingIsEqual;
    *(_OWORD *)&v5.retain = *(_OWORD *)(MEMORY[0x1E0CB2FA0] + 16);
    v5.describe = (NSString *(__cdecl *)(NSHashTable *, const void *))_UniquingDescribe;
    sStringsCache = (uint64_t)NSCreateHashTable(&v5, 0x19uLL);
    v3 = CFSTR("multipart");
    v5.hash = (NSUInteger (__cdecl *)(NSHashTable *, const void *))CFSTR("multipart");
    v5.isEqual = (BOOL (__cdecl *)(NSHashTable *, const void *, const void *))CFSTR("message");
    v5.retain = (void (__cdecl *)(NSHashTable *, const void *))CFSTR("text");
    v5.release = (void (__cdecl *)(NSHashTable *, void *))CFSTR("application");
    v5.describe = (NSString *(__cdecl *)(NSHashTable *, const void *))CFSTR("image");
    v6 = CFSTR("audio");
    v7 = CFSTR("video");
    v8 = CFSTR("alternative");
    v9 = CFSTR("mixed");
    v10 = CFSTR("related");
    v11 = CFSTR("x-folder");
    v12 = CFSTR("appledouble");
    v13 = CFSTR("digest");
    v14 = CFSTR("signed");
    v15 = CFSTR("plain");
    v16 = CFSTR("enriched");
    v17 = CFSTR("html");
    v18 = CFSTR("css");
    v19 = CFSTR("rfc822");
    v20 = CFSTR("applefile");
    v21 = CFSTR("filename");
    v22 = CFSTR("name");
    v23 = CFSTR("x-mac-type");
    v24 = CFSTR("x-mac-creator");
    v25 = CFSTR("format");
    v26 = CFSTR("flowed");
    v4 = 1;
    v27 = 0;
    do
    {
      NSHashInsert((NSHashTable *)sStringsCache, v3);
      v3 = (const __CFString *)*((_QWORD *)&v5.hash + v4++);
    }
    while (v3);
  }
  if (!sNSXMLLock)
    sNSXMLLock = -[MFLock initWithName:andDelegate:]([MFLock alloc], "initWithName:andDelegate:", CFSTR("NSXMLLock"), a1);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__MFMimePart_log__block_invoke;
  block[3] = &unk_1E5AA1880;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)log_log_0;
}

os_log_t __17__MFMimePart_log__block_invoke(uint64_t a1)
{
  const char *v1;
  os_log_t result;

  v1 = -[NSString UTF8String](NSStringFromClass(*(Class *)(a1 + 32)), "UTF8String");
  result = os_log_create("com.apple.email", v1);
  log_log_0 = (uint64_t)result;
  return result;
}

- (id)_objectInOtherIvarsForKey:(id)a3
{
  os_unfair_lock_s *p_otherIvarsLock;
  void *v6;

  p_otherIvarsLock = &self->_otherIvarsLock;
  os_unfair_lock_lock(&self->_otherIvarsLock);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_otherIvars, "objectForKeyedSubscript:", a3);
  os_unfair_lock_unlock(p_otherIvarsLock);
  return v6;
}

- (void)_setObjectInOtherIvars:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_otherIvarsLock;
  NSMutableDictionary *otherIvars;

  p_otherIvarsLock = &self->_otherIvarsLock;
  os_unfair_lock_lock(&self->_otherIvarsLock);
  otherIvars = self->_otherIvars;
  if (a3)
  {
    if (!otherIvars)
    {
      otherIvars = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      self->_otherIvars = otherIvars;
    }
    -[NSMutableDictionary setObject:forKey:](otherIvars, "setObject:forKey:", a3, a4);
  }
  else if (otherIvars)
  {
    -[NSMutableDictionary removeObjectForKey:](otherIvars, "removeObjectForKey:", a4);
  }
  os_unfair_lock_unlock(p_otherIvarsLock);
}

- (void)dealloc
{
  void *v3;
  MFMimePart *v4;
  MFMimePart *v5;
  uint64_t v6;
  MFMimePart *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;

  v3 = (void *)objc_opt_new();
  v4 = self;
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = -[MFMimePart firstChildPart](v5, "firstChildPart");
      if (v6)
        objc_msgSend(v3, "addObject:", v6);
      v7 = (MFMimePart *)-[MFMimePart nextSiblingPart](v5, "nextSiblingPart");
      -[MFMimePart _clearNextAndSibling](v5, "_clearNextAndSibling");

      if (!v7)
      {
        if (!objc_msgSend(v3, "count"))
          break;
        v7 = (MFMimePart *)(id)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        objc_msgSend(v3, "removeObjectAtIndex:", 0);
      }
      v5 = v7;
    }
    while (v7);
  }

  v8 = (id)-[NSMutableDictionary objectForKey:](self->_otherIvars, "objectForKey:", CFSTR("x-decrypted-message-body"));
  v9 = (id)-[NSMutableDictionary objectForKey:](self->_otherIvars, "objectForKey:", CFSTR("x-wrapped-subject"));
  v10 = (id)-[NSMutableDictionary objectForKey:](self->_otherIvars, "objectForKey:", CFSTR("x-decrypted-message"));
  v11 = (id)-[NSMutableDictionary objectForKey:](self->_otherIvars, "objectForKey:", CFSTR("x-decrypted-message-store"));

  v12.receiver = self;
  v12.super_class = (Class)MFMimePart;
  -[MFMimePart dealloc](&v12, sel_dealloc);
}

- (void)_clearNextAndSibling
{
  objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-nextsibling")), "_clearParent");
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", 0, CFSTR("x-nextsibling"));
  -[MFMimePart _clearParent](self->_nextPart, "_clearParent");

  self->_nextPart = 0;
}

- (void)_clearParent
{
  setParent((uint64_t)self, 0);
}

- (MFMimePart)init
{
  MFMimePart *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMimePart;
  result = -[MFMimePart init](&v3, sel_init);
  if (result)
  {
    result->_range = (_NSRange)xmmword_1ABB4D620;
    result->_otherIvarsLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSString)type
{
  if (self->_type)
    return self->_type;
  else
    return (NSString *)CFSTR("text");
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)_UniqueString((__CFString *)a3);
}

- (NSString)subtype
{
  NSString *result;
  NSString *v4;

  result = self->_subtype;
  if (!result)
  {
    v4 = -[MFMimePart type](self, "type");
    if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("text")))
    {
      return (NSString *)CFSTR("plain");
    }
    else if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("multipart")))
    {
      return (NSString *)CFSTR("mixed");
    }
    else if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("message")))
    {
      return (NSString *)CFSTR("rfc822");
    }
    else if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("application")))
    {
      return (NSString *)CFSTR("octet-stream");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setSubtype:(id)a3
{
  self->_subtype = (NSString *)_UniqueString((__CFString *)a3);
}

- (BOOL)hasContentType:(id)a3 subtype:(id)a4
{
  _BOOL4 v6;

  v6 = -[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", a3);
  if (v6)
  {
    if (a4)
      LOBYTE(v6) = -[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", a4);
    else
      LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)bodyParameterForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_bodyParameters, "objectForKey:", objc_msgSend(a3, "lowercaseString"));
}

- (void)setBodyParameter:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  void *v7;

  v6 = (__CFString *)_UniqueString((__CFString *)a4);
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("charset")) & 1) != 0
    || -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("format")))
  {
    a3 = _UniqueString((__CFString *)a3);
  }
  v7 = _UniqueString(v6);
  _MFSetValueInDictionary(self, (void **)&self->_bodyParameters, (uint64_t)v7, (uint64_t)a3);
}

- (id)bodyParameterKeys
{
  return (id)-[NSMutableDictionary allKeys](self->_bodyParameters, "allKeys");
}

- (NSString)contentTransferEncoding
{
  return self->_contentTransferEncoding;
}

- (void)setContentTransferEncoding:(id)a3
{
  self->_contentTransferEncoding = (NSString *)_UniqueString((__CFString *)a3);
}

- (NSString)disposition
{
  return (NSString *)-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", *MEMORY[0x1E0D1E530]);
}

- (void)setDisposition:(id)a3
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", _UniqueString((__CFString *)a3), *MEMORY[0x1E0D1E530]);
}

- (id)dispositionParameterForKey:(id)a3
{
  id v5;
  id result;

  v5 = -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters"));
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("filename")))
    return (id)objc_msgSend(v5, "objectForKey:", objc_msgSend(a3, "lowercaseString"));
  if (!-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("message")))
    return (id)objc_msgSend(v5, "objectForKey:", objc_msgSend(a3, "lowercaseString"));
  result = -[MFMimePart contentDescription](self, "contentDescription");
  if (!result)
    return (id)objc_msgSend(v5, "objectForKey:", objc_msgSend(a3, "lowercaseString"));
  return result;
}

- (void)setDispositionParameter:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters"));
  v11 = v7;
  v8 = _UniqueString((__CFString *)a4);
  _MFSetValueInDictionary(self, &v11, (uint64_t)v8, (uint64_t)a3);
  v9 = v11;
  if (v11)
  {
    v10 = v11;
    -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", v11, CFSTR("x-disposition-parameters"));
    v9 = v10;
  }
  if (!v7)

}

- (id)dispositionParameterKeys
{
  return (id)objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters")), "allKeys");
}

- (NSString)contentDescription
{
  return (NSString *)-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", *MEMORY[0x1E0D1E528]);
}

- (void)setContentDescription:(id)a3
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, *MEMORY[0x1E0D1E528]);
}

- (NSString)contentID
{
  return (NSString *)-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", *MEMORY[0x1E0D1E538]);
}

- (void)setContentID:(id)a3
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, *MEMORY[0x1E0D1E538]);
}

- (NSString)contentLocation
{
  return (NSString *)-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", *MEMORY[0x1E0D1E548]);
}

- (void)setContentLocation:(id)a3
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, *MEMORY[0x1E0D1E548]);
}

- (NSArray)languages
{
  return (NSArray *)-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", *MEMORY[0x1E0D1E540]);
}

- (void)setLanguages:(id)a3
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, *MEMORY[0x1E0D1E540]);
}

- (id)parentPart
{
  return -[MFWeakReferenceHolder retainedReference](self->_parent, "retainedReference");
}

- (id)firstChildPart
{
  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))
    || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("message"))
    && -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("rfc822")))
  {
    return self->_nextPart;
  }
  else
  {
    return 0;
  }
}

- (id)nextSiblingPart
{
  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))
    || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("message"))
    && -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("rfc822")))
  {
    return -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-nextsibling"));
  }
  else
  {
    return self->_nextPart;
  }
}

- (id)subparts
{
  void *v3;
  id v4;
  void *v5;

  if (!-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))
    && (!-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("message"))
     || !-[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("rfc822"))))
  {
    return 0;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[MFMimePart firstChildPart](self, "firstChildPart");
  if (v4)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      v5 = (void *)objc_msgSend(v5, "nextSiblingPart");
    }
    while (v5);
  }
  return v3;
}

- (id)subpartAtIndex:(int64_t)a3
{
  id result;
  int64_t v5;

  if (a3 < 0)
    return 0;
  result = -[MFMimePart firstChildPart](self, "firstChildPart");
  if (result)
  {
    v5 = a3 + 1;
    do
    {
      if (!--v5)
        break;
      result = (id)objc_msgSend(result, "nextSiblingPart");
    }
    while (result);
  }
  return result;
}

- (id)childPartWithNumber:(id)a3
{
  MFMimePart *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MFMimePart *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = self;
  v20 = *MEMORY[0x1E0C80C00];
  if (-[MFMimePart parentPart](self, "parentPart"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("MimePart.m"), 780, CFSTR("%@ cannot be called on non-top-level MIME parts"), NSStringFromSelector(a2));
  if (-[MFMimePart firstChildPart](v5, "firstChildPart"))
  {
    v6 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
LABEL_6:
      v10 = 0;
LABEL_7:
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "integerValue");
      if (v11 < 1)
      {
        return 0;
      }
      else
      {
        v12 = v11;
        for (i = -[MFMimePart firstChildPart](v5, "firstChildPart");
              ;
              i = -[MFMimePart nextSiblingPart](i, "nextSiblingPart"))
        {
          v5 = i;
          if (!i)
            break;
          if (!--v12)
          {
            if (++v10 != v8)
              goto LABEL_7;
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
            if (v8)
              goto LABEL_6;
            return v5;
          }
        }
      }
    }
  }
  else if (!objc_msgSend(a3, "isEqualToString:", CFSTR("1")))
  {
    return 0;
  }
  return v5;
}

- (void)setSubparts:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))
    || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("message"))
    && -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("rfc822")))
  {
    v5 = -[MFMimePart firstChildPart](self, "firstChildPart");
    if (v5)
    {
      v6 = v5;
      do
      {
        v7 = (id)objc_msgSend(v6, "nextSiblingPart");
        setParent((uint64_t)v6, 0);
        objc_msgSend(v6, "_setObjectInOtherIvars:forKey:", 0, CFSTR("x-nextsibling"));

        v6 = v7;
      }
      while (v7);
    }

    self->_nextPart = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(a3);
          -[MFMimePart addSubpart:](self, "addSubpart:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }
}

- (void)addSubpart:(id)a3
{
  MFMimePart *nextPart;
  MFMimePart *i;
  NSString *type;

  if (a3
    && (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))
     || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("message"))
     && -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("rfc822"))))
  {
    nextPart = self->_nextPart;
    if (nextPart)
    {
      for (i = self->_nextPart; ; nextPart = i)
      {
        i = -[MFMimePart nextSiblingPart](i, "nextSiblingPart");
        if (!i)
          break;
      }
      type = nextPart->_type;
      if (type
        && (-[NSString isEqualToString:](type, "isEqualToString:", CFSTR("multipart"))
         || -[NSString isEqualToString:](nextPart->_type, "isEqualToString:", CFSTR("message"))
         && -[NSString isEqualToString:](nextPart->_subtype, "isEqualToString:", CFSTR("rfc822"))))
      {
        -[MFMimePart _setObjectInOtherIvars:forKey:](nextPart, "_setObjectInOtherIvars:forKey:", a3, CFSTR("x-nextsibling"));
      }
      else
      {
        nextPart->_nextPart = (MFMimePart *)a3;
      }
    }
    else
    {
      self->_nextPart = (MFMimePart *)a3;
    }
    setParent((uint64_t)a3, self);
  }
}

- (BOOL)isDecodingComplete
{
  return -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0) != 0;
}

- (BOOL)isSecurePart
{
  NSString *v3;
  NSString *v4;
  void *v5;

  v3 = -[MFMimePart type](self, "type");
  if (!-[NSString ef_caseInsensitiveIsEqualToString:](v3, "ef_caseInsensitiveIsEqualToString:", CFSTR("application")))return -[NSString ef_caseInsensitiveIsEqualToString:](v3, "ef_caseInsensitiveIsEqualToString:", CFSTR("multipart"))&& -[NSString ef_caseInsensitiveIsEqualToString:](-[MFMimePart subtype](self, "subtype"), "ef_caseInsensitiveIsEqualToString:", CFSTR("signed"))&& -[MFMimePart usesKnownSignatureProtocol](self, "usesKnownSignatureProtocol");
  v4 = -[MFMimePart subtype](self, "subtype");
  if ((-[NSString ef_caseInsensitiveIsEqualToString:](v4, "ef_caseInsensitiveIsEqualToString:", CFSTR("pkcs7-mime")) & 1) != 0
    || (-[NSString ef_caseInsensitiveIsEqualToString:](v4, "ef_caseInsensitiveIsEqualToString:", CFSTR("pkcs7-signature")) & 1) != 0)
  {
    return 1;
  }
  if (-[NSString ef_caseInsensitiveIsEqualToString:](v4, "ef_caseInsensitiveIsEqualToString:", CFSTR("octet-stream")))
  {
    v5 = (void *)objc_msgSend(-[MFMimePart attachmentFilename](self, "attachmentFilename"), "pathExtension");
    if ((objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", CFSTR("p7m")) & 1) == 0
      && (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", CFSTR("p7s")) & 1) == 0
      && (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", CFSTR("p7c")) & 1) == 0)
    {
      return objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", CFSTR("p7z"));
    }
    return 1;
  }
  return 0;
}

- (BOOL)hasSecureSubparts
{
  id v3;
  uint64_t v4;
  MFMimePart *v5;
  char v6;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *, char *);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  char v16;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9 = __31__MFMimePart_hasSecureSubparts__block_invoke;
  v10 = &unk_1E5AA18A8;
  v11 = &v12;
  v16 = 0;
  v3 = -[MFMimePart firstChildPart](self, "firstChildPart", MEMORY[0x1E0C809B0], 3221225472);
  if (v3)
  {
    __31__MFMimePart_hasSecureSubparts__block_invoke((uint64_t)&v8, v3, &v16);
    while (!v16)
    {
      v4 = objc_msgSend(v3, "firstChildPart");
      if (!v4)
      {
        while (1)
        {
          v4 = objc_msgSend(v3, "nextSiblingPart");
          if (v4)
            break;
          v5 = (MFMimePart *)objc_msgSend(v3, "parentPart");
          v3 = v5;
          if (v5 == self || !v5)
            goto LABEL_10;
        }
      }
      v3 = (id)v4;
      v9((uint64_t)&v8, (void *)v4, &v16);
    }
  }
LABEL_10:
  v6 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __31__MFMimePart_hasSecureSubparts__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isSecurePart");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v6;
  int v7;
  NSString *v8;
  __int16 v9;
  MFMimePart *v10;
  uint64_t v11;
  NSRange v12;

  length = a3.length;
  location = a3.location;
  v11 = *MEMORY[0x1E0C80C00];
  self->_range = a3;
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12.location = location;
    v12.length = length;
    v7 = 138543618;
    v8 = NSStringFromRange(v12);
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1ABB13000, v6, OS_LOG_TYPE_INFO, "Setting range %{public}@ for part %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)decodedDataForData:(id)a3
{
  NSString *v5;
  NSString *v6;
  id result;
  NSObject *v8;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v5 = -[MFMimePart contentTransferEncoding](self, "contentTransferEncoding");
  if (!v5)
    return a3;
  v6 = v5;
  if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("7bit"))
    || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("8bit"))
    || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("binary")))
  {
    return a3;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("quoted-printable")))
  {
    result = (id)objc_msgSend(a3, "mf_decodeQuotedPrintableForText:", -[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("text")));
  }
  else if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("base64")))
  {
    result = (id)objc_msgSend(a3, "mf_decodeBase64");
  }
  else
  {
    if (!-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("x-uuencode")))
      goto LABEL_16;
    result = (id)objc_msgSend(a3, "mf_decodeUuencoded");
  }
  if (!result)
  {
LABEL_16:
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1ABB13000, v8, OS_LOG_TYPE_INFO, "*** Failed to decode %@ data, treating as binary", (uint8_t *)&v9, 0xCu);
    }
    return a3;
  }
  return result;
}

- (id)mimeBody
{
  id *v3;
  id v4;
  BOOL v5;
  void *v6;
  id *v7;
  BOOL v8;

  v3 = -[MFWeakReferenceHolder retainedReference](self->_parent, "retainedReference");
  v4 = -[MFWeakReferenceHolder retainedReference](self->_body, "retainedReference");
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v6 = v4;
  }
  else
  {
    do
    {
      v7 = v3;
      v6 = (void *)objc_msgSend(v3[9], "retainedReference");
      v3 = (id *)objc_msgSend(v3[8], "retainedReference");

      if (v6)
        v8 = 1;
      else
        v8 = v3 == 0;
    }
    while (!v8);
  }

  return v6;
}

- (void)setMimeBody:(id)a3
{
  id v5;
  MFWeakReferenceHolder *body;
  void *v7;

  v5 = +[MFWeakReferenceHolder weakReferenceWithObject:](MFWeakReferenceHolder, "weakReferenceWithObject:");
  body = self->_body;
  self->_body = (MFWeakReferenceHolder *)v5;

  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "message"), "messageURL");
  if (!self->_partURL)
    self->_partURL = (NSURL *)(id)objc_msgSend(v7, "URLByAppendingPathComponent:", -[MFMimePart partNumber](self, "partNumber"));
}

- (NSString)description
{
  void *v3;
  id v4;
  unsigned int i;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = -[MFMimePart parentPart](self, "parentPart");
  for (i = 0; v4; v4 = (id)objc_msgSend(v4, "parentPart"))
    ++i;
  _appendToDescriptionWithIndent((uint64_t)self, v3, i);
  return (NSString *)v3;
}

- (id)attachmentFilename
{
  const __CFString *FilenameEncodingHint;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  MFTypeInfo *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  FilenameEncodingHint = _getFilenameEncodingHint((id *)&self->super.isa);
  v4 = -[MFMimePart dispositionParameterForKey:](self, "dispositionParameterForKey:", CFSTR("filename"));
  v5 = (void *)objc_msgSend(v4, "mf_decodeMimeHeaderValueWithCharsetHint:", FilenameEncodingHint);
  if (objc_msgSend(v5, "isEqualToString:", &stru_1E5AA1FC8))
    v5 = v4;
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1ABB13000, v6, OS_LOG_TYPE_INFO, "---filename=%@", buf, 0xCu);
  }
  if (v5
    || !-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("message"))
    && !-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("external-body"))
    && (v5 = (void *)objc_msgSend(-[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("name")), "mf_decodeMimeHeaderValueWithCharsetHint:", _getFilenameEncodingHint((id *)&self->super.isa))) != 0|| -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))&& -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("appledouble"))&& ((v5 = (void *)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "attachmentFilename")) != 0|| (v5 = (void *)objc_msgSend((id)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart"), "attachmentFilename")) != 0))
  {
    v7 = (void *)objc_msgSend(v5, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
    if ((unint64_t)objc_msgSend(v7, "length") >= 0x100)
      v7 = (void *)objc_msgSend(v7, "substringToIndex:", 255);
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR(" "));
  }
  else
  {
    v9 = objc_alloc_init(MFTypeInfo);
    -[MFTypeInfo setMimeType:](v9, "setMimeType:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), -[MFMimePart type](self, "type"), -[MFMimePart subtype](self, "subtype")));
    MFGetTypeInfo(v9, 2);
    if (-[MFTypeInfo pathExtension](v9, "pathExtension"))
      v8 = (const __CFString *)objc_msgSend(CFSTR("mime-attachment"), "stringByAppendingPathExtension:", -[MFTypeInfo pathExtension](v9, "pathExtension"));
    else
      v8 = CFSTR("mime-attachment");

  }
  return (id)v8;
}

- (unsigned)textEncoding
{
  const __CFString *SomeCharsetFromPartTree;

  SomeCharsetFromPartTree = -[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("charset"));
  if (!SomeCharsetFromPartTree)
    SomeCharsetFromPartTree = (const __CFString *)_getSomeCharsetFromPartTree((id *)&self->super.isa);
  return MFEncodingForCharsetWithFallback(SomeCharsetFromPartTree, 0xFFFFFFFFLL);
}

- (BOOL)isReadableText
{
  _BOOL4 v3;
  NSString *v4;

  v3 = -[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("text"));
  if (v3)
  {
    v4 = -[MFMimePart subtype](self, "subtype");
    if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("html"))
      || -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("enriched"))
      || -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("plain")))
    {
      LOBYTE(v3) = 1;
    }
    else if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("calendar")))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("directory"));
    }
  }
  return v3;
}

- (id)_partThatIsAttachment
{
  MFMimePart *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v2 = self;
  v15 = *MEMORY[0x1E0C80C00];
  if (!-[MFMimePart isAttachment](self, "isAttachment"))
  {
    if (!-[NSString isEqualToString:](v2->_type, "isEqualToString:", CFSTR("multipart")))
      return 0;
    if (-[NSString isEqualToString:](v2->_subtype, "isEqualToString:", CFSTR("alternative")))
      return (id)objc_msgSend(-[MFMimePart chosenAlternativePart](v2, "chosenAlternativePart"), "_partThatIsAttachment");
    v4 = -[MFMimePart subparts](v2, "subparts");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_partThatIsAttachment");
          if (v9)
            return v9;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v2 = 0;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (BOOL)shouldConsiderInlineOverridingExchangeServer
{
  id v2;
  NSObject *v3;
  BOOL v4;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[MFMimePart dispositionParameterForKey:](self, "dispositionParameterForKey:", CFSTR("filename"));
  pthread_mutex_lock(&shouldConsiderInlineOverridingExchangeServer_reg_exp_mutex);
  v6 = 0;
  if (!shouldConsiderInlineOverridingExchangeServer_regex)
  {
    shouldConsiderInlineOverridingExchangeServer_regex = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^ATT\\d{3,}\\.\\.?([A-z]{3}|c)$"), 0, &v6);
    if (!shouldConsiderInlineOverridingExchangeServer_regex)
    {
      v3 = MFLogGeneral();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v8 = v6;
        _os_log_impl(&dword_1ABB13000, v3, OS_LOG_TYPE_DEFAULT, "#Warning Could not generate regex: %@", buf, 0xCu);
      }
    }
  }
  if (objc_msgSend(v2, "length"))
  {
    if (objc_msgSend((id)shouldConsiderInlineOverridingExchangeServer_regex, "numberOfMatchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length")))
    {
      v4 = 1;
    }
    else
    {
      v4 = 1;
      if (objc_msgSend(v2, "compare:options:", CFSTR("mime-attachment.txt"), 1))
        v4 = objc_msgSend(v2, "compare:options:", CFSTR("mime-attachment.html"), 1) == 0;
    }
  }
  else
  {
    v4 = 0;
  }
  pthread_mutex_unlock(&shouldConsiderInlineOverridingExchangeServer_reg_exp_mutex);
  return v4;
}

- (BOOL)isAttachment
{
  NSString *v3;
  uint64_t v4;
  BOOL v5;

  v3 = -[MFMimePart disposition](self, "disposition");
  if (-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("text")))
  {
    if (-[MFMimePart isReadableText](self, "isReadableText"))
    {
      if (-[MFMimePart shouldConsiderInlineOverridingExchangeServer](self, "shouldConsiderInlineOverridingExchangeServer"))
      {
LABEL_4:
        LOBYTE(v4) = 0;
        return v4;
      }
      if (!-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("css")))
      {
        if (!v3)
          goto LABEL_4;
LABEL_21:
        LOBYTE(v4) = -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("attachment"));
        return v4;
      }
    }
LABEL_17:
    LOBYTE(v4) = 1;
    return v4;
  }
  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart")))
  {
    if (-[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("x-folder")))
      goto LABEL_17;
    if (-[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("appledouble")))
    {
      LOBYTE(v4) = objc_msgSend((id)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart"), "isAttachment");
      return v4;
    }
    v5 = -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("digest"));
    LOBYTE(v4) = 0;
    if (!v5 && v3)
      goto LABEL_21;
  }
  else
  {
    if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("message")))
    {
      LOBYTE(v4) = !-[MFMimePart isGenerated](self, "isGenerated");
      return v4;
    }
    if (!-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("application")))
      goto LABEL_17;
    v4 = objc_msgSend(CFSTR("pkcs7-signature"), "mf_caseInsensitiveCompareExcludingXDash:", -[MFMimePart subtype](self, "subtype"));
    if (v4)
      LOBYTE(v4) = objc_msgSend(CFSTR("pkcs7-mime"), "mf_caseInsensitiveCompareExcludingXDash:", -[MFMimePart subtype](self, "subtype")) != 0;
  }
  return v4;
}

- (BOOL)isRich
{
  NSString *v3;
  int v4;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = -[MFMimePart type](self, "type");
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("text")))
  {
    if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("multipart")))
    {
      if (-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("alternative")))
      {
        return objc_msgSend(-[MFMimePart chosenAlternativePart](self, "chosenAlternativePart"), "isRich");
      }
      v6 = -[MFMimePart firstChildPart](self, "firstChildPart");
      if (v6)
      {
        v7 = v6;
        do
        {
          LOBYTE(v4) = objc_msgSend(v7, "isRich");
          v8 = objc_msgSend(v7, "nextSiblingPart");
          if (!v8)
            break;
          v7 = (void *)v8;
        }
        while ((v4 & 1) == 0);
        return v4;
      }
    }
    else if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("message")))
    {
      return -[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("rfc822"));
    }
    goto LABEL_14;
  }
  if (-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("plain")))
  {
LABEL_14:
    LOBYTE(v4) = 0;
    return v4;
  }
  return !-[MFMimePart isAttachment](self, "isAttachment");
}

- (BOOL)isHTML
{
  NSString *v3;
  int v4;
  id v5;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = -[MFMimePart type](self, "type");
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("text")))
  {
    if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("multipart")))
    {
      if (!-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("alternative")))
      {
        v7 = -[MFMimePart firstChildPart](self, "firstChildPart");
        if (v7)
        {
          v8 = v7;
          do
          {
            LOBYTE(v4) = objc_msgSend(v8, "isHTML");
            v9 = objc_msgSend(v8, "nextSiblingPart");
            if (!v9)
              break;
            v8 = (void *)v9;
          }
          while ((v4 & 1) == 0);
          return v4;
        }
        goto LABEL_16;
      }
      v5 = -[MFMimePart chosenAlternativePart](self, "chosenAlternativePart");
    }
    else
    {
      if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("message"))
        || !-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("rfc822")))
      {
        goto LABEL_16;
      }
      v5 = (id)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "startPart");
    }
    return objc_msgSend(v5, "isHTML");
  }
  if (!-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("html")))
  {
LABEL_16:
    LOBYTE(v4) = 0;
    return v4;
  }
  return !-[NSString isEqualToString:](-[MFMimePart disposition](self, "disposition"), "isEqualToString:", CFSTR("attachment"));
}

- (BOOL)hasValidMultipartSignedContentType
{
  _BOOL4 v3;

  v3 = -[MFMimePart hasContentType:subtype:](self, "hasContentType:subtype:", CFSTR("multipart"), CFSTR("signed"));
  if (v3)
    LOBYTE(v3) = -[MFMimePart usesKnownSignatureProtocol](self, "usesKnownSignatureProtocol");
  return v3;
}

- (BOOL)usesKnownSignatureProtocol
{
  const char *v2;
  CFMutableStringRef MimeToken;
  CFMutableStringRef v4;
  CFMutableStringRef v5;
  BOOL v6;
  _QWORD v8[3];
  id v9;

  v2 = (const char *)objc_msgSend(-[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("protocol")), "UTF8String");
  if (!v2)
    return 0;
  v8[0] = v2;
  v8[1] = &v2[strlen(v2)];
  v8[2] = 0xAAAAAAAA08000100;
  v9 = 0;
  MimeToken = _copyNextMimeToken((unsigned int *)v8, (uint64_t)&SLASH_SEPARATOR_MASK, 1);
  v4 = _copyNextMimeToken((unsigned int *)v8, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
  v5 = v4;
  v6 = 0;
  if (MimeToken && v4)
  {
    if (objc_msgSend(CFSTR("application"), "caseInsensitiveCompare:", MimeToken, v8[0]))
      v6 = 0;
    else
      v6 = objc_msgSend(CFSTR("pkcs7-signature"), "mf_caseInsensitiveCompareExcludingXDash:", v5) == 0;
  }

  if (v9)
  return v6;
}

- (id)rfc822DecodedMessageBody
{
  return -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-rfc822-decoded-message-body"));
}

- (void)_setRFC822DecodedMessageBody:(id)a3
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, CFSTR("x-rfc822-decoded-message-body"));
}

- (void)_setWrappedSubject:(id)a3
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, CFSTR("x-wrapped-subject"));
}

- (void)_setDecryptedMessageBody:(id)a3 isEncrypted:(BOOL)a4 isSigned:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  uint64_t v10;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_msgSend(a3, "message");
  v10 = objc_msgSend(v9, "messageStore");
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, CFSTR("x-decrypted-message-body"));
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6), CFSTR("x-is-encrypted"));
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), CFSTR("x-is-signed"));
  -[MFMimePart _setDecryptedMessageInDictionary:](self, "_setDecryptedMessageInDictionary:", v9);
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", v10, CFSTR("x-decrypted-message-store"));
}

- (unint64_t)totalTextSize
{
  NSString *v3;
  NSString *v4;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  void *v10;

  v3 = -[MFMimePart type](self, "type");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("multipart")))
  {
    v4 = -[MFMimePart subtype](self, "subtype");
    if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("alternative")))
    {
      v5 = -[MFMimePart chosenAlternativePart](self, "chosenAlternativePart");
      if ((objc_msgSend(v5, "isAttachment") & 1) == 0)
      {
        v6 = v5;
        return objc_msgSend(v6, "totalTextSize");
      }
    }
    else
    {
      v9 = -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("related"));
      v6 = -[MFMimePart firstChildPart](self, "firstChildPart");
      v10 = v6;
      if (v9)
      {
        if (v6)
          return objc_msgSend(v6, "totalTextSize");
      }
      else if (v6)
      {
        v8 = 0;
        do
        {
          if ((objc_msgSend(v10, "isAttachment") & 1) == 0)
            v8 += objc_msgSend(v10, "totalTextSize");
          v10 = (void *)objc_msgSend(v10, "nextSiblingPart");
        }
        while (v10);
        return v8;
      }
    }
    return 0;
  }
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("text"))
    && !-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("message")))
  {
    return 0;
  }
  -[MFMimePart range](self, "range");
  return v7;
}

- (id)startPart
{
  NSString *v3;
  id v5;
  id v6;
  MFMimePart *v7;
  MFMimePart *v8;
  MFMimePart *v9;
  uint64_t v10;

  if (!-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart")))
    return self;
  v3 = -[MFMimePart subtype](self, "subtype");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("mixed"))
    && objc_msgSend(-[MFMimePart subparts](self, "subparts"), "count") == 1)
  {
    return -[MFMimePart firstChildPart](self, "firstChildPart");
  }
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("related")))
    return self;
  v5 = -[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("start"));
  if (!v5)
    return -[MFMimePart subpartAtIndex:](self, "subpartAtIndex:", 0);
  v6 = v5;
  v7 = -[MFMimePart firstChildPart](self, "firstChildPart");
  if (!v7)
    return -[MFMimePart subpartAtIndex:](self, "subpartAtIndex:", 0);
  v8 = v7;
  do
  {
    if (-[NSString isEqualToString:](-[MFMimePart contentID](v8, "contentID"), "isEqualToString:", v6))
      v9 = v8;
    else
      v9 = self;
    v10 = -[MFMimePart nextSiblingPart](v8, "nextSiblingPart");
    if (!v10)
      break;
    v8 = (MFMimePart *)v10;
  }
  while (v9 == self);
  if (v9 == self)
    return -[MFMimePart subpartAtIndex:](self, "subpartAtIndex:", 0);
  return v9;
}

- (int64_t)numberOfAlternatives
{
  NSString *v3;
  id v4;
  int64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  if (!-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("multipart")))
    return -1;
  v3 = -[MFMimePart subtype](self, "subtype");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("alternative")))
  {
    v4 = -[MFMimePart firstChildPart](self, "firstChildPart");
    for (i = 0; v4; v4 = (id)objc_msgSend(v4, "nextSiblingPart"))
      ++i;
    return i;
  }
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("mixed")))
  {
    v6 = -[MFMimePart firstChildPart](self, "firstChildPart");
    if (v6)
    {
      v7 = v6;
      i = -1;
      do
      {
        v8 = objc_msgSend(v7, "numberOfAlternatives");
        if (i <= v8)
          i = v8;
        v7 = (void *)objc_msgSend(v7, "nextSiblingPart");
      }
      while (v7);
      return i;
    }
    return -1;
  }
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("signed")))
    return -1;
  v9 = -[MFMimePart firstChildPart](self, "firstChildPart");
  if (!v9)
    return -1;
  v10 = v9;
  i = -1;
  while (!objc_msgSend((id)objc_msgSend(v10, "type"), "isEqualToString:", CFSTR("multipart")))
  {
    v10 = (void *)objc_msgSend(v10, "nextSiblingPart");
    if (!v10)
      return i;
  }
  return objc_msgSend(v10, "numberOfAlternatives");
}

- (id)alternativeAtIndex:(int64_t)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  MFMimePart *v13;
  int64_t v14;
  id v15;
  void *v16;

  if (-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("alternative")))
  {
    if (a3 == -1)
    {
      v5 = objc_msgSend(-[MFMimePart subparts](self, "subparts"), "lastObject");
LABEL_26:
      v10 = (void *)v5;
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  if (!-[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("related")))
  {
    if (-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("signed")))
    {
      v15 = -[MFMimePart firstChildPart](self, "firstChildPart");
      if (!v15)
      {
LABEL_23:
        v10 = 0;
        goto LABEL_27;
      }
      v16 = v15;
      while (!objc_msgSend((id)objc_msgSend(v16, "type"), "isEqualToString:", CFSTR("multipart")))
      {
        v16 = (void *)objc_msgSend(v16, "nextSiblingPart");
        if (!v16)
          goto LABEL_23;
      }
      v5 = objc_msgSend(v16, "alternativeAtIndex:", a3);
      goto LABEL_26;
    }
LABEL_24:
    v13 = self;
    v14 = a3;
    goto LABEL_25;
  }
  v6 = -[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("start"));
  if (!v6)
    goto LABEL_17;
  v7 = v6;
  v8 = -[MFMimePart firstChildPart](self, "firstChildPart");
  if (!v8)
    goto LABEL_17;
  v9 = v8;
  do
  {
    if (objc_msgSend((id)objc_msgSend(v9, "contentID"), "isEqualToString:", v7))
      v10 = v9;
    else
      v10 = 0;
    v11 = objc_msgSend(v9, "nextSiblingPart");
    v9 = (void *)v11;
    if (v10)
      v12 = 1;
    else
      v12 = v11 == 0;
  }
  while (!v12);
  if (!v10)
  {
LABEL_17:
    v13 = self;
    v14 = 0;
LABEL_25:
    v5 = -[MFMimePart subpartAtIndex:](v13, "subpartAtIndex:", v14);
    goto LABEL_26;
  }
LABEL_27:
  if (v10)
    return v10;
  else
    return self;
}

- (id)signedData
{
  id result;

  result = -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-signed-data"));
  if (result)
    return result;
  return result;
}

- (id)textHtmlPart
{
  id result;
  MFMimePart *v4;

  if (-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("text"))
    && -[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("html")))
  {
    return self;
  }
  v4 = -[MFMimePart startPart](self, "startPart");
  if (v4 == self || (result = -[MFMimePart textHtmlPart](v4, "textHtmlPart")) == 0)
  {
    if (objc_msgSend(-[MFMimePart subparts](self, "subparts"), "count") == 1)
      return (id)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "textHtmlPart");
    else
      return 0;
  }
  return result;
}

+ (BOOL)parseContentTypeHeader:(id)a3 type:(id *)a4 subtype:(id *)a5 info:(id *)a6
{
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id v16;
  id v17;
  const char *v18[3];
  id v19;

  v18[0] = (const char *)objc_msgSend(a3, "UTF8String");
  v18[1] = &v18[0][strlen(v18[0])];
  v18[2] = (const char *)0xAAAAAAAA08000100;
  v19 = 0;
  v9 = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SLASH_SEPARATOR_MASK, 1);
  v10 = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
  v16 = 0;
  v17 = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  while (_scanMimeKeyValuePair((uint64_t)v18, &v17, &v16))
  {
    v12 = v17;
    if (v17)
      v13 = v16 == 0;
    else
      v13 = 1;
    if (!v13)
    {
      objc_msgSend(v11, "setObject:forKey:", v16, _UniqueString((__CFString *)v17));
      v12 = v17;
    }

  }
  if (a4)
    *a4 = v9;
  if (a5)
    *a5 = v10;
  if (a6)
    *a6 = v11;
  if (v19)

  if (v9)
    v14 = v10 == 0;
  else
    v14 = 1;
  return !v14;
}

+ (BOOL)parseContentTypeHeader:(id)a3 type:(id *)a4 subtype:(id *)a5
{
  return objc_msgSend(a1, "parseContentTypeHeader:type:subtype:info:", a3, a4, a5, 0);
}

- (ECSubject)wrappedSubject
{
  return (ECSubject *)-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-wrapped-subject"));
}

- (id)decryptedMessageBodyIsEncrypted:(BOOL *)a3 isSigned:(BOOL *)a4
{
  if (a3)
    *a3 = objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-is-encrypted")), "BOOLValue");
  if (a4)
    *a4 = objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-is-signed")), "BOOLValue");
  return -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-decrypted-message-body"));
}

- (void)clearCachedDescryptedMessageBody
{
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", 0, CFSTR("x-decrypted-message-body"));
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", 0, CFSTR("x-wrapped-subject"));
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", 0, CFSTR("x-is-encrypted"));
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", 0, CFSTR("x-is-signed"));
  -[MFMimePart _setDecryptedMessageInDictionary:](self, "_setDecryptedMessageInDictionary:", 0);
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", 0, _UniqueString(CFSTR("x-decrypted-message-store")));
}

- (void)_setDecryptedMessageInDictionary:(id)a3
{
  id v5;

  v5 = -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-decrypted-message"));
  if ((MFMimePart *)objc_msgSend(v5, "parentPart") == self)
    objc_msgSend(v5, "setStrongParentPart:", 1);
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", a3, CFSTR("x-decrypted-message"));
  if ((MFMimePart *)objc_msgSend(a3, "parentPart") == self)
    objc_msgSend(a3, "setStrongParentPart:", 0);
}

- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4
{
  id result;
  char isKindOfClass;
  uint64_t v8;
  void *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  result = 0;
  if (a4 && (isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(a3, "canBeConvertedToEncoding:", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding")))v8 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    else
      v8 = 10;
    v9 = (void *)objc_msgSend(a3, "dataUsingEncoding:", v8);
    result = 0;
    *a4 = v9;
  }
  return result;
}

- (void)configureFileWrapper:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *v11;

  v5 = -[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", CFSTR("x-unix-mode"));
  if (!objc_msgSend(a3, "preferredFilename"))
    objc_msgSend(a3, "setPreferredFilename:", -[MFMimePart attachmentFilename](self, "attachmentFilename"));
  if (!objc_msgSend(a3, "mimeType") && -[MFMimePart subtype](self, "subtype"))
    objc_msgSend(a3, "setMimeType:", -[MFMimePart _fullMimeTypeEvenInsideAppleDouble](self, "_fullMimeTypeEvenInsideAppleDouble"));
  if (v5)
  {
    v6 = strtoul((const char *)objc_msgSend(v5, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v6)
    {
      v7 = (void *)objc_msgSend(a3, "fileAttributes");
      if (v7)
        v8 = objc_msgSend(v7, "mutableCopyWithZone:", 0);
      else
        v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v6);
      objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x1E0CB2AA8]);
      objc_msgSend(a3, "setFileAttributes:", v9);

    }
  }
  v11 = -[MFMimePart contentID](self, "contentID");
  if (v11)
    objc_msgSend(a3, "setContentID:", v11);
}

- (void)download
{
  -[MFMimePart _ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:](self, "_ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:", 0x7FFFFFFFFFFFFFFFLL, 0, 1, 0, 0);
}

- (id)fileWrapperForcingDownload:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  id v7;
  BOOL v8;
  int v9;
  id v10;
  id v12;

  v3 = a3;
  v12 = 0;
  if (-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("text")))
  {
    v5 = -[MFMimePart bodyDataForcingDownload:](self, "bodyDataForcingDownload:", v3);
    v6 = 0;
    v12 = v5;
  }
  else
  {
    v6 = -[MFMimePart contentsForTextSystemForcingDownload:](self, "contentsForTextSystemForcingDownload:", v3);
  }
  v7 = -[MFMimePart fileWrapperForDecodedObject:withFileData:](self, "fileWrapperForDecodedObject:withFileData:", v6, &v12);
  if (v7)
    v8 = 1;
  else
    v8 = v12 == 0;
  v9 = !v8;
  if (!v8)
  {
    v10 = objc_allocWithZone((Class)MFMessageFileWrapper);
    v7 = (id)objc_msgSend(v10, "initRegularFileWithContents:", v12);
  }
  if (v7 && !objc_msgSend(v7, "preferredFilename"))
  {
    objc_msgSend(v7, "setPreferredFilename:", -[MFMimePart attachmentFilename](self, "attachmentFilename"));
    objc_msgSend(v7, "setFilename:", objc_msgSend(v7, "preferredFilename"));
    if (!v9)
      return v7;
    goto LABEL_15;
  }
  if (v9)
LABEL_15:
    -[MFMimePart configureFileWrapper:](self, "configureFileWrapper:", v7);
  return v7;
}

- (id)fileWrapper
{
  return -[MFMimePart fileWrapperForcingDownload:](self, "fileWrapperForcingDownload:", 0);
}

- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5
{
  return 0;
}

- (BOOL)_hasCompleteBodyDataToOffset:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  BOOL v12;

  v12 = 0;
  -[NSObject mf_lock](self, "mf_lock");
  v5 = -[MFWeakReferenceHolder retainedReference](self->_decodedData, "retainedReference");
  if (v5)
  {

LABEL_10:
    v12 = 1;
    goto LABEL_11;
  }
  -[MFMimePart range](self, "range");
  if (v6 >= a3)
    v7 = a3;
  else
    v7 = v6;
  if (self->_fullData)
    goto LABEL_10;
  v8 = -[MFPartialNetworkDataConsumer length](self->_partialDataConsumer, "length");
  v9 = v7 > v8;
  v10 = v7 - v8;
  if (!v9)
    goto LABEL_10;
  objc_msgSend((id)objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message"), "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", self, v8, v10, &v12, 0, 0);
LABEL_11:
  -[NSObject mf_unlock](self, "mf_unlock");
  return v12;
}

- (void)_ensureBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 isComplete:(BOOL *)a6 decoded:(id *)a7
{
  _BOOL8 v9;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSData *fullData;
  MFMutableData *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  char v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  _BOOL4 v33;
  MFPartialNetworkDataConsumer *partialDataConsumer;
  MFMutableData *v35;
  unint64_t v36;
  NSData *p_super;
  id v38;
  void *v39;
  MFPartialNetworkDataConsumer *v40;
  int v41;
  MFPartialNetworkDataConsumer *v42;
  MFMutableData *v43;
  uint8_t v44;
  _BYTE v45[14];
  BOOL v46;

  v9 = a5;
  v46 = 0;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (!-[NSObject mf_tryLock](self, "mf_tryLock"))
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal")
        && (v13 = MFLogGeneral(), os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)))
      {
        -[MFMimePart _ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:].cold.2(v13, v14, v15);
        if (!a6)
        {
LABEL_7:
          if (a7)
            *a7 = 0;
          return;
        }
      }
      else if (!a6)
      {
        goto LABEL_7;
      }
      *a6 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    -[NSObject mf_lock](self, "mf_lock");
  }
  v16 = -[MFWeakReferenceHolder retainedReference](self->_decodedData, "retainedReference");
  if (!v16)
  {
    -[MFMimePart range](self, "range");
    if (v19 >= a3)
      v20 = a3;
    else
      v20 = v19;
    fullData = self->_fullData;
    if (fullData)
    {
      v22 = fullData;
      if (a4)
      {
        -[MFMimePart range](self, "range");
        *a4 = v23;
      }
LABEL_20:
      v46 = 1;
LABEL_21:
      if (a7)
      {
        -[NSObject mf_unlock](self, "mf_unlock");
        v17 = -[MFMimePart decodedDataForData:](self, "decodedDataForData:", v22);
        -[NSObject mf_lock](self, "mf_lock");
        if (v17 && v46)
        {

          self->_decodedData = (MFWeakReferenceHolder *)+[MFWeakReferenceHolder weakReferenceWithObject:](MFWeakReferenceHolder, "weakReferenceWithObject:", v17);
        }
      }
      else
      {
        v17 = 0;
      }

      goto LABEL_41;
    }
    v24 = -[MFPartialNetworkDataConsumer length](self->_partialDataConsumer, "length");
    if (v24 >= v20)
    {
      if (v20)
      {
        v22 = -[MFPartialNetworkDataConsumer copyDataWithUnixLineEndings](self->_partialDataConsumer, "copyDataWithUnixLineEndings");
        if (a4)
          *a4 = v24;
        goto LABEL_21;
      }
      v22 = objc_alloc_init(MFMutableData);
      goto LABEL_20;
    }
    v25 = (void *)objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message");
    if (!self->_partialDataConsumer)
      self->_partialDataConsumer = objc_alloc_init(MFPartialNetworkDataConsumer);
    v26 = 0;
    while (1)
    {
      v27 = objc_msgSend(v25, "fetchDataForMimePart:inRange:withConsumer:isComplete:downloadIfNecessary:", self, v24, v20 - v24, self->_partialDataConsumer, &v46, v9);
      v28 = -[MFPartialNetworkDataConsumer length](self->_partialDataConsumer, "length");
      if (v46)
        break;
      v24 = v28;
      -[MFMimePart range](self, "range");
      if (v24 >= v29)
        break;
      if (!v27)
        goto LABEL_50;
      if (!-[MFPartialNetworkDataConsumer length](self->_partialDataConsumer, "length"))
      {
        if ((-[MFPartialNetworkDataConsumer length](self->_partialDataConsumer, "length") != 0) | v26 & 1)
          goto LABEL_50;
        v30 = MFLogGeneral();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[MFMimePart _ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:].cold.1(&v44, v45, v30);

        self->_partialDataConsumer = objc_alloc_init(MFPartialNetworkDataConsumer);
        v26 = 1;
      }
      if (v20 <= v24)
      {
LABEL_50:
        v22 = 0;
        goto LABEL_60;
      }
    }
    -[MFMimePart range](self, "range");
    if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      -[MFMimePart setRange:](self, "setRange:", -[MFMimePart range](self, "range"), -[MFPartialNetworkDataConsumer length](self->_partialDataConsumer, "length"));
    v33 = -[NSString isEqualToString:](-[MFMimePart contentTransferEncoding](self, "contentTransferEncoding"), "isEqualToString:", CFSTR("binary"));
    partialDataConsumer = self->_partialDataConsumer;
    if (v33)
      v35 = (MFMutableData *)-[MFPartialNetworkDataConsumer data](partialDataConsumer, "data");
    else
      v35 = -[MFPartialNetworkDataConsumer copyDataWithUnixLineEndings](partialDataConsumer, "copyDataWithUnixLineEndings");
    v22 = v35;

    self->_partialDataConsumer = 0;
    self->_fullData = (NSData *)v22;
    if (a4)
    {
      -[MFMimePart range](self, "range");
      *a4 = v36;
    }
    v46 = 1;
LABEL_60:
    p_super = &v22->super.super;
    if (!v22)
    {
      p_super = -[MFPartialNetworkDataConsumer data](self->_partialDataConsumer, "data");
      if (!p_super)
      {
        v22 = 0;
        goto LABEL_21;
      }
    }
    if (v27
      && (v38 = -[MFMimePart storeData:inMessage:isComplete:](self, "storeData:inMessage:isComplete:", p_super, v25, p_super == (NSData *)v22)) != 0)
    {
      v39 = v38;
      if (p_super != self->_fullData)
      {

        v40 = objc_alloc_init(MFPartialNetworkDataConsumer);
        self->_partialDataConsumer = v40;
        -[MFPartialNetworkDataConsumer appendData:](v40, "appendData:", v39);
        v41 = objc_msgSend(CFSTR("base64"), "isEqualToString:", -[MFMimePart contentTransferEncoding](self, "contentTransferEncoding"));

        v42 = self->_partialDataConsumer;
        if (v41)
        {
          v43 = (MFMutableData *)-[MFPartialNetworkDataConsumer data](v42, "data");
          goto LABEL_70;
        }
LABEL_69:
        v43 = -[MFPartialNetworkDataConsumer copyDataWithUnixLineEndings](v42, "copyDataWithUnixLineEndings");
LABEL_70:
        v22 = v43;
        if (a4)
          *a4 = -[MFPartialNetworkDataConsumer length](self->_partialDataConsumer, "length");
        goto LABEL_76;
      }

      self->_fullData = (NSData *)v39;
      v22 = v39;
    }
    else if (!v22)
    {
      v42 = self->_partialDataConsumer;
      goto LABEL_69;
    }
LABEL_76:
    -[MFPartialNetworkDataConsumer purge](self->_partialDataConsumer, "purge");
    goto LABEL_21;
  }
  v17 = v16;
  if (a4)
  {
    -[MFMimePart range](self, "range");
    *a4 = v18;
  }
  v46 = 1;
LABEL_41:
  -[NSObject mf_unlock](self, "mf_unlock");
  if (a6)
    *a6 = v46;
  if (a7)
    *a7 = v17;
  v31 = v17;
}

- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 isComplete:(BOOL *)a6
{
  id v7;

  v7 = 0;
  -[MFMimePart _ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:](self, "_ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:", a3, a4, a5, a6, &v7);
  return v7;
}

- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return -[MFMimePart copyBodyDataToOffset:resultOffset:downloadIfNecessary:](self, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:", a3, a4, 1);
}

- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  return -[MFMimePart copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:](self, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:", a3, a4, a5, 0);
}

- (id)bodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  return -[MFMimePart copyBodyDataToOffset:resultOffset:downloadIfNecessary:](self, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:", a3, a4, a5);
}

- (id)bodyDataForcingDownload:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  -[MFMimePart range](self, "range");
  return -[MFMimePart bodyDataToOffset:resultOffset:downloadIfNecessary:](self, "bodyDataToOffset:resultOffset:downloadIfNecessary:", v5, 0, v3);
}

- (BOOL)_shouldContinueDecodingProcess
{
  return 1;
}

+ (Class)attachmentClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isRecognizedClassForContent:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  unint64_t v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  MFMimePart *v18;
  uint64_t v19;
  id v20;
  MFMimePart *v21;
  MFMimePart *v22;
  void *Attachment;
  uint64_t v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  _QWORD v30[3];

  v8 = a6;
  v9 = a5;
  v30[2] = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))
    && -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("alternative")))
  {
    v13 = (id)objc_msgSend(-[MFMimePart chosenAlternativePart](self, "chosenAlternativePart"), "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, v9, v8, a7);
    if (!v13)
      goto LABEL_13;
LABEL_39:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = v13;
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    }
    return v13;
  }
  if (-[MFMimePart isAttachment](self, "isAttachment")
    && (!-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("application"))
     || -[NSString mf_caseInsensitiveCompareExcludingXDash:](self->_subtype, "mf_caseInsensitiveCompareExcludingXDash:", CFSTR("pkcs7-mime"))))
  {
    v13 = _createAttachment(self);
    if (v13)
    {
      if (a4)
      {
        -[MFMimePart range](self, "range");
        *a4 = v14;
      }
      if (a7)
        *a7 = 1;
      goto LABEL_39;
    }
  }
LABEL_13:
  v15 = -[MFMimePart contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](self, "contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, v9, v8, a7);
  if (!v15 && v9)
  {
    if (-[MFMimePart _shouldContinueDecodingProcess](self, "_shouldContinueDecodingProcess"))
      v15 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4294967254);
    else
      v15 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "attachmentClass")), "initWithWrapper:", v15);
    v17 = -[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("application"));
    v18 = self;
    if (v17)
    {
      v19 = objc_msgSend(CFSTR("pkcs7-mime"), "mf_caseInsensitiveCompareExcludingXDash:", -[MFMimePart subtype](self, "subtype", self));
      v18 = self;
      if (!v19)
        v18 = (MFMimePart *)objc_msgSend((id)objc_msgSend(-[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0), "topLevelPart"), "_partThatIsAttachment");
    }
    objc_msgSend(v16, "setMimePart:", v18);
    v13 = v16;
LABEL_38:
    if (!v13)
      return v13;
    goto LABEL_39;
  }
  if (objc_msgSend((id)objc_opt_class(), "isRecognizedClassForContent:", v15))
  {
    if (-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("text"))
      && (v20 = -[MFMimePart parentPart](self, "parentPart"),
          objc_msgSend((id)objc_msgSend(v20, "type"), "isEqualToString:", CFSTR("multipart")))
      && objc_msgSend((id)objc_msgSend(v20, "subtype"), "isEqualToString:", CFSTR("alternative"))
      && (v21 = (MFMimePart *)objc_msgSend((id)objc_msgSend(v20, "subparts"), "lastObject"), v22 = v21, v21 != self)
      && _isCalendar(v21))
    {
      Attachment = _createAttachment(v22);
      v30[0] = v15;
      v30[1] = Attachment;
      v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);

    }
    else
    {
      v24 = 0;
    }
    if (v24)
      v13 = (id)v24;
    else
      v13 = v15;
    goto LABEL_38;
  }
  if (v15)
  {
    v25 = MFLogGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = objc_opt_class();
      _os_log_impl(&dword_1ABB13000, v25, OS_LOG_TYPE_INFO, "Got back unrecognized class %@", buf, 0xCu);
    }
  }
  return 0;
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5
{
  return -[MFMimePart contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](self, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, 1, a5, 0);
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6
{
  return -[MFMimePart contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](self, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, a5, a6, 0);
}

- (unsigned)numberOfAttachments
{
  unsigned int v3;

  v3 = 0;
  -[MFMimePart getNumberOfAttachments:isSigned:isEncrypted:](self, "getNumberOfAttachments:isSigned:isEncrypted:", &v3, 0, 0);
  return v3;
}

- (void)getNumberOfAttachments:(unsigned int *)a3 isSigned:(BOOL *)a4 isEncrypted:(BOOL *)a5
{
  id v9;
  unsigned int v10;
  char v11;
  char v12;

  v12 = -86;
  v11 = -86;
  v9 = -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self, "decryptedMessageBodyIsEncrypted:isSigned:", &v12, &v11);
  if (v9)
  {
    v10 = objc_msgSend(v9, "numberOfAttachmentsSigned:encrypted:", a4, a5);
    if (a3)
      *a3 = v10;
  }
  else
  {
    if (a3)
    {
      *a3 = 0;
      _getAttachmentsAndAddToCount(self, a3, 0);
    }
    if (a4)
      *a4 = -[MFMimePart hasValidMultipartSignedContentType](self, "hasValidMultipartSignedContentType");
  }
  if (a5 && v12)
    *a5 = 1;
  if (a4)
  {
    if (v11)
      *a4 = 1;
  }
}

- (id)attachments
{
  id v3;
  void *v5;

  v3 = -[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  if (v3)
    return (id)objc_msgSend(v3, "attachments");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  _getAttachmentsAndAddToCount(self, 0, v5);
  return v5;
}

- (id)attachmentURLs
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[MFMimePart isAttachment](self, "isAttachment") && -[MFMimePart partURL](self, "partURL"))
    objc_msgSend(v3, "addObject:", -[MFMimePart partURL](self, "partURL"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = -[MFMimePart subparts](self, "subparts");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "isAttachment") && objc_msgSend(v9, "partURL"))
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "partURL"));
        if (!-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("message"))
          || !-[NSString isEqualToString:](-[MFMimePart subtype](self, "subtype"), "isEqualToString:", CFSTR("rfc822")))
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          v10 = (void *)objc_msgSend(v9, "subparts", 0);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v17;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v17 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "attachmentURLs"));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v12);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)partURL
{
  id result;
  NSURL *parentPartURL;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;

  result = self->_partURL;
  if (!result)
  {
    parentPartURL = self->_parentPartURL;
    if (!parentPartURL)
    {
      if (-[MFMimePart parentPart](self, "parentPart"))
        v5 = (void *)objc_msgSend(-[MFMimePart parentPart](self, "parentPart"), "partURL");
      else
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-attach://"));
      parentPartURL = v5;
      self->_parentPartURL = parentPartURL;
    }
    v6 = -[MFMimePart partNumber](self, "partNumber");
    if (v6)
      v7 = v6;
    else
      v7 = CFSTR("1");
    result = -[NSURL URLByAppendingPathComponent:isDirectory:](parentPartURL, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    self->_partURL = (NSURL *)result;
  }
  return result;
}

- (id)chosenAlternativePart
{
  id v3;
  unint64_t v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int64_t v12;

  v3 = -[MFMimePart subparts](self, "subparts");
  v4 = objc_msgSend(v3, "count");
  v5 = v4 - 1;
  v6 = v4 - 2;
  if (v4 >= 2)
  {
    if ((v7 = (void *)objc_msgSend(v3, "lastObject"),
          v8 = (void *)objc_msgSend(v7, "type"),
          v9 = objc_msgSend(v7, "subtype"),
          objc_msgSend(v8, "isEqualToString:", CFSTR("text")))
      && v9
      && !objc_msgSend(CFSTR("calendar"), "caseInsensitiveCompare:", v9)
      || objc_msgSend((id)objc_msgSend(v7, "type"), "isEqualToString:", CFSTR("text"))
      && !objc_msgSend(CFSTR("earthlink-xml"), "caseInsensitiveCompare:", objc_msgSend(v7, "subtype")))
    {
      if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v6), "isReadableText"))
        v5 = v6;
    }
  }
  v10 = -[MFMimePart firstChildPart](self, "firstChildPart");
  v11 = 0;
  if (v10 && (v5 & 0x8000000000000000) == 0)
  {
    v12 = 0;
    do
    {
      v11 = v10;
      v10 = (id)objc_msgSend(v10, "nextSiblingPart");
      if (!v10)
        break;
    }
    while (v12++ < v5);
  }
  return v11;
}

- (BOOL)isGenerated
{
  return -[NSString isEqualToString:](-[MFMimePart contentID](self, "contentID"), "isEqualToString:", CFSTR("5221C4CE-204E-45C0-95FC-7E20BAA21986"));
}

- (void)setIsGenerated:(BOOL)a3
{
  if (a3)
  {
    -[MFMimePart setContentID:](self, "setContentID:", CFSTR("5221C4CE-204E-45C0-95FC-7E20BAA21986"));
  }
  else if (-[MFMimePart isGenerated](self, "isGenerated"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MimePart.m"), 2211, CFSTR("Clearing generated state not implemented"));
  }
}

- (BOOL)parseMimeBody
{
  return -[MFMimePart parseMimeBodyDownloadIfNecessary:](self, "parseMimeBodyDownloadIfNecessary:", 1);
}

- (BOOL)parseMimeBodyDownloadIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v9;
  char v10;

  v3 = a3;
  v5 = (void *)objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message");
  v10 = 1;
  v9 = 0;
  v6 = objc_msgSend(v5, "bodyDataIsComplete:isPartial:downloadIfNecessary:", &v10, &v9, v3);
  v7 = objc_msgSend(v5, "headerDataDownloadIfNecessary:", v3);
  return -[MFMimePart parseMimeBodyFromHeaderData:bodyData:isPartial:](self, "parseMimeBodyFromHeaderData:bodyData:isPartial:", v7, v6, v9);
}

- (BOOL)parseMimeBodyFromHeaderData:(id)a3 bodyData:(id)a4 isPartial:(BOOL)a5
{
  unsigned int v5;
  id v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = -[MFMimePart mimeBody](self, "mimeBody");
  if (v9)
  {
    v10 = objc_msgSend((id)objc_msgSend(v9, "message"), "preferredEncoding");
    if (a3 && a4)
    {
      v11 = v10;
      -[MFMimePart setRange:](self, "setRange:", 0, objc_msgSend(a4, "length"));
      v12 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      objc_msgSend(a3, "length");
      if ((ECGetNextHeaderFromDataInRange() & 1) != 0
        || (v13 = _parseUuencodedParts(self, v11, a4, self->_range.location, self->_range.length)) == 0)
      {
        _parseHeaders((uint64_t)self, v11, a3, a4, v5);
      }
      else
      {
        v14 = v13;
        -[MFMimePart setType:](self, "setType:", CFSTR("multipart"));
        -[MFMimePart setSubtype:](self, "setSubtype:", CFSTR("mixed"));
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              -[MFMimePart addSubpart:](self, "addSubpart:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v16);
        }
      }
      objc_msgSend(v12, "drain");
      LOBYTE(v9) = 1;
    }
    else
    {
      v19 = MFLogGeneral();
      LODWORD(v9) = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if ((_DWORD)v9)
      {
        *(_DWORD *)buf = 134218240;
        v26 = objc_msgSend(a4, "length");
        v27 = 2048;
        v28 = objc_msgSend(a3, "length");
        _os_log_impl(&dword_1ABB13000, v19, OS_LOG_TYPE_INFO, "Failed to parse mime body!  bodyData: %lu\theaderData: %lu", buf, 0x16u);
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
}

- (void)_fixupBodyParametersRFC2231Values
{
  -[NSMutableDictionary mf_fixupRFC2231Values](self->_bodyParameters, "mf_fixupRFC2231Values");
}

- (void)_fixupDispositionParametersRFC2231Values
{
  objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters")), "mf_fixupRFC2231Values");
}

- (BOOL)parseIMAPPropertyList:(id)a3
{
  CFIndex Count;
  unint64_t v6;
  const void *ValueAtIndex;
  const void *v8;
  CFTypeID TypeID;
  CFIndex v10;
  CFTypeID v11;
  id v12;
  void *v13;
  CFTypeID v14;
  const void *v15;
  const void *v16;
  CFTypeID v17;
  const __CFArray *v18;
  const __CFArray *v19;
  CFTypeID v20;
  const void *v21;
  const void *v22;
  CFTypeID v23;
  const void *v24;
  const void *v25;
  CFTypeID v26;
  void *v27;
  const void *v28;
  CFTypeID v29;
  void *v30;
  void *v31;
  CFTypeID v32;
  CFTypeID v33;
  const __CFArray *v34;
  const __CFArray *v35;
  CFTypeID v36;
  void *v37;
  const __CFArray *v38;
  CFTypeID v39;
  CFIndex v40;
  unint64_t v41;
  const void *v42;
  const void *v43;
  CFTypeID v44;
  const __CFArray *v45;
  const __CFArray *v46;
  CFTypeID v47;
  id v48;
  void *v49;
  unint64_t v50;
  const void *v51;
  const void *v52;
  CFTypeID v53;
  id v54;
  void *v55;
  const __CFArray *v56;
  const __CFArray *v57;
  CFTypeID v58;
  CFIndex v59;
  unint64_t v60;
  const void *v61;
  const void *v62;
  CFTypeID v63;
  const __CFArray *v64;
  const __CFArray *v65;
  CFTypeID v66;
  id v67;
  void *v68;
  void *v69;
  const __CFArray *v70;
  CFTypeID v71;
  uint64_t v72;
  const void **v73;
  _QWORD *v74;
  uint64_t v75;
  const void **v76;
  CFArrayRef v77;
  CFTypeID v78;
  CFTypeID v79;
  void *v80;
  CFTypeID v81;
  void *v83;
  void *values;
  CFRange v85;

  if (a3)
  {
    Count = CFArrayGetCount((CFArrayRef)a3);
    if (Count >= 1)
    {
      v6 = Count;
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a3, 0);
      if (!ValueAtIndex)
        return (char)ValueAtIndex;
      v8 = ValueAtIndex;
      TypeID = CFArrayGetTypeID();
      if (TypeID == CFGetTypeID(v8))
      {
        -[MFMimePart setType:](self, "setType:", CFSTR("multipart"));
        v10 = 0;
        while (1)
        {
          v11 = CFArrayGetTypeID();
          if (v11 != CFGetTypeID(v8))
            break;
          v12 = objc_alloc_init((Class)objc_opt_class());
          if (v12)
          {
            v13 = v12;
            -[MFMimePart addSubpart:](self, "addSubpart:", v12);
            objc_msgSend(v13, "parseIMAPPropertyList:", v8);

          }
          if (++v10 < (uint64_t)v6)
          {
            v8 = CFArrayGetValueAtIndex((CFArrayRef)a3, v10);
            if (v8)
              continue;
          }
          goto LABEL_41;
        }
        v33 = CFStringGetTypeID();
        if (v33 == CFGetTypeID(v8))
          -[MFMimePart setSubtype:](self, "setSubtype:", v8);
LABEL_41:
        if (v10 + 1 < (uint64_t)v6)
        {
          v34 = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)a3, v10 + 1);
          if (v34)
          {
            v35 = v34;
            v36 = CFArrayGetTypeID();
            if (v36 == CFGetTypeID(v35))
              _setupDictionaryFromArray(self, (void **)&self->_bodyParameters, v35);
          }
        }
        if (v10 + 2 < (uint64_t)v6)
        {
          v37 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, v10 + 2);
          values = v37;
          if (v37)
          {
            v38 = (const __CFArray *)v37;
            v39 = CFArrayGetTypeID();
            if (v39 == CFGetTypeID(v38))
            {
              v40 = CFArrayGetCount(v38);
              if (v40 >= 1)
              {
                v41 = v40;
                v42 = CFArrayGetValueAtIndex(v38, 0);
                if (v42)
                {
                  v43 = v42;
                  v44 = CFStringGetTypeID();
                  if (v44 == CFGetTypeID(v43))
                    -[MFMimePart setDisposition:](self, "setDisposition:", v43);
                }
                if (v41 >= 2)
                {
                  v45 = (const __CFArray *)CFArrayGetValueAtIndex(v38, 1);
                  if (v45)
                  {
                    v46 = v45;
                    v47 = CFArrayGetTypeID();
                    if (v47 == CFGetTypeID(v46))
                    {
                      v48 = -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters"));
                      v83 = v48;
                      _setupDictionaryFromArray(self, &v83, v46);
                      v49 = v83;
                      if (v83)
                        -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", v83, CFSTR("x-disposition-parameters"));
                      if (!v48)

                    }
                  }
                }
              }
            }
          }
          goto LABEL_112;
        }
LABEL_111:
        values = 0;
LABEL_112:
        -[NSMutableDictionary mf_fixupRFC2231Values](self->_bodyParameters, "mf_fixupRFC2231Values");
        objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters")), "mf_fixupRFC2231Values");
        LOBYTE(ValueAtIndex) = 1;
        return (char)ValueAtIndex;
      }
      v14 = CFStringGetTypeID();
      if (v14 == CFGetTypeID(v8))
      {
        -[MFMimePart setType:](self, "setType:", v8);
        if (v6 <= 1)
        {
          values = 0;
        }
        else
        {
          v15 = CFArrayGetValueAtIndex((CFArrayRef)a3, 1);
          if (v15)
          {
            v16 = v15;
            v17 = CFStringGetTypeID();
            if (v17 == CFGetTypeID(v16))
              -[MFMimePart setSubtype:](self, "setSubtype:", v16);
          }
          if (v6 >= 3)
          {
            v18 = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)a3, 2);
            if (v18)
            {
              v19 = v18;
              v20 = CFArrayGetTypeID();
              if (v20 == CFGetTypeID(v19))
                _setupDictionaryFromArray(self, (void **)&self->_bodyParameters, v19);
            }
            if (v6 > 3)
            {
              v21 = CFArrayGetValueAtIndex((CFArrayRef)a3, 3);
              if (v21)
              {
                v22 = v21;
                v23 = CFStringGetTypeID();
                if (v23 == CFGetTypeID(v22))
                  -[MFMimePart setContentID:](self, "setContentID:", v22);
              }
              if (v6 >= 5)
              {
                v24 = CFArrayGetValueAtIndex((CFArrayRef)a3, 4);
                if (v24)
                {
                  v25 = v24;
                  v26 = CFStringGetTypeID();
                  if (v26 == CFGetTypeID(v25))
                    -[MFMimePart setContentDescription:](self, "setContentDescription:", v25);
                }
                if (v6 > 5)
                {
                  v27 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, 5);
                  values = v27;
                  if (v27)
                  {
                    v28 = v27;
                    v29 = CFStringGetTypeID();
                    if (v29 == CFGetTypeID(v28))
                      -[MFMimePart setContentTransferEncoding:](self, "setContentTransferEncoding:", v28);
                  }
                  if (v6 >= 7)
                  {
                    v30 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, 6);
                    if (v30)
                    {
                      v31 = v30;
                      v32 = CFNumberGetTypeID();
                      if (v32 == CFGetTypeID(v31))
                        -[MFMimePart setRange:](self, "setRange:", 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v31, "unsignedIntegerValue"));
                    }
                  }
LABEL_62:
                  if (-[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", CFSTR("text")))
                  {
                    v50 = 9;
                  }
                  else if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("message"))
                         && -[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("rfc822")))
                  {
                    if (v6 <= 8)
                    {
                      values = 0;
                    }
                    else
                    {
                      v51 = CFArrayGetValueAtIndex((CFArrayRef)a3, 8);
                      if (v51)
                      {
                        v52 = v51;
                        v53 = CFArrayGetTypeID();
                        if (v53 == CFGetTypeID(v52))
                        {
                          v54 = objc_alloc_init((Class)objc_opt_class());
                          if (v54)
                          {
                            v55 = v54;
                            -[MFMimePart addSubpart:](self, "addSubpart:", v54);
                            objc_msgSend(v55, "parseIMAPPropertyList:", v52);

                          }
                        }
                      }
                    }
                    v50 = 11;
                  }
                  else
                  {
                    v50 = 8;
                  }
                  if (v50 >= v6)
                  {
                    values = 0;
                  }
                  else
                  {
                    v56 = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)a3, v50);
                    if (v56)
                    {
                      v57 = v56;
                      v58 = CFArrayGetTypeID();
                      if (v58 == CFGetTypeID(v57))
                      {
                        v59 = CFArrayGetCount(v57);
                        if (v59 >= 1)
                        {
                          v60 = v59;
                          v61 = CFArrayGetValueAtIndex(v57, 0);
                          if (v61)
                          {
                            v62 = v61;
                            v63 = CFStringGetTypeID();
                            if (v63 == CFGetTypeID(v62))
                              -[MFMimePart setDisposition:](self, "setDisposition:", v62);
                          }
                          if (v60 >= 2)
                          {
                            v64 = (const __CFArray *)CFArrayGetValueAtIndex(v57, 1);
                            if (v64)
                            {
                              v65 = v64;
                              v66 = CFArrayGetTypeID();
                              if (v66 == CFGetTypeID(v65))
                              {
                                v67 = -[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters"));
                                v83 = v67;
                                _setupDictionaryFromArray(self, &v83, v65);
                                v68 = v83;
                                if (v83)
                                  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", v83, CFSTR("x-disposition-parameters"));
                                if (!v67)

                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  if (v50 + 1 >= v6)
                  {
                    values = 0;
                    goto LABEL_106;
                  }
                  v69 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, v50 + 1);
                  values = v69;
                  if (!v69)
                    goto LABEL_106;
                  v70 = (const __CFArray *)v69;
                  v71 = CFArrayGetTypeID();
                  if (v71 == CFGetTypeID(v70))
                  {
                    v72 = CFArrayGetCount(v70);
                    v73 = (const void **)malloc_type_malloc(8 * v72, 0xC0040B8AA526DuLL);
                    v74 = malloc_type_malloc(8 * v72, 0x80040B8603338uLL);
                    v85.location = 0;
                    v85.length = v72;
                    CFArrayGetValues(v70, v85, v73);
                    if (v72 < 1)
                      goto LABEL_102;
                    v75 = 0;
                    v76 = v73;
                    do
                    {
                      if (*v76)
                        v74[v75++] = *v76;
                      ++v76;
                      --v72;
                    }
                    while (v72);
                    if (v75)
                      v77 = (CFArrayRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v74, v75);
                    else
LABEL_102:
                      v77 = 0;
                    free(v73);
                    free(v74);
                  }
                  else
                  {
                    v78 = CFStringGetTypeID();
                    if (v78 != CFGetTypeID(v70))
                      goto LABEL_106;
                    v77 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
                  }
                  if (v77)
                  {
                    -[MFMimePart setLanguages:](self, "setLanguages:", v77);
                    CFRelease(v77);
                  }
LABEL_106:
                  if ((uint64_t)(v50 + 2) < (uint64_t)v6)
                  {
                    values = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, v50 + 2);
                    if (values)
                    {
                      v79 = CFArrayGetTypeID();
                      if (v79 == CFGetTypeID(values) && CFArrayGetCount((CFArrayRef)values) >= 1)
                      {
                        v80 = (void *)CFArrayGetValueAtIndex((CFArrayRef)values, 0);
                        values = v80;
                      }
                      else
                      {
                        v80 = values;
                      }
                      if (v80)
                      {
                        v81 = CFStringGetTypeID();
                        if (v81 == CFGetTypeID(values))
                          -[MFMimePart setContentLocation:](self, "setContentLocation:", values);
                      }
                    }
                    goto LABEL_112;
                  }
                  goto LABEL_111;
                }
              }
LABEL_61:
              values = 0;
              goto LABEL_62;
            }
          }
        }
        values = 0;
        goto LABEL_61;
      }
    }
    LOBYTE(ValueAtIndex) = 0;
  }
  else
  {
    LOBYTE(ValueAtIndex) = 0;
  }
  return (char)ValueAtIndex;
}

- (id)partNumber
{
  MFMimePart *v3;
  uint64_t v4;
  id v5;
  id *v6;
  void *v7;
  MFMimePart *v8;
  int i;
  __CFString *v10;
  id *v11;

  v3 = self;
  v4 = -[MFWeakReferenceHolder retainedReference](v3->_parent, "retainedReference");
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      v6 = (id *)v4;
      if ((objc_msgSend(*(id *)(v4 + 8), "isEqualToString:", CFSTR("multipart")) & 1) == 0
        && (!objc_msgSend(v6[1], "isEqualToString:", CFSTR("message"))
         || !objc_msgSend(v6[2], "isEqualToString:", CFSTR("rfc822"))))
      {
        v11 = v6;
        goto LABEL_21;
      }
      v7 = (void *)objc_msgSend(v6, "type");
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("multipart")))
      {
        v8 = (MFMimePart *)objc_msgSend(v6, "firstChildPart");
        for (i = 1; v8; v8 = -[MFMimePart nextSiblingPart](v8, "nextSiblingPart"))
        {
          if (v3 == v8)
            break;
          ++i;
        }
        v10 = (__CFString *)EFStringWithInt();
        if (!v10)
          goto LABEL_17;
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("message")))
          goto LABEL_17;
        v10 = CFSTR("1");
        if (-[NSString isEqualToString:](-[MFMimePart type](v3, "type"), "isEqualToString:", CFSTR("multipart")))
          goto LABEL_17;
      }
      if (v5)
      {
        objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, 0, CFSTR("."));
        objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, 0, v10);
      }
      else
      {
        v5 = (id)-[__CFString mutableCopy](v10, "mutableCopy");
      }
LABEL_17:

      v4 = objc_msgSend(v6[8], "retainedReference");
      v3 = (MFMimePart *)v6;
      if (!v4)
      {
        v11 = 0;
        v3 = (MFMimePart *)v6;
        goto LABEL_21;
      }
    }
  }
  v11 = 0;
  v5 = 0;
LABEL_21:

  if (!v5 && !-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart")))
    return CFSTR("1");
  return v5;
}

- (id)_fullMimeTypeEvenInsideAppleDouble
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  if (!-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart"))
    || !-[NSString isEqualToString:](self->_subtype, "isEqualToString:", CFSTR("appledouble"))
    || (v3 = (void *)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart")) == 0)
  {
    if (objc_msgSend(CFSTR("application"), "isEqualToString:", -[MFMimePart type](self, "type"))
      && objc_msgSend(CFSTR("zip"), "isEqualToString:", -[MFMimePart subtype](self, "subtype")))
    {
      v5 = -[MFMimePart attachmentFilename](self, "attachmentFilename");
      if ((objc_msgSend(v5, "hasSuffix:", CFSTR(".pages.zip")) & 1) != 0)
        return CFSTR("application/vnd.iwork.pages.archive");
      if ((objc_msgSend(v5, "hasSuffix:", CFSTR(".key.zip")) & 1) != 0)
        return CFSTR("application/vnd.iwork.keynote.archive");
      if ((objc_msgSend(v5, "hasSuffix:", CFSTR(".numbers.zip")) & 1) != 0)
        return CFSTR("application/vnd.iwork.numbers.archive");
    }
    else
    {
      if (!objc_msgSend(CFSTR("application"), "isEqualToString:", -[MFMimePart type](self, "type"))
        || !objc_msgSend(CFSTR("octet-stream"), "isEqualToString:", -[MFMimePart subtype](self, "subtype")))
      {
        goto LABEL_22;
      }
      v6 = (void *)objc_msgSend(-[MFMimePart attachmentFilename](self, "attachmentFilename"), "pathExtension");
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("pages")) & 1) != 0)
        return CFSTR("application/x-iwork-pages-sffpages");
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("key")) & 1) != 0)
        return CFSTR("application/x-iwork-keynote-sffkey");
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("numbers")) & 1) != 0)
        return CFSTR("application/x-iwork-numbers-sffnumbers");
    }
LABEL_22:
    v4 = (id)-[NSString mutableCopy](-[MFMimePart type](self, "type"), "mutableCopy");
    objc_msgSend(v4, "appendString:", CFSTR("/"));
    objc_msgSend(v4, "appendString:", -[MFMimePart subtype](self, "subtype"));
    return v4;
  }
  v4 = (id)objc_msgSend(v3, "_fullMimeTypeEvenInsideAppleDouble");
  if (!v4)
    goto LABEL_22;
  return v4;
}

- (id)decodeText
{
  return _MFCopyDecodeText(self, 0);
}

- (void)_contents:(id *)a3 toOffset:(unint64_t)a4 resultOffset:(unint64_t *)a5 downloadIfNecessary:(BOOL)a6 asHTML:(BOOL)a7 isComplete:(BOOL *)a8
{
  _BOOL8 v9;
  __CFString *v12;
  __CFString *v13;
  CFIndex v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  __int128 v19;
  UInt8 *v20;
  int v21;
  CFRange v22;
  UInt8 *v23;
  int v24;
  CFIndex v25;
  CFRange v26;
  CFIndex Bytes;
  char *i;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  BOOL *v37;
  _BOOL4 v39;
  char __source[8];
  _OWORD v42[4];
  uint64_t v43;

  v9 = a7;
  v39 = a6;
  v43 = *MEMORY[0x1E0C80C00];
  v12 = -[MFMimePart type](self, "type");
  v13 = -[MFMimePart subtype](self, "subtype");
  strcpy(__source, "decode");
  v14 = -[__CFString length](v12, "length");
  v15 = -[__CFString length](v13, "length");
  v16 = v15;
  v17 = v14 + v15 + 8;
  v37 = a8;
  if (v17 < 0x41)
  {
    v18 = (char *)v42;
    v17 = 64;
  }
  else
  {
    v18 = (char *)malloc_type_malloc(v14 + v15 + 8, 0x9B137699uLL);
  }
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42[2] = v19;
  v42[3] = v19;
  v42[0] = v19;
  v42[1] = v19;
  strlcpy(v18, __source, v17);
  v20 = (UInt8 *)index(v18, 0);
  if (v14)
  {
    v21 = -[__CFString hasPrefix:](v12, "hasPrefix:", CFSTR("x-"));
    if (v21)
      v14 -= 2;
    if (v14 >= 1)
    {
      v22.location = v21 ? 2 : 0;
      v22.length = v14;
      if (v14 == MFStringGetBytes(v12, v22, 0x600u, 0, 0, v20, (CFIndex)&v18[v17 + ~(unint64_t)v20], 0))
      {
        *v20 = __toupper((char)*v20);
        v20 += v14;
      }
    }
  }
  v23 = v20;
  if (v16)
  {
    v24 = -[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("x-"));
    v25 = v24 ? v16 - 2 : v16;
    v23 = v20;
    if (v25 >= 1)
    {
      v26.location = v24 ? 2 : 0;
      v26.length = v25;
      Bytes = MFStringGetBytes(v13, v26, 0x600u, 0, 0, v20, (CFIndex)&v18[v17 + ~(unint64_t)v20], 0);
      v23 = v20;
      if (v25 == Bytes)
      {
        *v20 = __toupper((char)*v20);
        v23 = &v20[v25];
      }
    }
  }
  *v23 = 0;
  for (i = index(v18, 45); i; i = index(i + 1, 45))
    *i = 95;
  v29 = -[MFMimePart _selectorForCString:](self, "_selectorForCString:", v18);
  v30 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v39), CFSTR("__MIME_PART_DECODE_DOWNLOAD"));
  objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9), CFSTR("__MIME_PART_DECODE_AS_HTML"));
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4), CFSTR("__MIME_PART_DECODE_OFFSET"));
  v31 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("__MIME_PART_COLLECT_DECODED_MESSAGE_BODY"));
  objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("__MIME_PART_COLLECT_DECODED_MESSAGE_BODY"));
  if (v29 && (objc_opt_respondsToSelector() & 1) != 0
    || *v20
    && (*v20 = 0, (v32 = -[MFMimePart _selectorForCString:](self, "_selectorForCString:", v18)) != 0)
    && (v29 = v32, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v33 = (id)-[MFMimePart performSelector:](self, "performSelector:", v29);
  }
  else
  {
    v33 = 0;
  }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v30, "removeObjectForKey:", CFSTR("__MIME_PART_DECODE_OFFSET"));
  if (a5)
  {
    v34 = (void *)objc_msgSend(v30, "objectForKey:", CFSTR("__MIME_PART_DECODE_RESULT_OFFSET"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *a5 = objc_msgSend(v34, "unsignedIntValue");
    objc_msgSend(v30, "removeObjectForKey:", CFSTR("__MIME_PART_DECODE_RESULT_OFFSET"));
  }
  if (v37)
  {
    v35 = (void *)objc_msgSend(v30, "objectForKey:", CFSTR("__MIME_PART_RESULT_IS_COMPLETE"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *v37 = objc_msgSend(v35, "BOOLValue");
    objc_msgSend(v30, "removeObjectForKey:", CFSTR("__MIME_PART_RESULT_IS_COMPLETE"));
  }
  v36 = objc_msgSend(v30, "objectForKey:", CFSTR("__MIME_PART_DECODED_MESSAGE_BODY"));
  if (v36)
  {
    -[MFMimePart _setRFC822DecodedMessageBody:](self, "_setRFC822DecodedMessageBody:", v36);
    objc_msgSend(v30, "removeObjectForKey:", CFSTR("__MIME_PART_DECODED_MESSAGE_BODY"));
  }
  if (v31)
  {
    objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("__MIME_PART_COLLECT_DECODED_MESSAGE_BODY"));

  }
  else
  {
    objc_msgSend(v30, "removeObjectForKey:", CFSTR("__MIME_PART_COLLECT_DECODED_MESSAGE_BODY"));
  }
  if (v18 != (char *)v42)
    free(v18);
  if (v33
    || !-[MFMimePart _shouldContinueDecodingProcess](self, "_shouldContinueDecodingProcess")
    || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("multipart")))
  {
    if (!a3)
      return;
    goto LABEL_55;
  }
  if (a3)
  {
    v33 = -[MFMimePart copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:](self, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:", a4, a5, v39, v37);
LABEL_55:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (id)objc_msgSend(objc_allocWithZone((Class)MFMessageFileWrapper), "initRegularFileWithContents:", v33);
      -[MFMimePart configureFileWrapper:](self, "configureFileWrapper:", v33);
    }
    *a3 = v33;
    return;
  }
  if (v37)
    *v37 = -[MFMimePart _hasCompleteBodyDataToOffset:](self, "_hasCompleteBodyDataToOffset:", a4);
}

- (SEL)_selectorForCString:(char *)a3
{
  NSString *v4;

  if (_selectorForCString__onceToken != -1)
    dispatch_once(&_selectorForCString__onceToken, &__block_literal_global_8);
  v4 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  if (objc_msgSend((id)_selectorForCString__allowedMethodNames, "containsObject:", v4))
    return NSSelectorFromString(v4);
  else
    return 0;
}

void *__51__MFMimePart_DecodingSupport___selectorForCString___block_invoke()
{
  void *result;

  result = &unk_1E5AAC3D8;
  _selectorForCString__allowedMethodNames = (uint64_t)result;
  return result;
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  void *v8;

  v8 = 0;
  -[MFMimePart _contents:toOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](self, "_contents:toOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", &v8, a3, a4, a5, a6, a7);
  return v8;
}

- (BOOL)hasContents
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message"), "messageStore"), "hasCompleteDataForMimePart:", self);
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6
{
  return -[MFMimePart contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:](self, "contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, a5, a6, 0);
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  return -[MFMimePart contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:asHTML:](self, "contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:asHTML:", a3, a4, a5, 1);
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return -[MFMimePart contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:](self, "contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:", a3, a4, 1);
}

- (id)contentsForTextSystemForcingDownload:(BOOL)a3
{
  return -[MFMimePart contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:](self, "contentsForTextSystemToOffset:resultOffset:downloadIfNecessary:", 0x7FFFFFFFFFFFFFFFLL, 0, a3);
}

- (id)contentsForTextSystem
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary"), "objectForKeyedSubscript:", CFSTR("__MIME_PART_DECODE_DOWNLOAD"));
  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;
  return -[MFMimePart contentsForTextSystemForcingDownload:](self, "contentsForTextSystemForcingDownload:", v4);
}

- (id)bodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return -[MFMimePart copyBodyDataToOffset:resultOffset:downloadIfNecessary:](self, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:", a3, a4, 1);
}

- (id)bodyData
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary"), "objectForKeyedSubscript:", CFSTR("__MIME_PART_DECODE_DOWNLOAD"));
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  return -[MFMimePart bodyDataForcingDownload:](self, "bodyDataForcingDownload:", objc_msgSend(v3, "BOOLValue"));
}

- (void)decodeIfNecessary
{
  NSString *v3;
  NSString *v4;

  if (!-[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0))
  {
    if ((v3 = -[MFMimePart type](self, "type"),
          v4 = -[MFMimePart subtype](self, "subtype"),
          -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("multipart")))
      && -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("signed"))
      || !objc_msgSend(CFSTR("application"), "mf_caseInsensitiveCompareExcludingXDash:", v3)
      && !objc_msgSend(CFSTR("pkcs7-mime"), "mf_caseInsensitiveCompareExcludingXDash:", v4))
    {
      -[MFMimePart contentsForTextSystem](self, "contentsForTextSystem");
    }
  }
}

- (id)decodeApplicationZip
{
  return 0;
}

- (id)decodeApplicationOctet_stream
{
  return 0;
}

- (id)decodeMultipartRelated
{
  void *v2;
  void *v3;

  -[MFMimePart firstChildPart](self, "firstChildPart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsForTextSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)decodeMultipartAlternative
{
  void *v2;
  void *v3;

  -[MFMimePart chosenAlternativePart](self, "chosenAlternativePart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsForTextSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)decodeMultipart
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  unint64_t v24;
  char v25;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = _MFOffsetFromThreadDictionary(v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("__MIME_PART_DECODE_AS_HTML"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__MIME_PART_DECODE_DOWNLOAD"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__MIME_PART_DECODE_DOWNLOAD"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v10 = 1;
  }
  -[MFMimePart firstChildPart](self, "firstChildPart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  if (v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = 1;
    while (1)
    {
      v15 = (void *)MEMORY[0x1AF433BF4]();
      v25 = 0;
      if (v5)
      {
        v24 = 0;
        objc_msgSend(v11, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", v5, &v24, v10, v7, &v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v5 - v24;
        if (v5 < v24)
          v17 = 0;
        if (v5 != 0x7FFFFFFFFFFFFFFFLL)
          v5 = v17;
        v12 = (v12 + v24);
        if (v13)
          goto LABEL_12;
      }
      else if (objc_msgSend(v11, "isAttachment"))
      {
        objc_msgSend(v11, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", 0x7FFFFFFFFFFFFFFFLL, 0, v10, 1, &v25);
        v5 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_12;
      }
      else
      {
        v24 = 0;
        objc_msgSend(v11, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", 1, &v24, v10, v7, &v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        v18 = v24;
        if (!v16)
          v18 = 0;
        v12 = (v18 + v12);
        if (v13)
        {
LABEL_12:
          if (v16)
            goto LABEL_21;
          goto LABEL_25;
        }
      }
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v16)
      {
LABEL_21:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v13, "addObjectsFromArray:", v16);
        else
          objc_msgSend(v13, "addObject:", v16);
        v14 &= v25 != 0;
      }
LABEL_25:

      objc_autoreleasePoolPop(v15);
      objc_msgSend(v11, "nextSiblingPart");
      v19 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v19;
      if (!v19)
        goto LABEL_28;
    }
  }
  v13 = 0;
  v12 = 0;
  v14 = 1;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14 & 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v20, CFSTR("__MIME_PART_RESULT_IS_COMPLETE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v21, CFSTR("__MIME_PART_DECODE_RESULT_OFFSET"));

  return v13;
}

- (void)_ensureBodyDataToOffset:(NSObject *)a3 resultOffset:downloadIfNecessary:isComplete:decoded:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_2(&dword_1ABB13000, a3, (uint64_t)a3, "Detected possible race, retrying once", a1);
}

- (void)_ensureBodyDataToOffset:(uint64_t)a3 resultOffset:downloadIfNecessary:isComplete:decoded:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_2(&dword_1ABB13000, a1, a3, "#Attachments FIXME: Blocking call requested on the main thread", v3);
}

@end

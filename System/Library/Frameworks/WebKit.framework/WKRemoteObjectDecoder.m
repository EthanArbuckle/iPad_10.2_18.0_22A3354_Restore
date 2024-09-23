@implementation WKRemoteObjectDecoder

- (WKRemoteObjectDecoder)initWithInterface:(id)a3 rootObjectDictionary:(const void *)a4 replyToSelector:(SEL)a5
{
  WKRemoteObjectDecoder *v8;
  WKRemoteObjectDecoder *v9;
  uint64_t rootDictionary;
  const WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WKRemoteObjectDecoder;
  v8 = -[WKRemoteObjectDecoder init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    WTF::RetainPtr<NSURLSession>::operator=((const void **)&v8->_interface.m_ptr, a3);
    v9->_rootDictionary = a4;
    v9->_currentDictionary = a4;
    v9->_replyToSelector = a5;
    rootDictionary = (uint64_t)v9->_rootDictionary;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v9->_objectStream = API::Dictionary::get<API::Array>(rootDictionary, &v15, v11);
    v13 = v15;
    v15 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v12);
      else
        *(_DWORD *)v13 -= 2;
    }
  }
  return v9;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  int v6;
  char v7;
  void *v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = *a3;
  if (v6 > 80)
  {
    switch(*a3)
    {
      case 'c':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        v7 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "charValue");
        goto LABEL_15;
      case 'd':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "doubleValue");
        *(_QWORD *)a4 = v12;
        goto LABEL_28;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_17;
      case 'f':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "floatValue");
        *(_DWORD *)a4 = v13;
        goto LABEL_28;
      case 'i':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        v11 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "intValue");
        goto LABEL_21;
      case 'l':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "longValue");
        goto LABEL_27;
      case 'q':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "longLongValue");
        goto LABEL_27;
      case 's':
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        v10 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "shortValue");
        goto LABEL_25;
      default:
        if (v6 == 81)
        {
          v15[0] = objc_opt_class();
          WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
          v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedLongLongValue");
          goto LABEL_27;
        }
        if (v6 != 83)
          goto LABEL_17;
        v15[0] = objc_opt_class();
        WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
        v10 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedShortValue");
LABEL_25:
        *(_WORD *)a4 = v10;
        break;
    }
    goto LABEL_28;
  }
  if (v6 > 72)
  {
    if (v6 == 73)
    {
      v15[0] = objc_opt_class();
      WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
      v11 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedIntValue");
LABEL_21:
      *(_DWORD *)a4 = v11;
      goto LABEL_28;
    }
    if (v6 == 76)
    {
      v15[0] = objc_opt_class();
      WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
      v9 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedLongValue");
LABEL_27:
      *(_QWORD *)a4 = v9;
      goto LABEL_28;
    }
    goto LABEL_17;
  }
  if (v6 == 66)
  {
    v15[0] = objc_opt_class();
    WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
    v7 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "BOOLValue");
    goto LABEL_15;
  }
  if (v6 != 67)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("Unsupported type '%s'"), a3);
    return;
  }
  v15[0] = objc_opt_class();
  WTF::HashSet<void const*,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTableTraits>::HashSet(&v14, v15, 1);
  v7 = objc_msgSend((id)decodeObjectFromObjectStream(self, &v14), "unsignedCharValue");
LABEL_15:
  *(_BYTE *)a4 = v7;
LABEL_28:
  if (v14)
    WTF::fastFree((WTF *)(v14 - 16), v8);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  id v3;
  _QWORD *currentDictionary;
  WTF::StringImpl *v5;
  const WTF::StringImpl *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int i;
  int v13;
  WTF *v14;
  WTF::StringImpl *v16;

  v3 = a3;
  currentDictionary = self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 36)
    v3 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v3);
  MEMORY[0x19AEABCC8](&v16, v3);
  v7 = currentDictionary[2];
  v8 = v16;
  if (v7)
  {
    v9 = *(_DWORD *)(v7 - 8);
    v10 = *((_DWORD *)v16 + 4);
    if (v10 >= 0x100)
      v11 = v10 >> 8;
    else
      v11 = WTF::StringImpl::hashSlowCase(v16);
    for (i = 0; ; v11 = i + v13)
    {
      v13 = v11 & v9;
      v14 = *(WTF **)(v7 + 16 * (v11 & v9));
      if (!v14)
      {
        LOBYTE(v7) = 0;
        goto LABEL_13;
      }
      if (v14 != (WTF *)-1 && (WTF::equal(v14, v16, v6) & 1) != 0)
        break;
      ++i;
    }
    LOBYTE(v7) = 1;
LABEL_13:
    v8 = v16;
  }
  v16 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  return v7;
}

- (id)decodeObjectForKey:(id)a3
{
  return -[WKRemoteObjectDecoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", 0, a3);
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v3;
  const void *currentDictionary;
  const WTF::StringImpl *v5;
  CFTypeRef *v6;
  WTF::StringImpl *v7;
  CFTypeRef *v8;
  WTF::StringImpl *v9;
  BOOL v10;
  WTF::StringImpl *v12;

  v3 = a3;
  currentDictionary = self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 36)
    v3 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v3);
  MEMORY[0x19AEABCC8](&v12, v3);
  v6 = API::Dictionary::get<API::Boolean>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6)
    CFRetain(v6[1]);
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v7);
    else
      *(_DWORD *)v9 -= 2;
  }
  if (!v8)
    return 0;
  v10 = *((_BYTE *)v8 + 16) != 0;
  CFRelease(v8[1]);
  return v10;
}

- (int)decodeIntForKey:(id)a3
{
  id v3;
  const void *currentDictionary;
  const WTF::StringImpl *v5;
  CFTypeRef *v6;
  WTF::StringImpl *v7;
  CFTypeRef *v8;
  WTF::StringImpl *v9;
  int v10;
  WTF::StringImpl *v12;

  v3 = a3;
  currentDictionary = self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 36)
    v3 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v3);
  MEMORY[0x19AEABCC8](&v12, v3);
  v6 = API::Dictionary::get<API::UInt64>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6)
    CFRetain(v6[1]);
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8)
        goto LABEL_10;
      return 0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8)
    return 0;
LABEL_10:
  v10 = *((_DWORD *)v8 + 4);
  CFRelease(v8[1]);
  return v10;
}

- (int)decodeInt32ForKey:(id)a3
{
  id v3;
  const void *currentDictionary;
  const WTF::StringImpl *v5;
  CFTypeRef *v6;
  WTF::StringImpl *v7;
  CFTypeRef *v8;
  WTF::StringImpl *v9;
  int v10;
  WTF::StringImpl *v12;

  v3 = a3;
  currentDictionary = self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 36)
    v3 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v3);
  MEMORY[0x19AEABCC8](&v12, v3);
  v6 = API::Dictionary::get<API::UInt64>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6)
    CFRetain(v6[1]);
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8)
        goto LABEL_10;
      return 0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8)
    return 0;
LABEL_10:
  v10 = *((_DWORD *)v8 + 4);
  CFRelease(v8[1]);
  return v10;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v3;
  const void *currentDictionary;
  const WTF::StringImpl *v5;
  CFTypeRef *v6;
  WTF::StringImpl *v7;
  CFTypeRef *v8;
  WTF::StringImpl *v9;
  int64_t v10;
  WTF::StringImpl *v12;

  v3 = a3;
  currentDictionary = self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 36)
    v3 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v3);
  MEMORY[0x19AEABCC8](&v12, v3);
  v6 = API::Dictionary::get<API::UInt64>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6)
    CFRetain(v6[1]);
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v7);
    else
      *(_DWORD *)v9 -= 2;
  }
  if (!v8)
    return 0;
  v10 = (int64_t)v8[2];
  CFRelease(v8[1]);
  return v10;
}

- (float)decodeFloatForKey:(id)a3
{
  id v3;
  const void *currentDictionary;
  const WTF::StringImpl *v5;
  CFTypeRef *v6;
  WTF::StringImpl *v7;
  CFTypeRef *v8;
  WTF::StringImpl *v9;
  float v10;
  WTF::StringImpl *v12;

  v3 = a3;
  currentDictionary = self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 36)
    v3 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v3);
  MEMORY[0x19AEABCC8](&v12, v3);
  v6 = API::Dictionary::get<API::Double>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6)
    CFRetain(v6[1]);
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8)
        goto LABEL_10;
      return 0.0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8)
    return 0.0;
LABEL_10:
  v10 = *((double *)v8 + 2);
  CFRelease(v8[1]);
  return v10;
}

- (double)decodeDoubleForKey:(id)a3
{
  id v3;
  const void *currentDictionary;
  const WTF::StringImpl *v5;
  CFTypeRef *v6;
  WTF::StringImpl *v7;
  CFTypeRef *v8;
  WTF::StringImpl *v9;
  double v10;
  WTF::StringImpl *v12;

  v3 = a3;
  currentDictionary = self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v3, "characterAtIndex:", 0) == 36)
    v3 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v3);
  MEMORY[0x19AEABCC8](&v12, v3);
  v6 = API::Dictionary::get<API::Double>((uint64_t)currentDictionary, &v12, v5);
  v8 = v6;
  if (v6)
    CFRetain(v6[1]);
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v7);
      if (v8)
        goto LABEL_10;
      return 0.0;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (!v8)
    return 0.0;
LABEL_10:
  v10 = *((double *)v8 + 2);
  CFRelease(v8[1]);
  return v10;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  id v5;
  uint64_t *currentDictionary;
  const WTF::StringImpl *v7;
  WTF *v8;
  WTF::StringImpl *v9;
  WTF *v10;
  int v11;
  int v12;
  WTF::StringImpl *v13;
  const char *v14;
  unint64_t v15;
  WTF::StringImpl *v17;

  v5 = a3;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a3, "length") && objc_msgSend(v5, "characterAtIndex:", 0) == 36)
    v5 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v5);
  MEMORY[0x19AEABCC8](&v17, v5);
  v8 = WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(currentDictionary + 2, &v17, v7);
  v10 = v8;
  if (v8)
  {
    CFRetain(*((CFTypeRef *)v8 + 1));
    v11 = (*(uint64_t (**)(WTF *))(*(_QWORD *)v10 + 16))(v10);
    CFRelease(*((CFTypeRef *)v10 + 1));
    if (v11 == 8)
    {
      CFRetain(*((CFTypeRef *)v10 + 1));
      v12 = 0;
      goto LABEL_9;
    }
    v10 = 0;
  }
  v12 = 1;
LABEL_9:
  v13 = v17;
  v17 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
    {
      WTF::StringImpl::destroy(v13, v9);
      if (v12)
        goto LABEL_13;
      goto LABEL_15;
    }
    *(_DWORD *)v13 -= 2;
  }
  if (v12)
  {
LABEL_13:
    v14 = 0;
    *a4 = 0;
    return v14;
  }
LABEL_15:
  v15 = *((_QWORD *)v10 + 3);
  if (v15)
    v14 = (const char *)*((_QWORD *)v10 + 2);
  else
    v14 = 0;
  *a4 = v15;
  CFRelease(*((CFTypeRef *)v10 + 1));
  return v14;
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t *currentDictionary;
  const WTF::StringImpl *v11;
  WTF *v12;
  WTF::StringImpl *v13;
  CFTypeRef *v14;
  int v15;
  char v16;
  WTF::StringImpl *v17;
  void *v18;
  CFTypeRef v19;
  WTF::StringImpl *v21[3];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(a3);
        v22 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        WTF::HashTable<void const*,void const*,WTF::IdentityExtractor,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<void const*>>::add(&v27, &v22, (uint64_t)v21);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(a4, "characterAtIndex:", 0) == 36)
    a4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", a4);
  MEMORY[0x19AEABCC8](v21, a4);
  v12 = WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(currentDictionary + 2, v21, v11);
  v14 = (CFTypeRef *)v12;
  if (v12)
  {
    CFRetain(*((CFTypeRef *)v12 + 1));
    v15 = (*((uint64_t (**)(CFTypeRef *))*v14 + 2))(v14);
    CFRelease(v14[1]);
    if (v15 == 9)
    {
      CFRetain(v14[1]);
      v16 = 0;
      goto LABEL_14;
    }
    v14 = 0;
  }
  v16 = 1;
LABEL_14:
  v17 = v21[0];
  v21[0] = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v13);
    else
      *(_DWORD *)v17 -= 2;
  }
  v19 = decodeObject(self, v14, &v27);
  if ((v16 & 1) == 0)
    CFRelease(v14[1]);
  if (v27)
    WTF::fastFree((WTF *)(v27 - 16), v18);
  return (id)v19;
}

- (id)allowedClasses
{
  id v3;
  _QWORD **allowedClasses;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  if (!self->_allowedClasses)
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  allowedClasses = (_QWORD **)self->_allowedClasses;
  v5 = WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin(allowedClasses);
  v6 = v5;
  v8 = v7;
  if (*allowedClasses)
    v9 = (uint64_t)&(*allowedClasses)[*((unsigned int *)*allowedClasses - 1)];
  else
    v9 = 0;
  if ((_QWORD *)v9 != v5)
  {
    do
    {
      objc_msgSend(v3, "addObject:", *v6);
      while (++v6 != v8)
      {
        if ((unint64_t)(*v6 + 1) > 1)
          goto LABEL_12;
      }
      v6 = v8;
LABEL_12:
      ;
    }
    while (v6 != (_QWORD *)v9);
  }
  return (id)(id)CFMakeCollectable(v3);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_interface.m_ptr;
  self->_interface.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

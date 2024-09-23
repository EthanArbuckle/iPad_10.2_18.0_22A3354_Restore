@implementation WKRemoteObjectEncoder

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v4;
  uint64_t *currentDictionary;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WebKit *v11;
  WebKit *v12;
  WTF::StringImpl *v13;
  _BYTE v14[24];

  v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 36)
    v4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v4);
  MEMORY[0x19AEABCC8](&v13, v4);
  createEncodedObject(&v11, self, (NSError *)a3);
  v12 = v11;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v13, (uint64_t *)&v12, (uint64_t)v14);
  v9 = (uint64_t)v12;
  v12 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  v10 = v13;
  v13 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)rootObjectDictionary
{
  return self->_rootDictionary.m_ptr;
}

- (WKRemoteObjectEncoder)init
{
  WKRemoteObjectEncoder *v2;
  WebKit *v3;
  Dictionary *m_ptr;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKRemoteObjectEncoder;
  v2 = -[WKRemoteObjectEncoder init](&v6, sel_init);
  if (v2)
  {
    v3 = (WebKit *)API::Object::newObject(0x18uLL, 9);
    *(_QWORD *)v3 = off_1E34CC2A8;
    WebKit::InitializeWebKit2(v3);
    *(_QWORD *)v3 = &off_1E34CC280;
    *((_QWORD *)v3 + 2) = 0;
    m_ptr = v2->_rootDictionary.m_ptr;
    v2->_rootDictionary.m_ptr = (Dictionary *)v3;
    if (m_ptr)
    {
      CFRelease(*((CFTypeRef *)m_ptr + 1));
      v3 = (WebKit *)v2->_rootDictionary.m_ptr;
    }
    v2->_currentDictionary = v3;
  }
  return v2;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  m_tableForLLDB **m_table;
  Dictionary *m_ptr;

  m_table = self->_objectsBeingEncoded.m_impl.var0.m_table;
  if (m_table)
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  m_ptr = self->_rootDictionary.m_ptr;
  self->_rootDictionary.m_ptr = 0;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  double v4;
  int v6;
  uint64_t v7;
  objc_object *v8;

  v6 = *a3;
  if (v6 <= 82)
  {
    switch(*a3)
    {
      case '@':
        v8 = *(objc_object **)a4;
        goto LABEL_5;
      case 'A':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        goto LABEL_16;
      case 'B':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)a4);
        goto LABEL_4;
      case 'C':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)a4);
        goto LABEL_4;
      case 'I':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)a4);
        goto LABEL_4;
      default:
        if (v6 == 76)
        {
          v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)a4);
          goto LABEL_4;
        }
        if (v6 == 81)
        {
          v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)a4);
          goto LABEL_4;
        }
LABEL_16:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported type '%s'"), a3);
        break;
    }
  }
  else
  {
    switch(*a3)
    {
      case 'c':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *(char *)a4);
        break;
      case 'd':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)a4);
        break;
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
        goto LABEL_16;
      case 'f':
        LODWORD(v4) = *(_DWORD *)a4;
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
        break;
      case 'i':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)a4);
        break;
      case 'l':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)a4);
        break;
      case 'q':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)a4);
        break;
      case 's':
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)a4);
        break;
      default:
        if (v6 != 83)
          goto LABEL_16;
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)a4);
        break;
    }
LABEL_4:
    v8 = (objc_object *)v7;
LABEL_5:
    encodeToObjectStream((objc_object *)self, v8);
  }
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v5;
  uint64_t *currentDictionary;
  WebKit *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  WebKit *v12;
  WTF::StringImpl *v13;
  WebKit *v14;
  WebKit *v15;
  WTF::StringImpl *v16;
  _BYTE v17[24];

  v5 = a5;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a5, "length") && objc_msgSend(v5, "characterAtIndex:", 0) == 36)
    v5 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v5);
  MEMORY[0x19AEABCC8](&v16, v5);
  API::Data::create((WTF *)a4, a3, &v14);
  v9 = v14;
  v14 = 0;
  v15 = v9;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v16, (uint64_t *)&v15, (uint64_t)v17);
  v11 = (uint64_t)v15;
  v15 = 0;
  if (v11)
    CFRelease(*(CFTypeRef *)(v11 + 8));
  v12 = v14;
  v14 = 0;
  if (v12)
    CFRelease(*((CFTypeRef *)v12 + 1));
  v13 = v16;
  v16 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v10);
    else
      *(_DWORD *)v13 -= 2;
  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  id v4;
  uint64_t *currentDictionary;
  WebKit *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WebKit *v11;
  WTF::StringImpl *v12;
  char v13[24];

  v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 36)
    v4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v4);
  MEMORY[0x19AEABCC8](&v12, v4);
  v7 = (WebKit *)API::Object::newObject(0x18uLL, 32);
  *((_BYTE *)v7 + 16) = a3;
  *(_QWORD *)v7 = off_1E34CC2A8;
  WebKit::InitializeWebKit2(v7);
  *(_QWORD *)v7 = &off_1E34AD258;
  v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  v9 = (uint64_t)v11;
  v11 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  id v4;
  uint64_t *currentDictionary;
  WebKit *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WebKit *v10;
  WTF::StringImpl *v11;
  WebKit *v12;
  WebKit *v13;
  WTF::StringImpl *v14;
  _BYTE v15[24];

  v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 36)
    v4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v4);
  MEMORY[0x19AEABCC8](&v14, v4);
  API::UInt64::create((API::UInt64 *)a3, &v12);
  v7 = v12;
  v12 = 0;
  v13 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v14, (uint64_t *)&v13, (uint64_t)v15);
  v9 = (uint64_t)v13;
  v13 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  v10 = v12;
  v12 = 0;
  if (v10)
    CFRelease(*((CFTypeRef *)v10 + 1));
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v8);
    else
      *(_DWORD *)v11 -= 2;
  }
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  id v4;
  uint64_t *currentDictionary;
  WebKit *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WebKit *v11;
  WTF::StringImpl *v12;
  char v13[24];

  v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 36)
    v4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v4);
  MEMORY[0x19AEABCC8](&v12, v4);
  v7 = (WebKit *)API::Object::newObject(0x18uLL, 34);
  *((_QWORD *)v7 + 2) = a3;
  *(_QWORD *)v7 = off_1E34CC2A8;
  WebKit::InitializeWebKit2(v7);
  *(_QWORD *)v7 = &off_1E34AD280;
  v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  v9 = (uint64_t)v11;
  v11 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v4;
  uint64_t *currentDictionary;
  WebKit *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WebKit *v11;
  WTF::StringImpl *v12;
  char v13[24];

  v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 36)
    v4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v4);
  MEMORY[0x19AEABCC8](&v12, v4);
  v7 = (WebKit *)API::Object::newObject(0x18uLL, 34);
  *((_QWORD *)v7 + 2) = a3;
  *(_QWORD *)v7 = off_1E34CC2A8;
  WebKit::InitializeWebKit2(v7);
  *(_QWORD *)v7 = &off_1E34AD280;
  v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  v9 = (uint64_t)v11;
  v11 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v4;
  uint64_t *currentDictionary;
  double *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  double *v11;
  WTF::StringImpl *v12;
  _BYTE v13[24];

  v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 36)
    v4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v4);
  MEMORY[0x19AEABCC8](&v12, v4);
  v7 = (double *)API::Object::newObject(0x18uLL, 33);
  v7[2] = a3;
  *(_QWORD *)v7 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v7);
  *(_QWORD *)v7 = &off_1E34AE778;
  v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  v9 = (uint64_t)v11;
  v11 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v4;
  uint64_t *currentDictionary;
  double *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  double *v11;
  WTF::StringImpl *v12;
  _BYTE v13[24];

  v4 = a4;
  currentDictionary = (uint64_t *)self->_currentDictionary;
  if (objc_msgSend(a4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 36)
    v4 = (id)objc_msgSend(CFSTR("$"), "stringByAppendingString:", v4);
  MEMORY[0x19AEABCC8](&v12, v4);
  v7 = (double *)API::Object::newObject(0x18uLL, 33);
  v7[2] = a3;
  *(_QWORD *)v7 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v7);
  *(_QWORD *)v7 = &off_1E34AE778;
  v11 = v7;
  WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>(currentDictionary + 2, &v12, (uint64_t *)&v11, (uint64_t)v13);
  v9 = (uint64_t)v11;
  v11 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

@end

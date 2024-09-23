@implementation _WKResourceLoadInfo

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  objc_super v7;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(WTF::StringImpl **)self[2]._info.data.__lx;
    *(_QWORD *)self[2]._info.data.__lx = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v4);
      else
        *(_DWORD *)v5 -= 2;
    }
    v6 = *(WTF::StringImpl **)&self[1]._info.data.__lx[16];
    *(_QWORD *)&self[1]._info.data.__lx[16] = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy(v6, v4);
      else
        *(_DWORD *)v6 -= 2;
    }
    v7.receiver = self;
    v7.super_class = (Class)_WKResourceLoadInfo;
    -[_WKResourceLoadInfo dealloc](&v7, sel_dealloc);
  }
}

- (unint64_t)resourceLoadID
{
  return *(_QWORD *)&self->_info.data.__lx[16];
}

- (_WKFrameHandle)frame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  _WKFrameHandle *v6;

  if (!self->_info.data.__lx[40])
    return 0;
  v3 = *(_QWORD *)&self->_info.data.__lx[24];
  v2 = *(_QWORD *)&self->_info.data.__lx[32];
  v4 = API::Object::newObject(0x28uLL, 11);
  *(_QWORD *)v4 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v4);
  *(_QWORD *)v4 = &off_1E34AD1B8;
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  *(_BYTE *)(v4 + 32) = 0;
  v5 = *(const void **)(v4 + 8);
  if (v5)
    CFRetain(*(CFTypeRef *)(v4 + 8));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  return v6;
}

- (_WKFrameHandle)parentFrame
{
  uint64_t v2;
  Class isa;
  uint64_t v4;
  const void *v5;
  _WKFrameHandle *v6;

  if (!self[1]._info.data.__lx[8])
    return 0;
  isa = self[1].super.isa;
  v2 = *(_QWORD *)self[1]._info.data.__lx;
  v4 = API::Object::newObject(0x28uLL, 11);
  *(_QWORD *)v4 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v4);
  *(_QWORD *)v4 = &off_1E34AD1B8;
  *(_QWORD *)(v4 + 16) = isa;
  *(_QWORD *)(v4 + 24) = v2;
  *(_BYTE *)(v4 + 32) = 0;
  v5 = *(const void **)(v4 + 8);
  if (v5)
    CFRetain(*(CFTypeRef *)(v4 + 8));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  return v6;
}

- (NSURL)originalURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (NSString)originalHTTPMethod
{
  if (*(_QWORD *)self[2]._info.data.__lx)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSDate)eventTimestamp
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", *(double *)&self[2]._info.data.__lx[8]);
}

- (BOOL)loadedFromCache
{
  return self[2]._info.data.__lx[16];
}

- (int64_t)resourceType
{
  unint64_t v2;

  v2 = (char)self[2]._info.data.__lx[17];
  if (v2 > 0xE)
    return -1;
  else
    return qword_1978CF960[v2];
}

- (Object)_apiObject
{
  return (Object *)&self->_info;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKResourceLoadInfo)initWithCoder:(id)a3
{
  _WKResourceLoadInfo *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  uint64_t v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  _BYTE v29[32];
  __int128 v30;
  char v31;
  WTF::StringImpl *v32[5];
  WTF::StringImpl *v33;
  uint64_t v34;
  __int16 v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)_WKResourceLoadInfo;
  v4 = -[_WKResourceLoadInfo init](&v36, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceLoadID"));
    if (!v5)
      goto LABEL_11;
    v6 = (void *)v5;
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frame"));
    if (!v7)
      goto LABEL_11;
    v8 = v7;
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentFrame"));
    v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalURL"));
    if (!v10)
      goto LABEL_11;
    v11 = v10;
    v12 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalHTTPMethod"));
    if (!v12)
      goto LABEL_11;
    v13 = v12;
    v14 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventTimestamp"));
    if (v14
      && (v15 = (void *)v14,
          (v16 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loadedFromCache"))) != 0)
      && (v17 = (void *)v16,
          (v18 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"))) != 0))
    {
      v19 = (void *)v18;
      *(_QWORD *)v29 = objc_msgSend(v6, "unsignedLongLongValue");
      *(_OWORD *)&v29[8] = *(_OWORD *)(v8 + 24);
      v20 = 1;
      v29[24] = 1;
      if (v9)
      {
        v30 = *(_OWORD *)(v9 + 24);
      }
      else
      {
        v20 = 0;
        LOBYTE(v30) = 0;
      }
      v31 = v20;
      MEMORY[0x19AEABB18](v32, v11);
      MEMORY[0x19AEABCC8](&v33, v13);
      objc_msgSend(v15, "timeIntervalSince1970");
      v34 = v22;
      LOBYTE(v35) = objc_msgSend(v17, "BOOLValue");
      HIBYTE(v35) = objc_msgSend(v19, "unsignedCharValue");
      v23 = -[_WKResourceLoadInfo _apiObject](v4, "_apiObject");
      *(_QWORD *)v23 = off_1E34CC2A8;
      WebKit::InitializeWebKit2((WebKit *)v23);
      *(_QWORD *)v23 = &off_1E34C3710;
      *(_OWORD *)(v23 + 16) = *(_OWORD *)v29;
      *(_OWORD *)(v23 + 32) = *(_OWORD *)&v29[16];
      *(_OWORD *)(v23 + 48) = v30;
      *(_BYTE *)(v23 + 64) = v31;
      WTF::URL::URL(v23 + 72, (uint64_t *)v32);
      v25 = v33;
      v33 = 0;
      v26 = v34;
      *(_QWORD *)(v23 + 112) = v25;
      *(_QWORD *)(v23 + 120) = v26;
      *(_WORD *)(v23 + 128) = v35;
      *(_QWORD *)(v23 + 8) = v4;
      v27 = v33;
      v33 = 0;
      if (v27)
      {
        if (*(_DWORD *)v27 == 2)
          WTF::StringImpl::destroy(v27, v24);
        else
          *(_DWORD *)v27 -= 2;
      }
      v28 = v32[0];
      v32[0] = 0;
      if (v28)
      {
        if (*(_DWORD *)v28 == 2)
          WTF::StringImpl::destroy(v28, v24);
        else
          *(_DWORD *)v28 -= 2;
      }
    }
    else
    {
LABEL_11:

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_WKResourceLoadInfo resourceLoadID](self, "resourceLoadID")), CFSTR("resourceLoadID"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo frame](self, "frame"), CFSTR("frame"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo parentFrame](self, "parentFrame"), CFSTR("parentFrame"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo originalURL](self, "originalURL"), CFSTR("originalURL"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo originalHTTPMethod](self, "originalHTTPMethod"), CFSTR("originalHTTPMethod"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKResourceLoadInfo eventTimestamp](self, "eventTimestamp"), CFSTR("eventTimestamp"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_WKResourceLoadInfo loadedFromCache](self, "loadedFromCache")), CFSTR("loadedFromCache"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self[2]._info.data.__lx[17]), CFSTR("type"));
}

@end

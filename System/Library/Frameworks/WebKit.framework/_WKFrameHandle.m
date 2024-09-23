@implementation _WKFrameHandle

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKFrameHandle;
    -[_WKFrameHandle dealloc](&v4, sel_dealloc);
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  return *(_QWORD *)&self->_frameHandle.data.__lx[16] == *((_QWORD *)a3 + 3)
      && *(_QWORD *)&self->_frameHandle.data.__lx[24] == *((_QWORD *)a3 + 4);
}

- (unint64_t)hash
{
  return *(_QWORD *)&self->_frameHandle.data.__lx[16];
}

- (unint64_t)frameID
{
  return *(_QWORD *)&self->_frameHandle.data.__lx[16];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKFrameHandle)initWithCoder:(id)a3
{
  _WKFrameHandle *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_WKFrameHandle;
  v4 = -[_WKFrameHandle init](&v11, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameID"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processID")),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = objc_msgSend(v5, "unsignedLongLongValue");
      v8 = objc_msgSend(v6, "unsignedLongLongValue");
      v9 = -[_WKFrameHandle _apiObject](v4, "_apiObject");
      *(_QWORD *)v9 = off_1E34CC2A8;
      WebKit::InitializeWebKit2((WebKit *)v9);
      *(_QWORD *)(v9 + 16) = v7;
      *(_QWORD *)(v9 + 24) = v8;
      *(_BYTE *)(v9 + 32) = 0;
      *(_QWORD *)v9 = &off_1E34AD1B8;
      *(_QWORD *)(v9 + 8) = v4;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&self->_frameHandle.data.__lx[16]), CFSTR("frameID"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&self->_frameHandle.data.__lx[24]), CFSTR("processID"));
}

- (Object)_apiObject
{
  return (Object *)&self->_frameHandle;
}

@end

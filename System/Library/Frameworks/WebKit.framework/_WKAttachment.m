@implementation _WKAttachment

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::Attachment::~Attachment((API::Attachment *)&self->_attachment, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKAttachment;
    -[_WKAttachment dealloc](&v5, sel_dealloc);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_attachment;
}

- (_WKAttachmentInfo)info
{
  uint64_t v2;

  v2 = *(_QWORD *)self[1]._attachment.data.__lx;
  if (v2 && *(_QWORD *)(v2 + 8))
    return (_WKAttachmentInfo *)(id)CFMakeCollectable(-[_WKAttachmentInfo initWithAttachment:]([_WKAttachmentInfo alloc], "initWithAttachment:", &self->_attachment));
  else
    return 0;
}

- (void)requestInfo:(id)a3
{
  (*((void (**)(id, _WKAttachmentInfo *, _QWORD))a3 + 2))(a3, -[_WKAttachment info](self, "info"), 0);
}

- (void)setFileWrapper:(id)a3 contentType:(id)a4 completion:(id)a5
{
  uint64_t v6;
  WTF::StringImpl *v10;
  WTF::StringImpl **p_attachment;
  WTF::StringImpl *v12;
  void *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;

  v6 = *(_QWORD *)self[1]._attachment.data.__lx;
  if (v6 && *(_QWORD *)(v6 + 8))
  {
    v16 = 0;
    WTF::String::operator=((WTF::StringImpl **)&self->_attachment.data.__lx[40], (WTF::StringImpl *)&v16);
    p_attachment = (WTF::StringImpl **)&self->_attachment;
    v12 = v16;
    v16 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v10);
      else
        *(_DWORD *)v12 -= 2;
    }
    API::Attachment::setFileWrapperAndUpdateContentType(p_attachment, (NSFileWrapper *)a3, (__CFString *)a4);
    v13 = _Block_copy(a5);
    v14 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v14 = off_1E34C08F8;
    *((_QWORD *)v14 + 1) = v13;
    v16 = v14;
    API::Attachment::updateAttributes((API::Attachment *)p_attachment, (uint64_t *)&v16);
    v15 = v16;
    v16 = 0;
    if (v15)
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v15 + 8))(v15);
    _Block_release(0);
  }
  else if (a5)
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 2, 0));
  }
}

- (void)setData:(id)a3 newContentType:(id)a4
{
  const void *v6;

  v6 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", a3);
  -[_WKAttachment setFileWrapper:contentType:completion:](self, "setFileWrapper:contentType:completion:", v6, a4, 0);
  if (v6)
    CFRelease(v6);
}

- (void)setData:(id)a3 newContentType:(id)a4 newFilename:(id)a5 completion:(id)a6
{
  void *v10;
  const void *v11;

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", a3);
  v11 = v10;
  if (a5)
    objc_msgSend(v10, "setPreferredFilename:", a5);
  -[_WKAttachment setFileWrapper:contentType:completion:](self, "setFileWrapper:contentType:completion:", v11, a4, a6);
  if (v11)
    CFRelease(v11);
}

- (NSString)uniqueIdentifier
{
  if (*(_QWORD *)&self->_attachment.data.__lx[32])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p id='%@'>"), objc_opt_class(), self, -[_WKAttachment uniqueIdentifier](self, "uniqueIdentifier"));
}

- (BOOL)isConnected
{
  return self[1]._attachment.data.__lx[8] == 1;
}

- (uint64_t)setFileWrapper:(uint64_t)a1 contentType:completion:
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (uint64_t)setFileWrapper:(const void *)a1 contentType:completion:
{
  void *v2;

  *a1 = off_1E34C08F8;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

@end

@implementation _WKAttachmentInfo

- (_WKAttachmentInfo)initWithAttachment:(const void *)a3
{
  _WKAttachmentInfo *v4;
  Attachment *m_ptr;
  const __CFString *v6;
  const void **p_m_ptr;
  const void *v8;
  WTF::StringImpl *v9;
  const __CFString *v10;
  const void **v11;
  const void *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  const __CFString *v15;
  const void **v16;
  const void *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_WKAttachmentInfo;
  v4 = -[_WKAttachmentInfo init](&v21, sel_init);
  if (!v4)
    return v4;
  CFRetain(*((CFTypeRef *)a3 + 1));
  m_ptr = v4->_attachment.m_ptr;
  v4->_attachment.m_ptr = (Attachment *)a3;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  if (*((_QWORD *)a3 + 5))
  {
    v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    p_m_ptr = (const void **)&v4->_filePath.m_ptr;
    if (!v6)
      goto LABEL_7;
  }
  else
  {
    p_m_ptr = (const void **)&v4->_filePath.m_ptr;
    v6 = &stru_1E351F1B8;
  }
  CFRetain(v6);
LABEL_7:
  v8 = *p_m_ptr;
  *p_m_ptr = v6;
  if (v8)
    CFRelease(v8);
  API::Attachment::mimeType((API::Attachment *)a3, &v20);
  if (v20)
  {
    v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v11 = (const void **)&v4->_mimeType.m_ptr;
    if (!v10)
      goto LABEL_12;
  }
  else
  {
    v11 = (const void **)&v4->_mimeType.m_ptr;
    v10 = &stru_1E351F1B8;
  }
  CFRetain(v10);
LABEL_12:
  v12 = *v11;
  *v11 = v10;
  if (v12)
    CFRelease(v12);
  v13 = v20;
  v20 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v9);
    else
      *(_DWORD *)v13 -= 2;
  }
  API::Attachment::utiType((API::Attachment *)a3, &v20);
  if (!v20)
  {
    v16 = (const void **)&v4->_utiType.m_ptr;
    v15 = &stru_1E351F1B8;
    goto LABEL_20;
  }
  v15 = (const __CFString *)WTF::StringImpl::operator NSString *();
  v16 = (const void **)&v4->_utiType.m_ptr;
  if (v15)
LABEL_20:
    CFRetain(v15);
  v17 = *v16;
  *v16 = v15;
  if (v17)
    CFRelease(v17);
  v18 = v20;
  v20 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v14);
    else
      *(_DWORD *)v18 -= 2;
  }
  return v4;
}

- (NSData)data
{
  Attachment *m_ptr;
  _QWORD *v3;
  _QWORD *v5;
  NSData *v6;

  v6 = 0;
  m_ptr = self->_attachment.m_ptr;
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v3 = off_1E34C0880;
  v3[1] = &v6;
  v5 = v3;
  API::Attachment::doWithFileWrapper((uint64_t)m_ptr, &v5);
  (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  return v6;
}

- (NSString)name
{
  Attachment *m_ptr;
  _QWORD *v3;
  _QWORD *v5;
  NSString *v6;

  v6 = 0;
  m_ptr = self->_attachment.m_ptr;
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v3 = off_1E34C08A8;
  v3[1] = &v6;
  v5 = v3;
  API::Attachment::doWithFileWrapper((uint64_t)m_ptr, &v5);
  (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  return v6;
}

- (NSString)filePath
{
  return (NSString *)self->_filePath.m_ptr;
}

- (NSFileWrapper)fileWrapper
{
  Attachment *m_ptr;
  _QWORD *v3;
  _QWORD *v5;
  NSFileWrapper *v6;

  v6 = 0;
  m_ptr = self->_attachment.m_ptr;
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v3 = off_1E34C08D0;
  v3[1] = &v6;
  v5 = v3;
  API::Attachment::doWithFileWrapper((uint64_t)m_ptr, &v5);
  (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  return v6;
}

- (NSString)contentType
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(self->_mimeType.m_ptr, "length");
  v4 = 16;
  if (!v3)
    v4 = 24;
  return *(NSString **)((char *)&self->super.isa + v4);
}

- (BOOL)shouldPreserveFidelity
{
  return *((_BYTE *)self->_attachment.m_ptr + 65) == 2;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  Attachment *v6;

  m_ptr = self->_filePath.m_ptr;
  self->_filePath.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_utiType.m_ptr;
  self->_utiType.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_mimeType.m_ptr;
  self->_mimeType.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_attachment.m_ptr;
  self->_attachment.m_ptr = 0;
  if (v6)
    CFRelease(*((CFTypeRef *)v6 + 1));
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (uint64_t)data
{
  uint64_t result;

  if (objc_msgSend(a2, "isRegularFile"))
    result = objc_msgSend(a2, "regularFileContents");
  else
    result = 0;
  **(_QWORD **)(a1 + 8) = result;
  return result;
}

- (uint64_t)name
{
  uint64_t result;

  if (objc_msgSend((id)objc_msgSend(a2, "filename"), "length"))
    result = objc_msgSend(a2, "filename");
  else
    result = objc_msgSend(a2, "preferredFilename");
  **(_QWORD **)(a1 + 8) = result;
  return result;
}

- (uint64_t)fileWrapper
{
  **(_QWORD **)(result + 8) = a2;
  return result;
}

@end

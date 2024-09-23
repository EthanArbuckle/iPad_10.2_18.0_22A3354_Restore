@implementation _WKSystemPreviewDataTaskDelegate

- (_WKSystemPreviewDataTaskDelegate)initWithSystemPreviewController:(void *)a3
{
  _WKSystemPreviewDataTaskDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKSystemPreviewDataTaskDelegate;
  result = -[_WKSystemPreviewDataTaskDelegate init](&v5, sel_init);
  if (result)
  {
    result->_previewController = a3;
    result->_fileHandle = -1;
  }
  return result;
}

- (BOOL)isValidMIMEType:(id)a3
{
  const WTF::String *v4;
  WTF::StringImpl *v5;
  char v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  if ((WebCore::MIMETypeRegistry::isUSDMIMEType((WebCore::MIMETypeRegistry *)&v9, v4) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(a3, "isEqualToString:", CFSTR("application/octet-stream"));
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
  return v6;
}

- (BOOL)isValidFileExtension:(id)a3
{
  const WTF::String *v3;
  WTF::StringImpl *v4;
  char isUSDMIMEType;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  MEMORY[0x19AEABCC8](&v9, a3);
  WebCore::MIMETypeRegistry::mimeTypeForExtension();
  isUSDMIMEType = WebCore::MIMETypeRegistry::isUSDMIMEType((WebCore::MIMETypeRegistry *)&v10, v3);
  v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v4);
    else
      *(_DWORD *)v7 -= 2;
  }
  return isUSDMIMEType;
}

- (void)dataTask:(id)a3 didReceiveResponse:(id)a4 decisionHandler:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *m_ptr;
  void *previewController;
  NSObject *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  __int128 v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  NSObject *v22;
  WTF::StringImpl *v23;
  int v24;
  _BYTE buf[24];
  __int128 v26;
  uint8_t v27[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(MEMORY[0x1E0C92C18], "isErrorStatusCode:", objc_msgSend(a4, "statusCode")))
  {
    v8 = qword_1ECE71938;
    if (os_log_type_enabled((os_log_t)qword_1ECE71938, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = objc_msgSend(a4, "statusCode");
      _os_log_impl(&dword_196BCC000, v8, OS_LOG_TYPE_DEFAULT, "cancelling subresource load due to error status code: %ld", buf, 0xCu);
    }
LABEL_28:
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    WebKit::SystemPreviewController::loadFailed((WebKit::SystemPreviewController *)self->_previewController);
    return;
  }
  if (!-[_WKSystemPreviewDataTaskDelegate isValidMIMEType:](self, "isValidMIMEType:", objc_msgSend(a4, "MIMEType"))
    && !-[_WKSystemPreviewDataTaskDelegate isValidFileExtension:](self, "isValidFileExtension:", objc_msgSend((id)objc_msgSend(a4, "URL"), "pathExtension")))
  {
    v22 = qword_1ECE71938;
    if (os_log_type_enabled((os_log_t)qword_1ECE71938, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = objc_msgSend(a4, "MIMEType");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = objc_msgSend((id)objc_msgSend(a4, "URL"), "pathExtension");
      _os_log_impl(&dword_196BCC000, v22, OS_LOG_TYPE_DEFAULT, "cancelling subresource load due to unhandled MIME type: \"%@\" extension: \"%@\", buf, 0x16u);
    }
    goto LABEL_28;
  }
  v9 = objc_msgSend(a4, "expectedContentLength");
  if (v9 == -1)
    v10 = 0;
  else
    v10 = v9;
  self->_expectedContentLength = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", self->_expectedContentLength);
  m_ptr = self->_data.m_ptr;
  self->_data.m_ptr = v11;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_msgSend((id)objc_msgSend(a4, "MIMEType"), "isEqualToString:", CFSTR("model/vnd.reality"));
  WTF::FileSystemImpl::openTemporaryFile();
  WTF::String::operator=((WTF::StringImpl **)&self->_filePath, (WTF::StringImpl *)&v23);
  self->_fileHandle = v24;
  previewController = self->_previewController;
  WTF::URL::fileURLWithFileSystemPath();
  v14 = qword_1ECE71938;
  if (os_log_type_enabled((os_log_t)qword_1ECE71938, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *((_QWORD *)previewController + 12);
    *(_DWORD *)v27 = 134217984;
    v28 = v15;
    _os_log_impl(&dword_196BCC000, v14, OS_LOG_TYPE_DEFAULT, "SystemPreview load has started on %lld", v27, 0xCu);
  }
  WTF::String::operator=((WTF::StringImpl **)previewController + 23, (WTF::StringImpl *)buf);
  v17 = v26;
  *((_OWORD *)previewController + 12) = *(_OWORD *)&buf[8];
  *((_OWORD *)previewController + 13) = v17;
  v18 = *((_QWORD *)previewController + 28);
  if (v18 && *(_DWORD *)(v18 + 4))
    WTF::URL::setFragmentIdentifier();
  *((_BYTE *)previewController + 8) = 2;
  v19 = *(WTF::StringImpl **)buf;
  *(_QWORD *)buf = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v16);
    else
      *(_DWORD *)v19 -= 2;
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  v21 = v23;
  v23 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy(v21, v20);
    else
      *(_DWORD *)v21 -= 2;
  }
}

- (void)dataTask:(id)a3 didReceiveData:(id)a4
{
  _QWORD *previewController;
  unint64_t v6;
  double v7;
  void *v8;

  objc_msgSend(self->_data.m_ptr, "appendData:", a4);
  if (self->_expectedContentLength)
  {
    previewController = self->_previewController;
    v6 = objc_msgSend(self->_data.m_ptr, "length");
    v8 = (void *)previewController[31];
    if (v8)
    {
      *(float *)&v7 = (float)v6 / (float)self->_expectedContentLength;
      objc_msgSend(v8, "setProgress:", v7);
    }
  }
}

- (void)dataTask:(id)a3 didCompleteWithError:(id)a4
{
  if (a4)
  {
    WTF::FileSystemImpl::closeFile((WTF::FileSystemImpl *)&self->_fileHandle, (int *)a2);
    WebKit::SystemPreviewController::loadFailed((WebKit::SystemPreviewController *)self->_previewController);
  }
  else
  {
    -[_WKSystemPreviewDataTaskDelegate completeLoad](self, "completeLoad", a3);
  }
}

- (void)completeLoad
{
  int *p_fileHandle;
  void *m_ptr;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _QWORD *previewController;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _DWORD *v12;
  __int128 v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  _BYTE buf[24];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_fileHandle = &self->_fileHandle;
  m_ptr = self->_data.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(self->_data.m_ptr, "bytes");
    objc_msgSend(m_ptr, "length");
  }
  v5 = WTF::FileSystemImpl::writeToFile();
  WTF::FileSystemImpl::closeFile((WTF::FileSystemImpl *)p_fileHandle, v6);
  v7 = objc_msgSend(self->_data.m_ptr, "length");
  previewController = self->_previewController;
  if (v5 == v7)
  {
    WTF::URL::fileURLWithFileSystemPath();
    v9 = qword_1ECE71938;
    if (os_log_type_enabled((os_log_t)qword_1ECE71938, OS_LOG_TYPE_DEFAULT))
    {
      v10 = previewController[12];
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_196BCC000, v9, OS_LOG_TYPE_DEFAULT, "SystemPreview load has finished on %lld", buf, 0xCu);
    }
    v11 = (void *)previewController[31];
    if (v11)
    {
      v12 = (_DWORD *)previewController[23];
      if (v12)
        *v12 += 2;
      *(_QWORD *)buf = v12;
      v13 = *((_OWORD *)previewController + 13);
      *(_OWORD *)&buf[8] = *((_OWORD *)previewController + 12);
      v20 = v13;
      objc_msgSend(v11, "finish:", buf);
      v15 = *(WTF::StringImpl **)buf;
      *(_QWORD *)buf = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2)
          WTF::StringImpl::destroy(v15, v14);
        else
          *(_DWORD *)v15 -= 2;
      }
    }
    *((_BYTE *)previewController + 8) = 3;
    WebKit::SystemPreviewController::releaseActivityTokenIfNecessary((WebKit::ProcessThrottlerActivity *)previewController);
    v17 = previewController[34];
    if (v17)
    {
      previewController[34] = 0;
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v17 + 16))(v17, 1);
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    }
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v16);
      else
        *(_DWORD *)v18 -= 2;
    }
  }
  else
  {
    WebKit::SystemPreviewController::loadFailed((WebKit::SystemPreviewController *)self->_previewController);
  }
}

- (void).cxx_destruct
{
  StringImpl *m_ptr;
  void *v4;

  m_ptr = self->_filePath.m_impl.m_ptr;
  self->_filePath.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)m_ptr -= 2;
  }
  v4 = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end

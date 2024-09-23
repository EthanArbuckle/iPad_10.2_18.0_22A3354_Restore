@implementation _WKAuthenticatorResponse

- (_WKAuthenticatorResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensions:(void *)a5 attachment:(int64_t)a6
{
  _WKAuthenticatorResponse *v10;
  void *v11;
  void *m_ptr;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_WKAuthenticatorResponse;
  v10 = -[_WKAuthenticatorResponse init](&v14, sel_init);
  if (v10)
  {
    v10->_clientDataJSON = (NSData *)a3;
    v10->_rawId = (NSData *)a4;
    v11 = *(void **)a5;
    *(_QWORD *)a5 = 0;
    m_ptr = v10->_extensions.m_ptr;
    v10->_extensions.m_ptr = v11;
    if (m_ptr)
      CFRelease(m_ptr);
    v10->_attachment = a6;
  }
  return v10;
}

- (_WKAuthenticatorResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensionOutputsCBOR:(id)a5 attachment:(int64_t)a6
{
  _WKAuthenticatorResponse *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_WKAuthenticatorResponse;
  v10 = -[_WKAuthenticatorResponse init](&v12, sel_init);
  if (v10)
  {
    v10->_clientDataJSON = (NSData *)a3;
    v10->_rawId = (NSData *)a4;
    v10->_extensionOutputsCBOR = (NSData *)objc_msgSend(a5, "copy");
    v10->_attachment = a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKAuthenticatorResponse;
  -[_WKAuthenticatorResponse dealloc](&v3, sel_dealloc);
}

- (_WKAuthenticationExtensionsClientOutputs)extensions
{
  return (_WKAuthenticationExtensionsClientOutputs *)self->_extensions.m_ptr;
}

- (int64_t)attachment
{
  return self->_attachment;
}

- (NSData)clientDataJSON
{
  return self->_clientDataJSON;
}

- (NSData)rawId
{
  return self->_rawId;
}

- (NSData)extensionOutputsCBOR
{
  return self->_extensionOutputsCBOR;
}

- (void)setExtensionOutputsCBOR:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_extensions.m_ptr;
  self->_extensions.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

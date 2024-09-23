@implementation _WKWebAuthenticationAssertionResponse

- (void)dealloc
{
  objc_class *v3;
  _DWORD *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4 = *(_DWORD **)&self->_response.data.__lx[16];
    *(_QWORD *)&self->_response.data.__lx[16] = 0;
    if (v4)
    {
      if (v4[2] == 1)
        (*(void (**)(_DWORD *))(*(_QWORD *)v4 + 8))(v4);
      else
        --v4[2];
    }
    v5.receiver = self;
    v5.super_class = (Class)_WKWebAuthenticationAssertionResponse;
    -[_WKWebAuthenticationAssertionResponse dealloc](&v5, sel_dealloc);
  }
}

- (NSString)name
{
  if (*(_QWORD *)(*(_QWORD *)&self->_response.data.__lx[16] + 144))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSString)displayName
{
  if (*(_QWORD *)(*(_QWORD *)&self->_response.data.__lx[16] + 152))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSData)userHandle
{
  WebKit *v2;
  CFTypeRef v3;
  const void *v4;
  CFTypeRef *v6;

  API::WebAuthenticationAssertionResponse::userHandle((API::WebAuthenticationAssertionResponse *)&self->_response, (WebKit **)&v6);
  v2 = (WebKit *)v6;
  if (v6)
  {
    v3 = v6[1];
    if (v3)
    {
      CFRetain(v6[1]);
      v4 = (const void *)*((_QWORD *)v2 + 1);
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  return (NSData *)(id)CFMakeCollectable(v3);
}

- (BOOL)synchronizable
{
  return *(_BYTE *)(*(_QWORD *)&self->_response.data.__lx[16] + 168);
}

- (NSString)group
{
  if (*(_QWORD *)(*(_QWORD *)&self->_response.data.__lx[16] + 160))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSData)credentialID
{
  WebKit *v2;
  CFTypeRef v3;
  const void *v4;
  CFTypeRef *v6;

  API::WebAuthenticationAssertionResponse::credentialID((WebCore::AuthenticatorResponse **)&self->_response, (WebKit **)&v6);
  v2 = (WebKit *)v6;
  if (v6)
  {
    v3 = v6[1];
    if (v3)
    {
      CFRetain(v6[1]);
      v4 = (const void *)*((_QWORD *)v2 + 1);
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  return (NSData *)(id)CFMakeCollectable(v3);
}

- (NSString)accessGroup
{
  if (*(_QWORD *)(*(_QWORD *)&self->_response.data.__lx[16] + 208))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setLAContext:(id)a3
{
  WebCore::AuthenticatorAssertionResponse::setLAContext(*(WebCore::AuthenticatorAssertionResponse **)&self->_response.data.__lx[16], a3);
}

- (Object)_apiObject
{
  return (Object *)&self->_response;
}

@end

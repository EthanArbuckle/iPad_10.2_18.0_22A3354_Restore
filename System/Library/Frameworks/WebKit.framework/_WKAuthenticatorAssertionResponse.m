@implementation _WKAuthenticatorAssertionResponse

- (_WKAuthenticatorAssertionResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensions:(void *)a5 authenticatorData:(id)a6 signature:(id)a7 userHandle:(id)a8 attachment:(int64_t)a9
{
  _WKAuthenticatorAssertionResponse *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_WKAuthenticatorAssertionResponse;
  v12 = -[_WKAuthenticatorResponse initWithClientDataJSON:rawId:extensions:attachment:](&v14, sel_initWithClientDataJSON_rawId_extensions_attachment_, a3, a4, a5, a9);
  if (v12)
  {
    v12->_authenticatorData = (NSData *)a6;
    v12->_signature = (NSData *)a7;
    v12->_userHandle = (NSData *)a8;
  }
  return v12;
}

- (_WKAuthenticatorAssertionResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensionOutputsCBOR:(id)a5 authenticatorData:(id)a6 signature:(id)a7 userHandle:(id)a8 attachment:(int64_t)a9
{
  _WKAuthenticatorAssertionResponse *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_WKAuthenticatorAssertionResponse;
  v12 = -[_WKAuthenticatorResponse initWithClientDataJSON:rawId:extensionOutputsCBOR:attachment:](&v14, sel_initWithClientDataJSON_rawId_extensionOutputsCBOR_attachment_, a3, a4, a5, a9);
  if (v12)
  {
    v12->_authenticatorData = (NSData *)a6;
    v12->_signature = (NSData *)a7;
    v12->_userHandle = (NSData *)a8;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKAuthenticatorAssertionResponse;
  -[_WKAuthenticatorResponse dealloc](&v3, sel_dealloc);
}

- (NSData)authenticatorData
{
  return self->_authenticatorData;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)userHandle
{
  return self->_userHandle;
}

@end

@implementation _WKAuthenticatorAttestationResponse

- (_WKAuthenticatorAttestationResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensions:(void *)a5 attestationObject:(id)a6 attachment:(int64_t)a7 transports:(id)a8
{
  _WKAuthenticatorAttestationResponse *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_WKAuthenticatorAttestationResponse;
  v10 = -[_WKAuthenticatorResponse initWithClientDataJSON:rawId:extensions:attachment:](&v12, sel_initWithClientDataJSON_rawId_extensions_attachment_, a3, a4, a5, a7);
  if (v10)
  {
    v10->_attestationObject = (NSData *)a6;
    v10->_transports = (NSArray *)objc_msgSend(a8, "copy");
  }
  return v10;
}

- (_WKAuthenticatorAttestationResponse)initWithClientDataJSON:(id)a3 rawId:(id)a4 extensionOutputsCBOR:(id)a5 attestationObject:(id)a6 attachment:(int64_t)a7 transports:(id)a8
{
  _WKAuthenticatorAttestationResponse *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_WKAuthenticatorAttestationResponse;
  v10 = -[_WKAuthenticatorResponse initWithClientDataJSON:rawId:extensionOutputsCBOR:attachment:](&v12, sel_initWithClientDataJSON_rawId_extensionOutputsCBOR_attachment_, a3, a4, a5, a7);
  if (v10)
  {
    v10->_attestationObject = (NSData *)a6;
    v10->_transports = (NSArray *)objc_msgSend(a8, "copy");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKAuthenticatorAttestationResponse;
  -[_WKAuthenticatorResponse dealloc](&v3, sel_dealloc);
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (NSArray)transports
{
  return self->_transports;
}

- (void)setTransports:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end

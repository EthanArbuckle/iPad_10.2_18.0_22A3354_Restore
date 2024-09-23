@implementation MCMClientCodeSignInfo

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isSigned
{
  return self->_isSigned;
}

- (BOOL)cached
{
  return self->_cached;
}

- (BOOL)isSignatureValid
{
  return self->_isSignatureValid;
}

- (BOOL)isPlatformBinary
{
  return self->_isPlatformBinary;
}

- (MCMEntitlements)entitlements
{
  return self->_entitlements;
}

- (id)clientCodeSignInfoByChangingCached:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[MCMClientCodeSignInfo copy](self, "copy");
  v4[8] = a3;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_entitlements);
    objc_storeStrong((id *)(v5 + 24), self->_identifier);
    *(_BYTE *)(v5 + 8) = self->_cached;
    *(_BYTE *)(v5 + 9) = self->_isSigned;
    *(_BYTE *)(v5 + 10) = self->_isSignatureValid;
    *(_BYTE *)(v5 + 11) = self->_isPlatformBinary;
    objc_storeStrong((id *)(v5 + 32), self->_teamIdentifier);
  }
  return (id)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdhash, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
}

- (MCMClientCodeSignInfo)initWithCDHash:(id)a3 entitlements:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 status:(unint64_t)a7
{
  char v7;
  id v13;
  id v14;
  id v15;
  id v16;
  MCMClientCodeSignInfo *v17;
  MCMClientCodeSignInfo *v18;
  objc_super v20;
  uint64_t v21;

  v7 = a7;
  v21 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MCMClientCodeSignInfo;
  v17 = -[MCMClientCodeSignInfo init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_isSigned = v7 & 1;
    v17->_isSignatureValid = (v7 & 2) != 0;
    v17->_isPlatformBinary = (v7 & 4) != 0;
    objc_storeStrong((id *)&v17->_cdhash, a3);
    objc_storeStrong((id *)&v18->_entitlements, a4);
    objc_storeStrong((id *)&v18->_identifier, a5);
    objc_storeStrong((id *)&v18->_teamIdentifier, a6);
    v18->_cached = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_cdhash, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (BOOL)isEqualToClientCodeSignInfo:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  if (-[NSData isEqualToData:](self->_cdhash, "isEqualToData:", v4[5]))
    v5 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4[3]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MCMClientCodeSignInfo isEqualToClientCodeSignInfo:](self, "isEqualToClientCodeSignInfo:", v4);

  return v5;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSData)cdhash
{
  return self->_cdhash;
}

@end

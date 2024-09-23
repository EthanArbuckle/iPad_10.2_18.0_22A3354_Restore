@implementation IDSURI

+ (IDSURI)URIWithPrefixedURI:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(v5, v6, (uint64_t)v4, v7, 0);

  return (IDSURI *)v8;
}

+ (IDSURI)URIWithPrefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v11 = (void *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(v8, v9, (uint64_t)v7, v10, v6);

  return (IDSURI *)v11;
}

+ (IDSURI)URIWithUnprefixedURI:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithUnprefixedURI_withServiceLoggingHint_(v5, v6, (uint64_t)v4, v7, 0);

  return (IDSURI *)v8;
}

+ (IDSURI)URIWithUnprefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v11 = (void *)objc_msgSend_initWithUnprefixedURI_withServiceLoggingHint_(v8, v9, (uint64_t)v7, v10, v6);

  return (IDSURI *)v11;
}

- (IDSURI)initWithPrefixedURI:(id)a3
{
  double v3;

  return (IDSURI *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(self, a2, (uint64_t)a3, v3, 0);
}

- (IDSURI)initWithPrefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6;
  id v7;
  IDSURI *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSString *v12;
  IDSURI *v13;
  NSString *prefixedURI;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16.receiver = self;
    v16.super_class = (Class)IDSURI;
    v8 = -[IDSURI init](&v16, sel_init);
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = (NSString *)objc_msgSend_copy(v6, v9, v10, v11);
      else
        v12 = (NSString *)v6;
      prefixedURI = v8->_prefixedURI;
      v8->_prefixedURI = v12;

      objc_storeStrong((id *)&v8->_serviceLoggingHint, a4);
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (IDSURI)initWithUnprefixedURI:(id)a3
{
  double v3;

  return (IDSURI *)objc_msgSend_initWithUnprefixedURI_withServiceLoggingHint_(self, a2, (uint64_t)a3, v3, 0);
}

- (IDSURI)initWithUnprefixedURI:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  IDSURI *v22;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC8274]();
  v24 = 0;
  v11 = (id)objc_msgSend__stripPotentialTokenURIWithToken_(v6, v9, (uint64_t)&v24, v10);
  if (!v24)
  {
    objc_msgSend__stripFZIDPrefix(v6, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__bestGuessURI(v15, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v19;
  }
  objc_autoreleasePoolPop(v8);
  v22 = (IDSURI *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(self, v20, (uint64_t)v6, v21, 0);

  return v22;
}

- (id)URIByAddingPushToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  char isTokenURI;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;

  v4 = a3;
  isTokenURI = objc_msgSend_isTokenURI(self, v5, v6, v7);
  v12 = 0;
  if (v4 && (isTokenURI & 1) == 0)
  {
    objc_msgSend_rawToken(v4, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)_IDSCopyIDForTokenWithURI(v13, self->_prefixedURI);
    objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v15, (uint64_t)v14, v16, self->_serviceLoggingHint);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)URIByAddingOptionalPushToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  int isTokenURI;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  IDSURI *v16;

  v4 = a3;
  isTokenURI = objc_msgSend_isTokenURI(self, v5, v6, v7);
  if (!v4 || isTokenURI)
  {
    v16 = self;
  }
  else
  {
    objc_msgSend_rawToken(v4, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_IDSCopyIDForTokenWithURI(v12, self->_prefixedURI);
    objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v14, (uint64_t)v13, v15, self->_serviceLoggingHint);
    v16 = (IDSURI *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (NSString)unprefixedURI
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_prefixedURI(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__stripFZIDPrefix(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)IDSIDType
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  int64_t v7;

  objc_msgSend_prefixedURI(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _IDSTypeForID(v4, v5, v6);

  return v7;
}

- (int64_t)FZIDType
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  int64_t v8;

  objc_msgSend_prefixedURI(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend__FZIDType(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isTokenURI
{
  uint64_t v2;
  double v3;
  uint64_t v4;

  v4 = objc_msgSend_IDSIDType(self, a2, v2, v3);
  return ((unint64_t)(v4 + 1) < 0xD) & (0x1698u >> (v4 + 1));
}

- (IDSURI)tokenFreeURI
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  IDSURI *v14;

  if ((objc_msgSend_isTokenURI(self, a2, v2, v3) & 1) != 0)
  {
    objc_msgSend_prefixedURI(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__stripPotentialTokenURIWithToken_(v8, v9, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v12, (uint64_t)v11, v13, self->_serviceLoggingHint);
    v14 = (IDSURI *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = self;
  }
  return v14;
}

- (IDSPushToken)pushToken
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  id v17;

  if (!objc_msgSend_isTokenURI(self, a2, v2, v3))
    return (IDSPushToken *)0;
  objc_msgSend_prefixedURI(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = (id)objc_msgSend__stripPotentialTokenURIWithToken_(v8, v9, (uint64_t)&v17, v10);
  v12 = v17;

  objc_msgSend_pushTokenWithData_withServiceLoggingHint_(IDSPushToken, v13, (uint64_t)v12, v14, self->_serviceLoggingHint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSPushToken *)v15;
}

- (BOOL)isTemporaryURI
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;

  return objc_msgSend_IDSIDType(self, a2, v2, v3) == 6 || objc_msgSend_IDSIDType(self, v5, v6, v7) == 5;
}

- (BOOL)isEqualToURI:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  char isEqualToIgnoringCase;

  if (self == a3)
    return 1;
  objc_msgSend_prefixedURI(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefixedURI(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v5, v10, (uint64_t)v9, v11);

  return isEqualToIgnoringCase;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToURI;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToURI = objc_msgSend_isEqualToURI_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToURI = 0;

  return isEqualToURI;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  objc_msgSend_prefixedURI(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  IDSLoggableDescriptionForHandleOnService(self->_prefixedURI, self->_serviceLoggingHint);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p; %@>"), v7, v4, self, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  int64_t v15;

  v4 = a3;
  objc_msgSend_prefixedURI(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefixedURI(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_compare_(v8, v13, (uint64_t)v12, v14);
  return v15;
}

- (id)destinationURIs
{
  uint64_t v2;
  double v3;
  void *v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_prefixedURI(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithObject_(v4, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSURI)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  IDSURI *v15;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("prefixedURI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("serviceHint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (IDSURI *)objc_msgSend_initWithPrefixedURI_withServiceLoggingHint_(self, v13, (uint64_t)v8, v14, v12);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  objc_msgSend_prefixedURI(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("prefixedURI"));

  objc_msgSend_serviceLoggingHint(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, CFSTR("serviceHint"));

}

- (NSString)prefixedURI
{
  return self->_prefixedURI;
}

- (void)setPrefixedURI:(id)a3
{
  objc_storeStrong((id *)&self->_prefixedURI, a3);
}

- (NSString)serviceLoggingHint
{
  return self->_serviceLoggingHint;
}

- (void)setServiceLoggingHint:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLoggingHint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLoggingHint, 0);
  objc_storeStrong((id *)&self->_prefixedURI, 0);
}

@end

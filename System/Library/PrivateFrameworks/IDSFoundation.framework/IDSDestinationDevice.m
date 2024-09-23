@implementation IDSDestinationDevice

+ (BOOL)isDeviceURI:(id)a3
{
  double v3;

  return objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("guest-device:"), v3);
}

- (IDSDestinationDevice)initWithRapportPublicIdentifierURI:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  IDSURI *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  IDSDestinationDevice *v13;

  v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("guest-device:"), v6))
  {
    v7 = [IDSURI alloc];
    v10 = (void *)objc_msgSend_initWithPrefixedURI_(v7, v8, (uint64_t)v4, v9);
    self = (IDSDestinationDevice *)(id)objc_msgSend_initWithURI_isGuest_(self, v11, (uint64_t)v10, v12, 1);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (IDSDestinationDevice)initWithIDSDeviceURI:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  IDSURI *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  IDSDestinationDevice *v15;

  v4 = a3;
  if ((objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("device:"), v6) & 1) != 0
    || objc_msgSend_hasPrefix_(v4, v7, (uint64_t)CFSTR("self-token:"), v8))
  {
    v9 = [IDSURI alloc];
    v12 = (void *)objc_msgSend_initWithPrefixedURI_(v9, v10, (uint64_t)v4, v11);
    self = (IDSDestinationDevice *)(id)objc_msgSend_initWithURI_isGuest_(self, v13, (uint64_t)v12, v14, 0);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (IDSDestinationDevice)initWithDeviceURI:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  IDSDestinationDevice *v9;

  v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("guest-device:"), v6))
  {
    self = (IDSDestinationDevice *)(id)objc_msgSend_initWithRapportPublicIdentifierURI_(self, v7, (uint64_t)v4, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (IDSDestinationDevice)initWithURI:(id)a3 isGuest:(BOOL)a4
{
  id v7;
  IDSDestinationDevice *v8;
  IDSDestinationDevice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSDestinationDevice;
  v8 = -[IDSDestinationDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_destinationURI, a3);
    v9->_isGuest = a4;
  }

  return v9;
}

- (IDSDestinationDevice)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  IDSDestinationDevice *isGuest;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kURIKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("kIsGuestKey"), v10);

  isGuest = (IDSDestinationDevice *)objc_msgSend_initWithURI_isGuest_(self, v12, (uint64_t)v8, v13, v11);
  return isGuest;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t isGuest;
  const char *v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend_destinationURI(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v16, v8, (uint64_t)v7, v9, CFSTR("kURIKey"));

  isGuest = objc_msgSend_isGuest(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v16, v14, isGuest, v15, CFSTR("kIsGuestKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destinationURI(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isGuest(self, v10, v11, v12))
    objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@:%p uri: %@ isGuest: %@>"), v14, v5, self, v9, CFSTR("YES"));
  else
    objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@:%p uri: %@ isGuest: %@>"), v14, v5, self, v9, CFSTR("NO"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isDevice
{
  return 1;
}

- (id)destinationURIs
{
  uint64_t v2;
  double v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_destinationURI(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefixedURI(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithObject_(v4, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (IDSURI)destinationURI
{
  return self->_destinationURI;
}

- (void)setDestinationURI:(id)a3
{
  objc_storeStrong((id *)&self->_destinationURI, a3);
}

- (BOOL)isGuest
{
  return self->_isGuest;
}

- (void)setIsGuest:(BOOL)a3
{
  self->_isGuest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURI, 0);
}

@end

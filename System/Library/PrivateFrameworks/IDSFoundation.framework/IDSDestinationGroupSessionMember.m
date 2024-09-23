@implementation IDSDestinationGroupSessionMember

- (IDSDestinationGroupSessionMember)initWithURI:(id)a3 isLightWeight:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  IDSURI *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  IDSDestinationGroupSessionMember *isLightWeight;

  v4 = a4;
  v6 = a3;
  v7 = [IDSURI alloc];
  v10 = (void *)objc_msgSend_initWithPrefixedURI_(v7, v8, (uint64_t)v6, v9);

  isLightWeight = (IDSDestinationGroupSessionMember *)objc_msgSend_initWithURIObject_isLightWeight_(self, v11, (uint64_t)v10, v12, v4);
  return isLightWeight;
}

- (IDSDestinationGroupSessionMember)initWithURIObject:(id)a3 isLightWeight:(BOOL)a4
{
  id v7;
  IDSDestinationGroupSessionMember *v8;
  IDSDestinationGroupSessionMember *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSDestinationGroupSessionMember;
  v8 = -[IDSDestinationGroupSessionMember init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URIObject, a3);
    v9->_isLightWeight = a4;
  }

  return v9;
}

- (IDSDestinationGroupSessionMember)initWithURI:(id)a3
{
  double v3;

  return (IDSDestinationGroupSessionMember *)objc_msgSend_initWithURI_isLightWeight_(self, a2, (uint64_t)a3, v3, 0);
}

- (NSString)uri
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_URIObject(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefixedURI(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (IDSDestinationGroupSessionMember)initWithCoder:(id)a3
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
  IDSDestinationGroupSessionMember *isLightWeight;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kURIKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("kIsLightWeight"), v10);

  isLightWeight = (IDSDestinationGroupSessionMember *)objc_msgSend_initWithURIObject_isLightWeight_(self, v12, (uint64_t)v8, v13, v11);
  return isLightWeight;
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
  uint64_t isLightWeight;
  const char *v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend_URIObject(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v16, v8, (uint64_t)v7, v9, CFSTR("kURIKey"));

  isLightWeight = objc_msgSend_isLightWeight(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v16, v14, isLightWeight, v15, CFSTR("kIsLightWeight"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_uri(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isLightWeight(self, v7, v8, v9))
    objc_msgSend_stringWithFormat_(v5, v10, (uint64_t)CFSTR("<URI:%@ isLightweight: %@>"), v11, v6, CFSTR("YES"));
  else
    objc_msgSend_stringWithFormat_(v5, v10, (uint64_t)CFSTR("<URI:%@ isLightweight: %@>"), v11, v6, CFSTR("NO"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  double v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_uri(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithObject_(v4, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)destinationLightweightStatus
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  uint64_t isLightWeight;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  isLightWeight = objc_msgSend_isLightWeight(self, a2, v2, v3);
  objc_msgSend_numberWithBool_(v6, v8, isLightWeight, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uri(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObject_forKey_(v5, v15, (uint64_t)v10, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (IDSURI)URIObject
{
  return self->_URIObject;
}

- (BOOL)isLightWeight
{
  return self->_isLightWeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URIObject, 0);
}

@end

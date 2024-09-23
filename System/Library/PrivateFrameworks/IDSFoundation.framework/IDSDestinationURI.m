@implementation IDSDestinationURI

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSDestinationURI)initWithURI:(id)a3
{
  id v5;
  IDSDestinationURI *v6;
  IDSDestinationURI *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSDestinationURI;
  v6 = -[IDSDestinationURI init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uri, a3);

  return v7;
}

- (IDSDestinationURI)initWithURIString:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  IDSURI *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  IDSDestinationURI *v17;

  v4 = a3;
  v10 = v4;
  if ((objc_msgSend_containsString_(v4, v5, (uint64_t)CFSTR(":"), v6) & 1) == 0)
  {
    objc_msgSend__bestGuessURI(v4, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = [IDSURI alloc];
  v14 = (void *)objc_msgSend_initWithPrefixedURI_(v11, v12, (uint64_t)v10, v13);
  v17 = (IDSDestinationURI *)objc_msgSend_initWithURI_(self, v15, (uint64_t)v14, v16);

  return v17;
}

- (IDSDestinationURI)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  IDSDestinationURI *v19;

  v4 = a3;
  if (objc_msgSend_containsValueForKey_(v4, v5, (uint64_t)CFSTR("kIDSDestinationURIURIObject"), v6))
  {
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, v9, CFSTR("kIDSDestinationURIURIObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend_initWithURI_(self, v11, (uint64_t)v10, v12);
  }
  else
  {
    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, v16, CFSTR("kIDSDestinationURIURI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend_initWithURIString_(self, v17, (uint64_t)v10, v18);
  }
  v19 = v13;

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_uri(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, CFSTR("kIDSDestinationURIURIObject"));

}

- (id)destinationURIs
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;

  objc_msgSend_uri(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefixedURI(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v9, (uint64_t)v8, v11);
  else
    objc_msgSend_set(MEMORY[0x1E0C99E60], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)destinationLightweightStatus
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_uri(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefixedURI(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13 = v8;
    v14[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v14, v10, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_uri(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p uri: %@"), v10, v4, self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
}

@end

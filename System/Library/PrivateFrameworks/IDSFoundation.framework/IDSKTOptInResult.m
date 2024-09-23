@implementation IDSKTOptInResult

- (IDSKTOptInResult)init
{
  IDSKTOptInResult *v2;
  IDSKTOptInResult *v3;
  NSError *error;
  NSData *serverProvidedSMT;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSKTOptInResult;
  v2 = -[IDSKTOptInResult init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_success = 0;
    error = v2->_error;
    v2->_error = 0;

    serverProvidedSMT = v3->_serverProvidedSMT;
    v3->_serverProvidedSMT = 0;

  }
  return v3;
}

- (IDSKTOptInResult)initWithSuccess:(BOOL)a3 serverProvidedSMT:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  IDSKTOptInResult *v11;
  IDSKTOptInResult *v12;
  NSArray *v13;
  NSArray *optedInOutURIs;
  NSDictionary *v15;
  NSDictionary *serverSMTByURI;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IDSKTOptInResult;
  v11 = -[IDSKTOptInResult init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_success = a3;
    objc_storeStrong((id *)&v11->_serverProvidedSMT, a4);
    objc_storeStrong((id *)&v12->_error, a5);
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    optedInOutURIs = v12->_optedInOutURIs;
    v12->_optedInOutURIs = v13;

    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    serverSMTByURI = v12->_serverSMTByURI;
    v12->_serverSMTByURI = v15;

  }
  return v12;
}

- (IDSKTOptInResult)initWithSuccess:(BOOL)a3 optedInOutURIs:(id)a4 serverSMTByURI:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  IDSKTOptInResult *v13;
  IDSKTOptInResult *v14;
  NSArray *v15;
  NSArray *optedInOutURIs;
  NSDictionary *v17;
  NSDictionary *serverSMTByURI;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  NSData *serverProvidedSMT;
  objc_super v29;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IDSKTOptInResult;
  v13 = -[IDSKTOptInResult init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_success = a3;
    if (v10)
      v15 = (NSArray *)v10;
    else
      v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    optedInOutURIs = v14->_optedInOutURIs;
    v14->_optedInOutURIs = v15;

    if (v11)
      v17 = (NSDictionary *)v11;
    else
      v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    serverSMTByURI = v14->_serverSMTByURI;
    v14->_serverSMTByURI = v17;

    if (v14->_serverSMTByURI)
    {
      objc_msgSend_allValues(v14->_serverSMTByURI, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v22, v23, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      serverProvidedSMT = v14->_serverProvidedSMT;
      v14->_serverProvidedSMT = (NSData *)v26;

    }
    else
    {
      v14->_serverSMTByURI = 0;
    }
    objc_storeStrong((id *)&v14->_error, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTOptInResult)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  IDSKTOptInResult *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  NSError *error;
  uint64_t v13;
  const char *v14;
  double v15;
  uint64_t v16;
  NSData *serverProvidedSMT;
  uint64_t v18;
  const char *v19;
  double v20;
  uint64_t v21;
  NSArray *optedInOutURIs;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  double v26;
  uint64_t v27;
  NSDictionary *serverSMTByURI;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)IDSKTOptInResult;
  v6 = -[IDSKTOptInResult init](&v30, sel_init);
  if (v6)
  {
    v6->_success = objc_msgSend_decodeBoolForKey_(v4, v5, (uint64_t)CFSTR("Success"), v7);
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, v10, CFSTR("Error"));
    v11 = objc_claimAutoreleasedReturnValue();
    error = v6->_error;
    v6->_error = (NSError *)v11;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, CFSTR("SMT"));
    v16 = objc_claimAutoreleasedReturnValue();
    serverProvidedSMT = v6->_serverProvidedSMT;
    v6->_serverProvidedSMT = (NSData *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v19, v18, v20, CFSTR("OptInOutURIs"));
    v21 = objc_claimAutoreleasedReturnValue();
    optedInOutURIs = v6->_optedInOutURIs;
    v6->_optedInOutURIs = (NSArray *)v21;

    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(v4, v25, v23, v26, v24, CFSTR("ServerSMTsByURI"));
    v27 = objc_claimAutoreleasedReturnValue();
    serverSMTByURI = v6->_serverSMTByURI;
    v6->_serverSMTByURI = (NSDictionary *)v27;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 success;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  id v15;

  success = self->_success;
  v15 = a3;
  objc_msgSend_encodeBool_forKey_(v15, v5, success, v6, CFSTR("Success"));
  objc_msgSend_encodeObject_forKey_(v15, v7, (uint64_t)self->_error, v8, CFSTR("Error"));
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)self->_serverProvidedSMT, v10, CFSTR("SMT"));
  objc_msgSend_encodeObject_forKey_(v15, v11, (uint64_t)self->_optedInOutURIs, v12, CFSTR("OptInOutURIs"));
  objc_msgSend_encodeObject_forKey_(v15, v13, (uint64_t)self->_serverSMTByURI, v14, CFSTR("ServerSMTsByURI"));

}

- (id)description
{
  double v2;

  if (self->_success)
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<IDSKTOptInResult: %p, success: %@, error: %@, serverProvidedSMT: %@, optedInOutURIs: %@, serverSMTByURI: %@>"), v2, self, CFSTR("YES"), self->_error, self->_serverProvidedSMT, self->_optedInOutURIs, self->_serverSMTByURI);
  else
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<IDSKTOptInResult: %p, success: %@, error: %@, serverProvidedSMT: %@, optedInOutURIs: %@, serverSMTByURI: %@>"), v2, self, CFSTR("NO"), self->_error, self->_serverProvidedSMT, self->_optedInOutURIs, self->_serverSMTByURI);
}

- (BOOL)success
{
  return self->_success;
}

- (NSData)serverProvidedSMT
{
  return self->_serverProvidedSMT;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)optedInOutURIs
{
  return self->_optedInOutURIs;
}

- (NSDictionary)serverSMTByURI
{
  return self->_serverSMTByURI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSMTByURI, 0);
  objc_storeStrong((id *)&self->_optedInOutURIs, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serverProvidedSMT, 0);
}

@end

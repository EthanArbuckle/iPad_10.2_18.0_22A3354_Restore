@implementation APHTTPRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalHTTPHeaderFields, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_HTTPBody, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (APHTTPRequest)initWithURL:(id)a3 HTTPMethod:(int64_t)a4 HTTPHeaders:(id)a5 HTTPBody:(id)a6 serviceName:(id)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  APHTTPRequest *v22;
  uint64_t v23;
  NSUUID *identifier;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *internalHTTPHeaderFields;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id completionHandler;
  id v36;
  objc_super v37;

  v36 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v37.receiver = self;
  v37.super_class = (Class)APHTTPRequest;
  v22 = -[APHTTPRequest init](&v37, sel_init);
  if (v22)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v19, v20, v21);
    v23 = objc_claimAutoreleasedReturnValue();
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v23;

    objc_storeStrong((id *)&v22->_URL, a3);
    v22->_HTTPMethod = a4;
    if (v15)
    {
      v28 = objc_msgSend_mutableCopy(v15, v25, v26, v27);
    }
    else
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v25, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    internalHTTPHeaderFields = v22->_internalHTTPHeaderFields;
    v22->_internalHTTPHeaderFields = (NSMutableDictionary *)v28;

    objc_storeStrong((id *)&v22->_HTTPBody, a6);
    objc_storeStrong((id *)&v22->_serviceName, a7);
    v33 = objc_msgSend_copy(v18, v30, v31, v32);
    completionHandler = v22->_completionHandler;
    v22->_completionHandler = (id)v33;

  }
  return v22;
}

- (NSDictionary)allHTTPHeaderFields
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internalHTTPHeaderFields(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v4, v5, v6, v7);

  return (NSDictionary *)v8;
}

- (NSMutableDictionary)internalHTTPHeaderFields
{
  return self->_internalHTTPHeaderFields;
}

- (NSURL)URL
{
  return self->_URL;
}

- (int64_t)HTTPMethod
{
  return self->_HTTPMethod;
}

- (NSData)HTTPBody
{
  return self->_HTTPBody;
}

- (APHTTPRequest)initWithURL:(id)a3 HTTPMethod:(int64_t)a4 HTTPHeaders:(id)a5 HTTPBody:(id)a6 completionHandler:(id)a7
{
  return (APHTTPRequest *)objc_msgSend_initWithURL_HTTPMethod_HTTPHeaders_HTTPBody_serviceName_completionHandler_(self, a2, (uint64_t)a3, a4, a5, a6, 0, a7);
}

- (void)setRequestHeader:(id)a3 withValue:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char *v13;

  v13 = (char *)a4;
  v6 = a3;
  objc_msgSend_internalHTTPHeaderFields(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v13)
    objc_msgSend_setValue_forKey_(v10, v13, (uint64_t)v13, (uint64_t)v6);
  else
    objc_msgSend_removeObjectForKey_(v10, 0, (uint64_t)v6, v11);

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void)setHTTPMethod:(int64_t)a3
{
  self->_HTTPMethod = a3;
}

- (void)setHTTPBody:(id)a3
{
  objc_storeStrong((id *)&self->_HTTPBody, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setInternalHTTPHeaderFields:(id)a3
{
  objc_storeStrong((id *)&self->_internalHTTPHeaderFields, a3);
}

@end

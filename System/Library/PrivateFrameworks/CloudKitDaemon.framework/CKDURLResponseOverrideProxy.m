@implementation CKDURLResponseOverrideProxy

- (CKDURLResponseOverrideProxy)initWithResponse:(id)a3 overrides:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  const char *v15;
  NSDictionary *v16;
  NSDictionary *responseHeaderOverrides;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_realResponse, a3);
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("HTTPResponseStatusOverride"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v10)
    v14 = objc_msgSend_integerValue(v10, v11, v12);
  else
    v14 = objc_msgSend_statusCode(v7, v11, v12);
  self->_statusCode = v14;
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)CFSTR("HTTPResponseHeaderOverrides"));
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  responseHeaderOverrides = self->_responseHeaderOverrides;
  self->_responseHeaderOverrides = v16;

  return self;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (id)allHeaderFields
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_allHeaderFields(self->_realResponse, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_mutableCopy(v4, v5, v6);

  objc_msgSend_addEntriesFromDictionary_(v7, v8, (uint64_t)self->_responseHeaderOverrides);
  v11 = (void *)objc_msgSend_copy(v7, v9, v10);

  return v11;
}

- (id)valueForHTTPHeaderField:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  void *v7;

  v4 = a3;
  objc_msgSend_objectForKey_(self->_responseHeaderOverrides, v5, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_valueForHTTPHeaderField_(self->_realResponse, v6, (uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_realResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeaderOverrides, 0);
  objc_storeStrong((id *)&self->_realResponse, 0);
}

@end

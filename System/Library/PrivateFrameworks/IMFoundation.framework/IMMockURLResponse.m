@implementation IMMockURLResponse

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  id v24;

  v4 = a3;
  objc_msgSend_response(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("mockResponse"));

  objc_msgSend_data(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("mockData"));

  objc_msgSend_requestBodyKeyPath(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("requestBodyKeyPath"));

  objc_msgSend_mockID(self, v20, v21, v22);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v24, (uint64_t)CFSTR("mockID"));

}

- (IMMockURLResponse)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  IMMockURLResponse *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IMMockURLResponse;
  v7 = -[IMMockURLResponse init](&v27, sel_init);
  if (v7)
  {
    objc_msgSend_decodeObjectForKey_(v4, v5, (uint64_t)CFSTR("mockResponse"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setResponse_(v7, v9, (uint64_t)v8, v10);

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("mockData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setData_(v7, v14, (uint64_t)v13, v15);

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("requestBodyKeyPath"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestBodyKeyPath_(v7, v19, (uint64_t)v18, v20);

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("mockID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMockID_(v7, v24, (uint64_t)v23, v25);

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectFromPlist:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  void *v29;
  IMMockURLResponse *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v45;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("status"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend_intValue(v6, v7, v8, v9);

  objc_msgSend_objectForKey_(v3, v11, (uint64_t)CFSTR("headers"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v14, (uint64_t)CFSTR("requestBodyForKeyPath"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v17, (uint64_t)CFSTR("mockID"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend_objectForKey_(v3, v21, (uint64_t)CFSTR("url"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithString_(v20, v24, (uint64_t)v23, v25);

  v27 = objc_alloc(MEMORY[0x1E0CB3680]);
  v29 = (void *)objc_msgSend_initWithURL_statusCode_HTTPVersion_headerFields_(v27, v28, (uint64_t)v26, v10, CFSTR("http 1.1"), v13);
  v30 = objc_alloc_init(IMMockURLResponse);
  objc_msgSend_objectForKey_(v3, v31, (uint64_t)CFSTR("body"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v34, (uint64_t)v33, 100, 0, &v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    NSLog(CFSTR("%s error serializing data to plist DATA: %@"), "+[IMMockURLResponse objectFromPlist:]", v45);
  objc_msgSend_setData_(v30, v35, (uint64_t)v37, v36);
  objc_msgSend_setResponse_(v30, v38, (uint64_t)v29, v39);
  objc_msgSend_setRequestBodyKeyPath_(v30, v40, (uint64_t)v16, v41);
  objc_msgSend_setMockID_(v30, v42, (uint64_t)v19, v43);

  return v30;
}

- (NSHTTPURLResponse)response
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)requestBodyKeyPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequestBodyKeyPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)mockID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMockID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_requestBodyKeyPath, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end

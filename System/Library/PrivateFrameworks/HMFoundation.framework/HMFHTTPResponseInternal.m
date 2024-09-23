@implementation HMFHTTPResponseInternal

- (HMFHTTPResponseInternal)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFHTTPResponseInternal)initWithStatusCode:(int64_t)a3 headerFields:(id)a4 body:(id)a5 activity:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMFHTTPResponseInternal *v13;
  HMFHTTPResponseInternal *v14;
  uint64_t v15;
  NSDictionary *headerFields;
  uint64_t v17;
  NSData *body;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMFHTTPResponseInternal;
  v13 = -[HMFHTTPResponseInternal init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_statusCode = a3;
    v15 = objc_msgSend(v10, "copy");
    headerFields = v14->_headerFields;
    v14->_headerFields = (NSDictionary *)v15;

    v17 = objc_msgSend(v11, "copy");
    body = v14->_body;
    v14->_body = (NSData *)v17;

    objc_storeStrong((id *)&v14->_activity, a6);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStatusCode:headerFields:body:activity:", 0, MEMORY[0x1E0C9AA70], 0, 0);
  if (v5)
  {
    v5[2] = -[HMFHTTPResponseInternal statusCode](self, "statusCode");
    -[HMFHTTPResponseInternal headerFields](self, "headerFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[3];
    v5[3] = v7;

    -[HMFHTTPResponseInternal body](self, "body");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

  }
  return v5;
}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *headerFields;
  id v11;

  v11 = a3;
  v6 = a4;
  -[HMFHTTPResponseInternal headerFields](self, "headerFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v6)
  {
    if (v11)
      objc_msgSend(v8, "setObject:forKey:", v11, v6);
    else
      objc_msgSend(v8, "removeObjectForKey:", v6);
  }
  v9 = (NSDictionary *)objc_msgSend(v8, "copy");
  headerFields = self->_headerFields;
  self->_headerFields = v9;

}

- (HMFActivity)activity
{
  return self->_activity;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setHeaderFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end

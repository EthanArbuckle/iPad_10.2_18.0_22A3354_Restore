@implementation FACircleStateResponse

- (FACircleStateResponse)initWithLoadSuccess:(BOOL)a3 error:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  FACircleStateResponse *v11;
  FACircleStateResponse *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FACircleStateResponse;
  v11 = -[FACircleStateResponse init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_loadSuccess = a3;
    objc_storeStrong((id *)&v11->_error, a4);
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 loadSuccess;
  id v5;

  loadSuccess = self->_loadSuccess;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", loadSuccess, CFSTR("loadSuccess"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));

}

- (FACircleStateResponse)initWithCoder:(id)a3
{
  id v4;
  FACircleStateResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSError *error;
  uint64_t v14;
  NSDictionary *userInfo;

  v4 = a3;
  v5 = -[FACircleStateResponse init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_loadSuccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loadSuccess"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("error"));
    v12 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("userInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;

  -[FACircleStateResponse userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FACircleStateResponse success].cold.1(self, v5, v6);

  return -[FACircleStateResponse loadSuccess](self, "loadSuccess") & v5;
}

- (id)description
{
  const __CFString *v2;

  if (self->_loadSuccess)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("loadSuccess: %@\nerror: %@\nuserInfo: %@"), v2, self->_error, self->_userInfo);
}

- (BOOL)loadSuccess
{
  return self->_loadSuccess;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)success
{
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "loadSuccess");
  v6 = CFSTR("NO");
  v9 = "-[FACircleStateResponse success]";
  if (v5)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = 136315650;
  v10 = 2112;
  v11 = v7;
  if ((a2 & 1) != 0)
    v6 = CFSTR("YES");
  v12 = 2112;
  v13 = v6;
  _os_log_debug_impl(&dword_1CAEBA000, a3, OS_LOG_TYPE_DEBUG, "%s %@ && %@", (uint8_t *)&v8, 0x20u);
}

@end

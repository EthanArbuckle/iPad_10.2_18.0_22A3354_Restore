@implementation CPSSharingRequest

- (CPSSharingRequest)initWithData:(id)a3
{
  id v6;
  void *v7;
  CPSSharingRequest *v8;
  CPSSharingRequest *v9;
  CPSSharingRequest *result;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)CPSSharingRequest;
    v8 = -[CPSSharingRequest init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_requestData, a3);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("data != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSSharingRequest initWithData:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (CPSSharingRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (int64_t)authType
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSharingRequest)initWithCoder:(id)a3
{
  id v4;
  CPSSharingRequest *v5;
  void *v6;
  uint64_t v7;
  NSData *requestData;
  void *v9;
  uint64_t v10;
  NSArray *customSharingMethods;
  void *v12;
  uint64_t v13;
  NSString *customTitleText;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSSharingRequest;
  v5 = -[CPSSharingRequest init](&v16, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("requestData"));
    v7 = objc_claimAutoreleasedReturnValue();
    requestData = v5->_requestData;
    v5->_requestData = (NSData *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v9, CFSTR("customSharingMethods"));
    v10 = objc_claimAutoreleasedReturnValue();
    customSharingMethods = v5->_customSharingMethods;
    v5->_customSharingMethods = (NSArray *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("customTitleText"));
    v13 = objc_claimAutoreleasedReturnValue();
    customTitleText = v5->_customTitleText;
    v5->_customTitleText = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *requestData;
  id v5;

  requestData = self->_requestData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestData, CFSTR("requestData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customSharingMethods, CFSTR("customSharingMethods"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customTitleText, CFSTR("customTitleText"));

}

- (NSData)requestData
{
  return self->_requestData;
}

- (NSArray)customSharingMethods
{
  return self->_customSharingMethods;
}

- (void)setCustomSharingMethods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)customTitleText
{
  return self->_customTitleText;
}

- (void)setCustomTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTitleText, 0);
  objc_storeStrong((id *)&self->_customSharingMethods, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

- (void)initWithData:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("CPSSharingRequest.m");
  v16 = 1024;
  v17 = 19;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2383E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end

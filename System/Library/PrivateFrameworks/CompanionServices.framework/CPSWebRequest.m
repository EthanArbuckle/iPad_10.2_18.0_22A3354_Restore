@implementation CPSWebRequest

- (CPSWebRequest)initWithURL:(id)a3 callbackScheme:(id)a4 additionalHeaderFields:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CPSWebRequest *v13;
  CPSWebRequest *v14;
  uint64_t v15;
  NSString *callbackScheme;
  uint64_t v17;
  NSDictionary *additionalHeaderFields;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("URL != ((void *)0)"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSWebRequest initWithURL:callbackScheme:additionalHeaderFields:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2383EA168);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("callbackScheme != ((void *)0)"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSWebRequest initWithURL:callbackScheme:additionalHeaderFields:].cold.2();
    goto LABEL_11;
  }
  v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)CPSWebRequest;
  v13 = -[CPSWebRequest init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_URL, a3);
    v15 = objc_msgSend(v10, "copy");
    callbackScheme = v14->_callbackScheme;
    v14->_callbackScheme = (NSString *)v15;

    v17 = objc_msgSend(v12, "copy");
    additionalHeaderFields = v14->_additionalHeaderFields;
    v14->_additionalHeaderFields = (NSDictionary *)v17;

  }
  return v14;
}

- (CPSWebRequest)initWithURL:(id)a3 callback:(id)a4 additionalHeaderFields:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CPSWebRequest *v13;
  CPSWebRequest *v14;
  uint64_t v15;
  NSDictionary *additionalHeaderFields;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("URL != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSWebRequest initWithURL:callback:additionalHeaderFields:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2383EA2FCLL);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("callback != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSWebRequest initWithURL:callback:additionalHeaderFields:].cold.2();
    goto LABEL_11;
  }
  v12 = v11;
  v19.receiver = self;
  v19.super_class = (Class)CPSWebRequest;
  v13 = -[CPSWebRequest init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_URL, a3);
    objc_storeStrong((id *)&v14->_callback, a4);
    v15 = objc_msgSend(v12, "copy");
    additionalHeaderFields = v14->_additionalHeaderFields;
    v14->_additionalHeaderFields = (NSDictionary *)v15;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSURL *URL;
  uint64_t v9;
  id v10;
  id v11;
  ASWebAuthenticationSessionCallback *callback;
  id *v13;
  id v14;
  NSString *callbackScheme;
  id v16;
  NSDictionary *additionalHeaderFields;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE0BE20];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "builderWithObject:ofExpectedClass:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  URL = self->_URL;
  v9 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __25__CPSWebRequest_isEqual___block_invoke;
  v30[3] = &unk_250A11890;
  v10 = v4;
  v31 = v10;
  v11 = (id)objc_msgSend(v7, "appendObject:counterpart:", URL, v30);
  callback = self->_callback;
  if (callback)
  {
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __25__CPSWebRequest_isEqual___block_invoke_2;
    v28[3] = &unk_250A118B8;
    v13 = &v29;
    v29 = v10;
    v14 = (id)objc_msgSend(v7, "appendObject:counterpart:", callback, v28);
  }
  else
  {
    callbackScheme = self->_callbackScheme;
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __25__CPSWebRequest_isEqual___block_invoke_3;
    v26[3] = &unk_250A118E0;
    v13 = &v27;
    v27 = v10;
    v16 = (id)objc_msgSend(v7, "appendString:counterpart:", callbackScheme, v26);
  }

  additionalHeaderFields = self->_additionalHeaderFields;
  v21 = v9;
  v22 = 3221225472;
  v23 = __25__CPSWebRequest_isEqual___block_invoke_4;
  v24 = &unk_250A11908;
  v25 = v10;
  v18 = v10;
  v19 = (id)objc_msgSend(v7, "appendObject:counterpart:", additionalHeaderFields, &v21);
  LOBYTE(additionalHeaderFields) = objc_msgSend(v7, "isEqual", v21, v22, v23, v24);

  return (char)additionalHeaderFields;
}

id __25__CPSWebRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __25__CPSWebRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __25__CPSWebRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __25__CPSWebRequest_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_URL);
  if (self->_callback)
    v5 = (id)objc_msgSend(v3, "appendObject:");
  else
    v6 = (id)objc_msgSend(v3, "appendString:", self->_callbackScheme);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_additionalHeaderFields);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  ASWebAuthenticationSessionCallback *callback;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSObjectMasked();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("URL"));

  callback = self->_callback;
  if (callback)
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", callback, CFSTR("callback"));
  else
    objc_msgSend(v3, "appendString:withName:", self->_callbackScheme, CFSTR("callbackScheme"));
  CUPrintNSObjectMasked();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("additionalHeaderFields"), 1);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSWebRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CPSWebRequest *v16;
  uint64_t v17;
  void *v18;
  CPSWebRequest *v19;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0B88];
    v23 = *MEMORY[0x24BDD0FD8];
    v24[0] = CFSTR("Failed to decode CPSWebRequest: missing URL value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 4865, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v9);
    goto LABEL_5;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callback"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("callbackScheme"));
  v9 = objc_claimAutoreleasedReturnValue();

  if (!(v7 | v9))
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0B88];
    v21 = *MEMORY[0x24BDD0FD8];
    v22 = CFSTR("Failed to decode CPSWebRequest: missing callback value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 4865, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v13);

LABEL_5:
    v16 = 0;
    goto LABEL_10;
  }
  v17 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v17, objc_opt_class(), CFSTR("additionalHeaderFields"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v19 = -[CPSWebRequest initWithURL:callback:additionalHeaderFields:](self, "initWithURL:callback:additionalHeaderFields:", v6, v7, v18);
  else
    v19 = -[CPSWebRequest initWithURL:callbackScheme:additionalHeaderFields:](self, "initWithURL:callbackScheme:additionalHeaderFields:", v6, v9, v18);
  self = v19;

  v16 = self;
LABEL_10:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *URL;
  void *callback;
  const __CFString *v6;
  id v7;

  URL = self->_URL;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", URL, CFSTR("URL"));
  callback = self->_callback;
  if (callback)
  {
    v6 = CFSTR("callback");
  }
  else
  {
    callback = self->_callbackScheme;
    v6 = CFSTR("callbackScheme");
  }
  objc_msgSend(v7, "encodeObject:forKey:", callback, v6);
  objc_msgSend(v7, "encodeObject:forKey:", self->_additionalHeaderFields, CFSTR("additionalHeaderFields"));

}

- (NSString)callbackScheme
{
  return self->_callbackScheme;
}

- (ASWebAuthenticationSessionCallback)callback
{
  return self->_callback;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDictionary)additionalHeaderFields
{
  return self->_additionalHeaderFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
}

- (void)initWithURL:callbackScheme:additionalHeaderFields:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:callbackScheme:additionalHeaderFields:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:callback:additionalHeaderFields:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithURL:callback:additionalHeaderFields:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

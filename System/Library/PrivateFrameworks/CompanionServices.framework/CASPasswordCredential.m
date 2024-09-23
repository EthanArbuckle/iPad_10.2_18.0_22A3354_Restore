@implementation CASPasswordCredential

- (CASPasswordCredential)initWithUser:(id)a3 password:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CASPasswordCredential *v10;
  uint64_t v11;
  NSString *user;
  uint64_t v13;
  NSString *password;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("user != ((void *)0)"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CASPasswordCredential initWithUser:password:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2383EC224);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("password != ((void *)0)"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CASPasswordCredential initWithUser:password:].cold.2(a2);
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)CASPasswordCredential;
  v10 = -[CASPasswordCredential init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    user = v10->_user;
    v10->_user = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    password = v10->_password;
    v10->_password = (NSString *)v13;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *user;
  uint64_t v9;
  id v10;
  id v11;
  NSString *password;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE0BE20];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "builderWithObject:ofExpectedClass:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  user = self->_user;
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __33__CASPasswordCredential_isEqual___block_invoke;
  v21[3] = &unk_250A118E0;
  v10 = v4;
  v22 = v10;
  v11 = (id)objc_msgSend(v7, "appendString:counterpart:", user, v21);
  password = self->_password;
  v16 = v9;
  v17 = 3221225472;
  v18 = __33__CASPasswordCredential_isEqual___block_invoke_2;
  v19 = &unk_250A118E0;
  v20 = v10;
  v13 = v10;
  v14 = (id)objc_msgSend(v7, "appendString:counterpart:", password, &v16);
  LOBYTE(password) = objc_msgSend(v7, "isEqual", v16, v17, v18, v19);

  return (char)password;
}

id __33__CASPasswordCredential_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __33__CASPasswordCredential_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_user);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_password);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CASPasswordCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CASPasswordCredential *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("user"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0B88];
    v20 = *MEMORY[0x24BDD0FD8];
    v21[0] = CFSTR("Failed to decode CASPasswordCredential: missing user value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 4865, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v12);

LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("password"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0B88];
    v18 = *MEMORY[0x24BDD0FD8];
    v19 = CFSTR("Failed to decode CASPasswordCredential: missing password value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 4865, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v16);

    goto LABEL_6;
  }
  self = -[CASPasswordCredential initWithUser:password:](self, "initWithUser:password:", v6, v8);
  v9 = self;
LABEL_7:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *user;
  id v5;

  user = self->_user;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", user, CFSTR("user"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_password, CFSTR("password"));

}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

- (void)initWithUser:(const char *)a1 password:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUser:(const char *)a1 password:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

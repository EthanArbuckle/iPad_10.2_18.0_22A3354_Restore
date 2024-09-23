@implementation EDAMRegistrationRequestResult

+ (id)structName
{
  return CFSTR("RegistrationRequestResult");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_62;
  if (!structFields_structFields_62)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("refreshToken"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("userEmail"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("result"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)structFields_structFields_62;
    structFields_structFields_62 = v7;

    v2 = (void *)structFields_structFields_62;
  }
  return v2;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
  objc_storeStrong((id *)&self->_refreshToken, a3);
}

- (NSString)userEmail
{
  return self->_userEmail;
}

- (void)setUserEmail:(id)a3
{
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (NSNumber)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
}

@end

@implementation EDAMBusinessInvitation

+ (id)structName
{
  return CFSTR("BusinessInvitation");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2288;
  if (!structFields_structFields_2288)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("businessId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("email"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("role"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 1, CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("requesterId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("fromWorkChat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("created"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[6] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)structFields_structFields_2288;
    structFields_structFields_2288 = v10;

    v2 = (void *)structFields_structFields_2288;
  }
  return v2;
}

- (NSNumber)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
  objc_storeStrong((id *)&self->_businessId, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSNumber)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSNumber)requesterId
{
  return self->_requesterId;
}

- (void)setRequesterId:(id)a3
{
  objc_storeStrong((id *)&self->_requesterId, a3);
}

- (NSNumber)fromWorkChat
{
  return self->_fromWorkChat;
}

- (void)setFromWorkChat:(id)a3
{
  objc_storeStrong((id *)&self->_fromWorkChat, a3);
}

- (NSNumber)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_created, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_fromWorkChat, 0);
  objc_storeStrong((id *)&self->_requesterId, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
}

@end

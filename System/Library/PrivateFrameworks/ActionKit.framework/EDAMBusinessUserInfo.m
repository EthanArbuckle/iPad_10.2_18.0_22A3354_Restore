@implementation EDAMBusinessUserInfo

+ (id)structName
{
  return CFSTR("BusinessUserInfo");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_538;
  if (!structFields_structFields_538)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("businessId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("businessName"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("role"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("email"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("updated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_538;
    structFields_structFields_538 = v8;

    v2 = (void *)structFields_structFields_538;
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

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessName:(id)a3
{
  objc_storeStrong((id *)&self->_businessName, a3);
}

- (NSNumber)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_businessName, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
}

@end

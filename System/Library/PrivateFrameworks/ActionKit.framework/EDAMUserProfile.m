@implementation EDAMUserProfile

+ (id)structName
{
  return CFSTR("UserProfile");
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
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2150;
  if (!structFields_structFields_2150)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("id"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("name"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("email"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("username"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 5, 12, 1, CFSTR("attributes"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 10, 1, CFSTR("joined"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("photoLastUpdated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[6] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 11, 1, CFSTR("photoUrl"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[7] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 8, 1, CFSTR("role"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[8] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_2150;
    structFields_structFields_2150 = v12;

    v2 = (void *)structFields_structFields_2150;
  }
  return v2;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (EDAMBusinessUserAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSNumber)joined
{
  return self->_joined;
}

- (void)setJoined:(id)a3
{
  objc_storeStrong((id *)&self->_joined, a3);
}

- (NSNumber)photoLastUpdated
{
  return self->_photoLastUpdated;
}

- (void)setPhotoLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_photoLastUpdated, a3);
}

- (NSString)photoUrl
{
  return self->_photoUrl;
}

- (void)setPhotoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_photoUrl, a3);
}

- (NSNumber)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_photoUrl, 0);
  objc_storeStrong((id *)&self->_photoLastUpdated, 0);
  objc_storeStrong((id *)&self->_joined, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end

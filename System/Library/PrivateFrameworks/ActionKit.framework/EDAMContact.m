@implementation EDAMContact

+ (id)structName
{
  return CFSTR("Contact");
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
  v2 = (void *)structFields_structFields_975;
  if (!structFields_structFields_975)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("name"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("id"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("photoUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("photoLastUpdated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 16, 1, CFSTR("messagingPermit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("messagingPermitExpires"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[6] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)structFields_structFields_975;
    structFields_structFields_975 = v10;

    v2 = (void *)structFields_structFields_975;
  }
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)photoUrl
{
  return self->_photoUrl;
}

- (void)setPhotoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_photoUrl, a3);
}

- (NSNumber)photoLastUpdated
{
  return self->_photoLastUpdated;
}

- (void)setPhotoLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_photoLastUpdated, a3);
}

- (NSData)messagingPermit
{
  return self->_messagingPermit;
}

- (void)setMessagingPermit:(id)a3
{
  objc_storeStrong((id *)&self->_messagingPermit, a3);
}

- (NSNumber)messagingPermitExpires
{
  return self->_messagingPermitExpires;
}

- (void)setMessagingPermitExpires:(id)a3
{
  objc_storeStrong((id *)&self->_messagingPermitExpires, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingPermitExpires, 0);
  objc_storeStrong((id *)&self->_messagingPermit, 0);
  objc_storeStrong((id *)&self->_photoLastUpdated, 0);
  objc_storeStrong((id *)&self->_photoUrl, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

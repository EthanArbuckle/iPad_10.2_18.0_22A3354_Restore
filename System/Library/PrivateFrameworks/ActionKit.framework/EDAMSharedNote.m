@implementation EDAMSharedNote

+ (id)structName
{
  return CFSTR("SharedNote");
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
  uint64_t v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1413;
  if (!structFields_structFields_1413)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("sharerUserID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 1, CFSTR("recipientIdentity"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("privilege"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("serviceCreated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("serviceUpdated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 10, 1, CFSTR("serviceAssigned"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)structFields_structFields_1413;
    structFields_structFields_1413 = v9;

    v2 = (void *)structFields_structFields_1413;
  }
  return v2;
}

- (NSNumber)sharerUserID
{
  return self->_sharerUserID;
}

- (void)setSharerUserID:(id)a3
{
  objc_storeStrong((id *)&self->_sharerUserID, a3);
}

- (EDAMIdentity)recipientIdentity
{
  return self->_recipientIdentity;
}

- (void)setRecipientIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_recipientIdentity, a3);
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_privilege, a3);
}

- (NSNumber)serviceCreated
{
  return self->_serviceCreated;
}

- (void)setServiceCreated:(id)a3
{
  objc_storeStrong((id *)&self->_serviceCreated, a3);
}

- (NSNumber)serviceUpdated
{
  return self->_serviceUpdated;
}

- (void)setServiceUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_serviceUpdated, a3);
}

- (NSNumber)serviceAssigned
{
  return self->_serviceAssigned;
}

- (void)setServiceAssigned:(id)a3
{
  objc_storeStrong((id *)&self->_serviceAssigned, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceAssigned, 0);
  objc_storeStrong((id *)&self->_serviceUpdated, 0);
  objc_storeStrong((id *)&self->_serviceCreated, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_recipientIdentity, 0);
  objc_storeStrong((id *)&self->_sharerUserID, 0);
}

@end

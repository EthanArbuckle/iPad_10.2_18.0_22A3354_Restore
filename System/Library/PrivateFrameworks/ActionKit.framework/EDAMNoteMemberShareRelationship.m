@implementation EDAMNoteMemberShareRelationship

+ (id)structName
{
  return CFSTR("NoteMemberShareRelationship");
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
  v2 = (void *)structFields_structFields_1521;
  if (!structFields_structFields_1521)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("displayName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("recipientUserId"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("privilege"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 4, 12, 1, CFSTR("restrictions"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("sharerUserId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_1521;
    structFields_structFields_1521 = v8;

    v2 = (void *)structFields_structFields_1521;
  }
  return v2;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSNumber)recipientUserId
{
  return self->_recipientUserId;
}

- (void)setRecipientUserId:(id)a3
{
  objc_storeStrong((id *)&self->_recipientUserId, a3);
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_privilege, a3);
}

- (EDAMNoteShareRelationshipRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_restrictions, a3);
}

- (NSNumber)sharerUserId
{
  return self->_sharerUserId;
}

- (void)setSharerUserId:(id)a3
{
  objc_storeStrong((id *)&self->_sharerUserId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharerUserId, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_recipientUserId, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end

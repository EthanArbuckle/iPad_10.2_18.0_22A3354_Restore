@implementation EDAMMemberShareRelationship

+ (id)structName
{
  return CFSTR("MemberShareRelationship");
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
  v2 = (void *)structFields_structFields_1326;
  if (!structFields_structFields_1326)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("displayName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("recipientUserId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("bestPrivilege"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 1, CFSTR("individualPrivilege"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 5, 12, 1, CFSTR("restrictions"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 8, 1, CFSTR("sharerUserId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)structFields_structFields_1326;
    structFields_structFields_1326 = v9;

    v2 = (void *)structFields_structFields_1326;
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

- (NSNumber)bestPrivilege
{
  return self->_bestPrivilege;
}

- (void)setBestPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_bestPrivilege, a3);
}

- (NSNumber)individualPrivilege
{
  return self->_individualPrivilege;
}

- (void)setIndividualPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_individualPrivilege, a3);
}

- (EDAMShareRelationshipRestrictions)restrictions
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
  objc_storeStrong((id *)&self->_individualPrivilege, 0);
  objc_storeStrong((id *)&self->_bestPrivilege, 0);
  objc_storeStrong((id *)&self->_recipientUserId, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end

@implementation EDAMShareRelationships

+ (id)structName
{
  return CFSTR("ShareRelationships");
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
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1361;
  if (!structFields_structFields_1361)
  {
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 1, 15, 1, CFSTR("invitations"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class(), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 1, CFSTR("memberships"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 1, CFSTR("invitationRestrictions"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_1361;
    structFields_structFields_1361 = v8;

    v2 = (void *)structFields_structFields_1361;
  }
  return v2;
}

- (NSArray)invitations
{
  return self->_invitations;
}

- (void)setInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_invitations, a3);
}

- (NSArray)memberships
{
  return self->_memberships;
}

- (void)setMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_memberships, a3);
}

- (EDAMShareRelationshipRestrictions)invitationRestrictions
{
  return self->_invitationRestrictions;
}

- (void)setInvitationRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_invitationRestrictions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationRestrictions, 0);
  objc_storeStrong((id *)&self->_memberships, 0);
  objc_storeStrong((id *)&self->_invitations, 0);
}

@end

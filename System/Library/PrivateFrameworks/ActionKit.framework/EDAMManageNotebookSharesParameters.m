@implementation EDAMManageNotebookSharesParameters

+ (id)structName
{
  return CFSTR("ManageNotebookSharesParameters");
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
  uint64_t v11;
  void *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1389;
  if (!structFields_structFields_1389)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("notebookGuid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("inviteMessage"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 1, CFSTR("membershipsToUpdate"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("invitationsToCreateOrUpdate"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 5, 15, 1, CFSTR("unshares"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)structFields_structFields_1389;
    structFields_structFields_1389 = v11;

    v2 = (void *)structFields_structFields_1389;
  }
  return v2;
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setNotebookGuid:(id)a3
{
  objc_storeStrong((id *)&self->_notebookGuid, a3);
}

- (NSString)inviteMessage
{
  return self->_inviteMessage;
}

- (void)setInviteMessage:(id)a3
{
  objc_storeStrong((id *)&self->_inviteMessage, a3);
}

- (NSArray)membershipsToUpdate
{
  return self->_membershipsToUpdate;
}

- (void)setMembershipsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_membershipsToUpdate, a3);
}

- (NSArray)invitationsToCreateOrUpdate
{
  return self->_invitationsToCreateOrUpdate;
}

- (void)setInvitationsToCreateOrUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_invitationsToCreateOrUpdate, a3);
}

- (NSArray)unshares
{
  return self->_unshares;
}

- (void)setUnshares:(id)a3
{
  objc_storeStrong((id *)&self->_unshares, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unshares, 0);
  objc_storeStrong((id *)&self->_invitationsToCreateOrUpdate, 0);
  objc_storeStrong((id *)&self->_membershipsToUpdate, 0);
  objc_storeStrong((id *)&self->_inviteMessage, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
}

@end

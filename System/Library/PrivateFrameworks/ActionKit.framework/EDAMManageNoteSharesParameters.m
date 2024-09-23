@implementation EDAMManageNoteSharesParameters

+ (id)structName
{
  return CFSTR("ManageNoteSharesParameters");
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
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1549;
  if (!structFields_structFields_1549)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("noteGuid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class(), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 1, CFSTR("membershipsToUpdate"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v5;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 1, CFSTR("invitationsToUpdate"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("membershipsToUnshare"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 10, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 5, 15, 1, CFSTR("invitationsToUnshare"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_1549;
    structFields_structFields_1549 = v12;

    v2 = (void *)structFields_structFields_1549;
  }
  return v2;
}

- (NSString)noteGuid
{
  return self->_noteGuid;
}

- (void)setNoteGuid:(id)a3
{
  objc_storeStrong((id *)&self->_noteGuid, a3);
}

- (NSArray)membershipsToUpdate
{
  return self->_membershipsToUpdate;
}

- (void)setMembershipsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_membershipsToUpdate, a3);
}

- (NSArray)invitationsToUpdate
{
  return self->_invitationsToUpdate;
}

- (void)setInvitationsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_invitationsToUpdate, a3);
}

- (NSArray)membershipsToUnshare
{
  return self->_membershipsToUnshare;
}

- (void)setMembershipsToUnshare:(id)a3
{
  objc_storeStrong((id *)&self->_membershipsToUnshare, a3);
}

- (NSArray)invitationsToUnshare
{
  return self->_invitationsToUnshare;
}

- (void)setInvitationsToUnshare:(id)a3
{
  objc_storeStrong((id *)&self->_invitationsToUnshare, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationsToUnshare, 0);
  objc_storeStrong((id *)&self->_membershipsToUnshare, 0);
  objc_storeStrong((id *)&self->_invitationsToUpdate, 0);
  objc_storeStrong((id *)&self->_membershipsToUpdate, 0);
  objc_storeStrong((id *)&self->_noteGuid, 0);
}

@end

@implementation EDAMSharedNotebook

+ (id)structName
{
  return CFSTR("SharedNotebook");
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[18];

  v22[16] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1808;
  if (!structFields_structFields_1808)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 1, CFSTR("id"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("userId"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("notebookGuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("email"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 18, 10, 1, CFSTR("recipientIdentityId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("notebookModifiable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[5] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("serviceCreated"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22[6] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 10, 1, CFSTR("serviceUpdated"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[7] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 11, 1, CFSTR("globalId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[8] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 11, 1, CFSTR("username"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[9] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 8, 1, CFSTR("privilege"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[10] = v7;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 13, 12, 1, CFSTR("recipientSettings"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[11] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 8, 1, CFSTR("sharerUserId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[12] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 15, 11, 1, CFSTR("recipientUsername"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[13] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 17, 8, 1, CFSTR("recipientUserId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[14] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 16, 10, 1, CFSTR("serviceAssigned"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[15] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 16);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_1808;
    structFields_structFields_1808 = v13;

    v2 = (void *)structFields_structFields_1808;
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

- (NSNumber)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setNotebookGuid:(id)a3
{
  objc_storeStrong((id *)&self->_notebookGuid, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSNumber)recipientIdentityId
{
  return self->_recipientIdentityId;
}

- (void)setRecipientIdentityId:(id)a3
{
  objc_storeStrong((id *)&self->_recipientIdentityId, a3);
}

- (NSNumber)notebookModifiable
{
  return self->_notebookModifiable;
}

- (void)setNotebookModifiable:(id)a3
{
  objc_storeStrong((id *)&self->_notebookModifiable, a3);
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

- (NSString)globalId
{
  return self->_globalId;
}

- (void)setGlobalId:(id)a3
{
  objc_storeStrong((id *)&self->_globalId, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_privilege, a3);
}

- (EDAMSharedNotebookRecipientSettings)recipientSettings
{
  return self->_recipientSettings;
}

- (void)setRecipientSettings:(id)a3
{
  objc_storeStrong((id *)&self->_recipientSettings, a3);
}

- (NSNumber)sharerUserId
{
  return self->_sharerUserId;
}

- (void)setSharerUserId:(id)a3
{
  objc_storeStrong((id *)&self->_sharerUserId, a3);
}

- (NSString)recipientUsername
{
  return self->_recipientUsername;
}

- (void)setRecipientUsername:(id)a3
{
  objc_storeStrong((id *)&self->_recipientUsername, a3);
}

- (NSNumber)recipientUserId
{
  return self->_recipientUserId;
}

- (void)setRecipientUserId:(id)a3
{
  objc_storeStrong((id *)&self->_recipientUserId, a3);
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
  objc_storeStrong((id *)&self->_recipientUserId, 0);
  objc_storeStrong((id *)&self->_recipientUsername, 0);
  objc_storeStrong((id *)&self->_sharerUserId, 0);
  objc_storeStrong((id *)&self->_recipientSettings, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_globalId, 0);
  objc_storeStrong((id *)&self->_serviceUpdated, 0);
  objc_storeStrong((id *)&self->_serviceCreated, 0);
  objc_storeStrong((id *)&self->_notebookModifiable, 0);
  objc_storeStrong((id *)&self->_recipientIdentityId, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end

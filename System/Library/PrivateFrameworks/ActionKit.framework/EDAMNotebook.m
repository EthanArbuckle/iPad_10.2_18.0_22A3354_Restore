@implementation EDAMNotebook

+ (id)structName
{
  return CFSTR("Notebook");
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
  void *v22;
  _QWORD v23[17];

  v23[15] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2023;
  if (!structFields_structFields_2023)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("guid"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("name"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("updateSequenceNum"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("defaultNotebook"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("serviceCreated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 10, 1, CFSTR("serviceUpdated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[5] = v17;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 10, 12, 1, CFSTR("publishing"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[6] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 2, 1, CFSTR("published"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v23[7] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 11, 1, CFSTR("stack"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23[8] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 10, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 13, 15, 1, CFSTR("sharedNotebookIds"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[9] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 14, 15, 1, CFSTR("sharedNotebooks"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[10] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 15, 12, 1, CFSTR("businessNotebook"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[11] = v9;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 16, 12, 1, CFSTR("contact"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[12] = v10;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 17, 12, 1, CFSTR("restrictions"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[13] = v11;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 18, 12, 1, CFSTR("recipientSettings"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[14] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 15);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_2023;
    structFields_structFields_2023 = v13;

    v2 = (void *)structFields_structFields_2023;
  }
  return v2;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (NSNumber)defaultNotebook
{
  return self->_defaultNotebook;
}

- (void)setDefaultNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_defaultNotebook, a3);
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

- (EDAMPublishing)publishing
{
  return self->_publishing;
}

- (void)setPublishing:(id)a3
{
  objc_storeStrong((id *)&self->_publishing, a3);
}

- (NSNumber)published
{
  return self->_published;
}

- (void)setPublished:(id)a3
{
  objc_storeStrong((id *)&self->_published, a3);
}

- (NSString)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (NSArray)sharedNotebookIds
{
  return self->_sharedNotebookIds;
}

- (void)setSharedNotebookIds:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNotebookIds, a3);
}

- (NSArray)sharedNotebooks
{
  return self->_sharedNotebooks;
}

- (void)setSharedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNotebooks, a3);
}

- (EDAMBusinessNotebook)businessNotebook
{
  return self->_businessNotebook;
}

- (void)setBusinessNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_businessNotebook, a3);
}

- (EDAMUser)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (EDAMNotebookRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_restrictions, a3);
}

- (EDAMNotebookRecipientSettings)recipientSettings
{
  return self->_recipientSettings;
}

- (void)setRecipientSettings:(id)a3
{
  objc_storeStrong((id *)&self->_recipientSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientSettings, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_businessNotebook, 0);
  objc_storeStrong((id *)&self->_sharedNotebooks, 0);
  objc_storeStrong((id *)&self->_sharedNotebookIds, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_published, 0);
  objc_storeStrong((id *)&self->_publishing, 0);
  objc_storeStrong((id *)&self->_serviceUpdated, 0);
  objc_storeStrong((id *)&self->_serviceCreated, 0);
  objc_storeStrong((id *)&self->_defaultNotebook, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end

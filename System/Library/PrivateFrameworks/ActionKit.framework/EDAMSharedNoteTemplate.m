@implementation EDAMSharedNoteTemplate

+ (id)structName
{
  return CFSTR("SharedNoteTemplate");
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
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1465;
  if (!structFields_structFields_1465)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("noteGuid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("recipientThreadId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 1, CFSTR("recipientContacts"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("privilege"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_1465;
    structFields_structFields_1465 = v8;

    v2 = (void *)structFields_structFields_1465;
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

- (NSNumber)recipientThreadId
{
  return self->_recipientThreadId;
}

- (void)setRecipientThreadId:(id)a3
{
  objc_storeStrong((id *)&self->_recipientThreadId, a3);
}

- (NSArray)recipientContacts
{
  return self->_recipientContacts;
}

- (void)setRecipientContacts:(id)a3
{
  objc_storeStrong((id *)&self->_recipientContacts, a3);
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_privilege, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_recipientContacts, 0);
  objc_storeStrong((id *)&self->_recipientThreadId, 0);
  objc_storeStrong((id *)&self->_noteGuid, 0);
}

@end

@implementation EDAMNoteEmailParameters

+ (id)structName
{
  return CFSTR("NoteEmailParameters");
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
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_808;
  if (!structFields_structFields_808)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("guid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 1, CFSTR("note"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 1, CFSTR("toAddresses"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("ccAddresses"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("subject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[5] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)structFields_structFields_808;
    structFields_structFields_808 = v11;

    v2 = (void *)structFields_structFields_808;
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

- (EDAMNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (NSArray)toAddresses
{
  return self->_toAddresses;
}

- (void)setToAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_toAddresses, a3);
}

- (NSArray)ccAddresses
{
  return self->_ccAddresses;
}

- (void)setCcAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_ccAddresses, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_ccAddresses, 0);
  objc_storeStrong((id *)&self->_toAddresses, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end

@implementation EDAMNoteRestrictions

+ (id)structName
{
  return CFSTR("NoteRestrictions");
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
  v2 = (void *)structFields_structFields_1453;
  if (!structFields_structFields_1453)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("noUpdateTitle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("noUpdateContent"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("noEmail"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("noShare"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("noSharePublicly"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_1453;
    structFields_structFields_1453 = v8;

    v2 = (void *)structFields_structFields_1453;
  }
  return v2;
}

- (NSNumber)noUpdateTitle
{
  return self->_noUpdateTitle;
}

- (void)setNoUpdateTitle:(id)a3
{
  objc_storeStrong((id *)&self->_noUpdateTitle, a3);
}

- (NSNumber)noUpdateContent
{
  return self->_noUpdateContent;
}

- (void)setNoUpdateContent:(id)a3
{
  objc_storeStrong((id *)&self->_noUpdateContent, a3);
}

- (NSNumber)noEmail
{
  return self->_noEmail;
}

- (void)setNoEmail:(id)a3
{
  objc_storeStrong((id *)&self->_noEmail, a3);
}

- (NSNumber)noShare
{
  return self->_noShare;
}

- (void)setNoShare:(id)a3
{
  objc_storeStrong((id *)&self->_noShare, a3);
}

- (NSNumber)noSharePublicly
{
  return self->_noSharePublicly;
}

- (void)setNoSharePublicly:(id)a3
{
  objc_storeStrong((id *)&self->_noSharePublicly, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSharePublicly, 0);
  objc_storeStrong((id *)&self->_noShare, 0);
  objc_storeStrong((id *)&self->_noEmail, 0);
  objc_storeStrong((id *)&self->_noUpdateContent, 0);
  objc_storeStrong((id *)&self->_noUpdateTitle, 0);
}

@end

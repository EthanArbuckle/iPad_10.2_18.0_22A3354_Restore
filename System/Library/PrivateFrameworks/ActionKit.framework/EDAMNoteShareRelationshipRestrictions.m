@implementation EDAMNoteShareRelationshipRestrictions

+ (id)structName
{
  return CFSTR("NoteShareRelationshipRestrictions");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1502;
  if (!structFields_structFields_1502)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("noSetReadNote"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("noSetModifyNote"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("noSetFullAccess"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_1502;
    structFields_structFields_1502 = v6;

    v2 = (void *)structFields_structFields_1502;
  }
  return v2;
}

- (NSNumber)noSetReadNote
{
  return self->_noSetReadNote;
}

- (void)setNoSetReadNote:(id)a3
{
  objc_storeStrong((id *)&self->_noSetReadNote, a3);
}

- (NSNumber)noSetModifyNote
{
  return self->_noSetModifyNote;
}

- (void)setNoSetModifyNote:(id)a3
{
  objc_storeStrong((id *)&self->_noSetModifyNote, a3);
}

- (NSNumber)noSetFullAccess
{
  return self->_noSetFullAccess;
}

- (void)setNoSetFullAccess:(id)a3
{
  objc_storeStrong((id *)&self->_noSetFullAccess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSetFullAccess, 0);
  objc_storeStrong((id *)&self->_noSetModifyNote, 0);
  objc_storeStrong((id *)&self->_noSetReadNote, 0);
}

@end

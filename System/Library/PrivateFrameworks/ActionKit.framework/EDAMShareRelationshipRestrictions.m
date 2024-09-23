@implementation EDAMShareRelationshipRestrictions

+ (id)structName
{
  return CFSTR("ShareRelationshipRestrictions");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1265;
  if (!structFields_structFields_1265)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("noSetReadOnly"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("noSetReadPlusActivity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("noSetModify"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("noSetFullAccess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)structFields_structFields_1265;
    structFields_structFields_1265 = v7;

    v2 = (void *)structFields_structFields_1265;
  }
  return v2;
}

- (NSNumber)noSetReadOnly
{
  return self->_noSetReadOnly;
}

- (void)setNoSetReadOnly:(id)a3
{
  objc_storeStrong((id *)&self->_noSetReadOnly, a3);
}

- (NSNumber)noSetReadPlusActivity
{
  return self->_noSetReadPlusActivity;
}

- (void)setNoSetReadPlusActivity:(id)a3
{
  objc_storeStrong((id *)&self->_noSetReadPlusActivity, a3);
}

- (NSNumber)noSetModify
{
  return self->_noSetModify;
}

- (void)setNoSetModify:(id)a3
{
  objc_storeStrong((id *)&self->_noSetModify, a3);
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
  objc_storeStrong((id *)&self->_noSetModify, 0);
  objc_storeStrong((id *)&self->_noSetReadPlusActivity, 0);
  objc_storeStrong((id *)&self->_noSetReadOnly, 0);
}

@end

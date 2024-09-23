@implementation EDAMManageNoteSharesError

+ (id)structName
{
  return CFSTR("ManageNoteSharesError");
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
  v2 = (void *)structFields_structFields_1575;
  if (!structFields_structFields_1575)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 1, CFSTR("identityID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("userID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 1, CFSTR("userException"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 4, 12, 1, CFSTR("notFoundException"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)structFields_structFields_1575;
    structFields_structFields_1575 = v7;

    v2 = (void *)structFields_structFields_1575;
  }
  return v2;
}

- (NSNumber)identityID
{
  return self->_identityID;
}

- (void)setIdentityID:(id)a3
{
  objc_storeStrong((id *)&self->_identityID, a3);
}

- (NSNumber)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (EDAMUserException)userException
{
  return self->_userException;
}

- (void)setUserException:(id)a3
{
  objc_storeStrong((id *)&self->_userException, a3);
}

- (EDAMNotFoundException)notFoundException
{
  return self->_notFoundException;
}

- (void)setNotFoundException:(id)a3
{
  objc_storeStrong((id *)&self->_notFoundException, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notFoundException, 0);
  objc_storeStrong((id *)&self->_userException, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_identityID, 0);
}

@end

@implementation EDAMManageNotebookSharesError

+ (id)structName
{
  return CFSTR("ManageNotebookSharesError");
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
  v2 = (void *)structFields_structFields_1422;
  if (!structFields_structFields_1422)
  {
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 1, CFSTR("userIdentity"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 1, CFSTR("userException"), objc_opt_class(), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 1, CFSTR("notFoundException"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_1422;
    structFields_structFields_1422 = v6;

    v2 = (void *)structFields_structFields_1422;
  }
  return v2;
}

- (EDAMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setUserIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentity, a3);
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
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end

@implementation EDAMBusinessNotebook

+ (id)structName
{
  return CFSTR("BusinessNotebook");
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
  v2 = (void *)structFields_structFields_1622;
  if (!structFields_structFields_1622)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("notebookDescription"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("privilege"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("recommended"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_1622;
    structFields_structFields_1622 = v6;

    v2 = (void *)structFields_structFields_1622;
  }
  return v2;
}

- (NSString)notebookDescription
{
  return self->_notebookDescription;
}

- (void)setNotebookDescription:(id)a3
{
  objc_storeStrong((id *)&self->_notebookDescription, a3);
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(id)a3
{
  objc_storeStrong((id *)&self->_privilege, a3);
}

- (NSNumber)recommended
{
  return self->_recommended;
}

- (void)setRecommended:(id)a3
{
  objc_storeStrong((id *)&self->_recommended, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommended, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_notebookDescription, 0);
}

@end

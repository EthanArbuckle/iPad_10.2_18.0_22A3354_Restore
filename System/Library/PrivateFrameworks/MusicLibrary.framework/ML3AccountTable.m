@implementation ML3AccountTable

- (id)name
{
  return CFSTR("account");
}

- (id)columns
{
  NSArray *columns;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("dsid"), 2, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("apple_id"), 4, 16, &stru_1E5B66908, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("alt_dsid"), 4, 16, &stru_1E5B66908);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_columns;
    self->_columns = v7;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end

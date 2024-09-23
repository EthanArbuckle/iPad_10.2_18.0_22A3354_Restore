@implementation ML3ChapterTable

- (id)name
{
  return CFSTR("chapter");
}

- (id)columns
{
  NSArray *columns;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_pid"), 2, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("chapter_data"), 5, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_columns;
    self->_columns = v6;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end

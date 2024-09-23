@implementation ML3ContainerItemTable

- (id)name
{
  return CFSTR("container_item");
}

- (id)columns
{
  NSArray *columns;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("container_item_pid"), 2, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("container_pid"), 2, 16, &unk_1E5BAC4E0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_pid"), 2, 16, &unk_1E5BAC4E0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("position"), 2, 16, &unk_1E5BAC4E0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("uuid"), 4, 16, &stru_1E5B66908);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("position_uuid"), 4, 16, &stru_1E5B66908);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[5] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("occurrence_id"), 4, 16, &stru_1E5B66908);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[6] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 7);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_columns;
    self->_columns = v11;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end

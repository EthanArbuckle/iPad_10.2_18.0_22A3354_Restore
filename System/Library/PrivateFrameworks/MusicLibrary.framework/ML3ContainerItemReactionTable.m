@implementation ML3ContainerItemReactionTable

- (id)name
{
  return CFSTR("container_item_reaction");
}

- (id)columns
{
  NSArray *columns;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("container_item_reaction_pid"), 2, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("container_item_pid"), 2, 16, &unk_1E5BAC3A8, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("person_pid"), 2, 16, &unk_1E5BAC3A8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("reaction"), 4, 16, &stru_1E5B66908);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("date"), 2, 16, &unk_1E5BAC3A8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_columns;
    self->_columns = v9;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end

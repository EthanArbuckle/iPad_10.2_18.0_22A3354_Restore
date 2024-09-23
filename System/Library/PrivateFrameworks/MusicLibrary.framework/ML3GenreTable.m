@implementation ML3GenreTable

- (id)name
{
  return CFSTR("genre");
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
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("genre_id"), 2, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("genre"), 4, 16, &stru_1E5B66908);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("grouping_key"), 5, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v14;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("cloud_status"), 2, 16, &unk_1E5BAAE90);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("representative_item_pid"), 2, 16, &unk_1E5BAAE90);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local"), 2, 16, &unk_1E5BAAE90);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status"), 2, 16, &unk_1E5BAAE90);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status_reason"), 2, 16, &unk_1E5BAAE90);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_constraints"), 2, 16, &unk_1E5BAAE90);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sync_id"), 2, 16, &unk_1E5BAAE90);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 10);
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

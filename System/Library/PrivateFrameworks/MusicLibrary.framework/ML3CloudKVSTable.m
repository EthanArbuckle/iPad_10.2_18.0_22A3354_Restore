@implementation ML3CloudKVSTable

- (id)name
{
  return CFSTR("cloud_kvs");
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
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("key"), 4, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("play_count_user"), 2, 16, &unk_1E5BAC3C0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("has_been_played"), 2, 16, &unk_1E5BAC3C0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("bookmark_time_ms"), 3, 16, &unk_1E5BAC3C0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("bookmark_sync_timestamp"), 2, 16, &unk_1E5BAC3C0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("bookmark_sync_revision"), 2, 16, &unk_1E5BAC3C0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[5] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_columns;
    self->_columns = v10;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
